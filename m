Return-Path: <linux-i2c+bounces-12641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58413B43F35
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24AA7586772
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E03634320B;
	Thu,  4 Sep 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOj+5XHY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D43431EF
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996563; cv=none; b=nW2eQ0i1OkYRpqfJ8M8YjKOvs0j0J7/wu9ovU73XKFu4nHgGnRu07JirB6UfqKBB57qix5cfi2L8Ntaq3X2q4sws8qqwcYsrA/I7m6yTtjoUuzcIuN2NBojAKnQdJ5HNkbgrZJdEqP9BjcKjE5MUETbX71+Zw+XjtjjtISlJU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996563; c=relaxed/simple;
	bh=2Knd2P0iOB5JzjpHNmPDbX2uHeBqvBGbNPeYzdNyIF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3pnqpFg4Ttmj/r37LoydgVny1ZLriZmT7c2DIYFlvB71ATTDw9Ks+D7U2HveCST+zI4F8TnV/rcJ1P2fVHSsHIAHx5Lz+mmHLtJBJGX09W5gqcjjog3aOFmkuj2eSvp1FGtLalvFqvHedevvEb2X2c851127tececWu9aEOFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOj+5XHY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b8b02dd14so8115545e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756996559; x=1757601359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LG0FGlXd3G2peuym8Yly6U3jFni4sREv4yKdwNH+S4w=;
        b=fOj+5XHY3DHADCSJM3xo15HikfYqzv5tp829rtQMwKDmGVsiFPj2JOcM+18oim3NGr
         hhze5bcjYAMYitvve3qTnRg4/wcsRe0/Aw76qwNVUqwPcrmBsXtXAFs/wxsCIa7AGuuW
         2s44MfsrfTVKMiuae15hxGmubCKcDEQKGTRrZTPwhmJ63UJLEXImqIqncL0AxiEY1UPF
         B9n/5gqpu88L75oR9rOUgM5mANs3VDG/GA6yC/UGC5B8Q4AJXna8qCfbvc0Idv6ldtYf
         YlDLm4cQN+58p/cC9W0JZOYpb8gDP9PtWN/tAGKmZpXEVTHbkplgQsRRyGaLtuHa8GyB
         kvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996559; x=1757601359;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LG0FGlXd3G2peuym8Yly6U3jFni4sREv4yKdwNH+S4w=;
        b=WOqANxriRDvm/8RHOPWV9/Qb5lmkuoxMWmwkjXrQdTf6XUgcds7JZthFOnXI9QhnAX
         MBvqwpHyMdtLNdd0dqWUI4b8VWgDM1FH81I0UAHpUrjVgJbmqAWE/zZXvXS1VqJ3yobV
         im74WsUDHmCWRfvUduZk8OTcuYuhgGfDQW2jF16Ls7mehlOQBOu9Tle0A8ZHwjX4pImO
         3yQ6lsXgJuSdGouJy+goemlZDsgVrvWr6bsKAwb8EaPUUjCpDfp1g6q49GNhwFA7CQnJ
         x1ZRndXoDObI0h45cwB8QKZhm3jr4TNJNWcIGFnh5NFjH9DxtB1DYmia6DlWCs5xN0HQ
         Ez3g==
X-Forwarded-Encrypted: i=1; AJvYcCVa2G6sJ7E3m2bn53czYjGZMBcI//gTD7if7y3KVQOxfnEDkShP1n9IbYZV4NlyfR199ntSovCM6Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoAeBqX4EwDyxeBLZTmhbHeAf3oTLb7cjbv14L8qxfSdJIKB0/
	gZfZfA8QkuloLXGBgicF4f62j58rt8DeFb0AeeRrlGp0JFws+kCbnOooQt19N3dslkI=
X-Gm-Gg: ASbGncvopaTcAy3FD2YCRuwwqoLzouRtm8mhL5a/q79/P8HEQNMTQikUiQfsbgBwIM7
	ujqCD4EvZgGIG8hoUe8GgwSAlc71FCPglDW4Fv2GN/tNnrZ8Bwf/Z4XkmAi+HtWJb1Gf4NzffQY
	QXbp+rM/MWwyNmMVD+QJI0nY8CQ0xySH8MslGZYreBOVXp77m2QSz4PKsu2ByYjZl7aMMYENLkV
	l5Cm6MUCHuujd/qvNywBuXRPSKCgN95esNYv5gKfy+QdgQBBFR1Rm/D9tLdJtPreLH+M+rbSPEq
	Ym3YQ3loQGYasX4ak7QLNjylZhqReGKSNmLEBqt9TtNJHvszpMS+dpDc3du0EE4lqAMNUA+/hU7
	lkDSOSu3U9frCdTVN+Ei35MJei/ynUZldB2ETdJEoexjfCqYSVgL/m/q2d0QscmsQqL93nbSiVQ
	86HR9+d+Rst//um0oucwZvsh4BZN3il9fW5lePD2Tz
X-Google-Smtp-Source: AGHT+IGyPierysmXnmRPi654yCW/A9/i3MYkNNKVapSa3C2rY0Gnc8sqzngSNP7cLDSR+ketpOcIWg==
X-Received: by 2002:a05:600c:35cd:b0:45b:8b3e:9f66 with SMTP id 5b1f17b1804b1-45cb674d60emr49772295e9.13.1756996559062;
        Thu, 04 Sep 2025 07:35:59 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05d0c43sm19336345e9.2.2025.09.04.07.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:35:58 -0700 (PDT)
Message-ID: <7672bb66-b987-44c6-9b58-dee5de2298b4@linaro.org>
Date: Thu, 4 Sep 2025 15:35:55 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc8280xp: Fix CCI3 interrupt
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-1-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-1-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was evidently wrong, as exemplified by the core failing to reset
> at probe (which would be completed by the IRQ firing).
> 
> Fix it.
> 
> Fixes: 7cfa2e758bf4 ("arm64: dts: qcom: sc8280xp: camss: Add CCI definitions")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 225233a37a4fd9f3d65735915c0338a993a322d1..18b5cb441f955f7a91204376e05536b203f3e28b 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4292,7 +4292,7 @@ cci3: cci@ac4d000 {
>   			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
>   			reg = <0 0x0ac4d000 0 0x1000>;
>   
> -			interrupts = <GIC_SPI 650 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>;
>   
>   			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
>   				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

