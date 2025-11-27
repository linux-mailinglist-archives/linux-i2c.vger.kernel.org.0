Return-Path: <linux-i2c+bounces-14302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344AC8D157
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26C583A676A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 07:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A0F31B137;
	Thu, 27 Nov 2025 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T6sK2G2P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE725314A85
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228321; cv=none; b=RvibjADyf9jJ7ABHhsDpCbGUvbtYMUVyevU6vC8p8bXBqIIoeljo3egULO0UV785ERbBlwiykJFkevI+uQdzT6mhzn0k0rQvLJVtch2n2gqFfVJeFnf1yJNoaNL4eEXB/sOgow/CLH5fFRaG1pghbv//ZNXQlU1aJ5HNpqlcIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228321; c=relaxed/simple;
	bh=n+/fQ/alpef2q01Tg3dUfg5Vy/IgYpSrTAPVea67aQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJqkuVbNYTxV5x4Tofzdxc1zXo4VE/4c3qUc3l4IoLf0rrsLRRVJCBlwenf+mmqk5+dVOkO8R8nYKYcIX5a74xWq8+qcyiiSzN9h/Mx5A4PIRqRmT6D/lLZ3mfcOcCtdyNBqpMHZSGukNi7VHXEMuYt11kugnwMdbFRPQZnpafI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T6sK2G2P; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E9D44E41915
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 07:25:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFA276072A;
	Thu, 27 Nov 2025 07:25:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3130D102F2350;
	Thu, 27 Nov 2025 08:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764228314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cGqB1dei6ROTkKi8qgP3hn8JoeylozOmIRsBNS04jmU=;
	b=T6sK2G2PDUeR+pjSQn/B7iQbPsQ8Wcz+0KiAVYYMspcQnDAs6d3DC6Hizs9V61K96ZYwPT
	MWPQm0b1UsKDIypmCvUtC60JluxrkH+WKfFHqqbOoynx7SceksEsqTI49+W0M3NodmM4Gk
	u8QmjuPghMy7oJHohjRpIxX1eawQpRih9ZuMPEQ0h0pbd/nsQLpOja/6nFwVznMd0LaPBv
	3yN/UTBE/8mIG4ZcZxCMsYz+0i+YTYqv3ut760qDTDvCZcBlLg4Ac5kqxAB6N6H2QvWbI+
	NsIGmEU3Ztxx27d5aIFFgytJFUJqMRidqHtr/wVwJFwxkyeW3sUCTEw15Hzcmg==
Date: Thu, 27 Nov 2025 08:24:56 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Kalle Niemi
 <kaleposti@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Arnd
 Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Linus
 Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Alison Schofield
 <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <20251127082456.08542b8c@bootlin.com>
In-Reply-To: <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<20251015071420.1173068-2-herve.codina@bootlin.com>
	<f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
	<CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
	<5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
	<CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
	<072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
	<CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
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

Hi Matti, Rob,

...

> 
> Seems to be fw_devlink related. I suppose if you turn it off it works?
> There's info about the dependencies in sysfs or maybe debugfs. I don't
> remember the details, but that should help to tell you why things
> aren't probing.

All available links are available the /sys/class/devlink/ directory [1].
You can check them to see if each each provider/consumer are correct.


Also, for each device you can find suppliers [2] the device depends on and
consumers of the device in its device directory [3].
for instance in /sys/bus/platform/devices/foo/ for the foo device.

[1] https://elixir.bootlin.com/linux/v6.18-rc7/source/Documentation/ABI/testing/sysfs-class-devlink
[2] https://elixir.bootlin.com/linux/v6.18-rc7/source/Documentation/ABI/testing/sysfs-devices-supplier
[3] https://elixir.bootlin.com/linux/v6.18-rc7/source/Documentation/ABI/testing/sysfs-devices-consumer

> 
> I've dropped the changes for 6.18 for now. No one really seems to be
> in need of them yet AFAICT.

Best regards,
Hervé

