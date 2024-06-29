Return-Path: <linux-i2c+bounces-4500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CC91CC91
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 13:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E61CB21733
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 11:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB8455C3A;
	Sat, 29 Jun 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESJ+/MGR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825140BE3
	for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719661536; cv=none; b=WHI+26zdOTikgUu+whL7WZT+3rEu35xAY22v5jN5Lfvt9MnAHyzL9R08Lv354++3ZqGjCRJTBMy8cXTeVRkiRsRqFn5MBXyKPT9DX6eScrV+g+fL1yT8JgfQjWYrm7NR1D3LZHaGo/awqju0HUCl1ZGWHIWjc9wtAnGolqNZ7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719661536; c=relaxed/simple;
	bh=3Xq8rnisQSLAmTqc6RjNg11/JhKzQxz/KsieujBr3Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hm10nSlHBqr2PFFq0m+4/pBvV+3UsT7/qujhdGsKF4/KeipxJdHYdB+fULZPHWt+LaYNZZJvVv8VuieHotc6Qak8x7yhuEqFvcbBQxOhXuNBp19/PdUKXvpVZGmiHX1AsfkPAcR2CCvJ0jOLUayy/sZ13iITvhabLaToFl9+83s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ESJ+/MGR; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so16320811fa.3
        for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719661531; x=1720266331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmaPGNyCork/mWTeQ6+u76IxjDJ/bM1kJIRFnNiILwc=;
        b=ESJ+/MGRTn+8LAVqZBZN62RYAVSzQ/j01sLWavIJsrfs1dqJDVMoPKAyvFdx9nvyfh
         myB0SBOQZ0//hz97baLmfwcuFVhdt+1po7W2Uq509M7DNKr3Ubw7EsEXKVxGiW9XucO8
         ovlcaJzNOEMzmhV30Xv6qdho8CPIS20saGlfQ1HYn3ZYVn+Ht3yt6I6nx4lEo6gPz13H
         ppCKPv7vXXBsvRP2Tu+BtXot0lSXLVMX8k50KJ5dy4860NVAkOBtUhqIB8/xfo+Ci6LU
         dQloVVBIx7vG6b5KnEMOau3FYiri2cgRRz0OXop3kAJr7lmaBeri3DidSDMgErEWgRj1
         vxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719661531; x=1720266331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmaPGNyCork/mWTeQ6+u76IxjDJ/bM1kJIRFnNiILwc=;
        b=TvhNBRAx1mjC7io0qtVizIJyT+15BCThXkIpD6m/2/QcUB38TaNf9XptDV9mc/YwuM
         XCisvnCRgM+QL4e7Bdc1cLlrqzFiDFO9IU2KM1MB/HfbxICAYomWb23EWyz6jmD0Q/QC
         sqJk4n/j27585BrBY6+9TIeLvmMA4PxUv+DXk3SMNI1EzKa2RR6F5G9OFmV+cBHooS7w
         HCjwBhibINM8/iq2YUdVLdTH5sKubqK/VJrUSYGwLHhc52ohb7zua78H8iN3Fl/UbhEu
         Gvr817onpI1ouVTPQJskOAuVKWcPJxW7OpNBECLgx8Eb4Q42tQR0Q6QPBVa/AhHdKopx
         fVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf6UNHgqiyTDbrK6C9RyHgP5qctMQYGa7MkdjiACI0XXX4P/RPubNIRF2Y0g2x8A2q5gkRx09uOtuut0K09h6KGDPsrqEWxj8c
X-Gm-Message-State: AOJu0Yyt3D5UYVZLBX3JW0Th41NtBWTMNo635dVXYwuoSPN4Ql18DJPr
	1ndFw+SvOGTTgeAj911op+qHuwgRjHLqYi2+3Wxrlne5vUXmD7FI6uatpftDa1HlKcNZir6WA0+
	i0cU=
X-Google-Smtp-Source: AGHT+IGGger/2MsLHZnNXAVj+qv69Uo7scLG+8Z6rIiwnVpAVLUZb+tl9kiZlXH014sVX2Njl1D2Rw==
X-Received: by 2002:a05:6512:4010:b0:52e:7e77:275a with SMTP id 2adb3069b0e04-52e8268d15emr663898e87.36.1719661530939;
        Sat, 29 Jun 2024 04:45:30 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c0fbesm69660185e9.43.2024.06.29.04.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:45:30 -0700 (PDT)
Message-ID: <bb2eb6ea-a209-4986-8415-ce14904dbda1@linaro.org>
Date: Sat, 29 Jun 2024 12:45:28 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: qcom: camss: support for camss driver for
 sc7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-6-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-6-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 19:32, Vikram Sharma wrote:
> From: Suresh Vankadara <quic_svankada@quicinc.com>
> 
> This change adds support for camss driver for sc7280 soc.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c     |  16 +-
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 340 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   2 +
>   5 files changed, 359 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 858db5d4ca75..2c622233da6f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -28,6 +28,7 @@
>   /* offset of CSID registers in VFE region for VFE 480 */
>   #define VFE_480_CSID_OFFSET 0x1200
>   #define VFE_480_LITE_CSID_OFFSET 0x200
> +#define VFE_165_CSID_OFFSET 0x4000
>   
>   #define MSM_CSID_NAME "msm_csid"
>   
> @@ -1028,8 +1029,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   	csid->res->hw_ops->subdev_init(csid);
>   
>   	/* Memory */
> -
> -	if (camss->res->version == CAMSS_8250) {
> +	switch (camss->res->version) {
> +	case CAMSS_8250:
>   		/* for titan 480, CSID registers are inside the VFE region,
>   		 * between the VFE "top" and "bus" registers. this requires
>   		 * VFE to be initialized before CSID
> @@ -1040,10 +1041,19 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   		else
>   			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
>   				 + VFE_480_CSID_OFFSET;
> -	} else {
> +		break;
> +	case CAMSS_7280:
> +		/* for titan 165, CSID registers are inside the VFE region,
> +		 * between the VFE "top" and "bus" registers. this requires
> +		 * VFE to be initialized before CSID
> +		 */
> +		csid->base = camss->vfe[id].base + VFE_165_CSID_OFFSET;


Right but you can just define "csid" registers in your yaml and dts per 
standard definitions.

Looking at what we did for 8250 here there's absolutely no good reason 
to have C code derive offsets like this which can be described in dts.

I'll send a patch to that effect - along with named power-domains for 8250.

Please just define your CSID registers in the yaml/dts - there's no need 
to add executable code to the driver to find an offset.

> +		break;
> +	default:
>   		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
>   		if (IS_ERR(csid->base))
>   			return PTR_ERR(csid->base);
> +		break;
>   	}
>   
>   	/* Interrupt */
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index df7e93a5a4f6..c7e507420732 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -510,6 +510,7 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
>   		break;
>   	case CAMSS_8250:
> +	case CAMSS_7280:
>   		r = &lane_regs_sm8250[0][0];
>   		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
>   		break;
> @@ -560,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_7280:

Sort alphanumerically please.


> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csiphy0", "csiphy0_timer", "csiphy0_timer_src"},
> +		.clock_rate = { { 300000000 },
> +				{ 300000000 },
> +				{ 300000000 }},

I'll reiterate, I don't believe the _src clocks are required.


> +
> +static const struct resources_icc icc_res_sc7280[] = {
> +	{
> +		.name = "cam_ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "cam_hf_0",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};

Good to see this.

> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -1824,6 +2099,57 @@ static int camss_init_subdevices(struct camss *camss)
>   	return 0;
>   }
>   
> +/*
> + * camss_link_entities_v2 - Register subdev nodes and create links
> + * @camss: CAMSS device
> + *
> + * Return 0 on success or a negative error code on failure
> + */
> +static int camss_link_entities_v2(struct camss *camss)
> +{
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0; i < camss->res->csiphy_num; i++) {
> +		for (j = 0; j < camss->res->csid_num; j++) {
> +			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
> +						    MSM_CSIPHY_PAD_SRC,
> +						    &camss->csid[j].subdev.entity,
> +						    MSM_CSID_PAD_SINK,
> +						    0);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to link %s->%s entities: %d\n",
> +					camss->csiphy[i].subdev.entity.name,
> +					camss->csid[j].subdev.entity.name,
> +					ret);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	for (i = 0; i < camss->res->csid_num; i++)
> +		for (j = 0; j < camss->vfe[i].res->line_num; j++) {
> +			struct v4l2_subdev *csid = &camss->csid[i].subdev;
> +			struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
> +
> +			ret = media_create_pad_link(&csid->entity,
> +						    MSM_CSID_PAD_FIRST_SRC + j,
> +						    &vfe->entity,
> +						    MSM_VFE_PAD_SINK,
> +						    0);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to link %s->%s entities: %d\n",
> +					csid->entity.name,
> +					vfe->entity.name,
> +					ret);
> +				return ret;
> +			}
> +		}
> +	return 0;
> +}

So I see what you're doing here and agree but, I think it should be made 
into its own standalone patch.

We can break up the link_entities function into something for ispif the 
v1 and something for everybody else @ v2, not just 7280.

Either way such a change deserves its own standalone patch.

> +
>   /*
>    * camss_link_entities - Register subdev nodes and create links
>    * @camss: CAMSS device
> @@ -2440,12 +2766,26 @@ static const struct camss_resources sc8280xp_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sc7280_resources = {
> +	.version = CAMSS_7280,
> +	.csiphy_res = csiphy_res_7280,
> +	.csid_res = csid_res_7280,
> +	.vfe_res = vfe_res_7280,
> +	.icc_res = icc_res_sc7280,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sc7280),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
> +	.csid_num = ARRAY_SIZE(csid_res_7280),
> +	.vfe_num = 3,
> +	.link_entities = camss_link_entities_v2
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
> +	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },

Its just occured to me, this list ought to be sorted alpanumerically too.

I'd be obliged if you could add a patch to this series to sort this list 
prior to adding in your new string - in the appropriate order.

>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 73c47c07fc30..29dbf93ce9c5 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -79,11 +79,13 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_7280,
>   };
>   
>   enum icc_count {
>   	ICC_DEFAULT_COUNT = 0,
>   	ICC_SM8250_COUNT = 4,
> +	ICC_SM7280_COUNT = 4,
>   };

Do you even use the SM7280 specific enum ? I didn't see it, SoC name is 
SC7280 anyway.

I think you can drop that.

---
bod

