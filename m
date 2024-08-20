Return-Path: <linux-i2c+bounces-5573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E9958124
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08A1EB22951
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE1B18A6CE;
	Tue, 20 Aug 2024 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsK5RmYF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F218A6C2
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143229; cv=none; b=GZdo6rC0Xkj+XGn5t2+5cGJA6k1RaNZC6GhgIoFzzIStFxKEbKgrmzaQ4NtPlh1WEYbcSXJtzsoktQnt5Gor1XheR7+CFTOF5/5AXerKZ89/nMQDUuo5a00pC5XacIJm+t7E4in5zORNz/Oi6jzRnrXXTye8031OFJ6sRXFBOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143229; c=relaxed/simple;
	bh=cqf+epztMqHF1S45aNOIbPhtm5ch919GzDP4oVJSlmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j/GdV3Ske+FAt0OqoRP1PyjEDYnN0MJlArGUa5IxiJf8R9UpQSU11g2X30YL65vurSGu/fvqsT9LbXvcAGaUR81p7heb0TXVFszPWIVYIdp38fTt/cPY8B4vyNh6u0prKQHXl1WPVwArF5ga7Vd+e051EhdS+79LN85c2SoJ50M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsK5RmYF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2e37a171so11142501fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143226; x=1724748026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsPuvbP6J5tJc8IHjfOGPhqQKG4KJvX3tAwPjRBkj+s=;
        b=RsK5RmYFWHQpta+QK5RAPno4iBZJtcdbPa4E9nmF64S8S12v3fht/vhwBh0qEXjfMY
         0RqDn/7mWcNOAZC+qaxNjiX3C0nud81yG3zPIqWQP4o4pRfEbTz4gc7ZQpP0BOWQredO
         fe9ouHtDdRjljs37BQtAZVyn1/2Hp6Hrebhk5bSp5mIziHqkum8B8p5ORSBT8TEZZNC3
         z/qh6xIbPdMZ8iR8lsuxMj2ftb6GiKdc/SjgnwUhTlEBSAqU9//vIT0tSPmbTseH0rsq
         Ghaid3lUoZ0DUb+kllrLbdz2wzjktQZ6AEfR5JtB3yuJTruaBOe5aaIhhme1Jbx7XM3I
         xggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143226; x=1724748026;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gsPuvbP6J5tJc8IHjfOGPhqQKG4KJvX3tAwPjRBkj+s=;
        b=vMlwDmgy7L4Qdxh/VoSBMqguoZ/ZlHIf0ucJc5HBCG0PpAIkQv9i2NiwCG+mOBfXu+
         Zuw/X8b0iVBukl2aXLYnchbiVtksZ/Il9tSNIs1f2GRA2zBxBexv0dm8kdfznfrft4NL
         +oofUneF9noMDlWtBvaGmKIcc9R/Et49sGAXN2QvoIhfmNQFWk/FBZU0Io3kz3rAbZ/x
         6WnS25BJMHOiynjHiQJxrr2xqdyGNB7hvjJI0abUfjBNlPjYOBbas6HEaJ+KrwpBdu5H
         d2qN3bWxue+p+uJD/M75IrbiNCVuTE4+hzwxwRN8up8RVwoUUJznmQwidDKXux7Sfpxw
         x5dw==
X-Forwarded-Encrypted: i=1; AJvYcCV4l3VGSWi2f+aP5QVkntUGsbykbf6lbNml2HnrJ1P3X9W7IuWVrz/w2yv0moK6pW3lBENaqhcnATo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybvTwY434he6mvITudFn1nXkWurDGJ1rAX0jPoqEmAWKb+I6F3
	YOzfETJ5SIdqr1XO97mvknbZ/PsC1cISh4qmIIRk9tr4FGl8wp4+D3SkXIdECuY=
X-Google-Smtp-Source: AGHT+IHhh6tGdOAQ9QA7mYKMmQvS8VzL37BMb4sv2wh+B2Y9vA+F6kCalp1a7r2B+m1tzo2G1x3zkA==
X-Received: by 2002:a05:6512:1081:b0:530:e0fd:4a92 with SMTP id 2adb3069b0e04-5331c618ffemr5255451e87.0.1724143225524;
        Tue, 20 Aug 2024 01:40:25 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d41ebaesm1687364e87.219.2024.08.20.01.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:40:25 -0700 (PDT)
Message-ID: <0157ee30-8b61-45fd-a64a-da2cf5d983b1@linaro.org>
Date: Tue, 20 Aug 2024 11:40:23 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-8-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240819221051.31489-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 01:10, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml  | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index c33ae7b63b84..af6dd9a34fd4 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
> +              - qcom,sdm670-cci
>                 - qcom,sdm845-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci
> @@ -138,6 +139,23 @@ allOf:
>               - const: cci
>               - const: camss_ahb
>   
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm670-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          items:
> +            - const: camnoc_axi
> +            - const: soc_ahb
> +            - const: cpas_ahb
> +            - const: cci
> +
>     - if:
>         properties:
>           compatible:

After fixing a review comment by Krzysztof,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

