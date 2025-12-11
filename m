Return-Path: <linux-i2c+bounces-14509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECCCB64DD
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 16:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CA9D3033DDD
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 15:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EFB2FF64C;
	Thu, 11 Dec 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GZ04GN+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDE2F6579
	for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466366; cv=none; b=dLbq0OZYcv0MaVgzGB1Jjys7liyIlmDKJfbmfLAUmjqNc54AkvYZ7V4wVEyXwKBQVYCcXhRmiLBSMjyw/93GBOq8zWRpQA+FzFEOdPbI8AOAT/ctrrSXjhDw4MtOREUKlUvV0viaq0Hfz9MMXvjkWbihNV2koWBqrlzomamAWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466366; c=relaxed/simple;
	bh=fWpmLL1z7q9BxSPVUYz8JHtTujuBUEm3CzFbbQaDgtc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjGR9AdkR5Zm0Py/M6B+dh3Uanst0wXn8Pa4N9IXiczW3kU1tOdc17aXsfM8XoInM3AZB44KP4UYxOCS2GK7tgJLHeChf07hi7BTbhVaVKyc9PzrtXB3xJZZQKENPUPVoUHI5h32ffC2ZbOL9pXy1z5lG8y3absxC/Dlz6J/e9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GZ04GN+Y; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E0684E41B7A
	for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 15:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDAF160738;
	Thu, 11 Dec 2025 15:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 641CD103C8C7B;
	Thu, 11 Dec 2025 16:19:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765466359; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7YFG4wLJmjR/E/MqOc1NCEw1lot9ZBUWy77cdvC/abM=;
	b=GZ04GN+YsE0cv0BQQYoZpyVYAYEsovdzJ9rXmDON0bJIZxnJU7VPl2eg1p8e0NQ9k+K5Dp
	/LRca+qQVGSjdqk8rZVoLiG+Y+sqtI/yxaymDKJc9jZxsUrEC0ffilz5i/Pg3I8zRmwpJS
	taMVcM89WUFFX51Ek3tAsGArlvFRqyRVPdmd6IrgjHKE7xrG4LzqbztURSYcKnyHSuVeO0
	J67fZCzMN/AGR3a33M4QUHtoTEJbjcuY3+UKEhaz2RTDuiDFFZpLeGkOJMjJFnFSz1vbjo
	hs+44nERIBIh7DW/ujTn09iVGaGgu0W9sZBJpf2sMe5nwN92PyYkCL/V4aE1wA==
Date: Thu, 11 Dec 2025 16:19:02 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
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
Message-ID: <20251211161902.11ef4248@bootlin.com>
In-Reply-To: <1b9fa77b-d74a-4fa7-b2e7-8b389d59a5a0@gmail.com>
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

Hi Matti, Geert, all,

On Thu, 11 Dec 2025 15:52:28 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 11/12/2025 14:20, Herve Codina wrote:
> > Hi Matti,
> > 
> > On Thu, 11 Dec 2025 10:34:46 +0200
> > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> >   
> /snip
> 
> > 
> > Do you see the same trace with:
> > - "pinctrl-0 = <&i2c1_pins>;" in your overlay
> > - fragment0 removed from the overlay (i2c1_pins definition removed from
> >    the overlay.
> > - i2c1_pins node defined in your base DT.  
> 
> Just tested. The i2c1 appears and the test-overlay probe gets called, 
> when the i2c1_pins is in the base-dt and not in the overlay.

Geert, do you expirement same results?

> 
> > In other word, is the issues related to adding a pinctrl sub-node (pinctrl
> > pins definition) in the overlay or is it something else?  
> 
> Seems to be related to the pinctrl.
> 

I don't think that the issue is related to pinctrl itself.

IMHO, I think the issue is related to overlays and fw_devlink.
The distinction between "a new node is going to lead to a device" vs "a new
node is just data and will never been attached to a new device" when an
overlay is applied is broken.

This is broken with the upstream "treewide: Fix probing of devices in DT
overlays" commit I've tried to revert. Indeed, on the LAN966x PCI device
use case devlinks created are not correct with this commit applied.

I am not sure also that devlinks created with a more complex overlay will be
correct. For instance, Matti, with your overlay not sure that a phandle from
the oscillator node referencing the pmic node will lead to a correct
provider/consumer devlink between the pmic device and the oscillator device.

On the other hand, this is broken with "of: dynamic: Fix overlayed devices
not probing because of fw_devlink" works for the LAN966x PCI device use case
an lead to correct devlinks but breaks your use cases.

Does anyone have an idea about how to fix those issues?

Best regards,
Hervé

