Return-Path: <linux-i2c+bounces-15132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C9D1A970
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 852523000B2D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6725D2EC0A4;
	Tue, 13 Jan 2026 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H9yC9cvz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC12EC090
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324916; cv=none; b=mp0Qj4xReXSpka0YMjbaulc2yaQkpm9KNcMCj2Z/neJwaK/Uo5D2KCrAYZjrdElkFeuIubPs3F2kA9EHMaNE5spHUosoJ/qfBfj5jqIzxVVztKdhtsiOu8eF/GqiiVMUiutZQDwhwgW7TTl8W1pRuUWUNaGb8LbMoFlhOdST1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324916; c=relaxed/simple;
	bh=WxLMkqL3g5Y38LUlalWsyAkYVQwJ6SPKbMtYMvA9PZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3hByVeqR0jH6YQlE8e3cuHUlkDx7iLZRACaL3o8yD9x7WWr0eCZmjH6qXGabGho57HvcbC3Uzp5Uam3dhg9yTlVSQVmdEOvewEUpBMlWC0R8Okw1SAKkhYgsc+O+RFYVR9V3wqBHmRVh8i/+4Mmw12UD6zwIClIyw7q948cw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H9yC9cvz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WxLM
	kqL3g5Y38LUlalWsyAkYVQwJ6SPKbMtYMvA9PZY=; b=H9yC9cvzSColSGsOpx3N
	vErZ1Ja79c0BY4fNS8s8rjmK4IX9azTPCoMYore2kd96OXy+i1povseLET4FTzd3
	oTrv20d7GP9TUI3i2gpTi0NWEB/+6XPjCG1qEDofFeJYxEHakJjJfjpVRL2e9rQt
	AdV4H4JAZNR0LTyW4xodvF637D3wm2bjJZ+DrVPF75RkaG7V+pLrRpP8x1GRJvg8
	LuyHk6hRSUjN49gwzWfEvB1sMMhFjjx39/3ExZRd+FswUtcQjGVwPJCy0zmoLBoh
	zPhgGzxICLOCScCiN5eQvcDrAx4Fmx0F+moPORKIlBqvV/yQwFkWXoZGOzLyKyGa
	pw==
Received: (qmail 1793778 invoked from network); 13 Jan 2026 18:21:52 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 18:21:52 +0100
X-UD-Smtp-Session: l3s3148p1@0aI9OkhIhI4ujnvx
Date: Tue, 13 Jan 2026 18:21:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH i2c-tools v2 0/2] Add support for message modifier flags
Message-ID: <aWZ_L8snDUMJ8MJP@ninjato>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uvBbiIBLDzgKZVNE"
Content-Disposition: inline
In-Reply-To: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>


--uvBbiIBLDzgKZVNE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Beno=C3=AEt,

> The patches use defines that have been present in the kernel since
> v3.6 released in 2012. If compatibility with older kernel is required,
> we will need to wrap some of them with #ifndef ... #endif.
>=20
> Maybe a minimum kernel version can be documented in the README?

I'd rather have a little ifdeffery here. It should not be much, let's
have a look in the actual patches.


--uvBbiIBLDzgKZVNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmfysACgkQFA3kzBSg
KbYp2Q/8DmZptXsMR7Qio1o7CLqtY4ktWzKyS0Mi/3M/4fTe8DRfG1+WtnCxqL6U
XouoimpkhejeIgpB/LL+o93tKo7i+N/nM8G8S7jo1VefSZ5ZcaaeoJui4gZWo2wG
D5Zpg24rWmRZoLMvPDyERw8WyMayQyoXgmvYNx9TnLWVdbRUy+8TMrfzI3RkR/EZ
axKXeebK9ELULtfN58NcvyCIBYFWsvnj+BFkRxvYDdkoPOonoTfDks+0sNXQI9ys
Zgcb99ypsveb8vPqY3iblokrUgff9CANmpfEN8niHFnCMG+QLBHP4u6y9ZQnGObK
67Smb7UC+OoRgUk1tzqhJIbMkAMQXA1S6MTZ+RH49nJ0eO9vSUFm/MXRTvnwZ/gO
CeYCxxrTlj+PF25Xn7SakOpr8EA3PaB0rCDeE0ZMbRD35KvHmDGH0xijdoZ1aHqJ
TYMaCxplPUH30cvcI6x+Bg4T4Lny2dveQ5wZ3u9nMbOSSE1mYV9FAzjdXHZF2e70
RnGHgNYqSAzmDrTE4XdWFpWXtaba3iXDBrLcTiQrh/OYW0hOlJWi1T3fHCLOVFD8
FyqTeSQwyAoxXmYeBXTppcPGtXWeER4WYWXTq9cN/dw2J5u0UkRUzWP+M/Dw+EbU
zSdasXh2CKTLkre1tAafeXMU3x616lZWCfTyQ/EyLDzOQt8IWbs=
=kbnS
-----END PGP SIGNATURE-----

--uvBbiIBLDzgKZVNE--

