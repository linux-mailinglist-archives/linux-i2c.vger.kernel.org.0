Return-Path: <linux-i2c+bounces-5523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B508F956A16
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 13:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D90531C2203F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E7916849F;
	Mon, 19 Aug 2024 11:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="iAKp/Oxu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rcL8NVYO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661B166F01;
	Mon, 19 Aug 2024 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068672; cv=none; b=JBR92HzkQPVt/5MMbu+trdyEw5i+4yTK23fS0EF/emYT9ZWPevecyathPDzi9tgQxq7TF3A/D0oW220iErhBh3Lwff5ixIiRUeMnFdKGNwsK82BlwgakfSuFOXKB5tZF+sneWQ7O90nhawhJJV/nQ0TX2bxA4dC2WQb1UgUyStc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068672; c=relaxed/simple;
	bh=5Vg4IDhlG137GwbJEdL3OdobSWj0Xa/bnciOrpLN34Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZDhgTHNQHWK3TQqf8lqDuSyVpdpgk6Jyfy9TkEMx9OEobGXU+TKPUvalRKgA2EEcH5+BtkVByoyuEmignxfVz3ACsbbG4YLlcVwBZRs/iwzsTIDzZjwALgIAsEhVWhmNqJwgWuAjQHQZpjVeuJLdo1FpZbT6alOl56FpY2GvsnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iAKp/Oxu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rcL8NVYO; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id C46B1138FD76;
	Mon, 19 Aug 2024 07:57:49 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 19 Aug 2024 07:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724068669;
	 x=1724155069; bh=h4wzlPsfJQiRwt3ClGapHTB9X8sJmK/ibZX4Or4H7kA=; b=
	iAKp/OxuR/WBF3sTlSd60iHsBjLLKhIFOFSyVUEV6F/Zd1HXCp4hRH3CLLK/AoTt
	xDhpIBRUDAyrWSTOkNaoa0JIQ3pGslFe/0dBvAh/4ygmvnKnNrPAXuAKRSM/MS+i
	dX1gJcds65xhjUDJFs+PM4RdxaWuQYIoPSO+7hfo+kjitNkIonYJx8X2+HZRpv8a
	3m3Gq/W7knLo6G1lVGwFFQGyaZ3QjfzQ1PQukatDHDR2jHRtY9NvQiGSA0LucOeG
	4y0wv2g44X+KTJ394UCvQB/K79BXy9aL9Xs206zqf7dKPsAWUptutNPx0doP0pc5
	Ycnr/sMotQEv2lkRL12BkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724068669; x=
	1724155069; bh=h4wzlPsfJQiRwt3ClGapHTB9X8sJmK/ibZX4Or4H7kA=; b=r
	cL8NVYOgjDHTqB1UiVRyl8BFVwa/jLdJvE0Keui998kkvQngvDRZWr2iBzoZWIRl
	4xMSif+DTf4Ekc69tHOQbIDQY+31sSO1Hu8nXmbWOi/SKY7IJa8P7Bj+JiIBCbOU
	Gjz/Az+taJTfCid7X/Qp1q59tm598/kakx0xhoBaUv0I4GmCmrs2aGTtf05Rib6A
	Pr4lpxQA5+qkLW6cCue5+XqXE/QCOYOB5keSJYsIpIRJ5jKaDKl7RnVaVdj4dAvm
	MiBuLoeqKnziCNNjmgNEQ+6aLkT+LPastI1Ao0mT2Smn6fzR2uANKC+4wEb6Ri4L
	kb2+Y4td6gdvkCCCJi0Gw==
X-ME-Sender: <xms:PTPDZlETO2xwMA9OPitNmD4B1D9hCIbSjyNw8eyJyPJKM2EpkdfPhw>
    <xme:PTPDZqUbJH2dXXogHID-n3vYpFEhiv9Vp28T3sNiEUNcOin3clexDHLSI4DAYAzqu
    _O4WfBJVvMxorpEhkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddugedggeeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:PTPDZnJbskLLT633CZqWiWzTgD5-_sTSRDEwamyFbWWi-vraJx-yWA>
    <xmx:PTPDZrHHFBIQO4cRe9p2mxsAHtkFXqn_SZA2UWmnymm6as0Gu278rg>
    <xmx:PTPDZrXQsS8DoqzPYbD2_IDiLcDuQ1DBc75Mf7J-9tm7F6vdTmkxxQ>
    <xmx:PTPDZmMX--2dtB5QGgl5Edzu-KroeCUlJaezHtJykz7zdXtyaAL__g>
    <xmx:PTPDZlj2BX2ZPqgYgGZamuzLIlVr4h_o0Z3yCJGpJtHggArS71p0_Y1S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 93E5E16005E; Mon, 19 Aug 2024 07:57:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 13:57:19 +0200
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
Message-Id: <d4024f47-96c4-40f2-8bfb-09f3539b2ed4@app.fastmail.com>
In-Reply-To: <20240819113855.787149-6-liuyuntao12@huawei.com>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <20240819113855.787149-6-liuyuntao12@huawei.com>
Subject: Re: [PATCH -next 5/9] mpc85xx_edac: fix module autoloading
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from platform_device_id table.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

>  	},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(platform, mpc85xx_pci_err_match);
> 

I see that this device is created in arch/powerpc/sysdev/fsl_pci.c,
so your change makes sense here.

     Arnd

