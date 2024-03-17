Return-Path: <linux-i2c+bounces-2375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA3D87DFDB
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Mar 2024 20:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24EDE1C20B1D
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Mar 2024 19:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858511EEFD;
	Sun, 17 Mar 2024 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSGd6i7y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC771EEF7;
	Sun, 17 Mar 2024 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710705455; cv=none; b=duYK3etvb2bn6Sat1U7GoBvp6VOeoACtLQZ4cuJYOF8SD6nzRhHjNJ997UTgd+ZKCOTYe05yHk0em1gB/vHwT0JaO+BOAJsDKtFUcNTMp4y4sW5gUWImzhfqsnZES0NhU1LD12ZcGxOhd5JpiBGWmO5Qb3OrjCpDaG6znMl8aII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710705455; c=relaxed/simple;
	bh=FgX5T3yUx4mVZniMyah6vZEby0sv7GouNppYSSRY6oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hr1Fv9zeY33qsMu24eSqngvnURz/7Bvi4Hb1WmSpB1gGWwybNxRnHJaU84c/oYCRMRpkaddtESa/2WiOCAJgPGKPJGrw4TCUpTgQ0Zjg6dW7abQ2W713N9WsiER0o/StnLUGKA0j5wPQ8Nt5pYq6gJYsHMMQdi3MTY0qUmVxQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSGd6i7y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAEDC433F1;
	Sun, 17 Mar 2024 19:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710705454;
	bh=FgX5T3yUx4mVZniMyah6vZEby0sv7GouNppYSSRY6oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSGd6i7y6/FdrLF3xnSQPbsAjQ259C+y7zZ0PXh1pDLJTYJ82z6v6i3PcCpxGLhGP
	 UBOFwAlnOt6F3wqKy4CFA/cCHgTmwmkSb7r7WwC1INE55aDy+NP/h0HPB6HeLjKgtG
	 e/iXx8x80muqVxaKtb8Ce43aH/NEecomIqzNGnYYDBkdssxJYCuMVDdipWR7+I4PQV
	 bJHJRxHR3CwO9Hij4feMaF2GA6Nop39kDkmLXlxENB+fFos44ulY9OyGOTZ8MWLswm
	 IXTgXRMoK5kqSvUvBMg7DuAHjlUP2gqzlzaOIn9IyoLVJlp1PLpgjkKVe9ew44a1te
	 qW/02Od73Ix0w==
Date: Sun, 17 Mar 2024 13:57:31 -0600
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: renesas,riic: Document
 R9A09G057 support
Message-ID: <171070544995.2123048.6901771529313923395.robh@kernel.org>
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315103033.141226-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 15 Mar 2024 10:30:30 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document support for the I2C Bus Interface (RIIC) available in the
> Renesas RZ/V2H(P) (R9A09G057) SoC.
> 
> The RIIC interface in the Renesas RZ/V2H(P) differs from RZ/A in a
> couple of ways:
> - Register offsets for the RZ/V2H(P) SoC differ from those of the
>   RZ/A SoC.
> - RZ/V2H register access is limited to 8-bit, whereas RZ/A supports
>   8/16/32-bit.
> - RZ/V2H has bit differences in the slave address register.
> 
> To accommodate these differences in the existing driver, a new compatible
> string "renesas,riic-r9a09g057" is added.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Used a const for V2H SoC instead of enum in items list
> ---
>  .../devicetree/bindings/i2c/renesas,riic.yaml | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


