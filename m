Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 775131343F2
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbgAHNgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:36:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46948 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgAHNgn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 08:36:43 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A114E52F;
        Wed,  8 Jan 2020 14:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578490601;
        bh=tvTEJFD1YKDy5tsdSnGaE3rxJxs2sOnE9UhYvN4qihg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aTitT7uL0RFE2FGL+vmqNVxuIOiWAk2YY4e0baQZX7knqYtjwiXrDeV3jJca8e/fz
         2oQEbW5EEY3FCTVsNOQ3XEy9TYvPjBq43R0TAeUs1rBBXHfuY9bbd0UAa0r09HL1OG
         qWx2WBV4nGFn8czSFou9mQr6LR8S+fsZXgHv15zE=
Date:   Wed, 8 Jan 2020 15:36:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108133629.GD4884@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <6760a242-ff0f-c981-68d4-7b9665124e21@bingham.xyz>
 <20200107171119.GN4871@pendragon.ideasonboard.com>
 <61344235-9e66-0d89-89cd-1adef2e0bce1@ideasonboard.com>
 <20200108133533.GD834@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200108133533.GD834@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 08, 2020 at 02:35:33PM +0100, Wolfram Sang wrote:
> 
> > >> I.e. if say the adv748x had in DT defined aliases at 0x08, 0x09,
> > >> 0x0A..., but not yet probed (thus no device is listening at these
> > >> addresses) ... and then a max9286 came along and asked for 'any' spare
> > >> address with this call, would it be given 0x08 first?
> 
> You have a point here. Ancillary addresses are not blocked until the
> driver probes, this is true. I wonder now if we should handle multiple
> addresses in i2c-core-of.c somehow, too? It does block the first <reg>
> entry, but not all.
> 
> > The core 'could' parse all reg entries, and conclude that any extended
> > entries within a device node are aliases as well, which should be
> > reserved, but I don't think it could know if the device is actually
> > going to be enabled by a driver (well, it could look it up).
> 
> We could argue that if it is described in DT, it should be blocked in
> any case, or?

That seems fair to me.

> > But it would also have to traverse any i2c-muxes too!
> 
> I probably need a second thought about muxes as well.

-- 
Regards,

Laurent Pinchart
