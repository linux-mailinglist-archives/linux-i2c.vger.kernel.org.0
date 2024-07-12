Return-Path: <linux-i2c+bounces-4965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3208C92F9DE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 14:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1FF5285095
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61F216B388;
	Fri, 12 Jul 2024 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ai3jH4X8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E415E5B5
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785782; cv=none; b=OrpSUMwQGdk4M5fAWu8EeJMuoflkK8qZtHzdBhz0gYVj3GG3ImoebX5+UruwMlc8SNmM/KQP59E+ZDFksJ1n3uUUPC22CfO3kgDhWTIgvt7B6YLuN+aUYsPFbrLhqlcToTNBq97EjRmcCkRT4iT4rfiRZciI6fcaW4pV9941Ru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785782; c=relaxed/simple;
	bh=RlBx5l3ykWiRpKkHaLVYnsm06FU/v5RyZR9FqJrTPNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uutRbd6ilAwvdSaiGFdVJleU37BniaPQyak6fgKXboNK8HALw2PdmEnE4VPxFzCA3SU3dVrByqdqJBqRytnLmOBxYbwhHr1zqWnzAfHj0AA1T0zy6/1r3tJjuvXG9htyvC6bxKfKCbkscMhz+AUYupWS+GUUTUmOBrttOXIyal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ai3jH4X8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RlBx
	5l3ykWiRpKkHaLVYnsm06FU/v5RyZR9FqJrTPNA=; b=Ai3jH4X8H96RroFEqwci
	zi7A1bt0OBNvfYNAEVXdc2Wx2CP8b35MZerBNFbXtaXsrcvgzmfcf2kQuSPEIN7J
	SYUgl9sGIqBo32K81WKYGjR6gHaJEgQCpAZDhTcuwf0fg3NUI3zorYXhDRFJg+9+
	uGwVjjW9XiDo55fphPr56B3/uIVN2zRuMPIjs7ltnykPCnqGTxoTfso3K7QoRx4V
	MUeUNihCq0410tvGfrosWdQEJ7+fMK5RVJJVzN3G4j6ZXDUSbbvy7c+eD0DfOwrA
	WeVLgYizlyKfBNXX4Nw9SJSR4J6S6ERVo7YaqqpEs1jP8tchoDvIaBp0Fc1nfssB
	Bg==
Received: (qmail 1148112 invoked from network); 12 Jul 2024 14:02:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 14:02:55 +0200
X-UD-Smtp-Session: l3s3148p1@IX7hqAsdSuZehhtW
Date: Fri, 12 Jul 2024 14:02:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH i2c-tools] README: ask for DCO in contributions
Message-ID: <ZpEbbuELPjLKNoxy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
References: <20240712120053.4076-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MYGT3SvSpkaHgDtL"
Content-Disposition: inline
In-Reply-To: <20240712120053.4076-1-wsa+renesas@sang-engineering.com>


--MYGT3SvSpkaHgDtL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +Contributions are very welcome. Please send them to the linux-i2x mailing list

Argh, who put an 'x' there to make it i2x??

Anyhow, this is still a call for opinions on requesting DCO for
i2c-tools...


--MYGT3SvSpkaHgDtL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaRG24ACgkQFA3kzBSg
KbbX6g//XJu2FmYNbCLrK53zLfi4536TOw22bhG3laUkJPMRF/0rD1JMtdxI9eMl
gckCh28QfmGQhe1Isb7F+41r8hDp66uHe6dxUqOONdPWWGo5s6siPnvxvWy4EeMA
2EWLJTiRNPYOkIGmniHa8oc9Bm0UMEWkDXicPdwYouRAdiv4FhX7RMeJ/lPm6Qv4
11uVJqpA6SCNS3rIZWGbDhYZs5nzM/R9OT6ylpjIC6XYzlAE1TIOhnxav9ydaNfm
1H0qT5ng3ichFH0Vs/RMlAnhHDBXCoMHF8pI3dGv774DApIasqK+7Arr3JX+6fRx
WESwM8hEYc+7ptDSKs1ZdENW/MwY9Bgayqm8Eph09ciMmvB19371QWFufapmqgZ9
hqilncFSYxZpbZZCNMr4rl2ezSebjSLqseJxDwKNzlX5hnMmNWjtHUE1hJtV5Lnh
W+3r6DAzKmxuoyfAtOEJbb7Uq98b8gk0MW9dhljJAfE3AiuS1g7GwhuHYMPrXMO3
wLS57fSAaeLhVKg+fvHLpdZS7KEID7TPLZRfHsokHv0MoIDG0on17VfrbbiQ2+LK
CPyz24wvBP4SfCn4nCsGx+8y9zwVtURQ8BBLdseKpkc43QCDj79fBN6g+T/M/OtL
HEAS83yb0KJVXurKMiR5YBoDEcp/qTUxMZfiV2JpYYjEYbXk44k=
=SmZd
-----END PGP SIGNATURE-----

--MYGT3SvSpkaHgDtL--

