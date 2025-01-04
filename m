Return-Path: <linux-i2c+bounces-8915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A28A0113D
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 01:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BABE93A4753
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DAA2914;
	Sat,  4 Jan 2025 00:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKarAGkp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6B36B;
	Sat,  4 Jan 2025 00:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735949371; cv=none; b=Sxu40c/8cqmmp2IeEfGdlcYPfq8+Mb2fCPYmJZSi0IP7twPC08a13c2BwybOqvgFa767eRJVcam0CWOj7nJy5E8NMfpOt1LLEaM6DyGNNlBgnDI8iJbXF+cWeod6PuJ5gyvrR/tk5RaLwzgegKLr3o6HfGbyxyJ3Oaep9PUAx8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735949371; c=relaxed/simple;
	bh=NL+6UMAqEckQgTyP9CfH1geXhZoa5MSlyXNrFreAQ64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEnZUjHHBIMjTXLI4kDe2mIE35XcoPGqc80VKtb+RhEGrysSudNuhlgQZ4RerGpF375p9WUzVnhvrfGzAePUcky/B5FLIrE/9v6gojcCi5PJaVk+siy5voyEOftxWwiTPkxY+C5DTu2iEGOyftUuldVfAcOqeWuBc32FSlBSvBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKarAGkp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B75C4CEDD;
	Sat,  4 Jan 2025 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735949370;
	bh=NL+6UMAqEckQgTyP9CfH1geXhZoa5MSlyXNrFreAQ64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKarAGkp3shhVy//F9vhDi4mvw09GclBlXaRSATpbcyL8j552aZD9Y7cQ5DF9COtd
	 JdtaeWyIjgtXy6u934m7tcw8FtUCT4nmEkv+DVNDNNXsqcN8YZaoUXiUmVxZAWVAj7
	 qblQ1+7OKVcVpoMHDT//fgnivbb5LpPw9LZ1OHU7ZVBbTnoKKBSLBYzN9Bp4oiFUx0
	 sGWNpJAKUUqNgO3FGHsp1lggl5I8tVADngudzQ99v2PAdol3TSmxGPoCt0jHtO26TH
	 Wb/Sa8sJYqufUshEHl3GYTFUlwvVcbCaS1NnpaBnYYOQ/elsPbIf7QFakZUWorC7OW
	 A91XqQ8ANJJNg==
Date: Sat, 4 Jan 2025 01:09:26 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v4 0/2] Add Block event interrupt support for I2C protocol
Message-ID: <pvcu35x7prqonlhptakepn5bdqm6skd4qmigvoavejyjj363ug@aemx3pd2po2v>
References: <20241217170424.14703-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217170424.14703-1-quic_jseerapu@quicinc.com>

Hi,

this patch has been hanging here for a while, can we please have
someone from DMA and Qualcomm look at it?

Thanks,
Andi

On Tue, Dec 17, 2024 at 10:34:22PM +0530, Jyothi Kumar Seerapu wrote:
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of 8 messages internally.
> Interrupts are not expected for the first 7 message completions, only
> the last message triggers an interrupt, indicating the completion of
> 8 messages. This BEI mechanism enhances overall transfer efficiency.
> 
> This optimization reduces transfer time from 168 ms to 48 ms for a
> series of 200 I2C write messages in a single transfer, with a
> clock frequency support of 100 kHz.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> v3 -> v4:
>   - API's added for Block event interrupt with multi descriptor support is 
>     moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
>   - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
>     I2C driver.
>   - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
>     struct geni_i2c_dev.
>   - Removed the changes of making I2C driver is dependent on GPI driver.
> 
> v2 -> v3:
>   - Updated commit description
>   - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
>     "!is_tx_multi_xfer" to else part.
>   - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
>   - Changes of I2C GENI driver to depend on the GPI driver moved
>     to patch3.
>   - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
>   - Added description for newly added changes in "qcom-gpi-dma.h" file.
> 
> v1 -> v2:
>   - DT changes are reverted for adding dma channel size as a new arg of
>     dma-cells property.
>   - DT binding change reveted for dma channel size as a new arg of
>     dma-cells property.
>   - In GPI driver, reverted the changes to parse the channel TRE size
>     from device tree.
>   - Made the changes in QCOM I2C geni driver to support the BEI
>     functionality with the existing TRE size of 64.
>   - Made changes in QCOM I2C geni driver as per the review comments.
>   - Fixed Kernel test robot reported compiltion issues.
> 
> 
> Jyothi Kumar Seerapu (2):
>   dmaengine: qcom: gpi: Add GPI Block event interrupt support
>   i2c: i2c-qcom-geni: Add Block event interrupt support
> 
>  drivers/dma/qcom/gpi.c             |   3 +
>  drivers/i2c/busses/i2c-qcom-geni.c | 275 ++++++++++++++++++++++++++---
>  include/linux/dma/qcom-gpi-dma.h   |   9 +
>  3 files changed, 262 insertions(+), 25 deletions(-)
> 
> -- 
> 2.17.1
> 

