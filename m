Return-Path: <linux-i2c+bounces-2195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431368719FE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 10:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B2D1C2090E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 09:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D02535DC;
	Tue,  5 Mar 2024 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oF9+D/O4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17E653387;
	Tue,  5 Mar 2024 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632397; cv=none; b=e2tOVXm+hq8VUd2F28drlQqA36yPxhK7YwbgKRe1sci1sZyyDorJ3xZwGHhDMxQoNv1556zBJISLo2JTQbkHY4E/XCyaKsM79d50RpzeVOhYi4A/m2XF7bCaukcI3tPudGpZXPZ55k5Zq9AMw7+OTNe0aC8EI9ePSPJ8X0JVQ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632397; c=relaxed/simple;
	bh=PZNtxETNBMvwgRvNajtlng5m/Fskjy/Sopf4o4P6IvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW+7WXGKfUzhO1v02SrMrQE7La6d6Dcrf2gMx0CkxU1pInMs/AArr+oNfJB3KKwHK61SKNxfmqAzmiTB2SyRMf1wWvgW/zUftIei/8vqRd+yoDYMC/m6x7WRS3b+/U1sInYCn1yC88doavZm+cuUcET6faaNbo3qELZeh00DVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oF9+D/O4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4817C433F1;
	Tue,  5 Mar 2024 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709632397;
	bh=PZNtxETNBMvwgRvNajtlng5m/Fskjy/Sopf4o4P6IvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oF9+D/O4L8XlTVRDRjDyp84tWeSb4IdLktYVkVK46OBtmMYkTCxzWDaqF7We/jSkf
	 3JPFGEHV96Vt8UOdVTKaousir12DzaHU+1U6HAWcpoCO5apQ7PRI8bm6wAAesYHu9S
	 PppNoY1mhxcSlbEV8OAsS4z63HP0MC+vvZDdfv+JenQoTEzoMs0OedWErkLB+2QBY5
	 Z6akL1FDwaUiG/fZxxP3nSWazkSpjrGLdSC3LlCq8NpYUyBsqzMyQSxx1hVXRE1u50
	 IzFG+hLWHjDrrU5og5zECV2P8RlJo4t2Ql8BiV52B5WLLzc7l2nlXjBPttJFmQlTMT
	 1P/CYP/YVOFFA==
Date: Tue, 5 Mar 2024 10:53:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Naveen Krishna Ch <ch.naveen@samsung.com>, 
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH v2] i2c: exynos5: Init data before registering interrupt
 handler
Message-ID: <vk5s2p43v7lmmuwh3mzvgqetu4luwodmkejf4va6xyxwgdn5eq@ej2mjdii3rle>
References: <20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-i2c_exynos5-v2-1-7b9c312be719@axis.com>

Hi Jesper,

I have taken your patch in my testing branch, but...

> +	/* Clear pending interrupts from u-boot or misc causes */
> +	exynos5_i2c_clr_pend_irq(i2c);
> +
> +	i2c->irq = ret = platform_get_irq(pdev, 0);

... I get this checkpatch note:

  CHECK: multiple assignments should be avoided
  #60: FILE: drivers/i2c/busses/i2c-exynos5.c:932:
  +       i2c->irq = ret = platform_get_irq(pdev, 0);

You are still in time to fix it, or you can fix it later or you
can leave it as for me it's not a big deal.

But, please, next time, make sure to run checkpatch before
sending a patch.

Thanks,
Andi

