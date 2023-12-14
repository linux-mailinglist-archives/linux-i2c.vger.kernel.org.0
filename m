Return-Path: <linux-i2c+bounces-794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C871A8132E3
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B36EB2198C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 14:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB69F59E46;
	Thu, 14 Dec 2023 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vuFZ2r6r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZvwaDBUW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66479C;
	Thu, 14 Dec 2023 06:20:07 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 209025C01FE;
	Thu, 14 Dec 2023 09:20:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 14 Dec 2023 09:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702563607; x=1702650007; bh=9Z4MjfpQ7O
	jEEXxE9lG6e/W1L5auLJWvyv3COvKdATw=; b=vuFZ2r6rblnm5W314rTfRVKZrM
	mqrIA3VlnFQPT6KA2yrZknlwtrzv9GkdEOw8ZR8Ua7Xs0ZfrMNqbFZMN4QI3kyiu
	mhKfWRbzAc8bfCOTmg3zFfPWaq2en4vHsYD0mLN2r79WNt4V1jMG3d1SSlCQJOKo
	yclAJOhw8GxFIRxHWLECCRlm561Q2GOH5J5wIeLnxoUk5/hjgaV5BbYC2X1KdyBD
	zD1DhDeCDdjEaIU4JgeHMS714p4nri6tV9doLlQl77a332ithpTSwiKjHg9drGdc
	VKgtC/fRxXt7QkzjisNxgVHRTomF/PV1hj3oPz5QZv4FER++igcDUUO46JNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702563607; x=1702650007; bh=9Z4MjfpQ7OjEEXxE9lG6e/W1L5au
	LJWvyv3COvKdATw=; b=ZvwaDBUWJe69wJRbSrL5vCEbopxk2qz+WIyz/n88kjz2
	Kw1TBwmNEloQmAjZpwEMcfRTBC+MQ5x/NTjGyufqw9ffLYzckpIHonGciX/4aQO9
	d+yKh+6+cg11XdEmiZq+0xZaymGrUTNIem62U+gGseG16i4TAlJHRAXWOsflTuh5
	4mjdiunN3fU8miIJ9Ih2DsHqYQ8X8zEveHCMTb/DwvOB2OpB2k57F8EzI+ZDX/BS
	rsvwT0ToeLt9Ks2Q5FanummSoagOwTBrs6g63N2pIyzzya138l5rEaS1di+2oa3a
	+Z+SCRsAd+1ozzFnaEGS0hyHRtkMAs6MoyJSOaofUQ==
X-ME-Sender: <xms:Fg97Zcbp0_1Ylvak5lI1LjoeFLrM_hO_Qw-z8bGY2RuZx_QNAw6rvw>
    <xme:Fg97ZXaJwPVWyXHKF3nvC3VpwmBgdHU_JiXBRFpAwLUNl_EEy3QeFeRiJQfEKHBHz
    ADooBnf3I51dvjcTIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Fg97ZW_joqK78W09f3ZbQzsqlOX7WH0SZ5BAwZsa4uaEsx8rSFxERg>
    <xmx:Fg97ZWr858gD7ICD-t7Jwn62-cVa7rUhmbxpyGD4xlJEAomL9W8MeA>
    <xmx:Fg97ZXp5idHkXZLrxYoos_Qne5LPJYXxBX07HMuB0f9vlR6Zw1VVLg>
    <xmx:Fw97ZRYpgxk3_7ThW_J6a8z5VGQQdUowjco_aDeeCL2SjhiNP6n7GQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3133AB6008D; Thu, 14 Dec 2023 09:20:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6962ac73-2f44-4c9e-8731-152087815454@app.fastmail.com>
In-Reply-To: <8808ceeb-35dc-4094-aec4-f43c7acd6174@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-6-tudor.ambarus@linaro.org>
 <1938fcf1-eb5d-4723-a6c6-d2fe2c6dd1c0@app.fastmail.com>
 <8808ceeb-35dc-4094-aec4-f43c7acd6174@linaro.org>
Date: Thu, 14 Dec 2023 14:19:44 +0000
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

On Thu, Dec 14, 2023, at 13:52, Tudor Ambarus wrote:
> On 12/14/23 12:01, Arnd Bergmann wrote:
>> On Thu, Dec 14, 2023, at 11:52, Tudor Ambarus wrote:
>>> +static int __init gs101_early_console_setup(struct earlycon_device *device,
>> 
>
> It works if in device tree one specifies the reg-io-width property and
> sets it to 4. If the reg-io-width is not specified, the iotype defaults
> to UPIO_MEM causing the SError interrupt on gs101 which makes the system
> unusable.

In the case of incorrect DT data like a missing reg-io-width property,
I would expect it to still fail once the regular console or tty takes
over from earlycon.

> Also, if the earlycon comes specified from the kernel params, the
> of_setup_earlycon() is no longer called and the earlycon will be set
> solely based on the kernel params buffer, thus allowing users to crash
> the kernel on wrong earlycon definitions.

But that in turn is the same as specifying any other incorrect earlycon.

> If you think the change is fine, I can amend the commit message with the
> description from above.

I'm still not convinced we need a special case here when everything else
just requires passing the correct data.

     Arnd

