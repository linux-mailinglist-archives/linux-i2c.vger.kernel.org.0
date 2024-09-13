Return-Path: <linux-i2c+bounces-6669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBC97799F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81FB31C238F8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 07:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96251BC097;
	Fri, 13 Sep 2024 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CTPu/Gyc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EYjrH28R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDEE15575F;
	Fri, 13 Sep 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726212513; cv=none; b=tEpTWJWmFgzeI1/4pk7dWuJoytYr27a2elW0oPgN3KZMGG0yADjckXjIQqRkrZe2Vo/sKXRXTIFSPfAhTZBkLnSLl40tt7j+S8vFNfTLwmh7R8ZpC9SM/HnrBBC3kaYBcfhawUJPQygK5v/B2sqieqH9ZMxrwDRCcM/qJVGsTCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726212513; c=relaxed/simple;
	bh=bo7UzmEu33RPSGpk7E1ZUKxCfkE058dFXgDOOX0554c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Al6+P47lLYUFCzE71Uvd8EYkyf12rJ69q54L7ou+YlmC6G5D9qTsW1NnNlbLyZFcloprq9fiFlcwdmJjo5joqReIYJjssvWjVSBiatHf2Ybm2w4PrzfZWhx+Rdf350OezmuP/OEdQD/czM2eGiUobhz2cv0qwvSnUU4fHdmgi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CTPu/Gyc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EYjrH28R; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id DC9F5138060B;
	Fri, 13 Sep 2024 03:28:29 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726212509;
	 x=1726298909; bh=gkjYi8FXCiBhaSisYFv8UtmUsJkYhgRGdyGnqOCGvdY=; b=
	CTPu/GycIFzbmXtnzJrVKNNZrxCACzXb7WNGY6FaduAxirUQiOVKpjHifBDWOIvC
	W+I9RWJtdaAhsvh6PwgrMTOLJQDjF++fMoo3c5LWWmB8Y9L3M3IwAv4Cjn6iQPV9
	Xt7V22MXuZYEG+fTQBMlMZvHrzifm4q5BbeNziTBDCi2afF55HsdFTk9SxMbFxmo
	nW+0F9qB7pBh0sJ3JHcHvWxvFibk4WWwYHVMJezurTVJl2/f/uP1E1a5+0H4cqgR
	+ghv6s8sJXkGAFV6NZkmchJQXW+S5526ol7BHpptCWXTwmNhNomv5w9YOQgSu8yU
	Czsx4LLlbigqOcXK8mV8NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726212509; x=
	1726298909; bh=gkjYi8FXCiBhaSisYFv8UtmUsJkYhgRGdyGnqOCGvdY=; b=E
	YjrH28Rkic103YY8rhbL3GA7pd5qfKMeJbXUXuPUIYKcoz08z3TQUmwuY8Vh6mT7
	KznkKOlerDEPRI2PEb8H8yGgq9vCmyC2QhbiqVU9bP2Xc8FKctff71yalaOhxgrO
	9m8MicZnWT92oM9Ryo1yUzRJm94hbKzey7fV0X6gekYzqgwFoZr4aiyXNwxEVkio
	0kim03o0BgKKiqP9lrWEunfANjozFMUO3420Iy/fduzOWH/dVpwRFqBBWeejS1gC
	xLZNMoqSWixx2bseYpxOzfg6LE6OD4noYGXwnlH8133hbNCNDel8cmLSud1YGnqb
	YLP5/GoDVFScwznCNC+aw==
X-ME-Sender: <xms:nenjZhIUa9Mb8aMv_eTEJ4zj1xraHo22egim8XcSntPxeH3NU_Pnvw>
    <xme:nenjZtLTLZ3YVzIqd7_YkpoI4Q5akg9JaHIShEdi_vepXMhxCHzuiCzyJW-TBpPiV
    pFkIdf2s0khgoWKIKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuthhsrghvrdgrghgrrhifrghlse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrughsphdqlhhinhhugiesrghnrghlohhg
    rdgtohhmpdhrtghpthhtoheprghrthhurhhsrdgrrhhtrghmohhnohhvshesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhiht
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nenjZps0ynErGzzUjLiGcSsfCBSXShNQz9o6pNFoxlG4zimiCb0U5A>
    <xmx:nenjZiYUI0zTvV0Sq-5uMR18ob41fi9LDz6HnClHjrcOsbAWS-vzbg>
    <xmx:nenjZoZ8VbLHQ5npyX6xCKiuCCuh_eyofyUBhSwYoeBJzY4rx3JqEw>
    <xmx:nenjZmAFtTyzs_B6VO_q8e85qvWrSZ5Uz6-XiKjILsQLF2udcu_x7Q>
    <xmx:nenjZiZiRUjI1fAVP3Iq3XHoXZ6nVaE3TH5ydrPbeQ1mcs2iAWNdkzzX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 478BD222006F; Fri, 13 Sep 2024 03:28:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:27:59 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: arturs.artamonovs@analog.com, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Greg Malysa" <greg.malysa@timesys.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Utsav Agarwal" <Utsav.Agarwal@analog.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 adsp-linux@analog.com,
 "Nathan Barrett-Morrison" <nathan.morrison@timesys.com>
Message-Id: <4d883126-8675-4fb3-adff-f965c0de2ba3@app.fastmail.com>
In-Reply-To: <20240912-test-v1-5-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-5-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 05/21] clock:Add driver for ADI ADSP-SC5xx PLL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Implements clock tree, no dynamic pll rate change.

This could use a little more detail.

>  drivers/clk/adi/clk-adi-pll.c | 151 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/adi/clk.h         |  99 +++++++++++++++++++++++++++
>  2 files changed, 250 insertions(+)

The header is only used in one file, to it's better to move all
the contents into the driver itself.

> +struct clk_sc5xx_cgu_pll *to_clk_sc5xx_cgu_pll(struct clk_hw *hw);
> +
> +struct clk *sc5xx_cgu_pll(const char *name, const char *parent_name,
> +	void __iomem *base, u8 shift, u8 width, u32 m_offset, spinlock_t 
> *lock);

Do these need to be global symbols? It's generally better to make
all functions 'static' unless they need to be called from another file.

    Arnd

