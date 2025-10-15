Return-Path: <linux-i2c+bounces-13548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0706FBE087C
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 21:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB85B586473
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 19:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE70C30E0EC;
	Wed, 15 Oct 2025 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DEquhA0L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174030C628
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 19:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760557518; cv=none; b=TD9Fa/hps3xYVfSHEBHX+38Js9z7ZoTdZhVMz5obACJo8r0aqmjLqlZPN8vizWCidnvKUdR58BrJY1sqZVURES030SB8eOtdZTpgSsiduuMUBCISEtdykiqQP3cSM/vPJeIs/IOXSYiacChKsffZb4ECwbdgzJL8G3dolqUoCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760557518; c=relaxed/simple;
	bh=7INo0UQfodm22LeCZkCIUX6yVwJ6OFu4819Yknc9llY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJCByhyMrGDmjhuNacnVof6Etdzhd4Ey4hum0SXgevKVq4DoHh/N0u0dwLXVByNsmn9DVlgaxeYyFjdEz3BDniUV30+bApwhR3EfO6rwYVfO3/ASSFyzel8RoMTjf92q+j+DTFa09+nFkQRAbpvNN7HNsjiEZ+MwMRs8ShI5ad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DEquhA0L; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so484139e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 12:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760557513; x=1761162313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EUhUMNy9sSk7xpGtAScrLX6U+j230P5/UEPvokxNcU=;
        b=DEquhA0LHiBOI/7WVDwuctzrWvfHeRnWYIzm3jb/q24uVeWPK9ATwbEkmrbgEvApkA
         yKF6+Ah33VWpPfzPr/XHFtngoKfHc0vXxUlT0k+plyuraEb2U7XpdV1b8VLeDpTODk2e
         JRmRfcynTcbpVU6LvePewxVdHaXwkOpKwXF2/UrnRiul83NUnyUorNMx8bnra5Q49qB+
         9aK1VljGLzCjSMGJ2zA4k20fMv+F1LpzVfyOFNyh7c0CaZnQd1NoISfwF0YxVv8fqAVs
         TGyjhwvblx7c2z+s0Bxj2Piq/7vIOhrw8okXci+zwiPdU+pwl9E4LtqPb8PZCxdwXqbE
         ozww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557513; x=1761162313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6EUhUMNy9sSk7xpGtAScrLX6U+j230P5/UEPvokxNcU=;
        b=tcwA5w70q1mHb7wl9j7HBxkE3+q0OOn4S4pRaEHQtNCILWdU9cX0qOnqiowaSEuWB9
         YLV2XWuXizfRRDxWlwPbDKtphyRUDZorBiMVRqiASesBqp//vXXl7ks8IMEqhG8lGxXS
         FEHlBU3hdmt3IfT5Dg7l387zv6AsTZ4kEm1NfU+E4t3m+q8/ROXOp1iHKzERUHWxiyMw
         z5uA09iayL9tngy9HqAG9W6E7P2IQV4GJQDwddilV73MTK5uoy2vCMq8YgM8fjkaQpdU
         6yA3+r/VN4Kyf4aib43YLOny9rv3BhiydSeddESFpgS0th3b9Ah7s6pDG8xKCVT6afm5
         Wjcw==
X-Gm-Message-State: AOJu0YzSGRBvGpeA88Xu8qzsqffZidPK+r6GXH6BUBsGbPexdljNpt85
	Bw6vS43yrDU5Q3hBFj3SpApnx4DCuyxcy8HSWZmAV+7EoDXSLzNZ+pLAkuVVkUlz4A0=
X-Gm-Gg: ASbGncsQIzrdudim2IStpCfBfnj5ecKoFN0w9ZsgleOUFklLx/wvmrUxOz2GPCRuDqU
	xv6g7C2/0APr4ldnC5F2QYsIQPvw2tzJsh/3WNeBCfRVd8ougsNIZOITaG7RPvoZZhfJI9xLp1G
	Za04cs8Dl+wtEaP03fs02mByMeLhB/6Pb/MIZY8nVsmvD5b1ZrrXzhcSQ1N4MeGqoa19UyKG6IA
	eb7rKqRIYRI2DGD7SqjhJwV8cRTskmXMI3RddglKDSRRkOJNSNIypYwsMnEzSOn7Ly9y7tIk7Ij
	X1zyWrA4b0yPAXqOMPZH+ddDZ8WHhWcDn6JY4I3IBW3/zIsfe2HfQjefk0BYNeyy/wl1Shwsfl8
	9kNgLXD0DzrPWHOsFjKmPHAMJKhPPkngpzzjRGbTPKzoP3lYS+RRxWeb07NrIeWFxfereuY6fwx
	LR+A4wz7F5SIEDcu9tt+Pb6MTos10oz/XBzt2426RZC5/dGKW9Yu8cC3d6SqBX0y+pui9asA==
X-Google-Smtp-Source: AGHT+IFHi/UfIWMaNMRtGg3FA6DqVP5Z8FHq9OQ8JGJi0f4OZ+cbK48KnBjzGg1sVHwxVE7b3vPzzQ==
X-Received: by 2002:a05:6512:31cd:b0:57d:720:9eb0 with SMTP id 2adb3069b0e04-591c9056fdcmr845835e87.10.1760557513348;
        Wed, 15 Oct 2025 12:45:13 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e5790sm6477180e87.19.2025.10.15.12.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:45:12 -0700 (PDT)
Message-ID: <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
Date: Wed, 15 Oct 2025 22:45:11 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 05:56, Hangxiang Ma wrote:
> Add bindings for qcom,kaanapali-camss in order to support the camera
> subsystem for Kaanapali.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,kaanapali-camss.yaml       | 494 +++++++++++++++++++++
>   1 file changed, 494 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..d04c21103cfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,494 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    maxItems: 16
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 34
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: camnoc_rt_vfe0
> +      - const: camnoc_rt_vfe1
> +      - const: camnoc_rt_vfe2
> +      - const: camnoc_rt_vfe_lite
> +      - const: cam_top_ahb
> +      - const: cam_top_fast_ahb
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: gcc_hf_axi
> +      - const: qdss_debug_xo
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid

The list of 'clock-names' values is not alphanumerically sorted.

> +
> +  interrupts:
> +    maxItems: 16
> +  interrupt-names:

Missing empty line to separate properties.

> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0_mnoc

Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml etc.

> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description:
> +          TFE0 GDSC - Thin Front End, Global Distributed Switch Controller.
> +      - description:
> +          TFE1 GDSC - Thin Front End, Global Distributed Switch Controller.
> +      - description:
> +          TFE2 GDSC - Thin Front End, Global Distributed Switch Controller.
> +      - description:
> +          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: tfe0
> +      - const: tfe1
> +      - const: tfe2

Please remove all 'tfeX' power domains, they are not going to be utilized
any time soon.

When 'power-domains' list is just a single Titan GDSC, 'power-domain-names'
property is not needed.

> +      - const: top
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
> +
> +  vdda-phy0-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy1-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy2-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy3-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy4-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.
> +
> +  vdda-phy5-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to PHY core block.

What is the difference between vdda-phyX-supply properties, why do you
need so many of them, when their descriptions say they are all the same?

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      port@0:

Please use

     patternProperties:
       "^port@[0-3]$":

> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1

Please remove 'clock-lanes' property, it is non-configurable, redundant
and tends to store some irrelevant value.

> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes

The 'clock-lanes' property is expected to be removed.

> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI1.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI2.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data on CSI3.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdda-pll-supply
> +  - vdda-phy0-supply
> +  - vdda-phy1-supply
> +  - vdda-phy2-supply
> +  - vdda-phy3-supply
> +  - vdda-phy4-supply
> +  - vdda-phy5-supply

Please exclude supplies from the list of required properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>

Please keep the list of included headers sorted alphabetically.

> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: isp@9253000 {
> +            compatible = "qcom,kaanapali-camss";
> +
> +            reg = <0x0 0x09253000 0x0 0x5e80>,
> +                  <0x0 0x09263000 0x0 0x5e80>,
> +                  <0x0 0x09273000 0x0 0x5e80>,
> +                  <0x0 0x092d3000 0x0 0x3880>,
> +                  <0x0 0x092e7000 0x0 0x3880>,
> +                  <0x0 0x09523000 0x0 0x2000>,
> +                  <0x0 0x09525000 0x0 0x2000>,
> +                  <0x0 0x09527000 0x0 0x2000>,
> +                  <0x0 0x09529000 0x0 0x2000>,
> +                  <0x0 0x0952b000 0x0 0x2000>,
> +                  <0x0 0x0952d000 0x0 0x2000>,
> +                  <0x0 0x09151000 0x0 0x20000>,
> +                  <0x0 0x09171000 0x0 0x20000>,
> +                  <0x0 0x09191000 0x0 0x20000>,
> +                  <0x0 0x092dc000 0x0 0x1300>,
> +                  <0x0 0x092f0000 0x0 0x1300>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "csiphy5",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY5_CLK>,
> +                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "camnoc_rt_vfe0",
> +                          "camnoc_rt_vfe1",
> +                          "camnoc_rt_vfe2",
> +                          "camnoc_rt_vfe_lite",
> +                          "cam_top_ahb",
> +                          "cam_top_fast_ahb",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "csiphy5",
> +                          "csiphy5_timer",
> +                          "gcc_hf_axi",
> +                          "qdss_debug_xo",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "csiphy5",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_0_mnoc";
> +
> +            iommus = <&apps_smmu 0x1c00 0x00>;
> +
> +            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
> +                            <&camcc CAM_CC_TFE_1_GDSC>,
> +                            <&camcc CAM_CC_TFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "tfe0",
> +                                 "tfe1",
> +                                 "tfe2",
> +                                 "top";
> +
> +            vdda-pll-supply = <&vreg_l1d_1p2>;
> +            vdda-phy0-supply = <&vreg_l3i_0p8>;
> +            vdda-phy1-supply = <&vreg_l3i_0p8>;
> +            vdda-phy2-supply = <&vreg_l3d_0p8>;
> +            vdda-phy3-supply = <&vreg_l3i_0p8>;
> +            vdda-phy4-supply = <&vreg_l3d_0p8>;
> +            vdda-phy5-supply = <&vreg_l3i_0p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        clock-lanes = <7>;
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir

