Return-Path: <linux-i2c+bounces-3371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C378B9A0A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 13:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24867284D6D
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 11:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B0E629E6;
	Thu,  2 May 2024 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESlSRyPf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8695040BF5;
	Thu,  2 May 2024 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714649382; cv=none; b=BUQ2P+3TG7qJqpvHCYfZe04PGMGEKXgPXqLf2+0im6WbGkpATIY3EctSRdhnKwEZ5KdgJ4UCD9z5SKZ6AQ6SEd/I0CSALptSfnt72CFyJL0jGKTN69JzUXWNJvT1+skald+UY86dmbWetx3X4seAT90aKz9B/invZj8axBqvSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714649382; c=relaxed/simple;
	bh=sFaNlOmGEeVD3nYHw0uf/YVM65vnE+n2alDOQR8Xux8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taEJxZau7LUk6HvMkVI6mwDSUcZg6y3kj1BRc+ERTT1NZVF+3vXu31vuTA4GjrMJYiSJSKY9x0YMp/HjLkdpTN0tjiViVhPQjTAKElBsVOa/RB8f2Ric7OAIzGMZwt5gvFMzld0YGzZHgBoVws7JT72j2JdFd6NBdzXj8vxhntw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESlSRyPf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8390CC113CC;
	Thu,  2 May 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714649382;
	bh=sFaNlOmGEeVD3nYHw0uf/YVM65vnE+n2alDOQR8Xux8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESlSRyPfuggpHlVgObOH64jFR9a8f9GIZCEhVT8gPmkobRlLYwAUiNRPfLbKhZwzW
	 v7ynMJzCeC3YDHZQGy1Q/mS6f3TG5Qn8hnFAIHQSm32cuRdykxx6YOM7yco+HfAKf4
	 SHaKiTPRAfmytRm0NPO+SKEUr04uz4iJG4jgPSVoxiiZTOrGtBPL9YTrVMvZjbNoNA
	 hpfZSUbfu5x4dgJf3pv98nxFDT5uDOnpz3xK1za+KYGS+AiHdyoHiFFSauA8N8KIVL
	 WWTfVYzc0t6o6VrvByrKuloKxF38CiRBT0qqJVhTi3bXJyhPvG5z1dB5AGwXshKh5j
	 kw6XFUPZ5oEXg==
Date: Thu, 2 May 2024 13:29:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/15] i2c: use 'time_left' with wait_for_*
Message-ID: <6zrly2hk2vqljiuo3niehym74pqdgfv77fzjb63shgg4iiwhnt@zcnrqrke663b>
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

there was a little checkpatch warning here for the line being
over 75 characters, but I went ahead anyway and pushed the whole
series to i2c/i2c-host.

Thanks,
Andi

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
> 
> Wolfram Sang (15):
>   i2c: amd-mp2-plat: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: digicolor: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: exynos5: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: hix5hd2: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: imx-lpi2c: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
>   i2c: st: use 'time_left' variable with wait_for_completion_timeout()
>   i2c: stm32f4: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: stm32f7: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: synquacer: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: jz4780: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: qcom-geni: use 'time_left' variable with
>     wait_for_completion_timeout()
>   i2c: rk3x: use 'time_left' variable with wait_event_timeout()
>   i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
>   i2c: pxa: use 'time_left' variable with wait_event_timeout()
> 
> -- 
> 2.43.0
> 

