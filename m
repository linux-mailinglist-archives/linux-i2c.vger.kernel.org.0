Return-Path: <linux-i2c+bounces-13546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A377CBE059C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 21:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27A9A34B2DF
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 19:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDA8304BD6;
	Wed, 15 Oct 2025 19:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwJGf+Ul"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88BE302CDE
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556178; cv=none; b=iprbogjdoLL6LSa+dwMJFVDxCfY5NKQDEKdGSDmHKjBJyM+tQ8xazZPyuWBy5vchMsmRKgE5vWSp2ynp5BQwD9Oo1EnBw8ygYv3XEUDfka+beWWVMLQfOdqCYUrDxEgse9pKuJC77RUqGCMOtdx5vO7Yt2rPqAojOEZvw6n/8p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556178; c=relaxed/simple;
	bh=6FJ/R1ITDsF+bIAIpfjW01XbZyF5cdVhQGhS9FNGWBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKvErZHMeYoH1h7aFid+I+MtaSJUzB3mEmd2xNlCQqES+nnKq6vHApvWe44f6aCdWBj64+A2OK+2Y/5MOid097mu+H17tZU8AxO4YPdiLvppGs8N0dqQYur6NPj1634sNoHnIYD3WvcROBpjlv1asW7N9DyaIaAd+UJrJIpMwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwJGf+Ul; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-58d8c50080cso1004708e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556175; x=1761160975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2uKCDGSkRJ1nI5Vl4WxpkpeLM82j5VPKiPiLY2XZbg=;
        b=UwJGf+UlWJ7t8hswzGU8YK+rxrOuzqHONzuZvAEiwpkAROzMHTpLkkQNhV7o/LEmva
         jZoNgA+b1QlTvQITTDVjuuuvZKbv1rFcfWcvt1WYbn0PpXPmG3xiWtyEFuphXwHCzzge
         0iFKQmd07AWa18Jc8VcjsBEbzoaZZj2pFVCE026X7r89Vik8YAKk0Jgg23aOl0rpd5PN
         rBpBs2+RJCTSiDv1nqCc/36aDGgX8n8tgQCOs9I5xO8Cm8R6XiYcLThitzFuraUTG/qb
         HUsq+QSuVAvrmIhMl8jxjfRBxrTAP7sepgYisGScurVa6EI6ShCZbU9mRnHUcSLc5p27
         aAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556175; x=1761160975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2uKCDGSkRJ1nI5Vl4WxpkpeLM82j5VPKiPiLY2XZbg=;
        b=C7+CWe/f4/EwDI5zlMFDBkhp1VunkXDnHmH4rcVhvaB/LmjWbPkXxP05R90tK/DOFq
         YUvecApRGR+9XtAkmgi6YzNK43oN7SBBYTvfdauwuSp0GMsXduh+b87JuYRs+H71MkKK
         RhQg1oz21T+QZ7SS003PwVTbxCziae7xgy/piUEVdyLHZe994zFMP8W0WmcHUGWlHBvE
         eNY6g/PHUDtPNr2/K3NOQeeQON3gXSRrr5MKWHquUP6Al5N1qRExGAkhzIBVVnvevb8a
         PB0gglAOSn4ruhY+NPHAn+KKozqufBb0LcTku5bJNwVA5KITPgRTG10dthRzkj9ddfVK
         Y72A==
X-Gm-Message-State: AOJu0YwjJFKwp/N3KqMWUTIZQY7E0uf7wPtnXDyOx7AjHzS6ET5Lj2FS
	7vbEEz1ojv5iV/KrbJ1/8KV5k/i0PARMdlG4hYSMQz90zRByBGhHsbtAMOpk6YRwlMI=
X-Gm-Gg: ASbGnctEHh77W+2xHoJZlB31zAz/QE0GiH5H+l+dS80g+kfYp6siQOfKM8x5TJYn2qs
	DHNcLauF6J8/fhYv37fd5lr33/hVBOXV0rH4v69YDtS0Oxvpd6KL95h9p3RNifj6/B+6sMr70kD
	uTI65jrbO0TGM2EECZHC5QC0YGx6VkHu9TP7ctw4wZQ8Q2WLK4BMdenSzbVsaQesP0DcbNjuzEB
	WfMuk1R/pH1h/t/Sg8ULkrhVyMkuyKgeKbWWXGjRpJhsuF3mXv+PdQJNloesoVpWwcjIZ1egwpE
	o9P0sdjoWoD10BFYhhzcryVfcwkJMmprjC69pR+mrKq/rBzjdKP2mF+nuiZaEZjdlKZdMTqQsLc
	rBnybBD4ZNBY0WFmFBjoyCZKevAKGvvasvSul10/Ays2PL+rapXq5jGxPbSwKJAoFDi6FeW0Gbg
	j6zNKKXNOhAfwihzq/6AvNTweCSI4x/xfSZhnaSvuFZ4veMwynNeCzDCl971ZVJijzUs1lsw==
X-Google-Smtp-Source: AGHT+IGD/Uw/fgx84AFertLSvfVKmejPqlvypnP8IIzpqbGwR8abvcNYUgIYpDHVV55dLFfVQQ6myg==
X-Received: by 2002:a05:6512:39c6:b0:58a:fa11:b795 with SMTP id 2adb3069b0e04-5906d87bd8cmr5059024e87.3.1760556174897;
        Wed, 15 Oct 2025 12:22:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98d9sm5657624e87.24.2025.10.15.12.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:22:54 -0700 (PDT)
Message-ID: <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
Date: Wed, 15 Oct 2025 22:22:53 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 05:42, Hangxiang Ma wrote:
> Replace the hardcoded buffer count value with a macro to enable
> operating on these buffers elsewhere in the CAMSS driver based on this
> count. Some of the hardware architectures require deferring the AUP and
> REG update until after the CSID configuration and this macro is expected
> to be useful in such scenarios.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> This change use a global macro to specify the initial buffer count. It
> meets the requirement that some hardware architectures need to defer the
> AUP and REG update to CSID configuration stage.

Both the commit message and the explanation above brings no clarity on
the necessity of this change at all.

This is a dangling useless commit, if you'd like to connect it to
something meaningful, please include it into a series.

> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   drivers/media/platform/qcom/camss/camss.h     | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 09b29ba383f1..2753c2bb6c04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -541,7 +541,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   
>   	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
>   
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
>   		output->buf[i] = vfe_buf_get_pending(output);
>   		if (!output->buf[i])
>   			break;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..901f84efaf7d 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -41,6 +41,7 @@
>   	(to_camss_index(ptr_module, index)->dev)
>   
>   #define CAMSS_RES_MAX 17
> +#define CAMSS_INIT_BUF_COUNT 2
>   
>   struct camss_subdev_resources {
>   	char *regulators[CAMSS_RES_MAX];
> 

-- 
Best wishes,
Vladimir

