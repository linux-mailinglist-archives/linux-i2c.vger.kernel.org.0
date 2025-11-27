Return-Path: <linux-i2c+bounces-14322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7DC8DAE1
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 11:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C92FC4E5AEB
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B572FC875;
	Thu, 27 Nov 2025 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vG9Ji7X2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C04C31283F
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764237898; cv=none; b=VkXD++PN5hfNJjzNVapydiTrh+RpjuZslkc1kd7iU7g2pHK2E7grHmnjvc5i0+7oiASINHeq5tucR9c0YZ/+wj/pgrfcgCdVZpFqBZ39AkN4iG6lbYTlIMaoktciaTvYPAMjT+eRyAts1w/yVeTHLiEJ9qr/J8uZ9GvXmml2560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764237898; c=relaxed/simple;
	bh=XODJE2VLARvigL3iTkt0OivHY7RlOh4DReeiwJwcX7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3iT6bm3jnWvbjQlAlOs0EE2WDyhVdBoj24Em/NKpSgEfsVMam6r1sIV6930hsPuJVIm3Zq+IWu9i0AEiQhiowjEAauxdJY2cKXwITeA6OU5syTZjU3PgdihKV/UaDighrXnbAsys6V5HaaVL7f4WOTlqeR0vFTQgDAaq2y+h1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vG9Ji7X2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso6208115e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764237895; x=1764842695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPPqxl22fit23EBxFKHqj8lMD8PGBVVRcoX2IXywbMs=;
        b=vG9Ji7X23ahB8ngImukjyFqsj12Hm/pPp2WvQwUn7up5zJA8s+AclRmcO/sg2zF4PO
         h+6y8zSp7TAsSRAs9JdBw8psgZqkrvyoYFT3msjH7XXe5XWvdZwyYLuAfcmTreJ9nzvg
         I4dcpVK1Tj6EJCl/oI44YhRyLV9oJjY9Hu3tabDX0s2NA2Wj42Js/rou4E/UF1eqA3N7
         FZL4RhjZNkzPohQIHFkkAf01HAhv8T37zGrcD9g4IwybzTIuPm+w4wrglDPBezvwkU8U
         XdVD2l27ghF55w//cAhyFi+954coTkU/5nSqEwkAemUAGmfvPwgV3nWxckHyVVgeXkxp
         G+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764237895; x=1764842695;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPPqxl22fit23EBxFKHqj8lMD8PGBVVRcoX2IXywbMs=;
        b=IXf7q5IXmd+F+mXlUck66cA0LMFofAXqhAzJYN+SUMz6lsNLtmT8Nji6tm6veks359
         y9qmTZoaBqniHIZ04VYCbYU1vKuOgiOQaFEVl+0e2eqzBaq5TqJ0G1fNAD/kAdLrng7V
         C8O8ihwBVp498PpdmXsT5swmlG+Bn47LCBltHcNfBrf42vvjCjrPpTYbUP8l+zya6wqv
         LkNyVI05AIyrfn5pPqOIyt6GQ0lXW26hTNwyWiTtXQ4eNPS+tWrbhq/FjcDOJEr++VjI
         T7rI9YuWnDCYXov/kSqzCdeuv/yjGRboG8fhhkWsP2a5Cj0eooGCGIZVg1i42oZFUl1/
         +2TQ==
X-Gm-Message-State: AOJu0YwqJpEpRKB/O8/HdKZIrDJd56ibc1to1nEPG/2b3vZ+moFDJbiQ
	zusfVe7kjLEIt/4ekL4+QZFYfdS4lcg6r8zjSbEmfrM9eiBWilDXr4Cm0O9z4s8r3uQ=
X-Gm-Gg: ASbGncvFWkVR3hdwr4uq41VFfLpJl1jQPZd2IwsUiS849xjFqhw3zblG0A/rX1rDajG
	y/z50QJvT8Qe/eV7kpdoD8vsQwSPYOfRSf9VRU4bN8wUtm7YG+ajShmzG2HKwAMTVTF6xfS1XPS
	pF0UTIARimK7NAQbpCw9C1FvwuQu9rANgqwmisnrsUNR66czkmf5My7GPKaHaewa1yUD5+hwNXw
	cYNi37ENRD7TLGjkam8IW9iLnuynMY8U8zeFvyVwgtqLMvOEihcIvLFzaUiXXTBhluai436ZtsU
	QAjL9NPagqe8vyR/P6NwA76JFSpKcz5KlPO6JB3r69TJa52aQKo1yxlMXfaanX58W8EOmEk1job
	2KjWdjGXpy5Oahyp/yYQQ3JB5C73+wqRMVtve4LhEDom4OZhEq9Y3v9vDPfeOnv1oNbPINiUvCt
	JBfKoVh0v4ACJ5lkF0/cGcxSGmToSeAsOyfUqFiDUASz8K6bYpfUiqeF4NgXetMq4=
X-Google-Smtp-Source: AGHT+IH4ewaDxUzJ1xlM4ZIIdVsfUx2bAjquiK+dUwKZ9gUQqntOFo22v390RuXTPYN/+cOIRKzmEg==
X-Received: by 2002:a05:600c:35d1:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-477c10d6e76mr250992815e9.8.1764237894687;
        Thu, 27 Nov 2025 02:04:54 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfae0sm61334555e9.8.2025.11.27.02.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:04:53 -0800 (PST)
Message-ID: <f0b1709f-c1cd-451e-85ac-ad8deb716d54@linaro.org>
Date: Thu, 27 Nov 2025 10:04:51 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: vfe: Add support for VFE gen4
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-6-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-6-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add support for Video Front End (VFE) that is on the SM8750 SoCs. The
> bus_wr configuration and the registers offsets closely match with the
> driver that had been added for Kaanapali. Hence, rename the previously
> added driver as 'gen4' and use that for both to avoid redundancy. Handle
> the minor differences in the driver using the chipset version.

Specify you are renaming a file and dropping the 1080 postfix in its 
naming convention.

> 
> This change limits SM8750 VFE output lines to 3 for now as constrained
> by the CAMSS driver framework.

What does that mean ?

> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile         |   4 +-
>   .../camss/{camss-vfe-1080.c => camss-vfe-gen4.c}   |  60 +++++----
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +-
>   drivers/media/platform/qcom/camss/camss.c          | 150 ++++++++++++++++++++-
>   5 files changed, 182 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 74e12ec65427..6e54d2d11ed3 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -23,9 +23,9 @@ qcom-camss-objs += \
>   		camss-vfe-340.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> -		camss-vfe-1080.o \
> -		camss-vfe-gen3.o \
>   		camss-vfe-gen1.o \
> +		camss-vfe-gen3.o \
> +		camss-vfe-gen4.o \
>   		camss-vfe-vbif.o \
>   		camss-vfe.o \
>   		camss-video.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> similarity index 75%
> rename from drivers/media/platform/qcom/camss/camss-vfe-1080.c
> rename to drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> index 9ad3dee2e80b..d0218950c05c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-1080.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> @@ -1,8 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * camss-vfe-1080.c
> + * camss-vfe-gen4.c
>    *
> - * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen4
>    *
>    * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
> @@ -13,8 +13,12 @@
>   #include "camss.h"
>   #include "camss-vfe.h"
>   
> -/* VFE-1080 Bus Register Base Addresses */
> -#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
> +#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
> +
> +#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
> +#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
> +#define BUS_REG_BASE \
> +	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
>   
>   #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
>   #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
> @@ -55,7 +59,7 @@
>    * DISPLAY_DS2_C		6
>    * FD_Y				7
>    * FD_C				8
> - * PIXEL_RAW			9
> + * RAW_OUT(1080)/IR_OUT(980)	9
>    * STATS_AEC_BG			10
>    * STATS_AEC_BHIST		11
>    * STATS_TINTLESS_BG		12
> @@ -86,7 +90,7 @@
>    */
>   #define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
>   
> -static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   {
>   	struct v4l2_pix_format_mplane *pix =
>   		&line->video_out.active_fmt.fmt.pix_mp;
> @@ -121,14 +125,14 @@ static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *li
>   	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
>   }
>   
> -static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>   {
>   	wm = RDI_WM(wm);
>   	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
>   }
>   
> -static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
> -			       struct vfe_line *line)
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> +			  struct vfe_line *line)
>   {
>   	wm = RDI_WM(wm);
>   	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> @@ -136,62 +140,62 @@ static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
>   	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
>   }
>   
> -static void vfe_reg_update_1080(struct vfe_device *vfe, enum vfe_line_id line_id)
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>   {
>   	int port_id = line_id;
>   
>   	camss_reg_update(vfe->camss, vfe->id, port_id, false);
>   }
>   
> -static inline void vfe_reg_update_clear_1080(struct vfe_device *vfe,
> -					     enum vfe_line_id line_id)
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
>   {
>   	int port_id = line_id;
>   
>   	camss_reg_update(vfe->camss, vfe->id, port_id, true);
>   }
>   
> -static const struct camss_video_ops vfe_video_ops_1080 = {
> +static const struct camss_video_ops vfe_video_ops = {
>   	.queue_buffer = vfe_queue_buffer_v2,
>   	.flush_buffers = vfe_flush_buffers,
>   };
>   
> -static void vfe_subdev_init_1080(struct device *dev, struct vfe_device *vfe)
> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>   {
> -	vfe->video_ops = vfe_video_ops_1080;
> +	vfe->video_ops = vfe_video_ops;
>   }
>   
> -static void vfe_global_reset_1080(struct vfe_device *vfe)
> +static void vfe_global_reset(struct vfe_device *vfe)
>   {
>   	vfe_isr_reset_ack(vfe);
>   }
>   
> -static irqreturn_t vfe_isr_1080(int irq, void *dev)
> +static irqreturn_t vfe_isr(int irq, void *dev)
>   {
>   	/* nop */
>   	return IRQ_HANDLED;
>   }
>   
> -static int vfe_halt_1080(struct vfe_device *vfe)
> +static int vfe_halt(struct vfe_device *vfe)
>   {
>   	/* rely on vfe_disable_output() to stop the VFE */
>   	return 0;
>   }
>   
> -const struct vfe_hw_ops vfe_ops_1080 = {
> -	.global_reset = vfe_global_reset_1080,
> +const struct vfe_hw_ops vfe_ops_gen4 = {
> +	.global_reset = vfe_global_reset,
>   	.hw_version = vfe_hw_version,
> -	.isr = vfe_isr_1080,
> +	.isr = vfe_isr,
>   	.pm_domain_off = vfe_pm_domain_off,
>   	.pm_domain_on = vfe_pm_domain_on,
> -	.reg_update = vfe_reg_update_1080,
> -	.reg_update_clear = vfe_reg_update_clear_1080,
> -	.subdev_init = vfe_subdev_init_1080,
> +	.reg_update = vfe_reg_update,
> +	.reg_update_clear = vfe_reg_update_clear,
> +	.subdev_init = vfe_subdev_init,
>   	.vfe_disable = vfe_disable,
>   	.vfe_enable = vfe_enable_v2,
> -	.vfe_halt = vfe_halt_1080,
> -	.vfe_wm_start = vfe_wm_start_1080,
> -	.vfe_wm_stop = vfe_wm_stop_1080,
> +	.vfe_halt = vfe_halt,
> +	.vfe_wm_start = vfe_wm_start,
> +	.vfe_wm_stop = vfe_wm_stop,
>   	.vfe_buf_done = vfe_buf_done,
> -	.vfe_wm_update = vfe_wm_update_1080,
> +	.vfe_wm_update = vfe_wm_update,
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 399be8b70fed..b8aa4b7d1a8d 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -350,6 +350,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8650:
> +	case CAMSS_8750:
>   	case CAMSS_8775P:
>   	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
> @@ -2012,6 +2013,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8650:
> +	case CAMSS_8750:
>   	case CAMSS_8775P:
>   	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 118cac5daf37..c402ef170c81 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -249,8 +249,8 @@ extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_340;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
> -extern const struct vfe_hw_ops vfe_ops_1080;
>   extern const struct vfe_hw_ops vfe_ops_gen3;
> +extern const struct vfe_hw_ops vfe_ops_gen4;
>   
>   int vfe_get(struct vfe_device *vfe);
>   void vfe_put(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9dea343c1ac5..48d8f282d780 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -245,7 +245,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>   			.reg_update_after_csid_config = true,
>   			.has_pd = true,
>   			.pd_name = "vfe0",
> -			.hw_ops = &vfe_ops_1080,
> +			.hw_ops = &vfe_ops_gen4,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -274,7 +274,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>   			.reg_update_after_csid_config = true,
>   			.has_pd = true,
>   			.pd_name = "vfe1",
> -			.hw_ops = &vfe_ops_1080,
> +			.hw_ops = &vfe_ops_gen4,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -303,7 +303,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>   			.reg_update_after_csid_config = true,
>   			.has_pd = true,
>   			.pd_name = "vfe2",
> -			.hw_ops = &vfe_ops_1080,
> +			.hw_ops = &vfe_ops_gen4,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -327,7 +327,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>   			.line_num = 4,
>   			.is_lite = true,
>   			.reg_update_after_csid_config = true,
> -			.hw_ops = &vfe_ops_1080,
> +			.hw_ops = &vfe_ops_gen4,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -351,7 +351,7 @@ static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>   			.line_num = 4,
>   			.is_lite = true,
>   			.reg_update_after_csid_config = true,
> -			.hw_ops = &vfe_ops_1080,
> +			.hw_ops = &vfe_ops_gen4,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -4053,6 +4053,144 @@ static const struct camss_subdev_resources csid_res_8750[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources vfe_res_8750[] = {
> +	/* VFE0 - TFE Full */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe0_fast_ahb", "vfe0",
> +			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.reg_update_after_csid_config = true,
> +			.has_pd = true,
> +			.pd_name = "vfe0",
> +			.hw_ops = &vfe_ops_gen4,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 - TFE Full */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe1_fast_ahb", "vfe1",
> +			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.reg_update_after_csid_config = true,
> +			.has_pd = true,
> +			.pd_name = "vfe1",
> +			.hw_ops = &vfe_ops_gen4,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 - TFE Full */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe2_fast_ahb", "vfe2",
> +			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
> +			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 360280000, 480000000, 630000000, 716000000,
> +				  833000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.is_lite = false,
> +			.reg_update_after_csid_config = true,
> +			.has_pd = true,
> +			.pd_name = "vfe2",
> +			.hw_ops = &vfe_ops_gen4,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
> +			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.reg_update_after_csid_config = true,
> +			.hw_ops = &vfe_ops_gen4,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
> +			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
> +			   "camnoc_nrt_axi", "qdss_debug_xo" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 266666667, 400000000, 480000000 },
> +				{ 0 },
> +				{ 200000000, 300000000, 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = true,
> +			.reg_update_after_csid_config = true,
> +			.hw_ops = &vfe_ops_gen4,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	}
> +};
> +
>   static const struct resources_icc icc_res_sm8750[] = {
>   	{
>   		.name = "ahb",
> @@ -5485,9 +5623,11 @@ static const struct camss_resources sm8750_resources = {
>   	.pd_name = "top",
>   	.csiphy_res = csiphy_res_8750,
>   	.csid_res = csid_res_8750,
> +	.vfe_res = vfe_res_8750,
>   	.icc_res = icc_res_sm8750,
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
>   	.csid_num = ARRAY_SIZE(csid_res_8750),
> +	.vfe_num = ARRAY_SIZE(vfe_res_8750),
>   	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>   };
>   
> 

Once done.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

