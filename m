Return-Path: <linux-i2c+bounces-7153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4398C082
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 16:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9C41F24A1E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B381C8FCE;
	Tue,  1 Oct 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfiFt8H8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1A1C7B9D
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793662; cv=none; b=TFL3iLBmSL07o1mPMHe82IWfW8caNTVaehDMXBBIiMaQNGsYLgnvDMx2NAOpv5F5V678M30Le/8zb6jYxeeo9TN/oNLBtME+SL0HuRZcgkgr/ivCwHS8absJkCX8GVXor4jABFaYRo13wCLcMPuQI1F5p7PTTJU8XK/jBeQ5s5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793662; c=relaxed/simple;
	bh=yH3EYi9l7999VMvJhbJUAJ9GmVhEmuscSZSWkWCB8eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBndbVvAzJS0VcrP2qjhtchshxahPM0d1OgC6Rw5tWsVgxukrpxUL8paiqPIWqsvqdsROgDIgpTcwMC0y/DD7T9vSrYy8UYR3LG2HKG8KtALG1FdkV3TnBBw1Y9/E57jZ4WSM5NP8CrVlAXEPwwmi0olKPM+RWx/12F6ErTXEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfiFt8H8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E070EC4CEC6;
	Tue,  1 Oct 2024 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727793662;
	bh=yH3EYi9l7999VMvJhbJUAJ9GmVhEmuscSZSWkWCB8eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfiFt8H8f9Iy5Ux8P2ifGd4nOe5WPqJcQE0W29n9xYt4iS5yfGaifJqaRVskFaV8P
	 T3SW+GYwqr7vy3aPyLse/BDE96odIUhBJpZI+P9BoY3m5w4Q20ByXBMuaV7Az0ldt5
	 8JY6Jr6r0y8H20aaYhC3rq7FQNNzifxxUqGDEO+yhWVs1SZchLCIJCvBbjLCxMXcSd
	 bDVJ5vC2WVfY0+4dtB4Yw2j+fjSAwf2fP9ydXNXYz/v6XDC3RLcbMd4GaQTTO7GYJ6
	 oYPXAiuSoT6od4r/nYgzdG+xeKr/voBwVx/tFKgIgPSEpnAbqB8u2yBeh6KyZTr7xA
	 +bR6AXwGv4dVw==
Date: Tue, 1 Oct 2024 16:40:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-i2c@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] i2c: stm32f7: Do not prepare/unprepare clock during
 runtime suspend/resume
Message-ID: <nxle4pkngjnzguo4dzkc4hthggfovvzfvrkygdcy7mygkebxyi@yl72fievk2bh>
References: <20240930192820.59719-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930192820.59719-1-marex@denx.de>

On Mon, Sep 30, 2024 at 09:27:41PM GMT, Marek Vasut wrote:
> In case there is any sort of clock controller attached to this I2C bus
> controller, for example Versaclock or even an AIC32x4 I2C codec, then
> an I2C transfer triggered from the clock controller clk_ops .prepare
> callback may trigger a deadlock on drivers/clk/clk.c prepare_lock mutex.
> 
> This is because the clock controller first grabs the prepare_lock mutex
> and then performs the prepare operation, including its I2C access. The
> I2C access resumes this I2C bus controller via .runtime_resume callback,
> which calls clk_prepare_enable(), which attempts to grab the prepare_lock
> mutex again and deadlocks.
> 
> Since the clock are already prepared since probe() and unprepared in
> remove(), use simple clk_enable()/clk_disable() calls to enable and
> disable the clock on runtime suspend and resume, to avoid hitting the
> prepare_lock mutex.
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

I think we also need:

Fixes: 4e7bca6fc07b ("i2c: i2c-stm32f7: add PM Runtime support")
Cc: <stable@vger.kernel.org> # v5.0+

I'm adding them, please, let me know if you think they are not
needed.

For now I merged this patch in i2c/i2c-host-fixes.

Thanks,
Andi

