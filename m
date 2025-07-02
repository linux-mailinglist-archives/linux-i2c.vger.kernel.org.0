Return-Path: <linux-i2c+bounces-11791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045CFAF62E5
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 21:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47FB65235EC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 19:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D309F2F5C32;
	Wed,  2 Jul 2025 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iphs3Fr4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FC1F1306;
	Wed,  2 Jul 2025 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751486262; cv=none; b=f9sejaQejhaqyolV8ErsgxRppKx10TsThTj34okgyhxxXA6NkeF3qs/qF2GVI89rTrN6+Pns264Lnm4loXI09g1i2yRlrPW4geRnEen8mKXDNtvVl+Pp9Bm+pVSq9nqluKQ+QkqkA5pXL7klH9ZinTA3Lp4eXWE5GPSU0E5nU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751486262; c=relaxed/simple;
	bh=CaQXOmGi1Q4hapePQLyAziFqod4bCIqfR+jrX6VTL94=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=g0Bncl1gTzQ7NNLPJsa+7pin3Bi3Bbt6ud91+VCtv+TS5ZcrRN6XKjoeS74w/ZdTypY8UfpY726nSonbDfrO4gcYEoDblB9ZnaiDMRvQYA/j6HRf/Chi/NO4nq1TrpTFSytFHwbalZG+Aj2P4Ny6bVsU2UQCPc2fucBsH2nCsrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iphs3Fr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2FDC4CEE7;
	Wed,  2 Jul 2025 19:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751486262;
	bh=CaQXOmGi1Q4hapePQLyAziFqod4bCIqfR+jrX6VTL94=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iphs3Fr47nWhPR0TagxlvNifwvoipDSOQbi9gEDaqxer7o5R3rwhexpiw+MxfZQ1u
	 1T/wgYkjS39E64y2k/kFWowyaORm+eOxHZbPVpm/RyaEX967hz53DKJy8jHVQ74gDD
	 uxYv/eEKpEdwFhX2SQ0ePE7O73BUjPbA0mPN2ZtvRln7myS8SyAQamergJDu+lNqSy
	 6MDhVy6t+8DutVkRvYGv0SCDbq+YBdE2cl+3c2VpXE1f2LB1EobYutBkLpw61ULGFm
	 v0RvrEDiMNc50AMBjt4JOc03BHlzcScYmYQ0Brw7tT7aM967kBApfeLFLMLkEbEN6Q
	 FCTpcbdusJgyQ==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6F059F40068;
	Wed,  2 Jul 2025 15:57:40 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 02 Jul 2025 15:57:40 -0400
X-ME-Sender: <xms:NI9laCs28QYlhPXfNvAXECAXg4qbxhG3NuDCBMXg9YZfRFjAY3ul-w>
    <xme:NI9laHfO-CyLcRVqKE-_Ol55xS5aXihGQeRdR8XIEc0iMEY1hznDUBHvDOksQBBDG
    S9-EIZPOlTvXWVMPyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggr
    thgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghlvgigrghnughrvgdrsggv
    lhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvg
    hmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgsvghrthesghhonhguohhrrdgrphgr
    nhgrrdhorhhgrdgruhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NI9laNwqgy5fmKbVuN6ufKbwO6ci8zaZO8U14JNHCAEgzh5P4AhQcw>
    <xmx:NI9laNNTDjb8W7aNnQQcl_IMMDlm4R1XJ0V42VSvlKV20oZtIMh-Vg>
    <xmx:NI9laC8HMWDKpPVud9dKnhSew2dXQKf_9r40M52mqN30aq_C-E9CWA>
    <xmx:NI9laFXljuNhqBIZQBYp2UflD1FESwb5MFox1kvgplWN5ZIFPu17ig>
    <xmx:NI9laLeU29iC9nuQZTXb33cj2kzAeIBV2fTVHCIrvSYT0kEtjwVZsWbA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4464B700068; Wed,  2 Jul 2025 15:57:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf4af6f8839cae169
Date: Wed, 02 Jul 2025 21:57:10 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Robert Marko" <robert.marko@sartura.hr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Mark Brown" <broonie@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 "Oleksij Rempel" <o.rempel@pengutronix.de>,
 "Daniel Machon" <daniel.machon@microchip.com>
Cc: luka.perkov@sartura.hr
Message-Id: <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
In-Reply-To: <20250702183856.1727275-2-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
>
> However, this means that new Microchip platforms that share drivers need
> to constantly keep updating depends on various drivers.
>
> So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> could instead depend on.

Thanks for updating the series to my suggestion!

> @@ -174,6 +160,27 @@ config ARCH_MESON
>  	  This enables support for the arm64 based Amlogic SoCs
>  	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
> 
> +menuconfig ARCH_MICROCHIP
> +	bool "Microchip SoC support"
> +
> +if ARCH_MICROCHIP
> +
> +config ARCH_SPARX5
> +	bool "Microchip Sparx5 SoC family"

This part is the one bit I'm not sure about: The user-visible
arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
here, or more generally speaking any of the nested ARCH_*
symbols.

This version of your patch is going to be slightly annoying
to existing sparx5 users because updating an old .config
breaks when ARCH_MICROCHIP is not enabled.

The two options that I would prefer here are 

a) make ARCH_SPARX5 a hidden symbol in order to keep the
   series bisectable, remove it entirely once all references
   are moved over to ARCH_MICROCHIP

b) Make ARCH_MICROCHIP a hidden symbol that is selected by
   ARCH_SPARX5 but keep the menu unchanged.

Let's see what the sparx5 and at91 maintainers think about
these options.

The other patches all look fine to me.

     Arnd

