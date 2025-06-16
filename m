Return-Path: <linux-i2c+bounces-11497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2354ADB8E8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 20:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B0CB188F6B1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 18:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8772B28982A;
	Mon, 16 Jun 2025 18:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CkAQbKwL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KEsNygaq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66422289372;
	Mon, 16 Jun 2025 18:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098899; cv=none; b=EqA8B6AQb71Ri3NDSj9ZfDuWznDA1FWdEcRe6GwgzoFTIino25YPe6k3vFTvKQFV+RmDNvi4s7Kl5nWchPG+AiFfdRU3Ntu9q0WA4vPCcFPS2eRR6wOA0+E4m5s6GcBCa+Eh5br5WwEt6xwRMx8t/SLl2YYkZ532s+f8WeA5TpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098899; c=relaxed/simple;
	bh=k3U8hdUVf2mysDGF9j7sGFSXq/NHg1BAR9W4A1e7FBY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=R0yHX9vWn8ZHzu5DVLC7auJIs5n6v+tYJqygR5XTJByStvvaDnO7FZ/y7YTCESq1bC8APlTg+SJwiKpxLXNfBdv3HEs6l8oJ3P7UG2YD+vPm2Kj9Cap8yLkSEmgryOr4kUMy+O7g3tsXeyQKHoi5m727iHxLkqKfmaJ0vsOuWO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CkAQbKwL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KEsNygaq; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 337F0254012F;
	Mon, 16 Jun 2025 14:34:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 16 Jun 2025 14:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750098896;
	 x=1750185296; bh=qRwibQTbtTFkc/qCHLHPXCkbTuwR1ipXTlm5cdeOUc4=; b=
	CkAQbKwLRJX2qandCly0sWKOMtf77gN4MgYUuG+OsOzmG9buhoB1zAZUt2ybs+s+
	WmpvOgS6fN47mDAumZkluDJWBK/0X5X0MWxxxXVGYGEddsSPLnDb4tDzwRPyqEEe
	1TET4TyLtO+8vp8XiTLBs7hxKkuda37K+lr2eXSvmWrkF5ewuuTW1iQdxwTkdmTk
	6eXvfnz5QtT1UDMOK+LVbs1kYSHQrteUiv0qfRYwmQD+FUq/jYyvzyxu4CKBn/G7
	yQkaK3WsuaL9pK8PdvLge8pbRkN1dCtXTgWmBXfDFQp2PJPRo8PNd1aYg+s3DHeI
	YFB789jS8Qab+ttLYZ/O0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1750098896; x=1750185296; bh=q
	RwibQTbtTFkc/qCHLHPXCkbTuwR1ipXTlm5cdeOUc4=; b=KEsNygaqVgj7WbCwZ
	Lkvakt2piIfCMaBt1ZbJrSwo4TK7oIkyX4Uoa9XJkgfm1OQP+3u1brIo11UMHbL1
	84tfEe8rsX9Q3gIlO4CAxB2hm2py3yaD8D5YdOUIVdpWbaLmFIopaUFhBbzTs/qe
	kUTiISvnEf5hjsrwF8mFI49VrSwxA4CnQw01e/+H5PaxqtIQa3SQ3iUwbxKtmZeb
	ZEnrDwtSNoPspZvBlo3k7hGL85lsrP4TdTtDQ+qF7Xb3o8DBwzPsKR0WobtUQwt2
	foTLiVMGGX7ZCjuRShvV4eFXAxLJSicbiC+3IxzCRFEqsUSxJqv1SwcRh4l1Rs4u
	q28pA==
X-ME-Sender: <xms:zmNQaIO0hvU2mt4H2Xvk5AnX0iB1kD8BTIM0kmdEAL52qNH_X7Zt-A>
    <xme:zmNQaO-pQtuwcQxZUMYxJEK6v4sPWP1MMPZ4mTg4DyfSTda8L3t54rfvrxWL8zo-n
    VTn7Y50tNPm6fcmkVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrg
    hupdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvkhhouhhlse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhmrggthhhonhesmhhitghrohgt
    hhhiphdrtghomh
X-ME-Proxy: <xmx:zmNQaPRswyGdepgzEcq8ZxPpnVu2Wrc6-oOZ7im99CjLcZTGH4eBjA>
    <xmx:zmNQaAsI7EG80DBY_yZ4XKwGWgi6xUtMqBQBeetDFZIs5zE557ilxQ>
    <xmx:zmNQaAcTIVEBWFXjvaHxr56Nf0Ub6-2ApA-P1suW0_0LL4_J5QTA6w>
    <xmx:zmNQaE0AiF_i6R0owGd_wFWswJPr2jjUGwz6T9iv27LgZiCo4HITeQ>
    <xmx:0GNQaAnKS3ebf6Eh4ZHo3SUihb-d9QthvKL2qiqOPzxP4wLM775-Y9gS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 87E5E700062; Mon, 16 Jun 2025 14:34:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tad13d72cbf59a799
Date: Mon, 16 Jun 2025 20:34:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Marko" <robert.marko@sartura.hr>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, ore@pengutronix.de,
 luka.perkov@sartura.hr, "Daniel Machon" <daniel.machon@microchip.com>
Message-Id: <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Subject: Re: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
> This patch series adds basic support for Microchip LAN969x SoC.
>
> It introduces the SoC ARCH symbol itself and allows basic peripheral
> drivers that are currently marked only for AT91 to be also selected for
> LAN969x.
>
> DTS and further driver will be added in follow-up series.
>
> Robert Marko (6):
>   arm64: lan969x: Add support for Microchip LAN969x SoC
>   spi: atmel: make it selectable for ARCH_LAN969X
>   i2c: at91: make it selectable for ARCH_LAN969X
>   dma: xdmac: make it selectable for ARCH_LAN969X
>   char: hw_random: atmel: make it selectable for ARCH_LAN969X
>   crypto: atmel-aes: make it selectable for ARCH_LAN969X

If the drivers on ARCH_LAN969X are largely shared with those on
ARCH_AT91, should they perhaps depend on a common symbol?

That could be either the existing ARCH_AT91 as we do with LAN966,
or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.

    Arnd

