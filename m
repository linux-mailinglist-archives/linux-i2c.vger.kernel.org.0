Return-Path: <linux-i2c+bounces-13195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD111BA2D39
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 09:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74826385036
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 07:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51C028689F;
	Fri, 26 Sep 2025 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NFam2oEX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818FF1A295
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872381; cv=none; b=fuMWJFT9JAPwT6daYVFWkVaNUyE6VZXXdTunAU2pryfDXn2/maGfvzPrHRT0h+UHcQ5fwGDAHYICwBGYpZmMrN7+nknR9tz5OyM/nQhYWWOD16jJrVvOeSyCWqzQOMP7wW6Nw7O0pyvFPEaMReb4sGtwbRA7bjOLnCOGGyHwIUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872381; c=relaxed/simple;
	bh=/ycPTMPiG8r8JNsmN0asT9sma/FZlZdzoRoUwnqhBjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqQp9zwQexI++6s5+nPVBJ32s0J6v51tYrQxDeTjYaPP20lDx2KhE6zsbHHlpQ9bZYXmWZIqUo7m3zKftTwHwvobH6+cYwoRidFEaXrmquklVGSjejxa54hx1pV+9Dl4nr0uWSVp1+BqlJKNbimMn99cOU5R87QgXRgmgtLjpkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NFam2oEX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/ycP
	TMPiG8r8JNsmN0asT9sma/FZlZdzoRoUwnqhBjE=; b=NFam2oEXRBYMFjTMDBMR
	Ozlq+IPqOpauKVMlpfv+u7VN8SzDA79t+6OF4Yc2nkdaWJFU7F3fCADvuGbLaSv/
	F88MKxD5XAHJZdDJDL9C19MG0dURtu4eF9RKk4aOS2x1fvmxp6iPxxFzshAUHv+v
	bIjXbjgeCXLXK2Ojn4JsQiSO2AsriBrn7SnIkI2A6v/f8yiVf4Jlg92UjD227BOJ
	OPg3KtwbECWZ5QbYkZxpCn/TV/Si0gemYXueXDEw1HaFB2GuIlhUdtw/3rLEPdGQ
	wVFian26enzSw6RPuTr48Gel+ynRRdz6ITj1L0ODo1njTfgKh4jucik+p+mMISIe
	gQ==
Received: (qmail 2167901 invoked from network); 26 Sep 2025 09:39:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2025 09:39:37 +0200
X-UD-Smtp-Session: l3s3148p1@4xZDY68/ZtggAwDPXwQHAL/S9V79e5yL
Date: Fri, 26 Sep 2025 09:39:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Kohei Ito <ito.kohei@socionext.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: designware: Add disabling clocks when probe
 fails
Message-ID: <aNZDObBu638wrpFk@shikoro>
References: <20250724042211.2160339-1-hayashi.kunihiko@socionext.com>
 <20250724042211.2160339-3-hayashi.kunihiko@socionext.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kbpt5MURJTKZ2O3f"
Content-Disposition: inline
In-Reply-To: <20250724042211.2160339-3-hayashi.kunihiko@socionext.com>


--Kbpt5MURJTKZ2O3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 01:22:11PM +0900, Kunihiko Hayashi wrote:
> After an error occurs during probing state, dw_i2c_plat_pm_cleanup() is
> called. However, this function doesn't disable clocks and the clock-enable
> count keeps increasing. Should disable these clocks explicitly.
>=20
> Co-developed-by: Kohei Ito <ito.kohei@socionext.com>
> Signed-off-by: Kohei Ito <ito.kohei@socionext.com>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next with the Fixes tag added, thanks!


--Kbpt5MURJTKZ2O3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjWQzkACgkQFA3kzBSg
KbZs6g/9GZD3yQ2Bp1SC9cDj2lW6rqcjLt2gdgsWWCNBpnzjGY6KuaIERFK+GbLp
1Wx+2Hq4pPDKm3xwxsigJa3cAAQxUxJE4Hv+r1UCx9ViNGh1wU9hJZ2PZ7+MQqse
z7bgtfei/qVcC3XUjuunE5jREgF3RM9TkjflZhFF60Lai/7BVDX7u0VFZSPM49bM
BKdPaV3Oo2E6K7FG3Xka43JLZUHyWGjG79IMiKigCmj/SYxC52neGWt4ghBapSzt
R1T7ftGq1hizCpAkpfLrrqh8ZdWKLphTFvOcEiNAxPNKsd0jXUNwtCTxAx35GUvH
GlgN+WIdZ0pqWivJnRLNBLBOTj/7hUEypyp796nZnL211/J9oW0IXwJNU01fLznc
JtmC5RI99eRv1T6tuYXZHjLYzmyjeMBfH6tjIBqe95AzDILld6Ub+81NUEECm9Ek
TvfORJzX3Q2Tq4+lLHfnmR9MxUALQ6rGiMAYyeyj1sjf+D5ezrc2W8MJSQls34uV
lP0GgLDCZSiNBGYjOb4kXq8aEx6G5uSPNbYS/17Uq3Feawz2ouS+gj1bULNlNVT8
GLgnQpeK44dB4EqIUDrgBx8SFFnb3wEKT7ObmYm+sLfw1shI601txnCKV8XODSkv
1g5oKJknCBzslitznRmcJLint8vyVNTLzF26Re65xf0LmlLshpM=
=94Th
-----END PGP SIGNATURE-----

--Kbpt5MURJTKZ2O3f--

