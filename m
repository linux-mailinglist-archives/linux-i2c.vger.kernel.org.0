Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F8F2C8B02
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387464AbgK3R3u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:29:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:3449 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727522AbgK3R3s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:29:48 -0500
IronPort-SDR: wCgEVGDSaN1G2V0oo8LQqx9gVMAVCQXQe+BmEuTHH8fkqsPuT1KcWDFEMYVzSwIPl3PGobmC5N
 WG1rM7q+mTMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="151926347"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="151926347"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:28:07 -0800
IronPort-SDR: bMiHDrGqoEELFLWE0SnE1SFrlaHerINAUOIukch1wRXikV1HFp8hZBtEXetLOgaI9XO+g2p0ou
 P0zwxpatR65g==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="372404058"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:28:00 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjmyy-00B5xb-Rs; Mon, 30 Nov 2020 19:29:00 +0200
Date:   Mon, 30 Nov 2020 19:29:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 02/18] property: Add support for calling
 fwnode_graph_get_endpoint_by_id() for fwnode->secondary
Message-ID: <20201130172900.GM4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-3-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 01:31:13PM +0000, Daniel Scally wrote:
> This function is used to find fwnode endpoints against a device. In
> some instances those endpoints are software nodes which are children of
> fwnode->secondary. Add support to fwnode_graph_get_endpoint_by_id() to
> find those endpoints by recursively calling itself passing the ptr to
> fwnode->secondary in the event no endpoint is found for the primary.

One nit below, after addressing:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	if (!best_ep && fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> +		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> +						       endpoint, flags);

>  	return best_ep;

Can we, please, do

	if (best_ep)
		return best_ep;

	if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
						       endpoint, flags);

	return NULL;

?

This 'if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))' becomes kinda
idiomatic to the cases when we need to proceed primary followed by the
secondary in cases where it's not already done.

>  }
>  EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);

-- 
With Best Regards,
Andy Shevchenko


