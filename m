Return-Path: <linux-i2c+bounces-5522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB11A956A06
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27D4EB2471B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9200216A949;
	Mon, 19 Aug 2024 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="O7u1SbL6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QyKEv1rh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB392166F39;
	Mon, 19 Aug 2024 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068574; cv=none; b=t0Kzixz2XV+z+BDainFJGqkAHrpXcUiNgOgdIu3yOalY1ne/Y+VqJV+5OzIj0KtqnMLtH0oVur9gANBawJmv4TKU+VSISg1KLQfc8x01lGB16mPTqlqhDDJ4rUgXmJL2801g2FU7+wIKFjEcuaZwAfYt9Krnry8IltWZogFnV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068574; c=relaxed/simple;
	bh=HonjLh1BAhaV+0+j9pX3IQj72hpq1/9MeyXqoeJi+rQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PojqAb5ZoD6WEsWl0v95C7hWQ95hdr3WuK0r+6hm6CPP9csHED75Ka4nyA3xA6zLjabfjrbzpdvb9z9LwP1PbMDcSB0wV1x772T0sggMsG6r0McJoVpmN50pVHTTTcIphZMEz5hLoe3HbhWIAiut1ZY0jsg3IldcwcTys+UTFbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=O7u1SbL6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QyKEv1rh; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id C27EE1151AA2;
	Mon, 19 Aug 2024 07:56:11 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 07:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068571;
	 x=1724154971; bh=cXvC+PDGFCfNZv2tzpeZR9KJXjbUD1OJCs6l6aQe+rI=; b=
	O7u1SbL6THHtxLaqYT/wS1NCcNXwIihacG56Qel1rgYi3zWo9r32/bDetcsPqXje
	92cDNIvFwLSCW5yqPa5+E3MT1VJEjrdCnh5tzfoDSdxyDalvXrVQPQaTpS/U3Ea7
	SD0PRkEqQX2y7QRhoNw1QlqYV/efN/81moiNAN0+OJNZz+GUM/YTpmkTxbU4wK9L
	ZXgUn0jdtCxIgY/Rtadt13rZ7ypSkyLkbE/vEtfd9lA5xIeEVwSqab+ZD2QWRY12
	RJVNUJKFwV18VGCUyeVPJq2vyYMrB3XFxIjghjl3MQdLIYEHx37lhVwUlaTW19o3
	WrJkw3cxs4WY54yrq7ve9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068571; x=
	1724154971; bh=cXvC+PDGFCfNZv2tzpeZR9KJXjbUD1OJCs6l6aQe+rI=; b=Q
	yKEv1rhHOdCFuCsNZTF01dKdCWqel7uUtG4PVE+2YcsCnMBvuJCDbN6Es8CvAoFU
	tXADHwLKOrlJgaLRC/11ZeKsew3NBlrDxCJ7XuNn12tcBRuQ2aST8+SK5DOWAFEk
	6v3OB9eQp7oo9EnbiGFCq7Q1bGvOu2fimNye65TR8A0aErvYbihZUqT2G5o5OJqj
	BI0DlwbHa5c0Pt+7N5/a2qbkxnKUyVafm+DOeohZP6MZzsOZkC8Ay6G+PTB2cEpJ
	9z5g9QnGiFAWGygslmPa40bUd5d/wZGRofoESMYSDxYXdm2iYedFKPJMLgi+yHmn
	SDJ54kiQIWf0/QasfuGgw==
X-ME-Sender: <xms:2zLDZqh1puP_R0VtfwNeB17mXVAaDndWItbRiERUf4dtGkKd1rUPGA>
    <xme:2zLDZrAka-p5ceM-8IIyjknjNC34qZ7dNOai5L0SiaISN9mnCj19T8LF6eC-rd1Xx
    5JlXv54h4aklBpi3pU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:2zLDZiEXNXwYilgasJbnpBU9SrAg57hCKnQ8vfIH7KWtaa0bGmy6xA>
    <xmx:2zLDZjTrscr8VWYIX44CvMAJxHbDw2fU6YENea5_7alEhhIKHRg36A>
    <xmx:2zLDZnyhRU-Xf7VKqgXZZ9nofYhaYp3WSsaM-A4S-OFV_ta0ImCP2g>
    <xmx:2zLDZh7G8TZLWaOhE5ubpWUy9lSTFhzgoim9gKCQiXBNnGOKkZ6oFg>
    <xmx:2zLDZg8UBxARNDsUwEarIt2op0GGkiNmtpU_v_VXlOxRuC9NjhItdjE0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3BF5216005E; Mon, 19 Aug 2024 07:56:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:55:50 +0200
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
Message-Id: <6a11b136-025c-4790-a7d6-4a76a5ede336@app.fastmail.com>
In-Reply-To: <20240819113855.787149-5-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-5-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 4/9] i2c: at91: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  drivers/i2c/busses/i2c-at91-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-at91-core.c 
> b/drivers/i2c/busses/i2c-at91-core.c
> index dc52b3530725..bc3636f90712 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -107,6 +107,7 @@ static const struct platform_device_id 
> at91_twi_devtypes[] = {
>  		/* sentinel */
>  	}
>  };
> +MODULE_DEVICE_TABLE(platform, at91_twi_devtypes);
> 
>  #if defined(CONFIG_OF)
>  static struct at91_twi_pdata at91sam9x5_config = {
> -- 

This device is always probed from DT, so a better fix would
be to remove the table and the #ifdef/of_match_ptr() around
the atmel_twi_dt_ids.

     Arnd

