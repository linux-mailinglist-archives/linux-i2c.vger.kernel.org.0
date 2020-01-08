Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75A11343DA
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 14:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgAHNcI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 08:32:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46804 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgAHNcI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 08:32:08 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C60D152F;
        Wed,  8 Jan 2020 14:32:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578490326;
        bh=Pobrlhmqc6PtlGm7VqiJXf2RU2NMg6C4wsRkYYh1+uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o7ELkoOeO92pzbS4grY5jnXjzdNt/3XOu6+nkMiE2gvV6puMGXJaV1q60I7Tly2xO
         TykbVfCanVtu9JOQLDd38wVIIeomkguEJL3IBjkom4xGkJF4A+ssSDXm4RiOtaihij
         bJab3OfTw8iAJwL3UT6iwgWrTGhce4DYMsDpFhzU=
Date:   Wed, 8 Jan 2020 15:31:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200108133153.GB4884@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
 <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
 <20200107171357.GO4871@pendragon.ideasonboard.com>
 <20200108132708.GC834@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200108132708.GC834@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 08, 2020 at 02:27:08PM +0100, Wolfram Sang wrote:
> 
> > > It would be nice, but I'm not sure this is really doable. Say the DT for
> > > board X lists all the used slave addresses. Then the kernel would assume
> > > all the other addresses are available. But then somebody includes the DT
> > > of board X in the DT for product Z, based on board X + add-on board Y.
> > > Add-on board Y has 2 I2C chips, but only one is described in DT. Now the
> > > kernel still thinks it knows all the used address, but this is wrong.
> > 
> > That's the fault of the system integrator though. We can't prevent
> > people from making incorrect DT, and we shouldn't go to great length to
> > still support them.
> 
> Currently, there is no paradigm that all I2C busses must be fully
> described. Enforcing it now all of a sudden is not too user-friendly,
> or?

We're only enforcing it for systems that want to make use of this new
API, so it's not breaking backward compatibility.

> Especially since calling read_byte once is not necessarily "great
> length" in my book. If you have 8 cameras on a 400kHz bus, the 8 * 18
> bits should take 360us if I am not mistaken?

That's assuming the first scanned address is free. There could also be
I2C-controller I2C muxes or gates in front of the bus. Things can
quickly get more expensive.

-- 
Regards,

Laurent Pinchart
