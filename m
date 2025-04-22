Return-Path: <linux-i2c+bounces-10519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AEA9685C
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 14:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD8F017B641
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 12:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C35427CB1D;
	Tue, 22 Apr 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FCtdW4K7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mWK2dk0L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B59277819;
	Tue, 22 Apr 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323238; cv=none; b=J66aHpPUFHi3PdCHTkvRu4qvPH/GUAm6/t0ZFxGGKkyNSNvyYSf0kaLLA3dWa2QwnnBdAliMjhzsemgJljcRWpRVtv2FJkBJfuSI3+mmoEYZeJq7TUeSYUNgybE3SGctqn5FF5Nd+AzD+CnAIEaRd//GbcC51SZWxtXOATSZWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323238; c=relaxed/simple;
	bh=PE32aOICxpf9Il971tWVYUOauqB5/VNm8nNUXdWIFZU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bX6IB1r32ke51NUX5qyW0628CAdH6F+Z9i9Opw8eaQ9793xFlAp/keRrTvm1YmmZTIN1YDkrsLAJjs2Lh8sBIQ4vgeczMmjt0e+iF+728enAuHNnoUO/a8sXa6aZ4dMxcLuDi0/peGsXuEAefDDrC6L9P6U10ndQBcfUHIk7Zxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FCtdW4K7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mWK2dk0L; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CD0161140251;
	Tue, 22 Apr 2025 08:00:34 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 08:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745323234;
	 x=1745409634; bh=8nthwYMKR4aOFINu9xZgH8QRFGdfF9jUoUvoZlCSYU4=; b=
	FCtdW4K7I5zRyUQp1mclIzfaXPPDcsgT0G2XsPEkSGSS8BJ40XFJNF2l/bzcVak8
	PJLftEKTePKlehKHr+AnSvI7TJIxO7SmiCXgJsU8scKoUhwtBOBCWVCKyZ2jO5Dl
	rBxjlwr3fQORHFVrP9KtM8XvSwYXecX888kwoZr3ZjMZWPbq5U+GcaDO9fA15UkU
	mmCcRxJwJkrWzHG54q5ElF+wJVS2G3JqYc3Jw0U2WG7ocF+5lNFPTeG9rvmuWCsi
	njglbjyrOiOLj2cIiTM3373DP7mgJGa16rLBBiZx6hT1WzvvUHLFcDBFtrF6P71X
	yXIm2hKpVmQmddjLM2RTVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745323234; x=
	1745409634; bh=8nthwYMKR4aOFINu9xZgH8QRFGdfF9jUoUvoZlCSYU4=; b=m
	WK2dk0L1aVa94+bunBhLx17FVJznnvK/AdKm8nEPfZUUS7IgF0ziI7PzIWNBofEQ
	8CZP7gBY7bFYlNyj5QRhlUrNMvKSkF1nUwZOM7WaUPvrmIdCKqTGDpIZ9FJRrMrs
	rY0dJK3JYP7Dr0c16X1Bp+SqDKHx6gHlSLl7FwmrAry9AEdQl7UZOnjQKjYZj+B6
	vvrboj+7geoKTlI3tPb17BOxBo5pSKE6uOpB5ryVL8Hvhcip4IQ4CnrOLRyuJokn
	nRUzuu1LC2c51effPU6RF18xX6fkizjG8VKovi8vuJXpvIaMldvoBAgALUzx2XUW
	Fu8/l8WsLkMTIO1/RIRvQ==
X-ME-Sender: <xms:4IQHaIwwAg2ARtGf3jGlqMBsIagJvBoGj0v_BftaGeTLZUA9fgBI2A>
    <xme:4IQHaMSPkvJvmtb0CK21vKbtTwBPmE5CK5CbIBK6vPn0gPn4v1aYB4jF5XJoOGGAX
    T6MbIL_0gzIP5Ud60k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvghkrdhkihgvrhhnrg
    hnsegrmhgurdgtohhmpdhrtghpthhtohepughrrghgrghnrdgtvhgvthhitgesrghmugdr
    tghomhdprhgtphhtthhopehpvggurgesrgigvghnthhirgdrshgvpdhrtghpthhtohepmh
    htuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehhvghrvhgv
    rdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrh
    gvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvght
    rgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegujhhrshgtrghllhihsehgmhgr
    ihhlrdgtohhm
X-ME-Proxy: <xmx:4IQHaKWmoW2di_TlBk_3LC0bIqSqcvphy6ets2e-rndyOqir4PbyCA>
    <xmx:4IQHaGiei-Ql0GRpXERiVlv65LxFK-7j6r-KkvhG1fj3vn-8NEFwVQ>
    <xmx:4IQHaKCm5zPJpibs-8kVLkqGWNg8UD2hn4Z8TqFJIGHP--QssqYrRg>
    <xmx:4IQHaHJOvBUka2beZuMcFi1smo_KB-gJx9FuTpNKCqV5ylIZza69NQ>
    <xmx:4oQHaJYK6LHO-f8uu6Lf4HNT_VDikvi48Yp8jo6RBxgTdQ2SDj7VOZ4o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D0CBA2220073; Tue, 22 Apr 2025 08:00:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T51aa6c607dc631ce
Date: Tue, 22 Apr 2025 14:00:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herve Codina" <herve.codina@bootlin.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Peter Rosin" <peda@axentia.se>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>,
 "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Mark Brown" <broonie@kernel.org>,
 "Len Brown" <lenb@kernel.org>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Wolfram Sang" <wsa@kernel.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 "Allan Nielsen" <allan.nielsen@microchip.com>,
 "Horatiu Vultur" <horatiu.vultur@microchip.com>,
 "Steen Hegelund" <steen.hegelund@microchip.com>,
 "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Message-Id: <68b23799-29c2-4309-b55a-87d83dc6fbe9@app.fastmail.com>
In-Reply-To: <20250408154925.5653d506@bootlin.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-12-herve.codina@bootlin.com>
 <Z_Pw_MoPpVNwiEhc@smile.fi.intel.com> <20250408154925.5653d506@bootlin.com>
Subject: Re: [PATCH 11/16] of: property: Allow fw_devlink device-tree support for x86
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025, at 15:49, Herve Codina wrote:
> On Mon, 7 Apr 2025 18:36:28 +0300
>> On Mon, Apr 07, 2025 at 04:55:40PM +0200, Herve Codina wrote:
>>=20
>> This is incorrect, they never had ACPI to begin with. Also there is t=
hird
>> platform that are using DT on x86 core =E2=80=94 SpreadTrum based pho=
nes.
>
> I will rework the commit log to avoid 'mixing ACPI and device-tree'
>
> For "SpreadTrum based phones", do you have an idea about the Kconfig s=
ymbol
> I could use to filter our this x86 systems?
>
> Anything I find upstream related to SpreadTrum seems base on ARM cpus.
> I probably miss something.

This is the Intel SOFIA platform with chips from both Spreadtrum (now
Unisoc) and Rockchips, using a port of the arch/arm/ code DT on x86,
about 10 years ago.

That code was never upstreamed, and is long abandoned by everyone.

>> And not sure about AMD stuff (Geode?).
>
> Same here, if some AMD devices need to be filtered out, is there a spe=
cific
> Kconfig symbol I can use ?

The only one I can think of is CONFIG_OLPC, the XO-1 was a Geode LX,
while XO-1.5 used a VIA C7, both with actual open firmware (not just
fdt).

       Arnd

