Return-Path: <linux-i2c+bounces-14229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A31C7CE9A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 12:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1EB54E55F0
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 11:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198AD2FF157;
	Sat, 22 Nov 2025 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mu/+M7iZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E542EE5F4;
	Sat, 22 Nov 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811656; cv=none; b=hFlNFUZO/sni0vI6x63BtgsqotrQO8kOhMSNjC12/PBPknA7adF0N6uo0OnfZn75KbQwTjBBgEqnQN0/6/Dz29Ja91jLSWYJzbBL0K3SdoJwLEItbGez4G2qZ+ZCj0kyeR2mGTzwzbIxVhsQC60IKssm25GbMTnLLSCJ3sFJAVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811656; c=relaxed/simple;
	bh=OmANHln1dcDHLJMLYu8QVGXHmGGhqMDOGQUhqZeKDio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SThUQLdep/DUKX+Xk5RW0mXAaUEUIWnOKV1vuwqJ9iDzxvArcrnxHPfDeoYVQ/FjanTpvkZj4c6MMUYIloXsWFSO7T60GMRC3GYZ/V3N3JKbRyZ45HtO+/kgBR+yLZisTJZH3NbEWn/n5i0/8HdeHGK+iJJH0hAkS6jpMz9TCi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mu/+M7iZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1B4C4CEF5;
	Sat, 22 Nov 2025 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763811656;
	bh=OmANHln1dcDHLJMLYu8QVGXHmGGhqMDOGQUhqZeKDio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mu/+M7iZsh4Ie6v72+Gm6ethsMdSczRfNsWRH7XhGfWQ3Sv7l7wloaacP34PsRr6w
	 k52Tt5FlDcl4RfQi0NyYhzKbki+rPPwk07oqpvoUkPoDTvUck8abeyMmK4Qspv8whQ
	 Ht/y2v3AXOdowHGNyFAZ5aIIHxZ7AVyLyIGsGXWIlSLxvWSGkqGwCwZUtzwblgbOVs
	 850qfgdGjjbIXvWMI3juQUiZKBtnOgHx0qK+K97Pr87/mQ49UXzB9dswlUpNzr0toy
	 doyjpAMFnoOoJxRY151CmmdYhSONuL5S/Y44BJuCvYk3NxgDrLsO0XyhBUCskPyVb0
	 lrpi+Lp6drFGQ==
Date: Sat, 22 Nov 2025 12:40:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, 
	quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v1 07/12] dt-bindings: i2c: Describe SA8255p
Message-ID: <20251122-rich-imported-buzzard-b7aae7@kuoka>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-8-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251122050018.283669-8-praveen.talari@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 10:30:13AM +0530, Praveen Talari wrote:
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: power
> +      - const: perf
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +
> +allOf:

So common SE properties are not applicable? If so explain why in the
commit msg.

> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c@a90000 {
> +        compatible = "qcom,sa8255p-geni-i2c";
> +        reg = <0xa90000 0x4000>;
> +        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
> +        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
> +        power-domain-names = "power", "perf";

dmas and dma-names

Best regards,
Krzysztof


