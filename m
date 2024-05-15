Return-Path: <linux-i2c+bounces-3493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAEF8C62FE
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B20EB22FBC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BC64EB51;
	Wed, 15 May 2024 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGpF6hTS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278E757C8A;
	Wed, 15 May 2024 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715762518; cv=none; b=JnJcPD5vzYXy6rOvyQXFo8jkeKjQ2VE957bWE6ctlBOJnkA+HtmD3Of2d6rwZf77ScJ1F9kruUMPRh59s+XVCyEFfBpw8GMQmo7oRxhD0tJfnOih18aRrp73PK9//VPB1Cq0E+xl4HgXSx0zdxPrS4RcOUkiXAMKe/tB6KFPtDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715762518; c=relaxed/simple;
	bh=8+5u+ghOQBz6gJuOkWHWxFIE4gDY8HFeDOTK4pusXFA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SnAqKFObeKQiVypEo+X8XvqOGCnk7n6wakJ5UIZJ9zSldexvgWO4u4fuKOJNd1GYeFcTQrptVo9l6eFnQoBy9eFRBrYsAb/qHExFySrNdJTkk70vvZU908P/9iuJzCwbqGhSEcDoSYtWCvdyY6OgzgRQ13fxFL93CiGpSML+p9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGpF6hTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48A8C116B1;
	Wed, 15 May 2024 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715762517;
	bh=8+5u+ghOQBz6gJuOkWHWxFIE4gDY8HFeDOTK4pusXFA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lGpF6hTSvRVzU64JaFPHGSuUjxXO9REOKYGOwuwY6jqvkjN35wKC0tocaMw/S2u+q
	 FMkhs/MwyvwAqQsID5tWS7ihe/rUY2EIPkOnLOoK9vRs5VMYdJ2L4aJAGuU1yPRK66
	 +GlKiUpczmRzLgbmR/04lTFea24V/23gSdP+SpIYakDD2ft/WXyeP4cwGjBNp7ZYeT
	 4gqtRslL0Eo0U6WWN5l3BiQTe3A/7F/kpSbvYUc6jVLZL/ECXN5SO9KEAb+t+QclQU
	 fOgDSc4BbF9jo3QesN6K7Kl3aRwprFtajKINkZpPNuOQCl/iKk7lNrqD5HwNsNSxan
	 XYt2+o2+2nabw==
Date: Wed, 15 May 2024 10:41:49 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: m95d@psihoexpert.ro, Peter Rosin <peda@axentia.se>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org
Subject: atmel sha: i2c bus speed under multiplexer (WAS: devicetree for
 Turris Omnia is missing i2c frequency for atsha204a)
Message-ID: <20240515104149.2ce3566e@dellmb>
In-Reply-To: <46ea55652f8bcdef51d5c552902fd0cc@psihoexpert.ro>
References: <46ea55652f8bcdef51d5c552902fd0cc@psihoexpert.ro>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 May 2024 20:09:30 +0000
m95d@psihoexpert.ro wrote:

> Hello.
> 
> Booting kernel v6.6 I get these errors in dmesg:
> 
> atmel-sha204a 6-0064: failed to read clock-frequency property
> atmel-sha204a: probe of 6-0064 failed with error -22
> 
> I'm attaching a patch to fix it.
> It adds 1MHz clock frequency to the i2c devicetree node where atsha204a is connected. This is the max. supported frequency according to the atmel sha204a specs sheet.
> Tested. Works.
> 
> Thank you.
> 
> diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> index 7b755bb4e4e7..64caabc81585 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
> @@ -378,6 +378,7 @@ i2c@5 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			reg = <5>;
> +			clock-frequency = <1000000>;
>  
>  			/* ATSHA204A-MAHDA-T crypto module */
>  			crypto@64 {
> 
> Signed-off-by: Marius Dinu <m95d+git@psihoexpert.ro>

Hi Marius,

adding I2C maintainers and Atmel crypto driver maintainers to this
thread.

Although this fixes your problem of failed driver probe, this change
is in fact wrong on several points.

First, according to documentation the A38x I2C controller should be
used either with 100 kHz standard I2C rate or 400 kHz fast rate. 1 MHz
is too much.

Second, the ATSHA is connected via the PCA9547 I2C multiplexer.
According to documentation for this multiplexer, the maximum clock
frequency that should be used is also 400 kHz.

Third, this change adds the clock-frequency to one channel of the
multiplexer (the one on which the ATSHA is connected). Looking at the
I2C code, that clock-frequency is not used for multiplexer channels, so
the actual I2C frequency is not set to 1 MHz, and instead remains at
100 kHz.

Fourth, the ATSHA driver uses the parsed clock-frequency to compute
wake token size. Since the given clock-frequency is 1 MHz, but the
I2C bus in reality operates at 100 kHz, the computed wake token size is
incorrect.

In my opinion, a correct fix should instead come into the atmel SHA
crypto driver, drivers/crypto/atmel-i2c.c: the bus clock rate is first
tried to be determined from ACPI:
  bus_clk_rate = i2c_acpi_find_bus_speed(&client->adapter->dev);
If that fails, the second option is to read the clock-frequency
property of the parent device (the I2C bus), which on Turris Omnia is
an I2C multiplexer channel. This is where it is wrong. Instead, there
should either:
- be a similar function to the i2c_acpi_find_bus_speed(), but for OF
- or there should I2C core function to report bus speed,
  i2c_find_bus_speed(), that would also work over multiplexers.

Marek

