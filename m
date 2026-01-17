Return-Path: <linux-i2c+bounces-15247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3AD38E57
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jan 2026 12:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B22C301D5AA
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Jan 2026 11:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB2F30B535;
	Sat, 17 Jan 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxwERz+c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3227FD75;
	Sat, 17 Jan 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768650901; cv=none; b=k+GkFBVSphQBSmWz+bgf9KsPbRhYW23eCM2Bosdmdqd0cOLzBcVf5HeM/Ztr5KA3o9tcbZ8Cm/XFXo9l8mZ5MCEjkNcv1C/OI8TjWoCVe3ThEl0AO2HePm5XeG6o2copJOGsZvc1DzTq0Yi775wSPsu1474o355DrYme2hKmOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768650901; c=relaxed/simple;
	bh=zFMOe005svxDsEjnge2FB7+UlCYUDnusP7mG2pZ9H8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIsJ2ySVx0EgT07SqxCagVTcgE4v96pqDPD5tQO75/tS8ulue1Bz93pMdcibvuG828256Aag/C2fp4RAg/5ZY9mIG8iTH0fMWLbb0oa8AkPorEOPeo54CY2sHaHPlFF/H2CVA8dBOXu/K7EsfPNWFoEToNT0O0q3s4m0Doi6Gqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxwERz+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAA8C4CEF7;
	Sat, 17 Jan 2026 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768650900;
	bh=zFMOe005svxDsEjnge2FB7+UlCYUDnusP7mG2pZ9H8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxwERz+cvpuEokpLt9OXFsZ+t1SGbDOfkikqQ2YZ5GivArx+EtImAC4rGYPZ4+NtH
	 7h85HFhnFIhhwjIXULp1AegeantNgb+UdB/Q0sYvjIS7IZEoZ8FoWqTsloj9e9IXIw
	 E+vNl1ztHTg8hg9R3RF2whoI/6B7wz936bscIXnJrTSRvuRQu4a/jhE2q52PGLHrPa
	 AihCLXZfFzL4LkZa1E5wbWyVQ5DI/Gvy76ljoxEABIpz/U9ancRLsZVKR+Lff7+Xa0
	 36uL4szZV+sAyMMFbmz03qv2fojSuMVasDIqPuH8v3aUvw0Ez9hhRtgwf34723N8sC
	 mHygMGARGFTfQ==
Date: Sat, 17 Jan 2026 12:54:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos compatible
Message-ID: <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>

On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
> Add Milos compatible for the CAMSS CCI interfaces.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index a3fe1eea6aec..c57d81258fba 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,kaanapali-cci
> +              - qcom,milos-cci
>                - qcom,qcm2290-cci
>                - qcom,sa8775p-cci
>                - qcom,sc7280-cci
> @@ -263,6 +264,23 @@ allOf:
>              - const: cpas_ahb
>              - const: cci
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,milos-cci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: soc_ahb
> +            - const: cpas_ahb
> +            - const: cci

Same comments as other discussion these days - I guess that soc_ahb
serves the same purpose as camnoc_axi, so this is just last entri in the
if:then: blocks.

I really find this binding terrible - around six names for AHB - so I do
not want another combination...

Best regards,
Krzysztof


