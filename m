Return-Path: <linux-i2c+bounces-15117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE6D19FAE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AD2430873BB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D665E29AB15;
	Tue, 13 Jan 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qt/H4kTb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23D129D27D
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318952; cv=none; b=NcQvGVwzx52tMKOV3ljc7K8QiDdcOtAQO+rfuKbuD2kKGl1jOiwqk7qex4hypPNvSm1g5Pe/76yWIc1sGIDj6ohvHJs3k7PcfQ358z5zgkTKAG5sOSCMLa6m6Bfs736YqVrYbHAFkWDJBe38VvhNhjyzp9iGOLn5B35+EplqmGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318952; c=relaxed/simple;
	bh=5zDztjlTldmOAs0kvRHuxdoEMmOaloCA72FKKaZlivw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRKxCnBC6/j9s2ytimF/1E05dNu2Bv5tvaZayyBpgXxXjbeRPFnn0uS3pjjDoeEKZJ77m3aefaujH6G8PlcGejbaJCTFIpCEzX6VC2s5rNhBEkEmtzGrZKmZNLQ55q5//SXJg5ZOJ346ZCJeJi/7c5ZOQvjexkLfn3jDOtN9fho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qt/H4kTb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5zDz
	tjlTldmOAs0kvRHuxdoEMmOaloCA72FKKaZlivw=; b=Qt/H4kTb71lFh7cWfJUW
	dOViSE6x6gH/TAEdUzMYMISkWPFLmdRqHBVbzopi4Q+hSxdEUU11FFwl8CX4gNzl
	8nVcdX4u4jRA+Opk4liagcUEWEk/VYrsiow8MprwaNFEHrpSV7D2hENJ/c6KEX8r
	Uy0YMeiZulCbGT1HtOmcRQnsQFCc9hLRFIRU01HH2NnVcBcpq/9V0IMoiUInP8D0
	qnEgIVIEaXvunxhL+lYHsYoFab5HbRT2ql5u3aSvEPj607tuIizNtSgruOC6klO5
	9KPKWpMdGvBuKilXjLQ5Ha4oiZKk+82K7Ihz5LNAG+vtR7TNFL5vdl7wcp94AnPx
	Qw==
Received: (qmail 1757831 invoked from network); 13 Jan 2026 16:42:25 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:42:25 +0100
X-UD-Smtp-Session: l3s3148p1@NUyZ1kZIxqsujnvx
Date: Tue, 13 Jan 2026 16:42:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
	wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com,
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 3/6] i2c: tegra: Update Tegra256 timing parameters
Message-ID: <aWZn4V3gemViGvG_@ninjato>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
 <20251118140620.549-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MPfh5wBqY4LxNIPx"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-4-akhilrajeev@nvidia.com>


--MPfh5wBqY4LxNIPx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 07:36:17PM +0530, Akhil R wrote:
> Update the timing parameters of Tegra256 so that the signals are complaint
> with the I2C specification for SCL low time.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to for-next, thanks!


--MPfh5wBqY4LxNIPx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmZ+EACgkQFA3kzBSg
KbbXSRAAh8cmbQ8AZAToVGJYBlo5a+9UZhoioWJxG2ZYnO28JrSliYzVPa6YXhBT
xErBgGEv7q/kFBXiRhu9sQKFQAvQhZUzQlLWbWN9ahSb8ZiCAxjDAN8dNgEEidlD
TxGof48Xc0SCUHRNTIi4J/euDXBC97Y9powQ1LmYz4NLmUBxTB3vYQhfU7lCcHOr
YTLuyimyoEqvCbtUGuHRyx/e6dy7MMcKWMSqO8M/iqrMpiRqWZo8X0WZdWYPp328
KuT/Q8z+E75E5sRrFXyaTSryEpo3MBBgJvYnifdfzUCQewa18V+ko6aIMiReve0L
f92KF4mMOFxtLJUAm4F8MEhk8UzR+bElVwT3+kx4X1+sVhwcZN4eA9t18FRRJ3jn
KNGE0S2asHOYeO3lFEfccEnmSNJUrLJovcCp0l1BGaGpZGh9MxXS/b/ZB/wMUd/Q
omMptMVzI85pMbJ5Vq7+GqpJGgC5iagKVK1HbsHiVQCv/DWzMEiWCLHnib5nL1jY
npmHtTNfQSoR+yRPPIE9CYcp2oCSvjeHLzWgojxOrjEziOC7q0L9Jq9D6E8i/K5b
ltwbYdDzTsrzF77X8Z0lXMDmqP4akXzI7LWZ/0xUs2q2pPFhM5hboG5lmFTX8cEi
EuydIyyh98j+ICjSo3N2TiIGM3epMDrpGSl611FafPgHiQwyUs8=
=gL//
-----END PGP SIGNATURE-----

--MPfh5wBqY4LxNIPx--

