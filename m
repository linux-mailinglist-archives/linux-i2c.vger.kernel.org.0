Return-Path: <linux-i2c+bounces-5691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF295BB18
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 17:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F23283989
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEBF1CDA05;
	Thu, 22 Aug 2024 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoBqUWbS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95BB1CB33A;
	Thu, 22 Aug 2024 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724342012; cv=none; b=WGC0mt1xYdo7tASc0Uw8cbrJvgnFApyfRBJ5YLEJnjn7RAZcAmPiGP17irRrp/dW6EXqxH9/l8Su/KI9Op8rV8mTmFo0ICedlOUodJGLVvWTcuoM1otRiToyOsOWyIEzR3CQnP84IMPcn8B2lb8k5ZL9Gp//3kH5GhwsDp6+OmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724342012; c=relaxed/simple;
	bh=y8Ghfe/tRkWEXDuR4Lt66t9U6fIcWdkJxTjW9OqUWss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzwGvMLbx9dpTrIolVS+hbGiU+QJPfj3aQopYHW6mgcz9Jck87Z/ndVsCO55MyVArgeEEUC2qyepb8meerKIVUBr9HVnZd7GhHwIbMlBFQDZkNaL3uPpu/TnlOtgRHYl2EC57j6LWh5Mxfkn/3C0osF6SDKa/16isBkl+Ugme8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoBqUWbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97399C4AF0C;
	Thu, 22 Aug 2024 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724342010;
	bh=y8Ghfe/tRkWEXDuR4Lt66t9U6fIcWdkJxTjW9OqUWss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoBqUWbSPmX9Pg8nA8QQm3Iu2itlnQcAwlPS/64dWFUekUSXYIn4EAlVNBJAMjvQQ
	 wwgFtfoPcrSWsY5VN2Z2qSQh897FGGCpBr853lZfm1deo8Y11o+IMAFUr8NXfTAklp
	 PAILip0H3otcs+udH26gHm1TI7yyKOOIQTdivZ91y7gtzwGciLSg1UTUf3h5gM5q3l
	 OF44LGIWu7JozQ0oyAQO5p0HigHcumInjHcX3o9Se2G8jl6C53YYUN4eCGvmRf8oUS
	 ps/C1psbZXVF/lZsmnv2F4ec26d73JbD91kpGSPL/Vo4itFaM9fMVz0AUu99CYrLPO
	 rtHIcexDSYxMQ==
Date: Thu, 22 Aug 2024 16:53:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rayn Chen <rayn_chen@aspeedtech.com>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: drop redundant multi-master
Message-ID: <20240822-sibling-divinely-be19cb9cc0b0@spud>
References: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vAAMaBzo7gFTFXce"
Content-Disposition: inline
In-Reply-To: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>


--vAAMaBzo7gFTFXce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 03:27:08PM +0200, Krzysztof Kozlowski wrote:
> 'multi-master' property is defined by core i2c-controller schema in
> dtschema package, so binding which references it and has
> unevaluatedProperties:false, does not need to mention it.  It is
> completely redundant here.
>=20
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vAAMaBzo7gFTFXce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsde9QAKCRB4tDGHoIJi
0ushAP9C1yIfxWTQ99m6oo/wi/XM+H4jeZV+tKwrhhhzcmD0WAEAzNs+M49QgnKF
hxJp9x49f0FYIRnNsWDMLxqEEimrWwE=
=CiH4
-----END PGP SIGNATURE-----

--vAAMaBzo7gFTFXce--

