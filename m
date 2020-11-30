Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86432C8D12
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 19:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729778AbgK3Smc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 13:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgK3Smc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 13:42:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A286C0613D4;
        Mon, 30 Nov 2020 10:41:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A95A99;
        Mon, 30 Nov 2020 19:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606761709;
        bh=CPdPrulLViLfkaCcKKsWPHwhLQ/hUyuF5Gf5uEYOwDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZV7LSuLo5qGpZsp9gP2EiSRj2LrDSnXbR91WNmGSwoxgj5lPSUsGvZJizZ6GW5nht
         I67pLvh+IWjRiJlAdc/U3vn1xRJUgkdbyw27f3vPXGsEqhXiI/VfcY8mZopO3mUa/E
         ga5a1f05kmxbkaH5A+cs1HFCrU6xnPRs0IHONPYk=
Date:   Mon, 30 Nov 2020 20:41:41 +0200
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
Message-ID: <20201130184141.GX4141@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-3-djrscally@gmail.com>
 <20201130172900.GM4077@smile.fi.intel.com>
 <20201130172857.GS14465@pendragon.ideasonboard.com>
 <20201130175319.GS4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130175319.GS4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Nov 30, 2020 at 07:53:19PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 07:28:57PM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 30, 2020 at 07:29:00PM +0200, Andy Shevchenko wrote:
> > > On Mon, Nov 30, 2020 at 01:31:13PM +0000, Daniel Scally wrote:
> 
> ...
> 
> > > > +	if (!best_ep && fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> > > > +		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> > > > +						       endpoint, flags);
> > > 
> > > >  	return best_ep;
> > > 
> > > Can we, please, do
> > > 
> > > 	if (best_ep)
> > > 		return best_ep;
> > > 
> > > 	if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> > > 		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> > > 						       endpoint, flags);
> > > 
> > > 	return NULL;
> > > 
> > > ?
> > > 
> > > This 'if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))' becomes kinda
> > > idiomatic to the cases when we need to proceed primary followed by the
> > > secondary in cases where it's not already done.
> > 
> > We could also move the !fwnode check to the beginning of the function.
> 
> It's already there (1). What did I miss?

It is, but as we need an explicitly check at the end, it feels cleaner
to move it to the beginning. No big deal though.

> 1) via fwnode_graph_get_next_endpoint() -> fwnode_call_ptr_op()

-- 
Regards,

Laurent Pinchart
