Return-Path: <linux-i2c+bounces-11699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78EAEDE8C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B28B4161E6D
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 13:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A36728BA92;
	Mon, 30 Jun 2025 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1vzjvOCI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF1428B7D7;
	Mon, 30 Jun 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288930; cv=none; b=XBaYFn/QS4dMDPh5C7JiiiSOrP8cc8ukHtnNE2erap1WT5nWDXmEhbIicxHb+W7YUmBc2uOLfpoFFccbf+0/p0RW1kKYTALyhYKw9TIAaRqv4OE0FLWlCRCjs5kn/v7FCRukZmExsOo5iflPd8f0FzgGOm7nXVisJQ+buI68uXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288930; c=relaxed/simple;
	bh=H6qZhB0qaRKaysFeIYJkiI8L75FerG+q8OJ2VJzSdCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d7ww+ZsLw53uT2TJrWvzZ8JVzTC63VTgiGmVHNcA2l+/M5KLUuNJHuUej+G5yt/zyK5aiXSCXzGveBQd2B7CExO9m/zo/JjcpZhuwB9H8cHawLf45CrHTL9MQqA0kQPIg49juprRu2MxsOf0LMh8fgnAqMS/Zn2dleqdhVuaxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1vzjvOCI; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAxWXM001329;
	Mon, 30 Jun 2025 15:08:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	nzcuf3ALxiZnugdRzIcsnWWDfy0C8Ttz0HVMvwBD/F8=; b=1vzjvOCIUogiQ6hQ
	NLYkokAyh7ZxRBSd0VrOeQTfxEuzxqoDgDzsOLksLlBcXxP0eHr2P5GML6mho29s
	p2ACWhsSgT7UDQKE3nnPv8jh1wlmyJWtMhl9HWRqSkjUZ+UaptO0RSFyurI4eZCa
	l1OEHVBpy6Xsfcsyz8O8S07M+2sDlAW8iwJmnLdH8m9a1kOo8zTsIfqP5JkILBt/
	q3HrQDvamN86Iyj8wnep7MpDtOyLDjTjqU00CetPKKGS07feG7y9tatFBU0lPLAq
	ZulowVvlk0Vt+ucnYgPE7LXtsYaPfxAZpigJ/mTJJA0CG6cM7TaHP6blDSnCTMww
	paklIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tm03v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:08:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CD1AE40044;
	Mon, 30 Jun 2025 15:07:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE232B4CA85;
	Mon, 30 Jun 2025 15:06:13 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:06:12 +0200
Message-ID: <b0ea55b6-32fe-43ca-b815-29888a3eba59@foss.st.com>
Date: Mon, 30 Jun 2025 15:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        "Alain
 Volmat" <alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "M'boumba Cedric
 Madianga" <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01

Hi Clement,

On 6/30/25 14:55, Clément Le Goffic wrote:
> If the DMA mapping failed, it produced an error log with the wrong
> device name:
> "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
> Fix this issue by replacing the dev with the I2C dev.
> 
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
> index 157c64e27d0b..272a5dffb08f 100644
> --- a/drivers/i2c/busses/i2c-stm32.c
> +++ b/drivers/i2c/busses/i2c-stm32.c
> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	dma->dma_len = len;
>  	chan_dev = dma->chan_using->device->dev;
>  
> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>  				      dma->dma_data_dir);
>  	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
>  		dev_err(dev, "DMA mapping failed\n");
> @@ -150,7 +150,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>  	return 0;
>  
>  err:
> -	dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
> +	dma_unmap_single(dev, dma->dma_buf, dma->dma_len,
>  			 dma->dma_data_dir);
>  	return ret;
>  }
> 

Thx for this V3 submission

Reviewed-by : Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

-- 
--
~ Py MORDRET
--

