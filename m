Return-Path: <linux-i2c+bounces-3324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE2E8B66BB
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 02:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0DA81C213EE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 00:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7735A41;
	Tue, 30 Apr 2024 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCQ7Y/lG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61507170;
	Tue, 30 Apr 2024 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714435669; cv=none; b=DP9y8cVFo3340WSCu8pxSCdkpyqY3f/Q0SLOqyvyOJOfkPmmIYoLT2yGZS/DbJbSFzeAUnyDbPggkZT0Tm5b0mNGVNDP7D7I/Xe6oZFlASG9WjJ2qwWJRrvqOev0LYwRu1kKFFypwrJxu+LGOEGLkkIjFUvC7IURI+H+4zE3wP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714435669; c=relaxed/simple;
	bh=vhMJowDwRuHTlntrjfGcVCQMNqbpSZQLuzucFeDjBg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiRdzf4VOzPiJor1k+axXrzinfSLZwXBaYwEjd165VFv5V8nOeDiLLvL7X/kAIMIBewx4OXodYIPAZ8f7DoAm5D1oQONiy1ZU9oRvvy5lTw9CKdzREii2wghyW4d1T1K40Q6yVHsd0SenCIZyHb2zils0JZeZ9WfcWd2Bxhx1KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCQ7Y/lG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B9BC113CD;
	Tue, 30 Apr 2024 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714435668;
	bh=vhMJowDwRuHTlntrjfGcVCQMNqbpSZQLuzucFeDjBg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCQ7Y/lGUacL2IZijCKBlGObESxVjjzsNASBP6BpxH7vYi0yR/wJ2unwlXZKOgThD
	 Bq45bgnTPaVF7espT+Nhd5rEHV2F1W1XQ9W3pUqNK7HsrhdCigz5URD9um1NcrO07A
	 9Rru4vTA2LWW2s0BlH+12gPtJCa4vWrNjg//+P5CooPJo1vEZWZRaw561F6OuM5n9B
	 HptYENweRlTg8pMcX2pRffTkhIH4rQCk7KUu4bLw5KlYtCMK4LKva2NYtjvccX2h9y
	 bCa2bYiIjdF3covsdemMsir4FU94t25zzA82/eE7zzn5O+wmQGg1yi3ETGyQAfGXFt
	 MPE8NlBvInCdA==
Date: Tue, 30 Apr 2024 02:07:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/15] i2c: use 'time_left' with wait_for_*
Message-ID: <cscisecgo547dngzcpmcvertywekxtctyxv6hwhnmi5dq4azh2@4lpq6a4qga3s>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Apr 27, 2024 at 10:35:52PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_*() causing patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> This is the I2C part of a tree-wide series. The rest of the patches can
> be found here (slightly WIP):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
> 
> Because these patches are generated, they need manual audit. So, I will
> send them step by step. This is part 1 and also a call for opinions if
> this is a desirable change. But at least in the I2C realm, I really want
> to have it proper.
> 
> Build bot is happy with these patches and I also compile tested them
> (except two). No functional changes intended.

It all looks good, I will give people a few days more for reviews
and comments and then I'll take it in.

Andi

