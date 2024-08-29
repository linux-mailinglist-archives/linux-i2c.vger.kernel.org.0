Return-Path: <linux-i2c+bounces-5917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E89640E2
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A9271F2299C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6051218DF9F;
	Thu, 29 Aug 2024 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGsC3Ayc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BAA18D640
	for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925930; cv=none; b=S8fySYm5qJlont5wS7QRjn5KMg2BAb0thj+k81A9/I0TcC7vKZWxnhbD60GNkndYZ5aeAqArJ5kNshYJRboy8WRKLlq+lQ55nzFvbkitHts4TWFHDs+ved69zpl5dYryha2hMzjxQDRqxhiREaGjYkjOTheHqaTmUk9oGBE1DMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925930; c=relaxed/simple;
	bh=Ll1+M8kjnAXBCB6IW45yQ7ozY7I48GpvsA0aFZU7zHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3ihhs5F5fOi6fxTGeasInUFdGlDjolxLA2xU2f3G1cE+L7QNrzQ41/2G+pJv2EVjo3k07TEE4j8UYPQfRVkyPIGzIdgXVD76MonkxLtTAgeyxC+MKkkKQ5asUoodCb9NimWU5PMQbrfvVLGYJ7zUlkacHm8J+C1PcCY/CFSuJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGsC3Ayc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c0aa376e15so237700a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925926; x=1725530726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xM8rYU3tE2lpxGZJEIS21zgA8p56lenKtVo6rnRCh0E=;
        b=sGsC3AycMYBqLfJKgZCQRJvagKj5Q5g2+AF6TNHIV1GTlX4D8N3A5cKom2Xdp+QA9H
         4YOPXtX6tP0aXkLypSlDMoOlBFlZsfrTiAdarApzkuoG+dOw1bJpB02+NclthS8DB5oM
         9DH2cJ3FbCJ+NP2ZrjJpm6L6DOl/V9gvbXWjp6TVHtyXduvJIL4aVJl9LTwJBEAVUnxz
         8AUEy14NiN98vcFgTN9vp8DbakCA08Kx53T8qbBNWwy6CgskJoWM9C9BI+LSN7fj9suP
         PJEaSo+suY5AezIZwQFXnS7y4HL7i15/JXQjnwJzIPZT72r97w4GGoFaS2zoBycRJMVZ
         32ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925926; x=1725530726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xM8rYU3tE2lpxGZJEIS21zgA8p56lenKtVo6rnRCh0E=;
        b=hjKoRGuldMRJrycZr3mHaNTYzJxFRz3oqZwUEF2L7SwcSyI2kK9HsLCfvCvu+E2cqa
         IJu9uJqeR6rHxh15QayoQb8DHQVkG9o/hIwIsGnWtn/mK+ObAzQxqvX9PnVwaXqD1YPD
         HQgaJvfAe17EjnRKWg07/Q6DdlC54+7d3LsbSFThIDj7kSW/CqL3PD6nDibi1hZwI1zu
         QpLEfzCM4VQh7mENKuCwH0VwVxat8ROQfdCGXJj1upb5d0uHUiZJqGeT7lTp9cfo/Szb
         GXuS3jqobQ7ZgZ007+RE/7Qy1nevIl2PbJWXL5JYBd1Wi/W8YbfF5wGcDV9SFKKPzjDH
         QpNA==
X-Forwarded-Encrypted: i=1; AJvYcCV9eFNKPALqCpVPW5lJmRZvc9K7c8iTP29ZrtB3YpXSpYwsS086QKybIOS+TngMKeFK6QBcrcKB9Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQPPpL4ekD2QDmVc8jme1Yf2tWFrl22Nluzw6YO9wBPPrijU1
	fbffoJLPz4UO6mVJTvqegO2kA4hpV5OZa+6Y49w2kozq1hyrdKYyt1g3Blq1gME=
X-Google-Smtp-Source: AGHT+IGSUfZpTd7tILZlx/OBRQ7plqFZwr9j3Mrz/+Gjk3UT0oEI7amwjzPMo6e1G8TGbzJkBYchKg==
X-Received: by 2002:a05:6402:2353:b0:5c0:8f7c:ad9e with SMTP id 4fb4d7f45d1cf-5c21ed3e3e3mr2579605a12.15.1724925926410;
        Thu, 29 Aug 2024 03:05:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7cfdasm519947a12.58.2024.08.29.03.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:05:26 -0700 (PDT)
Message-ID: <0712caf4-568f-4c7c-b319-ccdbba37142a@linaro.org>
Date: Thu, 29 Aug 2024 11:05:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] dma: gpi: Add Lock and Unlock TRE support to
 access SE exclusively
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-3-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> GSI DMA provides specific TREs namely Lock and Unlock TRE, which
> provides mutual exclusive access to SE from any of the subsystem
> (E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
> concurrently performing DMA transfers and avoids disturbance to
> data path. Basically lock the SE for particular subsystem, complete
> the transfer, unlock the SE.
> 
> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
> TRE for the last transfer.
> 
> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
>   include/linux/dma/qcom-gpi-dma.h |  6 ++++++
>   2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index e6ebd688d746..ba11b2641ab6 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>    * Copyright (c) 2020, Linaro Limited
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <dt-bindings/dma/qcom-gpi.h>
> @@ -65,6 +66,14 @@
>   /* DMA TRE */
>   #define TRE_DMA_LEN		GENMASK(23, 0)
>   
> +/* Lock TRE */
> +#define TRE_I2C_LOCK		BIT(0)
> +#define TRE_MINOR_TYPE		GENMASK(19, 16)
> +#define TRE_MAJOR_TYPE		GENMASK(23, 20)
> +
> +/* Unlock TRE */
> +#define TRE_I2C_UNLOCK		BIT(8)
> +
>   /* Register offsets from gpi-top */
>   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
>   #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
> @@ -516,7 +525,7 @@ struct gpii {
>   	bool ieob_set;
>   };
>   
> -#define MAX_TRE 3
> +#define MAX_TRE 5
>   
>   struct gpi_desc {
>   	struct virt_dma_desc vd;
> @@ -1637,6 +1646,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   	struct gpi_tre *tre;
>   	unsigned int i;
>   
> +	/* create lock tre for first tranfser */
> +	if (i2c->shared_se && i2c->first_msg) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
> +		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
> +	}
> +
>   	/* first create config tre if applicable */
>   	if (i2c->set_config) {
>   		tre = &desc->tre[tre_idx];
> @@ -1695,6 +1717,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
>   	}
>   
> +	/* Unlock tre for last transfer */
> +	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
> +		tre = &desc->tre[tre_idx];
> +		tre_idx++;
> +
> +		tre->dword[0] = 0;
> +		tre->dword[1] = 0;
> +		tre->dword[2] = 0;
> +		tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
> +		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
> +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
> +	}
> +

What happens if the first transfer succeeds => bus lock but the last 
transfer fails => !unlock ?

Is the SE left in a locked state ?

---
bod

