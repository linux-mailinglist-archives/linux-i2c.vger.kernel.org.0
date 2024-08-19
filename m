Return-Path: <linux-i2c+bounces-5527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D22D956A3C
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 14:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D2EF1C229D5
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1C316848B;
	Mon, 19 Aug 2024 12:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nsPPusUg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="goPRrnnB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8013DBA0;
	Mon, 19 Aug 2024 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724069005; cv=none; b=njj8vUL9HvXMdq9U4SbO8iJ2sRjC1pN4G8Tyl2wX1uHTIoNitTYCO8MCRXv+s5dzLithzolKqkjqMF3VAulMxfFbUFOEdlEJNdy5YpsIyYRnpncVDna0xNQfEjJsJ6M446heMhZb9QPjNx5KG/X+gkOnvHhqxgbtx3ykUOBnbqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724069005; c=relaxed/simple;
	bh=x+ohuPa6Bg3rGm2yXeitvgiO5in5d6zC0RFJGBbMnvU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=I7k8qWxUeBNkiYiuuE9f0MMmdx/uxZfASS2f+8ePN0TJbo4RoF3sLoYlGdFKVN9c+D/uCNtx9kFp2mUzXGvSrxwWMtKFPKulg65lkPdB1TBt2NN+uK0zM2ormxO92wd2jKHcY+Wc8YUzSZAJfKMEYWY2GgY9+xgitZ/10Azs4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nsPPusUg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=goPRrnnB; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 47613138FF2E;
	Mon, 19 Aug 2024 08:03:23 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 08:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724069003;
	 x=1724155403; bh=MlUgy/leWMv3QVsxhXpycZ/yMPD753+synKTpuY/3tY=; b=
	nsPPusUg43iCP/0H15qB4AeDsixQXqbTLpABfizVv3CDPO0a3yd3LGqDX2IQHDFo
	1D+VSLYyubjiW+Q6bxd9t9pY+8A53lYyhQ8dLBxkD8/q/Aek8sIxxCHxaYWFVzkN
	fbG/aVn7ciZJHnZACxWx4KaOQeXsuR+CUrXxMo7tC9QfS8LNxhpk0fWkEeaGMnFY
	TkNcyJ2ppOaAe39P3ST21XnVDchfYSBeiK7yweODlePfC8RYC/WdnmswK8ZUWb2M
	C0FBXXbxhSuuZwGk8a2DU+qRfxCi8i97cE4wKbSAvZRiNXd+pQK+DvUaMEKU5dT7
	Kgx39eMHivsfz8HIY8ZpjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724069003; x=
	1724155403; bh=MlUgy/leWMv3QVsxhXpycZ/yMPD753+synKTpuY/3tY=; b=g
	oPRrnnBwO8hpJHTtvjlucDuPxa2EmnBgIoXcaknB4Pf/q65BF7fBIdn8IE0oNU+s
	yNO1OZDVIrNuTvKDTNGqCfICV7dvQ4A/LY3cMJQQTAyzHbcVJbJ06arn4Q5hGW+V
	Rl2vsE7jufj15S0WqaOOO6OYnZwyCsMfbhb0SO/Ku8vTHgiXVz7AHxi9XqcSgAio
	ZhPFXU236PhdBGxErTHFgvfr0gld66TJSVEwnUzUPveanUmWFAplXz8CWwXFlY9X
	fZBgWU4vZkCnHB5tbE1EB/uVVMDdm4C1fmV0Un3v/Bqj+vvkhE/BdxAaDx2lENSa
	KORKfot4JBwFTNKvQtsFg==
X-ME-Sender: <xms:ijTDZnEJgyM1mN1brDD6DYeCjDT-XOd6KhpBu6_Y5UypNWeDV57igA>
    <xme:ijTDZkWnaNMuTCbjSFtuM_gq-YpVApLobb8qArbae_UkopuEbbdWG5IopjP34WOTM
    nZSfiWgWh9oLfPsT48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorh
    hgpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhgrmhgvshdr
    mhhorhhsvgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllh
    honhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihm
    ihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhhorhgsihgurhhsrgesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhuhihunhhtrghouddvsehhuhgrfigvihdrtghomhdprhgtphhtth
    hopehtohhnhidrlhhutghksehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:ijTDZpKO0wriK_Wd9ghL-4q83XumtDz4seyQ49mCeffwzaMpGeYolQ>
    <xmx:ijTDZlFMpv0F5OyJvpcVPeHaGGl4p0FihH7mEua3q9ckzHbdA1fPzQ>
    <xmx:ijTDZtUITz08K66ua0eTYaHtC6Ww35KO2tBd2F4ZgP2A_3cfPoShtw>
    <xmx:ijTDZgO92Hfyh3jsiLs0eRTg1ulkKIuJ5SUEvOyT0DVDGdpoyKC8kg>
    <xmx:izTDZnggwu-HtVYM8B1yJeXrsp2CsRgSO2ttFQxKiFL53JQs_AfGqKxE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A654216005E; Mon, 19 Aug 2024 08:03:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 14:03:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yuntao Liu" <liuyuntao12@huawei.com>,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org
Cc: "Corey Minyard" <minyard@acm.org>,
 "Ludovic.Desroches" <ludovic.desroches@microchip.com>,
 "Vinod Koul" <vkoul@kernel.org>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>, morbidrsa@gmail.com,
 "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "James Morse" <james.morse@arm.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Robert Richter" <rric@kernel.org>, codrin.ciubotariu@microchip.com,
 "Andi Shyti" <andi.shyti@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Alan Stern" <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 "Mark Brown" <broonie@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Message-Id: <dc9bda22-53d5-4b22-80f7-f2d4d816bd77@app.fastmail.com>
In-Reply-To: <20240819113855.787149-10-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-10-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 9/9] ipmi: ipmi_ssif: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---

The driver already has a MODULE_ALIAS() with the same string.

I think the MODULE_DEVICE_TABLE() entry is slightly cleaner here,
but it should only have one of the two, not both.

     Arnd

