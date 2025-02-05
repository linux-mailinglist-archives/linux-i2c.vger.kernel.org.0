Return-Path: <linux-i2c+bounces-9312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CCA2927B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 16:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA84E188E0D3
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 14:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83BC191F60;
	Wed,  5 Feb 2025 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UulgzBhU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC71632D3
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767076; cv=none; b=dNCKGvFZIN5RESK5rWyMsclmAITGiZabA6atiYgTz3E0+N4BaFQFT9kNlhAdnp9lCfCteRrD0TxzfpBITwVGsydEfAdb+cv6K8mSIW43DnUxjS507RbVeoJWFW9ZbZmRoky6hcngPohMevpI73zciAkG9PNGDmdxGI4/a4y1BYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767076; c=relaxed/simple;
	bh=pmq3mMuv9ZTElfBCNsFWBn9tpxWsgUSdZRrmkDmOYe4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paqcmQwYEjPPP866d99gkKte2k7BMH/H3EicgH7VuAtavaXpzm/Hc2UaMsEQFg29aV4zGE+JpySOTFjRC1saY5/MOpQ2z8S06pJGxSWcER6iXG6R/JO3czK3JBKNBous1yH7LTv/z3eTUVSFr4BD6mVoZRw/R6yhT3nEJCaYEdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UulgzBhU; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 230BC443E7;
	Wed,  5 Feb 2025 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738767066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nufmSjHMtEV5ZfsxJFcdW5JQCdm1arQKEFGEiUJrDS4=;
	b=UulgzBhUSFGO69n74FA+ue67u8llEUUuiDYeq+nnFH/2B/zqbdz8mKEOhSue0Faa81Pkag
	Ld2YUhu4aFfbeDndGHMBq1E/ptFAFp5YS3sSjX9sUMjbtJh7IchAmwv9u+HK69tnzPc9nv
	xrKyNgl9fv8RegmLY7Z0bagUeM1w2xveJ12yT4CTeu91oM2UMfp11dzeHwe46cjfYA76pY
	eDtccfTbvruwiBEQW46b8DNaxECs9kjAOl+dWSRLeYdp/Nsszpq1HVToOG2qGPjQOzyCti
	Pf0Rav4V0bVGdJVJrj51hN7xlEz9hWfm0BI9VM5P7eoLD8KAVgsPhR4H2BV6zw==
Date: Wed, 5 Feb 2025 15:51:05 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 RFC] i2c: Fix deadlock on adapter removal
Message-ID: <20250205155105.76d9633f@bootlin.com>
In-Reply-To: <72397ae6-43aa-4a15-be5e-cdfe06b2c7ea@gmail.com>
References: <72397ae6-43aa-4a15-be5e-cdfe06b2c7ea@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopeifshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi Heiner,

Cc Thomas and Luca

On Wed, 5 Feb 2025 14:49:46 +0100
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> i2c_del_adapter() can be called recursively if it has an i2c mux on
> the bus. This results in a deadlock.
> We use the lock to protect from parallel unregistering of clients in
> case driver and adapter are removed at the same time.
> The fix approach is based on the fact that the used iterators are
> klist-based. So it's safe to remove list elements during the iteration,
> and we don't have to acquire the core lock.
> As a result we just have to prevent that i2c_unregister_device() is
> executed in parallel for the same client. Use an atomic bit op for this
> purpose.
> 
> Fixes: 56a50667cbcf ("i2c: Replace list-based mechanism for handling auto-detected clients")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Tested on my side with the exact same command I used to report the issue
  # echo 30a40000.i2c > /sys/bus/platform/drivers/imx-i2c/unbind

The deadlock is no more present. The crash present in v1 is also no more
present.

Also I rebound the driver
  # echo 30a40000.i2c > /sys/bus/platform/drivers/imx-i2c/bind

Devices re-appeared and work correctly.
It's ok on my side, thanks for this fix!

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards
Hervé

