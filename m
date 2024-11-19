Return-Path: <linux-i2c+bounces-8047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0B9D283C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D281F22A2E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6871CEAC4;
	Tue, 19 Nov 2024 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2YHpt6C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8641CEAAF
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732026854; cv=none; b=EldgMwMOMmINM9SIJfTa6EIAY17f2ZJ/QEW7oKMkLUNZvFHUciKyNSf5eBcjq3hicU02DEyQSgNa3GIeMB+g27k86J4AwTjaQXAWSkNCjmkCzfYBz4S04LFa1P4reDSxgncK2yP3Kdd6VPase0lHpDuE5CX8eKCJ6e9kMKIpMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732026854; c=relaxed/simple;
	bh=bipZAMPN4f5Pzi2APO7jD3Th0zrTU4/m7fbrlXox9qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRSH3hE2SN4BxMYyLQm7zE8Qp4Ia+YsN/VLy4gdz3kxFrN8END0doaaoVNP/0FM+TreMZj6qNGvAxdNH9p+oxQCN+S/gRFU0uliRQ3S77Nx6igdEFYtWezHiNVJAFJjLrNVx2Xlcpx71Wp83AUHbdHQPv3JD4q0E1SYyfo+hko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2YHpt6C; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-53dadfbecd0so561202e87.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 06:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732026851; x=1732631651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au3cRhjTo/GZ4TjBpZNrwmwrLP1CL29kjZUFonrhCyg=;
        b=z2YHpt6CgRKVzcjDK5jB2akf3vJCQaTbeBITG1s+fBwgSRR91TIdzcH7lAuAU+T/i5
         jC6NApxRxEOmWnIZHU3+OJe76SL2R4HV3E3ACIO6X++oW5TO+gbYHaeUb5mF0ZMDLRHz
         RbW1l5nl5wrf88uVgMjfZ5Pc5F2srRDEmm0qnN95/+9vdWlW/0nfM6KtdLzidvgguDmb
         a3lYfhXeUmijFgyBw/zENd6nWUK08kvOltXUdHZhJMZDnK4lETmBgBUgSeTrGvkafs8h
         RcavDhP0XZdrxwqLH/uDGABUQTz1cwKR+SYXoG6dITnp3fdSnwj+S9ZKbDGq7rN6ualS
         +0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026851; x=1732631651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Au3cRhjTo/GZ4TjBpZNrwmwrLP1CL29kjZUFonrhCyg=;
        b=FaL3DWIP/ARYT5Bt7sC5cvqXK2cDOYJ6NFOOqJTQG2jhi335ACGXCR6ckcu1RnD9Jd
         UimVuuN2P5SEChInSK0bWNQgOYzefCKgUVxote+EFmJxAYbjKzAzC2cwP3K4j6Ny5a4w
         i+SEHPJ6K4nFRUyllLAcppBS8RXc9vppa4IoocT3LJRAqgEGu54TZ3ZlrecZ4XC9TGSL
         lbXNLk3mI7TL/aIurTUcPmLL13yvs40uUYOVESsXYA757coH/aut+i4wKk3xZJME6xQ0
         6l2+qBULKcXQQgyPk+V4jy5VpjmHe++8Fd2QUNus+Unv4zSOsWVyTfQ8ErF7NYJ8nqCR
         yloA==
X-Gm-Message-State: AOJu0YxJo8m9SxZ41S9ZVSSwjWdv11DAdOhWf1+Rj3COJuBCYTFdndAh
	GPbubhy+MaqCpjTORkfA4YoJEGlX3Olrsj4B3QdPOEZrE47UHpJRAedRTREMygw=
X-Google-Smtp-Source: AGHT+IGNtqwkHmxmTjpJ1SM02ew4GjOqWLG6Ml8RNfjwSSwJjJn3KJTzikM0oDJGal4n2jdq8ZeZuw==
X-Received: by 2002:a05:6512:2811:b0:53d:7ced:5e07 with SMTP id 2adb3069b0e04-53dab3b996cmr2350623e87.14.1732026850537;
        Tue, 19 Nov 2024 06:34:10 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbee6f9c3sm140488e87.152.2024.11.19.06.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 06:34:10 -0800 (PST)
Message-ID: <92f3f608-1ca6-4c41-9406-28c7ad589872@linaro.org>
Date: Tue, 19 Nov 2024 16:34:09 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: Add qcom,x1e80100-camss binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-2-54075d75f654@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-2-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

please find a few review comments below.

On 11/19/24 15:10, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 354 +++++++++++++++++++++
>   1 file changed, 354 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ca2499cd52a51e14bad3cf8a8ca94c9d23ed5030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -0,0 +1,354 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,x1e80100-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-camss
> +
> +  clocks:
> +    maxItems: 29
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_rt_axi
> +      - const: camnoc_nrt_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe_lite
> +      - const: cphy_rx_clk_src
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer

What does happen to csiphy3? Could it fall through the cracks?

> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 13
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  iommus:
> +    maxItems: 13
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_mnoc
> +      - const: cam_sf_mnoc
> +      - const: cam_sf_icp_mnoc
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[03]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
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
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +  reg:
> +    maxItems: 12
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_wrapper
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe0
> +      - const: vfe1
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.2V regulator supply to PHY refclk pll block.

I believe it's very unlikely that the SoC pads are called like this,
as we discussed it in the recent past.

Please rename the properties to reflect the names inherited from
the actual hardware.

> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - ports
> +  - power-domains
> +  - power-domain-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@ac62000 {
> +            compatible = "qcom,x1e80100-camss";
> +
> +            reg = <0 0x0acb7000 0 0x2000>,

As usual, and at no surprise, there is an immediate problem with
the incorrespondent unit address.

> +                  <0 0x0acb9000 0 0x2000>,
> +                  <0 0x0acbb000 0 0x2000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x1000>,
> +                  <0 0x0ace6000 0 0x1000>,
> +                  <0 0x0ace8000 0 0x1000>,
> +                  <0 0x0acec000 0 0x4000>,
> +                  <0 0x0acc7000 0 0x2000>,
> +                  <0 0x0accb000 0 0x2000>,
> +                  <0 0x0ac62000 0 0x2a00>,
> +                  <0 0x0ac71000 0 0x2a00>;
> +
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_wrapper",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy4",
> +                        "vfe_lite0",
> +                        "vfe_lite1",
> +                        "vfe0",
> +                        "vfe1";
> +
> +            vdda-phy-supply = <&csiphy0_vdda_phy_supply>;
> +            vdda-pll-supply = <&csiphy0_vdda_pll_supply>;
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy4",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +            clock-names = "camnoc_rt_axi",
> +                          "camnoc_nrt_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe_lite",
> +                          "cphy_rx_clk_src",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            iommus = <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
> +                     <&apps_smmu 0x860 0x60>,
> +                     <&apps_smmu 0x1800 0x60>,
> +                     <&apps_smmu 0x1820 0x60>,
> +                     <&apps_smmu 0x1840 0x60>,
> +                     <&apps_smmu 0x1860 0x60>,
> +                     <&apps_smmu 0x18a0 0x00>,
> +                     <&apps_smmu 0x18e0 0x00>,
> +                     <&apps_smmu 0x1980 0x20>,
> +                     <&apps_smmu 0x1900 0x00>,
> +                     <&apps_smmu 0x19a0 0x20>;
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
> +            interconnect-names = "cam_ahb",
> +                                 "cam_hf_mnoc",
> +                                 "cam_sf_mnoc",
> +                                 "cam_sf_icp_mnoc";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;

It's unclear why #address-cells/#size-cells are needed here.

> +
> +                    csiphy_ep0: endpoint {
> +                        clock-lanes = <7>;

As it's known, there is no lane 7.

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

