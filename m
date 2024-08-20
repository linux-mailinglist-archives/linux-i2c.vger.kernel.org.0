Return-Path: <linux-i2c+bounces-5600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4889585F8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 13:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A19FB2152B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 11:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C622B18E75A;
	Tue, 20 Aug 2024 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y3exv8Rl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFA418CBF3
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153856; cv=none; b=nTRXb1zFHIPHHzer/ISVMcqTerUzdlXBXF/1ev0MeH4a8xL6ysI+hMGmfZHnPSzeOCJJx2Ybw8zRrnz9YraXuxVVd3cjAnOyUDBRbTmeMTdD4ZyhttLR+l5+G8ESpGufE9bjuZoC3eR1EzwAaGU0tiKqkCXOrOKZMG5vyOQm6Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153856; c=relaxed/simple;
	bh=IvZBJUxFElI7oSzZMmvS6vB7Efvt3Xy4SUpSkkCUtPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nC9n2HlHnxfPSZBgfmyJrhGzqhV2P2YOwyaDRtp0xeOJj2woVFL4A76ibNzF+1SOJLRE6SVPoxtydwI0bjxItA8+ko6lQrSKBdSKgcAcXUcQH2RFUi8GhRN9KnEhoheJH8vK+A6PtTHIWOFYow51Tta1mF9NLOuxdGZWyB9yXiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y3exv8Rl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-533446e53b5so75715e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724153853; x=1724758653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvQ5KNXMJMLakdVv034VXkUY0ogpNTCoT/KgikaWz60=;
        b=y3exv8Rlk35ck1be4h47L1GST7T85+FbRXn6gLLsPaAp2C9tiWn8gUGw8y7kPZXBz1
         zFu52SWFjzeLKrzj+qzE64sc+QFn6bCFCXulmh001pc87MfNdLmYwM5vf2iZB2Zd75xv
         nVtRrZiRrbPFLh0JPiftMt681mWbkVHh5dK0Ju2/HbO0w0xtch5NcdUDd2aPJCm2/4Pz
         dADiO9lwyoHCIpLCz9nMpDaEo4mtghvFomSNIHJkgYY9689ilc/HpHgccIzOKnm6icY0
         8MJVqxdIh/a1/8MDHPndtnzWJNLMjmDHdMn1EDbgUjFZGrCokeHvffhcFOm3ar3VZEh/
         Zi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724153853; x=1724758653;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvQ5KNXMJMLakdVv034VXkUY0ogpNTCoT/KgikaWz60=;
        b=D8fOoi+bITB3oCMpkxy1/uoVL4hn/O8UweN4ocOuXfh6RaefPzRHdMDUYCtAe8eDh8
         acVBBY06ReeQXiujuZj4JyJtiyt+Lj+UgjMCbK4gU4ITBZkEz/adI/OJSUOq8lp7bcRi
         sddnG8igLHZASUiCVTRbFSg2azohST2vcf3q8qsl48ZUTfGNIUAVO0hrbpRJScyJS23i
         0KZ7ambqDkkT9IVIPRWD+c7vPcnQRgjgpNQ58PftJg9hqK1WvBRPk3x3Sg/LdSu5hnxJ
         e5sLHrCB5gxhgEP+DDUYSv6uebODuJth/ghP0bGXc9f1UuI8fuQIsfWjeeTXWQI6pJ8u
         HNfA==
X-Forwarded-Encrypted: i=1; AJvYcCU31xzCWVsCLambpnVIN7k1aZeoso9pESD+pgbrl6CxmeZagXlkSUmhHjrMY5syn/OsuoOgrU/YDXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSVK+qWBDlnTRQ4MXKly4pa4urwqePojkbq2P4GBd/SFcAgmJR
	FMs5Nj/aSlTiIwQa45kFi7jhFxn/2EG/yIKQD9DgXdu9D4YtLqCnaV9eFJixRqk=
X-Google-Smtp-Source: AGHT+IEnAtcUPnLPniIn1G+PY8BSHGTXyXnIRA/xgiJW0ArDYm/MnZ9Zgqj+xLtJoMXC1pXKYENaLg==
X-Received: by 2002:a05:6512:4007:b0:533:d28:b9f5 with SMTP id 2adb3069b0e04-5331c6f621amr5321803e87.9.1724153852473;
        Tue, 20 Aug 2024 04:37:32 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d420357sm1758134e87.231.2024.08.20.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 04:37:32 -0700 (PDT)
Message-ID: <48127e98-f489-4c62-a7e2-f207c875c77b@linaro.org>
Date: Tue, 20 Aug 2024 14:37:30 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
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
 <20240819221051.31489-9-mailingradian@gmail.com>
 <3b3774de-3aeb-4a58-8c0e-e494a2f2aaf8@linaro.org>
 <e34dd20c-e67e-4b69-88df-b4d34e01f8b8@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e34dd20c-e67e-4b69-88df-b4d34e01f8b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 8/20/24 12:56, Krzysztof Kozlowski wrote:
> On 20/08/2024 11:15, Vladimir Zapolskiy wrote:
>> Hi Richard,
>>
> 
> ...
> 
>>> +
>>> +  clocks:
>>
>> Please add
>>
>> minItems: 22
>>
>>> +    maxItems: 22> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: camnoc_axi
>>> +      - const: cpas_ahb
>>> +      - const: csi0
>>> +      - const: csi1
>>> +      - const: csi2
>>> +      - const: csiphy0
>>> +      - const: csiphy0_timer
>>> +      - const: csiphy1
>>> +      - const: csiphy1_timer
>>> +      - const: csiphy2
>>> +      - const: csiphy2_timer
>>> +      - const: gcc_camera_ahb
>>> +      - const: gcc_camera_axi
>>> +      - const: soc_ahb
>>> +      - const: vfe0_axi
>>> +      - const: vfe0
>>> +      - const: vfe0_cphy_rx
>>> +      - const: vfe1_axi
>>> +      - const: vfe1
>>> +      - const: vfe1_cphy_rx
>>> +      - const: vfe_lite
>>> +      - const: vfe_lite_cphy_rx
>>> +
>>> +  interrupts:
>>
>> Please add
>>
>> minItems: 9
>>
>>> +    maxItems: 9
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe_lite
>>> +
>>> +  iommus:
>>
>> Please add
>>
>> minItems: 4>
>>> +    maxItems: 4
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
>>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: ife0
>>> +      - const: ife1
>>> +      - const: top
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    description:
>>> +      CSI input ports.
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data from CSIPHY0.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data from CSIPHY1.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +      port@2:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data from CSIPHY2.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +  reg:
>>
>> Please add
>>
>> minItems: 9
> 
> 
> None of above are necessary and this contradicts review we give to drop
> these...

Thank you for the correction, I will memorize it.

--
Best wishes,
Vladimir

