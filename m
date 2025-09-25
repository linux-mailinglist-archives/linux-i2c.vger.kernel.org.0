Return-Path: <linux-i2c+bounces-13187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A828BBA1AAB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EB2E4A1A82
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3590321F2A;
	Thu, 25 Sep 2025 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OGhtGj3U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C92E62A6
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836785; cv=none; b=IsPZA6Fs0RX3V8kFfkjRLyuEGBqqBioTVkjnqMZFLPRaNthPv2lwndR3jksAYFAxsLzIxErhtQ1zqHemT3L8pTO8YpNFbFCQFFN0piNY/K5I8n/4A6QJh/GoJJxujzYzqdzaYQ8I06WHv8RiVPoGdtVOw0zWgaIT4Wvh5Q/y/pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836785; c=relaxed/simple;
	bh=tf3+NCwDdfrUfesghafUqKE5MStmQh9pxyBMY46dNdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkyCDvYstcTlm7athvgPKOcDKFQS88MCIzu7yxi7ecg38/VlaMKrcKsFWem5rHrz8vGHQ3qJoTZIQBdzr2OMu1poIuiMfHNFFGW2HG9mh1huAXDhy9zy/9aePmLzkyeH1SIyLRtS69lW5EIkWyIkRxVBMVsFKTSAt27LqvRPJgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OGhtGj3U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tf3+
	NCwDdfrUfesghafUqKE5MStmQh9pxyBMY46dNdA=; b=OGhtGj3UoMALkb9FxkRX
	hAJMEeJr+8grQPU2HsYaIB5Lyz3I/jraFvmhycFWMKNzsfiwcwgIEzjFSLWXOf1e
	Gi3s7QLOu+5GV2xFDhpOFJQ5/2EPa2zZN51XiiIAFkF+EJa08qzfl0XIE8bJ+8/r
	m1OkuSzwNzjBlCqibYgOe5Ik6e1T8RryxZp1VQM90uqcO7wWLEWAPL/OYUSndkEr
	cZDXKRQR8QerFUQNmyyxiSK3VZyD3LrWqnOnMBPwkHKh9geaT5ohe53LIakXqZ55
	3a2Xe3+y3eGt0PN09m7sZG3aJ3H+byuZKTKWcjCIgGfUY/y8lZkwXuQtrA3ahQh5
	VA==
Received: (qmail 2023196 invoked from network); 25 Sep 2025 23:46:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:46:20 +0200
X-UD-Smtp-Session: l3s3148p1@f0p+Gac/XJIujntx
Date: Thu, 25 Sep 2025 23:46:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: andi.shyti@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, patrice.chotard@foss.st.com,
	zhang.lyra@gmail.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Fix some spelling errors
Message-ID: <aNW4K6YfrDxhT7Y0@shikoro>
References: <20250827094344.424700-1-zhao.xichao@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="INvyPOss5gw3lfXr"
Content-Disposition: inline
In-Reply-To: <20250827094344.424700-1-zhao.xichao@vivo.com>


--INvyPOss5gw3lfXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 05:43:44PM +0800, Xichao Zhao wrote:
> Fix spelling errors in some comments.
>=20
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>

Applied to for-next, thanks!


--INvyPOss5gw3lfXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVuCsACgkQFA3kzBSg
KbascQ//ZeRn2CT+ztmeiyCsiALzGbSeEXEAilLCWxSkQf2NLoJi4fnNsM1k0afa
RF5rfG5MKmKHZ8OGR1xJ48R2C3M4HCFB2Z1j7qk2UOWflLeV2/3FRyQwDXYK4RGt
F+I2PqukQd6Tg0to/Pgs8BtOTvvXe8xcg6o2KXLeAcOByyFvqNlloPly6bMZaw2Z
f2DV6u7Uklh8P0XrhGbiOMKI53yfQp/dO0h+mSwzTiwweXBd9Bt5PokeKMwPq1uo
7LIFZNkwIWc0BUUsEZudul+si92VI9HYa3ZPmIi2HqHHvLFJzPQb3tK3Bz23nZ3h
oc+R4v1EJZkhMuEWjm4VRF1JunkNROQ9WGz5VD01yAQNJrzina49DbGzbDp9rCAT
G+H7+yk8uIu6KmX51l4X0c+oxV15jSNmGoG4J0duewE5ZrEfxFZo2xrreo757YqG
pHCP4K1FfdUGAFQcYNOc1Hb0Xsm11TOEoFjAko/neuGKw87kF6ctSBjSiN52zXPi
SQ+G5SRwGfT/Qx/89O/+hRzKF45JB4B1AIfR618F2ILozz14ujqrgB8S79dYnE1x
oFHbgJCsr/efGhEL0V3CgErYzBWeN5GcNGvyAa331XOeDVfTJOloqEVD7/cPCRpY
/RaCaArFHkLyLt8gMFhDysgoNPYkZqDVRJtj5dcDQ8AtL5gZP3k=
=Ck0D
-----END PGP SIGNATURE-----

--INvyPOss5gw3lfXr--

