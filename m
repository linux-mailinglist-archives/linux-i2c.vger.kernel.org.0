Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E8F2C8BD7
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgK3R4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:56:21 -0500
Received: from mga18.intel.com ([134.134.136.126]:4068 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387731AbgK3R4V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:56:21 -0500
IronPort-SDR: N7+Dm7JSmuyVeX0zRzFCSFe3J1JdrNn8FZEXycPig+pASsFR0/1dciSfDTY63k+xBGwIbkdTGp
 aRQemdKbLybA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="160451431"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="160451431"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:54:40 -0800
IronPort-SDR: jhPTcdou80j2byhwDbFMIgXZ/vrILyt4BNmwBxBjF7vB4h1l3IIcsAMmv9BHlfOUYJOGaFD1sn
 VZdqup0WTk5g==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="372581191"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:54:34 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjnOg-00B6F3-Uy; Mon, 30 Nov 2020 19:55:34 +0200
Date:   Mon, 30 Nov 2020 19:55:34 +0200
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
Subject: Re: [PATCH 11/18] media: v4l2-core: v4l2-async: Check possible match
 in match_fwnode based on sd->fwnode->secondary
Message-ID: <20201130175534.GT4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-12-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-12-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 01:31:22PM +0000, Daniel Scally wrote:
> Where the fwnode graph is comprised of software_nodes, these will be
> assigned as the secondary to dev->fwnode. Check the v4l2_subdev's fwnode
> for a secondary and attempt to match against it during match_fwnode() to
> accommodate that possibility.

One nit below.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	- None
> 
>  drivers/media/v4l2-core/v4l2-async.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index e3ab003a6c85..6486dbde784f 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -87,6 +87,14 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
>  	if (sd->fwnode == asd->match.fwnode)
>  		return true;
>  
> +	/*
> +	 * Check the same situation for any possible secondary assigned to the
> +	 * subdev's fwnode
> +	 */

> +	if ((!IS_ERR_OR_NULL(sd->fwnode->secondary)) &&

Too many parentheses.

> +	    sd->fwnode->secondary == asd->match.fwnode)
> +		return true;
> +
>  	/*
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
>  	 * endpoint or a device. If they're of the same type, there's no match.
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


