Return-Path: <linux-i2c+bounces-5180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3791949C84
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 01:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC9D31C2166D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 23:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87FF176AAD;
	Tue,  6 Aug 2024 23:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSn98dhR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE795166F14;
	Tue,  6 Aug 2024 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722988781; cv=none; b=kLpud/sEDU/rdPIbL0ixYAMQ2ALJ0MgUJlgLh3K0vweHL/07uTeAyZhwiT1yiBJlth7WcfH4vpi07CIX7cdqPmkxf5dAMEAACN2EJ9ALShir9LRX88YcKwIzGf+QuzIJQ5k1Ot0hwb9NOTLvKt7ECWF5TEGNL67G3Osrb+WlUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722988781; c=relaxed/simple;
	bh=F9HB9+gELoDqyMcQyAGicOaQXm4xa9A8ZvMVUU1d1UM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOKLou61iPLf9LZ4Avi0KKLQ5sgpAgydjhZq+60lymP6xIEjXsvAp2AwWUaFCOg/LOtE52iWGXrMly/WaBBmfCt5NhxnMSFTAmY1inV/xqeuBZutaWrIVvtl3dnUPlqn63DsrvKNrxCkUtNRfzXbKUQ3CEUsKe4xRWKU4BzDoxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSn98dhR; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-826fee202d3so428134241.1;
        Tue, 06 Aug 2024 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722988779; x=1723593579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQWOJiq4ozSo6+WgyCWHII+hN/N61qd/MPUPQQGGWfI=;
        b=mSn98dhRUMvae7MiSH4BRzuMVBAbFnCMms+xs3PJPljIT1UV9Q0jjTViK887DHGHDo
         YA/PcO5hwMPZ5hjHXCjUyqknVwAAUmtIU2KJpla404F6o2zWUcZbXxQj3RURzWRcM9x4
         lN5jUS+H/5G7VCe3k+arDjHY311xiOEcK9YMUlpuvort+XvzxhHTvqksMZEYxbA19Phr
         sIwCXy07cVUaMKeycTYV7H0RoOI7oSWL4KfpR+I5zKPLMEQ4eJQIv7sJBMNnJCYx1orp
         M4f+Qsdy9j+MrBUVW9Vp5vjR6IouoTTWXTIAWfJ5brm8GKF9esHNCAODLwHFKCDmHbP3
         5PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722988779; x=1723593579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQWOJiq4ozSo6+WgyCWHII+hN/N61qd/MPUPQQGGWfI=;
        b=XM1w+pC9TBW5Ms05t9SkY9s4mNFykmEcsTJFaAcWs8tLbgumBHX7T150hPL62WrsW0
         VhUE5z0EDlM9yHILiWiAiz6DgdLOwi5IgZcLSz9EjDJewI9uVpyw65hP+X8B/e5STEjf
         ii7JcpKNwsOfJ66c5DkCAYqdbMGowgIWkXbGx6GPXUnt5uW+l8W205Et8Ym7q9DBYvtp
         TvseJZ1ZVlT74oPB7CReC5BglRgu9Rhr37d6w7FBzvjCNd2Lmo1dlJz8thv2qaqCxByf
         kUF/SPCex/+5YOixGwEXZCI+uvLXfQNEPiemRjaYOV2XMhHPWCu6bAe0DbqMq6FKrULg
         VRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUltT4iDgOzPLnHCBpfYs9rlAKiv8IxViYQK61S16PwxleSacYqal98AfxJQDBgA3kN4QgZYzdr4rskywxtPhCLEE3Sw4BWG5fMVNOaYRHXUWtKawApimap+2hM7iyOdU2tijGeSgeO/rWdytG0SmBY03GyfxTtky3GP25vpSxQ8FL/HQA4tnWNEKw2osZ+Pss6GdmemcpUfmiIWUKT6upkIw==
X-Gm-Message-State: AOJu0YxMIYaBWvtGvcOZY3SbHuFgQm9SgAvhro9OlVRQDO0jd4igiixX
	hdzPTIMsZVoQzif/8q/b0wcihfcwfraIeXIHJfIUASZd2KSq3xOA
X-Google-Smtp-Source: AGHT+IGa7103L8yy46EmGZh4u7uNzn5KPBfIoZuhVegS84mQWii4UkKirqkrCuo1OhDv/tp0XjxNpw==
X-Received: by 2002:a05:6102:cc8:b0:48f:461c:ab86 with SMTP id ada2fe7eead31-4945bde73admr23791103137.12.1722988778557;
        Tue, 06 Aug 2024 16:59:38 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785e57adsm8608085a.50.2024.08.06.16.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 16:59:38 -0700 (PDT)
Date: Tue, 6 Aug 2024 19:59:36 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: media: camss: Add qcom,sdm670-camss
Message-ID: <ZrK46EnInqP0oKBX@radian>
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806224219.71623-9-mailingradian@gmail.com>

On Tue, Aug 06, 2024 at 06:42:23PM -0400, Richard Acayan wrote:
> Add the camera subsystem for the Snapdragon 670.
>
> Adapted from SC8280XP camera subsystem.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
>  1 file changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..543fad1b5cd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,353 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)

Oops, forgot to correct this.

Don't worry if you have read the bindings already. It can be used under
BSD-2-Clause.

> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SDM670 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sdm670-camss
> +
> +  clocks:
> +    maxItems: 33
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csi0
> +      - const: csi0_src
> +      - const: csi1
> +      - const: csi1_src
> +      - const: csi2
> +      - const: csi2_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: gcc_camera_ahb
> +      - const: gcc_camera_axi
> +      - const: slow_ahb_src
> +      - const: soc_ahb
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_src
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_src
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_src
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite
> +
> +  iommus:
> +    maxItems: 4
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
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY0.
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
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY1.
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
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY2.
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
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: vfe0
> +      - const: csiphy0
> +      - const: vfe1
> +      - const: csiphy1
> +      - const: vfe_lite
> +      - const: csiphy2
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
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

Include directives are missing and will be added next version.

> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss {
> +            compatible = "qcom,sdm670-camss";
> +
> +            reg = <0 0x0ac65000 0 0x1000>,
> +                  <0 0x0ac66000 0 0x1000>,
> +                  <0 0x0ac67000 0 0x1000>,
> +                  <0 0x0acaf000 0 0x4000>,
> +                  <0 0x0acb3000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x4000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acc4000 0 0x4000>,
> +                  <0 0x0acc8000 0 0x1000>;
> +            reg-names = "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "vfe0",
> +                        "csid0",
> +                        "vfe1",
> +                        "csid1",
> +                        "vfe_lite",
> +                        "csid2";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
> +                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +                     <&camcc CAM_CC_SOC_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK_SRC>,
> +                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK_SRC>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK_SRC>;
> +            clock-names = "camnoc_axi",
> +                          "cpas_ahb",
> +                          "cphy_rx_src",
> +                          "csi0",
> +                          "csi0_src",
> +                          "csi1",
> +                          "csi1_src",
> +                          "csi2",
> +                          "csi2_src",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy0_timer_src",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy1_timer_src",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy2_timer_src",
> +                          "gcc_camera_ahb",
> +                          "gcc_camera_axi",
> +                          "slow_ahb_src",
> +                          "soc_ahb",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_src",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_src",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_src";
> +
> +            iommus = <&apps_smmu 0x808 0x0>,
> +                     <&apps_smmu 0x810 0x8>,
> +                     <&apps_smmu 0xc08 0x0>,
> +                     <&apps_smmu 0xc10 0x8>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            vdda-phy-supply = <&vreg_l1a_1p225>;
> +            vdda-pll-supply = <&vreg_l8a_1p8>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        reg = <0>;
> +                        clock-lanes = <7>;
> +                        data-lanes = <0 1 2 3>;
> +                        remote-endpoint = <&front_sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.46.0
>

