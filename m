Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3112C8B5D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgK3RiG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:38:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:41459 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729024AbgK3RiG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:38:06 -0500
IronPort-SDR: 3N4Qei0+GVdttbD0qsAwD9sdqU8JUMD/lbpF7cPm5fkjtEIdpuICTJL2szpibwzrr5yGdhqBzn
 0HsgFB7NBSig==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169178662"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="169178662"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:36:25 -0800
IronPort-SDR: S5RgzSOMvj9lyrQk4xZKqFlumiDi74YvoddutW32Dw2orZsbyJH1/OwL7wgjxINs7HXrlfp5wL
 W5MJwW1Mw6EQ==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="334738822"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:36:18 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjn70-00B63R-Bw; Mon, 30 Nov 2020 19:37:18 +0200
Date:   Mon, 30 Nov 2020 19:37:18 +0200
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
Subject: Re: [PATCH 04/18] software_node: Enforce parent before child
 ordering of nodes array for software_node_register_nodes()
Message-ID: <20201130173718.GP4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-5-djrscally@gmail.com>
 <20201130173530.GO4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130173530.GO4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 07:35:30PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:15PM +0000, Daniel Scally wrote:

...

> >  	for (i = 0; nodes[i].name; i++) {
> > +		if (nodes[i].parent)
> > +			if (!software_node_to_swnode(nodes[i].parent)) {
> > +				ret = -EINVAL;
> > +				goto err_unregister_nodes;
> > +			}
> > +
> 
> Besides that can we pack these conditionals together?
> 
> 		if (nodes[i].parent && !software_node_to_swnode(nodes[i].parent)) {

For being it shorter you may use temporary variable:

		software_node *parent;

		parent = nodes[i].parent;
		if (parent && !software_node_to_swnode(parent)) {

-- 
With Best Regards,
Andy Shevchenko


