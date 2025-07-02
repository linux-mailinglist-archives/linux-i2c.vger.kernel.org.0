Return-Path: <linux-i2c+bounces-11772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C17AF5F7C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 19:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62854448099
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300272F3C39;
	Wed,  2 Jul 2025 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ne6mhWW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1F2F508D;
	Wed,  2 Jul 2025 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476098; cv=none; b=q7+Du98DcySNdYQ/EFCnmNyrlG6O1B6BiFdSBXEkGO5AcrhZUN1l0zWTJqBFLq8BPqug4xO9CvdFE8WAK2P+rw5n/TFxPiJi8sncZlewCPDPJrjEQO/0/R5mZZmGnj8OkO3qBAsQOz8TswxwlHrnx024/N/nK3IMx2bzvSyqJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476098; c=relaxed/simple;
	bh=sl+L6c54S4JFvlxl6rBTBhnWpBiz19X6BE8lx/bDcPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaBssJ8dog9OugudfnrcyTNwpibHxHYW2uC84xqyoAoai2IfMLqldqsc7Qki/cQHkrlUnXQ5/NEGXvKMExAaIkrQYpWjwRkLDmlaW43bUjQQtXrH1A63Q7aXSNjGQDZY9gLKMDZ+p/eePRC0PT5BS+u6vqMqOEFWqtzp0k2H2xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ne6mhWW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F52C4CEED;
	Wed,  2 Jul 2025 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751476097;
	bh=sl+L6c54S4JFvlxl6rBTBhnWpBiz19X6BE8lx/bDcPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ne6mhWW5/ruaxicHzkogiUibQWjbCGTAI+my3l4pVqB15UOy1fW6nLHm9mZROYlDa
	 PzWhevJsY4UJj9sCUNIj6dJJ7cZKFn6XiIecaEgHCVZZwbtgB0ixXgVhMM+ak/sDyy
	 Jma4GMusJQ1DbYwp13XD+6jkWW88Cd3y5UhC/Lt/O/nq9DrCRkisDhza0XHFhsRmMB
	 WISjBHieLagyhTV5XYWNtUMwUKHYmaTaC4C1Tq2h1MSDUfJAjFu4ZV+t640sDopXwC
	 a2HSyzYZk0lBNN1sHlKHp9oM3CybVJvSzzjlpdk7eTclBXjeZ1+qtmcG0pI4kAXxxF
	 uukyrWgcQ6IfA==
Date: Wed, 2 Jul 2025 19:08:13 +0200
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
Subject: Re: [PATCH v3 2/3] i2c: stm32f7: unmap DMA mapped buffer
Message-ID: <zp3pagbojmu67o4sjm65a44ovvui5uvybs32nayvhtewfbm4el@n5lro4v5iq36>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-i2c-upstream-v3-2-7a23ab26683a@foss.st.com>

Hi Clement,

On Mon, Jun 30, 2025 at 02:55:14PM +0200, Clément Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.

"Fix an issue..." is too generic. Can you be more specific? Where
was it mapped? Where was it left unmapped?

Please, do consider that the user needs to understand what
happens in the patch without needing to look into the patch.

> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e4aaeb2262d0..042386b4cabe 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1554,6 +1554,8 @@ static irqreturn_t stm32f7_i2c_handle_isr_errs(struct stm32f7_i2c_dev *i2c_dev,
>  	if (i2c_dev->use_dma) {
>  		stm32f7_i2c_disable_dma_req(i2c_dev);
>  		dmaengine_terminate_async(dma->chan_using);
> +		dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +				 dma->dma_data_dir);
>  	}
>  
>  	i2c_dev->master_mode = false;
> @@ -1622,6 +1624,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1642,6 +1646,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);

Can't we use the dma_callback here, or similar? I see some
similar patterns and I think the code can be improved.

Andi

>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 
> -- 
> 2.43.0
> 

