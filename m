Return-Path: <linux-i2c+bounces-9768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0445A5A56B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 22:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B665174424
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 21:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02ABC1E04AD;
	Mon, 10 Mar 2025 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XELG8I6W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2612B73;
	Mon, 10 Mar 2025 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741640463; cv=none; b=GpfhwkIhT9HzIR1ziF38bhC9GbL3joQ5p/YtVzS9YH69BLh+KW+XvXe7z9zrB5h+cFQFLuhvBQf+RbBhfCDWOsYY3hqP8p/2kK9YKH6zhWusJigNBxfT4wVMrk4AyJ0OkcPuNg6GuV4ooG7AvFvH4Oy3qOOXXHT5817E8UuabjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741640463; c=relaxed/simple;
	bh=aYyGi+0GlhtZZOl3eElkEgro/Og6UgEBW7ME0Eh2cEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uj1WkTgSopApKZtTKGLls2ma+G9zFYIvmn5sIvn8bvFJTEKyAEskUTKCGc2pm+34h+iabTmPKxqWnmdzQq9UUoT+/r+9PB+BmOO1q2G87jFef1dovRawFzPvBr1cnfd1SNgzejaO82mtpEvxoEx+cj128uiixj5Azyg+PoibC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XELG8I6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE6AC4CEE5;
	Mon, 10 Mar 2025 21:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741640463;
	bh=aYyGi+0GlhtZZOl3eElkEgro/Og6UgEBW7ME0Eh2cEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XELG8I6WYICbM6YDswWTIzR5vBY0ZCdCcGJ/XwRd+rPF8jWKv8h3HR7gxrqFV55Yk
	 YC03rspukIbY7kdASAul32qn3tTTF0Mjsk4YyEhIb3u5/Qj1XV8c+Zcm0FFT2h6v/m
	 F+zkgxIJhbNnd1atUL3+ZMTBsK1wGd1gj7eVnMIfItWqcZQxPHdLUiPB76A4Z3cCow
	 IF6tot8i/DiR7HlFaN9aZMA18vcatU2dTOp5YxckUak3MYgFIzXJtGfVYF6T2k2P02
	 /qA3Twqr+moDiV/Zm01s5J3HOrF4lAXYPAyy3NYPcJQWX3oaLIFX74c7Yw+/KrdG1v
	 Dwfdi1Ujv4h8A==
Date: Tue, 11 Mar 2025 02:30:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v5 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event
 interrupt support
Message-ID: <Z89TC7fKzmmeu6tW@vaman>
References: <20250212120536.28879-1-quic_jseerapu@quicinc.com>
 <20250212120536.28879-2-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212120536.28879-2-quic_jseerapu@quicinc.com>

On 12-02-25, 17:35, Jyothi Kumar Seerapu wrote:
> GSI hardware generates an interrupt for each transfer completion.
> For multiple messages within a single transfer, this results in
> N interrupts for N messages, leading to significant software
> interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
> Enabling BEI instructs the GSI hardware to prevent interrupt generation
> and BEI is disabled when an interrupt is necessary.
> 
> When using BEI, consider splitting a single multi-message transfer into
> chunks of 8 messages internally and so interrupts are not expected for
> the first 7 message completions, only the last message triggers
> an interrupt, indicating the completion of 8 messages.
> 
> This BEI mechanism enhances overall transfer efficiency.

That sounds good but I dont like the idea that we add a custom interface
for this. Please use DMA_PREP_INTERRUPT instead. Adding this flag should
trigger N interrupts, absence of this should lead to Block events only

-- 
~Vinod

