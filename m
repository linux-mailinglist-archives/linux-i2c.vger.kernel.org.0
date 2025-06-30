Return-Path: <linux-i2c+bounces-11705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56AAEDFAF
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF3011699B4
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 13:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4865D28BAA1;
	Mon, 30 Jun 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HCpLW8xs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VlNd4II1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD02289E00;
	Mon, 30 Jun 2025 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291661; cv=none; b=b3NHDH2H6EQ0mCSGyah1FjQB5IKN06NU+nYzjRtzb/sc9Ria352x1Ul/+eVvIIw8CNhqU7F+pgs1P31ZjdF+TbcedZPeAKBssHBE18vkqq2RI0KxUCfNJUmhGwQF5Nx73JA0a46DZK/HWjzWEY81OB3b4bGuv1gvk1UgZjDqyRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291661; c=relaxed/simple;
	bh=XDIHXs4K7QWZcdabHUjQZzHGSYnnwRmcj9GQSvFWMks=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t84sjE7VE0SB3VROJzaOkbZyghVoKWN7+R8pNiVP32zgnsWsXJ2dg6vdwpzz2Tp+Mbnazg2qDv4XutXUqaM0GMbvwjpre0cdB6xiYU0nSUIclkSMaEBqoP/yLlx8HlC1xMFedBErKWRmCloJ/inHl3pq2cUyCq8eUdOpiB86Sbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HCpLW8xs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VlNd4II1; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A41121400028;
	Mon, 30 Jun 2025 09:54:16 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 30 Jun 2025 09:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751291656;
	 x=1751378056; bh=ik9oLe3KdALkxzKl69BBxlmJ8fpBBAh4pU7+UUhNIAg=; b=
	HCpLW8xsF3EqejqRsdi4yjCzmlUTcGMoILiaKStETiAgoeykxvH8DpcWVyDgi7Zg
	xX02l5ZTYkqo0QruDwzfQ++5RSoiqmz/kHiUUCOZiZA08maMoMNRBu4J0utGZaNS
	TAFlOugGZqywPfBPzLWLK8CWreEh1ZpUQzLjUTy0KWh+FPWLM4HYflHiOyNjrWRp
	M8ZaCKazgSGEfxTTuGveC6KrQEa0u/8GjsPXe85rOhttDPhXR8uogkwPdASMucj8
	cjjdAgCA0JdmkfkfqRiP24v2d4N7x9f1V8PnIoLYLRQIBjAl4zCFd7nONXkI9Ech
	FdRZ+inK4k7w8NzMsqM86Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751291656; x=
	1751378056; bh=ik9oLe3KdALkxzKl69BBxlmJ8fpBBAh4pU7+UUhNIAg=; b=V
	lNd4II1MEchvr393QhsqIMCypt8IeM8qeUKvGbO0Qq7Wy2w+ub3YgnUiT0mQ12FX
	KF0q7wdPAn4E8Nf8hsS68cO3yock4OkiY4SQNaeDwGZwTX7+OUcxsGWZabCcpoqR
	82mkry5p9IJHYDpnFQLQ60+rrZPg6O2OCS6gDDjtx+EywTTMjcSgJwg+1BhPqmGe
	PpnSeLcYKRPmzR7KJHgEn8S2pEiY1ZWOJCucyk2cxBYIfbcYxwTM5cdAFrU3T/YU
	sJK78LjTadM0IPbp4mu0dum9PnEdbzR28u75DTplu97uq3ZuQIAUe6hTtQiR2ybY
	J7hVufrDRH7au8tk+7P8g==
X-ME-Sender: <xms:BpdiaGUGolou3QitfZg4BLCqsIQsIym4YCDRZA9BPbVpjvQSFuKbOw>
    <xme:BpdiaCmTzevwMOgsbNp3SurxN3fnfZd5hxQ7tFPxER-J8eWckiPqYPWHZeCXCn0bM
    4_Dpna6uxf0VicV6Rk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgs
    vghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegrnhguih
    drshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhm
X-ME-Proxy: <xmx:BpdiaKbW6kc3JjXJ_iF119Z2xF0TlpEZ7lZv-75taKItFXsh-Sj_Kg>
    <xmx:BpdiaNX0wbV-b97Hre_u0SVfDSlOMJRgglPNtNh2F29eDDO-Qa2eMw>
    <xmx:BpdiaAlhLEy218q7zgCoW-E8vY34X4w3snX9RIYXQv1AhPnnKNE1fQ>
    <xmx:BpdiaCcDRhGlfi-Q6gHErHIhH-4Zlz1pe68U_7yL8dniJdgtiN14hw>
    <xmx:CJdiaJYx9N4gSrfOr2NmNnOFHFvyapVyNj7lgmg6DXrTQTvDl3ADYuH->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CBC52700063; Mon, 30 Jun 2025 09:54:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tad13d72cbf59a799
Date: Mon, 30 Jun 2025 15:53:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, ore@pengutronix.de,
 luka.perkov@sartura.hr, "Daniel Machon" <daniel.machon@microchip.com>
Message-Id: <3e522dcc-3b68-4137-bd3a-dcc2c889dbd3@app.fastmail.com>
In-Reply-To: 
 <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
 <CA+HBbNFd5hCKqUZY25Sws-o-0QALLue-JROyze_9biyuZZv4mg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025, at 15:21, Robert Marko wrote:
> On Mon, Jun 16, 2025 at 8:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
>>
>> If the drivers on ARCH_LAN969X are largely shared with those on
>> ARCH_AT91, should they perhaps depend on a common symbol?
>>
>> That could be either the existing ARCH_AT91 as we do with LAN966,
>> or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.
>
> Hi Arnd, I thought about this, but I am not sure whether its worth it
> since we need LAN969x arch anyway for other drivers that currently
> depend on LAN966x or SparX-5 but will be extended for LAN969x (I have
> this already queued locally but need this to land first).

I think in that case we would want one symbol for all of the above.
We have a couple of cases where there multiple SoC product families
get handled by a shared config symbol to make life easier for the
kernel:

- ARCH_IMX contains multiple chip families that are now owned
  by NXP but that have a complex history with acquisitions and
  product families that mix-and-match IP blocks, similar to
  Microchip

- ARCH_EXYNOS contains chips from Samsung, Google, Tesla and Axis
  that all share a lot of components because they are all based on
  Samsung designs

- ARCH_BCM contains several chip families that all started out
  in Broadcom but actually share very few common components.

On the other hand, we have TI with its davinci, omap, omap2
keystone2 and k3 platforms, or Marvell with orion, mvebu,
pxa, mmp, octeon, octeontx, thunderx and thunderx2 platforms
that overlap to varying degrees but use separate Kconfig symbols.

Since you already have an ARCH_MICROCHIP used by one of the
microchip platforms, the simplest approach seems to me to
include at91, lan969x, lan966x and sparx-5 under that as well.
You could just select that symbol from each of the four
and then change any driver that is used by more than one of
these families to use 'depends on ARCH_MICROCHIP' instead of
listing them individually.

I assume the mips based PIC32 and VCOREIII (ocelot/jaguar)
are distant enough that they wouldn't share any drivers with
the other families any more, but they could be put into that
as well if that helps.

     Arnd

