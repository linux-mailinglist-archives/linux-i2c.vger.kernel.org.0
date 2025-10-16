Return-Path: <linux-i2c+bounces-13588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DACC6BE34E1
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 14:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326E03BA6CE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602AD326D50;
	Thu, 16 Oct 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeDtq8Av"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0968C2E1F03;
	Thu, 16 Oct 2025 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617057; cv=none; b=smBMlRu47AqTf2Rtm6IAslnuNHmMkCLIRrCfXqzpyej6UmaVRPGTUTKoeVhqW0uhBh+rGQzC0cNZB+vwxbsKgZo24Yq30suMY9ZCDmFaY7xZNZkyKtRgdEOMSwN7OqFbKoJkNdu3QtK5GvCWeNLrcAO/mr5DXti5e9dwWARnyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617057; c=relaxed/simple;
	bh=eQNULmO/I7j0ha8Tji2AaF8Xy3xc/zj3lBAQqeAkCIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzfBQEdIcmegkrwJj7ITiEhPlPKmI3zitz0Fy38oSUlDGpoC1HK1psXrRtkqgro8Uj0IIVLuB1puhMXLGdoZMKKZemtFd4Qs00S6fh1hYUUPUdzX/g4sLUvbfDELMihLSfQHU6TiCTmq1nhg9X7r9FnRO94e0hyJ0UnsNBSZC2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeDtq8Av; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAADC4CEF1;
	Thu, 16 Oct 2025 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760617056;
	bh=eQNULmO/I7j0ha8Tji2AaF8Xy3xc/zj3lBAQqeAkCIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeDtq8AvGvCVglA9M2ikmOI8PO7aHO6yBJh163Uchzxz4Uq+PU36AxAthB06gDWp4
	 ogSnU2uEB59c8utILPaiIRLM2mi9zkrdMW0cKNcNTGF/FnT9TKTuuMyHT8mDvqIQF0
	 JOQNlk8Mesh7Y35c3Y0EHKMZGPThyZ4IBxMmbuUnSRi4d72eIZ5pDpLancV3u9aGqa
	 vn5Fz2r8VwlMQIfntJTLz+OB0a5atD+6wqYnv36UurfHnBOV2WmAyfcm2qyaJiJv23
	 yutrDRgmvgav2ASShM6A84/0M+coXLU4nVOwEMuU2JIy5tCkWWEfOED5+XR0BcxE4B
	 EnydCU7HpxiLQ==
Date: Thu, 16 Oct 2025 17:47:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <aPDiXIMcdM-Gm_J3@vaman>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
 <3lgris6k6ewqjdcfmmovygstqrqjx2jidtr3hb3v47gpgadkka@wlua7qpd7ahf>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3lgris6k6ewqjdcfmmovygstqrqjx2jidtr3hb3v47gpgadkka@wlua7qpd7ahf>

On 03-10-25, 20:50, Andi Shyti wrote:
> On Thu, Sep 25, 2025 at 05:30:35PM +0530, Jyothi Kumar Seerapu wrote:
> > From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> > 
> > The I2C driver gets an interrupt upon transfer completion.
> > When handling multiple messages in a single transfer, this
> > results in N interrupts for N messages, leading to significant
> > software interrupt latency.
> > 
> > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > mechanism. Enabling BEI instructs the hardware to prevent interrupt
> > generation and BEI is disabled when an interrupt is necessary.
> > 
> > Large I2C transfer can be divided into chunks of messages internally.
> > Interrupts are not expected for the messages for which BEI bit set,
> > only the last message triggers an interrupt, indicating the completion of
> > N messages. This BEI mechanism enhances overall transfer efficiency.
> > 
> > BEI optimizations are currently implemented for I2C write transfers only,
> > as there is no use case for multiple I2C read messages in a single transfer
> > at this time.
> > 
> > Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> Because this series is touching multiple subsystems, I'm going to
> ack it:
> 
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> 
> We are waiting for someone from DMA to ack it (Vinod or Sinan).

Thanks, I will pick it with your ack

-- 
~Vinod

