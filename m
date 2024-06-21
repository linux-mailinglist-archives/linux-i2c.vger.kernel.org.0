Return-Path: <linux-i2c+bounces-4158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69908911A75
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA5E4B21117
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 05:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66530139CE5;
	Fri, 21 Jun 2024 05:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OxGxApPm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B7FBF3;
	Fri, 21 Jun 2024 05:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718948277; cv=none; b=hqkZRm28JqzMj5YurTcJ0wnmKpOxZyyUK8eA1mvnJVB3Y+Sk/abw6BDevapIEmckszq548IoHMg+DHLJcaGusRG7vQVrd8Iv6jxFWJIeRCcMPhExr+7hGOaP27VvpWFxjhV5Lk2SLuVhwhjKThvauA0XE4RB3Aj8b8cwnZ6eZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718948277; c=relaxed/simple;
	bh=LLFy4E3fQZogzsjSkuuitSHmxQQmS4uiYTMS6JzbgpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=cDPFlUOMxWT/0QB+gKAx2/kPMB8paYPfZ4jofzwtBmjyuqp+ZmGdsREERe6SwsK6/Ltxg0nTauF3R6J+UPggg5QZwC7gjHGIC9NLRLwXmdAZvhO/HYf+0pFCbxx9U96CgzPWAAacMBk6lhJYGT7OMAsXRrFSQqXY8GVUqxlP4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OxGxApPm; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948207; x=1719553007; i=markus.elfring@web.de;
	bh=1SQIJLyP8KM0t0hXj5dAJLCq9lDBaf/TIWUVsJ97Ung=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OxGxApPm3qrh/Uq5UHSKdmuHA/EdQNdVJma2RSdg+S1AafTTsW8sFpAYf2MgTKfv
	 fZqivsvv+R5zbqNTRfhhkPPlGppoe5bmTcmMuGHMKC0k/OAykV552sZwl8awTQDsB
	 AGzeQ4RW7xxaGjveQJX3GD9ERf6C+RV4Ym6AX+TKIf52lZS7atgVBQbv1mV4RtSRH
	 KkLEhiS7KHYlRbJUQEAALxh1GO9FOVOYR0xJfPw94pP+vbFbjZ76u0PXn2nVtSrHY
	 6zTbgoX3wK0YvcjZsvq6EeqaZsHZhLuAlAjT+yQReM8MI5A86H1yxI1+ANljXev5R
	 k8YcZrvMI2bYGwTXBg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Zs0-1sWp6x1rro-018Giw; Fri, 21
 Jun 2024 07:36:47 +0200
Message-ID: <a39f024c-7ab0-41f2-839d-ee2f62ddd6e9@web.de>
Date: Fri, 21 Jun 2024 07:36:18 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 04/10] ARM: dts: lpc32xx: Add missing dma and i2s
 properties
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-5-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Q7NNgNryQC4SvaqLSK46kUdFDA/ZWIIeO+B+DYHgCi0VqphfXz0
 LxOkeihG+Vrnw4q7094DPBzn7YDv2hUbpmVAdrJiShrqQhvj/8VJB5CO1x9U8dSN1exLjhS
 laSizbk3rhAQA4KMMEgqhwVU706cLgRCb467YcJy47Twkvz6B9MtZOubwGfQ9bMn5k+qiZq
 UXTnwNamwsXRAU6cK3a+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sxFXbRmwiow=;ItU3h73LSNWoHkiePPzF614YhOu
 vuWij/Wyd7G8C5bGFuxA34oRBoufqeSTJ1sO9oRDCQE17yA7yy+qUu1NsP3rGmwp607imLjET
 tlxMODkKmLWwjZN6WYB6OA00j+fL4/qe6kTDDGUFCsG3taFS+ziaS/XOF31nR0iYxmcGadXTF
 6WbDUOyp+fcYOvOUMdt9RtSb2KDjSlAT7V/u2dyxjIY7X2vNdA2A3LesS4hrWtUQ/j9jjsvCn
 9beVtwcM8ulERcSMjuM741ha+Tw/qMRQ7gvbaw8+RqndqAdbkDOMNKreIXpENNCPmnCrs2u7d
 uu7d4ceOXvKIb0nfzXvE8ZxudF5gVftjMcbGm9p5v/g2bWH7hYwtq5BZvz2s5DSK5Ta2ADRIX
 Zj2gqGUTQD6PH2NOVY/JvDoxrqN45EWShbKqn6+ZNV5ks/kb+tYB/7ZiQ0Pa0HXSr9tf+A+so
 2m0HXc6DpDDbA5nZafQpxxhgKpzPfPkjIo0773z24llMY/3IgrJYUbesX+Q5vBXyKqmi9y2M0
 LK96kUrboZ04zfJ43TiSAduhHGvUqMa0Jd2kkqNGi3fbr9ha1sNkt9rYqZm5yiKLdvXbfM2No
 5QPLKvW7DEDeT5xgYTZuSUEhGr0NvKoFBDWXfNP1E1JvGayANL1ZwqCpCoC1SFc5KVhOkyEO2
 22iZ/kQ+CA2ClHf081/2WBHIHecK0qpypwt0wXVmjFbC/kbygWKAOart5LMzLQ+2A7RERaKAl
 2v4BF7zzWd40QCWglLMTkaLvdwDoghAUBkoMXKoI+FWfJV1ZYWSEIJdBn8GPUvZFcmMAMgaTm
 TmADuSAnsOy9ft+lNhrWayN5+XfvhQrVkx6wjoHCE4kfM=

> Adds properties declared in the new DT bindings:

  Add?                                How do you think about to replace such an abbreviation?

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus

