Return-Path: <linux-i2c+bounces-11816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F334AF7BA6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 17:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57553587021
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 15:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0812F002D;
	Thu,  3 Jul 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WYW0qcLi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47C2EAD10;
	Thu,  3 Jul 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555960; cv=none; b=Kf4TQDISydEONf0NBhH9z7hDdte3hLJJOtRd4Grhtx2Qkz8X/XWp/ATz1pO2DDnQokM+LEPKoyGP3rxeO/pw0Rn86h19d2MM5d1cjR/3f+5DdkbpldHt2sdaFH+CZ6YeHN0K3XhbFLecjjaEMTuezx2yvgK8ei9S5cmoRWTf+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555960; c=relaxed/simple;
	bh=7R1O2w50zFVFdltzoczZuuzjYk84Ji5n0+6r3bBzZuw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L74oY4TMeaGYZ0r2aJMkQXkpLsLUFK4t/LhNC/Li2Qt9eMbawgU+nwa/hHeG1+SCiZ0nlXBeoYN0Tfg9/E67ROU1I3Avdqy1bQ2viAV5X7UfS245tr/OFVTQ4gQuwpWS1kCuLOScF/JXD2MAcnrmFE2OPNHvJvrQRKXnEBYdNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WYW0qcLi; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B6D4433D;
	Thu,  3 Jul 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751555949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vPbA55GiZOX20WwUdHkWkbBRAgEIfKrszAkQo+WB4o=;
	b=WYW0qcLiT4vUm+pNNStTnW831aKTemEVwc+gCHUY6xKk/NtXaJjaqxwxpWv2WdW0e2BQ4Y
	kf0PKD0b6P8isXfU4Vc5vefI726O2iG2WkLgbXFskKMM5oJevjCE/gm5cjHtLPvTm6l8dj
	sCbTHLYLLlWbpPWWYyAIDOk6AYyT7C3BWpi9/XugIR9g/kCp35W032g2NUESsKCpmkegcv
	cBUWO9vPpc918ug03XtOwZCrPgr6tGumYbpULTMrSRc7HLdZ6Ve9ZsX/G/ubSAwH48J7Yp
	HUxPkRrUHwUfbJwccKfKpsC0htQC1s9PagdzubfbLV3Taoavcmx8aY64gijLiA==
Date: Thu, 3 Jul 2025 17:19:07 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 luca.ceresoli@bootlin.com, robh@kernel.org, thomas.petazzoni@bootlin.com,
 wsa+renesas@sang-engineering.com
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Message-ID: <20250703171907.12b00c43@bootlin.com>
In-Reply-To: <8859d983-f4ff-498b-bb0b-eb84206ad969@beagleboard.org>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<525877c8-6c64-45b3-b4aa-a52768e59b86@beagleboard.org>
	<20250613093016.43230e3b@bootlin.com>
	<8859d983-f4ff-498b-bb0b-eb84206ad969@beagleboard.org>
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
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevleefvdeujedvheekvdegleevjefgtdeuieetveefhedvvdejleeuhedvfeetieenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

On Thu, 3 Jul 2025 16:56:20 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> On 6/13/25 13:00, Herve Codina wrote:
> 
> > Hi Ayush,
> >
> > On Thu, 12 Jun 2025 13:22:45 +0530
> > Ayush Singh <ayush@beagleboard.org> wrote:
> >  
> >> I have tested this patch series for use with pocketbeagle 2 connector
> >> driver [0]. To get a better idea how it looks in real devicetree, see
> >> the base tree [1] and the overlay [2]. Since it also used gpio and pwm
> >> nexus nodes, along with providing pinmux for pins, it can provide a
> >> better picture of how the different pieces (export-symbols, nexus nodes,
> >> etc) look when combined.  
> > Nice. Happy to see that I am no more alone with a system using these
> > features.
> >  
> >>
> >> I also have a question for Herve. Do you already have any working
> >> patches for similar extension for SPI and UART in some private tree?  
> > No, I didn't do anything related to SPI nor UART.
> >
> > On my system, no SPI nor UART are wired to my connector and so, I haven't
> > got any needs to implement extension busses for SPI an UART (serial dev bus)
> > nor any support for nexus nodes for other kind of components.
> >
> > Best regards,
> > Hervé  
> 
> 
> I have added SPI bus extension to my kernel tree [0]. Now, the techlab 
> cape (other than mikrobus port) works using export-symbols + i2c and spi 
> bus extension + eeprom auto detection.
> 
> 
> Here is a list of everything currently working on the tree:
> 
> 1. EEPROM based auto-detection.
> 
> 2. SPI
> 
> 3. I2C
> 
> 4. PWM
> 
> 5. GPIO
> 
> 
> Missing:
> 
> 1. UART (Don't have a cape that has something using the UART yet. Maybe 
> need to experiment with MikroBUS).
> 
> 
> Not quite sure what else to do to move things forward.
> 
> 
> Best Regards,
> 
> Ayush Singh
> 
> 
> [0]: https://github.com/Ayush1325/linux/tree/beagle-cape-v1
> 

I've just looked at your code related to SPI. It is closed to the I2C code
and that's pretty nice!

I think to move forward we have to wrote the SPI bus extension binding and
propose the binding + the code upstream.

Compared to I2C bus extension, only one repo is involved for SPI, the Linux
kernel repo. On I2C bus extension, I am stuck on the binding which is a
modification on the dtschema repo [0].

The SPI binding modifications for SPI bus extension will probably take place
in spi-controller.yaml [1] and should be pretty close to modifications done
for the I2C binding.

When one of the two series (I2C or SPI) is accepted, it will be easier
for the other one to follow (Same concept, same kind of binding, same kind
of code).

The advantage of the SPI series, I think, is that only one repo is involved.

Best regards,
Hervé

[0]: https://lore.kernel.org/all/20250618082313.549140-1-herve.codina@bootlin.com/
[1]: https://elixir.bootlin.com/linux/v6.16-rc4/source/Documentation/devicetree/bindings/spi/spi-controller.yaml

