Return-Path: <linux-i2c+bounces-4374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 985B7917E56
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 12:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6E01F23CE6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523A1176FD8;
	Wed, 26 Jun 2024 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lo6PrfAY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAED171E7F
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 10:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398394; cv=none; b=OZeT+zgZiVzk26qKsbo1EQJEe6qtlqwFEM+KVbjKHjJR8/pcWYOJKT4XsozKstSB2F9R8Do6TBrxLoePumqeBBiKYyMSpU87ua1dk1/zdKrgKLPi1r9QvqXTGO4nwqKDInsAktBUlrB22uWRscjU4GnYraW84j8Zn6b/crvDloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398394; c=relaxed/simple;
	bh=N6LO28vFfv72qK3A6rVd44iQqFCtaqP3i11XkftLzgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGVB5NydQ8eS4iHjk4mWqZmmp7xWxvKsHk1VUR87DvMxxj2xkF5DJNm3AA8JIdT/LG7mm3/jdija3NsIZTyz+n+bBLU1Y7762MYBb+rxbT8GKbopl3P3AlAdvd2Z42UMwHOYipw8qemrR70wqWdIsyMg22i8yHrGSpA91aup8fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lo6PrfAY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=N6LO
	28vFfv72qK3A6rVd44iQqFCtaqP3i11XkftLzgs=; b=lo6PrfAY658V9fp1Hl9Z
	TsLvAfASaVQZPppEtPlm6Qgbq0mCyEfgHW3it4+dUH3BzC6v6O4vVVbSKgUMMKic
	NnhU85Q4icOVmc0tBxDyMCcUQj05AcwwbIjZH5PU/E/PuiKhiTNKmv7OB7n1kt95
	BHh+tY/VUraTqczxNSJf8aV8ZQBFUzImNehL0lGuDxsgt+m3o7LWxb2mktaERsD4
	qpj9IKx06WEjP4UbAjBTShM/oHdBcSR0qU2AuxxIMxD7XUevDy0sSsQI3uCkO9ZP
	v7zKHqGcxJCqvKCaHQZ7/mdL4eXvat7SaljWvg9QIF2WZ7u8S/aIomJJk40VsLGT
	yA==
Received: (qmail 538746 invoked from network); 26 Jun 2024 12:39:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 12:39:49 +0200
X-UD-Smtp-Session: l3s3148p1@CA01osgb+LsgAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 12:39:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: dev: Check for I2C_FUNC_I2C before calling
 i2c_transfer
Message-ID: <bkhnudwlpqmwbhxf6dekvk7nyqjhdfwq2mbxkd5dv6hy74wq6n@kto7dc4psn45>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.de>, Linux I2C <linux-i2c@vger.kernel.org>
References: <20240531113407.4df71f5a@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aolrwrdryucgivkc"
Content-Disposition: inline
In-Reply-To: <20240531113407.4df71f5a@endymion.delvare>


--aolrwrdryucgivkc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 11:34:07AM GMT, Jean Delvare wrote:
> It is good practice to check that the underlying adapter supports
> I2C transfers before attempting them. The i2c core would eventually
> return an error, but it's more efficient to fail early.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--aolrwrdryucgivkc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ77/QACgkQFA3kzBSg
KbZVCw//fyQu7mlenzm3X9EBmJ/ME0yQ7bgmKHT6g24VrJ17OXtZ0M8huc88dA+f
EvLfAK9DdMU1zAT0qZFhpxgSiTkPngbyKDRqhsLiB0AuAyYHa4x+byfxunthuEvq
93UgQYVnjm9KG2Qo5EmQfukklE3mnmq5/7/SJG0Ag5lAub2aLUCNw/F3otRKyHfp
HWrHSlEkjL2fpZbFmhDOU4XnvBM8V3t5DRmSXeQGTgr1TaBtudC6+y3Vj/vIJste
7Lry5wZSwlEoBVyLf7KFqBWB7xCwTNNPF+Orb+/I2xbXHpJuwTEfj7+utr0sQui/
oRWeexDZXHtRrqEnQzZXM2EAJq9hXdmL8+UExVVsogvuHnu6apcNWwaQHem0BB70
GvPPJ3JTCN9dF8plYbKv8LrMNk30x7N5mVnjb0Txf3jI87ZfabiXqggoXDE7KV6Y
7UnQkubHorAq1kfjHHTqo8fg2S3bSTbL8FK/bWAwV90TI7AmMKvCfzhWcNaNz9K5
lCM2EWzwxe5MJ7P7/larkNqKZpNL7f5hXxkGGsMgmujP3+wZ6GNjIECTionbuRBj
1Rq6cpc6L0mD6hO/Z5PTlOOk40aVQ75i0nVCulMhKXa5JU9GLH0bZR0VBxJqvwBS
uDlcDzogv8fFBB3IhYq9u/GTHVKl18n5cwcPyqGggaCKOs190d0=
=AgRd
-----END PGP SIGNATURE-----

--aolrwrdryucgivkc--

