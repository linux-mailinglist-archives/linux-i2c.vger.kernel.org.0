Return-Path: <linux-i2c+bounces-7478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A69A407E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 15:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8497828817F
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 13:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CDA20110B;
	Fri, 18 Oct 2024 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyTfWsGC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8F2010EE;
	Fri, 18 Oct 2024 13:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259595; cv=none; b=oju76S2IzHFfTFOEFuvdcsk4wGzCkcM4ageTeC//acMnw2kGCAW8uRnUf9TdcPgDfa35Kmdr59WMVbWrv7zOEmMcZB29TlbUjIX/43s723HiYMp9dBd1u2z2ZE9ennA33thM3rubw7znJ28Pg5ihTXJ+Ic1BImIUCJsFaanHXqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259595; c=relaxed/simple;
	bh=f1mO30JIws68FKWhn6Nc99NCDoEbGvfLG0lKrfaS32A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ya8uDGRwMPBnNRiJd3OQIJ9Slpxv5s/VQWHSyf5Q2T7UQN3J17BkKH1piqoyfCC6PmSUmSw2uKAxLQTdKajjZbdG+rhAlV3W8m2XnulxlSrCw5cNrJPgkJf2OGCainrZZwrAEbPmjfcYoO2l/xHGLz4dMKuqA0sI9/evznvncEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyTfWsGC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFDDC4CEC3;
	Fri, 18 Oct 2024 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729259595;
	bh=f1mO30JIws68FKWhn6Nc99NCDoEbGvfLG0lKrfaS32A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyTfWsGCvrdNvdtdP2v6mowNQTpwkQRy1kwWzwgc3kquMjvTdL8u94RgZFLdK4vSD
	 HFaF4AKdHwg+wkTnNR0+tHf7JnFfKvMWE//kbzEAxCjELsLD7oNdlLn80YQD70/1pY
	 osYLDyxauLpolayHu+A5WzM1jwdi0Y/2ohKHUsNVZpx8Y4hC1SG3XoU0S5cuhhA/fv
	 LSOjOF6pZlJsz7i8Wp3DLHVv/qeV5FbaXuZkc43NQ4p+jhzNNGtkx/3Hij1Npk3iO4
	 Lt+ykN012RxRQqCxLzlEk2dOIATygV9Y+KnwYU3OVtkBZ3U6l+TVYrFb67IN0iObAN
	 WWbtEQctklm0A==
Date: Fri, 18 Oct 2024 08:53:14 -0500
From: Rob Herring <robh@kernel.org>
To: Wojciech Siudy <wojciech.siudy@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, andi.shyti@kernel.org, peda@axentia.se
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset
 property
Message-ID: <20241018135314.GA91900-robh@kernel.org>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
 <20241018100338.19420-2-wojciech.siudy@nokia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018100338.19420-2-wojciech.siudy@nokia.com>

On Fri, Oct 18, 2024 at 12:03:37PM +0200, Wojciech Siudy wrote:
> For cases when the mux shares reset line with other chips we cannot
> use it always when channel selection or deselection times out, because
> it could break them without proper init/probe. The property is
> necessary, because reset lines are board-specific.
> 
> Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
> 
> ---
> Changelog:
> v5:
>   * Declare dependency of a new property
> ---
>  .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 9aa0585200c9..37882a5a8c87 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -63,6 +63,11 @@ properties:
>        necessary for example, if there are several multiplexers on the bus and
>        the devices behind them use same I2C addresses.
>  
> +  i2c-mux-timeout-reset:
> +    type: boolean
> +    description: Sends reset pulse if channel selection or deselection times
> +      out. Do not use if other chips share the same reset line.

If you have a reset GPIO for the mux, then why wouldn't just use it on 
timeout? What happens if you timeout and don't have this property? Just 
give up? 

Does the timeout time need to be configurable?

> +
>    idle-state:
>      description: if present, overrides i2c-mux-idle-disconnect
>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
> @@ -88,6 +93,9 @@ properties:
>        register activates a channel to detect a stuck high fault. On fault the
>        channel is isolated from the upstream bus.
>  
> +dependencies:
> +  i2c-mux-timeout-reset: [ reset-gpios ]
> +
>  required:
>    - compatible
>    - reg
> @@ -146,6 +154,9 @@ examples:
>              interrupt-parent = <&ipic>;
>              interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
>              interrupt-controller;
> +            reset-gpios = <&gpio1 27 1>;
> +            i2c-mux-idle-disconnect;
> +            i2c-mux-timeout-reset;
>              #interrupt-cells = <2>;
>  
>              i2c@2 {
> -- 
> 2.34.1
> 

