Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04C22C8922
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgK3QPZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbgK3QPZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:15:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED57CC0613CF;
        Mon, 30 Nov 2020 08:14:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3056B26;
        Mon, 30 Nov 2020 17:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606752883;
        bh=hA1p7XG8OVMcXeYwF/6YL9wO3z01pSCZWxtyGUu6fyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vl61i7wZjVlTraR4543dMM1TqEbfuwMkcocmenWCQgTQCWRuOo+3bNx1r7yB6I1+R
         TwmthV3GEpVkRU4hixPInkky0BiL1s+ssGA6U6uJm+ah6nUmTvhwDcTbIpoEJyCKCh
         kut3u9JA4dwhiKUD3YdMBfS3efTLOxY9noHrCbvo=
Date:   Mon, 30 Nov 2020 18:14:34 +0200
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
Subject: Re: [PATCH 05/18] software_node: Alter
 software_node_unregister_nodes() to unregister the array in reverse order
Message-ID: <20201130161434.GI14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-6-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:16PM +0000, Daniel Scally wrote:
> Software nodes that are children of another software node should be
> unregistered before their parent. To allow easy unregistering of an array
> of software_nodes ordered parent to child, reverse the order in which
> this function unregisters software_nodes.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes since RFC v3:
> 
> 	Switched this functionality from a new function to replacing
> 	the existing software_nodes_unregister_nodes()
> 
>  drivers/base/swnode.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index af7930b3679e..d39e1c76d98d 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -720,20 +720,25 @@ EXPORT_SYMBOL_GPL(software_node_register_nodes);
>  
>  /**
>   * software_node_unregister_nodes - Unregister an array of software nodes
> - * @nodes: Zero terminated array of software nodes to be unregistered
> + * @nodes: Zero terminated array of software nodes to be unregistered. If
> + * parent pointers are set up in any of the software nodes then the array
> + * MUST be ordered such that parents come before their children.
>   *
>   * Unregister multiple software nodes at once.
>   *
> - * NOTE: Be careful using this call if the nodes had parent pointers set up in
> - * them before registering.  If so, it is wiser to remove the nodes
> - * individually, in the correct order (child before parent) instead of relying
> - * on the sequential order of the list of nodes in the array.
> + * NOTE: If you are uncertain whether the array is ordered such that
> + * parents will be unregistered before their children, it is wiser to
> + * remove the nodes individually, in the correct order (child before
> + * parent).
>   */
>  void software_node_unregister_nodes(const struct software_node *nodes)
>  {
> -	int i;
> +	unsigned int i = 0;
> +
> +	while (nodes[i].name)
> +		i++;
>  
> -	for (i = 0; nodes[i].name; i++)
> +	while (i--)
>  		software_node_unregister(&nodes[i]);
>  }
>  EXPORT_SYMBOL_GPL(software_node_unregister_nodes);

-- 
Regards,

Laurent Pinchart
