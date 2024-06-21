Return-Path: <linux-i2c+bounces-4178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF18911ECB
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 10:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A6B928244B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 08:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EA316D4E6;
	Fri, 21 Jun 2024 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EljBfq25"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9AA126F02;
	Fri, 21 Jun 2024 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718958631; cv=none; b=fIPnXNq6zAqOPij3c05scsq+Zs7cp5LbS+9QQ47bb9AtP/pYy6CO1k6Q4S8VJXy2ALj/z822RHJcLWhYxfYgy4eMnLcZyu/L0kxLEAqGbgDNExStAXxlzTfaaAA8/C1kuSpIiVJCGBMtI8NjjT7y656K5T3z7xLErJDbRpLqsmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718958631; c=relaxed/simple;
	bh=vSTWYIkS8dZPp1gyV6GgsipcJv/f0Yiu+CBMvpyDKyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mf/WnRPdGRosG/aoe8vzdKDkYGXBaCXVkLWq8pB120YT9bCD/REodQFzL5alEMF1W+MT+V3caBIGq40Y3Sn0tGKuP2o05+zL3NZ5jLXxIU3lJ2DhATgsoPqtMWii4qndXRC7lQtKyMu6ijqKfUO6fGqsCI0YiuWORfyN5EzrDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EljBfq25; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A3F020003;
	Fri, 21 Jun 2024 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718958625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSTWYIkS8dZPp1gyV6GgsipcJv/f0Yiu+CBMvpyDKyU=;
	b=EljBfq25UCP0bJHtLSMj6/zCXY9oAvfd8m3m3+oKaAfE3R3qGzQiLP70Dtf5/E0BjVhlr2
	3kYdj9Zcv07uvUjSc4PGieGFVRuZUnscRqClY9e/dC3+32DNYqrg906mhGNAV5dsydSZgJ
	j7J764uUg9PaG/QdPDX592lZI7xKQ5B2ClV75xzBfXbuB3zLdIpVqHskurQKcAnpdiWewl
	tpt0EvOPrnXwY7VIkoAA1L3G8YNvuSl+O84XjndxPwFS4GJ7mxjNtxLKG6RvpNnEUyw/Ym
	ukwKPd7JhZmPkutWlro7UbvnVkRYcyRd+4x/8l1ml1W5kY1Tk29IDHTpcFDWyA==
Date: Fri, 21 Jun 2024 10:30:19 +0200
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
Message-ID: <20240621103019.783271f4@xps-13>
In-Reply-To: <20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
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

piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:

> Move away from pl08x platform data towards device tree.
>=20
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

I don't see any change regarding the NAND controller node in the device
tree, is there any dependency with other patches from the same patchset
or may I apply this directly to nand/next?

Thanks,
Miqu=C3=A8l

