Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA26C2C8DF8
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 20:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgK3TVy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 14:21:54 -0500
Received: from mga04.intel.com ([192.55.52.120]:54688 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729923AbgK3TVv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 14:21:51 -0500
IronPort-SDR: YVHvXH8I7oDMU4xxRVOv6ayPsDMoeBVHK+oHhtlP2BMt9bikvbOe3Aq302M13Ln8Kebl72ff8j
 VCXVo8pERK3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="170131209"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="170131209"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 11:20:22 -0800
IronPort-SDR: mqiKdYwMMfoR340DKxtCrVCzYi5Kab7J2Rxf3iDZByrcGhePtymLSQEZYeYk3bW4qSNCPpuBYh
 0uZN7BmBXEMQ==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="314682847"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 11:20:16 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjojc-00B76i-KG; Mon, 30 Nov 2020 21:21:16 +0200
Date:   Mon, 30 Nov 2020 21:21:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 02/18] property: Add support for calling
 fwnode_graph_get_endpoint_by_id() for fwnode->secondary
Message-ID: <20201130192116.GZ4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-3-djrscally@gmail.com>
 <20201130172900.GM4077@smile.fi.intel.com>
 <20201130172857.GS14465@pendragon.ideasonboard.com>
 <20201130175319.GS4077@smile.fi.intel.com>
 <20201130184141.GX4141@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130184141.GX4141@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 08:41:41PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 30, 2020 at 07:53:19PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 30, 2020 at 07:28:57PM +0200, Laurent Pinchart wrote:
> > > On Mon, Nov 30, 2020 at 07:29:00PM +0200, Andy Shevchenko wrote:

...

> > > We could also move the !fwnode check to the beginning of the function.
> > 
> > It's already there (1). What did I miss?
> 
> It is, but as we need an explicitly check at the end, it feels cleaner
> to move it to the beginning. No big deal though.

I prefer to stick with a pattern I mentioned because we may easily to find and
unify these ones somehow.

> > 1) via fwnode_graph_get_next_endpoint() -> fwnode_call_ptr_op()

-- 
With Best Regards,
Andy Shevchenko


