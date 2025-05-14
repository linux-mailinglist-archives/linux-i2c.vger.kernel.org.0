Return-Path: <linux-i2c+bounces-10976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A502AB6255
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 07:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A31E1891550
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 05:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53101F4628;
	Wed, 14 May 2025 05:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVihJdk+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF61DE4E3
	for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200510; cv=none; b=PDdExoZyIcZLJRDGK101jnkjGlsbcixo+nhwNyT2E5dt4MSXBgcR7cEjeYdgyz9EjzdqF9M0+jaQJMrOP095+ZgQvJ8RRXrQ+c5xziHPg7cLGvtkzP8SMQV0tR3AKpH2Lmh5jRzyUMJ1WM7DG8foHnkq2NbMM635bwvkhdtppPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200510; c=relaxed/simple;
	bh=JkeFk5JvtELodwEn2MQCcvDJk93HA88o+taJ9J75Wvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9QLSEgxnkpLqeFVJU6VK8nJhklj+y4QGQa0FoKg87asQQHTpZAhsjMraCYASgT+FOclRKI+WsJlNZl+n9ySe7jEzxMaT8IARYoi79LoI/3eZEtXG+CnbEQbbQSBlz3ugMgEG5crLiAe0VHGz3CBxbUwZvCjDxeZJKDHwjExr4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVihJdk+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso12169595e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 22:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200506; x=1747805306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=dVihJdk+ifDgF3QyP8rRJJzBytMIYTapriOYoM6ZnyTuWmSF9CQhG4Y58jNjQKeI7f
         XvjQ3XBLfV3pq2TG9L7oFn91xIfnX5ijcey5ajzes8LcebC0CPRlziYwkdp+E2Ya7P2U
         OivLsOZeUx6v+eTBFXLwSIaZwi1gU/AjeKeqc6k87HbEnID4mlPTdGvpg874bzXh1XXP
         npceKV8lSYqFWgdu0afboQMPVWMfoFOwN02kNhOKp+kifGZWOsPMFWDHJkdC5uXaFLAQ
         RAlNBR1BOF3Q/2bSLJIZda0z7LqT3SkqFqwiYt4lE4ROWzDyNpYP25K5hgUby7suEnti
         jaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200506; x=1747805306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu+kToH5ynZZEiBVPI1+qje7yD+2OfrJbW9noNa4CNg=;
        b=QMKSl03WuZEdGZdvQT6oQLQLjv6wCLmNr/4Q6zN3eHvaRMNrkNUxtYVr9/+oExmKCN
         JOZXbZU3K3moY5XpYOvuKgjP9W1VjGy+DJEiNg+eCZKkeqjFaI1o3p3S0jCr9Fi7osxI
         W7wMlR176Spwg9CFfAqlyzT9bLbMdwBv9MVS3lRp6a2CUFucXDhtoXQjNi/22mlt7NUv
         OUa8XugxUrUFlY70Ab3XnukBK/OrH1ZHFEaxwbPO1T5p0Wkt0PxX9+LnuL40jR35VeFc
         aokEoSDIUioWL21Yc+tuETUxMnx185T5JqlP+HvqyF5PlYR9TiqUttWjd5r76l2gnHGq
         jEjw==
X-Forwarded-Encrypted: i=1; AJvYcCUiidc+f1Ez68O6qTxmKFD8fl2CGNXaLmiY8+7e4umajuKE/EmpViP9eAyyBLwpGf/XvSLgxlG+IuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYb0Ulx2tHr7g05UIPgHPEtn8ICzUuMSYUBF0krtUonftzX2T
	THTg1wDBv3Z4b3mvuRSVSnJA2gNz4oj0vSykPej8Figs7mkyLkLvdcKgZKQA0q0=
X-Gm-Gg: ASbGncvkV6KLb0WTfvSHBqOt49q7e/M5wUiktzQdu2vBpzkBXDNL4C4VAIX9J7r98nz
	A0HtG2k9TjvmXTvbrEqiZws5prxyFlP6xW1HW8rK6aseSZz5/9fhVHpYBTlJhR17MuOAtVM/+0I
	09qZimi1O1wKL6Xo2D7wAv/w5GdkRhwmwKvKeKK9eXY8Ajdj0DSiw0aH6Fk7GqF1udQLNwYJTdT
	CrkVDHJ5vcfXYX2mTSxPH5RoZdOL62FU7v09s9zNro2IjGzhQ6U+FMUBsSuy3kb1n4t24UNKcqv
	K7YtqvZg5tonRqHRWBUSglRdiesw6/xwF+a7DgvOj9ruyC2J5NNuu1MujaXFfbxsEssTkUUDPF0
	kHvtr5FP4+S/o
X-Google-Smtp-Source: AGHT+IGR8fcXwr8UrIba7uq3uRKgiVAoO7flrB6Ax66vVZKivN1s8Mt+EFttdNMqYIyUx78KHccYtQ==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1286717f8f.22.1747200505555;
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2e9sm18279823f8f.75.2025.05.13.22.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:25 -0700 (PDT)
Message-ID: <017682c3-76c6-47fc-81f2-1da2a22a9d34@linaro.org>
Date: Wed, 14 May 2025 06:28:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: camss: Add supplies for
 qcom,sa8775p-camss binding
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-1-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add supplies bindings for qcom,sa8775p-camss.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 083e1193c474265edb445dd30717360de57ff986..aba46c0bc11faa062199f563602494bd2f62367c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -125,6 +125,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -164,6 +172,8 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -343,6 +353,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;
> 

You can drop this from your next submission.

We are fixing the PHY schema to give a 1:1 relationship between PHYs and 
their associated rails.

---
bod

