Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C152C8900
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgK3QJ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbgK3QJ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:09:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF44C0613D2;
        Mon, 30 Nov 2020 08:08:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 745ECB26;
        Mon, 30 Nov 2020 17:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606752523;
        bh=FvubFNRozegHWCNhGg55hAtFucfGflP9T603px4M0go=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T2K5et+9pga7sIvBaNehVwika0V4p2f+g2ovINHI7xQFwQDpebDpXKeCfTOgsnPD9
         uKT5G1i1zv1hIHlNtHlFcuQO5NFiVDAWRplxFUPpZtG7nx4nM4rzyy4gzgFCVSZkQS
         PFE2ZO2UhV4G5GOhds6NiH+uuYbMoeAUblqBsBas=
Date:   Mon, 30 Nov 2020 18:08:35 +0200
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
Subject: Re: [PATCH 02/18] property: Add support for calling
 fwnode_graph_get_endpoint_by_id() for fwnode->secondary
Message-ID: <20201130160835.GE14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-3-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:13PM +0000, Daniel Scally wrote:
> This function is used to find fwnode endpoints against a device. In
> some instances those endpoints are software nodes which are children of
> fwnode->secondary. Add support to fwnode_graph_get_endpoint_by_id() to
> find those endpoints by recursively calling itself passing the ptr to
> fwnode->secondary in the event no endpoint is found for the primary.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since RFC v3:
> 
> 	Patch introduced. In discussion in the last submission I noted
> 	that the CIO2 device doesn't have an ACPI fwnode - that turns
> 	out to be true for _some_ devices but not others, so we need
> 	this function to check the secondary too.
> 
>  drivers/base/property.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index a5ca2306796f..4ece6b086e36 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1162,6 +1162,10 @@ fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
>  		best_ep_id = fwnode_ep.id;
>  	}
>  
> +	if (!best_ep && fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> +		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> +						       endpoint, flags);
> +
>  	return best_ep;
>  }
>  EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);

-- 
Regards,

Laurent Pinchart
