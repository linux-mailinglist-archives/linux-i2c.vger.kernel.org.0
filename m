Return-Path: <linux-i2c+bounces-1830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FBC857B2F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 12:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37AEB1C23E67
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 11:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD785823E;
	Fri, 16 Feb 2024 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pu19fIin"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37501535DD;
	Fri, 16 Feb 2024 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708081764; cv=none; b=mIOrDdBt3xsLQaj31Rksv0VA1uBRpUnnR1gvlbNGVLjOE1wz2Olyykb5qoyHvzrqTyp+4JWPdGm/AP1FHJpGhthkruZu37x9PfK4njsTpnUn5+QSPuVKTvj0f3mcEmG0Pvx+SPR+LWqT8MHrw8l257LO8VpzDuOgdo7aTLfmffw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708081764; c=relaxed/simple;
	bh=VoIm7bG7xdxeX1Ve84YA5mgH1w68YbeyVDn/kcEb2Ns=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=L1KetItU0In3bjJ9P56MH/J+Eljapb8yABLYD7ebsKJFXLfwJHKu2s4diUeum693Erq/0arlDlgN7lxBub/TpZ0dLSBpfyd3uXt0Faml8Copqbg+4b0zdXf6vK+QpdAVFbiNNgiOhdiBbtn3+fFZmlxjwCin5ytUrt9rp6cyo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pu19fIin; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1D3EFF807;
	Fri, 16 Feb 2024 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708081759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoIm7bG7xdxeX1Ve84YA5mgH1w68YbeyVDn/kcEb2Ns=;
	b=pu19fIindWoyvl+UGjcMcq0t+6LJjVczMtqO7ZZb4KGzFo4HYYZa89THhOrO2/5B+ftg7b
	YjSeimNZDgnx7EQscGzkSBZcYAS6+CezQS8UgDZiuHuaOnObzJBP20rocAZNF8IomgpHA2
	Av5ymPoGLmO4ztX+HCX1kn3h9Bkg26z1b6omSa6oJlDiQafr7OX2mSBONtWifEX8frY17p
	yHiYMKESalbmWEcskaoL+yv2hXLk6GWqU3RsrzopcgLnCFiBa/mEPgJD5GaD1mHTQtatb7
	VRK1dcwRCRGRgUVjrrMGy7jr3GNvaLoGb1imMlWSxUCstw1pmHELoBGOiNulnA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Feb 2024 12:09:17 +0100
Message-Id: <CZ6GG6OQUJTX.2OM5TC9YLOAXV@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v3 18/18] PCI: j721e: add suspend and resume support
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "Andy Shevchenko" <andy@kernel.org>, "Tony Lindgren"
 <tony@atomide.com>, "Haojian Zhuang" <haojian.zhuang@linaro.org>, "Vignesh
 R" <vigneshr@ti.com>, "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Janusz
 Krzysztofik" <jmkrzyszt@gmail.com>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Peter Rosin" <peda@axentia.se>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, "Rob Herring"
 <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-pci@vger.kernel.org>, <gregory.clement@bootlin.com>,
 <thomas.petazzoni@bootlin.com>, <u-kumar1@ti.com>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Thomas Richard"
 <thomas.richard@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-18-5c2e4a3fac1f@bootlin.com>
 <aa791703-81d8-420c-ba35-c8fd08bc3f07@ti.com>
In-Reply-To: <aa791703-81d8-420c-ba35-c8fd08bc3f07@ti.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri Feb 16, 2024 at 11:48 AM CET, Siddharth Vadapalli wrote:
> On 24/02/15 04:18PM, Thomas Richard wrote:
> > From: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> >=20
> > Add suspend and resume support. Only the rc mode is supported.
> >=20
> > During the suspend stage PERST# is asserted, then deasserted during the
> > resume stage.
>
> Wouldn't this imply that the Endpoint device will be reset and therefore
> lose context? Or is it expected that the driver corresponding to the
> Endpoint Function in Linux will restore the state on resume, post reset?

This does imply exactly that. Endpoint driver must be able to restore
context anyway, as system-wide suspend could mean lost power to PCI RC
controller (eg suspend-to-RAM) or PCI rails (dependent on hardware).

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

