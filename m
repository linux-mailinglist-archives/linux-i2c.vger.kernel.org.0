Return-Path: <linux-i2c+bounces-943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522881C752
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 10:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 515DB286F50
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 09:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4071711719;
	Fri, 22 Dec 2023 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeaJ4Tyd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EFA11704
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 09:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0169AC433C8;
	Fri, 22 Dec 2023 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237609;
	bh=xqb2gzCtnSRK2isduQ/uZIsfHDgC7GDtszpsuzaZsXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeaJ4TydbeEMeiV4FH1/d9YM7keUKRA4wwAj99jB/Z+C7WyTeAXkNEytn++VT0ohw
	 7+WhImG6OcxzmJCmp8zw9NCTtbuSokUQDmpi+mK2V1jc+nlJDANvNdxALLpnkbJ1ua
	 2iMfFWvmBTpfh+z46e7aV+VHovJAf7Ag3+XnXdJXmcGIdjW9xp8AbisYRE40QBlBnI
	 eHGti+q4fsdLqrEKgKDP0Yg0CfvjuIkaWLVrGvWopBDNw5Ji84aNnaC5GYpS4XnXzy
	 yQcGORKqAinuX7IUTP/LaVh3AMtw6wzVZI6Q5SxkShi5x2BA2sFF/cHt7yJ8/GXK4A
	 384yYUl5Ol0QQ==
Date: Fri, 22 Dec 2023 10:33:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v3 01/12] i2c: wmt: Reduce redundant: bus busy check
Message-ID: <ZYVX42ESrRIKldxy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1698889581.git.hanshu-oc@zhaoxin.com>
 <740a0a0cff29b236eff4fce9225ee256ceedd8d1.1698889581.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kWjqe/vmsCJRiJJ8"
Content-Disposition: inline
In-Reply-To: <740a0a0cff29b236eff4fce9225ee256ceedd8d1.1698889581.git.hanshu-oc@zhaoxin.com>


--kWjqe/vmsCJRiJJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:53:51AM +0800, Hans Hu wrote:
> Put wmt_i2c_wait_bus_not_busy() in a more appropriate place
> to reduce code redundancy
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Applied to for-next, thanks!


--kWjqe/vmsCJRiJJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFV9sACgkQFA3kzBSg
KbZoWg/+OpahGujQfUfTO9DMgH87i2xMujd8aDrq3esqWJXhUJ7Tv2Uvut1YzOkY
QVRRjIOQbz5IqLG3sd6T2og/5UHDcq8d6NZOpUrwNGlsMVpHjAHzayUzlhDJW+Fv
qLqojfc674LLamq3UYygkK1cJaliknPD/cczMlHLZJToVc4iwjgolPtP5gksxbhR
GIDbtpjw//sIkkwCAytQAacrs0ailOPrYiAIDpWjI6DZgsg/9DyRiWN72BCMrGK3
a5iQB6xCYS03bxlzgiqUPiy/kQ/CahX1T7MiB67uVN460FIFR4MthEedpnoFwCLg
6OF32XBGeF337Y2EpMfLUiHRhoP91ybrikex+2yOcpIP2kzKVJjZgJkxxuZiyMSo
YeJMMHpfI7XGcBrFTGtH56qmQ6ByBTpdpMiz3hKFTll8OERN1LYzibqNAlKBgOC0
5fFCcIElDpJD69qAcvtMgM+SZAtfZVT/GgSC8z8DzQxyCFsZBv3N6BadiMb8Bwk2
uAP/MrUPN24O09dyJ4p83INDGAOrTt7Me5UFLavLXYhhUTzeIERV+Y7D+ix3NLa4
fYz7Wuj8lxlpWZEIWoMdIoQdWdphQ2nCadvjPYZ0LFg5gq/WsfSDn250joHFvzFA
st+akSyd6Z+SpiUlDpLNFE+Tz3cZ6Gkc5DLO87VROqG0iEYNwD0=
=hAt3
-----END PGP SIGNATURE-----

--kWjqe/vmsCJRiJJ8--

