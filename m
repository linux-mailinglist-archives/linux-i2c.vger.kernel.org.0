Return-Path: <linux-i2c+bounces-14333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7903DC912EF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 09:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1BD83AE57B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 08:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD52F0C66;
	Fri, 28 Nov 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nzlVfA/3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i3c6Kh98"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DF2F068F;
	Fri, 28 Nov 2025 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318779; cv=none; b=ZXWoYLn9RW5Xy/BeZoja44ECPPzIQBBKeHUfoifHOqkMEq8ijx/w7CZW76n9lgk/kmtlFB1f6+q2EfYYhLsIAQYH1JjqhSfZcSb/de5itvjT8Oz2gjtESh7Rmacvwn1vHjfqJR2FkQmT8qkndKwNHrZz6ATamIgpIHl22OSmIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318779; c=relaxed/simple;
	bh=GZe/v+f21miE6jwGDxB0JgNCt2b8HMHU3iLRJlILIbM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Cs8U0pUx0JxFcIXGgpRLMHWJta96sCn3fm89oS5ySAJVngJ1ous1/UsfoBN3DTKEh89ECCfJZhgxBSkmVsgTxAigFu0k0NoBIrLsTFJ6sx/VyQJWG1uShiHhbY3m7E290VD9WOecZKz2sC/MQtjjn6uXL0lSRBFk8WKO8yKOB/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nzlVfA/3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i3c6Kh98; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BDA2F7A0091;
	Fri, 28 Nov 2025 03:32:55 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 28 Nov 2025 03:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764318775;
	 x=1764405175; bh=kogOAsk7EHkBu4pG8vuz1bS7JaOBQWLpoPmvg+ym7YE=; b=
	nzlVfA/3OZQIuywd76bGz8JzFboPENe5gbbTlfz2HUXVglJowS9gHVykTGxJh5WF
	gQBzGQBiZiqx9ig3c7rEx4XBZ1tFHH04tAImabugQVsp92Bk7Pv8LjRlvXd+o53K
	mkF+1xRfZ7e6zOcpNMoONrUF+H7wJnEyp4HonbgYMmjvmvd/Kll0SmL4EOfiRBex
	eLQaVEChSI+kGFcM0gDwMR3arwBv+eEtgKY1ItROz28hSXLAQ9BGRifreDeeQDSY
	LltwJEVYroKpEOHUQS38JG93mRRjnsfiwvmcNX6Q6wLqPf6UAR5qRtO42tK085t7
	JQqRn0eWeNJ4VTTLjL7GuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764318775; x=
	1764405175; bh=kogOAsk7EHkBu4pG8vuz1bS7JaOBQWLpoPmvg+ym7YE=; b=i
	3c6Kh983lrsY70zS0DQt5mFiy7/v1taLdNQjD9CoCiBbdu79IjCWiBOw4Y8R3LrM
	99GZW3IN63UX2iZV+9mEV4P3UWBMLSzRO9hvGToU6mdUj+h3SKdDLla/kfBc0Mjd
	brvgkYIx0ywqJXmq5rRko7Gru5lDi3C4BU3om2I1mqHeE4Y73eGzjdxVewZtO21S
	1Lph6c2SG2FGEoM+c7DGDOIOTRPPE1R41h9rlelUKjyiMtZlDcZFiW0f69hzLhdJ
	7hGBzbKSw68R5NU9HQkY2I1onQF/w/EJoWQo1qm1F/WjMOYmokhyFairT08/YC8s
	A+Bqro5pcUiLDTmELRUWg==
X-ME-Sender: <xms:Nl4paZJRaokGWEiUjINohNKSJ3PEZLvn4zXqbgQ0EhmbojOB0iSy3w>
    <xme:Nl4paf-6tLElgdqLoNbVfZ0m8CPzsTOL8eZwOFf1uwyeM2QVf1G0uMSF5kr9HYfWc
    aoNd5CEHD9MSBCXJ2aCIQtITNuwoSeBkc-XdgfiT11ilv8uO-jyHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeelgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessg
    hrohgruggtohhmrdgtohhmpdhrtghpthhtoheprhhjuhhisegsrhhorggutghomhdrtgho
    mhdprhgtphhtthhopehssghrrghnuggvnhessghrohgruggtohhmrdgtohhmpdhrtghpth
    htohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehm
    rghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitghkrdguvg
    hsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhhs
    thhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmohhrsghosehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:N14paShGrSc5yuHL98XPEheExHzuIVkudNwsBRs2A4b2fvUegpIY-g>
    <xmx:N14paZ8skgNynHVvH-Sz_vBlIfFZnviHaNZmmGop4P9xLqmr8vDSaQ>
    <xmx:N14pafIr149nS7jLJTB_xQ17EOf-xpTIGNud5jS0H8NdXihDORCw7A>
    <xmx:N14paSZa5xNxbw-aeAWFKYObqF3QBTiFTS3nuaSvmBmn5MtfbLORzg>
    <xmx:N14paWuDWqIE-gqMREuO9tqUfj1g3p39BG4OXBAuOrMW8QUF2ZsPLkD1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E485AC40054; Fri, 28 Nov 2025 03:32:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A9H3E49GtQH-
Date: Fri, 28 Nov 2025 09:32:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Ray Jui" <rjui@broadcom.com>,
 "Scott Branden" <sbranden@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, llvm@lists.linux.dev
Message-Id: <8ee7495b-4b6f-4ee8-82e0-a236d0be5c32@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
 <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
 <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
 <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
 <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 27, 2025, at 14:46, Geert Uytterhoeven wrote:
> On Thu, 27 Nov 2025 at 14:42, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> >> kernel_ulong_t, I think.
>> >
>> > include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;
>> >
>> > IIRC, it was introduced originally because "unsigned long" might have
>> > a different size in userspace.  Nowadays (for x32), uapi uses
>> > __kernel_ulong_t, though.
>>
>> Maybe, but if you look at the data structures all have kernel_ulong_t,
>> so this fits the logic I was following here - I cast to the type which
>> is both representing pointer and is already used for driver data,
>> because this match data serves similar purpose as mentioned driver data.

It is rather inconsistent: The __kernel_ulong_t type is used in
include/uapi/ in places where x32 uses the 64-bit ABI, as the idea
was to not have to do (much) type conversion there. This of course
failed overall because any ioctl still has to be converted.

The kernel_ulong_t as far as I can tell was only meant to be
used in include/linux/mod_devicetable.h, with the idea of being
able to interpret 64-bit kernel modules from a 32-bit module
loader in userspace. I don't think the latest kmod actually uses
it that way any more.

>> I don't mind casting via unsigned long, but:
>> 1. these are old and trivial issues,
>> 2. they are quite annoying when people want to compile test with W=1,
>> 3. I was trying to fix them (although not sure if for I2C) already,
>> 4. and some others probably as well were trying to fix them,
>> so how many people need to send them and debate before we fix them finally?
>>
>> unsigned long vs kernel_ulong_t is a nit-style discussion IMO, unless we
>> have here more concrete arguments, e.g. statement from Linus that
>> kernel_ulong_t is wrong.
>>
>> If maintainers of this code want unsigned long, please apply the patch
>> and fix directly, but for the sake, let's get it merged...
>
> Sure, let's get it fixed!

Agreed. I don't mind the use of kernel_ulong_t here either, since it's
adjacent to the module device table entries, but I would also pick
'unsigned long' or 'uintptr_t' instead.

     Arnd

