Return-Path: <linux-i2c+bounces-945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDF81C75E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34DF0287275
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949BCF9EA;
	Fri, 22 Dec 2023 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRzudhgk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9EDF56
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDDDC433C7;
	Fri, 22 Dec 2023 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237789;
	bh=wyNX287VNkjNSqB5oJFq7Mt3/rWxH+cozkCtXBCaQYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRzudhgkHHrHrWQR++cKD1/0Eb3CzHKes9LC49QeBJbgQGGpnV2ZZTSXbZq7V5R/O
	 uA+4gI3ZTXt5IypMs4X1Okhv3iqfAFSIvPErQEL9WXuYmeG47kIDiCQtwbXhbzZ+zf
	 X85g24hayJb/Vhzn8nuz/6d7oxBLkmcETOPItXGgOAf443FqGElT0MgrhbCHNW4ZYE
	 PNvPJ+gHA91zNJR7dOAHdtkhAomRbDWnFqmedU0q5kqDrn6clZ75Bq1lw2poU8JKas
	 0pYpMNJDEmnTZPLR4oEE4lMv1Mpfs6GfotPKIz/ujS2eW8UOtxY21KSS57GKTLinap
	 wTIYhR1NLiIIw==
Date: Fri, 22 Dec 2023 10:36:26 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 03/12] i2c: wmt: Reduce redundant: clock mode setting
Message-ID: <ZYVYmuclEOVHso0E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <b9b9336a2d24ceb23fb773932e7836b0cb04f372.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TZz+McjHhzAmwKhw"
Content-Disposition: inline
In-Reply-To: <b9b9336a2d24ceb23fb773932e7836b0cb04f372.1698889581.git.hanshu-oc@zhaoxin.com>


--TZz+McjHhzAmwKhw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:53:53AM +0800, Hans Hu wrote:
> The frequency setting mode is adjusted to reduce the code redundancy,
> and it is also convenient to share with zhaoxin
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Applied to for-next, thanks!


--TZz+McjHhzAmwKhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFWJoACgkQFA3kzBSg
KbbLJQ//Qqvcmyvdi8CJEH7+ztelLzF73/ZkZlQacGXjH4UjkxGuaeM0F/XcVRBW
0FG29wyHf8Hq2VrQ6rsYcLCnGeUsyqzo/QlQHznt421Cs16Aw4p7Nf4++U070tkI
RFiIFlNy8GrkWv4FsJUY8CchtFRWjVJuAO1euNVbRJLeBopH+gdrMgZUDFLkZtpu
dDN+5SMaceKPh+37cRS8z7ajt799MgZw8KFwBX87PcOVPdDWGw4XzPwulBjwNBxs
JqTG7STOQnrYFz5hrXt1YYSjIs4FIbtZ7biV3YYmeNiEpC2fv6gJhD51O+kMos7L
/c4k+/DYScuogmlFy1DoAY6mO6ARc6IBvAuywkip6TbpwrRWwKgzuVkOoooa6yja
AC96CVTV3k8hhUq6hAeVfzb4kCvGrh2Dv0MJ+XwdxH9Pu6CSChwOlP0vEZ1EnKen
6MZLjXwZ1DyeTtCN7ZIIN8ZO+GgdAZEAI5yil/AtmkcE6hBBNVtT+NClOxH1RVcy
qGk0BR5/fS6vn/Ppp+Az2Ami+VwF4ThboNdH/Sx/7SQw58oJGc0sUEbb+IoEzRed
hS6PuKqtz+ds2zBhe6MOLyJGIaOdidJOjAq05lYSVZAcyDXBVsWy2haVRoLG2vjE
HEys90JxF3sNy6DniTY9ODgH3//cHRsbz2vUu+P8lLjkIsEyexA=
=GrrL
-----END PGP SIGNATURE-----

--TZz+McjHhzAmwKhw--

