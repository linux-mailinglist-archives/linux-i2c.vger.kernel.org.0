Return-Path: <linux-i2c+bounces-4495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3091CC32
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 12:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFCF41C2141A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 10:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F09481D1;
	Sat, 29 Jun 2024 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKR68Z2C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210B4175A
	for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719658663; cv=none; b=P0HDLpBpks2uw7DYEne4TLN4E/wpa37SlstoqQp60t4ztSpLP/uqLDvOmbqkH0m/VY7xhAY7YEeJDJtFx1ExUKdkWDVcPsWirI88WLtITSWmnUANFcFe/7bGBrTzzs7iScA1g0iZVdXHI3BGPIkNXqaDe76ChIdhW7dPC5awd/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719658663; c=relaxed/simple;
	bh=gjzxog3Mb8JMf2rUUMDAlM7leBu6VGGWWpEbchnY51E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bi+OT1JXr0VD6QOl7JZTZiOwiPctBs96dwfjzZo+D0mP53chrGZRtEhQfJN3R19qZlgSRVAXyJ2g6+T22VWKi5hN6a3T5Nx2m9wMNh722S86QoCJ4ECZLsustrs0Acz+TPQNhOtD2ocGrpo/yyy7I8jVBpkSdKvBve8O9dVR7h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKR68Z2C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36733f09305so778261f8f.3
        for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719658659; x=1720263459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPzoYFWOBijSuxNipZNf1hsOuMejTmHC//0xYNGUiGY=;
        b=NKR68Z2CbXCMYL8XTjpyN+Z6NUGxVRMV96hHjoQLNgOYB8glg4UoAnWwqM5M+8pvM9
         RFnaow2V2sb57QbZQX7uH2lX3x61v9y/ep7lXfZenIgi4W8ZxjCy8mrPdcbfzAEZ0aSt
         wffnDB3VgWkWY/qB6XPZuMAHEV8Js4FK15Mn6RYi6z77CGNOqbZCja3m4U+uRB2WU4G7
         uoidFx74I0UBldDRQvwfIuCgm1dZqeEv2VE+PY0cGNXcwmC0NOEfj87LJEff/LhztnwH
         1YqQg9bW2Cq27lN3dRyAHFxMIpPdWK+Y4EDuTcUZIGIum6Y3sk5iEB+Or2JyrVbhP0Fv
         yCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719658659; x=1720263459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPzoYFWOBijSuxNipZNf1hsOuMejTmHC//0xYNGUiGY=;
        b=FXbCkR8N86+1PfqpdYBIsxluznNk/rLAaqWqXnl8XAoxwHsiurLalcrBbIMG/jqV20
         k5vCfaxwaipY4NgSR4qmV37tRwDQZoaiKtLHir0SZQwFuJQFNy7KDAoO9pPr06qT+9pQ
         H21YdQZq+x13+ctTIqoM6u/w/xe9GlN1uHTnPNX6ZzjwpFk6UjKD06nNnXAwaHK6Ka9h
         SgZ82TqF64/GkJv7GCF2n3x9Z3yqyU1RA1usAMCcTH5VE4BJ2DJUiKo4OVNwwk+568XM
         Np39DALLBwgy5pz43zyF1ea7c84UF5DE743nADUn/YDb4Ojuvssq5JaK478XE9DtzoXM
         S/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIIBH4GKNCdfh/3mZFmywcQB8CiZRmK0yjlImfVTdWg/M1I4nASMOZ8htraF/dDFkPRBccrL9SKpuaLfobGF2fHEjytPEfu8n4
X-Gm-Message-State: AOJu0YxtsRKea2aNjDPuTtXBW7S5t4VHMq/8TBMiDzGXcDSwsyv0XBHj
	LdiFNYvwJMRXIwPjoeq+3c78spwfYB4R+ib673Yd1wspdlVFfL5prXQdG+6iMt4=
X-Google-Smtp-Source: AGHT+IGoM/9KSNdxFL7CwwE4+Ftp75/mDJK5QMpVY+2F6WHOPdSUELuNgowwn+bUUJXWyTo1CjDgqQ==
X-Received: by 2002:a05:6000:18aa:b0:367:4ddf:385c with SMTP id ffacd0b85a97d-36775699491mr511746f8f.6.1719658659384;
        Sat, 29 Jun 2024 03:57:39 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a112a54sm4598514f8f.115.2024.06.29.03.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 03:57:39 -0700 (PDT)
Message-ID: <94810ad7-a6e8-4e25-b158-3065c1ab0294@linaro.org>
Date: Sat, 29 Jun 2024 11:57:36 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-1-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-1-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 19:32, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss in order to support the camera
> subsystem for sc7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,sc7280-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> new file mode 100644
> index 000000000000..588c6fb50e2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SC7280 CAMSS ISP
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on
> +  Qualcomm Technologies, Inc. platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-camss
> +
> +  clocks:
> +    minItems: 41
> +    maxItems: 41
> +
> +  clock-names:
> +    items:
> +
> +      - const: cam_hf_axi
> +      - const: slow_ahb_src
> +      - const: cpas_ahb
> +      - const: camnoc_axi_src

You almost certainly don't need to include the "_src" clocks in the list 
of clocks since the CAMCC driver lists "someclock" as having parent 
"someclock_src"

> +      - const: camnoc_axi
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy4_timer_src
> +      - const: vfe0_csid
> +      - const: vfe0_cphy_rx
> +      - const: vfe0
> +      - const: vfe0_axi
> +      - const: csiphy_rx_src
> +      - const: vfe1_csid
> +      - const: vfe1_cphy_rx
> +      - const: vfe1
> +      - const: vfe1_axi
> +      - const: vfe2_csid
> +      - const: vfe2_cphy_rx
> +      - const: vfe2
> +      - const: vfe2_axi
> +      - const: vfe0_lite_csid
> +      - const: vfe0_lite_cphy_rx
> +      - const: vfe0_lite
> +      - const: vfe1_lite_csid
> +      - const: vfe1_lite_cphy_rx
> +      - const: vfe1_lite
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interrupts:
> +    minItems: 15
> +    maxItems: 15
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.

Please name these power domains.

https://lore.kernel.org/linux-arm-msm/fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org/

---
bod

