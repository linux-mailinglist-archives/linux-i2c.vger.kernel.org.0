Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6792C8B18
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387477AbgK3Raz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:30:55 -0500
Received: from mga05.intel.com ([192.55.52.43]:16191 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726897AbgK3Ray (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 12:30:54 -0500
IronPort-SDR: GUztH99T2bROzAfPxFuRkfK6IMhmwmGcGMQiIoYbKN6X+fKybBDH9SLwuF9K+vXqaSc2yUrfcS
 QzDTWjIfpErQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="257382341"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="257382341"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:29:13 -0800
IronPort-SDR: w4lQCMm7hymbS0Pi+TywDEMUaJu0onjMRLn7FCzGPpSNDm/wRqhUKQBuvHSMqcvmVszFw++nqp
 QLouDwm4Z0bg==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="329654245"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 09:29:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjn03-00B5yn-Ml; Mon, 30 Nov 2020 19:30:07 +0200
Date:   Mon, 30 Nov 2020 19:30:07 +0200
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
Subject: Re: [PATCH 03/18] software_node: Fix failure to put() and get()
 references to children in software_node_get_next_child()
Message-ID: <20201130173007.GN4077@smile.fi.intel.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-4-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 01:31:14PM +0000, Daniel Scally wrote:
> The software_node_get_next_child() function currently does not hold
> references to the child software_node that it finds or put the ref that
> is held against the old child - fix that.

Fixes tag and make it first in the series?
In any case,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	Put reference to previous child.
> 
>  drivers/base/swnode.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 010828fc785b..615a0c93e116 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -443,14 +443,18 @@ software_node_get_next_child(const struct fwnode_handle *fwnode,
>  	struct swnode *c = to_swnode(child);
>  
>  	if (!p || list_empty(&p->children) ||
> -	    (c && list_is_last(&c->entry, &p->children)))
> +	    (c && list_is_last(&c->entry, &p->children))) {
> +		fwnode_handle_put(child);
>  		return NULL;
> +	}
>  
>  	if (c)
>  		c = list_next_entry(c, entry);
>  	else
>  		c = list_first_entry(&p->children, struct swnode, entry);
> -	return &c->fwnode;
> +
> +	fwnode_handle_put(child);
> +	return fwnode_handle_get(&c->fwnode);
>  }
>  
>  static struct fwnode_handle *
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


