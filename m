Return-Path: <linux-i2c+bounces-11982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED31B0C059
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 11:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA1AB174210
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 09:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817428B3F7;
	Mon, 21 Jul 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAoj0vA4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417D428A1DE;
	Mon, 21 Jul 2025 09:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753090324; cv=none; b=GAN8QljHctOeVxWL/hk39i4Pt33mxCPqsjBlCwfob9lM4kUmjHCNNZfMeswt3vYdTuewd9enWUVB+NN9KNSbqHcg9IqVVpz2Gs2Pd2OltrwXmpPgRhuSRO02Ba0t4Gnkmc1N5gkoW3UlC6A1NTPONySZDMzhTESA1IxeLDnqrg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753090324; c=relaxed/simple;
	bh=tMQd51DR2PhlSANSMzu8tnUKCfa7HWDsrUeedOQDGV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZm8dSXJs0kZ7UnB9T97thnzU3jS+de6IUSP+IceEgMK/9wcxirCjGGsitlFS4xUo4/hmnNOJvlDaiWMXc4fIO1hgVYzRqggaGfibxNogAtDzCT0WlE5s5gmp2D1NOtCdpfNH/FO3cwozdKxhYfWmpul2iLa1dU+/FCZtM1ICUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAoj0vA4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67591C4CEED;
	Mon, 21 Jul 2025 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753090324;
	bh=tMQd51DR2PhlSANSMzu8tnUKCfa7HWDsrUeedOQDGV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAoj0vA4RH1GRqkxXn895QzFv0xG59k/y01og9h9chrcRef6I1zl+kY8HjU/CScJO
	 fY6cqeDqwoJnAHxHg5TT0pPw09FzspU5f5hyj8JuGqtHfoWALjOkzT+D1yKkCVCLir
	 LkmBbUIU1HkWq/06QbM/t0zB4AjvW2jMyvv0tuPNjzt/l9bsiKFDea2bnq8JBtnwn4
	 lEN+sm57+hqBfZ91Bs8LemSMzLfr5/ulb8jaQXyTYeM5sbgAtv1iZnB/jRYbe2Olce
	 X0eZUchellO9l6S2rSHcDoS8eZy12eh7DMSKJ4kpvXVOYnAbij6mH1lfnqStNVZ6KI
	 bFeg8JqF8qZPA==
Date: Mon, 21 Jul 2025 11:32:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: i2c: mt7621: Document an7581 compatible
Message-ID: <20250721-amorphous-perch-from-jupiter-cecfaa@kuoka>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
 <20250719125617.8886-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250719125617.8886-4-ansuelsmth@gmail.com>

On Sat, Jul 19, 2025 at 02:56:13PM +0200, Christian Marangi wrote:
> Airoha SoC implement the same Mediatek logic for I2C bus with the only
> difference of not having a dedicated reset line to reset it.
> 
> Add a dedicated compatible for the Airoha AN7581 SoC and reject the
> unsupported property.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/i2c/mediatek,mt7621-i2c.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> index 118ec00fc190..38118007b601 100644
> --- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> @@ -14,7 +14,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt7621-i2c
> +    enum:
> +      - mediatek,mt7621-i2c
> +      - airoha,an7581-i2c

Keep list ordered.

Best regards,
Krzysztof


