Return-Path: <linux-i2c+bounces-12943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C931FB56A8C
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 18:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C904177879
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 16:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029012DCC08;
	Sun, 14 Sep 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="o6BzjhQT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e9vHFZqc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A1C2857CD;
	Sun, 14 Sep 2025 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757866986; cv=none; b=oiuSXwLlq0vXPFiGgYKNlW5Nl+JDzRzH0qym6bzlkpBxxZse1o6japn6fgsSguKdnMY8fN4SDI9SUVRfDSs7iOEUoGxOXdL1u0K17khHi4hecHcGhjGUqmgr8qbkvwUOVV3Y+6GhA/qpJg3xERGaBOcikKsE6Kpk0iMcsuxIczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757866986; c=relaxed/simple;
	bh=dQxeITb5hY6qfYJHe0khMY48r+n3JwUcweNzQW8TgQM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=F+B1Nm33z32rc80mYZmIq8deKbJ5idn7fT40zqT4OZ2PN4TV4OPjyPdCzB6YTUBS7XDGsyIGPacCyJFgCi65Tfe+WpZ0khpq+ciuqHqZeOCSk45qF9TcvR1erHge06ErDT2kYfMPR9rpf3uTmQQjIXsMUqVPYj+IJDBJcGLHlwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=o6BzjhQT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e9vHFZqc; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 2AD5AEC0A77;
	Sun, 14 Sep 2025 12:23:04 -0400 (EDT)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-01.internal (MEProxy); Sun, 14 Sep 2025 12:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757866984;
	 x=1757953384; bh=GczAxd/yOSl3eyN3svqHIDHZRTOmApw3DytFsK5tSX8=; b=
	o6BzjhQTP5L8iMh5iwoe0nwR2vEB6NL2HM1yh20N1T67qvJxkbtvyHVSHcfBozG5
	xt/2Sb0flapuO8VrdLs0hzh9IUHcUAaIdWmptEaQjAyKBDiL4f1TwkJUE/QkmTPv
	uEvaxkyBEwhsFb3zYNFQLfZzpjvJ2CzDI1qdWMlAa9XvtA/4wUo6xvd8ap+MIPbJ
	zQttLtiY3z7wCHKR3j+XyhxvHQ2URGvdhNCMu9JBdh9zHmVFdZwOm7Eb65kOuOsv
	42Ti13OeB1AZSydiu5rzfv3zAaDIsOo7Q9WzO0RyrEkNtg8RXftXWhwGVJzoejTi
	zD/lZUHhekmAxVc00k0Vcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757866984; x=
	1757953384; bh=GczAxd/yOSl3eyN3svqHIDHZRTOmApw3DytFsK5tSX8=; b=e
	9vHFZqcSBnE7AlrCG++OwRj8Z/hghx12ugNsgf1QNu+TD7vYLFRX4qshSWfMCNgs
	PRIbxCAmbZy14eBNjGHuh68RX3/3hUtWJZists/pjouPAibe9m368whsGYq8H0SP
	CHq9PcFJsxX1EeJK/JvpwMdO05iNczBDkig5EgSKj+io5tgCS3wkaiDSkUnliM7q
	pFKnibyhFCQkOnF2F9amLC0EtFXYC3I1vhJm7YH+AuC9zbZVfehJohp3wtVVQZOF
	nf4bFSPrK3jJpEYpnRSSEUyIdpmgqhY5OriElkSqGnulubkeH/qfPtTn/2TkT6X8
	g+uJloEzpl+PnlXX3VytA==
X-ME-Sender: <xms:6OvGaFqpOjQHw1xk3ksYXbQCpUffVgQBGYEx1tnN57wACc3Q20EXng>
    <xme:6OvGaHoTD2QANLuMeB62khLtZ0rwZKi1ayIJy-Zz9CClkesL9Hb-66tJl72q5rnjm
    nGH2pDrl32oicMAW5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefhedvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdflrghnnhgv
    ucfirhhunhgruhdfuceojhgrnhhnvgesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
    gvrhhnpefhjeehgfelteeggfehveejffeiffetiefhfedvgedvhfeuhefhfeevvedujeej
    ueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhgrnhhnvgesjhgrnhhnrghurdhnvghtpdhn
    sggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthiiih
    hmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopeguvghvihgtvghtrhgvvges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhgrvghnghhinhgvsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohht
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgtlhhkse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhpmhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6OvGaLO6OGSABlTgyVpCBq4izaQXqPCLnwPq1zJn6Wb8CqmwFXIu9g>
    <xmx:6OvGaHfsyb22a_XpgwB4rkFxKLcTn8av3ij_3k9M2ALzaMizaBQkvA>
    <xmx:6OvGaH5xxovP0RM7_DjTNkipNuxf-ldkaY53k1ywEIWhwMbdjL9iMQ>
    <xmx:6OvGaHI5Xb6MzhkDL3DMaJRpOPyCFgroir9wessjpzB6xBDGQzbhyw>
    <xmx:6OvGaFA97CvX_IKWQ_UH_Jswf1GDUi8s5cO4sx4IrLCj-6mCdJcqRJ2w>
Feedback-ID: i449149f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EAFF03020073; Sun, 14 Sep 2025 12:23:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATYmlVkkxBG-
Date: Sun, 14 Sep 2025 18:22:36 +0200
From: "Janne Grunau" <janne@jannau.net>
To: "Sven Peter" <sven@kernel.org>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Neal Gompa" <neal@gompa.dev>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Hector Martin" <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Mark Kettenis" <kettenis@openbsd.org>,
 "Andi Shyti" <andi.shyti@kernel.org>,
 "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "van Spriel" <arend@broadcom.com>, "Lee Jones" <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Michael Turquette" <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 "Vinod Koul" <vkoul@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Marc Zyngier" <maz@kernel.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Keith Busch" <kbusch@kernel.org>, "Jens Axboe" <axboe@kernel.dk>,
 "Christoph Hellwig" <hch@lst.de>, "Sagi Grimberg" <sagi@grimberg.me>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Janne Grunau" <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
Message-Id: <175786548038.4027671.16854298573806924090.b4-ty@jananu.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-31-bb8e1b87edef@jannau.net>
References: <20250828-dt-apple-t6020-v1-31-bb8e1b87edef@jannau.net>
Subject: Re: (subset) [PATCH 31/37] spi: apple: Add "apple,t8103-spi" compatible
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 28 Aug 2025 16:52:09 +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,spi" anymore [1]. Use
> "apple,t8103-spi" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> [...]

Applied, thanks!

[31/37] spi: apple: Add "apple,t8103-spi" compatible
        commit: 3f2ed0057369d07c20c7ab48c1c46dc77eb436c2
[32/37] spi: dt-bindings: apple,spi: Add t6020-spi compatible
        commit: ffea30e9e6178eeb7d9c165b0b0b2d2e7c5f4fbf

Best regards,
-- 
Janne Grunau <j@jananu.net>

