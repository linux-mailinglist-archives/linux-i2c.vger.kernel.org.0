Return-Path: <linux-i2c+bounces-2105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56E86E8A2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 19:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4A41C231F9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 18:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C636C39ACB;
	Fri,  1 Mar 2024 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozKTF75p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799348F65;
	Fri,  1 Mar 2024 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709318701; cv=none; b=fUuMqY5MFAa1slNVy8b9sAaiz8atO9aTgGwGZBu3JYtbGCWlHsNbVqcWkKw+VRP9nTfpm9HZ/Q/wvyfHn9TDkExdzYWH94AzlZeChZiIahjY4j0X/J/kBEiKyUddy8VEPShf9cMlXzkqwSjYHu4dk4UjJIL7M4MmFRNZkldqcEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709318701; c=relaxed/simple;
	bh=id1yxnRe4d1iVCCOZ0uMeXqYvdX54AmG8Ltuh9AETi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzyEfgVvS/4sV2jVM6p8hj01PC9GXJlZ0Y5vhXDzjLipphk0St7XVSjgQfY1E52/QHpvRY7AhRQDna8E4OkdovKra9MLFzlDqGw2YEKEwHpMyN++5iNA2brPSIk6QnIfNw4zPdIBWbjoVT3rxANo0bbFSLc4SOg/HZEKUAP9/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozKTF75p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE67C433F1;
	Fri,  1 Mar 2024 18:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709318701;
	bh=id1yxnRe4d1iVCCOZ0uMeXqYvdX54AmG8Ltuh9AETi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozKTF75pI/DiPLnxnR80D2QsV+tX5cOFWKed+C4cXD81TM13NVUXruKRuVGpPU2Uh
	 hGIeXpCeRD9ygx6L+BkV8Sut1PFKn4siYbtEjxf5RGPXfWPEmg33jefCP0n379A8ep
	 9E1/fHPOGWOrDhA/UUVp4qbZx2lQjDMKhYRw3SUjNfixTVZrUkFqNQHJuou5ix/XT4
	 iQB8biQr/8lHwEmCP9ks5UKfRQaVblbPj1o4RVMVuSBvH5iF3GNjVTEx7bdOXopci+
	 dOvOs/mSYh1azHsJaYD49QYlunYdSGo10mfOrpoYf1MICGowbXcyvfGa1XDtCI0x4Z
	 GVjhsO8tU9CYQ==
Date: Fri, 1 Mar 2024 19:44:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <2wala6lz4vanhvfx6jtpdexnpohabuvhzt4i7kt2xvmlfrapq4@tmvl37npj7jy>
References: <20240301112638.990045-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301112638.990045-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

(I'm sorry for the noise but my mail server has marked this mail
as spam and put the spam tag in front of the subject. Therefore,
my reply might have been marked as spam.)

I'm going to send a new e-mail with the old answers.

On Fri, Mar 01, 2024 at 04:56:38PM +0530, Mukesh Kumar Savaliya wrote:
> we are seeing protocol errors like NACK as transfer failure but

/we/We/

> ideally it should report exact error like NACK, BUS_PROTO or ARB_LOST.
> 
> Hence we are adding such error support in GSI mode and reporting it
> accordingly by adding respective error logs.
> 
> geni_i2c_gpi_xfer() needed to allocate heap based memory instead of

Please use the imperative form.

> stack memory to handle and store the geni_i2c_dev handle.
> 
> Copy event status from GSI driver to the i2c device status and parse
> error when callback comes from gsi driver to the i2c driver. In the
> gpi.c, we need to store callback param into i2c config data structure
> so that inside the i2c driver, we can check what exactly the error is
> and parse it accordingly.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")

What bug are you fixing here? The description doesn't talk about
fixes rather than support added.

...

> -	config.peripheral_config = &peripheral;
> -	config.peripheral_size = sizeof(peripheral);
> +	peripheral = devm_kzalloc(gi2c->se.dev, sizeof(*peripheral), GFP_KERNEL);
> +	if (!peripheral)
> +		return -ENOMEM;

This is a massive leak. Why are you deciding to make the
allocation dynamic?

Thanks,
Andi

