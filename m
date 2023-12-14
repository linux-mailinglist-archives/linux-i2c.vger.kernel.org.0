Return-Path: <linux-i2c+bounces-786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FA812F9E
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 13:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FAFF1C21941
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 12:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC2C4122E;
	Thu, 14 Dec 2023 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fuI254nT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H4hUsGCD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7B4BD;
	Thu, 14 Dec 2023 04:01:45 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E6A1D5C01FA;
	Thu, 14 Dec 2023 07:01:44 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 14 Dec 2023 07:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702555304; x=1702641704; bh=Baksf+ezVF
	lYZ2aIOXFNfU8ikmrbeyERoCYqa6/cW4Y=; b=fuI254nTWrgEL508ZUXSr5ts7/
	kL5NSSYQ9JyWAcH/I0aVXU+xp7FkYXP3UpSL7twuKSg9dSynv2q9ATL6UwFiQntV
	FbjMNsWLD7EbXgwk9sK73Xev9A3NcxXYtKDIxHZ/txh1DZiFkqdYoXWYM0x0qmTx
	VJrZKtRpdftK/xUC9+DUCsVDcEXyPP7YxVl8JYE86kybQ/bVWjzbUvoST4/OeTMK
	dtIcHKbaotzXZ3hN9stNCbPuMbly5XG6BINTpdP1cqEY7GYer2pjiSReD4bIN7DN
	mVJkhwR7P9s/zWjn6jBiAKr9qikX1el6R4abP+xop0BK1YVsgTWELj5R45cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702555304; x=1702641704; bh=Baksf+ezVFlYZ2aIOXFNfU8ikmrb
	eyERoCYqa6/cW4Y=; b=H4hUsGCD+UIpPhvTp6EDda5x184ckDpINaoPPwYhG6Bz
	pHrj1+s3zIJMTXmqdvx/JGqJ/hd2av7VtEQIPEm6WT++DwSy7BMNCiOWGoCPX8Pb
	eyu9Rr7n4WLnuV7XODR4sFJzUse0N2foWWq5LZoxh7urMYi/npT7AH8G5+sJG13H
	qKAxFJyp0e3UC1vTtvJBGJjF19LSovxJt+wS2iUU5KA/T1hxeOwqmcEQ9yws7UIT
	ekEE1qbPICwOFcUJV8dk/8cX6od0dkCsWEOWZbUXvuSkQBkbA5LHKmah+BXF8qxB
	7X21c47xO5o4wBJptgZc80EB191pJPTwlEwQJS0KLw==
X-ME-Sender: <xms:p-56ZfivBsopwzJZUolzYfIwCyeb1_gUGFaQFErpr8dBiVYSiiTJ2A>
    <xme:p-56ZcDYh5fT2_FwBR5UmjS4-ld9llEkSfj-nLAWDISM9s8emwpjly7LjXh1nMNmb
    I8OAehJrVT-gTxOXrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:p-56ZfEh9NlIyqEvfieC3ApXwdqjkVDtV84AZttHKOUhd3fY6NBbGw>
    <xmx:p-56ZcRlgLBGG20YuLoW9BvjkhNfpbGJE4AymzTznyVL5qXxb7yVkg>
    <xmx:p-56ZcwwDYeuLqtfeNo6KEDmz9WFiKgU7XZUFEoxj0Oj05LSun0qHQ>
    <xmx:qO56ZZjQr8S5MbXEpxTVcjgIE1nGGY0D9mobT7rrgS1E5yJuuh1h8g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 779C6B6008F; Thu, 14 Dec 2023 07:01:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1938fcf1-eb5d-4723-a6c6-d2fe2c6dd1c0@app.fastmail.com>
In-Reply-To: <20231214105243.3707730-6-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-6-tudor.ambarus@linaro.org>
Date: Thu, 14 Dec 2023 13:01:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 andi.shyti@kernel.org, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 saravanak@google.com, "William McVicker" <willmcvicker@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH 05/13] tty: serial: samsung: add gs101 earlycon support
Content-Type: text/plain

On Thu, Dec 14, 2023, at 11:52, Tudor Ambarus wrote:
> +static int __init gs101_early_console_setup(struct earlycon_device *device,
> +					    const char *opt)
> +{
> +	/* gs101 always expects MMIO32 register accesses. */
> +	device->port.iotype = UPIO_MEM32;
> +
> +	return s5pv210_early_console_setup(device, opt);
> +}
> +
> +OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);

It looks like this is already done by of_setup_earlycon() based on
the reg-io-width property. Any idea why it doesn't work with the
normal s5pv210_early_console_setup() function?

      Arnd

