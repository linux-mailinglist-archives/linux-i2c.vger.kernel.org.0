Return-Path: <linux-i2c+bounces-13777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D82C052D0
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 10:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD0F1885598
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 08:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5FA3064B1;
	Fri, 24 Oct 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfHJXPb8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7823064AE
	for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295803; cv=none; b=n2M/Q+JaxKfEN1EzREPNemhsoErygpu+mfYk1OIsoo2ESweE0t9soBkh75aPka39ZfLoCbGmq3ac9kSFDOF895cu+NpuP+EP6Y0fWwn8GVVEHjZZOscxNymh8Ze5ZDRdkjoxE7wCrpKqG9T9HCUSNXxHjOINEWP1Un78gIY6Dqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295803; c=relaxed/simple;
	bh=KtRac23q+Mvk/wLRj7uEy/AxuYkTBqJwtlm3KoBllVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO92QskW1g2qLCgU9XewXnM+Lt9HfeSysTBOj7FtkAbpVS42+5UZ6fpPDrLF2Bz59XfPpzrlodEmhYJfvtyjqhBzpbfgqLLgN/6EJcLwaFLfhfm/TPCQpw2ryYN6qvm6R6+swxi1k9X87/qXYxLXKFcJRpuRtyR+qQTjnYaSBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfHJXPb8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so9761375e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 01:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761295798; x=1761900598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GNoQ9b+pWMKGwp1LvkwJ2AQeblm+m7kH1bOa6ZimqA=;
        b=LfHJXPb8+RLVH+vxSzk4i8T6bXocvQ9mJ22/jx2KFuVK/UYckA1cD9ZKDT7OYV0QEZ
         LTkZzyxrZFO4kcFHB7TzlgfksRjCrNQZYVnja+pEf5QhW4LjqCT4dBhK88KeIQV1Gs9N
         kYrGI8wdurtmCx90ICpsii+Yob4ZhPI0YMUI82svwghAPvfqgd0sTP4CtKXafabt19BY
         lThSj2fLfxLT3IJF+7MOl87r21lqm/xJxZv8CB6sUTbN/zGUOKV1MENkcA4R/YwBy7Vx
         8QF8L1gqOGHv28p2/s1gMn7DkHmE9vqj10q5aWosD3cz5HNvvTByJhAyezm1OhrO03z5
         jjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295798; x=1761900598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GNoQ9b+pWMKGwp1LvkwJ2AQeblm+m7kH1bOa6ZimqA=;
        b=TnYiUbu0gy3ZhDMCswgYv6wRFfVtIhBBshY3BR1aFxpNDNTHUPl5Ng5+k8NRUK0lLf
         KjhmeytooDeCXdrswObdKYI2y1ofyH6XDlQv4GoEsMAphdXyLFqdnP3XrZMohsNOd1ZZ
         n2oTy6oTvbIF/5eV9Ab0wX0FX5DZ7e1zfo2nMuWVmk0bGKWM6UF4CHAFppWg9e1n98px
         hk16cWOPLyqNZ4JbNlx/G7vmu5+mdxuwjSZ0SMCMBZXifU/Nuyht1fjbDMuehLo8HM6A
         sDSFu07/iYjyUXwfGlMpb+2eR9cU6tyXL2KAb1Xl/13n/vfiUQqvYPE2tKhyCrC/dBXd
         0Uig==
X-Gm-Message-State: AOJu0YyQEjoFVWBHvNBhZ3fpM3/0pV/CHL6BTpvoOg8y9XoT9hn1JGeD
	VHwxa4bqS6h/xIBjJxHGdLgpISzseeDzaFSQ6iVWvdFIx8fG/DHICyU24shcMnGovS0=
X-Gm-Gg: ASbGncvBDfWRgcA7FKf83SKHUgFxyhP2Y0cZ5Ilsru6q4dYMZPgAs+10IUPpaWKX1Yx
	Kp1xfal6YuYvI0pWl0m9rWD53LwbzdvUEKHtl10S4XKKMiYNaBubJfa/0laWpctFho0Cx2Uexjl
	ogK5RJqT3RM21/1ZGK4zyp4OM+vxH4w6zpGqNchvrZn1Dr1dU4zZWIkcuUIFduMeE3Jo4fjCSdr
	7PcDmPnyZtGWioqLYVScnrlaPAYdzXyIRvkJopTtrguEHBWiKLFeAsGrk7Icd41uoZA1UT7hy/z
	YC9pk04Uw9BXImwrVycPBQEZpgnDL8IQZMbHhCa8CpYn3ougMna/78LSzYm0ickbWGiDT/waZie
	QEKexkCmL1fp8PxLyRLwmVQfJoFNisV4lt1N9m9G7FxmxHxzykDWWZwBVQXJOeCi0gf5EeUN7JD
	VqqL0up0xDMH+zTJl1Bjko6OuH998srHqc9oM8VnIv1JY=
X-Google-Smtp-Source: AGHT+IH6BoknCNbTRxa0hJNqxLusjjl5noKRKOxTTYlUG8gRhKc1SJOuFb018eJXk3c/J5bbYpmP6g==
X-Received: by 2002:a05:600c:8b6e:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-475d30cecbemr10974045e9.37.1761295798327;
        Fri, 24 Oct 2025 01:49:58 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475d8a38038sm1911025e9.16.2025.10.24.01.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:49:57 -0700 (PDT)
Message-ID: <207072d6-4eb5-49d9-b678-e9572411b8ad@linaro.org>
Date: Fri, 24 Oct 2025 09:49:56 +0100
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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
 <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
 <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
 <24b6ce21-aaff-4ecd-8cd7-42df71cfd222@linaro.org>
 <c9f5dc86-3e48-44e3-8796-104e0434bbdc@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c9f5dc86-3e48-44e3-8796-104e0434bbdc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/2025 19:06, Vijay Kumar Tumati wrote:
> 
> On 10/23/2025 4:13 AM, Vladimir Zapolskiy wrote:
>> Hi Vijay.
>>
>> On 10/23/25 07:52, Vijay Kumar Tumati wrote:
>>>
>>> On 10/16/2025 5:27 PM, Vladimir Zapolskiy wrote:
>>>> On 10/17/25 02:53, Vijay Kumar Tumati wrote:
>>>>>
>>>>> On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
>>>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>>>>>> subsystem for Kaanapali.
>>>>>>>
>>>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     .../bindings/media/qcom,kaanapali-camss.yaml       | 494
>>>>>>> +++++++++++++++++++++
>>>>>>>     1 file changed, 494 insertions(+)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..d04c21103cfd
>>>>>>> --- /dev/null
>>>>>>> +++
>>>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>>>> @@ -0,0 +1,494 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm
>>>>>>> platforms.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: qcom,kaanapali-camss
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 16
>>>>>>> +
>>>>>>> +  reg-names:
>>>>>>> +    items:
>>>>>>> +      - const: csid0
>>>>>>> +      - const: csid1
>>>>>>> +      - const: csid2
>>>>>>> +      - const: csid_lite0
>>>>>>> +      - const: csid_lite1
>>>>>>> +      - const: csiphy0
>>>>>>> +      - const: csiphy1
>>>>>>> +      - const: csiphy2
>>>>>>> +      - const: csiphy3
>>>>>>> +      - const: csiphy4
>>>>>>> +      - const: csiphy5
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe_lite0
>>>>>>> +      - const: vfe_lite1
>>>>>>> +
>>>>>>> +  clocks:
>>>>>>> +    maxItems: 34
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    items:
>>>>>>> +      - const: camnoc_nrt_axi
>>>>>>> +      - const: camnoc_rt_axi
>>>>>>> +      - const: camnoc_rt_vfe0
>>>>>>> +      - const: camnoc_rt_vfe1
>>>>>>> +      - const: camnoc_rt_vfe2
>>>>>>> +      - const: camnoc_rt_vfe_lite
>>>>>>> +      - const: cam_top_ahb
>>>>>>> +      - const: cam_top_fast_ahb
>>>>>>> +      - const: csid
>>>>>>> +      - const: csid_csiphy_rx
>>>>>>> +      - const: csiphy0
>>>>>>> +      - const: csiphy0_timer
>>>>>>> +      - const: csiphy1
>>>>>>> +      - const: csiphy1_timer
>>>>>>> +      - const: csiphy2
>>>>>>> +      - const: csiphy2_timer
>>>>>>> +      - const: csiphy3
>>>>>>> +      - const: csiphy3_timer
>>>>>>> +      - const: csiphy4
>>>>>>> +      - const: csiphy4_timer
>>>>>>> +      - const: csiphy5
>>>>>>> +      - const: csiphy5_timer
>>>>>>> +      - const: gcc_hf_axi
>>>>>>> +      - const: qdss_debug_xo
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe0_fast_ahb
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe1_fast_ahb
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe2_fast_ahb
>>>>>>> +      - const: vfe_lite
>>>>>>> +      - const: vfe_lite_ahb
>>>>>>> +      - const: vfe_lite_cphy_rx
>>>>>>> +      - const: vfe_lite_csid
>>>>>>
>>>>>> The list of 'clock-names' values is not alphanumerically sorted.
>>>>>>
>>>>>>> +
>>>>>>> +  interrupts:
>>>>>>> +    maxItems: 16
>>>>>>> +  interrupt-names:
>>>>>>
>>>>>> Missing empty line to separate properties.
>>>>>>
>>>>>>> +    items:
>>>>>>> +      - const: csid0
>>>>>>> +      - const: csid1
>>>>>>> +      - const: csid2
>>>>>>> +      - const: csid_lite0
>>>>>>> +      - const: csid_lite1
>>>>>>> +      - const: csiphy0
>>>>>>> +      - const: csiphy1
>>>>>>> +      - const: csiphy2
>>>>>>> +      - const: csiphy3
>>>>>>> +      - const: csiphy4
>>>>>>> +      - const: csiphy5
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe_lite0
>>>>>>> +      - const: vfe_lite1
>>>>>>> +
>>>>>>> +  interconnects:
>>>>>>> +    maxItems: 2
>>>>>>> +
>>>>>>> +  interconnect-names:
>>>>>>> +    items:
>>>>>>> +      - const: ahb
>>>>>>> +      - const: hf_0_mnoc
>>>>>>
>>>>>> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml
>>>>>> etc.
>>>>>>
>>>>>>> +
>>>>>>> +  iommus:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  power-domains:
>>>>>>> +    items:
>>>>>>> +      - description:
>>>>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>>>>>> Controller.
>>>>>>> +      - description:
>>>>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>>>>>> Controller.
>>>>>>> +      - description:
>>>>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>>>>>> Controller.
>>>>>>> +      - description:
>>>>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>>>>>> Controller.
>>>>>>> +
>>>>>>> +  power-domain-names:
>>>>>>> +    items:
>>>>>>> +      - const: tfe0
>>>>>>> +      - const: tfe1
>>>>>>> +      - const: tfe2
>>>>>>
>>>>>> Please remove all 'tfeX' power domains, they are not going to be
>>>>>> utilized
>>>>>> any time soon.
>>>>>>
>>>>>> When 'power-domains' list is just a single Titan GDSC,
>>>>>> 'power-domain-names'
>>>>>> property is not needed.
>>>>>>
>>>>>>> +      - const: top
>>>>>>> +
>>>>>>> +  vdda-pll-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>>>>>> +
>>>>>>> +  vdda-phy0-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>>> +
>>>>>>> +  vdda-phy1-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>>> +
>>>>>>> +  vdda-phy2-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>>> +
>>>>>>> +  vdda-phy3-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>>> +
>>>>>>> +  vdda-phy4-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>>> +
>>>>>>> +  vdda-phy5-supply:
>>>>>>> +    description:
>>>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>>>
>>>>>> What is the difference between vdda-phyX-supply properties, why do 
>>>>>> you
>>>>>> need so many of them, when their descriptions say they are all the
>>>>>> same?
>>>>> Each of these supply power to a specific CSIPHY and could be different
>>>>> based on the board architecture. But I agree that the description 
>>>>> should
>>>>> probably capture that than just relying on the name.
>>>>>>
>>>>>>> +  ports:
>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>> +
>>>>>>> +    description:
>>>>>>> +      CSI input ports.
>>>>>>> +
>>>>>>> +    properties:
>>>>>>> +      port@0:
>>>>>>
>>>>>> Please use
>>>>>>
>>>>>>       patternProperties:
>>>>>>         "^port@[0-3]$":
>>>>>>
>>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>>> +        unevaluatedProperties: false
>>>>>>> +        description:
>>>>>>> +          Input port for receiving CSI data on CSI0.
>>>>>>> +
>>>>>>> +        properties:
>>>>>>> +          endpoint:
>>>>>>> +            $ref: video-interfaces.yaml#
>>>>>>> +            unevaluatedProperties: false
>>>>>>> +
>>>>>>> +            properties:
>>>>>>> +              clock-lanes:
>>>>>>> +                maxItems: 1
>>>>>>
>>>>>> Please remove 'clock-lanes' property, it is non-configurable, 
>>>>>> redundant
>>>>>> and tends to store some irrelevant value.
>>>>>>
>>>>>>> +
>>>>>>> +              data-lanes:
>>>>>>> +                minItems: 1
>>>>>>> +                maxItems: 4
>>>>>>> +
>>>>>>> +              bus-type:
>>>>>>> +                enum:
>>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>>> +
>>>>>>> +            required:
>>>>>>> +              - clock-lanes
>>>>>>
>>>>>> The 'clock-lanes' property is expected to be removed.
>>>>>>
>>>>>>> +              - data-lanes
>>>>>>> +
>>>>>>> +      port@1:
>>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>>> +        unevaluatedProperties: false
>>>>>>> +        description:
>>>>>>> +          Input port for receiving CSI data on CSI1.
>>>>>>> +
>>>>>>> +        properties:
>>>>>>> +          endpoint:
>>>>>>> +            $ref: video-interfaces.yaml#
>>>>>>> +            unevaluatedProperties: false
>>>>>>> +
>>>>>>> +            properties:
>>>>>>> +              clock-lanes:
>>>>>>> +                maxItems: 1
>>>>>>> +
>>>>>>> +              data-lanes:
>>>>>>> +                minItems: 1
>>>>>>> +                maxItems: 4
>>>>>>> +
>>>>>>> +              bus-type:
>>>>>>> +                enum:
>>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>>> +
>>>>>>> +            required:
>>>>>>> +              - clock-lanes
>>>>>>> +              - data-lanes
>>>>>>> +
>>>>>>> +      port@2:
>>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>>> +        unevaluatedProperties: false
>>>>>>> +        description:
>>>>>>> +          Input port for receiving CSI data on CSI2.
>>>>>>> +
>>>>>>> +        properties:
>>>>>>> +          endpoint:
>>>>>>> +            $ref: video-interfaces.yaml#
>>>>>>> +            unevaluatedProperties: false
>>>>>>> +
>>>>>>> +            properties:
>>>>>>> +              clock-lanes:
>>>>>>> +                maxItems: 1
>>>>>>> +
>>>>>>> +              data-lanes:
>>>>>>> +                minItems: 1
>>>>>>> +                maxItems: 4
>>>>>>> +
>>>>>>> +              bus-type:
>>>>>>> +                enum:
>>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>>> +
>>>>>>> +            required:
>>>>>>> +              - clock-lanes
>>>>>>> +              - data-lanes
>>>>>>> +
>>>>>>> +      port@3:
>>>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>>>> +        unevaluatedProperties: false
>>>>>>> +        description:
>>>>>>> +          Input port for receiving CSI data on CSI3.
>>>>>>> +
>>>>>>> +        properties:
>>>>>>> +          endpoint:
>>>>>>> +            $ref: video-interfaces.yaml#
>>>>>>> +            unevaluatedProperties: false
>>>>>>> +
>>>>>>> +            properties:
>>>>>>> +              clock-lanes:
>>>>>>> +                maxItems: 1
>>>>>>> +
>>>>>>> +              data-lanes:
>>>>>>> +                minItems: 1
>>>>>>> +                maxItems: 4
>>>>>>> +
>>>>>>> +              bus-type:
>>>>>>> +                enum:
>>>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>>>> +
>>>>>>> +            required:
>>>>>>> +              - clock-lanes
>>>>>>> +              - data-lanes
>>>>>>> +
>>>>>>> +required:
>>>>>>> +  - compatible
>>>>>>> +  - reg
>>>>>>> +  - reg-names
>>>>>>> +  - clocks
>>>>>>> +  - clock-names
>>>>>>> +  - interrupts
>>>>>>> +  - interrupt-names
>>>>>>> +  - interconnects
>>>>>>> +  - interconnect-names
>>>>>>> +  - iommus
>>>>>>> +  - power-domains
>>>>>>> +  - power-domain-names
>>>>>>> +  - vdda-pll-supply
>>>>>>> +  - vdda-phy0-supply
>>>>>>> +  - vdda-phy1-supply
>>>>>>> +  - vdda-phy2-supply
>>>>>>> +  - vdda-phy3-supply
>>>>>>> +  - vdda-phy4-supply
>>>>>>> +  - vdda-phy5-supply
>>>>>>
>>>>>> Please exclude supplies from the list of required properties.
>>>>> One of these supplies is required based which PHY the use case is 
>>>>> being
>>>>> run. Can you please advise how to handle that? Thanks.
>>>>
>>>> 1. Please rename all of them, reference to qcom,x1e80100-camss.yaml,
>>>> qcom,qcm2290-camss.yaml or published on linux-media
>>>> qcom,sm8650-camss.yaml
>>>>
>>>> 2. Remove all of them from the list of required properties, and in a
>>>> board
>>>> specific dts file add only the neccesary ones, that's it.
>>>>
>>> Thanks. We will try to follow the same for rev3. Just a caveat though.
>>> If, for instance, two CSIPHYs have different 1.2 supplies and they are
>>> required to be operated concurrently, it may be is a problem? as we can
>>
>> It should not be a problem, you can add two regulators, and it's fine,
>> anyway all of them shall be optional properties, because it's unknown in
>> advance which ones are actually needed.
>>
>>> put only one of those in the board specific DTS for the 1.2 supply node
>>> (ex: vdd-csiphy-1p2 in SM2290). Is it not? However, if we don't have
>>> such a use case requirement on the upstream may be it's OK. Thank you.
>>
>> Link to the published SM8650 CAMSS dt bindings, please follow this model:
>> https://lore.kernel.org/linux-media/20251017031131.2232687-2- 
>> vladimir.zapolskiy@linaro.org/
>>
>> Please note the chosen naming scheme, when the supply property names
>> follow the SoC pad namings one to one.
>>
> Thanks @Vladimir. Yes, this make sense if all of the reference and 
> customer boards follow the internal power grid design. But agreed that 
> this is all board specific. Please let us know your thoughts on the v3 
> bindings for KNP. They mimic the existing 2290 and x1e80100 bindings. 
> Thank you.

I'd expect to see both the 1p2 and 0p8 for each PHY listed in your bindings.

Without looking at the KNP docs it would be very strange to find the 
PHYs share one of these power-rails as an external input from the PCB.

Even if they do, the established pattern for bindings is to describe 
each as an individual rail.

Also including the voltage level is

- More consistent with other PHY bindings
- Information that is actually useful when reading a binding
   or aligning a binding to a schematic.

---
bod

