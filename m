Return-Path: <linux-i2c+bounces-9149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82EA18C7F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 08:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8880B3A41BC
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286131A76D0;
	Wed, 22 Jan 2025 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWLmSVc4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9BB3D6A
	for <linux-i2c@vger.kernel.org>; Wed, 22 Jan 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737529297; cv=none; b=nId+8WARXQb4abDVAt1hylVSFF0dHgqzAMOg8EcP/cBY5VBLzzlZLjAe6Krn6ityzyX2go84LQ/gm15XhVe3DFzDfWWS82vGC/hm+uIfcH3MmGdfQlQpI/kNB8lqvVIzD8V4nb7pKz3nsbyiuoSa6n5A6LQ8vjhl7kNfZxqJbg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737529297; c=relaxed/simple;
	bh=0ncMhmiWDDyDcDoaCjFkumTi0iies/xdgm4nwy/AcjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WB5rFX17LyYxkI8ReQMumY6mupVF6koGSIiQL7DiH+NGlhcs4Ogvy2AJKgwiNuToK4O06TsBLhVLjFBBdeBxa8xBU9qMx4Q1HkSRYq4F4t7Vd74s3c92DLgGyv3DHwTpyOcPEOOuiNt3y97LlKUx8IYGm5XgYsx6qkdFuaXtBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eWLmSVc4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-542aae6ef6aso992241e87.3
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jan 2025 23:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737529294; x=1738134094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac1gxGfqa902ustpLEaMMtfCYXH3SBTFhan9QqkMWHQ=;
        b=eWLmSVc4JI0nlzXDLIeaTku9z94Dhnr29MB+2GNFpgFLSGSbTDuI9Rd6IXDIVVL40j
         HIColpsFeHh4NV0Ah9LYpBRcVdNfnpZsQA/4FmfaHG+kOv/rnf2mJfdVAQwqMdJvqd+N
         s00XitFK1gPQ0QIPEd95zC+X1ZHyl7VMAIW1GCqeIdWVo+kpMTK59hb0RcHrB04i5HcJ
         sFRPbIzNimdD4V9PJjyQ5WN7qG8ZlbeQOxKOH2JjyGHq5Kp6luYuM2SL5DnOojEbiwLz
         mCsfkMaJEkTtHtmzGKVuvriigGmbcu/E9uPvBClGC39fpcXzq4TRWqBFs0G0Z99AD4p1
         nG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529294; x=1738134094;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac1gxGfqa902ustpLEaMMtfCYXH3SBTFhan9QqkMWHQ=;
        b=ejOKnRk1hIhR+2BAj/+LMmQntxYxXyHB+4MieEQlMWxchYS0VRYC5g0uBpCuqPNBzU
         dM3NJXgbzmzCSKoFvjbeb0iIf28uMhsBPHbO8oMHXLSnD02+8u5gLQjh/honnZjHrZag
         kCebdz8WEDhokXc3+ZAesAXqS7DjjTF2BIjvPzs4Jxm5LW8An6h3DZVD/t+L4QExhQtl
         f6dWTj8GNPvDtQBrXPOHBRMn0CZeQaTfftdn2BoTMzibpejw3rrrGyCt3bGDjfkRnfom
         Lvh3VdunZaH0R1oNxaREv5ylAboIZCM93/shlpBbMuxjDVJF0hdmxzxvq7AqKrf1s2YS
         ibgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULrULPWSCq0vEGe46fy8TirXwvF+7zE+f8uISo4nPRq0Z4awfBJQN2Yef9qET/lePEZ2IOcwjioSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZGxbKV8j2A6Wn+J+uC1hocTh9u5AmLyDa9EfcAowY9dkkKNk
	hUAqCL6XjgZ/TUrggRBNzajwO+1sC+XSlVF6lbUqNCOlGOL0tiYO2FgqqHmYLsE=
X-Gm-Gg: ASbGnctQgsTRaA+mt58/l46o5ADyS58SAlrSX0lXuqcwr3Day2g8BJVr3skBznuvt8c
	R5HVDHGToiv3V0hv4M2XasBp6QIhsn+84uWPz84zpr7JDRQGtpbps17sy/NJxaFYV3kN2imahvb
	6x9zEDqqeCxH5dVS9CfHRllawTerfUBEdnPSlhvbPwRWItiBNoVt0xITvVRnBzGQwWIEah1jegA
	FzGimDLH/YUq+tDBfUaPD++69K65+Ld48SjKjLKiSIAc3S2Koj+Gz2X/wc6mx3lQ3e4uQz/R7sN
	lDpRhgKH+vz0+HAxbsmKuw4a6HMb4d5y3xARM/A1kJB7RHSV
X-Google-Smtp-Source: AGHT+IE8RKQTrH8l/x/rnVSgr23pLF4p4DF9w4yQ3qsCIFk/+CBX3a2lnUTrQWg+AJh8JdHAc2B2cw==
X-Received: by 2002:a05:6512:4018:b0:542:1137:612d with SMTP id 2adb3069b0e04-5439c2537d6mr2367482e87.7.1737529294223;
        Tue, 21 Jan 2025 23:01:34 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307587bbe26sm2814751fa.66.2025.01.21.23.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 23:01:32 -0800 (PST)
Message-ID: <b708832b-a0c2-4a1b-88a8-0257b1d22fda@linaro.org>
Date: Wed, 22 Jan 2025 09:01:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: qcom-geni: Update i2c frequency table to match
 hardware guidance
Content-Language: ru-RU
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250122064634.2864432-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/25 08:46, Mukesh Kumar Savaliya wrote:
> With the current settings, the I2C buses are achieving around 370KHz
> instead of the expected 400KHz. For 100KHz and 1MHz, the settings are
> now more compliant and adhere to the Qualcomm’s internal programming
> guide.
> 
> Update the I2C frequency table to align with the recommended values
> outlined in the I2C hardware programming guide, ensuring proper
> communication and performance.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 7a22e1f46e60..cc0c683febbb 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -148,9 +148,9 @@ struct geni_i2c_clk_fld {
>    * source_clock = 19.2 MHz
>    */
>   static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
> -	{KHZ(100), 7, 10, 11, 26},
> -	{KHZ(400), 2,  5, 12, 24},
> -	{KHZ(1000), 1, 3,  9, 18},
> +	{KHZ(100), 7, 10, 12, 26},
> +	{KHZ(400), 2,  5, 11, 22},
> +	{KHZ(1000), 1, 2,  8, 18},
>   	{},
>   };
>   

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

