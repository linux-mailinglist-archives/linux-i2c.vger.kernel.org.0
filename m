Return-Path: <linux-i2c+bounces-13565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E20E6BE1E27
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 09:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 675C53525B4
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41202FC020;
	Thu, 16 Oct 2025 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xl6puIqw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EC19D093;
	Thu, 16 Oct 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760598682; cv=none; b=VA/w18j61QdnE+nbjd9gXLYspbaF8+zV1eL8Vzp9MZd9p6PSEe/HSoY4/pWwgJmj0T9hz9it/QlDhrSeAaqeWkBlPN3d4ni4zNTHnWCoi5Ts41VTXV7lq9SOobSdM7cUJvRa+svYCZoZoMWIBWdFHLoA3tMGySzSNXxlydPNhWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760598682; c=relaxed/simple;
	bh=S5n+qpsscDjW5cWlFIb24b994NahAmVyHJlxX5ZgmI0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MP0ht2Zc/5XZSvzeLBI3mkcXCi6Rv+s9hff/MD+v6BaLHGkzN02qKYX4AraQUUd2ciPDUKjBwFx8qT8fdwuowx16F5oY2A3LrtuJlHV4FeYn8RpauZ2ZE5BRAV3B/GHOeKmwUlJJSSUHBztyiqUAJFASpW+sE7tZ2OyUo2X+lvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xl6puIqw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B717F1A1412;
	Thu, 16 Oct 2025 07:11:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8AFA66062C;
	Thu, 16 Oct 2025 07:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4380A102F22EB;
	Thu, 16 Oct 2025 09:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760598677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YpTs18kzL0FVofrz6X8mkbve4Dj6qKyO1iYY8JESMfo=;
	b=xl6puIqwO12E8Ijm35NKB3pin3RrwW5hAM67oX/vgmE3tfH2X2VDvbGZZv08RPvaf9SJbh
	MZQnMJ3yLho8uyi+t94vWsDB8Sme6ldUcYUhrnjRsRBoSeixGMd3Cq2jSEJGoxbwEj2+Tg
	XHdWDHkKiDgOTMknz5+wWhD512Ov1yMDWHYnVzzD5+SZ8iy09ntuQhJqwKc+NPuQN1JGPB
	KNKMiAYSe9ztTiVSdpOMAFuqx9j2eiLtAPsRLC5psvR0OLbt3IIgkxeE0PLjP2UVAZaUCG
	pr09XXRZdBO0Z671dVQKfhtegoCsl1a/BcsXVOS/+LgmaJo95BiYdWkihPcmkw==
Date: Thu, 16 Oct 2025 09:11:06 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, =?UTF-8?B?TWljaGE=?=
 =?UTF-8?B?xYIgTWlyb3PFgmF3?= <mirq-linux@rere.qmqm.pl>, Jonas
 =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>, David
 Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <20251016091106.14499fab@bootlin.com>
In-Reply-To: <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
References: <20251013060018.43851-1-clamor95@gmail.com>
	<w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
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

Hi Andy,

+Cc David Gibson 

On Thu, 16 Oct 2025 00:50:47 +0200
Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi,
> 
> On Mon, Oct 13, 2025 at 09:00:15AM +0300, Svyatoslav Ryhel wrote:
> > Implement driver for hot-plugged I2C busses, where some devices on
> > a bus are hot-pluggable and their presence is indicated by GPIO line.
> > This feature is used by the ASUS Transformers family, by the  Microsoft
> > Surface RT/2 and maybe more.
> > 
> > ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
> > that line through optional dock accessory. Devices in the dock are
> > connected to this i2c line and docks presence is detected by a dedicted
> > GPIO.  
> 
> This is a resend of the previous series. I want to understand
> whether this effort can align with what Herve and Luca are
> working on. I have not looked into the implementation details
> yet, but I want to avoid overlapping or conflicting patches.
> 

Here, in this series, a fake i2c mux is proposed to handle this case.

This can work if only i2c devices are added by the dock on the 40 pin
plug. If this 40 pin connector provide other resources or busses usable
by the dock, the fake i2c mux will not be enough.

Even if this fake mux is accepted, we will not use it.

Indeed, in our case more resources are provided at the connector and are
used by the addon. We have:
 - Some gpios used as reset and interrupts on the addon
 - One PWM
 - Two I2C busses
   Described and handled at connector level I2C extension busses.
 - ...

With that, different addon can be connected. We detect connection
with GPIOs and identify the addon connected thanks to an I2C EEPROM
available on the addon.

On our side, we handle this case using:
 - A connector driver
   This driver handle the connector. Its purpose is:
     - Detect insertion an removal of the addon
     - Identify the addon
     - Load a DT overlay that describes the addon

 - A DT overlay describing the addon
   This DT overlay has to be board agnostic. I mean from
   the addon point of view, only the connector is known.
   The addon DT describes devices connected at the I2C bus
   available at the connector but it shouldn't have to know
   if this I2C bus is i2c3 or i2c4 in the base board.

To do that we introduced a first draft of i2c bus extension implementation [1]
and its binding [2].

Also we introduce export symbols. This is the main blocking point.

Having the export symbols feature working with device-tree overlay has been
a no go from device-tree maintainers Rob Herring and David Gibson (dtc
maintainer) and we need the export symbols feature to have the addon
described.

Luca did a really clear presentation at ELCE related to our issue and explained
the purpose of i2c bus extension and export symbols feature. His slides [3] and
the video of the talk [4] are available.

Discussion is ongoing related to the export symbols feature [5] and depending
on the conclusion of the discussion, the binding and the implementation of
i2c bus extension could change. This is the reason why I didn't send a new
iteration of the I2C bus extension binding and its related implementation.

IHMO, export symbols feature is the key to unlock the situation and move
forward.

That's said, if you want a more up to date i2c bus extension binding and
implementation, I can send a new iterations but you have to be prepare for
changes in the future. Again, depending of the conclusion of export symbols
feature discussion, the current proposal for i2c bus extension binding and
implementation could be obsolete.

Feel free to ask for more details if needed.

Best regards,
Hervé

[1] https://lore.kernel.org/all/20250205173918.600037-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/all/20250618082313.549140-1-herve.codina@bootlin.com/
[3] https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status.pdf
[4] https://www.youtube.com/watch?v=C8dEQ4OzMnc
[5] https://lore.kernel.org/all/20250902105710.00512c6d@booty/

