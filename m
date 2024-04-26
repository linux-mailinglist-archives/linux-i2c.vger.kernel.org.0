Return-Path: <linux-i2c+bounces-3241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B708B3FF0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 21:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81FABB2346C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 19:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F6E1170F;
	Fri, 26 Apr 2024 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPWB69KL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2D246A4;
	Fri, 26 Apr 2024 19:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714158607; cv=none; b=aTE/Cjbaatw2ipFziWCAp2V3LuFcHxl439RlDV4jfPy+54Q6LtBSDGcZ26W4+/L29c/qFHawQz7HNdW854dnA3YizTHf/8MF1J+cSiMbiK9MqDQckEZ+HM7ZXg3ewTmQzCdZrRjoSTGAlxTdnbjbtlRhGWMukyj2dkkouy+TD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714158607; c=relaxed/simple;
	bh=/5D69c/HjZZ5w1KhjR62OOz+fM/4KJRsPcVh8kxgYos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlCtgLhAjtkqbIRynxc89lVEIYZUZ7LcYszCoV9fCUrpM+YD0J2+zYvWjhAPDvQpC/GHrDisjEyNkbE9mtWXStI1vywNmAm9TTEYZIPHKEzruv/y9BOouGRWsSO1pBkVQstT9UhhvDYMpBIzHUnyIkP8pFDocGp+pmbIWO5WZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPWB69KL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD0CC113CD;
	Fri, 26 Apr 2024 19:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158607;
	bh=/5D69c/HjZZ5w1KhjR62OOz+fM/4KJRsPcVh8kxgYos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPWB69KLYOETZ/HxAdPvCyHATYvJFXi7xWJi3xNNbjJlFIn9sXL4RlleII4LtexxY
	 /1dxte7j4pgCPy+w0/lxTGCWnZWnvuZfeTWJTD1L37Ifb/IXJu0erWpJPPWq5bdWOM
	 94MB35DfHtzCm5HNUlBkfcmsEZPUtOOii7CImtjJx5XgqrV6uW9EVJAlHD02pcSWZo
	 9aCsnpd8PiguQE7w16jjkMmk/bljeXcjX3R6xtgaicXZaW3Q68DexX3WLFeYrUz0hz
	 KzEZmXURAq/oWfERJB+jT3JbXVFdJsXyz7I71HeORRKIZomKpmNUcTm2DUBe5sKjpz
	 7VNrvuQzYZPzA==
Date: Fri, 26 Apr 2024 14:10:03 -0500
From: Rob Herring <robh@kernel.org>
To: "zoie.lin" <zoie.lin@mediatek.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/3] dt-bindings: eeprom: at24: Add property dovdd-supply
Message-ID: <20240426191003.GA2655695-robh@kernel.org>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
 <20240426102949.23057-4-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426102949.23057-4-zoie.lin@mediatek.com>

On Fri, Apr 26, 2024 at 06:29:49PM +0800, zoie.lin wrote:
> From: Zoie Lin <zoie.lin@mediatek.com>
> 
> Include a new property named dovdd-supply to provide an
> additional power supply.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 8befd09963be..0ecb7ea76d1d 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -193,6 +193,10 @@ properties:
>      description:
>        phandle of the regulator that provides the supply voltage.
>  
> +  dovdd-supply:
> +    description:
> +      phandle of the regulator that provides the supply voltage.

We already have "the regulator that provides the supply voltage" just 
above.

> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.18.0
> 

