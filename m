Return-Path: <linux-i2c+bounces-14318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B69DC8D9F1
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147493A8EE7
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05242FD7D8;
	Thu, 27 Nov 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLPhMh44"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1B2D948A
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236786; cv=none; b=YlwGNfe+229v+sdAJbr9VnGx2ihm5fFu38JTi+wdvy51QPHcMJaGNcqkT8OQrCES8cjAJGlY+vYzDvz1BHiTgJIoeDCaQn6zSEJ2u9twt9lTUJaJDVYR95NFeHBLX+AfleJE+sMsK0OMhHe5t/bEzbwYMYi5KzvVHCt8zJcWrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236786; c=relaxed/simple;
	bh=+oR4UyGDRoUJXUKIUNdBCODkH+/I7Ps63GQjeYR6U3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgmKNzVVKul3jRAon3+yp40vEbRnMGrG44oFKozzZYOQ9uFVWdwqHomaMC15fvf52vxsESWfW2jNpss2iJHpu3mfU9Em9bqn2wuLeC/xurwO//yeRE7p2vMKLEPqqJ1xOr114i/mlCcWvpmBQQ/sCdzqjo1VN1OfEM3cxCgvRLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cLPhMh44; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779d47be12so5086275e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764236782; x=1764841582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wI6mwlLtajLsOXzluwO82solRNAGcicI8MltQcT/IOU=;
        b=cLPhMh44/DyPRgs70NrzaWoZk6BhfqYY6LMkG/rugCZPv+CIls6F1H2em7zwVTeZ+C
         7a9CEH6OB7HOUS8XUycQDW+WDUr7PdCOi0y3UVf9hOcN7fY4tbxLh47Lv/P5UDauSu9x
         y6WgHppao9c7ULpMku3qxNA0D7Ph3hMaYk0sV3R4t5vrvUHfcsG9iJUF0qYs7YWOLKnY
         8TZv8vsoJ2ALTvr/kiXxisiXI/jfzAUKbplEGokA/Lhvlr3nil5PwOHXiAsKaypZUWcG
         Jd/OTNUfMdj00yQJtaUoAcvwB7mXaOItmZgwvrXXkjJZELCTFaeayNY5n9VSylgAru4p
         NR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236782; x=1764841582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wI6mwlLtajLsOXzluwO82solRNAGcicI8MltQcT/IOU=;
        b=aDvPYiXKVnMiTjsA6xyhe+1WoFq7yE2SWO5zva1dHgdLVHvHVUfzL8A+W4ij/z+CW3
         wJpTylzGvWyFhIuNcokP4FId9+Wn9Oo8cDtZZKUW6eO+YD3IUgdJ49Jv+f5/UXPUx7eH
         UxGzrlnA5sXutZ96RYGRpp+JBcsP5i9RZ+ZW12z2GTq1vIw9f24QZ5HkY7sFkxWN/3qQ
         pezCqi69Ae6RvMQ1J/9UKmwjowmzpC3ABsHf9cxY1pbRyQ46g1xQb0P2LaXG/P4x362g
         2EDMs4fwMrlALdSG43EL/6APxwaIK5Gb9AltEe5zrm+Hp8EB9xmjA8YWKOSEi3xdz1rs
         EiXw==
X-Gm-Message-State: AOJu0Yxyw9wVMnFYAIRbVRJ4mxnZalMlSPNDjVvpx7KHX+8jkxIe++u8
	k0239LC3Cs7VsXCKcEx/PuKD6yLf8QUEhyOzMacq7XVa6OcGK7NDkYwdRXvGXP+WlKk=
X-Gm-Gg: ASbGncsBSQuHhfVqxkaAJ3XP0PZmZSkJpGMZ8RUhHPCfPmvWaaY//GEAAM595L3zLtO
	puw6P1tcD6cWa1vt4HcJnp/jYYX9dDxN6j5wctsSaApvmMQ6BcawzFi8oq3fDthnRppaLFLJqml
	ysQHLNKzMIEiEAcEbIqh/KtTuSCcDOxBwQXjt6gPiGzBnReK1CeI01mInTxVj8QDYm8O6eKE963
	KGHMeueRxCN9Rj/4cyi2z3lfdy6weuglRua2w88KLjbpbwC7ephBnDmdtgd1YTDLre7wh0kLI8k
	QkS4luvOJDSA66+u7crN3PkmbGIDW9npR+dWEQZFfGo7GptTZQTiJM8ZSP15VDm0ci1wPMEFfSt
	+qWjoMNjHAVJ39pu1x6np6PWtJ3HfYy9t4HB7peZARNT2NUsrLcgRUIBY1dzCnftIcGRTogABHF
	Ak3XRBSuWPPzjSssnwwjw8aW19HSmDvrI5gt12Wy6lKPbRoDXN9KAx1D5r+seiouE=
X-Google-Smtp-Source: AGHT+IFZ3FOwM7QY1NQwF49mNaDrAhJn1wuIOG+OjKw7JaWfhwp+50jtBvmfBcAX13/crv+5e0izYw==
X-Received: by 2002:a05:600c:1d0e:b0:471:21:554a with SMTP id 5b1f17b1804b1-477c01860aemr226195535e9.13.1764236782205;
        Thu, 27 Nov 2025 01:46:22 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111561c2sm26730795e9.4.2025.11.27.01.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:46:21 -0800 (PST)
Message-ID: <4a921eba-a268-4f88-86cf-02a9a64d7a43@linaro.org>
Date: Thu, 27 Nov 2025 09:46:20 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add the compatible string "qcom,sm8750-camss" to support the Camera
> Subsystem (CAMSS) on the Qualcomm SM8750 platform.
> 
> The SM8750 platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY
> - 2 x ICP
> - 1 x IPE
> - 2 x JPEG DMA & Downscaler
> - 2 x JPEG Encoder
> - 1 x OFE
> - 5 x RT CDM
> - 3 x TPG
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,sm8750-camss.yaml          | 664 +++++++++++++++++++++
>   1 file changed, 664 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
> new file mode 100644
> index 000000000000..6b2b0b5a7e19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
> @@ -0,0 +1,664 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8750-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8750 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  This binding describes the camera subsystem hardware found on SM8750 Qualcomm
> +  SoCs. It includes submodules such as CSIPHY (CSI Physical layer) and CSID
> +  (CSI Decoder), which comply with the MIPI CSI2 protocol.
> +
> +  The subsystem also integrates a set of real-time image processing engines and
> +  their associated configuration modules, as well as non-real-time engines.
> +
> +  Additionally, it encompasses a test pattern generator (TPG) submodule.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8750-camss
> +
> +  reg:
> +    items:
> +      - description: Registers for CSID 0
> +      - description: Registers for CSID 1
> +      - description: Registers for CSID 2
> +      - description: Registers for CSID Lite 0
> +      - description: Registers for CSID Lite 1
> +      - description: Registers for CSIPHY 0
> +      - description: Registers for CSIPHY 1
> +      - description: Registers for CSIPHY 2
> +      - description: Registers for CSIPHY 3
> +      - description: Registers for CSIPHY 4
> +      - description: Registers for CSIPHY 5
> +      - description: Registers for VFE (Video Front End) 0
> +      - description: Registers for VFE 1
> +      - description: Registers for VFE 2
> +      - description: Registers for VFE Lite 0
> +      - description: Registers for VFE Lite 1
> +      - description: Registers for ICP (Imaging Control Processor) 0
> +      - description: Registers for ICP SYS 0
> +      - description: Registers for ICP 1
> +      - description: Registers for ICP SYS 1
> +      - description: Registers for IPE (Image Processing Engine)
> +      - description: Registers for JPEG DMA & Downscaler 0
> +      - description: Registers for JPEG Encoder 0
> +      - description: Registers for JPEG DMA & Downscaler 1
> +      - description: Registers for JPEG Encoder 1
> +      - description: Registers for OFE (Offline Front End)
> +      - description: Registers for RT CDM (Camera Data Mover) 0
> +      - description: Registers for RT CDM 1
> +      - description: Registers for RT CDM 2
> +      - description: Registers for RT CDM 3
> +      - description: Registers for RT CDM 4
> +      - description: Registers for TPG 0
> +      - description: Registers for TPG 1
> +      - description: Registers for TPG 2
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
> +      - const: icp0
> +      - const: icp0_sys
> +      - const: icp1
> +      - const: icp1_sys
> +      - const: ipe
> +      - const: jpeg_dma0
> +      - const: jpeg_enc0
> +      - const: jpeg_dma1
> +      - const: jpeg_enc1
> +      - const: ofe
> +      - const: rt_cdm0
> +      - const: rt_cdm1
> +      - const: rt_cdm2
> +      - const: rt_cdm3
> +      - const: rt_cdm4
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +
> +  clocks:
> +    maxItems: 61
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
> +      - const: qdss_debug_xo
> +      - const: camnoc_ipe_nps
> +      - const: camnoc_ofe
> +      - const: gcc_sf_axi
> +      - const: icp0
> +      - const: icp0_ahb
> +      - const: icp1
> +      - const: icp1_ahb
> +      - const: ipe_nps
> +      - const: ipe_nps_ahb
> +      - const: ipe_nps_fast_ahb
> +      - const: ipe_pps
> +      - const: ipe_pps_fast_ahb
> +      - const: jpeg0
> +      - const: jpeg1
> +      - const: ofe_ahb
> +      - const: ofe_anchor
> +      - const: ofe_anchor_fast_ahb
> +      - const: ofe_hdr
> +      - const: ofe_hdr_fast_ahb
> +      - const: ofe_main
> +      - const: ofe_main_fast_ahb
> +      - const: vfe0_bayer
> +      - const: vfe0_bayer_fast_ahb
> +      - const: vfe1_bayer
> +      - const: vfe1_bayer_fast_ahb
> +      - const: vfe2_bayer
> +      - const: vfe2_bayer_fast_ahb
> +
> +  interrupts:
> +    maxItems: 32
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
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: camnoc_nrt
> +      - const: camnoc_rt
> +      - const: icp0
> +      - const: icp1
> +      - const: jpeg_dma0
> +      - const: jpeg_enc0
> +      - const: jpeg_dma1
> +      - const: jpeg_enc1
> +      - const: rt_cdm0
> +      - const: rt_cdm1
> +      - const: rt_cdm2
> +      - const: rt_cdm3
> +      - const: rt_cdm4
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_icp_mnoc
> +      - const: sf_mnoc
> +
> +  iommus:
> +    items:
> +      - description: VFE non-protected stream
> +      - description: ICP0 shared stream
> +      - description: ICP1 shared stream
> +      - description: IPE CDM non-protected stream
> +      - description: IPE non-protected stream
> +      - description: JPEG non-protected stream
> +      - description: OFE CDM non-protected stream
> +      - description: OFE non-protected stream
> +      - description: VFE / VFE Lite CDM non-protected stream
> +
> +  power-domains:
> +    items:
> +      - description:
> +          VFE0 GDSC - Global Distributed Switch Controller for VFE0.
> +      - description:
> +          VFE1 GDSC - Global Distributed Switch Controller for VFE1.
> +      - description:
> +          VFE2 GDSC - Global Distributed Switch Controller for VFE2.
> +      - description:
> +          Titan GDSC - Global Distributed Switch Controller for the entire camss.
> +      - description:
> +          IPE GDSC - Global Distributed Switch Controller for IPE.
> +      - description:
> +          OFE GDSC - Block Global Distributed Switch Controller for OFE.
> +
> +  power-domain-names:
> +    items:
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: top
> +      - const: ipe
> +      - const: ofe
> +
> +  vdd-csiphy0-0p88-supply:
> +    description:
> +      Phandle to a 0.88V regulator supply to CSIPHY0 core block.
> +
> +  vdd-csiphy0-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
> +
> +  vdd-csiphy1-0p88-supply:
> +    description:
> +      Phandle to a 0.88V regulator supply to CSIPHY1 core block.
> +
> +  vdd-csiphy1-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY1 pll block.
> +
> +  vdd-csiphy2-0p88-supply:
> +    description:
> +      Phandle to a 0.88V regulator supply to CSIPHY2 core block.
> +
> +  vdd-csiphy2-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY2 pll block.
> +
> +  vdd-csiphy3-0p88-supply:
> +    description:
> +      Phandle to a 0.88V regulator supply to CSIPHY3 core block.
> +
> +  vdd-csiphy3-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY3 pll block.
> +
> +  vdd-csiphy4-0p88-supply:
> +    description:
> +      Phandle to a 0.88V regulator supply to CSIPHY4 core block.
> +
> +  vdd-csiphy4-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY4 pll block.
> +
> +  vdd-csiphy5-0p88-supply:
> +    description:
> +      Phandle to a 0.88V regulator supply to CSIPHY5 core block.
> +
> +  vdd-csiphy5-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY5 pll block.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@ad27000 {
> +            compatible = "qcom,sm8750-camss";
> +
> +            reg = <0x0 0x0ad27000 0x0 0x2b00>,
> +                  <0x0 0x0ad2a000 0x0 0x2b00>,
> +                  <0x0 0x0ad2d000 0x0 0x2b00>,
> +                  <0x0 0x0ad6d000 0x0 0xa00>,
> +                  <0x0 0x0ad72000 0x0 0xa00>,
> +                  <0x0 0x0ada9000 0x0 0x2000>,
> +                  <0x0 0x0adab000 0x0 0x2000>,
> +                  <0x0 0x0adad000 0x0 0x2000>,
> +                  <0x0 0x0adaf000 0x0 0x2000>,
> +                  <0x0 0x0adb1000 0x0 0x2000>,
> +                  <0x0 0x0adb3000 0x0 0x2000>,
> +                  <0x0 0x0ac86000 0x0 0x10000>,
> +                  <0x0 0x0ac96000 0x0 0x10000>,
> +                  <0x0 0x0aca6000 0x0 0x10000>,
> +                  <0x0 0x0ad6e000 0x0 0x1800>,
> +                  <0x0 0x0ad73000 0x0 0x1800>,
> +                  <0x0 0x0ac06000 0x0 0x1000>,
> +                  <0x0 0x0ac05000 0x0 0x1000>,
> +                  <0x0 0x0ac16000 0x0 0x1000>,
> +                  <0x0 0x0ac15000 0x0 0x1000>,
> +                  <0x0 0x0ac42000 0x0 0x18000>,
> +                  <0x0 0x0ac26000 0x0 0x1000>,
> +                  <0x0 0x0ac25000 0x0 0x1000>,
> +                  <0x0 0x0ac28000 0x0 0x1000>,
> +                  <0x0 0x0ac27000 0x0 0x1000>,
> +                  <0x0 0x0ac2a000 0x0 0x18000>,
> +                  <0x0 0x0ac7f000 0x0 0x580>,
> +                  <0x0 0x0ac80000 0x0 0x580>,
> +                  <0x0 0x0ac81000 0x0 0x580>,
> +                  <0x0 0x0ac82000 0x0 0x580>,
> +                  <0x0 0x0ac83000 0x0 0x580>,
> +                  <0x0 0x0ad8b000 0x0 0x400>,
> +                  <0x0 0x0ad8c000 0x0 0x400>,
> +                  <0x0 0x0ad8d000 0x0 0x400>;
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
> +                        "vfe_lite1",
> +                        "icp0",
> +                        "icp0_sys",
> +                        "icp1",
> +                        "icp1_sys",
> +                        "ipe",
> +                        "jpeg_dma0",
> +                        "jpeg_enc0",
> +                        "jpeg_dma1",
> +                        "jpeg_enc1",
> +                        "ofe",
> +                        "rt_cdm0",
> +                        "rt_cdm1",
> +                        "rt_cdm2",
> +                        "rt_cdm3",
> +                        "rt_cdm4",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2";
> +
> +            clocks = <&camcc_cam_cc_camnoc_nrt_axi_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_axi_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_0_main_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_1_main_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_2_main_clk>,
> +                     <&camcc_cam_cc_camnoc_rt_vfe_lite_clk>,
> +                     <&camcc_cam_cc_cam_top_ahb_clk>,
> +                     <&camcc_cam_cc_cam_top_fast_ahb_clk>,
> +                     <&camcc_cam_cc_csid_clk>,
> +                     <&camcc_cam_cc_csid_csiphy_rx_clk>,
> +                     <&camcc_cam_cc_csiphy0_clk>,
> +                     <&camcc_cam_cc_csi0phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy1_clk>,
> +                     <&camcc_cam_cc_csi1phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy2_clk>,
> +                     <&camcc_cam_cc_csi2phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy3_clk>,
> +                     <&camcc_cam_cc_csi3phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy4_clk>,
> +                     <&camcc_cam_cc_csi4phytimer_clk>,
> +                     <&camcc_cam_cc_csiphy5_clk>,
> +                     <&camcc_cam_cc_csi5phytimer_clk>,
> +                     <&gcc_gcc_camera_hf_axi_clk>,
> +                     <&camcc_cam_cc_vfe_0_main_clk>,
> +                     <&camcc_cam_cc_vfe_0_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_1_main_clk>,
> +                     <&camcc_cam_cc_vfe_1_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_2_main_clk>,
> +                     <&camcc_cam_cc_vfe_2_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_lite_clk>,
> +                     <&camcc_cam_cc_vfe_lite_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_lite_cphy_rx_clk>,
> +                     <&camcc_cam_cc_vfe_lite_csid_clk>,
> +                     <&camcc_cam_cc_qdss_debug_xo_clk>,
> +                     <&camcc_cam_cc_camnoc_nrt_ipe_nps_clk>,
> +                     <&camcc_cam_cc_camnoc_nrt_ofe_main_clk>,
> +                     <&gcc_gcc_camera_sf_axi_clk>,
> +                     <&camcc_cam_cc_icp_0_clk>,
> +                     <&camcc_cam_cc_icp_0_ahb_clk>,
> +                     <&camcc_cam_cc_icp_1_clk>,
> +                     <&camcc_cam_cc_icp_1_ahb_clk>,
> +                     <&camcc_cam_cc_ipe_nps_clk>,
> +                     <&camcc_cam_cc_ipe_nps_ahb_clk>,
> +                     <&camcc_cam_cc_ipe_nps_fast_ahb_clk>,
> +                     <&camcc_cam_cc_ipe_pps_clk>,
> +                     <&camcc_cam_cc_ipe_pps_fast_ahb_clk>,
> +                     <&camcc_cam_cc_jpeg_0_clk>,
> +                     <&camcc_cam_cc_jpeg_1_clk>,
> +                     <&camcc_cam_cc_ofe_ahb_clk>,
> +                     <&camcc_cam_cc_ofe_anchor_clk>,
> +                     <&camcc_cam_cc_ofe_anchor_fast_ahb_clk>,
> +                     <&camcc_cam_cc_ofe_hdr_clk>,
> +                     <&camcc_cam_cc_ofe_hdr_fast_ahb_clk>,
> +                     <&camcc_cam_cc_ofe_main_clk>,
> +                     <&camcc_cam_cc_ofe_main_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_0_bayer_clk>,
> +                     <&camcc_cam_cc_vfe_0_bayer_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_1_bayer_clk>,
> +                     <&camcc_cam_cc_vfe_1_bayer_fast_ahb_clk>,
> +                     <&camcc_cam_cc_vfe_2_bayer_clk>,
> +                     <&camcc_cam_cc_vfe_2_bayer_fast_ahb_clk>;
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
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "qdss_debug_xo",
> +                          "camnoc_ipe_nps",
> +                          "camnoc_ofe",
> +                          "gcc_sf_axi",
> +                          "icp0",
> +                          "icp0_ahb",
> +                          "icp1",
> +                          "icp1_ahb",
> +                          "ipe_nps",
> +                          "ipe_nps_ahb",
> +                          "ipe_nps_fast_ahb",
> +                          "ipe_pps",
> +                          "ipe_pps_fast_ahb",
> +                          "jpeg0",
> +                          "jpeg1",
> +                          "ofe_ahb",
> +                          "ofe_anchor",
> +                          "ofe_anchor_fast_ahb",
> +                          "ofe_hdr",
> +                          "ofe_hdr_fast_ahb",
> +                          "ofe_main",
> +                          "ofe_main_fast_ahb",
> +                          "vfe0_bayer",
> +                          "vfe0_bayer_fast_ahb",
> +                          "vfe1_bayer",
> +                          "vfe1_bayer_fast_ahb",
> +                          "vfe2_bayer",
> +                          "vfe2_bayer_fast_ahb";
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
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
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
> +                              "vfe_lite1",
> +                              "camnoc_nrt",
> +                              "camnoc_rt",
> +                              "icp0",
> +                              "icp1",
> +                              "jpeg_dma0",
> +                              "jpeg_enc0",
> +                              "jpeg_dma1",
> +                              "jpeg_enc1",
> +                              "rt_cdm0",
> +                              "rt_cdm1",
> +                              "rt_cdm2",
> +                              "rt_cdm3",
> +                              "rt_cdm4",
> +                              "tpg0",
> +                              "tpg1",
> +                              "tpg2";
> +
> +            interconnects = <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc_slave_camera_cfg QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc_master_camnoc_hf QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc_master_camnoc_nrt_icp_sf QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc_master_camnoc_sf QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_icp_mnoc",
> +                                 "sf_mnoc";
> +
> +            iommus = <&apps_smmu 0x1c00 0x00>,
> +                     <&apps_smmu 0x18c0 0x00>,
> +                     <&apps_smmu 0x1980 0x00>,
> +                     <&apps_smmu 0x1840 0x00>,
> +                     <&apps_smmu 0x1800 0x00>,
> +                     <&apps_smmu 0x18a0 0x00>,
> +                     <&apps_smmu 0x1880 0x00>,
> +                     <&apps_smmu 0x1820 0x00>,
> +                     <&apps_smmu 0x1860 0x00>;
> +
> +            power-domains = <&camcc_cam_cc_vfe_0_gdsc>,
> +                            <&camcc_cam_cc_vfe_1_gdsc>,
> +                            <&camcc_cam_cc_vfe_2_gdsc>,
> +                            <&camcc_cam_cc_titan_top_gdsc>,
> +                            <&camcc_cam_cc_ipe_0_gdsc>,
> +                            <&camcc_cam_cc_ofe_gdsc>;
> +            power-domain-names = "vfe0",
> +                                 "vfe1",
> +                                 "vfe2",
> +                                 "top",
> +                                 "ipe",
> +                                 "ofe";
> +
> +            vdd-csiphy0-0p88-supply = <&vreg_0p88_supply>;
> +            vdd-csiphy0-1p2-supply = <&vreg_1p2_supply>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

