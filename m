Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2C62C8B04
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387441AbgK3R3t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgK3R3s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 12:29:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD31CC0613CF;
        Mon, 30 Nov 2020 09:29:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE829B26;
        Mon, 30 Nov 2020 18:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606757346;
        bh=BJ/nlLtM3oiSm7GiMgtM1dVBitZnJoMLuTFsPgKPyeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N5cWitsASa9EAyC9y9wFzTw+68hNpJioMTV/6za1A/OFvRa/NMMzpSLdwbjqXfJ+O
         KgcW/zT5kf+axtydQvAyMPA34LXtrUroZpemdq/wE/ksHY5jzemxx8950xQyQYms5y
         Sg8OO+865pPYf/6jWpA8fE53YxiGtF6f/L893nHY=
Date:   Mon, 30 Nov 2020 19:28:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <20201130172857.GS14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-3-djrscally@gmail.com>
 <20201130172900.GM4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130172900.GM4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 30, 2020 at 07:29:00PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:13PM +0000, Daniel Scally wrote:
> > This function is used to find fwnode endpoints against a device. In
> > some instances those endpoints are software nodes which are children of
> > fwnode->secondary. Add support to fwnode_graph_get_endpoint_by_id() to
> > find those endpoints by recursively calling itself passing the ptr to
> > fwnode->secondary in the event no endpoint is found for the primary.
> 
> One nit below, after addressing:
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> > +	if (!best_ep && fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> > +		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> > +						       endpoint, flags);
> 
> >  	return best_ep;
> 
> Can we, please, do
> 
> 	if (best_ep)
> 		return best_ep;
> 
> 	if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> 		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> 						       endpoint, flags);
> 
> 	return NULL;
> 
> ?
> 
> This 'if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))' becomes kinda
> idiomatic to the cases when we need to proceed primary followed by the
> secondary in cases where it's not already done.

We could also move the !fwnode check to the beginning of the function.

> >  }
> >  EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);

-- 
Regards,

Laurent Pinchart
