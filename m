Return-Path: <linux-i2c+bounces-5520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C4C9569E4
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739441F23A16
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158981684AE;
	Mon, 19 Aug 2024 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HxjVtaYA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tKlfomCa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902B1FDD;
	Mon, 19 Aug 2024 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068275; cv=none; b=kQHYINwyCxCSqc1bxfWzpShkY96bn63sFwVHGYBC4WgZ+YErQBG8vnk6oViOK1K5wlixethfUANhc43vOIds+JQ79QFZQA71QwTELJ4Fg9NEk+L7SsHRGs7dQ30XekI/RQodDVF1xhTqAQahY/RAfrl2QuWAbni3qkLZ0ggGMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068275; c=relaxed/simple;
	bh=mHzHykR+XByAU4kXk4uyqK+cTWmhVzCIpNX3dtqI/a8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M3HoxpwR+j8xjIPiS25udeDluF8N+gHfFJh6qS8doVZ0XvAehYSgCfT6aNNN4hxw0Tv5NZfacaFwXipvEotJNPSv5BUBqIIoUsvy01YMee2Oc64dlne0sxKrR35ykpCYDpNaVjh27TWKPBpHwB3ef87ar7qlCD5QKQVA5ZPSces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HxjVtaYA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tKlfomCa; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3CDB21151ADB;
	Mon, 19 Aug 2024 07:51:13 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 07:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068273;
	 x=1724154673; bh=ur7Nh7G56xLsOY+doZK+/keMSx6b5FkAOR138Pl7HO8=; b=
	HxjVtaYAN5d2ZTrlC0wvNv4sYm7HkwBeKsAYx6IndiCd1G0Ya0SEIGpDVXDkCrxL
	K7WbQDUhcUVFLlHVZsSWdUm0oz2ZNz00Cj6LO8EN7G762NeWGvYayu547mW6sCEl
	I4Qgawwple1j0B2lJBaiBkPLPR9/2SUTKgcwOfxnJwDvD5wWAX05URDy1l5e+MR2
	6Sb/+vdNQ7P4HIeNOb5z2TibysLNeeKUg/Q5gjspt5YDgUpg3UpK/ZyqsstG9P7n
	OPCkVPbc19q2lECTvJam4FG9mh50WC5POOR6rtzOW85m2Rq5Ytyi7vswHKyfnI1a
	zrPbPpSR+XdrkgB0uo1ndw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068273; x=
	1724154673; bh=ur7Nh7G56xLsOY+doZK+/keMSx6b5FkAOR138Pl7HO8=; b=t
	KlfomCavX7cHuzNEngP4T86O0dHFBaReqmIxxhxUO7U2qXMidmAWc61033SsS+PM
	WnrnKloialmO60EQrsEoKsghr6F5RVDI0YJgVnF3yjQFF4gIknnn+LJEEHcJMV1V
	ZEk/Si6xe9jU7UrOb9jhOCkNeZEA+21iv6vN7fCMZSG+iTNAu+6PY88zmxlDBSGM
	iixiOU+ZkqGRnH6Atvk+vF+HP+T1O9Tw4I81k11mTOfZCsr1UoPAbgHHPfs0b8u2
	2/AY0BWf7jH5g0YFz6bKCpn2tbMy4oXJmoQEPAqXGTYqKTggyFwvJWs/A+7URONE
	ofvBlrt+pqKc12TCf6h4g==
X-ME-Sender: <xms:sTHDZqIGpsbZFvIWwjEcTq41SxEAl9EtSj4ey3E9-R0unvEbXIqhXw>
    <xme:sTHDZiJ79J8Bs7xVCsd3Y3UDlHa3SVnVfKbQXJxXHG6oeBguZsGIfIh8H4_AXjoio
    rFLBFYvNQ3_yNAhv9c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorh
    hgpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhgrmhgvshdr
    mhhorhhsvgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllh
    honhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihm
    ihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhhorhgsihgurhhsrgesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhuhihunhhtrghouddvsehhuhgrfigvihdrtghomhdprhgtphhtth
    hopehtohhnhidrlhhutghksehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:sTHDZqtRcbi3DE9CogAMZIpzPtMoMiHucjlcKFkOfwOlUJ1Nn0F0XQ>
    <xmx:sTHDZvbTJjCwIvKKxmjlB0KRzWwg2FVgIBOZjmUx4miX0RUs0sZYdw>
    <xmx:sTHDZhYIA1q79_knIukmB9X7b9hPSKr7YrQ9HKCKhcy6ud3dtflpzg>
    <xmx:sTHDZrDRvBWrS3fYQOYAVWRnWzAZkIvaIzrp4l-Vr_HHJxcAkfIAOA>
    <xmx:sTHDZkmvj3qy4cUFFDHcWPd7QM4gE3F_atMatLq8YRv4mXkB9yY4wpJt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E78C416005E; Mon, 19 Aug 2024 07:51:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:50:52 +0200
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
Message-Id: <cd6728ec-a429-4196-835c-94587cda7d74@app.fastmail.com>
In-Reply-To: <20240819113855.787149-3-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-3-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 2/9] soc: pxa: ssp: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  drivers/soc/pxa/ssp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/pxa/ssp.c b/drivers/soc/pxa/ssp.c
> index 854d32e04558..6ac3f376d030 100644
> --- a/drivers/soc/pxa/ssp.c
> +++ b/drivers/soc/pxa/ssp.c
> @@ -194,6 +194,7 @@ static const struct platform_device_id ssp_id_table[] = {
>  	{ "pxa910-ssp",		PXA910_SSP },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(platform, ssp_id_table);
> 

I think we can drop support for legacy probing early next
year when the last pxa board files are gone, so this is 
no longer needed.

     Arnd

