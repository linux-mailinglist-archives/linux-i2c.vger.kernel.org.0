Return-Path: <linux-i2c+bounces-910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D449581A1D4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 16:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89DAE1F23D99
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 15:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343023E492;
	Wed, 20 Dec 2023 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCw+5ell"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C303D97C;
	Wed, 20 Dec 2023 15:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE9AC433C7;
	Wed, 20 Dec 2023 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703084849;
	bh=kACt6JPwQ+PLYX1KQgu28kI8/nyjpMv45tRZJd9+l7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCw+5ellmPNzc61PMLmMU/3BjZEVNcOiISGxPqdr/ezcQta5cBV58BKxAlV+z+Lz7
	 1bk+sikrY9MlZ6Pb4+8aUmAxtRZX8vLRVGt+Tj5DNTgk7XpfrjhnuneBJung+E3FZU
	 gBnsmtyy4laJbKIm0ddIs5Gr8a9v7ku7zotbvLqnLeNCgqFzQYX8PKV58Ej0Ddu723
	 K4mYGawJXeSX0tl8JzObh0EA4nsK6Y/G1gq6LlevUa+ycZMJrVS7nnR8HBuupZbFDZ
	 UeITrTKePywo+Uf4UbN1GdZoeamSYZgshm0J5HMj9STcEYcvMBpGritQ47m9g54yF/
	 kGCNorloXBAUA==
Received: (nullmailer pid 226316 invoked by uid 1000);
	Wed, 20 Dec 2023 15:07:26 -0000
Date: Wed, 20 Dec 2023 09:07:26 -0600
From: Rob Herring <robh@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0
 clock management unit
Message-ID: <20231220150726.GA223267-robh@kernel.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-3-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214105243.3707730-3-tudor.ambarus@linaro.org>

On Thu, Dec 14, 2023 at 10:52:32AM +0000, Tudor Ambarus wrote:
> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
> clock management unit.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
>  include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
>  2 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 3eebc03a309b..ba54c13c55bc 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -30,14 +30,15 @@ properties:
>        - google,gs101-cmu-top
>        - google,gs101-cmu-apm
>        - google,gs101-cmu-misc
> +      - google,gs101-cmu-peric0
>  
>    clocks:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>  
>    "#clock-cells":
>      const: 1
> @@ -88,6 +89,26 @@ allOf:
>              - const: dout_cmu_misc_bus
>              - const: dout_cmu_misc_sss
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-cmu-peric0
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (24.576 MHz)
> +            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
> +            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: dout_cmu_peric0_bus
> +            - const: dout_cmu_peric0_ip

'bus' and 'ip' are sufficient because naming is local to the module. The 
same is true on 'dout_cmu_misc_bus'. As that has not made a release, 
please fix all of them.

Rob

