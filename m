Return-Path: <linux-i2c+bounces-4562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3691E886
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 21:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176D11F26049
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 19:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7EA16F836;
	Mon,  1 Jul 2024 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="jBCuKzMj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DB16F278;
	Mon,  1 Jul 2024 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861758; cv=none; b=oeVhG8ykbkUIiht/dkhib98ESFEWIUoKjKY9ApkmncUkWp/01ksIXOJ1nTO3Sa2HwnnyD/OkH0/rvkBOL4WBc/IiPE3Ba46EIARNd3MSdxRqexREz2KQK5iX9RQKet0CIrdvSQ5tf4I9kMmrmmqPOAi7PgIvksWEGbWRNKVe12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861758; c=relaxed/simple;
	bh=lWC6dIbWDly2CcGfLx/WDvuKm5OkyX/CfYLA1wFb040=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LXr2ydXvKv1ix+gD1NXlQR93Oecsd54OVuzj0BxsvN5Z9QAAiSTPCMX6qNcBmzYGkipQLChb7bvdF9a+OqOpzXRj4p2OUTe8rcPyh9pYgYeQmlpd4yFkOiIZGrHmcmXGpXihjCC6R1eG8E4RM1iGPKQ8lR5sWIl/9thGydhVpbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=jBCuKzMj; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.100.239] ([77.130.249.198])
	by smtp.orange.fr with ESMTPA
	id OMbXsqFR28cAtOMbXsjqTh; Mon, 01 Jul 2024 21:22:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719861746;
	bh=r5S9eLlZvmDguqOEMMdCQ+1RWefFjQZempUUq4HCebs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=jBCuKzMjJB52awDCiIwRFUHMTRGx/pTt9IV61JWjyr02O38gQeYHKUnrAdexOqYXl
	 oWvQECuIKVg2g71vQQGfB1DMNnGieZ6iD+/ZqaafEJlmznK2GQt8HT4h8/hyGL13r0
	 uEQSUe1uCcrpIPwKJOUp3xsWDxUubr/h+qSDutZUEmTYrP+NaG0oMoNzi+rAxecnAn
	 hVjYyK4v/IoIvI0wmwgHjM+MRCWtTP93J8a+FXg5hc+hRNVeumNawb6CTiNMcVO8yB
	 3bqKfeE1fVhgYlOcgMGpkTF2o1Mg67DRSlMFTh7XW26ZIfnbpkanQSECiyNujBg3Cy
	 8EWy7lPU/40gw==
X-ME-Helo: [192.168.100.239]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jul 2024 21:22:26 +0200
X-ME-IP: 77.130.249.198
Message-ID: <1fa0f2d9-b193-4fcd-9074-2b68f09ad39c@wanadoo.fr>
Date: Mon, 1 Jul 2024 21:22:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 6/6] media: qcom: camss: support for camss driver for
 sc7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Content-Language: en-MW
In-Reply-To: <20240629-camss_first_post_linux_next-v1-6-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 28/06/2024 à 20:32, Vikram Sharma a écrit :
> From: Suresh Vankadara <quic_svankada@quicinc.com>
> 
> This change adds support for camss driver for sc7280 soc.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

Hi,

...

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

Maybe, as said for other places by Bryan, keep it ordered (CAMSS_7280, 
then CAMSS_8250)?

> +		/* for titan 165, CSID registers are inside the VFE region,
> +		 * between the VFE "top" and "bus" registers. this requires
> +		 * VFE to be initialized before CSID
> +		 */
> +		csid->base = camss->vfe[id].base + VFE_165_CSID_OFFSET;
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
>   		ret = true;
>   		break;
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071f..757e872b8eb8 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -338,6 +338,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_7280:

Here as well.

>   		switch (sink_code) {
>   		case MEDIA_BUS_FMT_YUYV8_1X16:
>   		{
> @@ -1695,6 +1696,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_845:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_7280:

Here as well.

>   		ret = 16;
>   		break;
>   	default:

...

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

Should there be some error handling path here and below to free the 
allocated resources?

.link_entities seems to be new and I can't find it in my -next-20240627, 
so I can't check myself if already handle in a way or another by the 
framework.

CJ


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

...


