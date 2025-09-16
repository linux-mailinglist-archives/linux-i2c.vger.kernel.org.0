Return-Path: <linux-i2c+bounces-12957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDCAB58E5F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 08:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D886A1B25A7C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 06:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651F22D8377;
	Tue, 16 Sep 2025 06:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ryDH4r2S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41227A929;
	Tue, 16 Sep 2025 06:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758003614; cv=none; b=IX+XK2nldhYibh/SaBV/Qy6cymqnTM4aPW98Zk3BlcMaPA0u26JNdkBwGRhLbZ50R70u2+y/RJssTNPoPOWC4qoGUs2xcjUFeD6XZwFPx7yxLh6SIgXEQInci4dgqJG0bEt1P8TKRFf5lzDvuD7Q7sZAld9sN1/tUF5j/E9GvgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758003614; c=relaxed/simple;
	bh=5JDnRaQKgcPzsHc9wsuIR0+WxobhE70MviEX2H8JAlY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVLOC0APjy8yAwVSCk0WjsUys+LJLIg94IFOOcP6g8Yv4IU+NYco2PyElrY+tEl7v23I1baSgYU7iWp/T4ZdA78P9XLOxkheEO3Mv6NB0YQRIU2REUeO/dVgAMJYv7+ZYKBzveABG/1j2XhWDBjwh6Yd4YllZylYx8XHrUX1hrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ryDH4r2S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 99B611A0E1D;
	Tue, 16 Sep 2025 06:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CAB7606A8;
	Tue, 16 Sep 2025 06:20:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55A32102F1690;
	Tue, 16 Sep 2025 08:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758003607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3HBTexW+VffHyjUaff25+tlaT6n2Mdp4mm9FvxRcR1Y=;
	b=ryDH4r2SL53YoHsRwFcuHKSQstAP+TxmMffDZPecme8G5zxLOY78XECvIOWXbet5i6lcxj
	lXsjSjFw/8S97Q8jwpcQElqe5EOdaKL8IWh3gKBnIBXjLuZrPaFwZg0vHEcFYJwP8fAy/c
	GcxPE6bQCJmxnwNHC4ALuoXoOZy7C8BJCcYAFCsEJ2w9DWaV/bNgEUlIaQ6g5yZk3j+B13
	7nN2SSm3rSO8qjcpJXMSAunPqOR+GOfa3mRjsaz87R1+IAt6+ZOuMiPl8B7RL/qw4G+e4B
	OJyEVTAqt2Z/lJoYxP4JFmlF64EPbQUqqZASGfMvNnb3ua1Czu8133DbIQBfHA==
Date: Tue, 16 Sep 2025 08:19:55 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Luca Ceresoli
 <luca@lucaceresoli.net>, Andi Shyti <andi.shyti@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, =?UTF-8?B?TWljaGE=?=
 =?UTF-8?B?xYIgTWlyb3PFgmF3?= <mirq-linux@rere.qmqm.pl>, Jonas
 =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <20250916081955.2826c6a8@bootlin.com>
In-Reply-To: <aMgzzqhXeOi5cn3f@ninjato>
References: <20250915060141.12540-1-clamor95@gmail.com>
	<aMf6DLr8pTCP8tKn@shikoro>
	<CAPVz0n3m9VOV5unVHhU67XQnk4jckA+zyJdCHXu2fFxCSht4JQ@mail.gmail.com>
	<aMgzzqhXeOi5cn3f@ninjato>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Mon, 15 Sep 2025 17:42:06 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> On Mon, Sep 15, 2025 at 02:53:23PM +0300, Svyatoslav Ryhel wrote:
> > пн, 15 вер. 2025 р. о 14:35 Wolfram Sang
> > <wsa+renesas@sang-engineering.com> пише:  
> > >
> > > On Mon, Sep 15, 2025 at 09:01:36AM +0300, Svyatoslav Ryhel wrote:  
> > > > Implement driver for hot-plugged I2C busses, where some devices on
> > > > a bus are hot-pluggable and their presence is indicated by GPIO line.
> > > > This feature is used by the ASUS Transformers family, by the  Microsoft
> > > > Surface RT/2 and maybe more.
> > > >
> > > > ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
> > > > that line through optional dock accessory. Devices in the dock are
> > > > connected to this i2c line and docks presence is detected by a dedicted
> > > > GPIO.
> > > >
> > > > Michał Mirosław (1):
> > > >   i2c: muxes: Add GPIO-detected hotplug I2C
> > > >
> > > > Svyatoslav Ryhel (1):
> > > >   dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus
> > > >
> > > >  .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
> > > >  drivers/i2c/muxes/Kconfig                     |  11 +
> > > >  drivers/i2c/muxes/Makefile                    |   1 +
> > > >  drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++++++
> > > >  4 files changed, 340 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> > > >  create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c  
> > >
> > > Adding Herve and Luca to CC because they want to achieve the same with
> > > their I2C bus extensions, no?  
> 
> Sorry, a misunderstanding: the question was for Herve and Luca. I wanted
> to ask for a comment from them if this is the same problem (which I
> think it is). The question was not meant for you.
> 

Indeed, we try to handle the same use case.

The i2c-hotplug-gpio.c driver handles only an connector with an I2C bus.

On our side, we try to have something more generic that can handle more
than one I2C and some other busses and resources (gpio, pwm, ...) wired
to a connector.

To move this i2c-hotplug-gpio to our proposal direction, this should become
a connector driver with a i2c bus extension and an addon DT describing the
i2c devices available on the addon board.

The connector driver should monitor the gpio and apply the addon DT when it
detects the addon plugged.

Also, I am waiting for conclusions in the export symbols discussion [1] to
re-spin the i2c bus extension series.

Best regards,
Hervé

[1]: https://lore.kernel.org/all/20250902105710.00512c6d@booty/

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

