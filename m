Return-Path: <linux-i2c+bounces-2097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0986E397
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 15:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B26AB231AB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 14:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB9B3984F;
	Fri,  1 Mar 2024 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwt/JV20"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461A2B9D5;
	Fri,  1 Mar 2024 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709304145; cv=none; b=vD/d1Qkz4OgV2Wt7lU+6Kc77CdXsAF9tYs5WqfMGm+m0Pw4KmtvjRY0dc9V7hqbzvUyjEmqtAmHojbGqPGCoe3CSbiXxhitcfV9HN1PVb6HEnUfUcIHtl0W9u5jC6JteFqwzNpmdZb7Wi4CpS+KpMRdUpR3Vy9xeubM63j3oPjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709304145; c=relaxed/simple;
	bh=KACukKEnJXFukkXmjTQgXX49As3BIWd4peTBZp//0+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dawNzIQS4RU2K5We8S5sOGMvfxb1Lwk1/+Bjt1vMfbVd4Jl0lfpxTtLrwzRSCFuXpkDRmBfR0860hL1Qhrkf3pupG+/5/d395tOyZRvCKnAZf2rdP48Guw8/PBlFn7xYJx8E2Fj2AfV5860totF/3IxWlnAL7cHx0DVokefbUh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwt/JV20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE57AC43394;
	Fri,  1 Mar 2024 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709304145;
	bh=KACukKEnJXFukkXmjTQgXX49As3BIWd4peTBZp//0+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwt/JV20KkXI8J8VpICUQOxmVPe6+NHLfVYlc86oQ9FPfArN6MtXomfjwSVPFszDH
	 Ipu6JRvPLOml/w5gvOrbOBnU7WxI3EhmAiDbDNNTX4cGB0l6FO48YoByHfLCbNYD1H
	 O0X4beCpos/ilRve896KhZub+JYKhhwq4g+m59H5b2itWyVx0yutBZnp/A9Go8zyPh
	 fw/hdy0sSu2gpgvCyL/8A/kLmzJxT/1uVhypWoYPAAjGuiGYlrlbE1rf4ioJ03lMnZ
	 YjNVpEDyWPn6IyMMLpxDzlm+BB4JLdKBWkALkximtSU9EgoQzLztKhJ5ydgOFIW4F3
	 K78ScNPXaX9Gg==
Date: Fri, 1 Mar 2024 08:42:22 -0600
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RFT 1/3] dt-bindings: i2c: mpc: use proper binding for
 transfer timeouts
Message-ID: <170930414189.2106142.4220146551084193594.robh@kernel.org>
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


On Thu, 29 Feb 2024 11:58:11 +0100, Wolfram Sang wrote:
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

Acked-by: Rob Herring <robh@kernel.org>


