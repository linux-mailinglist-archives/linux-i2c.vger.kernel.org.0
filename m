Return-Path: <linux-i2c+bounces-7274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0499504C
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 15:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBBD1F255EE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 13:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151CF1DF74A;
	Tue,  8 Oct 2024 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0GtUDRq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206017C7C9;
	Tue,  8 Oct 2024 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394708; cv=none; b=mEwVKIrmz8Ia71ab/DfrjtkvGlefOIE7Oo+Jgzi132lo8EDhxE6rNUkPbBwWG0GThfi2OLp2sATZoSSPe3uESTXDxAjJXpF8E8AP6QLklIz8xs+BAQQRzRUtjwJ1mOqkCDHf633Cfk9CwH0WnK0rwapr0gdV/PvTJOKYvo18q2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394708; c=relaxed/simple;
	bh=YMb/iZclSP6BFiRPUkuJJ/btEtkFBaCgeFmskcO8srg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWmcwOCWWRczX/bsP6dWqKtUPKx5kP6DQhpIHbpDsdEHZJ9L7Bcgbqq05MaS8ctRLkCPKAX0sxY8oqG5dQhtjfv9cJDcXh1YmYhzKp2Sf9urfhZw1GB/Bf1+BP+fRhi4AftTc2avHp6jJpCDO890WomZOHb6z5uCAm6BhysSlNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0GtUDRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1C6C4CEC7;
	Tue,  8 Oct 2024 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394708;
	bh=YMb/iZclSP6BFiRPUkuJJ/btEtkFBaCgeFmskcO8srg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0GtUDRqYVDIB7PEQbgb1cDf4D8jSbMlMXnCZ3JGDC7cyG36V+XDMOgjFFXYh2J8w
	 JLdnc6FL8UrQmTj7wQzm0W3BwBvwohgb594QGJYUp4JofYxGSf8iRqzK4SVfjUuAug
	 0RZKtCg1MI3V2bHky6ajJFFlErB/6vdiqgDe5NFTtIqeK3no5hy7I4HixDPzbvfpVP
	 NqW36UaTXK0NW4XOunnz2pzrOvI60nDxLgudvRDoqLtjDcaBOUrqraw5TPMpgY150Z
	 nklim0e0nHlyZudZk/J4YEriGaaATn3jRn/kKUWL8qcRIcWWfnV5wgx/BMXzIImGJu
	 9APKeQ3XeaYQw==
Date: Tue, 8 Oct 2024 15:38:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c
 bindings
Message-ID: <uaqb7wgplq3elc2psf2xqly2jk4abyyc2levn5rbxjs2qzokro@ky245suc47b2>
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
 <20241008-mbly-i2c-v1-1-a06c1317a2f7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241008-mbly-i2c-v1-1-a06c1317a2f7@bootlin.com>

On Tue, Oct 08, 2024 at 12:29:40PM +0200, Th=C3=A9o Lebrun wrote:
> After EyeQ5, it is time for Mobileye EyeQ6H to reuse the Nomadik I2C
> controller. Add a specific compatible because its HW integration is
> slightly different from EyeQ5.
>=20
> Do NOT add an example as it looks like EyeQ5 from a DT standpoint
> (without the mobileye,olb property).
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml b/=
Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> index 44c54b162bb10741ec7aac70d165403c28176eba..72ecb6efa733f7878bd807df2=
77bfc13153bf71e 100644
> --- a/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
> @@ -22,6 +22,7 @@ select:
>          enum:
>            - st,nomadik-i2c
>            - mobileye,eyeq5-i2c
> +          - mobileye,eyeq6h-i2c
>    required:
>      - compatible
> =20
> @@ -38,6 +39,9 @@ properties:
>        - items:
>            - const: mobileye,eyeq5-i2c

This should be enum in such case.

>            - const: arm,primecell
> +      - items:
> +          - const: mobileye,eyeq6h-i2c
> +          - const: arm,primecell

Best regards,
Krzysztof


