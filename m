Return-Path: <linux-i2c+bounces-13256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F4BA645C
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Sep 2025 00:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE971189831A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 22:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED4018DB1E;
	Sat, 27 Sep 2025 22:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MW4gXeZR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C5F7E0E4
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759013209; cv=none; b=SKAFtsry5+K1HhnTO6U8cRb//XO84Hlfo+Gr4UiuZlJPDvSTyvdG4X+9FHFunli8wqOktqpSRBCXX+uF+V85pFkoCB0Q+cKU3PKa5YmbFUMreZlI2B/60lVg0jXkMtsEuOmf3AU67qtm34c0m3j7Tzkr7H64DdjRaotVBGlXMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759013209; c=relaxed/simple;
	bh=23ZtzBBNsdL1ydI6+8pzPsnFh82UUDa1m8t2OLyl3/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT3Kha8geNtcLNw88U5FOa3qrGYRXMKT0fhJLKuAiYPguc4zSyfJyBXAZukrnLOqqBgC4F3h297NJOxoVs72K1e0cgC2P0L3zKYZfKOTpn2tkHHy+/SEtLWqKe5a2Agq8ek7knbRepNm3H1M2WMB1cNwie5axziE/U+3kU6iKLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MW4gXeZR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=23Zt
	zBBNsdL1ydI6+8pzPsnFh82UUDa1m8t2OLyl3/4=; b=MW4gXeZRc/QSAYR7109e
	n1qzj7iFX1ovX18OhSCUS97Y50WIX1kV+49dVJ7of7vADbcvGFwyVxLyTv/0G9eR
	T0GI9oXzv2LvmYPv1PuxyarEOxYcIJSRfEaOJTxGokwjktd7ZM0izhAdAnVF+Z0f
	KeCYKg0OwvzP4e9G5jvDm4jRHwvSU4o0jsgL47EmQpXBCpZidncUz8XXyLQIuIUz
	qAtFXzjWlhp2TtKZd76wIupm7+CxLEuuf8ySOR9AFzYYucvZf/97ol+4YAnun3lc
	Dg+fURAr6twveifS5t0X+4KomgZe7pi+YkBQ+5vD4sI+r1bZlGRj7geDAFnCew1Q
	mg==
Received: (qmail 2705208 invoked from network); 28 Sep 2025 00:46:44 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2025 00:46:44 +0200
X-UD-Smtp-Session: l3s3148p1@Kc0yLdA/wMYujnsw
Date: Sun, 28 Sep 2025 00:46:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: i801: Add support for Intel Wildcat Lake-U
Message-ID: <aNhpU82VHCMp8_9N@shikoro>
References: <20250808130956.1167509-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dcCZenVpYztUgQEU"
Content-Disposition: inline
In-Reply-To: <20250808130956.1167509-1-jarkko.nikula@linux.intel.com>


--dcCZenVpYztUgQEU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2025 at 04:09:56PM +0300, Jarkko Nikula wrote:
> Add SMBus IDs on Intel Wildcat Lake-U.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--dcCZenVpYztUgQEU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjYaU8ACgkQFA3kzBSg
KbYh+A/9GXb8Eq8QGRVgN9b6EI6MLXVe/7ayCYoTz1LOjcd34EsviXzyZujC38im
qJIEJ3GgLHwRm7nzp1JzKYt9mMMpi0vIxx5KKUbf3SQLFB7Ieoe8UKnQO2cB8znn
k7SJAUFgGJjMMUbfToRsnu75TfK7xpMIx0FJu7KyVtkROJfxxlaegwZpFRcIkyQq
Hl9i6kHOXnwl/smqzo/JuVDVTT5Ah+VpDibyZs6n9wAMJl0GV0INdRPKDYutJJgw
0iR6AzkwcB7/zaTkrM8y61iypwwcYo2E2InojAyfex92+NuoFcWsDGR92S3GaS6S
JnLJi3KdKF0QUKh+ZhsRc0SRqszOK9PLFoloh4dvJMmGg26XbLhm6eUYP1EggHM2
YloA9KgGQOzZcnTSSsnrJSbJCjWvpHnx03NN5KHSkBzJWBDU7H8Y0ybgnBFsOaZL
ZjBNoxucttZBnPKnjWL7sfJpaq0dgasjXYoHNB9dqrhodPKgybFRLboGTuXYak3d
55LWld/r9hIchjftasPW8pn2Oyz0QQUYLadNIbFdWu2uxEGRVAFwWUUskzXk3Pfu
MJS0HH0NWT19uuS6lLxeiT26t9IRNdJEbUon7lMlZpfs+ilXPfUPUrUU1IDWUipk
qstBXmr0/vKH4j6GPlpIAo0od1BzfTdrKwAjS1nd8v/LwHVjMTo=
=u3gQ
-----END PGP SIGNATURE-----

--dcCZenVpYztUgQEU--

