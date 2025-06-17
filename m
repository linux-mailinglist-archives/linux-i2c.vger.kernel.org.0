Return-Path: <linux-i2c+bounces-11499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2FAADC2F1
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 09:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE3A188ED50
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 07:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C205428C5CE;
	Tue, 17 Jun 2025 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIcGJfRH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521318FC80;
	Tue, 17 Jun 2025 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144406; cv=none; b=XPJlK5KepCT3UKjwlry8CuHsT/lMHt9TuN4EpE3TsK1oNF9q1fZy9u9uV64NrOBUHDGUjX4yMAbKQYYNvisXpsMdR5SoDNRdsG1yHQn/DY19UYU0NjHPicMHPkkpN/OzEPCxguoHlshuSVKw0jUepqQMHOJdzgtV2U8KPKR0pDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144406; c=relaxed/simple;
	bh=YWTNeYGzyRXxhBicUfqKhEMGKeP2ckWPV4gZwF9FRbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/zO3MacDWYRYZ02S+w1lm1xySHFGpR/9DGmNOe1fOUdpWXFAiRZkrojqnycfyRgKpKgaKELZJrIkOSg8HWnegwlIy0XhDEHYhFzzbDsXC8+ZIAL2gO+rKXWDVxUwFROsRuZCWHlikbk5Oj49lpg8wF2fBCuo3GgoMXVdIjlU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIcGJfRH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65595C4CEE7;
	Tue, 17 Jun 2025 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750144406;
	bh=YWTNeYGzyRXxhBicUfqKhEMGKeP2ckWPV4gZwF9FRbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIcGJfRHFkReyoUuejxmutlhq12hQP3PsXQwMt1djLpk9ZEY2iDR1kdYVk8Ztqvsu
	 ja+dtbvk4cMnGfFC5vcNfy9+gVbeF8zAcKhFS2rBI0pu8qdAB1APqwv7j9nPlyA9fK
	 +bd5n6UN/2hXpeVW+O4GRxyaRpsM0QrwsKRb7PWO2QFn3ygn7Jw/U8immlWqJi1R9G
	 cax0+YZ8AYBo5/ve1NDI8EFtLZ+RzQ0hNolUYFDDMtcaTEU8iOYd0lnYpdy5S/GJ/O
	 CKLeqo0GkokZDeOhQoSuJqz91slKuM5UnxQC3TpjovjFwwXkqYqsMdR7I3dsGwZRDj
	 4HZg0yjKFjsCQ==
Date: Tue, 17 Jun 2025 09:13:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H
 support
Message-ID: <20250617-enthusiastic-anaconda-of-tenacity-2f79e2@kuoka>
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250613113839.102994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613113839.102994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Jun 13, 2025 at 12:38:36PM GMT, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/N2H (R9A09G087) SoC. The RIIC IP on this SoC is identical to that on
> the RZ/T2H SoC so `renesas,riic-r9a09g077` will be used as a fallback
> compatible.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> index 86d79e167547..6876eade431b 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -33,6 +33,10 @@ properties:
>            - renesas,riic-r9a09g057   # RZ/V2H(P)
>            - renesas,riic-r9a09g077   # RZ/T2H
>  
> +      - items:
> +          - const: renesas,riic-r9a09g087  # RZ/N2H
> +          - const: renesas,riic-r9a09g077  # RZ/T2H

Where is an entry renesas,riic-r9a09g077 alone? Please add complete
bindings, not half-patch and then next time second half.

Best regards,
Krzysztof


