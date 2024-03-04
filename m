Return-Path: <linux-i2c+bounces-2136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E486FDD6
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EE22B219AC
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E73C134B7;
	Mon,  4 Mar 2024 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krV8Cd4n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA118EC3
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545290; cv=none; b=rnO23Hb6+HH/0LwrewGk2apmgIiGvqxb/QU9RpmOxjcQBWmyGEwOmoXAdvSVvICCtNdVDft4eeayx1CPgZoSa7krUvS86knxCotQvUeVxr5oVsbzWJPl16dAYHXQ3JXdSEaVSwlO68Rkz5XZ+z6rAlGl9/Hha1qVn5cJSFMW3jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545290; c=relaxed/simple;
	bh=eubko6UE3eUrKe+2OrpnioOtDnJQGtz25u0G7joQQbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB4zuhayI+xAYlDKsJ4gSXjVV+y2jYSuf9zg0YFOTFX0c0nHKEvDg9nwg5notRjtiXv9TeKhlKbQytpJTqGoMRnsjZzYE9FGc3sNx6uLSZIl4Si4ZXxLm7ZOjedAKNe4k5qLwpUt9zbkN7S7Ac/TSmynM7jd2Vqy/tUCBLKtWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krV8Cd4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57690C433F1;
	Mon,  4 Mar 2024 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709545289;
	bh=eubko6UE3eUrKe+2OrpnioOtDnJQGtz25u0G7joQQbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krV8Cd4nGbQfcoZk2aKhn5pMmBrF6qKtYAEpLmInmRHRQKU3tHaEnkcyfOGKkH9JB
	 GcboiLYPcpCepRhQqSKlNsJ48Nxp56KXfAGFFTjUZ9VcqMV7SBT4zKGOg1gNjTqriA
	 gAgpcDKMVcMc8Tjoj/zzaPwZMiQRSzOcPtsq9kBES1DHWCI+g5QjKKDh5NeFFBkRo4
	 L8ioh8UP7qdqyavPOeDinqn/jPgPub5D1Fil6Lmo5wRURPJVgixzcOKH0stgcxSJ0W
	 SISCIFuKFRMgxNyd8TfiUfNQjRdd1Aw4Jml4tyd+AA7fkPLDLXifk+wYn7T01BdOg6
	 XuulI/H+fun9Q==
Date: Mon, 4 Mar 2024 10:41:26 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
	hanshu@zhaoxin.com
Subject: Re: [PATCH v8 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <ZeWXRja2K15eE8Co@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com, hanshu@zhaoxin.com
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <56b8a4c309944a85dd1068bb6d54fe40d26c2b3f.1709014237.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aL1pw34T+e2nMULM"
Content-Disposition: inline
In-Reply-To: <56b8a4c309944a85dd1068bb6d54fe40d26c2b3f.1709014237.git.hanshu-oc@zhaoxin.com>


--aL1pw34T+e2nMULM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 02:36:31PM +0800, Hans Hu wrote:
> During each byte access, the host performs clock stretching.
>=20
> To reduce the host performs clock stretching, move most of
> the per-msg processing to the interrupt context.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

I don't have the HW, so I can't review on register level. From a high
level point of view, it matches my suggestion and looks good (one nit):

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> +		val =3D readw(base + VIAI2C_REG_CSR);
> +		if (val & VIAI2C_CSR_RCV_NOT_ACK) {
> +			dev_dbg_ratelimited(i2c->dev, "write RCV NACK error\n");

Even as a debug message, I think this should go. If NACK really is a
problem depends on the client, so the error and messaging should not be
handled at bus level.


--aL1pw34T+e2nMULM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXll0IACgkQFA3kzBSg
KbbM0hAAsM2OzlXPknOrlBoHEv3BLRQRtFRMVva2Beeoy1KeWx1qv0eus2sNGxLe
34t+EsR+/C4AlR5dXHKvjmnhMXS1jt+CQGTQG39gYExHosGhG/jCyoi+bhHdF97s
KHkV0l9YJXtZzLRaqBI1T404wPk7+0CRGyV7FHQqIm+my0L1X/yfxCsPBpFQaKCa
9u9sPmWLVgsGpTzuMqvPjtvvrHGip42OsFfNTFRYu0ag/ElCmM1GcDyr3Dh9KYwz
1wtldMQV8zrWFBYYeLZ5hJHE9iEA62sleUCNyD9fwRlrpUMyc2muyr1AxF5UpDeV
qJLiG6uVWuxqk9OkHxsIq55rXjZrF1dEwDWqrqHzVtnM+7XqZc+wubsOQfB3w9xT
4NYao0TP1g5/Eri8dPmuGoQRmjmy4vpn0wrh6WFlp4nAmSRA24RsatUe+oSU8Ki6
/JgNQEwGeISAwehn9brg/BnwkJmXGNY3ocwzbV7ESzwQuau/vZRhoUNr+UZtLhoj
B9Bnq6khtVvuZpHyKTD/KLcEeBGMGPgOo4/KewOIscXdM1DFXl2fqgcrhmlz7+4O
kFDW6Fz/ZtpLZbHv+VJnFQFKUbSy78m3F4qFif0A2+IO8GpNXoK3oQSzAMg5k0MR
GjaMQwfV3eqfsLKKreWVF6XotnZnQr8tF378Y8YmTb/EXxh5s6s=
=mBxK
-----END PGP SIGNATURE-----

--aL1pw34T+e2nMULM--

