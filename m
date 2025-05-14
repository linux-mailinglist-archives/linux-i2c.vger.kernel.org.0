Return-Path: <linux-i2c+bounces-10977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB349AB6258
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 07:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2C03B3C8F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 05:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEB71F4174;
	Wed, 14 May 2025 05:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpwJv5xR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE391F0E20
	for <linux-i2c@vger.kernel.org>; Wed, 14 May 2025 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200538; cv=none; b=UEegy1W/zbv1BELWpcqfM6h1qTa+ue4aX91HbbvaQ4i90kXrcMu12LoCMp7j91UYMhum+R/rXinun1GUlrr9id9YA6kF4wmNWV/XaZLRAAPFOENZAUfj2fdl9XtPDZZJfG6PTCcHpyVwWzM0YNI2rjQOey1cBawCdI4JShXHlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200538; c=relaxed/simple;
	bh=5dTwjDqUGC71o92UrTZQlZyU+5wMlvQZNqYAOZynkT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWse8E3pes6gHAt+Fl10ZCcrkCXvSvpT7wiBeWaN2Ra5UtwahbWoIU3DYdXP2BJtiryGUetF2/m8hRvC5e3NUp33ob1/fBVPYOeRjQ4T7rKknK2jZce2rSotRSL3JCbkWhg2C79nRPEOZKaxv+oCCFUi7tYvZzWhdsFqL8zvtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpwJv5xR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so5235204f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747200535; x=1747805335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmEU5NrY0WO7E3ww65s2y0b0wKsXCEAa4aBHaeCuKV4=;
        b=TpwJv5xRrFdE281NAmtGg71gLpjkMOJScZz0UndpQiYQQoMgtol4h15g8DIIfyj+Km
         RQx03bYO2KNoRqakOpwSvYtY6mRKw61uJQCZDhvawAZzafUWoJqYhXHs+iKGOuw5iSlD
         8gZCGcl5ne09ay4/NfPIZK3VyK2E93ALlJylb8awh8OHXQlHU9R5rPPuS8aUJHHNJ5yF
         L97a5uFPCZWiKAcDHegMPiHKMIrWEWZBPXfvUEnBLZI9IvYjr++3bzvW6+DNSHBRbWL/
         Abjq6+/STJqRFfE6ov+byFjQeTLtxt6lHkgtEWKAUJbWoHxHyT6pwlm8yqqyAUppqjUn
         +SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200535; x=1747805335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmEU5NrY0WO7E3ww65s2y0b0wKsXCEAa4aBHaeCuKV4=;
        b=H0Z4NDdTFM8XtQsHPL80/6TQ1yEE+t4yIyFLkmWIaWP+ZDYCtrF8FhWphjdJAMXtkz
         RRTKucxGJ0r91c3rnGeXWI2fWDmZasRkv5yFkXQE0TRDXiPdXRLygVKgR4CNh1/DC31K
         PcCK/pCOxEcbC7twBdsR1bhQ/Ou6OiHsubwGjkn7ZlJ0Od8P6S38C48ut6h0MHUd1qMa
         1fOq8wkmUfjXQLxX3Wdoh1ME13LaMTI91D5uTEQd8xJ6XhbG/DgzwfzvIKcdCWto9HYf
         IXCeLb05AoeyApKSQGSG68c/7AYsmQ7YLGTwuPmDurBQFiD/GPb/O/PAvDqN0ElC9LRd
         wYBw==
X-Forwarded-Encrypted: i=1; AJvYcCUtK3eG8ER3KKUpk9jhE844DdeXagv+z4jmZRbqycUkwqKX4tCRA4L5XiadijfscPjC7tHbzN2hmfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWKWfK6eCYNB61SLi0nyeWS6xl3qtNBsaM0o5FaAW84CwjpDt
	hbPKUHev3vt5lzAhNK7I3efULI7RcUCNQ5CqP+yCRJ+8D1KB3DpILq1jYqH9RSA=
X-Gm-Gg: ASbGncsZprUL4+Q+x8Ja+pMno5xJMNHVH04JQLV7b8UFnIDaIAg2Kq7ssvl3Hbinljk
	xcNxjM4G11BqpXV0B5068+YV3zRWj8cClTy0hMNU6C/Jbo/KhHE5QKii9SnpCWNz8n1O7AUjdO/
	YWMe/k/IXUAEImW8NdijZA68rZ7QU9IGFYX2Ellwu0huVpU9vzb9OnPPluWZsMV9cxn8elS76PF
	5VEKFcfv5OsK13Q3qZNXFGavzTZ1XzhrDBOz7yYHhvyFOowkWgVPLJ0Zs3aXnfqS+I/7y8YWCPH
	frnbtlnYkem7JEs3LCZGeM3ms/dACeTnYrJ4p14fdhDP6dvqisjp2S38MkNRjhlRW/sDThiWu5b
	6/WY8l2mrv1qKGq/y4f9NJmY=
X-Google-Smtp-Source: AGHT+IEGAcfwKJBoQWtEXI0dUeoF2qoiKr1YbPO1n5TUPTbwmsk0AI4hKrFkPAFUSxZdY24ZnvFA2w==
X-Received: by 2002:a05:6000:1786:b0:3a0:b4a7:6e56 with SMTP id ffacd0b85a97d-3a3499512d4mr1435912f8f.56.1747200535475;
        Tue, 13 May 2025 22:28:55 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c583sm18144903f8f.84.2025.05.13.22.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:28:55 -0700 (PDT)
Message-ID: <684be594-85e2-49ee-8b9b-cf0b6d444cf5@linaro.org>
Date: Wed, 14 May 2025 06:28:53 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: Add sa8775p cci dt binding
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
 <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-2-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Add sa8775p cci i2c support in dt-binding documentation.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..117e9db86d0e1b3cf7c5366860fb56e8e72a4059 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
> @@ -184,6 +185,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sa8775p-cci
>                 - qcom,sc7280-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

