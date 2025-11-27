Return-Path: <linux-i2c+bounces-14317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5DC8D9E5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E87964E6368
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3DE32A3DA;
	Thu, 27 Nov 2025 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xsh/ow1q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35579329E6E
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236703; cv=none; b=DZkJlLPcbUc9NTKECNvObuwJFoI3eyF6+/I72mPPqOK7qYBEjfpcFL5qtgLxX6fE1zBn+8LnOhUPxIR8+j99s6FBn9qJL7DTZWJkNGWNaSQDIraiMvslUjveksUo2PPa4+o1ODX3iMYrvJhkZsEWaeb9AR6SLklRMz/oq23Oj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236703; c=relaxed/simple;
	bh=8XhADblrsw7crDzwA4YYBlsruSjUl3pdlJRhOO76TFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlYEtDUlSRsqYJf9f4bsxkSKPqgVLkzZbauw71pbLogzSrD6wV3EpD2o9sazdZo4QEevaXqdVX2V9MxcM50Es1tUgNPmCnOYkbonHO5XD/7Uv+ysM5GuG1iscVt0p/rSn1dr6MK4AFwn5RElR81K52BNGysrTyWYp/zl0vY15nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xsh/ow1q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so3933095e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764236698; x=1764841498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUyjSzf+6qkKbRlbXTsyYQMvsZwUMyzkw7vuF4dlBN8=;
        b=xsh/ow1qwYSJWHi5hQsmJv6QOKd4U/XBAmjrNyesJXCKV61PKmbYFnIbHxaczS57aA
         9Kw+sh593UWvqoHWOO79nNYB5m85I2p8p8JH93OzPfksMmY7tj3qDh2/F+HuuKYypR42
         PWmJpEw4PLCg/s9vJ9syguhGHbA8Uh34KH4fj73ANKfHKilsYel2b/xUTywfW6luzhOF
         E744STY4RsJjGUtypKkkEJRYTXHlYJoGdwEH9yOq5LcnYxgQWFy6hCSH9ra1jCUhZelr
         iwufsO5yogq9L4rDVLNrqt1vdOv43r31NnD8XD0ylz2//Klz8IeLsVR6UMIUGF+B/ArF
         5r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236698; x=1764841498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUyjSzf+6qkKbRlbXTsyYQMvsZwUMyzkw7vuF4dlBN8=;
        b=YsSvHifqw01hh14yPuZkg0n5RLXhurV2zcj/iIwcUePEAMbwzU9TxvbzrhOq8h2695
         Og++xt6eNYGOA99re8Zv6HS6r34GdejME0+EEItLOJchF4nCF1sGVGY5x/sIqwZ7hF7f
         iv2Y8J8UcJHrCszHG7jYy94S6SZtZktAFM1TAGq8Dl7thZAujQxctzlLHr5MJwOiqFTs
         WO3NLNn4wYI473TsUF2M0UoSRxt4oTfIFvUymfte9N7Wlu1mAW8MkRwHJci/I/pfRx9d
         GjqJnFSCOl8/1EuPS8Zueq60HfFSGe6U82jR67g5rHFOaIDS+Zfi7EUVOU21PFCvtDm7
         tlKw==
X-Gm-Message-State: AOJu0YynKzKyiLIpiq6fPS91ab4om2PmL1lCaOFTUVLCpuk9z6g8dhsZ
	gnJABBnssv7yEkdXW/ae4p2q8StyGsFcdGP66yvE/dZDMIqK/VgQLqRUqlDMovjBvRk=
X-Gm-Gg: ASbGncuLd7dWUuq9IYsawLsvTFHKtgzPQytg5DP0I87XAjA9yhSXYmrQJD6gBvSAXde
	jv0ARGa4QE3mGy7T62cW8H9eXVmyvwGl3X8YnWmK14VhQ/5E5JUGfHd3QYWTwDGn/pSkhlW6IsS
	Qanp9boVehnlfuEqOVFMxr073nlMFOLrCmdVK4E4SWT3qalySOl5GMYLVsL5kvAzJe3RC+KwNl7
	ixgJghYlkdbgpkpM9UiNzn28N4YGKPOWU19chNheMeUiyxdbCEOWQlXgS+Gp2AkMdzBUmjAzLgA
	gtczUK0x4T064Bq5HmEh0RM5bUVJUsjdarOywks2w7e8zGbJmunB2Nw08GSqN6yW7zKRlU/TO2O
	t74lnhpi6Ry1YaJn5EKY+spe9pG+cYIqtSGY54TpYr/bkb6MaWWuUouOmS42ZTbcdRR3YJVhUMZ
	osZPZgrqwzqWFMlIPNtadG2OH16DK3EaWLfOomVpdyypmN/V2avV7v
X-Google-Smtp-Source: AGHT+IEPdwKsbg3Zp0AsKlru/Ylx+PdP+Q8dS3H5IQzMopRv9eF2iSzXCwIE5M8ELtc1p21MvXd50w==
X-Received: by 2002:a05:600c:c490:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-477c10c8596mr213198165e9.1.1764236698497;
        Thu, 27 Nov 2025 01:44:58 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm3238104f8f.2.2025.11.27.01.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:44:57 -0800 (PST)
Message-ID: <c5b629b8-2bee-4027-9205-6e7f74cda133@linaro.org>
Date: Thu, 27 Nov 2025 09:44:55 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document SM8750
 compatible
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
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add SM8750 compatible consistent with CAMSS CCI interfaces.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 33852a5ffca8..a3fe1eea6aec 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -38,6 +38,7 @@ properties:
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
>                 - qcom,sm8650-cci
> +              - qcom,sm8750-cci
>                 - qcom,x1e80100-cci
>             - const: qcom,msm8996-cci # CCI v2
>   
> @@ -132,6 +133,7 @@ allOf:
>               enum:
>                 - qcom,kaanapali-cci
>                 - qcom,qcm2290-cci
> +              - qcom,sm8750-cci
>       then:
>         properties:
>           clocks:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

