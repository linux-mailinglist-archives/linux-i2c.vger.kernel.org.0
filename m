Return-Path: <linux-i2c+bounces-4785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF992B2A5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 10:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A3D71F2167B
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 08:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35812154426;
	Tue,  9 Jul 2024 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHRIHcyM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B2B28DB3
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jul 2024 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515226; cv=none; b=ooz7e6Pj7oEl/bcIkJkuLmup/IL9fAS/gMADjD02qAGC/HMIyEG7F6MFOXRdy+/MUnzY1f8NqmcGn5zTGJyA1+mTtvh2iQRPm4h/uoctK/kvtlX8YezAMW+gnPXlM6rPrqXvxgYrhKp6kNBx2+SJTDaNJ+6ZPXotiBqtMYdi1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515226; c=relaxed/simple;
	bh=cd79zXbx+N5vL7P7T5X50BfnGu+fuRaCuSWUDwLHr4E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H4PPX+aWjlhQ+2Ah2KmF1f9/HZYZs1VwPBszk78j/7fevgssLUwmX5SFDp14cCUmRDO3wrckeaKqGxlJVs2klGsYs0+qvD+rw+nlQp+1FXTghUu1N++Mf3yBcX7g9mbq56gsLAWJhajjkjQMoPB+EiBJczJ2Gcfd36iunYpPiUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHRIHcyM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36799a67d9cso4020360f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jul 2024 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515221; x=1721120021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA4aYgkuEJQ+2zt3ir0pQgoFJui8snze/b5Z9Ceeoqw=;
        b=wHRIHcyMlXzYlbMt90M/WZqByG20ElKqxAluGsfVWgsQ7nOnBaQpqATQCqOXaCIYdx
         MBsrtBVad9S9+iorF95revQHv7VwrMXfLYbcOqU3pStNWqy/84lTDRZOM/mgf7jRItrC
         rlW8DXzQEIMXYl/G/EouPZBX+3qJe3AiV5AkTBrXsjrGk5vmoH36P4SmPW8CCpJ0NGrq
         I2bNWLq6q4eyItfSQmO4aD/f4ziHxPPZjbYlGRXL1SMajfyMfWNp+igzrIKvf8YkaAsg
         JOwpruZ9Y+KNK0qb9SGMqXGCkyBPc/jZPALtMS31NQCuCHcMmmqAAzAfkZMxM927R5Nk
         rmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515221; x=1721120021;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SA4aYgkuEJQ+2zt3ir0pQgoFJui8snze/b5Z9Ceeoqw=;
        b=ldljk5LP/94OaNOTcTQHYXG0bApLjNbVmlTTTpnA+dhcQ5Hw1mh0GjwIFi1oui5e5j
         iutaODLqNUj6braMbXsMLQwTpbRUAlnB6amBQkabYg7I9YhILjO8fCudLr4MlMPXZWTh
         SxF9JjiQ7U03+7qBSabNJc+qVSTe1xbNwMAkD3pBPm0Sp4kcmJzdAa8/h2AjX8h7AD+m
         3ZVij9X5nX5NomyJuxaLj3Pt1d3J/yhBggJBcWIEbdzhUNiNv5Q55h4rW6i7/f3dDQSp
         y44GUySMqkBWNcQL0Jd6E8qwcdtS29H+DkbpW9++D8y9EWu+lWNVY9vO3vXvvTVwDVa/
         DbzA==
X-Gm-Message-State: AOJu0YxI4/xStF5BRtFnfWgk2E9VWFfiI1eyEfLB6W9Bgb+hD8De8iZy
	vQFJ03vjhqklczk2oJkujXagSmBjUmhIDy0J7ifavQzIP151CPsBEtjQqUdM9fQ=
X-Google-Smtp-Source: AGHT+IGqB81NuLSnCUMTBHrJCIu396Gu/1DlJmDXwuPVOZxJWI5XPrLUGFSWhEfO8pch8PKu4xYm1Q==
X-Received: by 2002:adf:f30b:0:b0:366:eba0:8d8c with SMTP id ffacd0b85a97d-367cead19b5mr1656003f8f.54.1720515221137;
        Tue, 09 Jul 2024 01:53:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09fcsm31353055e9.4.2024.07.09.01.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:53:40 -0700 (PDT)
Message-ID: <a75ae0d7-9945-4e97-a4f9-706b253a161e@linaro.org>
Date: Tue, 9 Jul 2024 10:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] arm64: dts: meson: a1: bind power domain to
 temperature sensor
To: George Stark <gnstark@salutedevices.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 hkallweit1@gmail.com, broonie@kernel.org, glaroque@baylibre.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, b.galvani@gmail.com, mmkurbanov@sberdevices.ru
Cc: linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-5-gnstark@salutedevices.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240708194808.1819185-5-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2024 21:48, George Stark wrote:
> Meson A1 temperature sensor has dedicated power domain so bind it
> to the device node.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index dd5695963caa..86d77f51c25c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -919,6 +919,7 @@ cpu_temp: temperature-sensor@4c00 {
>   				assigned-clock-rates = <500000>;
>   				#thermal-sensor-cells = <0>;
>   				amlogic,ao-secure = <&sec_AO>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
>   			};
>   
>   			hwrng: rng@5118 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

