Return-Path: <linux-i2c+bounces-9311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29051A28F78
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 15:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC843AA453
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5438E1547D8;
	Wed,  5 Feb 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="APFMFwFZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D41537AC
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765425; cv=none; b=hgwhI2njkX0PRxJAXPbv6WD9XjCtx5D00ELagCTXizs18NnCARTLOArN/RNcbvs2MURk65NotDRj1KloISX5Yn9OONtzBv7eAh7u3kPAErbEIWSbNWcpCRB8iE0LyLxg375vDsQ6Yyf0RS3WmRf3/lAiV8/L5iZMVRwPwAhk60k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765425; c=relaxed/simple;
	bh=QmmCd8LWQql8Pe4G/Tzut8hhJhjOiQluQMq7oei+K7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxJIn4BcCkeiMzyOtLeUh56yzlLBD5Jv+M4bPvJIiYr8eyjBTc1xLQO7XlZNCdKBv0TiDW0/m6h5SB69su+C/LMBVwgFdxnC1lxjjILVGV17W5FN6NhoGJWzcAYkwvTW7Q5KNZDNTrxUXnXOP0Apwij+A8wPg/wxYlqf+0eEMCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=APFMFwFZ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BBEE441AD;
	Wed,  5 Feb 2025 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738765421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSaxWoJxywYc7VPtYsma4rWF3G3Oyrm0/IVpmxdpu7M=;
	b=APFMFwFZAyZLrMOoVcaf4FpJZLlBGHifFUmxUAQhkRzmiugN9L+mUT09tU9qJO+yk8fe6n
	2sniki6a/qj2oIGy24UVjET5C3wUNBBgl706b3fobPnTx9pnK9gRw4g7E7NUhCqGimSXok
	c+mWA4HuW7T+nwFG8RsPXAHvdq8NIrtHQKkl+/X4u+wmdVXEIPgh0CKfzrUSUSsUslJ3Qk
	JudKIf1rlp84oY1njVq9Oi9FB6bESn0EUiEY3fmXIK6SGxkIccsRcMN533Wx1i8JzWvgh7
	tCcYVCqRQ9laiCpMebUylCuclUm9SfZLVRNkcDe+BvvjCJxfXhS+eZm7A/tcEg==
Date: Wed, 5 Feb 2025 15:23:40 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC] i2c: Fix deadlock on adapter removal
Message-ID: <20250205152340.5effbbd5@bootlin.com>
In-Reply-To: <Z6Ns6cFACV4sQi8H@shikoro>
References: <71a49125-54a7-4705-b54a-a5e7cc54a78b@gmail.com>
	<20250205090737.3b93ab14@bootlin.com>
	<Z6Ns6cFACV4sQi8H@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Wolfram,

On Wed, 5 Feb 2025 14:51:37 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi everyone,
> 
> > Cc Luca and Thomas (they are interested in the issue).  
> 
> Thank you for this interest.
> 
> > I tested the patch.
> > 
> > The deadlock is no more present but I have this new issue using the exact
> > same command as the one I used to detect the deadlock:  
> 
> As this seems to be a more complicated issue, I sent out reverts for the
> original patches now. This removes the stress of finding a solution
> soonish. We now have time to find something proper, test it thoroughly,
> etc...
> 
> I hope you guys will still help Heiner with tests?

Will do my best.

Best regards,
Hervé

