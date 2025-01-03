Return-Path: <linux-i2c+bounces-8910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B96A0111C
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7139018847FB
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF041C1F27;
	Fri,  3 Jan 2025 23:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnszCq2M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E7180A80;
	Fri,  3 Jan 2025 23:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948229; cv=none; b=M/xySbN8o3sn3H1Whp8FEBGMR1LWWuwd9+envPUNffQXuWTaooyi0FxmJwmMt9eQhCTKzbRKe5IkWLDnn8oMATyoEKZAc4jBu22YMJ0R+9iMKFZSel6zmmaLp0lTRauieQceLQHDrQ2t4I8ql6Vch4xZo8yIWof1MMhSu3R0kco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948229; c=relaxed/simple;
	bh=7iNAQJ6RCNMdWqDpBNOcaQ7yVH3N9fLx8/+Km7yrJsk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGKMElCAbabs/L3ShibX4gYcShAAc6gC0ELkuBDDQevgnYe6ebzW6s9zx4gFgGAjbYekktNitkiHCxcF9KMFhzZ57MNzh6fRRwADnHZbFoMPQBOxGcHaK4S2fuIVTwBGk5B1v/NoLlprLe1X+ELyT4o14VVYxbTA6u0NzPBhTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnszCq2M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B32CC4CEDD;
	Fri,  3 Jan 2025 23:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948228;
	bh=7iNAQJ6RCNMdWqDpBNOcaQ7yVH3N9fLx8/+Km7yrJsk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rnszCq2M7mhYVrTgF0YkezCxDo2y5h3Ty/jxoA5HYWmPiLPbOFukPxwlD5Er21s64
	 r3gkoOI8wZWbw8UzCPyRvH44P7iHe1WW2XixWVejkNQaX2QfLC4116ms9JrZxFgStV
	 fZET5un8KmFpkFihNDHbdMDQdSYFChFax5zShYWIwV4dz5bgtTl50yiWHTWDEyhqWw
	 Aiwu5WpvDdnngS3GiTnftWzPzC5zALeiFQrGqOHykJIETtbyV92dV4SN4J+Xbjc1Qz
	 wwoJJo++UKxIBMatQKQeLTyaEiLLVshTVtgAnp3Z4qiVFudtZySGMFaIn1ZbpFrZ2x
	 97WAvIer9Rr9w==
Date: Sat, 4 Jan 2025 00:50:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Atharva Tiwari <evepolonium@gmail.com>, kernel test robot <lkp@intel.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <eqjgc5a4fiz6csqmehyo66yduorxt3d3vnr62d5ijxy3wooheo@qabiaft2nri3>
References: <20250101103422.30523-1-evepolonium@gmail.com>
 <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>
 <Z3hyr3ZVf4rBuV-N@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3hyr3ZVf4rBuV-N@shikoro>

On Sat, Jan 04, 2025 at 12:28:47AM +0100, Wolfram Sang wrote:
> > Now, you're treating it as a fix, which is perfectly fine. For
> > me, it's a 50-50 case.
> 
> For me, this is a clear no-fix case as long as nobody really reported
> problems (which I am not aware of). Also, looking at the Kconfig text,
> it looks unlikely to me that this controller has been used with big
> endian systems. Or?

Yeah! That was my first thought, but because this was reported
by LKP (which I respect more than other code analyzers) as a
potential issue, I was on the 50-50.

I still agree that the patch is correct because there's a
hanging comment. So, either remove the comment or go with
Athrva's approach.

Urgh, I'm just leaving things as they are :-)

Andi

