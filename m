Return-Path: <linux-i2c+bounces-2155-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143687052C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 16:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CD31C21C11
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 15:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DEC482D0;
	Mon,  4 Mar 2024 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOd/+P6s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11347A79;
	Mon,  4 Mar 2024 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709565379; cv=none; b=BpaTHXSGDLe01njpQRTbmebqp9I7lsvAow1fLfMmX3TGFiD9IRB+0d9llP/nevvji3e0pNoHChM/gBiCxgP80hnC4wH9INmFyB90Hj3ifhw7iUw1x7vk5Y+qZvhCjq6a0x7LOQ51eSWSgqTmu0BpJZSwtgTjooYkVs3Ke/dzC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709565379; c=relaxed/simple;
	bh=n6eF4OhUt9iY0clWHwZ2SF5Ga4Tn0p7M9AKJEUcdEpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncRHS/I8Hzr+ID5b9CzAPqPcc0nnDXX/8WfnLD+Ebz/a6l+jiLDM4z7fSyx90lO9HFQchcGJa40PW8CTnCk51Quhca+BVldHWrsaqUobgHxkGCnmv1GZPI8YYawpExH9Uf2p+XJB3YjDiuw6MOFKxS9t/gEJoAsRihmdj9qDU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOd/+P6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F1DC433F1;
	Mon,  4 Mar 2024 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709565378;
	bh=n6eF4OhUt9iY0clWHwZ2SF5Ga4Tn0p7M9AKJEUcdEpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOd/+P6s9cWaetEUqDqQiuMlBrLxvwZhJ2d3MlW4VCvEc66s0tQWpltlRB0gt5yFC
	 yGk+rzwkaTqKXihTBe6G6g4w7VJsPc9zoIXnYuA+SO5JIKpqztn8m1jHsR7Qu9DAWE
	 ZSYXpCRBkGFJtoFcyDTv1uGIsDPcSk+d+elhy/yf1KU5zaXOuOEFrK/++x8XQ4Q9NU
	 EXiXcUff6eSoMnYYkr3jhHTBi8QGRHWzEoEw2nq+V6aUpAhgYEsaUfgPyL4xCecCZD
	 aQSsirFhs5evLWtojCc5rsPs4kzr4JNh1UTykK/IYjDN6/WyrCo7VJb4g0W2y3e+qz
	 N2TybLVwJM1mQ==
Date: Mon, 4 Mar 2024 16:16:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH RFT 1/3] dt-bindings: i2c: mpc: use proper binding for
 transfer timeouts
Message-ID: <r3tho2bh3l23f5xkjc3ovq4xdehpsb3nz4ukbkremxvzq6shpe@kdsxfz4brskb>
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
 <20240229105810.29220-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229105810.29220-6-wsa+renesas@sang-engineering.com>

Hi,

On Thu, Feb 29, 2024 at 11:58:11AM +0100, Wolfram Sang wrote:
> "i2c-scl-clk-low-timeout-us" has flaws in itself and the usage here is
> all wrong. The driver doesn't use it as a maximum time for clock
> stretching but the maximum time for a total transfer. We already have
> a binding for the latter. Convert the wrong binding from examples.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> index 70fb69b923c4..b1d7d14c0be4 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> @@ -96,6 +96,6 @@ examples:
>          interrupts = <43 2>;
>          interrupt-parent = <&mpic>;
>          clock-frequency = <400000>;
> -        i2c-scl-clk-low-timeout-us = <10000>;
> +        i2c-transfer-timeout-us = <10000>;

Chris, can you please give it an ack?

The whole series is coherent to this change.

Andi

