Return-Path: <linux-i2c+bounces-4967-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD592FB83
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 15:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C453E285CF8
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 13:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2961D16F903;
	Fri, 12 Jul 2024 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BVODHXoM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BECEAC7;
	Fri, 12 Jul 2024 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791293; cv=none; b=aAkq6+iK3JWXYZ8tJ3zCmu9SWJrUVFke/ajuZM9zxU+eGy7awbUld+Zz+uvPS0Z6zhk1BcdnSvvUBZL/HK6sihnOIkHsbFkaW8YsCRz3lCJdrFfupAcgEL7KWDGmGxTzhhg6M7OugTaCGTg0I8llJeeVFW8Ft9gGWBP5rK6vsFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791293; c=relaxed/simple;
	bh=yLguL9IS/tTpZo82sbn8FxthUie+o8Bk4E2qK1Cergs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7Gcvs+5lsJbt3UBpW66MaNrNz6gEgIZ94dxxJcrXfcvRB+KSoF6SmSL3GwTa7N3y8FFR8ROzEWyUh0jjzHepOYrpj6ipVjCaLN/8j5j1GbqJtumRmiZfqPZC2rznWANWHTSFEoYfJPN1XX6S0pXM8OqMukHgjiX/GWk6Nwj430=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BVODHXoM; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B28F40002;
	Fri, 12 Jul 2024 13:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720791289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsIQ40b9k5VvrZKyuXL7OJ2FO+xOflyP76hRNF0J6zA=;
	b=BVODHXoMJ06+cRjiYiP5PkKZqMfnTd0SHEHEZ/AbF5SbGOmDuiz+FsyWyYeHKo9ohZbicb
	5ODll117HMaIK+GgBbfJLlQ2bWtcXYNRlFa3OvVhmtmwL5uEp9/wgeWfFYpho70ZAqSHoR
	vY8YY0wAp0i8CBGh2T8+lLhWxXvLTzQ3i8sWcAe8Wp31VEGXv4nyukDwEiJN222Eg2yMFZ
	aKceAkB79SYoexDrzd5alr4Idb5IrMGjOHHjT6PjPqVipmOQHr4GDPzJfA/F8vLLDqw2ip
	vom/FeYbQErkaKIAettZJwR+bw8tmxCpe4a8dCe7Rc/H1nJm+Uo4P6w7hAD5aQ==
Date: Fri, 12 Jul 2024 15:34:46 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, kernel-team@android.com, Wolfram Sang
 <wsa@kernel.org>, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 0/2] fw_devlink overlay fix
Message-ID: <20240712153446.37e26d34@bootlin.com>
In-Reply-To: <20240423103924.366eba43@bootlin.com>
References: <20240411235623.1260061-1-saravanak@google.com>
	<20240423103924.366eba43@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Saravana,

On Tue, 23 Apr 2024 10:39:24 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Saravana,
> 
> On Thu, 11 Apr 2024 16:56:20 -0700
> Saravana Kannan <saravanak@google.com> wrote:
> 
> > Overlays don't work correctly with fw_devlink. This patch series fixes
> > it. This series is now ready for review and merging once Geert and Herve
> > give they Tested-by.
> > 
> > Geert and Herve,
> > 
> > This patch series should hopefully fix both of your use cases [1][2][3].
> > Can you please check to make sure the device links created to/from the
> > overlay devices are to/from the right ones?
> > 
> > Thanks,
> > Saravana
> >   
> 
> I tested the series.
> 
> On my Microchip use case (i.e. DT overlay on a PCIe device), I observed that
> some driver removal were done in a wrong order. For instance, the onboard
> PCIe device interrupt controller (oic@e00c0120) was removed before its
> consumers.
> 
> I enabled debug traces in core.c and observed that many links were dropped.
> These links are related to pinctrl, clock, reset, interrupts, ...
> I have the feeling that these links should not be dropped.
> 

Have you made any progress on this topic ?

I haven't seen any updates.
Maybe I missed something.

Best regards,
Hervé

