Return-Path: <linux-i2c+bounces-2771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C9899891
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 10:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D9E41F22191
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AFF15FA98;
	Fri,  5 Apr 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KH/O2kU4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9CA15FA7C
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712307188; cv=none; b=rpGA+yxUnIYiTwtlclY0Q0x01UGsKZHznChMhqQ1zAlVyLLaWOFtd8+SYlj89O+OnbWYCLFbYCLogR/aMZ9SBvFj3Qq6vFvSHoFMJxYhhTgqk1Uu0act1MB7Q+EInY627vn5FM9sNCP2vi6ZjDZ1vxvnOj8jOptLMFUiBZBzvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712307188; c=relaxed/simple;
	bh=b58X/MIMUkzWJKfAi7xukhYyNxm3BVKa9wfMtsb3Sd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0VWROAguo1q8jYmopDXK9IONlotJpnX/GpxhAypODYERfesmQ1swYZ4LQ14PY1vz7R3U35DYiReFLo2vh2OaGRQeNXryFBgbLObDepUmon6hJrNXwz9ytCzCfce4f3kahBl5ts5gRWTxR+RUxc2TleTI7KNypBPHaf3paavtGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KH/O2kU4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b58X
	/MIMUkzWJKfAi7xukhYyNxm3BVKa9wfMtsb3Sd4=; b=KH/O2kU4AXBavxNzHugQ
	Cr0XiXqp/GPDBSk990nWASPmI37jJSCyQb7Lmqf/oL1tdcIHRX8jcmo2vwR2Tob2
	3MSo8HTQY7A27SYWA+SI/NfQ5pqpmi79n6McsjIcB3WFLNWrOIMRU9rOtunrND10
	HWjAn9CXhCQ+B9a1mPUM02wRXvB9PLITUPY3IFp4RQdrilkojM5jzuhcnTiEv7VH
	VYyQIaPUSbCJyxVg+Ps6gEY1GV7GeeCVXIVYwLifWiKRkws+ODNIdvmXrsiBWpB2
	SNQ1HJX7xrINzXmGee9lezHXjMCnmDNUx7uK3emvEkF2ZwnnAUK7Pn+L+1Q5APd7
	Jg==
Received: (qmail 4047676 invoked from network); 5 Apr 2024 10:53:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 10:53:03 +0200
X-UD-Smtp-Session: l3s3148p1@2SRllVUV0pYgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 10:53:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Vinod Koul <vkoul@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>, 
	Eric Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 14/19] i2c: nomadik: drop owner assignment
Message-ID: <fgcn3ly4qk726eqv3lleqbrg7odgyklkyd6d7wmpyl73bbt5ir@tjui6nsxrlgk>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Vinod Koul <vkoul@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>, 
	Eric Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="honofbm32v4z4vxk"
Content-Disposition: inline
In-Reply-To: <20240326-module-owner-amba-v1-14-4517b091385b@linaro.org>


--honofbm32v4z4vxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 09:23:44PM +0100, Krzysztof Kozlowski wrote:
> Amba bus core already sets owner, so driver does not need to.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--honofbm32v4z4vxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPu+4ACgkQFA3kzBSg
KbY+PhAAmNuSoACChosjYi33qGWzyeoBhz9tLue2x0d13airycgFlY6FyFx1aY+/
NadTECwyu8TNhXdRAYk/Y1sTo9S+MezhsboJhiL8+5hiOBEZHXt7U5+8k/Pkg499
9QHeM8PaeBfpoodRPGG7UCxHkjENntyyR4OV1X5eWgGheKFtzw6F2NwEMqTdus5H
yGju+VYEMeH97wXMkPRPmqIAUfG140PY+fTfOInco1my/ejprCYy+OJdL+uMDBlG
3MSIMIrLahtlKK6tkhnA9MdGaC3J4v5bzpo7lgDwM6qPcOHY6ftTfz726DpdI68w
JLoRj/Ne4xKX4Munav7MMDCPGWaSY3fQ6F1xtzq+EdfVQHnSIxpuhH/zvpj7LDEz
l+yVUvhjs41B3d8QkXmFp0ByjxaiIdO5EAkraw/OguBo6kv3N0TgEG1BZTdVa5+Q
UfSRHLLAXCksCuADcBcHaRGXp3dlJB2Ywba2iCYBOeBD2DefxfHGcEurJyY3mp1h
i+RlMmzHBKEoT5/nYkhzVZyQ8cosiJoL0LeK11p10xoexmDJzd7W8oshLhEDaB2L
5zXqlT0JmawXt/SmDjByPFelFQPhEtWkIo/D65i4EBb0DnglGQSc4frb9FBiVP5U
vPwuPyzkXVvObtEfHT2TL6wUD2IVZWJv4tCMQel7J/DK7WEJLjM=
=o9jg
-----END PGP SIGNATURE-----

--honofbm32v4z4vxk--

