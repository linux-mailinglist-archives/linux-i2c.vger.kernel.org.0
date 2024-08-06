Return-Path: <linux-i2c+bounces-5175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA6949BA7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC821F228AC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 22:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47584172BDF;
	Tue,  6 Aug 2024 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJ2FN07w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357EE16DC0B
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 22:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985064; cv=none; b=JhEryImEhc8OJPg4HIjWcxrS52+S0q4gIyX6EtxNpl94pHsRzzUKDc4WlSBR5eSLtsP8awbsknKXxzoNNB21dGbSwPXh5jNyXQwGjurLXtabpiksLKMrnh1UdvKQMt+MhIYXcmYezmgSwHM0xzpzb98t7H/JAOH/9JBCQHZyv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985064; c=relaxed/simple;
	bh=f/pBBmuOnXggjReY2gD2qrwLemd6tOUCzjyvi/3XbbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jZE8EZkEPY3cqTIebPlIeO7n0bP7WCooW0eh5WhAlgT7h2hX2dJPYj9XyZPur6bTtxuAJucMb1Qf0+UTxhXpgJnUKqIJ+OrNY1/ay5Jci9bjJ0tEGu9uBQGbuJgtnXXDirgquSYk33Zq5vrx31cXKEItyfMbxFU5b8nCP/WEBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJ2FN07w; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3684eb5be64so780246f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 06 Aug 2024 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985060; x=1723589860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tl/MWzipv4Gj3gjH7wNOx3y0c0rYys7Mj781hb5lquE=;
        b=BJ2FN07wrWCosQEPkcn42WpkLCAu5ybV26BeOh+cP60VrbSHnvPhQuQ1Bvd5sMHWf/
         Rn0PTsf70NysFf22hFaYE/cuanR4S2tMB0mbuw7demkdiUNGDja5LUfJ6I3Qm8TV9ty4
         s5xCL5AzedGLZ1ylwt1pSbPFCa8/znkFtlPb10YkWPSwffhd66GeAGGvbpq+WZx9jM+/
         AX1/6LlLaq9VEVWlJA72R8Yy1jlyVDGzpMctnsoRwcRgWkLYy1eeGhkJNZDL58YAGzem
         CCE1Tls6n0wDgUYk0Fz+UNTQlYYrDaD3ZTAejEaQfSCHP2v3fo408IBMizawcp+krx9K
         4rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985060; x=1723589860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl/MWzipv4Gj3gjH7wNOx3y0c0rYys7Mj781hb5lquE=;
        b=h3aANeM902szMTsm9gfaNost1mKikWdKi9cjZgvijOIOtYbmqeq86p5aGmJnm71PGM
         wzqVdCA8eI25/EeFunjfDnrUyniDpBSIgI1Zq9p1bvoXkp56ZZHThi8qxquHFCFw5hpv
         WBwhKaDOf+ZNYKVGKSCfSym6uYdxJm00b42QWrSoEqrdvrTMyY8x2w22VqYMRj4dU7q6
         N3U071HVPm5Xd0DjkpF33jKfdiphCIHWWRiHBlmNyRuaJDvRK6+F+spOig5ASz+uRY4N
         jZ0KsAxMjFBFMbiwfp8QkFzSNNuHVriGwib0v/gwM3aeKCDS6O0a6Hbr0aY8D4B9uMPp
         gmJw==
X-Forwarded-Encrypted: i=1; AJvYcCXAmbnJzOTyzJlE79XguCYKn/W98H+AFsnDh+cT9LCVS55h94m/gQRp9u/V30VRyzKeg7BcUBPR3MQ2JpcowHxrNfkkVZxuP5/i
X-Gm-Message-State: AOJu0YybFQBM+YQtC6a5e2uGZf/BDNpAcJTHGn0I0AKibW79hH7+SnST
	C+OXjgC7vfrz9BzHokKlHTnfKJrhyn0p9/CY6WeUXKD7dwrB1X87daXB7BNRNt8=
X-Google-Smtp-Source: AGHT+IH7rR+SRmN+gNYTX4K5kNRsgPXma/GQhS91xFWug6zHqokpJE1Qj0+/3o4GvWmUN7xbKFg36A==
X-Received: by 2002:a5d:5e11:0:b0:36b:cc42:29f9 with SMTP id ffacd0b85a97d-36bcc422dbcmr7995868f8f.51.1722985060360;
        Tue, 06 Aug 2024 15:57:40 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580c720sm1611035e9.41.2024.08.06.15.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 15:57:39 -0700 (PDT)
Message-ID: <81192a77-ec22-45bd-91d6-4a0ec381a6f3@linaro.org>
Date: Tue, 6 Aug 2024 23:57:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-9-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> Add the camera subsystem for the Snapdragon 670.
> 
> Adapted from SC8280XP camera subsystem.

Hmm, I'd like a little bit more of a commit log here. sdm670 as found in 
"spiffy device X" contains N CSIDs, Y VFEs.

Its not super important but a description that is device specific would 
be nice.

> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
>   1 file changed, 353 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> new file mode 100644
> index 000000000000..543fad1b5cd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -0,0 +1,353 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
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

These "_src" clocks should be dropped.

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

Named power domains, maith on fear.

Provided you fix the above and Krzysztof is happy, you can add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

