Return-Path: <linux-i2c+bounces-6668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A5977992
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36977B24065
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 07:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFA01BC090;
	Fri, 13 Sep 2024 07:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MyetxcDY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PBxYE1a9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226411BAEE9;
	Fri, 13 Sep 2024 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726212285; cv=none; b=h4snWUJyoGyMLEPv/oQcM98jAr6zzBcSV8Rg6nHVtmctuSTv6Yu0nPrjZZW5uwSXtFS3QUtYCt2sqdEfoZq18LhLgi98j8P/Tjvlbhicc5ThOUBfyR9XzS6mrWkGoVINo10S0auVmlm/7RPfY9XL16tpnNtbZA+eW/9AoYfYbN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726212285; c=relaxed/simple;
	bh=3hRBRYQpttd2ddIYmv5rbz7Ru2Uh5HVWH5f4UuqhGQI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nnWqnI91QpMgKvzOL/CHsr68gqBdhTxjCd5Eu3r2K9w6nVtE/v4Hz0qiUGIXMd6CHDu4YFqYsMnR96FyLlwQgiSo2EE3tsHZ1gHeZwF5yG+cE7k14K6FXpPYQ51blM9ANqM1jnh/hewEP8/8750fMTZXQE0nGdznYuAa1xo2kfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MyetxcDY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PBxYE1a9; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 287D3138060B;
	Fri, 13 Sep 2024 03:24:43 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 03:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726212283;
	 x=1726298683; bh=/pmNKu7YFS6u+1whi1LucaHIc+T5SWJB1DgsgbZB590=; b=
	MyetxcDYqQsd1XqdAex/Zie7E/QkqKnMfogieeNBgX5PsXKokgsXajPHULl2PKWN
	hbGzvEnqw7LX9z6StqiA/yNU0eu1GHSeR0Z81S7uznG5+oIRCXD49SCNpdfNs5xp
	zY9oxtxQfscR7m4uO0/yIPJ3f3JvIYAD1osKGKwmFMVDjK51o9DBMg88mQr/n/6i
	ifP+fcHSNUxR0tpzfsROtN5hKShvZJqhtoJHuyepLJT2lpeo6KkErqx8pO084K5Y
	fVZY30yuIvdb2bBqFyDJoIvzpc+E55RuWtQyuKyAnbFvxpdHej38Rv5BqrQ6zoMK
	reXMuhkra+3HcYgWlGGGgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726212283; x=
	1726298683; bh=/pmNKu7YFS6u+1whi1LucaHIc+T5SWJB1DgsgbZB590=; b=P
	BxYE1a9ndatuRgdp/bjAs3Uzt4HNiw2bO9jq2FlcVaYo47F4cU5sWFM9aqGvucXo
	NTJUOPG/+WJ8ayki1fhsBoxZKhv63rqvQN7W9nPT6joxixYRz2Irxq6j3/nJoZ7b
	WIsBLexzXRBHHdfET3R2aZG9PQJeRKcTuq380D2EoEb4ccctvVE4tFROycNI/R42
	2AbWvEpDk9yNhLzDopPp8p20HMzT33LxLGjxgaO+FLl8G7hdJwZAJty4P8m9YAmu
	jCK5PUkdSa6Lp6WMV8LpxD46fReKKvuXPyJDSmhhuGxUgv6aafCYAlIr1QdlSxXw
	JOmb0DNjYaFxVlUrkN38A==
X-ME-Sender: <xms:uujjZk7WH7-p39GUrqHKqko5sKifIDR6VDdP_71uWtq7OOVivZqRTw>
    <xme:uujjZl5v9nZ3TbioHqXjA4lo_HWGfo2QUWFW0dq347s5bbq1JcmbVSnEY4-JNwbwO
    TBc117DVoJoJsN8cI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuthhsrghvrdgrghgrrhifrghlse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrughsphdqlhhinhhugiesrghnrghlohhg
    rdgtohhmpdhrtghpthhtoheprghrthhurhhsrdgrrhhtrghmohhnohhvshesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhiht
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:uujjZjc3BDXT5DH6T4X6LoG8iUTrrMmy6OKTMkNFlA52ybSHgpSXnw>
    <xmx:uujjZpJY_jmF35oVj-8AkWHBVK-CSOouHX4xPlsli3Q2-XDw16NH_w>
    <xmx:uujjZoKmurNH36OINe-jxuDI0zCO8wkj5eSyCl-gMfIhK3jqrNlbYw>
    <xmx:uujjZqxN0PQU5z1WRk0Ljab9IEXo9q1uRuHmFS_ZZXJtZR0NEbVrcw>
    <xmx:u-jjZu2dT65EauHH-kEUzklxFjbc6OmygxxYYhZAO4Rghu3t7C8rM6gQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8F648222006F; Fri, 13 Sep 2024 03:24:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 07:24:21 +0000
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
Message-Id: <bf9466ff-68dd-4f27-acdd-0a9613f78a3e@app.fastmail.com>
In-Reply-To: <20240912-test-v1-16-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-16-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 16/21] dt-bindings: i2c: add i2c/twi driver documentation
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:25, Arturs Artamonovs via B4 Relay wrote:
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,twi
> +

The "adi,twi" string is not specific enough to identify a particular
implementation, the name should either include the version of the
IP block that was used in each chip, or (if that is not public
knowledge) the identifier of the chip it was integrated in.

      Arnd

