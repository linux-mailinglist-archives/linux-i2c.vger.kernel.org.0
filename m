Return-Path: <linux-i2c+bounces-13605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B49BE5E1F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 02:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 08D0D355140
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 00:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11361F4CB3;
	Fri, 17 Oct 2025 00:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XbJunjAZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629871FE45A
	for <linux-i2c@vger.kernel.org>; Fri, 17 Oct 2025 00:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760660832; cv=none; b=vF/Am6RYubbP63/gkeM5+65GVXzsVhw7okKMXDB8YhzkDPqxXFCH/W/q1GJ0WR/+1IjF51+DheHqD4TBZBcNlZc9g9knixZr+3wUOFb74NpzZqteA2frVhMhuYK5REWLhpyKnT0HZl3cCGUqJnCt00GRl5XQIRVyqBZKIyem6aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760660832; c=relaxed/simple;
	bh=SGlqTmdRqTBLV6e9G0m1nAsiw5n0bwL4N/CZUAMrLJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0ZAkHjMLSjj3uacWJBXceqca2Jse13KO973UauAiAD0DtLFIPH37x4+aAB+WBvFLfQQNGN7RsE1loUmGfKpp6oGXMatfnZWjStwlsD6h2EiPR612cQr0Gq4GFHFpzdAsH9VY/BnGAIpUyFWv2zS4sjYj503CZowSAi6TzsFGnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XbJunjAZ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3628a233510so1240081fa.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 17:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760660828; x=1761265628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AM1XVKxng88e3T2Dan3f4di28jrNPp43d01lCFqTrg=;
        b=XbJunjAZsFGbvR1w8XDzDmiYyOgQSrrwQ9lUSVGWjxp7P27xcNaQKMez18ebBmXgjt
         iDD0p8cY9+7083BzDvCg0POG+ecetJHwVEnN2V08jriYY03lI/d16kvevXm8DNt66Koh
         gPCZGMsTVr45F/sRwZE8S21OvBdVbPZy5q3nFHWWipdce6gceSqmbtmkCwDeXLlBbA3l
         6KAhx5c3C34bxp2DAPl4NinvDIb+PrNNCl8+9zBqk3xGO/byJCtZBuOFORcDu9/WH0gq
         jEL033qqdE3g2tfi18zBGrExODbD0k2V1TeaJ+a5aBR4sPb8XmJKd6JafbleIMEfYM9z
         yqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760660828; x=1761265628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7AM1XVKxng88e3T2Dan3f4di28jrNPp43d01lCFqTrg=;
        b=wHvyRgmJUA9C1m7ieebQkNXIWqwygGU8IldF97+erThgVRFw5+xR07dXaSB6tlazHN
         LAzVO9FdaE/6g0CMIfAVwIvEyLTcE15ZU8b8Ixsi2p1gtHixYehb4DhI+a8VLKPX6+xZ
         j26G8R4xcKTXoNTu0wtAi3p8UyLHS0gwjWhDFa8dkQV35ygM8PGLNpucNFXRS52hIabV
         Pd4eL/Jd1qsDGbwDwQ41Y+E9h46/nO6gdKGH06JsTdHUIHNWcZ8H/byQDScZ2j7pB8A+
         jvnvFwQNmo45McfBNeVnmg+SY/XtxDS0vlY2Lh7uOcQ73zpE8PSXxvyFWpKjzdpbLtSZ
         LcaA==
X-Gm-Message-State: AOJu0YyA9xtP7nbYuJnEaL37niQqGi4taxCCgqbMV7E2HcicyFc7vda4
	k8albyouHIWbZwTpliKDz+lYMFQrpqMYdqms8FfFmm4RfIgGWeIfUcaTjVVp8CLO5H4=
X-Gm-Gg: ASbGnctNl3N1i5a3ixoPWTu4BlmslWQJINP8AroPDX3qOy08AK2zI7KpdtXKWEKpiRG
	Gum7IWkZkmzfoSRGDIy3ntTQcmOm2pW76uIC19W8M574eg/ThZFyfFJ+UJqmTpkdDV1WAmzM0CR
	iqSzTw8rB2L6F73VA345UalPD3miYbd57n4xIZaZDes002qUyNvmBnXbwaVhsBX0snXaX+f9xRV
	V6ga9/hqSH2GWwwv38Qy+khtDUnfYKvzwu0fBsPBLfHj/JeG61dasIcwtHPFJGFETmUztR6lAJt
	q19471E3VU+L9WgeUY5rqcCFGySs8QLm/QoWn4kJ55H5O4q//t1nUs6HMmqZfW6SVRDYP3DOB9c
	UZSW4WrRXxBWGpcRMmEGoKxdfnIduE8QP3YJKOGtcgFsOhR3f65f519RE1u9kGAN3zH1PtV75KF
	FygwX7mRQDME6yGaWvR4d6ibmYQ5TUygJsQv699TxG7J9RL+C37cv77wwfEw9EERr4AA==
X-Google-Smtp-Source: AGHT+IF6BaEmUIFDUTuqi0v92E1B0jC6+8+mvl/CPlOOi00q4gjTJj38ffVxvsZRUKqnIfBO49lB+Q==
X-Received: by 2002:a2e:a582:0:b0:377:78cd:e917 with SMTP id 38308e7fff4ca-37797627f60mr3725641fa.0.1760660827594;
        Thu, 16 Oct 2025 17:27:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea4449fsm56232641fa.51.2025.10.16.17.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 17:27:06 -0700 (PDT)
Message-ID: <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
Date: Fri, 17 Oct 2025 03:27:04 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/25 02:53, Vijay Kumar Tumati wrote:
> 
> On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>> subsystem for Kaanapali.
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>    .../bindings/media/qcom,kaanapali-camss.yaml       | 494
>>> +++++++++++++++++++++
>>>    1 file changed, 494 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>> new file mode 100644
>>> index 000000000000..d04c21103cfd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>> @@ -0,0 +1,494 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>> +
>>> +maintainers:
>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,kaanapali-camss
>>> +
>>> +  reg:
>>> +    maxItems: 16
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csid_lite0
>>> +      - const: csid_lite1
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: csiphy3
>>> +      - const: csiphy4
>>> +      - const: csiphy5
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe2
>>> +      - const: vfe_lite0
>>> +      - const: vfe_lite1
>>> +
>>> +  clocks:
>>> +    maxItems: 34
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: camnoc_nrt_axi
>>> +      - const: camnoc_rt_axi
>>> +      - const: camnoc_rt_vfe0
>>> +      - const: camnoc_rt_vfe1
>>> +      - const: camnoc_rt_vfe2
>>> +      - const: camnoc_rt_vfe_lite
>>> +      - const: cam_top_ahb
>>> +      - const: cam_top_fast_ahb
>>> +      - const: csid
>>> +      - const: csid_csiphy_rx
>>> +      - const: csiphy0
>>> +      - const: csiphy0_timer
>>> +      - const: csiphy1
>>> +      - const: csiphy1_timer
>>> +      - const: csiphy2
>>> +      - const: csiphy2_timer
>>> +      - const: csiphy3
>>> +      - const: csiphy3_timer
>>> +      - const: csiphy4
>>> +      - const: csiphy4_timer
>>> +      - const: csiphy5
>>> +      - const: csiphy5_timer
>>> +      - const: gcc_hf_axi
>>> +      - const: qdss_debug_xo
>>> +      - const: vfe0
>>> +      - const: vfe0_fast_ahb
>>> +      - const: vfe1
>>> +      - const: vfe1_fast_ahb
>>> +      - const: vfe2
>>> +      - const: vfe2_fast_ahb
>>> +      - const: vfe_lite
>>> +      - const: vfe_lite_ahb
>>> +      - const: vfe_lite_cphy_rx
>>> +      - const: vfe_lite_csid
>>
>> The list of 'clock-names' values is not alphanumerically sorted.
>>
>>> +
>>> +  interrupts:
>>> +    maxItems: 16
>>> +  interrupt-names:
>>
>> Missing empty line to separate properties.
>>
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csid_lite0
>>> +      - const: csid_lite1
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: csiphy3
>>> +      - const: csiphy4
>>> +      - const: csiphy5
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe2
>>> +      - const: vfe_lite0
>>> +      - const: vfe_lite1
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: ahb
>>> +      - const: hf_0_mnoc
>>
>> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml etc.
>>
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description:
>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>> Controller.
>>> +      - description:
>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>> Controller.
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: tfe0
>>> +      - const: tfe1
>>> +      - const: tfe2
>>
>> Please remove all 'tfeX' power domains, they are not going to be utilized
>> any time soon.
>>
>> When 'power-domains' list is just a single Titan GDSC,
>> 'power-domain-names'
>> property is not needed.
>>
>>> +      - const: top
>>> +
>>> +  vdda-pll-supply:
>>> +    description:
>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>> +
>>> +  vdda-phy0-supply:
>>> +    description:
>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>> +
>>> +  vdda-phy1-supply:
>>> +    description:
>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>> +
>>> +  vdda-phy2-supply:
>>> +    description:
>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>> +
>>> +  vdda-phy3-supply:
>>> +    description:
>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>> +
>>> +  vdda-phy4-supply:
>>> +    description:
>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>> +
>>> +  vdda-phy5-supply:
>>> +    description:
>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>
>> What is the difference between vdda-phyX-supply properties, why do you
>> need so many of them, when their descriptions say they are all the same?
> Each of these supply power to a specific CSIPHY and could be different
> based on the board architecture. But I agree that the description should
> probably capture that than just relying on the name.
>>
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    description:
>>> +      CSI input ports.
>>> +
>>> +    properties:
>>> +      port@0:
>>
>> Please use
>>
>>      patternProperties:
>>        "^port@[0-3]$":
>>
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data on CSI0.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>
>> Please remove 'clock-lanes' property, it is non-configurable, redundant
>> and tends to store some irrelevant value.
>>
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +              bus-type:
>>> +                enum:
>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>> +
>>> +            required:
>>> +              - clock-lanes
>>
>> The 'clock-lanes' property is expected to be removed.
>>
>>> +              - data-lanes
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data on CSI1.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +              bus-type:
>>> +                enum:
>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +      port@2:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data on CSI2.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +              bus-type:
>>> +                enum:
>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +      port@3:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        unevaluatedProperties: false
>>> +        description:
>>> +          Input port for receiving CSI data on CSI3.
>>> +
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              clock-lanes:
>>> +                maxItems: 1
>>> +
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +
>>> +              bus-type:
>>> +                enum:
>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>> +
>>> +            required:
>>> +              - clock-lanes
>>> +              - data-lanes
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - interrupt-names
>>> +  - interconnects
>>> +  - interconnect-names
>>> +  - iommus
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - vdda-pll-supply
>>> +  - vdda-phy0-supply
>>> +  - vdda-phy1-supply
>>> +  - vdda-phy2-supply
>>> +  - vdda-phy3-supply
>>> +  - vdda-phy4-supply
>>> +  - vdda-phy5-supply
>>
>> Please exclude supplies from the list of required properties.
> One of these supplies is required based which PHY the use case is being
> run. Can you please advise how to handle that? Thanks.

1. Please rename all of them, reference to qcom,x1e80100-camss.yaml,
qcom,qcm2290-camss.yaml or published on linux-media qcom,sm8650-camss.yaml

2. Remove all of them from the list of required properties, and in a board
specific dts file add only the neccesary ones, that's it.

-- 
Best wishes,
Vladimir

