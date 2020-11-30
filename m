Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE412C8974
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgK3Q1A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:27:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60180 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3Q1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:27:00 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72462B26;
        Mon, 30 Nov 2020 17:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606753577;
        bh=J3bPUtVMb+IJFadsY0xMSWedkKztYbsIqrdvmGmF7Ew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c5ucFxnyYh8Z/Ssk8k25I+lOHCOTGUva4CPYOt8Cn113F0IrD48g9SI22QS3AqpnL
         GFSLmQm0hO9fxpjgd0iMq+LMNty7kJFIMp+8x57xk2JSbpyszBFHLuiLTWA4r14xSl
         fMD1WQhtugZ5DVRgtkyEXvPFiY8O/9vPUxxA0+ng=
Date:   Mon, 30 Nov 2020 18:26:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
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
Subject: Re: [PATCH 08/18] lib/test_printf.c: Use helper function to unwind
 array of software_nodes
Message-ID: <20201130162609.GL14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-9-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-9-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:19PM +0000, Daniel Scally wrote:
> Use the software_node_unregister_nodes() helper function to unwind this
> array in a cleaner way.
> 
> Acked-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since RFC v3:
> 
> 	Changed the called function name - didn't drop the tags since it's
> 	such a trivial change, hope that's alright!
> 
>  lib/test_printf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 7ac87f18a10f..7d60f24240a4 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -644,9 +644,7 @@ static void __init fwnode_pointer(void)
>  	test(second_name, "%pfwP", software_node_fwnode(&softnodes[1]));
>  	test(third_name, "%pfwP", software_node_fwnode(&softnodes[2]));
>  
> -	software_node_unregister(&softnodes[2]);
> -	software_node_unregister(&softnodes[1]);
> -	software_node_unregister(&softnodes[0]);
> +	software_node_unregister_nodes(softnodes);
>  }
>  
>  static void __init

-- 
Regards,

Laurent Pinchart
