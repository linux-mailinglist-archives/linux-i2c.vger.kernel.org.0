Return-Path: <linux-i2c+bounces-11701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92EAEDEAC
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EB124029B4
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 13:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505F328A402;
	Mon, 30 Jun 2025 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="pBg5XVT8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9DA28B7D4;
	Mon, 30 Jun 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289001; cv=none; b=qDqhQ7sUQHXyxKGxJY667Nc0opZKsArXhFLvlnuEOfd+ih/REY+5XHxXg/S32kdxez1AbnSFRZcKyMK3TQmWLsS0MMfGsAnUxlT0Kzj60QkEntmcSU1AYSWfzIGyleTVohgMzSKrXMEnM4kpF5VaMacpf+ceZgyNpBOK64TD0f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289001; c=relaxed/simple;
	bh=HyPlXMrc9xrAdA7GVaJ7JofLJq3ayXCcPOeFElNxizs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y38W7StLJumZ0kMuhJZ0MrJMVZYDpFgcVOH91cjfhLtNwbaPqIu9y7GMRLBdHaYdgVhVn9RCfBblt34ySxs8WVU1qo/Br9UwTgZu3TeV4PJLUrqIaiNZ+AdL73NJdvLc5Qx3OxJ7yO/Jg5q+AApMGSvs6dLygIP5O76mG3ydk28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=pBg5XVT8; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UBlus3021366;
	Mon, 30 Jun 2025 15:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	s6SnTj7TQmM6IV7OH8vHiU8wCQ741Ir076aqyio17M0=; b=pBg5XVT8Yg+YHR19
	hSMKT4IhjJyppJ/mHjK699QA1oMWSFbCESVoG39WjiLB4ou3GCGBkQ0ICIUT33BH
	BDDNh622ioVsXNwqrH+no+HJDTdyoHoMxVDSQ+PUcyYg66tIkzTLpP4yjoB8kcwX
	MWjj+SATjcY0SCtMAqZAsMHRJG5mSlW5G302JRVljZ5EkPfyEWcSJXlk9XeYYni2
	9U62A0DtoY9YYSKILLetlmYf7g4uD2d2Rad9VzI1FsxmwVb6LTW/dS+eCESicZ+d
	F0xix/SV8A5wQ5+Uu5WHBYhLYRNVJFZW1KljFhcCxVJZXaPUZ/QJcr0kvzqUAx+B
	dYiAhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r5yt8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:09:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DBE5A4004B;
	Mon, 30 Jun 2025 15:08:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48160B4CBCE;
	Mon, 30 Jun 2025 15:07:22 +0200 (CEST)
Received: from [10.252.14.13] (10.252.14.13) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 15:07:21 +0200
Message-ID: <74981e35-1d0f-4649-bb10-2b54e4db5e47@foss.st.com>
Date: Mon, 30 Jun 2025 15:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
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
 <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <20250630-i2c-upstream-v3-3-7a23ab26683a@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01

Hi Clement,

On 6/30/25 14:55, Clément Le Goffic wrote:
> Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 36 +++++++++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 042386b4cabe..d06f0efdece3 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -742,9 +742,12 @@ static void stm32f7_i2c_dma_callback(void *arg)
>  	struct stm32f7_i2c_dev *i2c_dev = (struct stm32f7_i2c_dev *)arg;
>  	struct stm32_i2c_dma *dma = i2c_dev->dma;
>  	struct device *dev = dma->chan_using->device->dev;
> +	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
>  
>  	stm32f7_i2c_disable_dma_req(i2c_dev);
>  	dma_unmap_single(dev, dma->dma_buf, dma->dma_len, dma->dma_data_dir);
> +	if (!f7_msg->smbus)
> +		i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, true);
>  	complete(&dma->dma_complete);
>  }
>  
> @@ -880,6 +883,7 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  {
>  	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
>  	void __iomem *base = i2c_dev->base;
> +	u8 *dma_buf;
>  	u32 cr1, cr2;
>  	int ret;
>  
> @@ -929,17 +933,23 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  
>  	/* Configure DMA or enable RX/TX interrupt */
>  	i2c_dev->use_dma = false;
> -	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN
> -	    && !i2c_dev->atomic) {
> -		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> -					      msg->flags & I2C_M_RD,
> -					      f7_msg->count, f7_msg->buf,
> -					      stm32f7_i2c_dma_callback,
> -					      i2c_dev);
> -		if (!ret)
> -			i2c_dev->use_dma = true;
> -		else
> -			dev_warn(i2c_dev->dev, "can't use DMA\n");
> +	if (i2c_dev->dma && !i2c_dev->atomic) {
> +		dma_buf = i2c_get_dma_safe_msg_buf(msg, STM32F7_I2C_DMA_LEN_MIN);
> +		if (dma_buf) {
> +			f7_msg->buf = dma_buf;
> +			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> +						      msg->flags & I2C_M_RD,
> +						      f7_msg->count, f7_msg->buf,
> +						      stm32f7_i2c_dma_callback,
> +						      i2c_dev);
> +			if (ret) {
> +				dev_warn(i2c_dev->dev, "can't use DMA\n");
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, msg, false);
> +				f7_msg->buf = msg->buf;
> +			} else {
> +				i2c_dev->use_dma = true;
> +			}
> +		}
>  	}
>  
>  	if (!i2c_dev->use_dma) {
> @@ -1626,6 +1636,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  			dmaengine_terminate_async(dma->chan_using);
>  			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  					 dma->dma_data_dir);
> +			if (!f7_msg->smbus)
> +				i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  		}
>  		f7_msg->result = -ENXIO;
>  	}
> @@ -1648,6 +1660,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
>  				dmaengine_terminate_async(dma->chan_using);
>  				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
>  						 dma->dma_data_dir);
> +				if (!f7_msg->smbus)
> +					i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
>  				f7_msg->result = -ETIMEDOUT;
>  			}
>  		}
> 

Thx for this V3 submission

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

-- 
--
~ Py MORDRET
--

