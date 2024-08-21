Return-Path: <linux-i2c+bounces-5615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF895945D
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 08:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ABAC1C220AB
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 06:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5478616B3B4;
	Wed, 21 Aug 2024 06:05:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D1168487
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 06:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724220325; cv=none; b=m4c+P1sPUC2qce9G4RzBEKfxH1CaRRBNfpSOsPoSbjFR7TDXTeuJ0zhJe4Jk/n1/AnpVctbfJxtTF8LzCcp5uT5aaTaDFoNkFdmAZe+ZLllVa38zYT0a8Uq6jyF8s7RPNe1fZzCnvHh2iFlr+gXaGL3CylbWXG2IVqjMMdGqr/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724220325; c=relaxed/simple;
	bh=Lmr1ZW511aiy6LUvUqcwSnykjVwhBOGbFCjnf6g4mxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw61K9R6EzyCfVo5fo4q7UfLwoNNuOm38xSiXfjFHydnqvr9tPfVlCXEwwmv5aU0bIGptnOGzLJI7r8GV3BZBJmY+rAReKCwE7qizB+dqOZmkd9tE6xV1z+1dRcqP3Kuh4oLHkZ1LfnoPVD5/CpC3LO3EJureUpLvbk+BHGFt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sgeSp-00030i-Ri; Wed, 21 Aug 2024 08:04:59 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sgeSo-001wYp-1J; Wed, 21 Aug 2024 08:04:58 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sgeSn-00FOha-30;
	Wed, 21 Aug 2024 08:04:57 +0200
Date: Wed, 21 Aug 2024 08:04:57 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	andi.shyti@kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: pca953x: Probing too early
Message-ID: <ZsWDicqAjmkHgaPD@pengutronix.de>
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
 <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
 <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
 <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Fabio,

On Tue, Aug 20, 2024 at 09:50:04PM -0300, Fabio Estevam wrote:
> On Tue, Aug 20, 2024 at 8:18 PM Fabio Estevam <festevam@gmail.com> wrote:
> 
> > The pca953x driver tries to write to the i2c-2 bus before i2c-2 is registered.
> >
> > This is the point I don't understand: how can the pca953x driver get
> > probed before its I2C bus parent?
> 
> Disconsider what I wrote above.
> 
> I'm trying to recover from the arbitration lost like this:
> 
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -491,6 +491,8 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct
> *i2c_imx, int for_busy, bool a
>                 /* check for arbitration lost */
>                 if (temp & I2SR_IAL) {
>                         i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
> +                       pr_err("******* Arbitration lost\n");
> +                       i2c_recover_bus(&i2c_imx->adapter);
>                         return -EAGAIN;
>                 }
> 
> @@ -1487,6 +1489,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>         i2c_imx->adapter.nr             = pdev->id;
>         i2c_imx->adapter.dev.of_node    = pdev->dev.of_node;
>         i2c_imx->base                   = base;
> +       i2c_imx->adapter.retries        = 5;
>         ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
> 
> but still get pca953x probe failure:
> 
> [    1.756761] pca953x 2-0020: supply vcc not found, using dummy regulator
> [    1.766564] pca953x 2-0020: using no AI
> [    1.775333] ******* Arbitration lost
> [    1.783811] ******* Arbitration lost
> [    1.793701] ******* Arbitration lost
> [    1.797455] ******* Arbitration lost
> [    1.801209] ******* Arbitration lost
> [    1.804964] ******* Arbitration lost
> [    1.808562] pca953x 2-0020: failed writing register
> [    1.813602] pca953x: probe of 2-0020 failed with error -11
> [    1.819222] i2c i2c-2: IMX I2C adapter registered

Do you have a multi master i2c bus? If not, can you please test
following patch:
https://lore.kernel.org/all/20240715151824.90033-2-eichest@gmail.com/

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

