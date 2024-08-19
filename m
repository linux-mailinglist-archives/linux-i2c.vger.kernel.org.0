Return-Path: <linux-i2c+bounces-5519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9233D9569DC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EE572828F2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6693816BE1A;
	Mon, 19 Aug 2024 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nbVPVWLs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aULxpoLS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B82168491;
	Mon, 19 Aug 2024 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068201; cv=none; b=OVNY5Zgwt457bdjHNxEGgkbxhF3JkTWPdtCpnC37j0mMu76xv8KUDRp3GywIG+3YEMEDslYrcvc3p3gOjJi4qDX2lz6AfAn1g7//lev0943fgyzU5pyq/eKmUqeAigYESgsRj1G5U1E65dvlWnYxPeo5SGBabLiOb3rr0LQqP5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068201; c=relaxed/simple;
	bh=NXVZGJpUGKoeZKg9ENrsCBddcCjKvwUct4Ch4+pBF7g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LK+urQS84Z3ooZxn4H2UlNdVGDRiDIaJoPRAa8euoE3meCa89wB+yOFefdVzahlTJ5kwUXV7Aj5EMoUBZ8/h/L25uD0SjJQxzGAJqWVq2BXVEGl59cJYlTateo8tiMUkmTZB+MxhhlN63Y8OgncK7VSOSNamj1+V8c7rLYBwg88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nbVPVWLs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aULxpoLS; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id AF1E5138FFBB;
	Mon, 19 Aug 2024 07:49:57 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 07:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068197;
	 x=1724154597; bh=swd2YP+u96aOXADsvOlWQ6iZc2iEqVwrlEkNVEMipWE=; b=
	nbVPVWLsC2+f+evk1Jc7OzxyMBIvoO1m2DLBG+LlbV6ZimRNjdQvo79DAV/cvcXm
	Lgh/gY6gbuZV12mlgcEC/O71VyFENVsRPlOiEEy8bp1XpGJBOJmsT70N/I7Ee0qq
	veerz8kYySMI4egV/RYr8iA3Ry6pHkx3KwqMCKi3ORDf0yS5O5y1YVrSVPqKzdfN
	L4rix2TwNsivMDl7s76/Ovj/efSt5SOmLF/2xerPW2fUUWNN8IuJ6ChhxFqMxHl8
	03UFIizvAb1bugPsXe6fnW7x9+jD3jZXStPAnkzSOuDWDk5pw0QVKfPfr+724cAO
	GzZU6H/MDugWn1yeeVgnww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068197; x=
	1724154597; bh=swd2YP+u96aOXADsvOlWQ6iZc2iEqVwrlEkNVEMipWE=; b=a
	ULxpoLSWOi6OycCCOIHNiqKrtP2fixHgCJGaHhUVX7bAmY9n8OhbP197MmLs6LQk
	zcXR4k4RkEOxCCQ3iSw/mpnSxqr+REVqTAMfDujQI2OwxamCRm+2wJVAnLHUqHkI
	Z3hsMno3vs4WhE+0TKKBPuEY2IMzjFY/qdr1a2ld8BMCQCSwSj2WVqi7j7P96r9d
	v31UpebcdzqJn5P64maDAz619/pCKC2LGYHl0yzR1B/nt1vgElvTVkWaSRITN+TG
	gZvToGzNot54Y8Gf1sBhgikS+wuJLwSzeim8x1yejsMwA/U7lFgVpopxbtiJzH/l
	eJ7VF9qpqx54iJ7zfCl4g==
X-ME-Sender: <xms:ZDHDZqqq8u2w-52j0aYVsXjFwG3wwT6NWf6TwTEM-_ILz_N683uUYA>
    <xme:ZDHDZoqCVV5tAqfBPPGlaKu41WklGuA6rP3TB15STbtD6VCop-0zgsGfLKMyxLDNV
    ekAHJdnWcZbC8Tlnes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ZDHDZvPoSPgYUJIyJTClMjJpGaNDHm58Rx5P9ZROqTAZI-c_bF3NNw>
    <xmx:ZDHDZp7tPPcPaCzC7ZaYII2JE49glN0M9xKoQYxJy6FaKIYYIGBuiQ>
    <xmx:ZDHDZp7kWFDfB9ZXKb9_dnW5epZKhFOokcmDG2hMtSoqc0L8hdxRuw>
    <xmx:ZDHDZpjnzVncYWNQQ9sXti9ifRE37sq_3jgO06wh1Ws_iJpEXIt7uQ>
    <xmx:ZTHDZlHwNELX4juhF0hX3MNaSo5vEPAAkBoRhRxY2a9s9ALYLs9L-958>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6086916005E; Mon, 19 Aug 2024 07:49:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:49:36 +0200
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
Message-Id: <5cc72997-3449-4df4-954c-91afe1547c49@app.fastmail.com>
In-Reply-To: <20240819113855.787149-2-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-2-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 1/9] usb: ehci-mv: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  drivers/usb/host/ehci-mv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
> index 2f1fc7eb8b72..33d925316eec 100644
> --- a/drivers/usb/host/ehci-mv.c
> +++ b/drivers/usb/host/ehci-mv.c
> @@ -260,6 +260,7 @@ static const struct platform_device_id ehci_id_table[] = {
>  	{"pxa-sph", 0},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(platform, ehci_id_table);

Neither of the two entries is used any more, so a better
fix would be to remove the platform_device_id table.

     Arnd

