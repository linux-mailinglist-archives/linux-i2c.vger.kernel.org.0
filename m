Return-Path: <linux-i2c+bounces-5529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFE956A81
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 14:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3A27285757
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122D916A92B;
	Mon, 19 Aug 2024 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lDiDNa5F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n8zFVONy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3387C13DBA0;
	Mon, 19 Aug 2024 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724069412; cv=none; b=GigDflWmZOaKsKXXJX1ZTVkXEWS8/VF1Syt71un+Be6DNFPywJon3gIN2YsW0UEd9SsfKxAiEmcjkL70uIqqIRl/TOVekijKGDKTLAMmByJA5nAbWOWpJjcQWGRCsBJtnZs7LPi53oZb8wa/q3edXVP/g/H8WvigCDazqAp5mLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724069412; c=relaxed/simple;
	bh=g4fRxWdtB8cYXd/knv7r4y7hJBEWUWWSYMT/zc+T5/4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SO3jWtMgkrTvb3FyFJlqTfvmqaJh4j3THSIZ1kt/CWvYGwyibNY9kYo6cRpRima6q5sSoMndI02riBTsv5r1esRXBn/aQuBaIOXL4avIW2srKlweODzpZszNlOwjlTq5knEyoMrXSBLkTbTmcq3o5ai1elell1XoVAKyOuY9GmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lDiDNa5F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n8zFVONy; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 34FDE138FFAD;
	Mon, 19 Aug 2024 08:10:10 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 08:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724069410;
	 x=1724155810; bh=w4XxV8t7d4FBrTlqfBcRiEblpXOgHlRWhYqqGC4/luU=; b=
	lDiDNa5F/o9fcqf0G4hzpgGyH9KHBFgBzxWmc3LhYcEP9NkmvSR37b1D2Z0pYpwF
	F0osr5zzhScCQCkIPNZBww3Tsk6sq1YwIm57bATTawnERylWjk33hIedQ2c21yBW
	a1a9eB+EyUdgs34Q6NiIEu4ytg742QLXywYPWf+Xskfus7xIUsgOhez+Iscslh7v
	h8vHxKWaP7nXLuIZ8CKbmTWQ2ujJULeyHKbZie3utA3+61wA35NyNzA7TnVuEPOo
	pOjaQR6HF78lqBmrFiCdOugMKkPk7VBM/+43inH2D9Y5oQEDqmb1QOMpg3ekYjoa
	T/iz4OWThMwUU1oRGl3sAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724069410; x=
	1724155810; bh=w4XxV8t7d4FBrTlqfBcRiEblpXOgHlRWhYqqGC4/luU=; b=n
	8zFVONynTFpiO6L7zJJqjx1ZGG6PLfOuRvZ8GbG7OxaEj81DrMicWtHJuvtv+G7T
	Fk3yp4tx6H/sI1OZDsEltyp4A9QdwJRaCfDEQc0vkVZCKmsRzF4Ll4rLcvXQodAa
	0IBLdhwoANZ1hJxb5UEIBWgD81A1SiVCam/zbK+ZgtrpEQsE7fjRg/S5XKXpQhuI
	j/F64rTi3Eok6HjnCn/qVCHSJVTlP2rvov/ZyVXrN6o0YIfHbAbn+JbjbWjxCrEk
	YZMRS9Ng9AQEyy4uFO8Xw1ii0iJCJq6lnP90SB7S6uctHLaTJo+pIjntbYGSqS/V
	VPhgTcUNPQ9Mfio1+2khw==
X-ME-Sender: <xms:ITbDZoyLPO9eJqFgc3Y8g_ilXhH2-2rSSNSxrU4yg9iEsoIOab8fLQ>
    <xme:ITbDZsROLZemX0CwTOLEqXBXtq17VbRtZqrd7LRa-zRanSbIQHF9cXxMqkuygxrf4
    b-snvuH-HLw9v9z5SU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorh
    hgpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhgrmhgvshdr
    mhhorhhsvgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllh
    honhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihm
    ihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhhorhgsihgurhhsrgesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhuhihunhhtrghouddvsehhuhgrfigvihdrtghomhdprhgtphhtth
    hopehtohhnhidrlhhutghksehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:ITbDZqX5Hp9dIignNuuezrALmI7Z3798s0Sp-aEg0FJ8FndpyFtzJw>
    <xmx:ITbDZmj1eRNKm8AKnOWhzhvXbxWiDMpOK8fpKOip8HW3XoLyHKbMEw>
    <xmx:ITbDZqCxjIVWrZZBbEx2BuPhqg6sFTl8Y2CI7KNHj_2USD6olE70Fg>
    <xmx:ITbDZnL940TwM96itHbUXhsH97zxAtJaJ8t3blm7ZpzJpwohX2DdSw>
    <xmx:IjbDZs6tNV__PXm-XBUnUhSqXn4zSSBOI2f-ROyoA51sXjwvZSZwFOjW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 969BC16005E; Mon, 19 Aug 2024 08:10:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 14:09:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yuntao Liu" <liuyuntao12@huawei.com>,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Corey Minyard" <minyard@acm.org>,
 "Ludovic.Desroches" <ludovic.desroches@microchip.com>,
 "Alan Stern" <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 codrin.ciubotariu@microchip.com,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 "Robert Richter" <rric@kernel.org>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Tony Luck" <tony.luck@intel.com>, "Borislav Petkov" <bp@alien8.de>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, morbidrsa@gmail.com,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Vinod Koul" <vkoul@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "James Morse" <james.morse@arm.com>, "Daniel Mack" <daniel@zonque.org>
Message-Id: <dabde7bf-dcff-47c6-a68d-f5018ab00282@app.fastmail.com>
In-Reply-To: <20240819113855.787149-1-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 0/9] drivers: fix some module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Yuntao Liu (9):
>   usb: ehci-mv: fix module autoloading
>   soc: pxa: ssp: fix module autoloading
>   misc: atmel-ssc: fix module autoloading
>   i2c: at91: fix module autoloading
>   mpc85xx_edac: fix module autoloading
>   dmaengine: pxa: fix module autoloading
>   dmaengine: mmp_pdma: fix module autoloading
>   dmaengine: at_hdmac: fix module autoloading
>   ipmi: ipmi_ssif: fix module autoloading

I looked at all the patches and found that most of them do not
use the table any more, or will stop using it in the near future.

I think your work to validate the correctness of the entries
is useful, but it may be more helpful to focus on removing
all the unused tables, including those that have a
MODULE_DEVICE_TABLE() tag.

If you are planning to do more such cleanups, maybe you can
go through them one subsystem at a time and look for drivers
that have both of_device_id and i2c_device_id/platform_device_id/
spi_device_id tables. If nothing in the kernel creates a device
with the legacy string, you can then send a patch that removes
the old device ID list and at the same time makes the DT support
unconditional in case there is an #ifdef CONFIG_OF check.

If the probe() function accesses platform_data, this would also
be unused, allowing an even nicer cleanup of removing the
platofrm_data path in favor of OF properties.

      Arnd

