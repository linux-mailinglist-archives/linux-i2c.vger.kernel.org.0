Return-Path: <linux-i2c+bounces-15069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD5D13524
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D17E306F8EF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A342D8396;
	Mon, 12 Jan 2026 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iUXN7uSf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D82C0272;
	Mon, 12 Jan 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229278; cv=none; b=uHg7XXZYivJ3iDf97bIcPmtn/5mP5wxM/rmMVUxKDtbUnuhOx5DAgjJTSlLCHEDLGyZtevYxePLqtIq896PPBN3nP77YDa0DsYbEArQrKWWNJA7+95hGIC7VbIvUMYW/PmiqIT0urm6vHgkxThnaWSGjuAkRVGolxln/elyvM3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229278; c=relaxed/simple;
	bh=nUGXhmxfk4xVstkedOcb8jdC/4d8W+cXsb3tcmVsSFc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ben6dkvqyniUjb21tjEwpevylp4fyRujP0lOpVPxKxLirB9XW/bIAjBmUmDwgVtPUFL5I1PUGiywgx5xmZFvSqwcdUtm+yEN9qz3fJ6TmPctCbJ4z+tS1MNmWEsPAk/S9B1fZ4nefmcs6urXkiXVU5ZA/26AswsA7Ai4QoZN+Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iUXN7uSf; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7334E4E4207F;
	Mon, 12 Jan 2026 14:47:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42F05606FA;
	Mon, 12 Jan 2026 14:47:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0B3F103C8A5B;
	Mon, 12 Jan 2026 15:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768229271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q/WLPrz5mCQaWOceOk8Ks2oQ15KuKRHou0wGW5c209g=;
	b=iUXN7uSfeXgQl4nNnPIxxArDY5Gzbwtk5FBobBJO+ueYTKc1/BEPsvLsksdtAAQpqIsWQO
	/cnIaP1yp40XU+4otLwInaG3Ccgw4ZjdYuBZpKDSxPUmWLKE7SIJzjlyOttIjV5+FmXYBq
	R26TBX76EEVjpW2JNaMKjbn9Bg5Hc0m/7+OqUYza1Mg8WIkIk5gJ9KPNwyEZMv8Yjfzikr
	sTt+xW+RYnH9eZug2OQgC+nbK+tcnBHgnDLk+ZgL/pp++VYX0gvJquvTFjdbT3L5ZBtzCj
	N8BCh1TaOXz9DcWQNxj+3/dOOdCe3qyYIz/NXGcGMfeq+14pb1zJbp2/pCkjtg==
Date: Mon, 12 Jan 2026 15:47:31 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Saravana Kannan <saravanak@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Kalle Niemi
 <kaleposti@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Lunn
 <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Arnd
 Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, Alison
 Schofield <alison.schofield@intel.com>, Vishal Verma
 <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
 <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
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
Message-ID: <20260112154731.6540453b@bootlin.com>
In-Reply-To: <20251211161902.11ef4248@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
	<CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
	<5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
	<CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
	<072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
	<CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
	<55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
	<20251202102619.5cd971cc@bootlin.com>
	<088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
	<20251202175836.747593c0@bootlin.com>
	<dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
	<20251204083839.4fb8a4b1@bootlin.com>
	<CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
	<20251210132140.32dbc3d7@bootlin.com>
	<c50c40cc-69f6-436c-a94e-94a3a10f6727@gmail.com>
	<20251211132044.10f5b1ea@bootlin.com>
	<1b9fa77b-d74a-4fa7-b2e7-8b389d59a5a0@gmail.com>
	<20251211161902.11ef4248@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Saravana,

(+To Saravana using his new email address)

We still have issues related to devlink and overlays.

In order to move forward on the topic, I think I need your help.

Can you have a look and share any ideas to fix them?

On Thu, 11 Dec 2025 16:19:02 +0100
Herve Codina <herve.codina@bootlin.com> wrote:
...
> 
> IMHO, I think the issue is related to overlays and fw_devlink.
> The distinction between "a new node is going to lead to a device" vs "a new
> node is just data and will never been attached to a new device" when an
> overlay is applied is broken.
> 
> This is broken with the upstream "treewide: Fix probing of devices in DT
> overlays" commit I've tried to revert. Indeed, on the LAN966x PCI device
> use case devlinks created are not correct with this commit applied.
> 
> I am not sure also that devlinks created with a more complex overlay will be
> correct. For instance, Matti, with your overlay not sure that a phandle from
> the oscillator node referencing the pmic node will lead to a correct
> provider/consumer devlink between the pmic device and the oscillator device.
> 
> On the other hand, this is broken with "of: dynamic: Fix overlayed devices
> not probing because of fw_devlink" works for the LAN966x PCI device use case
> an lead to correct devlinks but breaks your use cases.
> 
> Does anyone have an idea about how to fix those issues?
> 

The commit "of: dynamic: Fix overlayed devices not probing because of fw_devlink"
can be found in this series (patch 3)
  https://lore.kernel.org/all/20251015071420.1173068-4-herve.codina@bootlin.com/

Best regards,
Hervé

