Return-Path: <linux-i2c+bounces-7673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B39B7600
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 09:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70840281134
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 08:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C41514F102;
	Thu, 31 Oct 2024 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBi4N3ZF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B8148310;
	Thu, 31 Oct 2024 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730361695; cv=none; b=P0OTcZBykqzJmEu7B6R4CjCjUe9yW9ZGZ83DFv3J0LXnkdNwazgCQk7FUs3UQ+dftU+2T5T2o1CFdcrmR2tgK9wm7fERmgfoPenYPDpBwrwxZB6R6n8rr4gIwUTHzYTyn3b4gf7eLM8thufHlt/bYo/T0OEJdoMpcIhBlo5PaJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730361695; c=relaxed/simple;
	bh=ZPSuHtXiv9KKbKncCUTkQbLPvPAYcIqiVV2yOclbiyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gefTyPkOfoV9cQxEo1KtQ5Ijn6onxd2Vf7FY957echthsHc0oLXUV1xeX0/Rfw1nB/KdkAN//yn4wUQ4CfO9bdXBS1D4CWtPfNPHxRRdAya/yyXs1Qsrp+SYKOMf8pMTmjyWNEQf1R6kiMddG4X3u0Nadk/ZNNEfVxXLGjAtn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBi4N3ZF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD105C4CEC3;
	Thu, 31 Oct 2024 08:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730361694;
	bh=ZPSuHtXiv9KKbKncCUTkQbLPvPAYcIqiVV2yOclbiyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBi4N3ZFmIGz/EGq5Pojb1W/HhOy23rTrcTg4bP8W0biAYv8X5ehwTbJKtlsUyZ+d
	 JPbRc61jxGZ7wDFpW3LEyLjRFb/9Z/97wElo/d8VHNwCzTi1DcaFGjLEmsCjCVR7/a
	 hnUdn0+6DNX/eUuqLa8+ahFHv9whs9i83QCyrbCz1IH0txsKUuj20TDCVdS81NoCDe
	 uzELGkj9xLb3MkzSOPvmrz/QCQUnKtCEJJj3/vOdQ0yd58t71dB6l3lnJESL1MpD+z
	 Urgg9u/e15wN54QoJGpzTBNlxZzqMTvJhi4MGUNmxrEs4QLW9hnyhwIuMorybvkNNS
	 y1m0+CaYQZk6Q==
Date: Thu, 31 Oct 2024 09:01:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Message-ID: <jhwf5xe5h6sfxirjavczs6txihsqukoqqhrrmfoipugsgjkynb@5o72xm5sjr6t>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-2-TroyMitchell988@gmail.com>

On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
> The I2C of K1 supports fast-speed-mode and high-speed-mode,
> and supports FIFO transmission.
> 
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> ---
>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> new file mode 100644
> index 000000000000..57af66f494e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: I2C controller embedded in SpacemiT's K1 SoC
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2c
> +
> +  reg:
> +    maxItems: 2

Provide changelog explaining why you are doing some changes.

List and describe items here instead.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description:
> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
> +      modes are supported by hardware, possible values are 100000 and 400000.
> +    enum: [100000, 400000]
> +    default: 100000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@d4010800 {
> +        compatible = "spacemit,k1-i2c";
> +        reg = <0x0 0xd4010800 0x0 0x38>;

Missing second item.

Best regards,
Krzysztof


