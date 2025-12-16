Return-Path: <linux-i2c+bounces-14593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EFCC4A6A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BAE63022582
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FA1330B28;
	Tue, 16 Dec 2025 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PpezN6fg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C32330B18;
	Tue, 16 Dec 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906030; cv=none; b=tH/Sgn74sJTHC4B90oortZkmvCoxM911fjNS7hOT+IWQzqtRXKBCx0P8KScXIfkiD3ZMFk2ZkezKPWTYaEqq+tMffPVmHi4tx6dgXv7Vl/B/O6Lqc4oN7JSK2l1NTpUp8reClb9GTS2LRdjM4mMmqzLCuFpEsLmw0lxBSem9TYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906030; c=relaxed/simple;
	bh=LOoNsfgtqQFSm+0gZYo/RrK4QnqByvGvMQcD4Xfny+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTJZd8/l9xFDgMd8MrYLA0Aaaa7B0P92rAicBnaRNJjJ+5KLbz7uHKf3PT1OVLHUh5F4rFIWTx5/RO9BRV7M3cl6OHOzGHPJTivgBMkmjpUHRVS/kx3ZPcfEzdkKWA9D7djMAQ07reHQsaoaeWJrrgiTuO3PtQR8T7FRV7In+ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PpezN6fg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DF192C1A583;
	Tue, 16 Dec 2025 17:26:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 557F26071C;
	Tue, 16 Dec 2025 17:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9AD3119A9759;
	Tue, 16 Dec 2025 18:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765906017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EmrY+TtKs52sxJBoXVm7+OMPrZ2mV5ot/olhs/S4NT8=;
	b=PpezN6fgd+3PEQFLhd6fNgyfQKDlPVICMLyWK1hTZw7smVZG3VMfI3/lykbKBvnCQgDxvf
	DRA1bIlc4wxUxz+bs0dkav6nr9jnHdl70bQhIXsRhWXvYNPqlSVVT/ZEK913ctS7cn/k4I
	Nd/R/OFduTnhKVFoTJH+TjJOwKQoCebd9g88kfA+0QCBkmSWDQDWy0vfHiyneCUqyf38YJ
	Bo3gBkdvkFRDkvnm1oJyOe4CafHvM8u8Na/fyKn+vlXHYSdZMlIsPMVx9pBrh4Dyr53yR9
	re5OTg4aWBY5HDcz4U6PMuQQTqJOk/EPLQ+torGwHiqi34ySsxXe2G2r7vB9VQ==
Date: Tue, 16 Dec 2025 18:26:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic
 Microchip binding
Message-ID: <202512161726449fe42d71@mail.local>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr>
 <202512161628415e9896d1@mail.local>
 <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On 16/12/2025 17:56:20+0100, Robert Marko wrote:
> On Tue, Dec 16, 2025 at 5:29 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> > > Create a new binding file named microchip.yaml, to which all Microchip
> > > based devices will be moved to.
> > >
> > > Start by moving AT91, next will be SparX-5.
> >
> > Both lines of SoCs are designed by different business units and are
> > wildly different and while both business units are currently owned by
> > the same company, there are no guarantees this will stay this way so I
> > would simply avoid merging both.
> 
> Hi Alexandre,
> 
> The merge was requested by Conor instead of adding a new binding for LAN969x [1]
> 
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122313.1287950-2-robert.marko@sartura.hr/
> 

I would still keep them separate, SparX-5 is closer to what is
devicetree/bindings/mips/mscc.txt than to any atmel descended SoCs.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

