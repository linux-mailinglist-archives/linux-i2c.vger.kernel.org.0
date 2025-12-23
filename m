Return-Path: <linux-i2c+bounces-14736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C24CD99BC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 15:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 536F0300274B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC3131A812;
	Tue, 23 Dec 2025 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2BqBSVE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D1925FA0E;
	Tue, 23 Dec 2025 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499843; cv=none; b=uUyscyRjNJwsf2gAJ0tVPwcHLRAFdn8oJj1BexeXsIjRuLn26Upz5nc4ATINSRaL+s0zKdCsFWJp16I9vHQkThOzST+RPsuqLiZa1NRzMTtrjO2FbGVi5CNJWif+VMt3Pfh4PJ+r/oXk7v7TX2fou1NpGJ+i2jyx6mkhDDQBTG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499843; c=relaxed/simple;
	bh=LVIPzMudx/3KFt0kpQO0KjKHpoGH1y/OUS9xlATtlVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsJvqNSQzj3Mr9pX1bzrqSuJbBhKjfXkf5V6jgBW83XfwMh/DMCZv/v9Jp0Z4N4KGMiOU70kh7Sq6uoLwIv7MGeIxygW+fDQ13zgSWVFChlk25K39mVl76ZbXr5Ow0A+ZfZN9BLIOvHX7UBnlYaCn+emr8NnsLnhm18Ti/tZmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2BqBSVE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67551C113D0;
	Tue, 23 Dec 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499841;
	bh=LVIPzMudx/3KFt0kpQO0KjKHpoGH1y/OUS9xlATtlVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2BqBSVEvD8+egd2DKh0M7CRaA07nAPvAIGKjOh7dXuv92V35/4lUGDfIix3vJJOH
	 czLv1diFXWHMpuNqZOAhFZChYdIuHY+tDBVVzzZgV5ZlNznGxvTOBj6gQ1HZL+1RRn
	 ciFQUYyqf9ZKutUfnwb+tzowRzQc7rx3Dnlf3nyXGwKLfaDfs8gstN7zHth8wwAEiH
	 gMsEdVuEdYYz49ksnN/blIurAI7UHMrJ/fUJlv9jQWJ0mwlo0EGyuRVKwHnBJsV5vW
	 0TnFS3XwiqLf4367PRa9pYG5wOO3w6CGtBH57P6Vvf4JrokPtbdx3aetWFutDVt6nM
	 w0H5zVnptbNpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vY3Is-0000000036w-41rb;
	Tue, 23 Dec 2025 15:23:59 +0100
Date: Tue, 23 Dec 2025 15:23:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aUql_tZisfH8E1bq@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

No, this is not the way to do it. You start with designing and showing
what the end result will look like *before* you start rewriting world
like you are doing here.

We should not be making driver code less readable just to address some
really niche corner cases like hot pluggable i2c controllers.

But in any case, don't get ahead of things by posting changes that we
most likely don't want in the end anyway.

> This series addresses the usage of adap->dev in device printk() helpers
> (dev_err() et al). It introduces a set of i2c-specific helpers and
> starts using them across bus drivers. For now just 12 patches but I'll
> keep on doing it if these get accepted. Once these get upstream for
> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
> drivers/i2c/.

Same comment applies to the other two series you posted today.

Johan

