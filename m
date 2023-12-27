Return-Path: <linux-i2c+bounces-1027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E181F184
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 20:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D471283C8B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 19:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7540E47F65;
	Wed, 27 Dec 2023 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cb7d04ki"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68C47F5B;
	Wed, 27 Dec 2023 19:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484EBC433C9;
	Wed, 27 Dec 2023 19:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703703972;
	bh=N0cqGhgpGMxjcJPO+bFemFvFTjsgoCCZ480Wv6YlprQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cb7d04kin1cLjy4u43wi/K5MMN+zeT3A8wy+7NvSzhv1gPZXPLsF0DrmnYLc621cU
	 f/sO9S5IEWuISsR8eC7NfYN/+Wh9ao/QFIgBp+Vy/6dzi+bvkgBl1P8tBtCbhCLaau
	 MylVJxWvp5MMgMMY/iRCboxnpNzMIMjdK3/PeiqMk5uU50DnD2cPwkt4s6FDZNnTy+
	 pohfSqm+VLFjhm5kIv8/rG4AmG7CVos3CAOxWI8DeT6nr07QOi89RPiaycL0GDQq7b
	 l6F3UQZ8BNXxRDnn2X4kDN1VLFL4Od2vJXsLXQYH7+hLIjxEkoabXcEyQWWvBs4xdR
	 UCkLGROybjMZg==
Date: Wed, 27 Dec 2023 20:06:09 +0100
From: Wolfram Sang <wsa@kernel.org>
To: attreyee-muk <tintinm2017@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/i2c: fix spelling error in
 i2c-address-translators i2c-address-translators
Message-ID: <ZYx1obB8KiuLEyI5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	attreyee-muk <tintinm2017@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20231223190852.27108-1-tintinm2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/9gIhJ5YNjtlsPpd"
Content-Disposition: inline
In-Reply-To: <20231223190852.27108-1-tintinm2017@gmail.com>


--/9gIhJ5YNjtlsPpd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 24, 2023 at 12:38:53AM +0530, attreyee-muk wrote:
> Correct to "stretched" from "streched" in "keeps clock streched on bus A
> waiting for reply"
>=20
> Signed-off-by: Attreyee Mukherjee <tintinm2017@gmail.com>

Applied to for-current, thanks!


--/9gIhJ5YNjtlsPpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWMdaEACgkQFA3kzBSg
KbYwxw//TDGxwy2faRT3Tf4wA099JyOOhrEaBFSA7u5X9S7ETu8/0PfRTkSErg2U
hbo2EE70xDQOM5cLh9MUsrLED5R2iA/sEkL2AQW8jZVA14aQkrD0OtJgd7kTP5w5
qSxiNasfuIn+4ODNiwVdT18c48qvdOtp5TCXvSbRRqXLZlgBFN1IX7lKVzdhSGU9
AdAeG0gxPrEaHRhuz5xIKJRrGji1R97kx91dTnD+46MvtidetNg+SEHQMKQdfPJv
zO0qRXeglUXCjukZyrSlYzSZh9aCY27R3hytgec8MvlonFZbxVHlAwAgtvIbYYtY
RM5WfrPgFN3ICSrQgQ+ieGa/R0FXopej+8oGLTPRmSN97wq13Kd0mnf8PcxfsOh4
lbp/FeghE7LY94Xclvn+evCO1N2TPv/THIgJe1WDYnPdhueF/ACGh6LHRkDbF0yI
Ca7vEIzIn0tNuwRZuwuqCYlv7fTnkF1beWMlbadMLugY374tKT/QGDVlHk22ACrp
ZQnVsQRDL91Gcf3/ifUrh9iQlsuFW3zpUo8yzkCjQPmvpn9VgL1eqNtbbdFS2RGy
QwOHn9ZtN/K1qKikS9+IUm1eCel+B2KQNYxN2cw6vGXj69hOSsOKK5DeOUAFnZDF
Y82AiEOe1WrB37OuLi6dOsjYLCarERdpvviilyuahB9g5RFBwug=
=tMa3
-----END PGP SIGNATURE-----

--/9gIhJ5YNjtlsPpd--

