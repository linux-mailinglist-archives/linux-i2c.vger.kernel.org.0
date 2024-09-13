Return-Path: <linux-i2c+bounces-6677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07D977ADC
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D17A2872AC
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2941D6C51;
	Fri, 13 Sep 2024 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kbGjOGVL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UJw/Imul"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389B187334;
	Fri, 13 Sep 2024 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726215674; cv=none; b=SYlC5JNAtHvWrSUA9i0Iin1c3A34bbBtU3m94vmc/ARR083PchOc8HfU9lNlFkzw/nkbbTJxXOoblbRUeZfVMWeYZoUv5RL0Rnal0vM/adkY+HaJYEukNSHqkXcPfSBtpuEIWn/Pcwk97v69VrDDD0S2X0VUdzJ1xmEUGxWndQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726215674; c=relaxed/simple;
	bh=L6SHO/ASOpunCv90PNvWAR9ZJ3Yg7qSgEQqod3nc69o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kZR+WmhbzysGxOR5C+DnanjrzzpimxJZ9Gi95oMol/fjtrAV7OTgOtzymW/ZKFkFZucGI7rvceK1av9VoWfu/XL0+qNV2x15fbVeg50W+HyXZ0U1MagRaPlqqo1OEE1SNRXSjpko1i1fwczl3YeekpXOy7+qon/DcWU/OnKQkJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kbGjOGVL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UJw/Imul; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 3BEE11380105;
	Fri, 13 Sep 2024 04:21:12 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 04:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726215672;
	 x=1726302072; bh=/y3Vva3fvwuIn0WsxTO61vMjrXBBZReSc8alqn8Lbu0=; b=
	kbGjOGVLyhT5AcUPXyJX/gVgfzeBdBZ2k6n4152IS8zOQWEG8okL0/yZvqNsD7IH
	KeEdZQsdgQvMFXh8G5fPdXJVjYYpt/r9ZDRYic+Uctjb/U0k732HbRI7X8yvPLI+
	KA0QTRD3W+eLOGOjrHWXDKrp2SnbGrZ8yN1tWRSwhMm3sRG5ZS5/TuR1RvNXddjr
	6JF8Ygk9qzotzdtnhTSo9RfcrDqv/kr0Iw/yMnpPKg6qruwwTWDSoOMyhR6WRnEI
	kyK/JbR+DQseHUzuvppS7WMQWEZmE0yzjY9iNJG2Ff1RWEjsAdauGsVSWeIeu6uP
	0gSzrn0meL79F4MxiO7v3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726215672; x=
	1726302072; bh=/y3Vva3fvwuIn0WsxTO61vMjrXBBZReSc8alqn8Lbu0=; b=U
	Jw/ImulLkS2wu4z1qp6wWly45JBZEkJuLLDmbKcDG0nWZGIlUAgwrGJYiLe8Z60C
	3VtBC1QbG4ZeF55S0fhcihHjbOfCEpnwMQFYrHhST1V0CtvV9Bv08QZAB+Rkfyr3
	yPK7Klm8vuhWzr3A/8mI39horA5ad1kFHt8EuT6VbkdPDRvNLyFs7tE/XiQQSt1p
	8WpEQsWU3k8QqVwgi0o9FtdH4NhaM5spI8YSTjdi4xF4if8PouuYUDlkThAtt9zm
	JTgBI6YPGoQrUsV4CFopPzrP+AAF2x+Pt/ez6rA1g3P3kfuVoydiE49DmvDATo//
	k7fhco4CuXNTMGGy8zRdA==
X-ME-Sender: <xms:9_XjZkCgRF1iZ3oAoW_L2qCOTEgHS1CA0drG3I40ibgQypxTDxmL7g>
    <xme:9_XjZmjXJ-GnfS05ap6o1adziZXxATnbClI1jk6qFcD-M-RvsLSW5juxF5iIqoNba
    1CeXwr8KCium99e9vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedgtdduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:9_XjZnl_vmTywlXfkHR0twrf-enV-y09jiqCQeMwODnswumrK-6X3A>
    <xmx:9_XjZqxoEsIEsVLIsYlhqQ-mt8H6rV36MJQcBo1C4ZM9e6QCI1rl1g>
    <xmx:9_XjZpTdtA4MGmDRMOmLLr4rmkQm_CSyR4BvlBkPZKavzFpOOgHeqQ>
    <xmx:9_XjZlbsa9-hb7lXV4CQ-NFPblDP5Kdg1qdOJl13hfzfuBdnoffAVw>
    <xmx:-PXjZhz8OH7XK6wXp5Q8Bo4xNSvBSow_1uq2TlBonecaO179HGuFosWU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 885EE222006F; Fri, 13 Sep 2024 04:21:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 08:20:41 +0000
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
Message-Id: <2ad02a70-8926-45db-8ab5-503ec1e65552@app.fastmail.com>
In-Reply-To: <20240912-test-v1-0-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 00/21] Adding support of ADI ARMv8 ADSP-SC598 SoC.
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:24, Arturs Artamonovs via B4 Relay wrote:
> This set of patches based on ADI fork of Linux Kerenl that support 
> family of ADSP-SC5xx
> SoC's and used by customers for some time . Patch series contains 
> minimal set
> of changes to add ADSP-SC598 support to upstream kernel. This series 
> include
> UART,I2C,IRQCHIP,RCU drivers and device-tree to be able boot on 
> EV-SC598-SOM
> board into serial shell and able to reset the board. Current SOM board
> requires I2C expander to enable UART output.
>
> UART,I2C and PINCTRL drivers are based on old Blackfin drivers with
> ADSP-SC5xx related bug fixes and improvments.
>
> Signed-off-by: Arturs Artamonovs <arturs.artamonovs@analog.com>

Hi Arturs,

Thanks for your submission. I've done a first pass of a review
now, but the drivers will all need a more detailed review from
the subsystem maintainers as well.

For the drivers/soc and include/linux/soc portions, I need
to do second review round when you have added a description
about what these are used for, ideally I would hope that most
of those can disappear from the final series when the required
bits are moved into other drivers.

I commented on one of the bindings about the compatible
string, but later saw that the same issue is present in all
of the bindings, which each need a more specific identifier
for a particular piece of hardware they are compatible with.

        Arnd

