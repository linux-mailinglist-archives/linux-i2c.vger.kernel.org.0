Return-Path: <linux-i2c+bounces-5920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B19964185
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 12:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EC0C286F4D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 10:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9625F191F7A;
	Thu, 29 Aug 2024 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BtKSMlW7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2B51917ED
	for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926759; cv=none; b=t7xs3F6+ofUNxVHJEyNOUut9IYZDscY7jLrYn+qUnV8Gv4M2Jje0D9dv13j2+oCl/Ji9d4DnCEbYtXg1GUG+hTQCDMXPsUR7GpGyeAH5xWhNuP7t8tN8W+D51CQ6OYThQvJ42OOuTmTgNXSlBQwN+LMQ8SnSePN+eNt1OqC9TjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926759; c=relaxed/simple;
	bh=NgBGaohZSn2ujQXQ1kODfi5bvv65HVMuTRh6A6bGzVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GawRMgn3ggOSe5eEQQg0PBW/Vsvb7heWms15RgaIaTNQr5K/OfSkfMG4YMvtNsLzvrecWcsHZp6WvjUIMa8jL9P2RXksrZR/nAIcEsbXJIeEWqYlPHXitju0JraXvqn/MDV+zVHxt3e7LZKX0CKfc126PRNz7boZEtA6T0AASdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BtKSMlW7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86e5e9ff05so52801066b.1
        for <linux-i2c@vger.kernel.org>; Thu, 29 Aug 2024 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926756; x=1725531556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nopjZOiXiccCurmPDi4lhpMiSpQ7X9/bOex7t+lHZIA=;
        b=BtKSMlW7XZr4Lm1FTEzEuYL3fXKE5eGRH61E/NLz/rpLx/sioXTyJ/Vv+Sld6sa5em
         WtDUuSRBQxVlacSJy3uvHA9QNDUGOuuEyItOE74V4vPIOP1Dlcztc0j0mjfqbp1diBpz
         TqchM1et8b7eomaF4CZy7d+P9Kgy2smIRv2iGUIBPSpXxUvDi4m54TkkovYAeeDO58u+
         uMAZD0c0DTrJ3OkVUqgNgm/2IQmhEl9ruCh+TN1hM1Rw4Ru5DFOkLaOGQni+/5ntlqvy
         0V/o495Llx+KAYfGyfpHhYX/XtRfsqSIiXxaj2O2MW9bWq9MhNMp40EUkUFODN5Ul3Km
         SPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926756; x=1725531556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nopjZOiXiccCurmPDi4lhpMiSpQ7X9/bOex7t+lHZIA=;
        b=GqahUs5q1W9SoQITUVqehbsk+8SBr3vGyWkR09ei8CiNF7kjHcu1Ncbt9W9SXQ2k0k
         fy5X6DdZwx1z1AqIqMAYjAnFmWuqvsVkIexhPMLYb582q5A8qKbs63KyvHnJ1RGK+bWR
         gwXlf9wteIqJwgiPL5c9eR6QlDlMzmIAAg05lUmEl2x/oReLHJseUyOOs9A3YROHlDdO
         5G7yB8hfLHwmNTp5tl51Z+XWxzO36hX3sVZbA0KK4LXBmdFuhGcXRx4x023Z+MacU1Sz
         qaoYPL2hc4LSAKj96F0VvQosQyvOkF/qhaQxWu7YMCiYMllW7ONHAnGA8fLDzXodf8g1
         AmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF8jgmx5mh8Jp0Id/uKj1IlvUXuh18PKcM0UsV8IEOTWNhP5j23f4BgbGGm8BpdGVk7ytPf1VAS2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKESL74d4Qab7Yh/EAsfjy3cFiUSSG861/X21GiAlU6/KsvkX
	ShfDZLHgOD5e8flFrOJHDQwMKlE5XI0+r/HDJ6F2Dg5W86GyxDi51UE1jd1/SkU=
X-Google-Smtp-Source: AGHT+IETKZnM5+V8q/IAwppa+3QG8CZq/4HYaD9qYC2EdM3dOtcZyyhQ65wHS4u5dtwJxEHeX73Mvw==
X-Received: by 2002:a17:907:7216:b0:a86:bb5f:ebbd with SMTP id a640c23a62f3a-a897fad70f8mr137210866b.63.1724926755889;
        Thu, 29 Aug 2024 03:19:15 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefb60sm60432366b.43.2024.08.29.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:19:15 -0700 (PDT)
Message-ID: <45298600-beaf-438f-979a-3cb9e207a32e@linaro.org>
Date: Thu, 29 Aug 2024 11:19:14 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] soc: qcom: geni-se: Export function
 geni_se_clks_off()
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-4-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-4-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> Currently driver provides geni_se_resources_off() function to turn
> off SE resources like clocks, pinctrl. But we don't have function to
> control clock separately, hence export function geni_se_clks_off()
> to turn off clocks separately without disturbing GPIO.
> 
> The client drivers like i2c requires this function for use case where
> i2c SE is shared between two subsystems.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

Suggest:

Currently the driver provides a function called 
geni_serial_resources_off() to turn off resources like clocks and 
pinctrl. We don't have a function to control clocks separately hence, 
export the function geni_se_clks_off() to turn off clocks separately 
without disturbing GPIO.

Client drivers like I2C require this function for use-cases where the 
I2C SE is shared between two subsystems.

> ---
>   drivers/soc/qcom/qcom-geni-se.c  | 4 +++-
>   include/linux/soc/qcom/geni-se.h | 3 +++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 2e8f24d5da80..20166c8fc919 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
>   #define __DISABLE_TRACE_MMIO__
> @@ -482,13 +483,14 @@ void geni_se_config_packing(struct geni_se *se, int bpw, int pack_words,
>   }
>   EXPORT_SYMBOL_GPL(geni_se_config_packing);
>   
> -static void geni_se_clks_off(struct geni_se *se)
> +void geni_se_clks_off(struct geni_se *se)
>   {
>   	struct geni_wrapper *wrapper = se->wrapper;
>   
>   	clk_disable_unprepare(se->clk);
>   	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
>   }
> +EXPORT_SYMBOL_GPL(geni_se_clks_off);
>

Does it make sense to have geni_se_clks_off() exported without having 
geni_se_clks_on() similarly exported ?

Two exported functions already appear to wrapper this functionality for you.

geni_se_resources_off -> gensi_se_clks_off
geni_se_resources_on -> gensi_se_clks_on

Seems like a usage violation to have geni_se_resources_on() switch the 
clocks on but then have something else directly call gensi_se_clks_off() 
without going through geni_se_resources_off();

?

---
bod

