Return-Path: <linux-i2c+bounces-13952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E92C2C276
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 14:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 345964F431F
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 13:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8E1311596;
	Mon,  3 Nov 2025 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iSuStlNC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7802309DCB
	for <linux-i2c@vger.kernel.org>; Mon,  3 Nov 2025 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176914; cv=none; b=YdlOUYqobu7TszdsaXmDa4An47oJ4/Y2w+SjlrUcOPmLpVxmqnHkeybIMKOhXQgQBFKlD5yvgjgv3PP+fFNvkSMzT4TxFuXPnSlwfaC40Yz5luk758Si77XNrDSnq7YhehNlzs04Yqw88KVO9jzoj+zemWx46URCtAGJ2CJYU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176914; c=relaxed/simple;
	bh=HUhCBMZvZipHgUmjcVZ0eOSnMcg+HbQiCeJ/7jxn+Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6p/dLO60d+vtjssYhbMGrfTt+v/z6HcloMASoeQsnvO97hK4x3hSMMuGUEuDVKjpijL/da5jfWHB91CVgzDfuZ/IJD1mqn42ZCUxrl3dn7x4B+0HYI8+H1dN+Bwcy2EubRCnHKz2vys0hke6Kbdxm8WyQfcq+ja+rA21zxZXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iSuStlNC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 11014C0D7AC
	for <linux-i2c@vger.kernel.org>; Mon,  3 Nov 2025 13:34:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0BB160709;
	Mon,  3 Nov 2025 13:35:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F194010B500FE;
	Mon,  3 Nov 2025 14:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762176907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=koLz65BvAsRdOTOjAYYzE2T1rPDi7AByKsxkPawhxGI=;
	b=iSuStlNC/qPWehMW5QtSxmK7/Ek+OmtM952H+Xk5cz64yvAI1dRLRJl2LFnH1Saj3uIcSn
	Tfo0dDHHxzLe5rPhwCbyehjx3KhF+kWXpLRNtBcibrsD5eWlEhe06L8+GQDP7gihuHb7M4
	aMb4hr5u64HA2jT9649n28R3LSuMyiMLHcAn1aj1T2djrGGH2TKUKnNVTaabRGpAWKTAUy
	xDNG39m9CDfMAnKBAqtJttRhZlsDSxkcO7NokNzenCtkiwC6nxpHFV3TZc+Gz2qOhJ3anH
	P5/UUwG3W53ojB0Z3tCqPkFB8BoZl0mckys6ra3FPqO4z9ocBaUZIcIEe7GxPQ==
Date: Mon, 3 Nov 2025 14:34:52 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter
 Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>, Saravana Kannan
 <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax
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
Subject: Re: [PATCH v4 18/29] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <20251103143452.080c3503@bootlin.com>
In-Reply-To: <6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
	<20251015071420.1173068-19-herve.codina@bootlin.com>
	<6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
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

Hi Andi,

On Thu, 30 Oct 2025 16:23:24 +0100
Andi Shyti <andi.shyti@kernel.org> wrote:

> Hi Herve,
> 
> ...
> 
> > When an i2c mux is involved in an i2c path, the struct dev topology is
> > the following:  
> 
> supernitpick: I'd leave blank line here.

Will be added.

> 
> >     +----------------+                +-------------------+
> >     | i2c controller |                |      i2c mux      |
> >     |     device     |                |      device       |
> >     |       ^        |                |                   |
> >     |       |        |                |                   |
> >     |  dev's parent  |                |                   |
> >     |       |        |                |                   |
> >     |   i2c adapter  |                | i2c adapter chanX |
> >     |     device  <---- dev's parent ------  device       |
> >     |   (no driver)  |                |    (no driver)    |
> >     +----------------+                +-------------------+
> >   
> 
> ...
> 
> > No relationship exists between the i2c mux device itself and the i2c
> > controller device (physical device) in order to have the i2c mux device
> > calling i2c_del_adapter() to remove its downtream adapters and so,  
> 
> /downtream/downstream/

Will be fixed

> 
> > release references taken to the upstream adapter.  
> 
> ...
> 
> > +	/*
> > +	 * There is no relationship set between the mux device and the physical
> > +	 * device handling the parent adapter. Create this missing relationship
> > +	 * in order to remove the i2c mux device (consumer) and so the dowstream
> > +	 * channel adapters before removing the physical device (supplier) which
> > +	 * handles the i2c mux upstream adapter.
> > +	 */
> > +	parent_physdev = i2c_get_adapter_physdev(parent);
> > +	if (!parent_physdev) {
> > +		dev_err(muxc->dev, "failed to get the parent physical device\n");
> > +		ret = -EINVAL;  
> 
> -ENODEV?

Yes, -ENODEV makes sense here. Will be changed in the next iteration.

> 
> > +		goto err_free_priv;
> > +	}
> > +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);  
> 
> Not to call twice put_device, I would add it once here and then
> check for !dl.

As Andy already mentioned, we cannot do that. Indeed, dev_name(parent_physdev)
is called in the error path and so the device reference has to be kept.

> 
> > +	if (!dl) {
> > +		dev_err(muxc->dev, "failed to create device link to %s\n",
> > +			dev_name(parent_physdev));
> > +		put_device(parent_physdev);
> > +		ret = -EINVAL;  
> 
> same here, should this be -ENODEV?

For this one, I am not so sure.

The failure is related to the device link creation and probably due to some
devlink invalid internal flags or state instead of a missing device.

That's said, if you really want the -ENODEV here, let me know.

Best regards,
Hervé

