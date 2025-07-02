Return-Path: <linux-i2c+bounces-11774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D829AF5FB7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 19:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91046520DA0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB00301127;
	Wed,  2 Jul 2025 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ9RcvdQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452BD2DCF7A;
	Wed,  2 Jul 2025 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476552; cv=none; b=Xn/yJYPQHqIGtuyy4I5/YNABGCoHn+qw9Gp3G0dr+TdW8jwupK7Dr7PCLc7816ahZioHzZVRcbTFXy1TOx4/dLhFMvriGr227AsN8F+4FVP0t/rZIBZs6qxS/UJCTp2Koks+p/qnk06KxtyDQ/Hu3c1Y3cmnl1uqbekDqr79+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476552; c=relaxed/simple;
	bh=MvrKqU9KXRVMqW4wYVRfFpUOXGEDg+T9aX7yo71XcrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAgH/PN09a9x6mWxMI0npkvxK3GWzeu1QkxcrsSOAe9cTUV8HpoKns/7xl5DrCtyJWo3A1Cw/J0gUX5yC+RDm4qzXpH8644tXrwJos8HisG2V8xjxYIj8fC0EchDZ52G766n2HacsELtLHC8shMWUWkF7zG9X/UuM3fBP5Qv7M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ9RcvdQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130EFC4CEE7;
	Wed,  2 Jul 2025 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751476551;
	bh=MvrKqU9KXRVMqW4wYVRfFpUOXGEDg+T9aX7yo71XcrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZ9RcvdQOreMvSgDQRdVOEc/3VFScLsnmhwqM/sa66bIpvbg3w1OV8quHFH0LNOoB
	 8FB/kdxkY6aDGF+O/uTnDyUWZVrlDyfq/qNztceUP0tY6uIYbOwi0fSIuszRSCrdzG
	 QDzzB0LlXvYk1jazJvoITjrYUJfKwNCJSk97GM3O2TstHMJZio4EWnJO849WI7F9RO
	 ULDfzU7qYCzxNDwwsd/zKqS0TNDWvyGZ+hemOL7S+sw2LuEnJRW00f4KV/rwvU9sJd
	 aw51UzEocEFbb8N3yvhs28mzsG+HFmuKRJwCtE+QjYr62LYG138yA36eL+aA/KYhZW
	 Z5PLvkvXx/Yag==
Date: Wed, 2 Jul 2025 19:15:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, 
	linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
Message-ID: <4lqsyuabfwnclt2pbxmgqz5zpd6zm5y6q5djiwopuq5eelz7ui@fgep3x24ur3e>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:15PM +0200, Clément Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.

same here, I don't understand anything... you could have written
"do some coding" and it would have been the same :-)

Thanks,
Andi

