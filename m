Return-Path: <linux-i2c+bounces-9564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56556A43C1A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D303AB01E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB54266B6B;
	Tue, 25 Feb 2025 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eiNmEuHC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TFZGOM/h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC24192B96;
	Tue, 25 Feb 2025 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740480193; cv=none; b=ZfT+5Oiy57raibtcOqTcfDH+3dnDfZ7cu6TM5n1Tb48V5aTdlWMy6XWDcXDnBt93+0eo6FslBiUda5GcWdAGQScyw9P8T3noAw1t41xnoLfsH1rdhAKVSpfhh9gpHqnl6r8lDRhJMnvFMk4DwOFymHaW+wqsesGD5cxvgG3hHXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740480193; c=relaxed/simple;
	bh=tv0R0s1TjtqmD93DRANhxUHfOVD0iMVBBhlDl7tSPL4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oJElKVDBRbe4kwGon929fKcmNbbI3xLP+WBJIXwKNSXsp6+BcQSIoZKDoFOv2R+vYQARrB+YtqOHV/hcUQxrZJoZzkwlb+L0GyL/e1OPt/lqurfA3kMBimXYRXRnPyaI58lqmW3oY3q/WHr+ZF/Y6FLVUGvPQT2XFq9X7oasEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=eiNmEuHC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TFZGOM/h; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 28B4C25400AD;
	Tue, 25 Feb 2025 05:43:09 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 05:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740480189;
	 x=1740566589; bh=GC1Rd8pP+MYB/d62vWhN9HoZZUyWU3eCT57wkmcfp0Y=; b=
	eiNmEuHCu+EJJVMQjznB/+iv14HoT4te4oFQTLWMrU3b+44pPUSIEjl7i88oFZmJ
	tK8rzQmEBBb12w8FRfBt9DPKjCtPPD2+GMcAH4AhuZc+foWCHbZP9FGKX5Lsipte
	Bjh/sHuGmpWHGS74V5eaJyafxqWqaK6jmR603/irbsOIow3W6hKGAdTb8g9Vc4ag
	NNJgpUJc4uw0hqSciLQflRO9+EwEYsSDYQw63F4FkUefQI74Jl2s16XidLz2hWkJ
	pRDqujti03sdfLUYir+NmhKvc8rZHj7j9vlAIIy+2/WvvytILcAB9iNO4zAtrt6I
	FL5BOxhvO/wPkd3LksnLUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740480189; x=
	1740566589; bh=GC1Rd8pP+MYB/d62vWhN9HoZZUyWU3eCT57wkmcfp0Y=; b=T
	FZGOM/hv0/3rQuzrFGx34cc9B1Zf0M/p7f1/T4r67zxmiNss3+7nI6BV6YK0p6FL
	TL8Sbl3c46rtQI+QExGqUyx1Ir/NN6EajJCpZs1h25oD+8e3YQ56+yEWTLX5aoDP
	3UVKrrq9VCx066xT0aKdOEMoCuf21x7WKGL7PDKpFzwmjRjUsUiBFtYOLNiu+hlk
	mbYwb2W9gkwkWGNSp4n5FtH1rwKeRV8ygiMNK+VJ5c5pLpxmod+4xe6U0ypaRH93
	Zlha1a4zq7qiIsHsu3+3Nvap/N8NIzxJ1TGewHH3dezkgsmpr5rT75eaEqMyJUMY
	ua3XhDvQIGJMMgpg3coBg==
X-ME-Sender: <xms:vZ69Zyo4f53VsXNNAriilkJc4eVqylOuVqncAwrmWr4ilt7679s1jA>
    <xme:vZ69ZwrCTtZvx3ZSZVxQSzwORh61zP3CB_CfH23PH6pwEFY4dILVD3TowbcVqAZwt
    YbbH9c3EVKpwZ8_HOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpd
    hrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurght
    ihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:vZ69Z3PydYbPRTly_fy_ePcqpRy6f8bFJWo6hJeuK6Dd-vagMkfnmg>
    <xmx:vZ69Zx758rgsP3sFQoJmo1kInegkx8w-KFRQyQg_gXNbmennMM-OEQ>
    <xmx:vZ69Zx7KMPP_NS59eS6GvXAtJwNAOT54uNiFPRlfIglDRT7Npun-Uw>
    <xmx:vZ69Zxif6zkl8mrSyZVd8HSoE_ZSPLiky1clhmQjmUKGPPcTycfetg>
    <xmx:vZ69Z_R_EdkxMkmoBzfDsd1W6j47b84U6Rmkp5V9V-4Lin1gv63Zxndm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8C03A2220072; Tue, 25 Feb 2025 05:43:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 11:42:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Message-Id: <745ff032-1e71-4569-ac9f-07c44cbcb344@app.fastmail.com>
In-Reply-To: <Z72dfxKzLLORkLl1@smile.fi.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
 <b8a1315a-8d86-4904-92d1-179699f54e03@app.fastmail.com>
 <Z72dfxKzLLORkLl1@smile.fi.intel.com>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025, at 11:37, Andy Shevchenko wrote:
> On Tue, Feb 25, 2025 at 11:29:05AM +0100, Arnd Bergmann wrote:
>> On Tue, Feb 25, 2025, at 11:08, Andy Shevchenko wrote:
>
>> Subject: [PATCH] [SUBMITTED 20240403] spi: remove incorrect of_match_ptr
>>  annotations
>
> Was it applied (and the rest you provided here)?

It was part of a longer series. Some were applied, but the ones
I provided here are those that for some reason did not make it.
They should apply cleanly to today's linux-next.

      Arnd

