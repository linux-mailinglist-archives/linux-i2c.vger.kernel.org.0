Return-Path: <linux-i2c+bounces-4787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B192B2D0
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 10:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3498E1C2230F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 08:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DEF154BE2;
	Tue,  9 Jul 2024 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCnNKGvG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928715383C
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jul 2024 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515405; cv=none; b=u0tY1v6LWhWFjOy1avJDfb9FVBc0r2kAX1GrjqtmeRkzrTIaxyCYGlgJ/MiQdlbPI5fljA1WmIVsyFVnjIHpyYMm3aYV++G6IpIfFirhPCRqdT8mvMEY0mCMV8iuT9aeG2AL2MfgGnw8CyZdiR34q/4OHsCrH14Mz1yG/VGGKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515405; c=relaxed/simple;
	bh=zeEnEM9kX9Y0nyF8n3K2wS1SB9H7giObmnlLh3K61RY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UFFOEWe6aweD4sl3I8nKFhEMdpNtA0Q6x1LOn8UqJF+1K5U9AIA2KsxTrHqz8xpdPfs0x776X3lN4QZ8x0lFBSuCZG8bqi5qVxGBBADsTNuG7GCYaKV9lAE/Wo+0qJmDzqM5l76fDczSu8dTnaAOgDgjDL28n4308aT61nkFfPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCnNKGvG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so10417675e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jul 2024 01:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720515402; x=1721120202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6JCs78VemHVLXAEu6lpNSjjhDkuEB/scHH4X5narOY=;
        b=JCnNKGvG1oCSiGMnObEFAmLoqDR7WxrsIokRBQ0z8vv2O5Shd28+wQINpGzj70nNbl
         Q/av9hS45kd+Pgj1UBYK6l6U+/BMCPh9YrIGqI93OBM+g/oE8bVhyQIC8sBMl/Fxo95n
         rxlL9v3HiHggZvojtlROUkzPxgg4DGMbDniEA5GmO0xtxZI7JPsmpIywv29TO/uKcHmc
         Y2XQSbCbWV2Aryf0gDgI8xxg+4aC3Ae6dBxHKFRLHzHs1eCrHT4TREF47Nr7Gw9DCSsC
         eVktto3V3gGfnC/lhnt2ZkF6v4UzBUiiXnGrxBqKt8SSYT3lgh9hZj7dC2n87BEnuc+m
         +zzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720515402; x=1721120202;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N6JCs78VemHVLXAEu6lpNSjjhDkuEB/scHH4X5narOY=;
        b=kQqGiq7Q4exgX7Y0jX+pFnfI8FKWGsmZHbOt4qBQtKwek++TUCqr269NqKTY7JduLa
         l/EUojKxn0keIyIEVvu0PXZqv/kgOWjERNc/2axoY5lUMt5j7qlWpG/vylSe7URS+5+g
         4TYr+fHXZcAJns4eFY8SJ15mdLAhL7iAlDg0TMbaHjWfSONtPOO30ep2hyNJn6DFLbpH
         QhrNYHs98OxtiQaP33YbWeXlX/YlGdAeom5Psfo/fn3BZ+OcpTDfSTzzitQsSWkg1m+g
         AcItPlAnm1NLhJoP9fCIjSXKbp8eGNHyMTT1A8f/EDcIiuDkY1f+5hRS+1aTbfsyITQL
         6MYg==
X-Gm-Message-State: AOJu0Yy07LO24dhZwlui6+FbNyMDAsmCycdKWB84S0MAz+HYRP170S0q
	pt4WlBfjr2GGKZhOKgL1rlXuhQ0ImTcutyNOMbfU2iOsbMC8MOOOzSx948hp3rc=
X-Google-Smtp-Source: AGHT+IGl0QCPQ3RtBPhEJx9xP2Qga0g9dxUHEMpPlS8Y3PEVe0Ejn3U5/SxbK1zEVuMX9qiiIAaEow==
X-Received: by 2002:a05:600c:2057:b0:426:52a5:1ca4 with SMTP id 5b1f17b1804b1-426707db724mr15635825e9.21.1720515402453;
        Tue, 09 Jul 2024 01:56:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1138sm30698455e9.19.2024.07.09.01.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 01:56:42 -0700 (PDT)
Message-ID: <9bb13c8a-1452-4a83-b4fa-04c17c8a0819@linaro.org>
Date: Tue, 9 Jul 2024 10:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: amlogic,meson6-i2c: add optional
 power-domains
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
 <20240708194808.1819185-3-gnstark@salutedevices.com>
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
In-Reply-To: <20240708194808.1819185-3-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2024 21:48, George Stark wrote:
> On newer SoCs, the I2C hardware can require a power domain to operate.
> Since the same compatible is used for older and newer SoCs make
> power-domains property optional.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> index 26bed558c6b8..c4cc8af18280 100644
> --- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
> @@ -30,6 +30,9 @@ properties:
>     clocks:
>       minItems: 1
>   
> +  power-domains:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

