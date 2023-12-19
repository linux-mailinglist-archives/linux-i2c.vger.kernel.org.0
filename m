Return-Path: <linux-i2c+bounces-867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F78187AE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 13:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3909FB2278E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 12:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FA819472;
	Tue, 19 Dec 2023 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BQIL/e4Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1519444
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XBMa
	Qmc/cfbPjI2Y8Ee0G9cEIg6phvSNZjd6ojlU4V0=; b=BQIL/e4Y3gkAniSP5BV6
	78sbvSkX8guQbplc+DGxmb2Issu2PqxwPtxapkye+wGBfvaiBbV7D4AAWpvLYjx0
	enLTI0nu7l+FodkezMVzqOHBB9/xaT1Vv9QjzPO7tHPR0ISEIFSXSNd0P/yuYn81
	3vA/rULuDi5TDgaEJKMgUJxXto1ieuBfexFvhXHlpl/2+2ui6eUQwFEpktjTvMmm
	4/k2Pw36sZDXYfTsazgbLCQqlwAv5wBQuAfpfDDPbQBzzQaHFv2dY8QmGHlKQqZw
	d81Htoo5UinJtavz0cgyvKMffqMswrQTxSADCw/1YuPyxZLB1AIft4Z5NIG6asAC
	ZA==
Received: (qmail 2562517 invoked from network); 19 Dec 2023 13:42:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2023 13:42:42 +0100
X-UD-Smtp-Session: l3s3148p1@UGvRM9wMJowujnsb
Date: Tue, 19 Dec 2023 13:42:41 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 0/3] i2c: create debugfs entry per adapter
Message-ID: <ZYGPwYPW0w20RCet@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ppkP/EhJjhxog1Yf"
Content-Disposition: inline
In-Reply-To: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>


--ppkP/EhJjhxog1Yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 05:54:40PM -0500, Wolfram Sang wrote:
> Two drivers already implement custom debugfs handling for their
> i2c_adapter and more will come. So, let the core create a debugfs
> directory per adapter and pass that to drivers for their debugfs files.
> Convert the two existing users as well. Tested on a Renesas Lager board
> with the i2c-gpio driver. npcm7xx was tested using QEMU with the
> quanta-gsj target.
>=20
> Changes since v1:
> * rebased to something close to 6.7-rc1 which includes i2c/for-mergewindow
> * tested npcm7xx with QEMU
>=20
> Wolfram Sang (3):
>   i2c: create debugfs entry per adapter
>   i2c: gpio: move to per-adapter debugfs directory
>   i2c: npcm7xx: move to per-adapter debugfs directory
>=20

Applied to for-next, thanks!


--ppkP/EhJjhxog1Yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBj8EACgkQFA3kzBSg
KbaOOg//RV4+1QxQREn4K1PWPhTrAj1mBvwQgElok6vn5RPGEF7E6Ub1U/cxlgOv
Ox/fJ3UtITxlWDTeJXi4WNl+96QQJ6FA8lj0Egb+1OwU0YksB83yw7rwYIGvAq1j
cpwq+e/k+qWz2c7GNKm118MP0oYNcK25/IcKnKlaTNoWVerIrUXnnEtKaexbuYGT
UGGSkUNe8b5No2nmuR2xvCUoE2XBZnTji9+svnZh8ubGnAUGRVSmIkpU9Mp2/keR
Ab7pwO2INAC7F+/Ks0Ldd4YY1ksuwqLUqKJEeZqhdXr+5PvA+1syW1m44MbgldxE
/ibyqnpr1fAk1EKOQ/p+v9x9Frc0rtKPtX81UFnpeaDJ2VZzaID8RYX5tYZ/DKT4
kTGHbal86VFyLpXl5TZAmineIQvrwvMI9/pbtRyKr/TahuDS242xw/t6wMBjjoYd
vD5Qe1siY6hwrFgBECHqhpRq5iC1oRCeQIcJFHAyEYF4dbytwwc6LorbX/2pNGWo
h10MGEmW7R+HMM6WawQm/RfqW9lXB63TRFIYwBI/4Zjclcd0G4ew/Sj8iK7iiNRM
W5y13j0Ol9wfX7CwBnDPtuYDmecmFfmUOyEgEh04Vgl0k7Wl3tjBqNZGCjkWoQbT
ZFHo43fYVnZsHAEEeiLysFZyanpqunyCLE/uj/ZpMRdCbVKJCHQ=
=Qqz/
-----END PGP SIGNATURE-----

--ppkP/EhJjhxog1Yf--

