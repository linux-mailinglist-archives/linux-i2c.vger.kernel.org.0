Return-Path: <linux-i2c+bounces-4292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A769142E6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 08:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A28B284B58
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 06:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7654B38DD2;
	Mon, 24 Jun 2024 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y2dSdUb7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FDC17BB6;
	Mon, 24 Jun 2024 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719211154; cv=none; b=MZ82xCP4/ZPPr2JT8apkvbUfmDwBHwfF2wYgALs+m47U+dLAvdDHC0iLDzj7UxxAGrn5QgA/vrWnwjQQeMnBWQVL0P15AXqwXWzXnh411zdhku/dyCMCOl87E46cg++UghFGwlapR3QEnPppKKxMSaNcEN/0vhgvQ+K/DglOAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719211154; c=relaxed/simple;
	bh=8qQNy0cFi+vB5Mfp2npnGPe64P5YepXPolFgKOS6juw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iqDFfLV+1he0f4Xhhh3vw6m40jyRZ+5iGfaEiBJwJsEpMKwXNK/xXK6QN/MIL6fwrXkjBOJfUY/M1WV+rW3AGGD3dTA4R4uXsPIp0AwxjqwEYPhpG95cunrQrLoC1CjF7sPNlpc9IxZjKQNeN73HPWSDZPo3t2g1Mk2emfK6JOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y2dSdUb7; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1221C0006;
	Mon, 24 Jun 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719211148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qQNy0cFi+vB5Mfp2npnGPe64P5YepXPolFgKOS6juw=;
	b=Y2dSdUb7L45w0zOH/hMoZ0jqJMRt2RztXSF8cdHFJOQrvsC2d2TrOTWPfcBntkFhwN7H6/
	hRjUcA+3RSAJ94uif8HqhAvbCWQJYiR+SVkX6EFFrYPEr/FW5wId9XKqYNzTH1dx6WDGG0
	EpHqQyHHRgNy3VsxGvF0BTOq9xL4A+TxAGxtKMeEP3applLc9/8N0v4h797ONHvRbmXNoB
	xidj39GDhF0L9I2O/NKLPWLoLxYKqnfunm/ZzhUtmDxgyWbMCW+SkvuckBwxpEg80TiaAu
	EQMC92N1cUsplO1EO00oEc1qOUwmVwAOuZV611xRbhs1I+WiDGN7XvJsNyxmEw==
Date: Mon, 24 Jun 2024 08:39:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li
 <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, Chancel Liu
 <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, Markus Elfring
 <Markus.Elfring@web.de>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
Message-ID: <20240624083900.14e38d82@xps-13>
In-Reply-To: <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
	<20240621103019.783271f4@xps-13>
	<CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Piotr,

piotr.wojtaszczyk@timesys.com wrote on Fri, 21 Jun 2024 14:44:21 +0200:

> On Fri, Jun 21, 2024 at 10:30=E2=80=AFAM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> >
> > Hi Piotr,
> >
> > piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:
> > =20
> > > Move away from pl08x platform data towards device tree.
> > >
> > > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> =20
> >
> > I don't see any change regarding the NAND controller node in the device
> > tree, is there any dependency with other patches from the same patchset
> > or may I apply this directly to nand/next?
> >
> > Thanks,
> > Miqu=C3=A8l =20
>=20
> Yes, this patch depends on "[v4,04/10] ARM: dts: lpc32xx: Add missing
> dma and i2s properties"
> which will be splitted into two or more separate patches per request
> in the comments.
> I'd like to keep driver changes and corresponding changes in DTS in
> the same patch
> but I've made a separate patch for DTS per request from v2 of the patch s=
et.

These changes won't be applied to the same tries so they must be split.

So I will not take this patch for the next merge window and instead
will take it for the one after, if the DT patches have been applied.
Please ping me at -rc1 again if the DT patches have gone through.

Thanks,
Miqu=C3=A8l

