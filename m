Return-Path: <linux-i2c+bounces-2104-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2C86E858
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 19:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 981C6B2A099
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 18:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BA836137;
	Fri,  1 Mar 2024 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlVbQotp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2918825;
	Fri,  1 Mar 2024 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709317228; cv=none; b=Zltt2YzKcWvRl86I7zww/Dt2URm+j1U2xbGBp9iA6WPjqy/uI+z9j+A59nExXCT6QlvcDybEgp4UBtevyQIT8zgQJ3G6wroy27jN5joJleq0o+Dv/MVhfx3c4mE95i5bysiRt4vWY9pTUw4bYlt7FChYAa6s4K/gRIeOEYmElWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709317228; c=relaxed/simple;
	bh=iBux+NpSO0fGXlkPWfWMWmpfroby+67VeWoReJWiqBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBYSgTs9kk8O1q6ZTlwPqNpMUFrftgTiSHzeLBVciOCZ9KaICo+tGCSYLK5HRRsJ0e/QorT1C8PjZxqsNVWvD7JFAVpSbZ3L+74dU6mpvXeCjT6soo+XA1mJP33+uqNXiKaqy4oTc/VGu60vvPiGKcggddRxQ6Hod9IsKbbzKQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlVbQotp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC126C433F1;
	Fri,  1 Mar 2024 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709317227;
	bh=iBux+NpSO0fGXlkPWfWMWmpfroby+67VeWoReJWiqBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlVbQotpgNtrIyzQarTw7Rzu6RIQM6y2IiXS+g2Jc8uNSz3Q0Lf15+Ul7OJdb9C80
	 8YuBXNQGyKumcj24pke5+rUL9cQ4wbU75dHiC81CokGtmo3pLc5Fy70NsxgoD+6hQ9
	 I5tJmJ5xGFj5JFTdze3Jf2Cd9Ub27f3cUtt15kuFRhD2Vtf3hCo+c/JMm42c69ZoEq
	 huR9RYeY9sKwcN2EA81VGLMsI0HBdGmnuCvPyoXOoFTv7mL8ILVjOtbGFe6DNit4Ow
	 6Zs+ZxNVUDIz/pP7G/5O8+8ExXTBsrEQsZI1ZE+WfiP/z7gr3340BKYBMZXHbXwg5X
	 BiFWj6Ih6am0w==
Date: Fri, 1 Mar 2024 19:20:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [SPAM] [PATCH v1] i2c: i2c-qcom-geni: Parse Error correctly in
 i2c GSI mode
Message-ID: <zpkc4hxxkalw2cqhp5fbhdge4vhfrthi2ezhkpecninqvdcn6n@oddo2j6tabce>
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

This is a massive leak. Why are you deciding to make the
allocation dynamic?

Thanks,
Andi

