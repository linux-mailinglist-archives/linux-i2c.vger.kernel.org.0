Return-Path: <linux-i2c+bounces-7183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7716298D27F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 13:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BD711C2184B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD581EC012;
	Wed,  2 Oct 2024 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="K/dTrnka";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g1iFVfSy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3DB126C1B;
	Wed,  2 Oct 2024 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727869905; cv=none; b=jDTg4MATuG9Q9ZXWS9UZrbqL6DIqTx88h7eOgbkmOLliBlFEtAw2avqe3oN+mv+U/6KC9ElWqYgcpRRzzknE5rXDRQNEqHAvt+ZrjXC9mLlFqIDIJWU20e1sgqtUCVgpj15ufPj8UkkONjCfvZvtOia1vP7b6nsWKwf6yzR/KDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727869905; c=relaxed/simple;
	bh=V7pDiJpgnJ26rr9UgpKNfaKVbuDGau2nGqO2BmWTrq0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pXUlepkYrRKDbIOLFg2NgO65jspoKTDvaSWc8o5ztzEE5LKSSWkjGB+L19axcZ2xX/uDmp7PpnokJbw9d+MhN8B2g3rxCqR6C9Fox3PNdaTkzDWGrXE6JWaUGqM5IxD0mr/BwBFkH3Uck5OexvD2MI1BSXmDW7v8zTJbyXwBhiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=K/dTrnka; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g1iFVfSy; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1AA8F1140138;
	Wed,  2 Oct 2024 07:51:43 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 02 Oct 2024 07:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727869903;
	 x=1727956303; bh=TvtI6Ymi0iDeCpT2LstG1I5T9nQfjnvieONHI8z8hs4=; b=
	K/dTrnka/hetRBWZVfTAABVrvz4BkyWQ0zqvYdFRpUVO7Qsfvz4wK9o0xA1uwhhz
	cW0/k+nFWpl+7qaAe7uVc2pnjuObZKrqdewym9S4ZhxvxKMe+0OyH3i97/ndugNb
	0I75ii4zqq70jjepx4yplenYFfz2V8r/ww6s+QIE2bRNDbHVO2bqhGiC2y4S6tXw
	Ha7OnjtafX4XooHWeZo4zK2hPCqDOwNR8YemgGKm5Js17eIlDFbLI9L2r4FzKYbU
	7kFSFnola/zK6La+mJHDBUgCT/76fSg23vvKqIVAj7dNOKhOlky/MJSfEQ/4keLn
	E/F3IVWcrBERyKZ7ocgoiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727869903; x=
	1727956303; bh=TvtI6Ymi0iDeCpT2LstG1I5T9nQfjnvieONHI8z8hs4=; b=g
	1iFVfSymhdUiDg2h4Hh7Jlt1KZWZCrlV8hbT52rcnP0NI56t7pH5vrRe4QkOdhnx
	bfTG8x2vBeeQvJpWGCJV12bv2/74/tUVw08+MyZz5RuwyKSIk6LYtpGSn7SuTWFl
	Gy/PHwh1rFzTqZKFTUdtH04dfnoE0zh04VC1MFBQ0g7tD0fKrR4Sp1ds9480UShe
	L8nMUDOyV7HOOkUkwCWbEVT1t3IHhontRQajlO3emvHV9nOeJBo6nXZBOmy5LK/k
	Famk6JYoGaU87Maqb1EeL5uknTPNYI0V02TbO+2ZtPUS2+k3Lb77utOgYdo2dM0w
	cRrKugt75WsGKAxuo/fmw==
X-ME-Sender: <xms:zjP9ZjKoq4EeBUH8PppjOoXJ3u-Q_IMOXPynBdhbytrAsq1lHS0VRw>
    <xme:zjP9ZnKlQSEXaUrFlZ_7UucfXKfYXhaTji1EKJbBS1VNUUZ2GobXaJkTk4CCCEnxI
    VNXGnATtMyOT1HWt3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegvihgthhgvshhtsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfi
    hnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgv
    rhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgi
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehfrhgrnhhkrdhlihesnhig
    phdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpd
    hrtghpthhtohepohdrrhgvmhhpvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:zjP9Zrs1EHwqQy7poFjhg0eJ8XU1XVS6swGHrS0eYGEUgu7r-6_mCA>
    <xmx:zjP9ZsZOdFpUvDX7cVxhpBNVMS06P-fv3fczYT5TtOudTKt_RW4XxA>
    <xmx:zjP9ZqYyF5FfHu7iMHbTvUdf6Lkc1h7tmNpd-Flpag7JaLgyztz9Fw>
    <xmx:zjP9ZgBRUMSjRlcv93BCMtvFOvk3Rw0ms70hsxcKu2p3tiHM2ZdVEw>
    <xmx:zzP9ZiqKtben1pQSWYtPh3pRq4Vrrd1VAS51qsqdZ4Hzt7GEvbfMxsme>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BDD92220071; Wed,  2 Oct 2024 07:51:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 02 Oct 2024 11:51:22 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stefan Eichenberger" <eichest@gmail.com>, o.rempel@pengutronix.de,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Frank Li" <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>,
 "Stefan Eichenberger" <stefan.eichenberger@toradex.com>
Message-Id: <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>
In-Reply-To: <20241002112020.23913-4-eichest@gmail.com>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-4-eichest@gmail.com>
Subject: Re: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 2, 2024, at 11:19, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Use the relaxed version of readb and writeb to reduce overhead. It is
> safe to use the relaxed version because we either do not rely on dma
> completion, or we use a dma callback to ensure that the dma transfer is
> complete before we continue.

I would still consider this a bug in general, you should
never default to the unsafe variants.

If there is a codepath that needs the barrierless version,
please add imx_i2c_write_reg_relaxed()/imx_i2c_read_reg_relaxed()
helpers that use those only in the places where it makes
a measurable difference, with a comment that explains
the usage.

     Arnd

