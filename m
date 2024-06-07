Return-Path: <linux-i2c+bounces-3918-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE208900BA6
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 20:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF962861E8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10EB1957F6;
	Fri,  7 Jun 2024 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YbU/IO9s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1D225AE
	for <linux-i2c@vger.kernel.org>; Fri,  7 Jun 2024 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717783230; cv=none; b=auCEZIkdhtxfvyjmfU/y96/VNNDy3dvqkJof69VNEi9BIX0wnIKVcTnx9IUlLS+tmxrh9wD7STxKNV+MWlgD7hFPCDVrylG90Vx4d3d4ho43udF9Lw/bsMroZbK4bba8FGNHTHxMb5FHXCHkLmz1oSFBdtGcQ/+XQdqF5q9YDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717783230; c=relaxed/simple;
	bh=0NRGuS2YrkWBCFcj/9uHh/nwyQi8ilhdgYK4XspWfA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV6zSxVEAi1UX/Z/AIgJIVV7gNmTcKwSQpM/PsLUAONJB1K1TfDVLRSUyQsfZugfnC1HRVFUFcKA+rAY/hTfetzl8lCs92lfujyJjFCprlF4/PDcIJIgNoCl6rK8kb5FKT0N36PKAhBLs6MRzjJdpfXR3RzHtx/yQG7z5Wp/73k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YbU/IO9s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0NRG
	uS2YrkWBCFcj/9uHh/nwyQi8ilhdgYK4XspWfA0=; b=YbU/IO9sX3jfXvqlFN/B
	cpDFyFS+gIkhlS3iwPWzsRnHRBe3vNTqv/Riknz25fD24OQaoo+288/sk277osOA
	IlK9xRMb0mab9SbpllMkDwwIZblfE1TPoLeNAKsBHiFA3OlPbvyGU6dgkdE+DSKm
	IpcSeBQY2g2stZlCx38VotzStqSD6xfz/WaIXYPqD/eQVOj2y9BIc0IWGmaa7CPt
	3eR3cynz4g+Y3AdKSQs4AxWL7VHio6TPyTCv/lcMmTIjA2TX+SXWnlvmSOrkIDni
	oPhw5Z2uhdNoRX9IpdDQYu3kMyfG1PPXp2S1uoiU4DHyDdJW+D7Nw/SW2lCHPkkk
	4A==
Received: (qmail 3413723 invoked from network); 7 Jun 2024 20:00:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 20:00:20 +0200
X-UD-Smtp-Session: l3s3148p1@mbWaklAalMhehhrL
Date: Fri, 7 Jun 2024 20:00:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Message-ID: <txliuvufu6muqucno2uex2q6xvnveozpjzahx7zryqlvvvzrs7@flv2zztine6r>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Armin Wolf <W_Armin@gmx.de>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="44kjmhkbol2rnepo"
Content-Disposition: inline
In-Reply-To: <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>


--44kjmhkbol2rnepo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> the text "Only works for DDR, DDR2, DDR3 and DDR4 for now" should be updated too.
> With this fixed:

Yes, maybe this could be simplified to "(LP)DDR memory types"


--44kjmhkbol2rnepo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZjSq4ACgkQFA3kzBSg
KbbTbg//cD7sOcvnAnkIomuxZCVkBx0taLNZrNBPEfiUHTdGQ3zontEQMXJ0moHe
acWUAt/sy6sxemTyRojO0FWsDCGOZ9hPO95F8Tpt921gdDOFF3mSMXv7V4eLVbzV
H7jI+QIn7hvjUBpCTCgZ0DjDY5ku36tAxcpxbr/7aYsoXPz31lqk9Tb8lthum4+j
8AfgziLgAaNqvd0tDO5CoVmAiy0d8gs2OvqXfwP5XOOzhGA78CzfxG2GSCqqO73c
qXxrR3Rhu82NMej7FUUd+eThQvcmgo3eqV7AOHlr0eaT1338DBk3ZIEGFlswn5ae
LsoeVUtequuqUVbsf5XM0QHaCO8uB/Z9lvgwa1FIHdMvbWT/lUebhtjwlH61WjZk
aZam6j+Av84nmp9XdPWNm5itz1Yk8YcekN1Eq/rjlDqu8VF9fFofH5caKrtnojEk
+1tlAyjdoRudnf15D59pcrD/S1NMYxWb94rw0BekOaQYOHAo51dnPMsOS+YW5/H7
DqSuo2PjSMobSv8GHuUq0Sd/Ghvrc3jxSlEtgUk4jUWv6QJSBIMzrA5wWrPiYjVk
YHxgS1VSNMApKGgHGcvhzyLSWJllAiZWs3POngn0wVRiTNQwqTLkyypF8fkzOe1Q
T9IaM1Fjx/+bn2IHZRQaRNhBYfGy7tZVgodo8x5mXaOsjDmP41E=
=qngC
-----END PGP SIGNATURE-----

--44kjmhkbol2rnepo--

