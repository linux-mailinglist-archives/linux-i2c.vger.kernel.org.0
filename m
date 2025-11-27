Return-Path: <linux-i2c+bounces-14306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D04BC8D484
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7481534A821
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1072C31ED69;
	Thu, 27 Nov 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANCh9v21"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231E1C84D7;
	Thu, 27 Nov 2025 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231010; cv=none; b=NH9LSZS4/FFaLIFz9PLjmf0aYE1eOiCxSHvXDh5asiutIloLHMaL4j3XStxrI6LfPuIcCwDsS17REymnqpX8jPdAZrX+T2s8MGJVumVZlgyVtvseyKrFXcvpWGq3ydRq/z5IKhuE7BHO/XxzQqWA5tSaTGsHTHpmho7jK+6tf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231010; c=relaxed/simple;
	bh=PdrV2s211vzsOKAkVUJkuhuqZI/NLZfBDOnRCXc94H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3QpZtzw8yarfWjygzIYWXWQ0ru4t5kWXlr5Pn6apqIkpazes02KJXBIXmQIyaZBQGCPa3vNR/eOm5TmeWpLOVVnijpOZDEhoJ7TkTOCdkb0bGAtxqxqC1OUlZA1E3j8wolqsyTSbGVDD300mvikdiaOg+XY9O8FpxGk2ZsY/B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANCh9v21; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD7DC4CEF8;
	Thu, 27 Nov 2025 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764231010;
	bh=PdrV2s211vzsOKAkVUJkuhuqZI/NLZfBDOnRCXc94H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANCh9v21kSrU7qAWFhYhC/uM4h4IB+EBTeT1eADxILm5UbTYQ6H5OPw4fcR50vQ4O
	 EXldBMkBNLFvn65r8swmaAkLL3r43LwthtavXFU0u5sRF1x70th9yYLbRCH8p9/z3L
	 El4Vn9SuhqQpo65+kEI04lIuyq/8JnvCo1iP1KhGoHhFanz0HkVLhI5Wi/20Q/VCCN
	 71w1i99WeoaFR9v0tRrBrUq+pwFNTQnv+Ch2+yquMtsjPDgZ7m3kam/p1LzVrvgnvv
	 vtsa2FzWEFb3sCA3i+XyOFrXQ1mCnPKglxZrjracYJ8kEj9waeKBHPdVXYAjQztVNj
	 2doO4IpWrd4Sg==
Date: Thu, 27 Nov 2025 09:10:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
Message-ID: <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 01:38:35AM -0800, Hangxiang Ma wrote:
> Add the compatible string "qcom,sm8750-camss" to support the Camera

s/to support the/for the/

Bindings do not support hardware.

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
>  .../bindings/media/qcom,sm8750-camss.yaml          | 664 +++++++++++++++++++++
>  1 file changed, 664 insertions(+)
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

s/This binding ..../SM8750 CAMSS (Camera Subsystem) is foo bar..../

or any other form which will describe the hardware. There is no point to
say that binding describes hardware. It cannot describe anything else.

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

I had impression there were talks and plans to split CSI PHY out of
camss. Some other patches got blocked by this, so unfortunately this as
well. Your cover letter does not answer on this, so unfortuntaly this
concludes the review.

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

cpas_ahb?

> +      - const: cam_top_fast_ahb

Isn't this cpas_fast_ahb? Why every schema comes with its own naming...

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

Look at previous generation how this is called: gcc_axi_hf. Use that
name.

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

Which previous generation you used as ordering style? X1E has it
different.

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

Previous generations call these IFE, I already raised this and you
changed to ife in Kaanapali. So are all future devices going to use
rather VFE name?

> +      - const: top
> +      - const: ipe
> +      - const: ofe
> +
> +  vdd-csiphy0-0p88-supply:

88->8, so: vdd-csiphy0-0p8-supply:

Same in other places. This is how it is called for every binding.

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

Best regards,
Krzysztof


