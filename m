Return-Path: <linux-i2c+bounces-10248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05EA839D6
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 08:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 713FA3A20C3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 06:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3457204697;
	Thu, 10 Apr 2025 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Mwkv66tx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E091D5143;
	Thu, 10 Apr 2025 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267700; cv=none; b=hFZTa/11fbXZqL3QFkUf69uy7rL7JUtCNL4Ct5JfaYvH37kQ9ewgFEZG8S982sYrrE53X3iracGqHJTZa/NcTau1eL1dHLfTbmodoenjfLjR9VOjucIO7audFXAgRX9pu8Pau/A1C3+rqywu4csddqiNUDHo9CdKiBclDqeZN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267700; c=relaxed/simple;
	bh=C5ec5lNyuqtEj/fcsCGEIrivAFsHAGSQ3zeL0mFILag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxjtAqlMAAn5MOfDQGZPcaYT1i2wQ2HFh0ncDhgfr64NFi4Wt5pzdaUQLD/l3xsUGm91LxbSgsMFyvDkGXlryyrO5MbgHe8Uuw46uVz8vZdP/kCNmTpSemZakJ8CZhJVziLiFmhEEA47vMeP6rf6PdU5CPDfTzdSKazaWSSOP/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Mwkv66tx; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B5F4433F1;
	Thu, 10 Apr 2025 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744267694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cb7IK28fqEaigcH00aeaSLMccq7nNJere64F79CGyO8=;
	b=Mwkv66txch40E6HcDevxLYZTrvLuTp8ktqfEwmvtNg/7fATJe9Enq5Pl4FboeK0VzIrNA3
	42gz3ZOndZbTsKbnCSq9uIQNaf0wt0lEtOkGJWkO2fqBLqrFyxDvS5GD2FBLfCZxj0URQD
	gZ1QyODj5QmRHH1WQ/OwA+1UyCoY/MWGdd/wsd3BLh5Lobmsbs58f3VQJD1YnOtJGrhnvB
	pqQC/Y6BGqq4QwCrX1TEUNCgimIX/wdjzqN4xOcBC+NWqijh5yLav3QVqI8VrZCYAJFaxu
	bCUFbybtq2gwlHLAz0eU1h7vuZ+O3zuLe8GkHZMakPNnWzfnozRO/3gROFUD8w==
Date: Thu, 10 Apr 2025 08:48:09 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, Derek
 Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark
 Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
Message-ID: <20250410084809.1829dc65@windsurf>
In-Reply-To: <c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
	<20250407145546.270683-16-herve.codina@bootlin.com>
	<19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
	<20250408162603.02d6c3a1@bootlin.com>
	<D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
	<c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
	<D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
	<b1b33000-4c10-43cd-bcf4-d24fc73902b1@lunn.ch>
	<20250409161444.6158d388@windsurf>
	<c6257afe-36bb-46d8-8c22-da3b85028105@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com

On Wed, 9 Apr 2025 17:03:45 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> So it only supports a single .dtbo. In its current form it does not
> scale to multiple .dtso files for multiple different boards built
> around the PCIe chip.
> 
> At the moment, that is not really an issue, but when the second board
> comes along, some refactoring will be needed.

Indeed, but that's really an implementation detail. It doesn't change
anything to the overall approach. The only thing that would have to
change is how the driver gets the .dtbo. We could bundle several .dtbos
in the driver, we could fall back to request_firmware(), etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

