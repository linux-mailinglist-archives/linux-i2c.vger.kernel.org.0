Return-Path: <linux-i2c+bounces-7380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACAD99E29D
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BA21C21FB7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 09:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457E51D5AC3;
	Tue, 15 Oct 2024 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TXrQw8Ia"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370718BBA4
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983883; cv=none; b=poD4iEGDLC2JUpfduqy83aYsuRUDUBxvXwhQqJUE2mZnTF+u9Kfy9lRSYrrIlSbFhn6cO1zZI4tRwUSxlpRkdb7N0ydAuvDuoo7fsAvzTh0zWbCcnrfjbqYhaAmPC4V349j3jnXjmc+5QriMx764J8BQlSl6tQi6gDyTe3ovGvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983883; c=relaxed/simple;
	bh=QKK+v/ZsrCK+dVdz+Wx/3jRpHa+zlANSUsS5qMRPejg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISx6SaStLb+juz6A134DlA4telpSQPF6fXt4XFIujNqzPRw7DbmixgTfYcJ4DNZtsApmzdstKQa7T7s+6bJDMYThVxMURuduuSVIX42i5Hg4EfMHsD60NVNqbzR+a83N7RRC6BOe3505NUbQtbcf0M2LHvlmDvaSyqyn52pHZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TXrQw8Ia; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CrKJ
	Ml4xA1hyzF3zu2LSgTaX/Cn7gqdQ3RYgTr27ea8=; b=TXrQw8Ia4bDLdCDRrakE
	pPGRA8KakQKFMQpsy6BXr/O4pcjz7uL0HR3y24L++jeFnxtpgfFgIi2lD9Tt7kkx
	/DVoElD1XssQ1K+z7VqdYQ6TeMM69Knhbl4aOh4BO1ncOh47sOtOFAZ07lQUAB0Q
	M65a6hzaNBdfzkuzFDvYPxJrtGZqpjM8hy58hPk+29xnmJ2WwzwzLyhZFJNzNCXY
	Xcv2N2oFCnqIde/RUdzOeXZMy6UImNdWCEEvX1yTi85YW2M+E0O8rvd3+QgUGJnh
	Z9+cJq0N0SnY/sQ0ZLcoclMm7awyOvIz8+h8UIMuLFxAx0+3SvgplvKjzdK2n6lq
	Hw==
Received: (qmail 2653402 invoked from network); 15 Oct 2024 11:17:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2024 11:17:50 +0200
X-UD-Smtp-Session: l3s3148p1@pJ5rbYAkYJ4gAwDPXyR3ALZ8hQlyja84
Date: Tue, 15 Oct 2024 11:17:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <Zw4zPOXSJIWEMd2Y@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-3-TroyMitchell988@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+4lmCUjPIwlwsZrJ"
Content-Disposition: inline
In-Reply-To: <20241015075134.1449458-3-TroyMitchell988@gmail.com>


--+4lmCUjPIwlwsZrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +/* spacemit i2c registers */
> +#define ICR          0x0		/* Control Register */
> +#define ISR          0x4		/* Status Register */
> +#define ISAR         0x8		/* Slave Address Register */
> +#define IDBR         0xc		/* Data Buffer Register */
> +#define ILCR         0x10		/* Load Count Register */
> +#define IWCR         0x14		/* Wait Count Register */
> +#define IRST_CYC     0x18		/* Bus reset cycle counter */
> +#define IBMR         0x1c		/* Bus monitor register */

These registers look a lot like the ones for i2c-pxa. Can the pxa driver
maybe be re-used for your I2C core?


--+4lmCUjPIwlwsZrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcOMzkACgkQFA3kzBSg
KbbMeQ/+LaZ1hGrKfGOMVAIViVfn5I8r6ddkUeKKpQSsOqNL5yZ+m6BP1P7lvtMZ
N/SsIQG4DDphYwG8O0Ewoc+8j8rWbSnn3B9+OpnPLC7NJh1lJEUoxmhf+7fAA6EN
tWlkwsk7EWgSbTUP7PGlKkvlhi63oVfjMnEPD9fW0+Z1zgllUqbdisY9CnvB/iHk
h3KtU3WiQv6T6H1z4dX9td1Ma/U3YX1c9xoLLPl7i7wDynZBzJ5kZxnHu/IYTeJx
dKos5yJGDFeapct6GE2TIZqTonpYbBafma+nBG226SHyR1d4VjqDupZ42uUxWbal
QnKdFpUG7feQyiIpvTXMYDqRMBf7b+mOfSsxCqY9S9MSqSE/EHMC0vzsDRVQC/Lc
H7w0dbHGLyDb3XmhVNSRA4KmyqI1hfouQmt1oFqgHMZAu9btsrxeu8ES8hHT9Th8
dxFQvQ6FXunSDDX3X9v9vWaWGb7vIKpLhWQZ8gjvjcsbhOeNkN89kAzbi6O0Y1Vo
hgMo25e0VSL6kCE3EQPHXHMBPeTE36AX7ATpktXlCKeeLQbt2K2EGmnkiCsglBmg
EaN9kTNbNK/LNcx2LvTO8mvyHGUXTQCFDcwDCIKhO7zoHQycn5k4gg2rMBMhSwQB
RZLVyeG5jarAm6B6MNILdDuFOl7jYxPyM6TcDGDE9blTgCcJG9U=
=Tyju
-----END PGP SIGNATURE-----

--+4lmCUjPIwlwsZrJ--

