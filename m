Return-Path: <linux-i2c+bounces-5876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0896389C
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 05:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB20B283813
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 03:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3296149624;
	Thu, 29 Aug 2024 03:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/Q1ulfC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F14A00;
	Thu, 29 Aug 2024 03:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724900798; cv=none; b=sf5/RbMbEAq4afphrje0DjV1xL6neJ/edCrtfUhHDumiXLmb2ubfNY0ugH9hGcDfwq22Ng/BJJCE56y8Zo03rKOpsG5/paCTe/09/dSgtTiJldJ1KW1o68gv4LEcYH4FkUrB7Voy+YmNJfDT52RWe4EAJc7AeZiASvUMnCQmS10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724900798; c=relaxed/simple;
	bh=V51tZLE6chfQqVtSs/q+YZUu4GgCPe8BR7V7YnYADVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfYoLo7M3EX4TCGG9zmwA5UqtlNBm7C1bzYsPls3yJbvha7nkzFkN87Zr0IhxK0slDpwGwpRnFblr523h1+ZLwjAlbMvm2OGR+05TRQ6DG6P9XGx5+WrSb+x+8I1mNpX4PxAn2qlOY1xA4h18ud1g6lym2AfIV6bs5Iv27B5DT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/Q1ulfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D383FC4CEC0;
	Thu, 29 Aug 2024 03:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724900798;
	bh=V51tZLE6chfQqVtSs/q+YZUu4GgCPe8BR7V7YnYADVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/Q1ulfCYH77cN7NSaau2Bh8FRTX9GiM6zpuXJyHVhlz36ylE4JGkY1vvHM/M8doH
	 2xhGyM+JrkWwJxIg0ESf8zBZ8zwjzU4JqYrqXaM89W4snq7vvI4FnX3sahVYUJ5X7D
	 e3dPFTPrLl1twrv+GJFSOFvVZX3hoWeDapI6iVZloGDmiGI1oYynZ8QCy+CueTORbE
	 LA0S0zMHBwft8ZBLUq+OvBceA+WUjL9a1f1W/K8yppefR78l44xrGk6oqxDPvixm9i
	 hwf1iMIpc0sOOyxK5jGSGUOUsu59YAIs2oqIf1VCxVSnfazxZ6fO3/CZkgNt0Ywj+h
	 ZmKW3k90V8dHQ==
Date: Wed, 28 Aug 2024 22:06:36 -0500
From: Rob Herring <robh@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, joro@8bytes.org, jassisinghbrar@gmail.com,
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org,
	thara.gopinath@gmail.com, broonie@kernel.org,
	wim@linux-watchdog.org, linux@roeck-us.net, robin.murphy@arm.com,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	vkoul@kernel.org, quic_gurus@quicinc.com, agross@kernel.org,
	bartosz.golaszewski@linaro.org, quic_rjendra@quicinc.com,
	robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel@quicinc.com, quic_psodagud@quicinc.com,
	quic_tsoni@quicinc.com, quic_shazhuss@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH 18/22] dt-bindings: spi: document support for SA8255p
Message-ID: <20240829030636.GA2208587-robh@kernel.org>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240828203721.2751904-19-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828203721.2751904-19-quic_nkela@quicinc.com>

On Wed, Aug 28, 2024 at 01:37:17PM -0700, Nikunj Kela wrote:
> Add compatible representing spi support on SA8255p.
> 
> Clocks and interconnects are being configured in firmware VM
> on SA8255p platform, therefore making them optional.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/spi/qcom,spi-geni-qcom.yaml      | 64 +++++++++++++++----
>  1 file changed, 53 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> index 2e20ca313ec1..74ea7c4f2451 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
> @@ -25,10 +25,41 @@ description:
>  
>  allOf:
>    - $ref: /schemas/spi/spi-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sa8255p-geni-spi
> +    then:
> +      required:
> +        - power-domains
> +        - power-domain-names

blank line

> +      properties:
> +        power-domains:
> +          minItems: 2
> +          maxItems: 2

Drop maxItems as 2 is already the max (with my change below).

Add blank line here.

> +    else:
> +      required:
> +        - clocks
> +        - clock-names

blank line

> +      properties:
> +        power-domains:
> +          maxItems: 1

blank line

> +        interconnects:
> +          minItems: 2
> +          maxItems: 3

blank line

> +        interconnect-names:
> +          minItems: 2
> +          items:
> +            - const: qup-core
> +            - const: qup-config
> +            - const: qup-memory
>  
>  properties:
>    compatible:
> -    const: qcom,geni-spi
> +    enum:
> +      - qcom,geni-spi
> +      - qcom,sa8255p-geni-spi
>  
>    clocks:
>      maxItems: 1
> @@ -45,15 +76,10 @@ properties:
>        - const: rx
>  
>    interconnects:
> -    minItems: 2
> -    maxItems: 3
> +    description: phandles of interconnect bw provider
>  
>    interconnect-names:
> -    minItems: 2
> -    items:
> -      - const: qup-core
> -      - const: qup-config
> -      - const: qup-memory
> +    description: names of interconnects

No, keep all properties defined at the top-level and then add 
constraints in if/then schemas.

>  
>    interrupts:
>      maxItems: 1
> @@ -61,15 +87,18 @@ properties:
>    operating-points-v2: true
>  
>    power-domains:
> -    maxItems: 1
> +    $ref: "/schemas/power/power-domain.yaml#/properties/power-domains"

Do you see an example of this anywhere else? No. You need:

minItems: 1
maxItems: 2

> +
> +  power-domain-names:
> +    items:
> +      - const: power
> +      - const: perf
>  
>    reg:
>      maxItems: 1
>  
>  required:
>    - compatible
> -  - clocks
> -  - clock-names
>    - interrupts
>    - reg
>  
> @@ -116,3 +145,16 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spi@888000 {
> +        compatible = "qcom,sa8255p-geni-spi";
> +        reg = <0x888000 0x4000>;
> +        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        power-domains = <&scmi10_pd 16>, <&scmi10_dvfs 16>;
> +        power-domain-names = "power", "perf";
> +    };
> -- 
> 2.34.1
> 

