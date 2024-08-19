Return-Path: <linux-i2c+bounces-5521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5459569F8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43F462866F5
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8BE167296;
	Mon, 19 Aug 2024 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="g1h4/euP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m4Ytw3Cd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB7166F01;
	Mon, 19 Aug 2024 11:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068478; cv=none; b=GKw2Nan8QQ1+c3mWv7yIOaghGa0XbPVV94Igb5PJTmBleGCvcDbXLTbk6joHMVNF2Ep9Il2M0f86xP4p5ctwg/Czro4jD8NyvdlrEsXbo73janXvSK+W1z4I1cVx+ScDGp07wll09Bsp6hIhd+jw+EzuHy+hpobDqOwFhjixIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068478; c=relaxed/simple;
	bh=VNq3IlfbDV1ibvgDW6uF8qrydky2z8pnjXOMSJ+rlwo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=c/+QJ8tNcDHajc06uN0awcgPCoONSSiRcgsU67YDFmr/fYxl+YIiYrvGszw+WFkJYXzrpVzl3SOIZaH1M7Gt8iGv++yexQrvRKM+QQooyfdBXkUYzVohO4h1PMHUv/RKs77zjRXGdzouKeAS/K3RwjfketNvBh1aBQ0jxJ7PJQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=g1h4/euP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m4Ytw3Cd; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 309711151A8E;
	Mon, 19 Aug 2024 07:54:36 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 07:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068476;
	 x=1724154876; bh=w0EwL4CVFZ8sZd5EMhCHt3BOnPvA/ilrA46joebb7Dw=; b=
	g1h4/euPk4DQBj42SUZFFrt9XbPQ+iJUjqk+FqBuxJUMIm5eNPaV0u2HSI/Wwkom
	TmTImqICCnYKEM/Xe4wlLGmBi4ClO5Q18XEoIrzHUazeH8p46wj9YBsV+ZLfgfKv
	dgTeIbsmiRKnRPMFaCAruW8hgWCGHKQ4jMI9DoRPzXdZWxsQO+lpygx7Hqx6vz+n
	uJ6NTTu3vGL8AvPT6Ybl37HXXMxc92EkoMrXA7g2T2HkzlJ42lf9Un13yy2/eEoM
	6qv6G/Yjk8SwUwRIatvB/WLmyur8GO/TcTd8EVpNAQpjGLqo9OOWVmQ8EFJhwwpv
	fD49MigGEr1B9NDA4w8UQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068476; x=
	1724154876; bh=w0EwL4CVFZ8sZd5EMhCHt3BOnPvA/ilrA46joebb7Dw=; b=m
	4Ytw3CdvbMaLvguyG8P4yJXETQyk7eD8dGP2vhofHEpxaF3MitMrs4GyrcAZhT6P
	U3Pr4zg8R155ePyO3WTR8Wbn+ZPX94aWu4QKj9qK2JOg3P3586T1J3g+b13vbYXI
	884/B7Oy6edFJs9OyMq0TSpEdF1kA/4dHJAnko+/mBobLb4ipVZCL3zU9A+8j4am
	SlyymkuWB0ZBohg0DBBUNUSDvp+5gUx56eOzmhWXWqHkcSvOkxjhCZgNLoFb8swd
	2Z+fBgljSebKKNV79jaMzyFES1/07XJxBUfDIUxWty/ISnTmHxr76+MVILRbbWsa
	j5lTDkxqqNQjzkstj89Pg==
X-ME-Sender: <xms:fDLDZsUS9sfeyFZ0wTAq29wU_eAajSGwg94wUvkvKWKv6l7b0FHW-g>
    <xme:fDLDZgkYNaRaVWYslPldoJ011E7IMPLixKfhb6wUfiJwyniEwhda6xyTKh97HJnbW
    nC3rrj4DcZSwVS5dsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:fDLDZgaq34t_rDiWtB1xb6VhMgckC_O2Voe_ICsywFjjA0F9OerwzQ>
    <xmx:fDLDZrU0aLfE4fw9nv4s0J5klocLHzL9XGDNIaiyeeLDPK9r9ajP1Q>
    <xmx:fDLDZmnT2H_8B9VbzqM0JJjzECuzZe443msBjGEL5GvQY5h-OW6RTQ>
    <xmx:fDLDZgf29LCtst48VJ75pbHDIUrJ1zIp2EXmFevQAB9Rz0nR4zJTMg>
    <xmx:fDLDZkz69b5lMK5e-FIejr5zHi-RGPJyqHrwNpt6-63dwkFVQbvm7OjV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E662116005E; Mon, 19 Aug 2024 07:54:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:54:14 +0200
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
Message-Id: <2f8e1f68-db80-476e-b895-4d4bfad808d1@app.fastmail.com>
In-Reply-To: <20240819113855.787149-4-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-4-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 3/9] misc: atmel-ssc: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  drivers/misc/atmel-ssc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
> index 6eac0f335915..e7a87183bfbb 100644
> --- a/drivers/misc/atmel-ssc.c
> +++ b/drivers/misc/atmel-ssc.c
> @@ -110,6 +110,7 @@ static const struct platform_device_id 
> atmel_ssc_devtypes[] = {
>  		/* sentinel */
>  	}
>  };
> +MODULE_DEVICE_TABLE(platform, atmel_ssc_devtypes);

I think this driver is autoloaded by the drivers using it,
so this entry is not needed. there is also an of_device_id
table that will load the driver based on the DT information. 

     Arnd

