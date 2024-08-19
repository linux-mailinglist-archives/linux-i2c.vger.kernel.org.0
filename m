Return-Path: <linux-i2c+bounces-5525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CA956A2B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 14:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6701F224DB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 12:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FFB16BE0B;
	Mon, 19 Aug 2024 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KW3ZpznX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AT/Hu5+i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E65416B74A;
	Mon, 19 Aug 2024 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068808; cv=none; b=matZJc0eC4W+yU/or33FL1JRMazkihZ2/hnqRupBPD87HszV/P3BqMZzBllGi0JjudLnS1Jq7vRheiSf1HobnZ9PzT+e5rBTmiI1N6GGIRvpaiUP9T77gkn72jA8Su8cXEIr3Oh/7inDCsZYkqczzsPjr2VfINYumwMPBLk4kJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068808; c=relaxed/simple;
	bh=iDrEGmSNCm5OVBRdXZ9XXVe70eduPPGQ+7lcstRHaLQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ix5sWQcMSLL7TZG0x8yLkD02rUnLQz+lWTNFRn6CddrNBovVNA1VpVwLXalUC5oaZW84ZIlxUSv3xXJ4qf4k9q8tx9VHtpVvX2GEeYjm17SVo/4AAF7lKdnP27+/0YfIHNfQKJWuJ9OotDho+z8cX4OxnQxmKGlrosg4qNJr0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KW3ZpznX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AT/Hu5+i; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4F3DD139000F;
	Mon, 19 Aug 2024 08:00:05 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 08:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068805;
	 x=1724155205; bh=FuPITkLqybdLS9DuJdexbxll62i2w91A8cSghiLnzn0=; b=
	KW3ZpznXU2H7+8DRp8d6npe+AcJhyOwrRIgXcRA7043A4zXPG3hUlNI5y7dNZygH
	nd8N0PITnteCWnNyonV1W3AR9TtpTQ+rC6hizaZIy7TAR4G3Za0Bcwl/21ipUmcT
	r/+R1xaXxZZEIuSNpimmQFYq1q7/PR9NOmONOtZF0OiRQZbiDxj1P4VriAC3St0m
	EKghRPGRKxMsCnYf+zQjzhDEcjztWuuZ95PXX2GXWLb/IbdGhV/90PDkroj3TxMd
	DaRe34C/5WCwYyPqliRgil1iqfysrZk3L5wM8Kf4G2DOJQXJyDyhwosc3hpLTkFi
	mMFUK3b0AfVkHTsnDZ1igA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068805; x=
	1724155205; bh=FuPITkLqybdLS9DuJdexbxll62i2w91A8cSghiLnzn0=; b=A
	T/Hu5+iYvuqBMRavIX2G9W+sI5QgUjPSQXYLkiJGJsfFcw7d7b4svFnsBX2+u/Uq
	6iSZ4vQf1Q6bTvhWm8eO79xjAUbIKE8yiwTl5aAUSoZ9hhS2vVJWdl6HUATtM1RC
	ZxfKDm3nLLP3M3AnVeMToQtvXF0xcySenzFvEnJia3aSJQWNNsTCwzOuwMvx9Y++
	RIPR0kCCjMS5gg/IDo2FdVoiNV3XNWeOx0qGc3PvjE5j+PQbwYTIvAFNDeA6RM+B
	64VDlRp/bF6ORg/Cg+NijW/pRFMzHUMTngQLhBWGPbgNrPW0397y4pFCVW4V6+CT
	s031xeKCID6e55VheVu3g==
X-ME-Sender: <xms:xDPDZh7RbmnNSjeUyqLXOOyDoRZ9czKmcbuD7K07QLqqPXjl-Kzl8Q>
    <xme:xDPDZu4Zrocko1nlkgtDgjtXZS8TfB6TeAtlRf3sZdbCoWG-8wSWg7O011wjHDBTz
    oLRj26u8pVYSzd4kpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorh
    hgpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepjhgrmhgvshdr
    mhhorhhsvgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllh
    honhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihm
    ihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepmhhorhgsihgurhhsrgesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhuhihunhhtrghouddvsehhuhgrfigvihdrtghomhdprhgtphhtth
    hopehtohhnhidrlhhutghksehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:xDPDZoc2NXOPyTQ_fhwgZMdTLW7Euf55DseZChgel6Wv5gYa9SoiCw>
    <xmx:xDPDZqLt_Hc1zrLrRUwQdnRlZHNOrT0q4CYNBafVF53xDWwj0QUb7w>
    <xmx:xDPDZlJ-zB22W3TIqkHa9huhk0UdfzX11LDSdEZanSLqIY-uPS1NvQ>
    <xmx:xDPDZjwRDnrjI5nZTH9jaRORhn3c1gIceD6WXLEfxFkxyE_fxxNO2w>
    <xmx:xTPDZkV7Uy1XlVd6Sz32EMCRHZ2dlrPaHWVQ3Ocl-QgLLsv9aYXoacyO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D99C16005E; Mon, 19 Aug 2024 08:00:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:59:41 +0200
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
Message-Id: <1dfd5bdc-36a9-4ccf-a07d-815f9951f3e2@app.fastmail.com>
In-Reply-To: <20240819113855.787149-8-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-8-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 7/9] dmaengine: mmp_pdma: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  drivers/dma/mmp_pdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 136fcaeff8dd..05d051ecf833 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -1129,6 +1129,7 @@ static const struct platform_device_id 
> mmp_pdma_id_table[] = {
>  	{ "mmp-pdma", },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(platform, mmp_pdma_id_table);

It appears that this table was never used in upstream kernels,
as the driver already used DT when it was first added.

     Arnd

