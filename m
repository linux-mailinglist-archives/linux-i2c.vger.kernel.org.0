Return-Path: <linux-i2c+bounces-944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4FA81C756
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1744CB20403
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FB6F9DA;
	Fri, 22 Dec 2023 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nn0qgBeS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DDFF9D2
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC76C433C8;
	Fri, 22 Dec 2023 09:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237656;
	bh=zhjBnVVarllkCcRSAdT0OQcnJYrfrDE4qHr/m1e9RA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nn0qgBeSrqNV98n4igretzfWLG6LIDryS1OQG2vSu92BPjDG3IFO7tDBHKqM+ZkJm
	 Sjx5ytsB1Wu7C696/W8GmRsOALr8DhU2rAVvxgXNmUrTI6SsYdEWtCNcxKPlY49H6D
	 lTDjmp1KkmDq4EQti3BP/wugES/tPfTt6riQEncRAb2RgTd5HgVQy8QoScHI00JR+Z
	 KqL9AM3mPM9oYtxWoRVgRw/oHASFIM8StLM3BIZzrkZp8I9HwsAfoSGu0s7gAEwR1A
	 0zE5MSfIlqVHEcebP1OLkZAyT9gAdMJZOjkKpsAzNZps+cNIY1H3P4C8Jlvkhhu65v
	 g3mAAcUI5zBHA==
Date: Fri, 22 Dec 2023 10:34:13 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 02/12] i2c: wmt: Reduce redundant: wait event complete
Message-ID: <ZYVYFU8rKGW0WCtH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <5931f8affc8992a229a4bae5bf9a8ad04a564107.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mVKeQzvwpRC5pytK"
Content-Disposition: inline
In-Reply-To: <5931f8affc8992a229a4bae5bf9a8ad04a564107.1698889581.git.hanshu-oc@zhaoxin.com>


--mVKeQzvwpRC5pytK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:53:52AM +0800, Hans Hu wrote:
> Put the handling of interrupt events in a function class
> to reduce code redundancy.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Applied to for-next, thanks!


--mVKeQzvwpRC5pytK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFWBUACgkQFA3kzBSg
KbYVJQ//R/3/dXBE6afz1f2ymyyQyMeRkS0zx23dQ3+BPTg32FdnVpHTLNLvzXli
hvEtEbA2OEiHLf+Rlebt8dgbJSpxRarQJfz8RFtkvoyn0JII8yLWxGvqYKCNVpfA
YwkX53/SgTPzA8HSh1viHrCOMEQ9CYnDCPau7WKs+Dknfo3dYM+w3o/eXaJti0sz
br1aaOWEo6EM4eIShMHGRdGFAet1aaBihcOhF/o0aesJ4tDltATOcGP544QQj0rb
Wu+tx0oY75XT9mYM0Xx/LzbrCaNBqBw+fBeCGA8eLKsvucJWL1yWKAfmq56zzb2A
rwHTQCHWLlYW9JPvnlP1GxNHruJERnhC2j5pgj6PBAyb1ihLeYB3SEQdkG8a7eL3
isr4QFFNJaBLspDk3IzaGjqeIxgAD5pcQ1pbGD/8U+5Yd+QT2XI7ofkBqOoegHtJ
btVmMJEvE6gy6N/tzWuo2NLSo9lji2uRVJGop3LumSVdBcSHnAzVhz7TxuwrCYzx
de01GOjFzSKaN0tc+X2uPEV1UwAOkH0PfQwxfwGCrXE6HJ+lhNEN9Tdw8pJbhtVf
0/NeNDUlMlWTyBG8JfcuYrNiKW0juQAt7YAk3aefRsLdTuWbBeoeqAKP9gOHXq2x
1hw2sYrz5r7VFf4H1pz9r1goasywChJA+8RDVBdqwE+v0bTZsxQ=
=uT0h
-----END PGP SIGNATURE-----

--mVKeQzvwpRC5pytK--

