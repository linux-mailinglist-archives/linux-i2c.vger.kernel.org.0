Return-Path: <linux-i2c+bounces-11604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF1AE999B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 11:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3ED167B75
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4415295D95;
	Thu, 26 Jun 2025 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Ua/0wZiz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8140218AAA;
	Thu, 26 Jun 2025 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928802; cv=none; b=O3QnjN/k2NylH4uF6W48OVaX/j7SGt4VyJgzUuEshhin/OBP+8lNdbnHlzOlfMXnWEAyTjUzQDwLHnIMF2NCUGsVqT5AL8JqbP2jyPN0NaclYsTZ/NlClLGleUMt4DnQzzvBGQhVHpQGOlxpa10aCgpUfJePenvd9Tr8VovzJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928802; c=relaxed/simple;
	bh=tG/5cNlLK/kXqFJS1cRXWXvsOfAAbi28sGdlXX21KZ8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fj9xw2GWPBYelWDZDQulsXSH2SEFiwMgDJx6atlr/Z3ZoW3RfNvRdMwU2TmRdQh7pX8F9hT8y94ms8cDdNqO0jijR/2BtvKT+VZKAFxc0MopytqtI8O+Lv7nXR/cF5+CK+lnphD610TbhBY+M/yu8QTy1XZDKHjEbo+E5aB4n24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Ua/0wZiz; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q8TXu5002736;
	Thu, 26 Jun 2025 11:06:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	yzHnsmLTewRsBfKjcqS7Ovd/FClDc2H6W6if0kL0/KE=; b=Ua/0wZizeUaayLiM
	sXZv4jngLUekGFY86nIQFCWLKslebcuvBKzdPrea+yMDtXzzxzxfyhX5LMbZRH+P
	oOGTBIo9bXUT/cp/J6+IO77mhvsWjHXC6ZKvqXwUB/ogCZj11EQ+kN2PE3dqc9gz
	RE0nKR6sNtNgyQf/PLFfA092pxu9hfeHkvHwIpWynI8puTlTi/K5dbd9CuVUo06m
	8TazMhhD/mLbcgaqPMYVdja6IEsIM4QVwslyBxSK1q000NUQgrfHLF260QvrwVeY
	yue7Q5r14Mqgvx90T+BPa5zALMXGv0HEjMXtSHHCx4om84GLlhcC7lYmoqdntUZK
	ZFoV2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dhvbwk1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 11:06:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B3AA14002D;
	Thu, 26 Jun 2025 11:03:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 241D0B2F98C;
	Thu, 26 Jun 2025 11:03:03 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 11:03:02 +0200
Date: Thu, 26 Jun 2025 11:03:01 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>,
        M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 2/3] i2c: stm32f7: unmap DMA mapped buffer
Message-ID: <20250626090301.GC348766@gnbcxd0016.gnb.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01

Hi Clément,

thanks for the patch.

On Mon, Jun 16, 2025 at 10:53:55AM +0200, Clément Le Goffic wrote:
> Fix an issue where the mapped DMA buffer was not unmapped.
> 
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 973a3a8c6d4a..a05cac5ee9db 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1622,6 +1622,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  		if (i2c_dev->use_dma) {
>  			stm32f7_i2c_disable_dma_req(i2c_dev);
>  			dmaengine_terminate_async(dma->chan_using);
> +			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +					 dma->dma_data_dir);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1642,6 +1644,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
>  				stm32f7_i2c_disable_dma_req(i2c_dev);
>  				dmaengine_terminate_async(dma->chan_using);
> +				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
> +						 dma->dma_data_dir);
>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 

Sounds good to me, however there might be an additional place to fix
within the function stm32f7_i2c_handle_isr_errs:
Could you also take care of the unmap in the error ITs handling ?

Regards,
Alain

> -- 
> 2.43.0
> 

