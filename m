Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E252C890D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 17:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgK3QL2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 11:11:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59856 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbgK3QL2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 11:11:28 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6C0CB26;
        Mon, 30 Nov 2020 17:10:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606752646;
        bh=YK8bIo43bVkfzz3B1bpargfqeptKw5FDEfrqzzJmCbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FrLzipGK6vwnwX+P0ZfknMsGumKtcukKrbGoygj7WmF5kotOnOdlDgh7mNupc+p18
         xN/+ssNz4GL2GY0LoQMSVBiUgeKE5tcD22HS4YfTi76glxC3WF3eQ6DNZDrlhxZ8Bd
         6F/uuCbZtnIP3nDUeu7+vjXgqfwGItz7MhldDPnA=
Date:   Mon, 30 Nov 2020 18:10:37 +0200
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
Subject: Re: [PATCH 03/18] software_node: Fix failure to put() and get()
 references to children in software_node_get_next_child()
Message-ID: <20201130161037.GF14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-4-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:14PM +0000, Daniel Scally wrote:
> The software_node_get_next_child() function currently does not hold
> references to the child software_node that it finds or put the ref that
> is held against the old child - fix that.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
