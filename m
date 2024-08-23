Return-Path: <linux-i2c+bounces-5768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A527895D9CA
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 01:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D891C23740
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 23:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4E81C8FD5;
	Fri, 23 Aug 2024 23:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC5oNgjA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41F152196;
	Fri, 23 Aug 2024 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724456671; cv=none; b=D2u82ucXGiGxHN6PP6EKP/k6dP/Daohv48MOumBiUazRFOA7PGEADj+Seoe+WlU7RElaXuyoN4iNBFr2A7INXe7S+fn2y4Z2zZbtRGcM+6S0Fvm4Zsed1/a0LuUpdQLlikVTGLkx9hmmsEKtMidXqu2tSF3GHMV0LBxvp2HyKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724456671; c=relaxed/simple;
	bh=PKOqjsh55k0gUWF28he/tpFo7CnOI0T+o1W/ywoIY40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3Kj9WUUQXVGVhe6KCYrD1blsvJkZIh9Mgt2Pm1fxWKf9aIv7dAbpDeYB4sVcdCH29IZxE6BhaAxGdx5r2jSw+2dFP08s7bKku/YBMBdOo3R2qiEwHeSZXRe7LFhryfO2V6SLsWrvvXWBmFDbNC64/P0lCxbTRWewANN5ZDe2IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC5oNgjA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6bf75ed0e0eso12955736d6.1;
        Fri, 23 Aug 2024 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724456668; x=1725061468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ye+Ps90cwlGsT4oHvYpdjI85sw14z4sG45EsgOKagSg=;
        b=VC5oNgjAA01PpyWUv0wOeWT+XVdaltS73h7+vLfG6RfslSabKCrAdOJ7vqCJe9ckID
         /Iw2uyTyOZZwAM51zdTU46f1ChNNAmTtk5I8Qug33wXNC56Cv07QxEMB/mcTQp75Ufr4
         GK+4jiIadffLc9HUz7J9lMAfVmDc5sEBDAehZcaDt/vzZCaxwKD9p0eisHa9MGdhCKUA
         x4BYF9T7IMjj07hw6vxI8WAsa+YSBAw6TcsM8LBtVe58jc4E99n13mtKSHnslIs4g5wP
         LR0hg8TP6RvrGv/ypZRrtmd9hy4g/3MDUHsulMw+oWfdiVc3Y3jlaUwvVcvyvOMmLyPR
         /atA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724456668; x=1725061468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye+Ps90cwlGsT4oHvYpdjI85sw14z4sG45EsgOKagSg=;
        b=N/nZIqTs6PQ4whp5tigyShnJccqQt9chaslw2UXvpLn09LEOjGaBWy6M+edxajdT/O
         vKmkOSVhpCe/EG7GPlHmxH/JvkxOUS4M6pQJ6AlU0jfpLoIeLFPsMDIs21nDJiyehCqK
         FxCeDV6A8v0Y5c74a78Js5h+XOFfbLo+pjbY8aQkPWsql6TlJKUk+5GGdxVHnSDL6dv+
         pzVKidlkOhJ5vJSt044rqUvc4sRQmhgy+VbrpdN7RXJtFtDTAH16VQt5mIIStIlNeMpy
         cY7qgqHYIoQkWIkn1Utcz3aQ3j1s3vWySHxozVu5A4uNGRpmOiExg/OmBGe2DwoDibCX
         y4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCU2YoHuDLrQJtPBL19euYWKBDbethnsUNTFoGHidrZS1Vri4wYYB2edqU5508oeH1+M6HCf+VxKplqPlAOCnA==@vger.kernel.org, AJvYcCW8ISDUgr1eXYeXzTa5e2Sylae3uhZgtKHZ465tHMVDzq4ptLldfAkowCV+sIe7T9bq0rdCG0aSSqFS@vger.kernel.org, AJvYcCX1JsXBgzmpCbCCaAQnJBfjzgVN9UXjKOIQoNtC8CN2GtpW7VIobbckh0uceGAebONoBuQmbZZc2TDuNM4=@vger.kernel.org, AJvYcCX3wYE/UlNtzv5LHy0EVuifY+rC9BKgKHk8mvGQdvKLizJkRMVOGUDlf2fC1vs2RMYKpvHj0XHr4wzF@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUsYIQoatBummyeRQ2WI9KzSpXA3aYR1HWEQYy7w7ZUMEe67E
	bal6RCCqlZtI5CDBK5AQnxJlBjoovzSbPb2gUQUDGdr9ibde3BjKcmVkUfh/
X-Google-Smtp-Source: AGHT+IHsrMKOopKNem9M07VfAEBD9lUhg2aiNwXgCaC6w49RC2sZLM8rvab1CMAWFtEWOEzJpHPW4Q==
X-Received: by 2002:a05:6214:3382:b0:6b0:90b4:1ca9 with SMTP id 6a1803df08f44-6c16dc217c1mr39081636d6.6.1724456668104;
        Fri, 23 Aug 2024 16:44:28 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d6548csm23198626d6.68.2024.08.23.16.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 16:44:27 -0700 (PDT)
Date: Fri, 23 Aug 2024 19:44:26 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <Zske2ptZAV12YLyf@radian>
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-12-mailingradian@gmail.com>
 <40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org>

On Wed, Aug 21, 2024 at 01:40:14PM +0300, Vladimir Zapolskiy wrote:
> On 8/20/24 01:10, Richard Acayan wrote:
> > Add the camera subsystem and CCI used to interface with cameras on the
> > Snapdragon 670.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sdm670.dtsi | 188 +++++++++++++++++++++++++++
> >   1 file changed, 188 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > index ba93cef33dbb..37bc4fa04286 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > @@ -6,6 +6,7 @@
> >    * Copyright (c) 2022, Richard Acayan. All rights reserved.
> >    */
> > +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
> >   #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> >   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> >   #include <dt-bindings/clock/qcom,rpmh.h>
> > @@ -1168,6 +1169,34 @@ tlmm: pinctrl@3400000 {
> >   			gpio-ranges = <&tlmm 0 0 151>;
> >   			wakeup-parent = <&pdc>;
> > +			cci0_default: cci0-default-state {
> > +				pins = "gpio17", "gpio18";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-up;
> > +			};
> > +
> > +			cci0_sleep: cci0-sleep-state {
> > +				pins = "gpio17", "gpio18";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-down;
> > +			};
> > +
> > +			cci1_default: cci1-default-state {
> > +				pins = "gpio19", "gpio20";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-up;
> > +			};
> > +
> > +			cci1_sleep: cci1-sleep-state {
> > +				pins = "gpio19", "gpio20";
> > +				function = "cci_i2c";
> > +				drive-strength = <2>;
> > +				bias-pull-down;
> > +			};
> > +
> >   			qup_i2c0_default: qup-i2c0-default-state {
> >   				pins = "gpio0", "gpio1";
> >   				function = "qup0";
> > @@ -1400,6 +1429,165 @@ spmi_bus: spmi@c440000 {
> >   			#interrupt-cells = <4>;
> >   		};
> > +		cci: cci@ac4a000 {
> > +			compatible = "qcom,sdm670-cci", "qcom,msm8996-cci";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			reg = <0 0x0ac4a000 0 0x4000>;
> > +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> > +			power-domains = <&camcc TITAN_TOP_GDSC>;
> > +
> > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +				 <&camcc CAM_CC_CCI_CLK>;
> > +			clock-names = "camnoc_axi",
> > +				      "soc_ahb",
> > +				      "cpas_ahb",
> > +				      "cci";
> > +
> > +			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
> > +			assigned-clock-rates = <37500000>;
> 
> Please remove assigned-clocks and assigned-clock-rates properties.

Doing this adds a warning to dmesg, where the clock rate is set to 19.2
MHz by default.

> > +
> > +			pinctrl-names = "default", "sleep";
> > +			pinctrl-0 = <&cci0_default &cci1_default>;
> > +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> > +
> > +			status = "disabled";
> > +
> > +			cci_i2c0: i2c-bus@0 {
> > +				reg = <0>;
> > +				clock-frequency = <1000000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +
> > +			cci_i2c1: i2c-bus@1 {
> > +				reg = <1>;
> > +				clock-frequency = <1000000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +			};
> > +		};
> > +
> > +		camss: camera-controller@ac65000 {
> > +			compatible = "qcom,sdm670-camss";
> > +			reg = <0 0x0ac65000 0 0x1000>,
> > +			      <0 0x0ac66000 0 0x1000>,
> > +			      <0 0x0ac67000 0 0x1000>,
> > +			      <0 0x0acaf000 0 0x4000>,
> > +			      <0 0x0acb3000 0 0x1000>,
> > +			      <0 0x0acb6000 0 0x4000>,
> > +			      <0 0x0acba000 0 0x1000>,
> > +			      <0 0x0acc4000 0 0x4000>,
> > +			      <0 0x0acc8000 0 0x1000>;
> > +			reg-names = "csiphy0",
> > +				    "csiphy1",
> > +				    "csiphy2",
> > +				    "vfe0",
> > +				    "csid0",
> > +				    "vfe1",
> > +				    "csid1",
> > +				    "vfe_lite",
> > +				    "csid2";
> > +
> > +			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "csid0",
> > +					  "csid1",
> > +					  "csid2",
> > +					  "csiphy0",
> > +					  "csiphy1",
> > +					  "csiphy2",
> > +					  "vfe0",
> > +					  "vfe1",
> > +					  "vfe_lite";
> > +
> > +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> > +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> > +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> > +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > +				 <&gcc GCC_CAMERA_AHB_CLK>,
> > +				 <&gcc GCC_CAMERA_AXI_CLK>,
> > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> 
> Please put two &gcc and "soc_ahb" clock sources on top, it will
> require a change in dt bindings documentation also.

I'll do this for the clocks themselves because they have no parents (so
no obvious clock sources).

