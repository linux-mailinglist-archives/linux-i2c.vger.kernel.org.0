Return-Path: <linux-i2c+bounces-15091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B3D17DD6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 11:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E371F30255AB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 10:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AE4343D9E;
	Tue, 13 Jan 2026 10:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="InDqdP/y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D32344053
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298601; cv=none; b=YAz3WLNvd5ZXYqk7oiGdsNk0Bdz5m+vLV+VVo+7uHGl5WDVUNzdL3ah96OpSbG7WN/mWXd7AXQgyas4MlMx8mK8BpCNb3rnjDcxCtYaUUvzvTw/Q4QkJPR5+Sox9hOAf8u9cmCu8rf/YYRfyhFKsD1umEqcOuyXuu7PYINNA4Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298601; c=relaxed/simple;
	bh=kSUNpGe+C0VBeSl9/U4AI2gwLXLtaqearKrA8/TMclE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp6Eu/DW1xg+RKqdtQbybvnlbknj3z75jowvLb+jSmKGfZJwKkd9U8sl+z5GoLe+2AHsVkrLTiJaTEAt1N5GWpxry8R/NyGeXAHTqi6gKgb3efYskA1CwQFv5RNCn4Uvxn+3JfgxwpVK0qJXjUUk61J/+IzFa4VpxDrf3Y8z5NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=InDqdP/y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YwgY
	ABMUC2TvlP+jRUvO7d92limdvKOaBOk3hHKu1Ho=; b=InDqdP/yV0uKcw4qWt90
	GgKu/Zem8CaPzrKy7P3o5LDdvi4II9brMZQCjCafrEDy2yGt4/P4m4hbEd2TX71a
	pHTSM1tbS4cfhrIsENI/JynCBuLOT8G/OoQyKdjvN/eywkBidnxr8j7howQwISq4
	A21WgAzIUN2ydHMBddIu55ZkFnAwL591j1EDXGC3TppcCQM/Tsu76K4LcPKjJh4G
	bXrnki9aTIHPR7OgISJt0W3gMKwOw7b15rV5E42mOtFyHUkMRpiOuieMO38rVMfZ
	pEZe6QYyoyPpVTOHnN5d3k1w46SpuaPheVVxniG0Rt4S06PyiY3QqExmS6DeJyxu
	XA==
Received: (qmail 1631988 invoked from network); 13 Jan 2026 11:03:16 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:03:16 +0100
X-UD-Smtp-Session: l3s3148p1@sbW2GUJIiN4ujnvx
Date: Tue, 13 Jan 2026 11:03:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Big I2C core changes coming up this year (was: Re: [PATCH 00/12]
 i2c: add and start using i2c_adapter-specific printk helpers
Message-ID: <aWYYZEPX-_1GfQtL@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUql_tZisfH8E1bq@hovoldconsulting.com>

Johan, (and all future readers I have pointed to this mail)

> No, this is not the way to do it. You start with designing and showing
> what the end result will look like *before* you start rewriting world
> like you are doing here.

In general, this is correct. It does not apply here, though. I will
describe it in detail, so I can also point other people to this mail who
wonder about quite some intrusive changes to I2C core this year.

> We should not be making driver code less readable just to address some
> really niche corner cases like hot pluggable i2c controllers.

It is not a niche-case for hot-plugging. Hot-plugging (which still
should be avoided for I2C) just makes a subsystem-inherent lifecycle
problem more obvious. All of Bart's patch series basically prepare to
tackle this comment from the I2C core:

1805         /* wait until all references to the device are gone
1806          *
1807          * FIXME: This is old code and should ideally be replaced by an
1808          * alternative which results in decoupling the lifetime of the struct
1809          * device from the i2c_adapter, like spi or netdev do. Any solution
1810          * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
1811          */
1812         init_completion(&adap->dev_released);
1813         device_unregister(&adap->dev);
1814         wait_for_completion(&adap->dev_released);

This has been in the I2C core since switching to the driver model and
the underlying problem applies to *all* i2c adapters. Simply unbind an
I2C controller while you still have a reference to its i2c-dev
counterpart and you are right in the problem space.

The problem is known for decades(!) and nobody dared to touch it, so
far. Even worse, the above pattern is not only present in I2C but also
other subsystems. Bart and I have been talking about potential solutions
for three years now. Bart brought in SRCU as a generic solution and at a
Plumbers 2024 session with many experienced maintainers present, it was
decided that this path is worth exploring. Greg suggested to try SRCU
with GPIO and I2C subsystems, and if this works well, we can try to
abstract it into something useful for other canidates as well. Now,
recently, the 'revocable' patch series was introduced which might be
helpful in our case. I am *extremly* thankful that Bartosz took the
initiative to prepare the I2C core for the SRCU approach so we can
research 'revocable'. I currently have zero time for implementing any of
this. At least, from now on, I can reserve time for discussing, testing,
reviewing patches.

It is also perfectly okay to work incrementally here, in my book. It is
such an intrusive change that we need to touch a lot of drivers in any
case. Yet, with the I2C core being a moving target, all the I2C drivers,
the 'revocable' patch series, and Linux in general, I think requesting a
fully complete patch series now is neither efficient nor maintainable.

Bartosz and I do have a plan. We are happy to discuss it with other
interested people, of course. Still, despite all our efforts it might be
a bumpy ride. Because it is such a crucial and deep-inside change to the
subsystem core. This is part of development, though. If something
breaks, we will fix or revert. The alternative is stagnation which I
don't want. The above code was fine back in the days but now we have
better mechanisms to handle lifecycle issues. And I really do not want
Linux to have lifecycle issues. Especially not ones we *know of*.

And who knows, maybe it is not a bumpy ride after all...

> But in any case, don't get ahead of things by posting changes that we
> most likely don't want in the end anyway.

We want helpers accessing that specific 'struct device', so we have
central place to implement access to a protected version of it.

Happy hacking,

   Wolfram


