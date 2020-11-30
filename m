Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E4D2C897D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgK3Q2Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgK3Q2Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:28:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513E1C0613D2;
        Mon, 30 Nov 2020 08:27:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFCDAB26;
        Mon, 30 Nov 2020 17:27:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606753664;
        bh=i330NE/Tn2ccl8y6bCOsqTM7HJgPOsK1+uiu+4FUjsU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MmQbJwppWWRYMbEUb80Ri4wyuw8FTRABX9pFF1Ok+J1kSR5yeOaTd/VIzbljKUY4R
         MnzedaGjeikrn7wIE8BOqOAEcKPaaZu6CUrqA9lhcHv9O/acuGqm9guLC+iqfQVFqL
         i+RrXMW9Q6Q+GpjTTweCMHgndBVZSUjfTZb5vKNw=
Date:   Mon, 30 Nov 2020 18:27:35 +0200
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
Subject: Re: [PATCH 11/18] media: v4l2-core: v4l2-async: Check possible match
 in match_fwnode based on sd->fwnode->secondary
Message-ID: <20201130162735.GM14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-12-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-12-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:22PM +0000, Daniel Scally wrote:
> Where the fwnode graph is comprised of software_nodes, these will be
> assigned as the secondary to dev->fwnode. Check the v4l2_subdev's fwnode
> for a secondary and attempt to match against it during match_fwnode() to
> accommodate that possibility.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> +	    sd->fwnode->secondary == asd->match.fwnode)
> +		return true;
> +
>  	/*
>  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
>  	 * endpoint or a device. If they're of the same type, there's no match.

-- 
Regards,

Laurent Pinchart
