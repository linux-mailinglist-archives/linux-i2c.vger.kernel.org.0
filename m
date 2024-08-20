Return-Path: <linux-i2c+bounces-5607-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B829958FA8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 23:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E57286DE8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 21:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7E11C3F08;
	Tue, 20 Aug 2024 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mL5pfbYS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B8F19478;
	Tue, 20 Aug 2024 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724189355; cv=none; b=gIMLAbADN/iPsdomdyAehVuoTbMvYLuThCcPK/ZhaZ+5Q7MiSixnqyt+eCg+4bz/QYqqj57b33mWpKy5sIF+5JrqH6D5Qpy1LAcXWv0Cp9aqqC9aQIzjp1y7qb9hNoyN2sRfyqpFv8rMwM3NQZks6EJitO7FBmggstE0UC8iYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724189355; c=relaxed/simple;
	bh=/ND5HlIXDzhNU0i4uxc9ZZuJ7bTMfqtlIQ4tksw85gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsj1NfA3YL7UqCkMRvlPzF7+DQaD3cw6WTHjkDZDKbrkYf+GNWbzt4VlSduABwDeml9UGsKIkeen6UVsrb9gN3glyRcF0lqPgQabU0hyasevn4/8uyAC38QQAqKBGOuf8Op6QJ5agW5bqMyEperge6QwuKp26U/qript2IVKCLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mL5pfbYS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=uXZe5ZpvqsnjNAiqfNP6a+1wsnP0Z0a4ng1nFJIDlYM=; b=mL
	5pfbYSayQXnt+PHLQFJdD0Ouju/vf4w57GqFzxxoVIkw4uy/VMEplrk4+9lpF56NC++R88Et12h53
	Jb/tiKLV6df5RPV1YjUgo0fZHrDA5KEkjsHTilzO6BNhPEAb7uWi8fse14kI/7EAYuInAJJMJi3ad
	n5FQPV/B9EP8+Fs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sgWPb-005GFx-H3; Tue, 20 Aug 2024 23:29:07 +0200
Date: Tue, 20 Aug 2024 23:29:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Fabio Estevam <festevam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org,
	linux-i2c <linux-i2c@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: pca953x: Probing too early
Message-ID: <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>

On Tue, Aug 20, 2024 at 05:47:27PM -0300, Fabio Estevam wrote:
> Adding the i2c-folks on Cc.
> 
> On Tue, Aug 20, 2024 at 5:02 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi,
> >
> > I am seeing an issue with the PCA935X driver in 6.6.41 and
> > 6.11.0-rc4-next-20240820.
> >
> > The pca953x is getting probed before its I2C parent (i2c-2):
> >
> > [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulator
> > [    1.889195] pca953x 2-0020: using no AI
> > [    1.893260] pca953x 2-0020: failed writing register
> > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11

-11 is EAGAIN, which is a bit odd. Given your description, i would of
expected ENODEV. My guess is, it needs another resource, a GPIO,
regulator, or interrupt controller. That resources might not of probed
yet. If that is true, you want the pca953x_probe() to return
-EPROBE_DEFER. The driver core will then try the probe again sometime
later, hopefully when all the needed resources are available.

Track down where the EAGAIN is coming from.

      Andrew

