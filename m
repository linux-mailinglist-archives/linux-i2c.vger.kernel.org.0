Return-Path: <linux-i2c+bounces-5524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746A956A1B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407CE288362
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE73116849F;
	Mon, 19 Aug 2024 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fG+BnmgK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qk3p+HfW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F0166F39;
	Mon, 19 Aug 2024 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068704; cv=none; b=Fzqjg7z3B/ZRelVLSSmALt54yig8qyUEfzmw2CRxFNzDC/ffFngk10r/cuQPpgOPFSf0R61NB7Mk8TJqiVOzgWTk/5PBOzGPtwC+ukPHOJR33IaiAlgvd++dq0Q5uiQaOlOPV4hPbVWvnpZREzimGXs5WUPBnWEUjLY6jkVu/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068704; c=relaxed/simple;
	bh=OwzthXrC3kqgtedRFAZH94vXLDyQn8vEa/2KQgncapQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VnhtBtJgPubnvYfihMNUIb/IHCCm+R/EvT+8U1BCWe0x1qcagOwVeB4OaFJZ4oREKVc3DlXLJGnLONqQQkRN5T43zDulKIGNmvAsdMhVW0hcmm31wxCj2x6NoUcSS2x4vMpry70OnOoCje7X30AjykYHXN2nYfMAxJE4GIvsBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fG+BnmgK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Qk3p+HfW; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1F6F8138FFF0;
	Mon, 19 Aug 2024 07:58:22 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 07:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068702;
	 x=1724155102; bh=1q//rQDyx9VX653DFqklT+rFuI5QqQwJi4cGGdU+mLU=; b=
	fG+BnmgKh2r2F6/TJvNU8oUCDU2voklpgpdl2IGU7DDXViLSqIkoHeHimdGk04Bl
	ClBnoYKtzbSkKGPdiNf0g9KCf/hUzG46+JzYubftlQ7XN6vMENZfxUsKWiJ54kzP
	kbxiGn+RuYHwEmEvu5Z7YEtP0j5swfgXqar74/5Hc+NT9qNRYIAFXKWRAlCKR2UV
	egJ8IBcjSngkSqRa7bLX92gFkQyQqJmWS15yFFKS1z8ITFSZIpWakr5cR6QKCGJf
	p+K9kOilP52YSR1FXGynUIsb6YYGx6SiA80W4m4HQU82hzZaPcuSZsejTEdjbhkz
	7fgF2Fjue9XectUND/9iVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068702; x=
	1724155102; bh=1q//rQDyx9VX653DFqklT+rFuI5QqQwJi4cGGdU+mLU=; b=Q
	k3p+HfWDP7eMOP0dCowh1s/eJfGGUJf7xKhidjR5W8Dhn+NvW9MpGQYKqDeNRy9q
	ZjY6IIn7Or/d88ZSmjzSflWj97gYMz5qukje9Sc1gd1PLnN2Dr8L1q+7sVSF6+2d
	YCekXdKakkNUvxFWQbj9U+B0SCcYSZ3+IPwHCbQCg8uunJ91JOhLNYSOrn49imao
	lZRnzhvemh+gbxsPRjzovwmJNLxLpKTeLZ6RJwIpdIU71MwVz/AxvgiNuofX2FGq
	cKKMyXy8FtGt+uvV95z9A8ufteIsMghlauibxGKXXsbSCeCYHr1AVnFfTJvN0+vP
	pKeJsLxstv/GDF615j8Bg==
X-ME-Sender: <xms:XTPDZnx-aMkctB6VDOuHCgNxPMWsNdKNg88lEqS-W6MRrSqBNeegEg>
    <xme:XTPDZvReZw1zxoKn6p_9vGcMiFFjP7WNRk3kNJ1POKEHAlMy_sldj4jcCFlt7q2eZ
    g9ajkOsdMQgoPYUNUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:XjPDZhX-oqwAzr6WjjivovL1XLDiHvpbVVTu_sZVWxHpzB0z6964iQ>
    <xmx:XjPDZhh57Ke7HHK7M6VgeziyeE5iD-PJ4OBLAB7eGXDqBA4UqstCcQ>
    <xmx:XjPDZpDj3qI1FqH9zKE5v2fmWdZXNVqOHp7j25-4nFcgHqdN4H7KeQ>
    <xmx:XjPDZqLgAMN94FAKPhoEw8kR8Dv2by2RW3Rvxj-PNx3M3uPXVrrtbg>
    <xmx:XjPDZmMdiCbxn5ftHHXlGcMZVVeunv_wToMZyj6H_dMsdNDbkYTS3ovh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DEE1416005E; Mon, 19 Aug 2024 07:58:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:58:01 +0200
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
Message-Id: <358410e9-1f0d-4a8a-bf74-084a8ea62440@app.fastmail.com>
In-Reply-To: <20240819113855.787149-7-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-7-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 6/9] dmaengine: pxa: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  drivers/dma/pxa_dma.c | 1 +
>  1 file changed, 1 insertion(+)
>

The legacy probe will soon be gone for pxa, so I would skip this
one, like the other pxa patches.

      Arnd

