Return-Path: <linux-i2c+bounces-1909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28F85F236
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 08:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88573283B6C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 07:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD1B179AD;
	Thu, 22 Feb 2024 07:56:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812AB179AC
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708588580; cv=none; b=YRzApX4gam+0hMn9SGC9G4pxN59wtd6rhwumjWvdDjoNiNcgHXRQhcbgxth+ZMnJdt0HLP8YK1MQOq7yAvbdAGJA0D9nZP9T7yLK08lUkcQsGVit0YRd9bTbJpzLWFHu51v/L2apdJawxfbjaq2+bkgo8A6oWNoVylfR5o3gI+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708588580; c=relaxed/simple;
	bh=7qak9DSlKvtRj666+/v0dbhhOwMqEcQNSSCFeo0Ei54=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fa6FZqNqmdGcyBmKZLK73DDMPM3v2dY7p0YpBObnPryKly0QCjxqR7PfSZl/jj/tijpyFf+JeOiwPemjozhMuRIXykQyBowMSanrrZUv2IxD0MmZeQbXv9Tn9cJF4o+sGS1Pm/LW+8rCxG3H5Bz7g8D9lnwoKZcyK1uJBEOncsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rd3w2-00081j-D8; Thu, 22 Feb 2024 08:56:02 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1rd3w0-002Bno-Vd; Thu, 22 Feb 2024 08:56:00 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1rd3w0-002i6S-2r;
	Thu, 22 Feb 2024 08:56:00 +0100
Date: Thu, 22 Feb 2024 08:56:00 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Corey Minyard <minyard@acm.org>,
	Andrew Manley <andrew.manley@sealingtech.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx: when being a target, mark the last read as
 processed
Message-ID: <Zdb-EHnTiez6KP-K@pengutronix.de>
References: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
 <kgfagzj5vez56levwam6n6tzxl2lu7efnw5x3eadl3uophxism@ph2tghrvedg5>
 <ZdZ_PsNhQ9S1Eab-@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZdZ_PsNhQ9S1Eab-@shikoro>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Feb 21, 2024 at 11:54:54PM +0100, Wolfram Sang wrote:
> On Wed, Feb 21, 2024 at 09:58:23PM +0100, Andi Shyti wrote:
> > Hi Wolfram and Corey,
> > 
> > On Wed, Feb 21, 2024 at 08:27:13PM +0100, Wolfram Sang wrote:
> > > From: Corey Minyard <minyard@acm.org>
> > > 
> > > When being a target, NAK from the controller means that all bytes have
> > > been transferred. So, the last byte needs also to be marked as
> > > 'processed'. Otherwise index registers of backends may not increase.
> > > 
> > > Signed-off-by: Corey Minyard <minyard@acm.org>
> > > Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
> > > Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
> > > Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > [wsa: fixed comment and commit message to properly describe the case]
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > 
> > is this a fix?
> 
> In deed, it is:
> 
> Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")

Looks good :)
Are any action needed on my side?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

