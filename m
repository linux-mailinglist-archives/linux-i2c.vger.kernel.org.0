Return-Path: <linux-i2c+bounces-2884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF08A0ADB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 10:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A211F267EF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9F513FD65;
	Thu, 11 Apr 2024 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UD2IrW3O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dNDFwyDL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CAC664DD;
	Thu, 11 Apr 2024 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712822881; cv=none; b=eSZ4mMwp8ykmeAq3cVGxG6SUHrGhkgYR6CCIn6x5HUK3zI5XCVzTZooXGB7iMS3YGczR5kbpua6fwAKeh3L3kA2E8F/N437wRrZWhH9Zp+Ntu9rRDPoCSTyhd4Ro4Hu0TFDvuXiHqyS7qXEuVvu7KZP/A00l+V5W3qExTXOVo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712822881; c=relaxed/simple;
	bh=Y9qmUzmwCH60stgnS2mlNEdLDQMwLF9+umsngwH+J9g=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=dbOci2LltYBzLWpfsKU7UMZlvY0VcKNediexCYKfKIS8w9yFJikCvA4znQUN3RKozX+QE2xLCTGAfNb7wuRNvId/2P4rVtO/eUlxnCv0mG0UkaPI6SePYJhblodxjoxTMirLZDjyTbxyFCFN9EtIfEpvVOWMh+U6wc85iKc9sJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UD2IrW3O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dNDFwyDL; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 93CF91800121;
	Thu, 11 Apr 2024 04:07:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 11 Apr 2024 04:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712822877; x=1712909277; bh=a9JwUZrGbl
	p20dvEFGPjA+XJw4OSt/yDPHXDqtQgFVo=; b=UD2IrW3OrJwa+Ojyp+ZJlgG8+h
	g6lKkftIzZb9dn9EKkGp80kJhtC9UyXYoc+H7QoJFj8hKwDaId14BtnQLqblVTw2
	wG1PdCoOhXkPy813083zpqWz3+ADhJS3ZTFOWW6vQLSiZb+fQuJ1yPYZT7CJQE1t
	PtnByjlYhALKqFIXnuJYs0ZGgw+uclF6aNBx/StrkB2moDMvA1p5yf4DOHKUY1aL
	TZGA5vNVPAmLZeRBJbdW6DS79ODfloSVWWhAd7umbzvc1EPBz3SvKCVZ+QLMy1hU
	Q2ydlwODPT/Kxm99/ezz3N6zsrcjib0eLRRXRoeMTBEXD1JR4VJmwGmbCjnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712822877; x=1712909277; bh=a9JwUZrGblp20dvEFGPjA+XJw4OS
	t/yDPHXDqtQgFVo=; b=dNDFwyDLzke3ysux49qnsencJejakrLKtOO1UinrZPFP
	azOhqUMSqbE394PzDvEXOfmfc7PwaJs18tjP7oBNzrtWV3q61fEumDRWuWMnjU13
	x2hQ8Wb5LNhdXQAfAN6c83baOajnJNr+hXUS+/xj0rIZZ0pev9DTe3st6nhY4+2g
	wGXHdT7nhf/3JTrotJCgkkCjMNZtj5gdXI/cn8/+RBt4pBXM57n7+GXtX4gFh6TO
	PRVWAv5TggrFfYoEzBSrL/ehJeQm6zRrzCCDHLmboBRR7QKF+nm54K7paddYvV+J
	7bCvQ6Sqf0rPcXSnGps7+dLNQfJvPvtttQxjqGGmMg==
X-ME-Sender: <xms:XJoXZvw-lz7ccxMJ5LJlkSACdZCE3wA_0kQ2RjbLQJ-GrwFnNIs4_A>
    <xme:XJoXZnRVQmkoLHT69Pxr0dmKd3ctvHXsfRFEvZ-0hzQXRCTB5JBV1F1FP9XuDPqfH
    io3N1hNymuj32fJD9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:XJoXZpXyVMDelkJRMj9wRn5BSI-WIF0IIjjcj6Bvcs8K8akCHh3FiQ>
    <xmx:XJoXZpiTXFKIXdB7xdo3rLR4WZgq0TZGvJ04h0y6jZ_bBnx_VOHJIQ>
    <xmx:XJoXZhAsaVqsiPt5eeGC595SIS05oI2wdlQfuUOXF5eWWg0odeDJCw>
    <xmx:XJoXZiK_BPz1wSO-ZoNEOi2hW18-kBXK50nFxmL3oIzClcxuslyAcQ>
    <xmx:XZoXZl4_PTp_iQRz4FjpaRoo_hERGNztKX-rrNcaPTbbgQexjL8Lz3fv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 276F2B60092; Thu, 11 Apr 2024 04:07:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5f99920d-0c9c-4921-ab85-e5bca11c2da6@app.fastmail.com>
In-Reply-To: 
 <cwbht6xtv2nfqm7xz2ra52dtfwx3whjyyigbxxtdrwzcsq3llp@vhryqiyrjxqx>
References: <20240408092923.2816928-1-arnd@kernel.org>
 <cwbht6xtv2nfqm7xz2ra52dtfwx3whjyyigbxxtdrwzcsq3llp@vhryqiyrjxqx>
Date: Thu, 11 Apr 2024 10:07:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Peter Korsgaard" <peter@korsgaard.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Gregor Herburger" <gregor.herburger@tq-group.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: convert to ioport_map() for IORESOURCE_IO
Content-Type: text/plain

On Wed, Apr 10, 2024, at 15:31, Andi Shyti wrote:
> Hi Arnd,
>
> On Mon, Apr 08, 2024 at 11:28:36AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> There is at least one machine that uses this driver but does not
>> have support for inb()/outb() instructions.
>> 
>> Convert this to using ioport_map() so it can build on architectures
>> that don't provide these but work correctly on machines that require
>> using port I/O.
>> 
>> Fixes: 53f44c1005ba ("i2c: add HAS_IOPORT dependencies")
>
> I had to update this Fixes tag as I have done a rebase.
>

Ok, thanks for merging.

In case you do another rebase, you could also move this patch
ahead of the other one to avoid adding and then removing the
dependency again.

    Arnd

