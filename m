Return-Path: <linux-i2c+bounces-5620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 164909599F2
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 13:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902E51F21404
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 11:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02B91531E7;
	Wed, 21 Aug 2024 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+GM/MJY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A065B1D12FA
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724236819; cv=none; b=P1mernG4MlxrVzgvq26OlymU+vdTjhpa38G1RQQuadny8B+1u483bkEXAu+i4ueKuVCkKsVLUoN+9Wa5BSiylpi745+fSrwzkp0c7eeVSSgrGJDsX+SFqYw3zEdI1F5ZSeb+U2Rdu5EiXAazaRIs0d3KIjOGsIw4KdEq4dXm3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724236819; c=relaxed/simple;
	bh=XbQqdlw1XAuWNC706qvw25yoxbybOdDlECQ0raBaDDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LZ2V7hLXisZR+mV8Xlc6/AlfOxhXCKPXCYs6OJ19Vb/Ppx9Sr5bNrWUzfISicpgc+K3ysT0p35A1tg0uAZVueeUqy3X7a1QjvAcpObCvTu4lY8FRHkPYw1sMMuBFsSijBHR0B5hjNujirtFO80PpG/EVo+cGtJ42FlSIlkZ8wYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+GM/MJY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efcbfacb9so122212e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724236816; x=1724841616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/++U4mPKnj6MNxdEJdX+/2RmhuDG+i6GAU351H972u0=;
        b=n+GM/MJYsq5TYwFaI9FjVDthIRKjbu9Y4qu8SIvdv/ylWODtp0m+0LZCl9gZQGflvZ
         yLteycnGPbgwGOy4szK8aSad2FuCDRv/ePfL3QU/B0zH1y3utX6BRU+e1NJ0jvIKIDLv
         3lRbU/xgGw6iLFLgRsGOn36NvE5xy2bpH4l3yt/loC25whBatTD+CFE5EEJBWQVpbccd
         ng8sKvFPJoco5legH6pJ/HqzqDnK3mYam12fnXyf35v4mSzHuYTZEEJEy4BvfOIxtVMj
         y2tI/BCBet15VvcMvCIA0UpPVWRTglBy1fkWcAdnIub4uJ2eL6u0+aW/YroK647+bAfK
         eSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724236816; x=1724841616;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/++U4mPKnj6MNxdEJdX+/2RmhuDG+i6GAU351H972u0=;
        b=btEXAz4p3UG4QgGP1rwtfxn6TFDsRo4jN80LhZFfhy1y24MOPQjXxWNf8YJHVw+Pzj
         toAUEqgZ2aOnQkJ0ilrhmzLz6difg2nW1HYIk1coM6pbmWVvlBS+B1ly1kSKLm+WumxJ
         9WOGUZcfURONf0+OtbwSXyJDn5rt8jsX9K0Ky/vMU7qzZ5oRWCuD0XB4tQeW+j4zdlyR
         Z38xnPdlLVDizwKKmOrROTCupDxIo8BZLLKDff1S7zrdSvO0EJs6uZiovb8Huz5foT5A
         o3dp4CLDDIF2+sQ07k8Adn7meTrFvUdJ7VN88owEXXwjrJjblcI3rK3qyYdSVslSQ6CZ
         8WbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCul9do9wl3YOCFz2TwCySV4Dc/fmU6jzuMlZLy4C8o1eDPaEPcsiPoy6XaTKyZNxi/i6iE2/dDkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJYOqBc3Pq87czTPzm6wGfD1EF1vLue6CnxdOz1FZdPhENZgO
	QB/j1LfmEqg9SM9oOmtgJZI2C9Gl2pK3DQmsMYziiT86182DeoFYfO8lGby5HN69QQxxj/S6Otx
	a
X-Google-Smtp-Source: AGHT+IHdsvjRE9NR9oXgkNXV2Nf56EI6s0ucaafCJRRoKC2w3PKQdDgkYE8Gpv/GKMcKhJgeYCIFfg==
X-Received: by 2002:a05:6512:2251:b0:533:793:e3d9 with SMTP id 2adb3069b0e04-533485503b4mr556626e87.2.1724236815479;
        Wed, 21 Aug 2024 03:40:15 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-533433475f4sm373561e87.247.2024.08.21.03.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 03:40:15 -0700 (PDT)
Message-ID: <40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org>
Date: Wed, 21 Aug 2024 13:40:14 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm670: add camss and cci
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
 <20240819221051.31489-12-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240819221051.31489-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 01:10, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 188 +++++++++++++++++++++++++++
>   1 file changed, 188 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index ba93cef33dbb..37bc4fa04286 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -6,6 +6,7 @@
>    * Copyright (c) 2022, Richard Acayan. All rights reserved.
>    */
>   
> +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
>   			gpio-ranges = <&tlmm 0 0 151>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_default: cci0-default-state {
> +				pins = "gpio17", "gpio18";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				pins = "gpio17", "gpio18";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				pins = "gpio19", "gpio20";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				pins = "gpio19", "gpio20";
> +				function = "cci_i2c";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_i2c0_default: qup-i2c0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0";
> @@ -1400,6 +1429,165 @@ spmi_bus: spmi@c440000 {
>   			#interrupt-cells = <4>;
>   		};
>   
> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <0 0x0ac4a000 0 0x4000>;
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
> +			assigned-clock-rates = <37500000>;

Please remove assigned-clocks and assigned-clock-rates properties.

> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		camss: camera-controller@ac65000 {
> +			compatible = "qcom,sdm670-camss";
> +			reg = <0 0x0ac65000 0 0x1000>,
> +			      <0 0x0ac66000 0 0x1000>,
> +			      <0 0x0ac67000 0 0x1000>,
> +			      <0 0x0acaf000 0 0x4000>,
> +			      <0 0x0acb3000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x4000>,
> +			      <0 0x0acba000 0 0x1000>,
> +			      <0 0x0acc4000 0 0x4000>,
> +			      <0 0x0acc8000 0 0x1000>;
> +			reg-names = "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "vfe0",
> +				    "csid0",
> +				    "vfe1",
> +				    "csid1",
> +				    "vfe_lite",
> +				    "csid2";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,

Please put two &gcc and "soc_ahb" clock sources on top, it will
require a change in dt bindings documentation also.

> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csi0",
> +				      "csi1",
> +				      "csi2",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "gcc_camera_ahb",
> +				      "gcc_camera_axi",
> +				      "soc_ahb",
> +				      "vfe0_axi",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe1_axi",
> +				      "vfe1",
> +				      "vfe1_cphy_rx",
> +				      "vfe_lite",
> +				      "vfe_lite_cphy_rx";
> +
> +			iommus = <&apps_smmu 0x808 0x0>,
> +				 <&apps_smmu 0x810 0x8>,
> +				 <&apps_smmu 0xc08 0x0>,
> +				 <&apps_smmu 0xc10 0x8>;
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				camss_port0: port@0 {
> +					reg = <0>;
> +				};
> +
> +				camss_port1: port@1 {
> +					reg = <1>;
> +				};
> +
> +				camss_port2: port@2 {
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ad00000 {
>   			compatible = "qcom,sdm845-camcc";
>   			reg = <0 0x0ad00000 0 0x10000>;

--
Best wishes,
Vladimir

