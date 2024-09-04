Return-Path: <linux-i2c+bounces-6108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06996B18A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7772B260AA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB97A1369BB;
	Wed,  4 Sep 2024 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww6Hsuva"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461A84E1E;
	Wed,  4 Sep 2024 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431213; cv=none; b=KFvOr4ioRlOjCZCXBaVgG7KY+8o9acCZlrZIa0tSlfjhbGrwlfVT/3g9m7lTv2NZzKX3/3vzHJrFIcnnEPImmkDLD32FrBZMShpBr0+E7YfF2IklrWMr34CfV5qnO0tm3bcODBHC2tbT1seDlWcnsDIj96oRT9TfaWF/cE+5Xsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431213; c=relaxed/simple;
	bh=RmpdR+X9w1gzHbfsnASUbF/p7A/S9q/2q1c6kJFc5kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezXWZU1fVe9lywwBO/Q+p5tN0XibloMh9K1trS1Mtp+5bSBcQF5MDA8fKKrNSEh5mXPAr4ZkXwJ7isjLQQTVuJiBBqhIql/Wf4u618LbX4shmGCpSGdE29UjO1kL8f62R/maRD4cYZMb1bO5TDdRiBPiAfXDlRsKyH/0poMwSTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww6Hsuva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D87EC4CEC2;
	Wed,  4 Sep 2024 06:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725431212;
	bh=RmpdR+X9w1gzHbfsnASUbF/p7A/S9q/2q1c6kJFc5kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ww6HsuvaZwF5+UDueVf91esRUFcs9juXzsYObo34P8HmsLMIgT2ZPWtWcwBcHoCql
	 r1lWz0hKIgmkub8U2E45Z/jskfNoElJ6MRRDNI8lKmVyE9/lByLMQNm+NzjRX4MFbY
	 x8wx6W3ih5IiywjdxtlC+lN5X9kGvKMOy6Zpu8urWSOi2B0yZ4B3V1Mf+hxm0W1GW0
	 u0Fb92KPzxzG+4VdhrNPtQplaMuXdFJxrrBppQ3JD+usnUToXjMTUZlzkMsfMeE+Bt
	 0i6e5CCOhlpQGwsrIOZe91AmZHDjHgEDhBsoyq0RU+MQEyzwCmpgo0kTXB+NqPfDNM
	 m/3b7Rx763+Xg==
Date: Wed, 4 Sep 2024 08:26:49 +0200
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
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com
Subject: Re: [PATCH v2 14/21] dt-bindings: cpufreq: qcom-hw: document support
 for SA8255p
Message-ID: <odg5ssqu2soaqp6m4rambj7qhqiyp7othkvu4v6fu6xtuhbdho@vccya6qcwgoz>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-15-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903220240.2594102-15-quic_nkela@quicinc.com>

On Tue, Sep 03, 2024 at 03:02:33PM -0700, Nikunj Kela wrote:
> Add compatible for the cpufreq engine representing support on SA8255p.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 1e9797f96410..84865e553c8b 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -34,6 +34,7 @@ properties:
>          items:
>            - enum:
>                - qcom,qdu1000-cpufreq-epss
> +              - qcom,sa8255p-cpufreq-epss
>                - qcom,sa8775p-cpufreq-epss
>                - qcom,sc7280-cpufreq-epss
>                - qcom,sc8280xp-cpufreq-epss
> @@ -206,6 +207,21 @@ allOf:
>          interrupt-names:
>            minItems: 2
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8255p-cpufreq-epss
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reg-names:
> +          minItems: 2
> +          maxItems: 2

What about interrupts? You need to constrain each of such lists.

Best regards,
Krzysztof


