Return-Path: <linux-i2c+bounces-5806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEAE95F2BE
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2FDFB20AA9
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 13:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC363185945;
	Mon, 26 Aug 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JfaI8uWR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AAB77F0B
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678410; cv=none; b=f6WMUXqXxSx1M3HLk5eFQGQSYNYxdDwtFnsjUkniX/AaJ8W4Wy4KV5lyLqnrXTr0fXqDwttgTwZy3B+DunpNS7FKrlB5lGyb2ZqOaPAbcMOfyQMBnTJrSxnffzP7/75OANWRfptxo/JqT7CZIyvV29+TZjNYyPHLLqkWysaVuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678410; c=relaxed/simple;
	bh=//ZTb5hD8s3HiIMju99DBPyBTvloUQpz0HvdENoxu/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brlmOb4Vm4b52mj32A/2ZMGvveTqf7VqZd6dn5ryHsraL+MFEWwiOjpZ7xwUfDqzxkSzzHKj4KF6GBkaBH/RdD+nyiEYBDiOCOw4V7jIcSwy9KcgTcMCQLVbICI3hmmOQ6bWv85q9wIYt3XWsJ/1mlOFl39/pybZFmIvtkQLJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JfaI8uWR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=e/dF
	HkZzKEp7892g8iR5wvP8s7xOu4FmOqHEwV72748=; b=JfaI8uWR2T0axe9hA+2P
	QmY/FJRapPFmOMgyJ/LLDend5f7JfrPpXBXsGfBxGoOAFh9GpGlQ0460NRoN5lyQ
	W9MylbPf2cDtCobCrfWyxLCFEMi+Q9H/toPPPs/2YsMtd+9U2fHqTIacEjreoQkK
	JIgdB7jqFpHmZbXbmPixgDv1vzGNpoE9344Fqezh0lDkCp1JXN0eojZW3y7WMydF
	14JrUXvGvQ+jI5YJgF9jpHntk3GueDnQbe7D3+OrnYaY/poWbP7rSSsS6fpMw3JA
	wblJfRBCT5txXRMKWqOnYyOVaaeZ67f31Pq4r/A37Ia2wGysfFETmuyCdNctsCeW
	Wg==
Received: (qmail 2002388 invoked from network); 26 Aug 2024 15:20:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 15:20:06 +0200
X-UD-Smtp-Session: l3s3148p1@Ct65+5Ug8qIgAwDPXwdRANgvu6DX4+2c
Date: Mon, 26 Aug 2024 15:20:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
Subject: Re: [PATCH v2] i2c: core: Lock address during client device
 instantiation
Message-ID: <ZsyBBevhURS-WR2E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Krzysztof Piotr Oledzki <ole@ans.pl>
References: <32a2d535-d7c8-47da-a42f-b41d3fae972f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PHk1pGZFQsfqDafd"
Content-Disposition: inline
In-Reply-To: <32a2d535-d7c8-47da-a42f-b41d3fae972f@gmail.com>


--PHk1pGZFQsfqDafd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 09:44:50PM +0200, Heiner Kallweit wrote:
> Krzysztof reported an issue [0] which is caused by parallel attempts to
> instantiate the same I2C client device. This can happen if driver
> supports auto-detection, but certain devices are also instantiated
> explicitly.
> The original change isn't actually wrong, it just revealed that I2C core
> isn't prepared yet to handle this scenario.
> Calls to i2c_new_client_device() can be nested, therefore we can't use a
> simple mutex here. Parallel instantiation of devices at different address=
es
> is ok, so we just have to prevent parallel instantiation at the same addr=
ess.
> We can use a bitmap with one bit per 7-bit I2C client address, and atomic
> bit operations to set/check/clear bits.
> Now a parallel attempt to instantiate a device at the same address will
> result in -EBUSY being returned, avoiding the "sysfs: cannot create dupli=
cate
> filename" splash.
>=20
> Note: This patch version includes small cosmetic changes to the Tested-by
>       version, only functional change is that address locking is supported
>       for slave addresses too.
>=20
> [0] https://lore.kernel.org/linux-i2c/9479fe4e-eb0c-407e-84c0-bd60c15baf7=
4@ans.pl/T/#m12706546e8e2414d8f1a0dc61c53393f731685cc
>=20
> Fixes: caba40ec3531 ("eeprom: at24: Probe for DDR3 thermal sensor in the =
SPD case")
> Cc: stable@vger.kernel.org
> Tested-by: Krzysztof Piotr Oledzki <ole@ans.pl>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--PHk1pGZFQsfqDafd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMgQUACgkQFA3kzBSg
KbbV6g/9GtjKUX9AA1w+doMHqNVNP1ir5SbeTkKf73RanFfmu3nyF1SQw2dClb86
iC8mKHsCjZbcXy7Pg34PRQMddi4a2RjlA1+5R9DjxWfX9Gss87JSqr0OqPgeXmJg
hE8vpxUCR9hyNuC6XWqHD5Ba6BHhNOg/LxL7NMUAOjimKWRfnvtnDhvNApXfJ3kz
awDxSQ6KHMTyS5vsbqDClr0EcnDr1Yj9EM2E2JwitF+1mw0i/4DTSgJv/YwIS7xG
Zcq6uv9pmvBOYKnDbDi/zN9Z3HKj9ufjHTH5qNypEMiNoFd9onCpFl9sc9gCjATA
sOuZLlEysjD8WUMJxcY6Fu6urFfjVfqrcQ8wZY2A/iKLvFWXs2oDYd9eKhaDv7mb
EmkSDqE3KvXiTStoxGUvSUcKaN/g4nfhOmkFPhg0P/Ky/iupH40sV2rhfB5AT1W/
vbLbyxUjt2wTaEyxJFFEXPOX7h/zX4eYI8CDRaYV8VjY8lUp7DASN6mnRd1KrZX9
Yhcc49ms49MPc9lwxIqrF9XVl+J/L6U7iJLjUL8mIxr5X4YZRgPfcA2ENZLxwHab
9y9K4oED/H91io7Z0AWjDE7MWit/SCQt8F+SJ48uNV1/opprjA8IFjTV5O5S+jdW
/Wuuak5GQJ2KNjTTfvsO52KbFSktTzLCppkX+MBzZshnZh2ROBU=
=3V0Y
-----END PGP SIGNATURE-----

--PHk1pGZFQsfqDafd--

