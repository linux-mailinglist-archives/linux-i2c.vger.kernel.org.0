Return-Path: <linux-i2c+bounces-6111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2996B1E2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEDDE1F26F64
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD6313AD27;
	Wed,  4 Sep 2024 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0K1rEV0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B51386C9;
	Wed,  4 Sep 2024 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431765; cv=none; b=p+ipouySPgjQv/PpXIsz0dNI9RKfUkH7GdsZBZUn0qI/WxRcB6P1vq4S01Sz0fzM30E7WNFf2jxKfkpyBJohz1OzltVPoSu5QG50tW9x2stFtl4ITnhh4PI6adetZsa2+rJcxVlM+RmhoY9d2F7lhY+2svOsyw49Dy/89pURV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431765; c=relaxed/simple;
	bh=Um74wIh1LdXhHdkoqUGTdIpwMzfF2FXrkiCymEQeJHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffFw/5J2ZSNXp+ozRufL2WMgO1rEUUtCPNto5M60nGeuaZXgzjJSj1gWKBD60VpIchBgUheSzKJsuJdWIU6K1JkBfSB+ZxDOkaZlhhKu3MHqimxdE5A24XneN0Vbsf715U5RVnll7itkZy5wEedgsFVnuy9vkXKiCFEdpKKCPSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0K1rEV0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0707C4CEC2;
	Wed,  4 Sep 2024 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725431764;
	bh=Um74wIh1LdXhHdkoqUGTdIpwMzfF2FXrkiCymEQeJHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0K1rEV0GEFfZLnBlmg3rYpcpFxHIZ/NSwqgeUuAGYlx6UH++m7HYoOdXh9ljP7Hj
	 NchU51X4wkysQ+9H467Hc6elpCj6RjWzLAQE9stfJ+PttowpN2FTgLW8JO7mgVhQpg
	 rtzdd9Y4T95CaMH55ZQPZ5GbrDs2oelHQSo8yh6D0zHg9tJZRQdFPGnj9gz8hpSnJI
	 3w+fgyhBl8B54sWRChNcac19zFxWwp7GFuowrME8+maeJhnSmgEJxChMH1f/5CMCXQ
	 MsATD6OwTqG6mOj4p3s4ZciBsN3OxWVXduMyB6NSIR8kjqB0cNcKrlsHYdS6EVURYv
	 ZPvrgBz1O8tEg==
Date: Wed, 4 Sep 2024 08:36:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, 
	tglx@linutronix.de, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 17/21] dt-bindings: serial: document support for
 SA8255p
Message-ID: <jzpx66l4tesnyszmpc3nt5h7mezbvdhtcbls5rbwlmpveb6d6y@i3jf7jsajjjd>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-18-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-18-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:36PM -0700, Nikunj Kela wrote:
> Add compatibles representing UART support on SA8255p.
> 
> Clocks and interconnects are being configured in the firmware VM
> on SA8255p platform, therefore making them optional.
> 
> CC: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../serial/qcom,serial-geni-qcom.yaml         | 53 ++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> index dd33794b3534..b63c984684f3 100644
> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
> @@ -10,14 +10,13 @@ maintainers:
>    - Andy Gross <agross@kernel.org>
>    - Bjorn Andersson <bjorn.andersson@linaro.org>
>  
> -allOf:
> -  - $ref: /schemas/serial/serial.yaml#
> -
>  properties:
>    compatible:
>      enum:
>        - qcom,geni-uart
>        - qcom,geni-debug-uart
> +      - qcom,sa8255p-geni-uart
> +      - qcom,sa8255p-geni-debug-uart

Why devices are not compatible? What changed in programming model?

>  
>    clocks:
>      maxItems: 1
> @@ -51,18 +50,49 @@ properties:
>        - const: sleep
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domain-names:

This does not match power-domains anymore.

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
> +allOf:
> +  - $ref: /schemas/serial/serial.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8255p-geni-uart
> +              - qcom,sa8255p-geni-debug-uart
> +    then:
> +      required:
> +        - power-domains
> +        - power-domain-names
> +
> +      properties:
> +        power-domains:
> +          minItems: 2
> +
> +    else:
> +      required:
> +        - clocks
> +        - clock-names
> +
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -83,4 +113,15 @@ examples:
>                          <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
>          interconnect-names = "qup-core", "qup-config";
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    serial@990000 {
> +        compatible = "qcom,sa8255p-geni-uart";
> +        reg = <0x990000 0x4000>;
> +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
> +        power-domain-names = "power", "perf";
> +    };
>  ...
> -- 
> 2.34.1
> 

