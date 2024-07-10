Return-Path: <linux-i2c+bounces-4837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D392D1EF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 14:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BE26B23FBA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345621922D6;
	Wed, 10 Jul 2024 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="teTIciYZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="azzoWZRU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow1-smtp.messagingengine.com (flow1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7306149C40;
	Wed, 10 Jul 2024 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720615798; cv=none; b=ht6/dn0emvSe7mNovEi/4EMtKGdL2Ar8XNMd8ud7YiuWE9ZBWqODuhm74l9orIUzVq2+E8QGfcFBjpXiv85IMH6oLo8dPM/tOimjcmamnkdnnZlLa4OX1kl8uNTGLdXYxo2oZqz8xVMfBfmivxzZIMtiu0IGpHZ31MtyhPQfB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720615798; c=relaxed/simple;
	bh=bTMI9iBEyKiP0DGKQWj1I7Ep4eh++YGxzDQWSLGLdy8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=AXqh2btiRj5Gen0Qxzn5HgvOaWuwZDz4vUraMtiRV7EmEsw0KVx6RDUvVhRRB2Q4oO5sjDiM8+4XWaySgLwWM6++2yUGffsHFvZ2T3T8sP5A1rHJUBq8fdIyUChO5f/2nLYVP1SlixSaqzZUdvnJ3Yd2T/ke86fDjKmO6EbjjOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=teTIciYZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=azzoWZRU; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id E33CC20042D;
	Wed, 10 Jul 2024 08:49:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 08:49:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720615794; x=1720622994; bh=j8Mj9dw1Fm
	/JtEgtuTD5TSV9xTAWODaAOo5fjhNJeMk=; b=teTIciYZjvnAmtCaBvfsvRNjup
	wfCqM8oj1NVTM4jQ8jo5sskqJd9CXNwzX82No3oPh2ILjs4uutrlschv4dsLphU3
	DoHiZabk+5RNoNoz0INCQm1A/q0azsdpIKZ40BSY9zzvhrlrJsyAZoIB+AdhjZSM
	pglEr9LbbW0omvvUOv9xqemh9id/jhlr5i0OZnHACguZQxkJK5xIIlZPHl7qxIZi
	W18h/fh2fJqcEc9Qy9KDPKHfa/hVK9NfMC964RoDdIGpXNYZKvQ3LTPV8BpbXyRq
	/YSFUKn6ydo2t/RPLCAoY+yDhYs54/3qhWLzotGyYi2xcf1uXo+GhSqGYN6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720615794; x=1720622994; bh=j8Mj9dw1Fm/JtEgtuTD5TSV9xTAW
	ODaAOo5fjhNJeMk=; b=azzoWZRU5IySoav5jThTxI4/AKjfG7wh/UAeG5Y0yp/7
	pSjbpcVBoFNXfnK1AoPP/qA9CqwrRF8Dry0A37SxJCpk4Z5ullPkhy+gC2T5PlNW
	qtHzAzk/b8G5f3Tag6CJRkj0grWKT3j9AAJUB+sBlye1xyej0B+45sVmj7pFPIT0
	0C8phEMHJHLEtbkJkAqgb4SfK8Mg1xM0BHjBi1UepOwgPEnmdulrH+N+Got5FU1k
	1RVQ/Fe3Nc6RoIgAiYJC5LjOoh+Fk0b7Imsv7vkFNEtN+B28lrOP2iHu73sBprCP
	xkZ00fMz0ava03lyq9Jugs0eBmn8yWi7qreY8Gmasw==
X-ME-Sender: <xms:b4OOZh0Add5PpRvK-JwSRnx3M8MLRjt6lQVSLPf8bA1FKB4pYvBGow>
    <xme:b4OOZoE2nV6HZMpoyEVk3eDfC7dus2QqobaL3YCy7l8HFtBHVk97Nwkt_A9WozDEc
    C4EVANiB042rUeaNJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:b4OOZh5zNJxlOfPHh0-H8WYSyelbHHrXbP1YSq7BCS2SyJWdegrqqQ>
    <xmx:b4OOZu1jTQpah1fyyddzLy-SSEDaDFK_TWeDgISB8kW5bliLViVMcg>
    <xmx:b4OOZkE-est_ti1vs2CHielhfk6js_rK4NVMMPgNmJ_Fck8MCdzLbg>
    <xmx:b4OOZv-Dzbnlfj9JbL0x2Cl3B8vEn5obOKRlDMYB5cv0l5MtlBW17Q>
    <xmx:coOOZviKtDwt5hZt1uJ3U9a5Mli5qRUVB721KXhKKAyxK8Y3E3_QlGxR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5425B60089; Wed, 10 Jul 2024 08:49:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To: 
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
References: 
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
Date: Wed, 10 Jul 2024 14:48:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Felsch" <m.felsch@pengutronix.de>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Russell King" <linux@armlinux.org.uk>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jon Hunter" <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
Content-Type: text/plain

On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
> The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
> new Kconfig symbol to select the I2C EEPROM driver support.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
>  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
>  arch/arm/configs/at91_dt_defconfig     | 2 +-
>  arch/arm/configs/axm55xx_defconfig     | 2 +-
>  arch/arm/configs/davinci_all_defconfig | 2 +-
>  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
>  arch/arm/configs/ixp4xx_defconfig      | 2 +-
>  arch/arm/configs/keystone_defconfig    | 2 +-
>  arch/arm/configs/lpc18xx_defconfig     | 2 +-

Applied to soc/defconfig, thanks

   Arnd

