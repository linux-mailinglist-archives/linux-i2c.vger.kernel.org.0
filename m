Return-Path: <linux-i2c+bounces-5526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F13956A34
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 14:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7EB1F23D25
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90314168491;
	Mon, 19 Aug 2024 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="c4kBBfj6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JQnAJpJx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F013DBA0;
	Mon, 19 Aug 2024 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068889; cv=none; b=OecK2XgY/u6PlfuG82POOKICjNGL3b42nM8BOcW7Ux0BwdcTx5S/YhUGAcQhE2LIZ6pO5i3sxGDMYZvFaqBu/RjqVZARmZBCKtxyrPxDVwoWfyvKhV/LwU7chOBSKUYhSEKJCl/YWm4RwzVGhmIBzEWEDEwm048EJWPPI6V7PRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068889; c=relaxed/simple;
	bh=lvQSZC3PWYlw64ySsxx1AH+WrirN5hdqItqdfd1eWbs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SSF12IkzwoRZT1Azy0Fva0/G9dvyUsV/Y344ZWw/C+N85wEAMRWgOg5gtxElFaaD66SNV2XMBSDaHbYoNTMkHS47I2NnOdOB6s4EjOLCb5EUXPoW5wguvLTJRR/4sckFX578OOn/EpX/ux1tZoA6Kcro4OJJf1ugDnsauBM60uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=c4kBBfj6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JQnAJpJx; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 07D291146D7A;
	Mon, 19 Aug 2024 08:01:27 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 08:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068887;
	 x=1724155287; bh=XJd6YZK68x6p9zonmT3qVBwKkBNjs/NgkzszXw1opu0=; b=
	c4kBBfj6HqZqni8RzkYdxNxFkQ1ENpLQjB/GetXg+6dWaEeI3E+gh/EmVZpfV/oM
	QYpWRZajuHY1XpTSFdApwsH9l76hmhvLWeKCshpNbnLQXY4VpsQ7IeWILnWz73jD
	qZp+knQTOYRSyuS8ctuI6OKIrfWXZJROjRA70NIJ1FIcVKJ8Tv1Xd1OlsO7P+qoU
	QKbV9eW4yS09ZOQzjHpLC5lFtGx+H7gRsFwsK1UZYNGhzluETYMrQKsJKo2HZbA6
	yTSIqocnvjhaRZzeNddKemLtU+YKc2QeYBy7tERLfzltUbJ8wjOg4oEoUhtyORGx
	ERreqC+JJ9Byd/qWAZw41A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068887; x=
	1724155287; bh=XJd6YZK68x6p9zonmT3qVBwKkBNjs/NgkzszXw1opu0=; b=J
	QnAJpJxekEO59pVorqlrXy4DTII55HRZ+p/QdPrR8UoNHmJeZaMfdNHbUQOJkyW8
	EAZhfHy/LcDHmIFcvUyMiifmBTmtEgl3mBNJqpOFE2c+IwWX09uhwUjMCU6RKG1T
	MjogK/vhZLnShQjajoFWKbrmI45TacV7tt8a/+1FAipTH3xhY1H4AiYUkGhJC3Nj
	nttD3NakRClTCN86Troz2p1dHKm43435VoKoNSyWxDt+/SazrS1bZr1Hv49Btxx/
	Uq69RvXXEokPg0k4ZUtBsG+UZuO13knZBKJ9jQkx73ELW0JIzjyrcqBgilys/zQC
	RcNoRpnMBZduInLWyvUNQ==
X-ME-Sender: <xms:FjTDZlk9dVIg-3-p4U0rsKFsRDS51mEzlMDz1ql-edW_IKeTdwrcng>
    <xme:FjTDZg0xC3WjWM7BgtY_2KLzfBHwe3RdtbY0QS7RCaDJYjDG9hAyklnwpFaTd9lTq
    NInoUKW_ErQm8jMROY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorh
    hgpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhgrmhgvshdr
    mhhorhhsvgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllh
    honhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihm
    ihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhhorhgsihgurhhsrgesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhuhihunhhtrghouddvsehhuhgrfigvihdrtghomhdprhgtphhtth
    hopehtohhnhidrlhhutghksehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:FjTDZrroMVlQ66jpjLsCc4um4CVqdDtfsw5ZI55MRN9DOsXUi7xtMw>
    <xmx:FjTDZlmfsu1P_mIAW0kNyHKiquyL1mMvTclMg3iKyx3pIXX8auokFw>
    <xmx:FjTDZj2ThwCSwXNysDttqX0j1rLNi6ha3Mf-ZAJyXgdrTBGplaIe2w>
    <xmx:FjTDZksbJSvw9ga6jQ5I4pClZQYE80hM5_azDsVfe7AC3AVPHBBzaQ>
    <xmx:FzTDZmB9HuW7vO3D4uB_rDFetK9HTOqwIeEQu-uN0ClCJnculJYIjIYL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5694516005E; Mon, 19 Aug 2024 08:01:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 14:01:04 +0200
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
Message-Id: <e750b0cf-8191-414f-bd23-dc6b69b82796@app.fastmail.com>
In-Reply-To: <20240819113855.787149-9-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-9-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 8/9] dmaengine: at_hdmac: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>

This table is again unused because at91 uses DT based
probing. Please just remove the table and the #ifdef/of_match_ptr()
around the of_device_id table.

     Arnd

