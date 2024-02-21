Return-Path: <linux-i2c+bounces-1888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A885D7F3
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E3B1F221A5
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22AF67E9D;
	Wed, 21 Feb 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAuPkUJ2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9099E692E0
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708518884; cv=none; b=SPTpLcUO+T+UhLn6qFdOeCBb+ORkai72lAw6ApOC2tUT8JliuWan2QVSH/IEd7drjeKGZhDLvhqw2FKute/UjLvKlFYMdoEsXZeHATge9IupmXR6DD1a0QWXQIMRhVGynqnfw1pALm+xvt1CdwUSwx5NEHbVrSC3kms5z0e7Bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708518884; c=relaxed/simple;
	bh=wDtnr/WY6wvq4Xa5ehGg8bR7yB5aSnu2mU7YceNkr/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsDRcXZacLB9SgVuPFFVzeLHgymT8JrG1LK7jop9o0ubsDowdbVbYhUuQQixkj9GYi2VosMzFfQ03xDdRYe/mMdH9tyIxxiABbionch7/SLXbyzqgntZIzwz5ums3/ch3aD1NQcLuWbuV2kWwh3KAppRmj6vSfDAlNta4rOxZxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAuPkUJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD9BC433C7;
	Wed, 21 Feb 2024 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708518884;
	bh=wDtnr/WY6wvq4Xa5ehGg8bR7yB5aSnu2mU7YceNkr/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAuPkUJ2mL0S+Ye4wLurUCaJ5Cq+aI8PRwXB8MbHKLHi63OJ3W/lbNAk2BD1IMyhL
	 F7Z5kShznip3ScBUpV84Xnn1Le4JNK3qPG/4v50TVMaxBt0jng0kgl+3ZXu/mFhyfJ
	 SJ+pkfdYdIj0dVbFlNOLxwtzNywYAsgXAbztZ5vos0kHeAGKKdZybZVVkNClzFv1qp
	 pKvXAuUmY21fhwTFCLsPkeS10reFCjFqr/HAxCW/1TwfFFIfeR/6wwIk4KYciujErZ
	 LZw9c8HLy3e9r43kH9lcQ7/n1Qo3fnC1Xo4c2hR7DbE6+FrlXqNm+RJchUFbbWGie+
	 1RJpDE7miBTng==
Date: Wed, 21 Feb 2024 13:34:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 3/6] i2c: wmt: rename something
Message-ID: <ZdXt4Jt54PndZbnU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <432d07f958b7b4d68759dc90364506afef3b0d89.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9hfYgXyyjSTUsoyN"
Content-Disposition: inline
In-Reply-To: <432d07f958b7b4d68759dc90364506afef3b0d89.1704440251.git.hanshu-oc@zhaoxin.com>


--9hfYgXyyjSTUsoyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 03:51:46PM +0800, Hans Hu wrote:
> v6->v7:
> 	Put those renaming related patches in 1 patch file.
> 	Link: https://lore.kernel.org/all/75978a2c47f17bf6871b92803e9c075e52aed1=
b6.1703830854.git.hanshu-oc@zhaoxin.com/
> 	Link: https://lore.kernel.org/all/c417d693bbdb3a4b804c1c3ba03e57bf4e8c33=
e1.1703830854.git.hanshu-oc@zhaoxin.com/
> 	Link: https://lore.kernel.org/all/65b930cefd380ce45e0e1b3967bc7f51737b09=
48.1703830854.git.hanshu-oc@zhaoxin.com/
>=20
> 1. The I2C IP for both wmt and zhaoxin originates from VIA. Rename
>    common registers, functions, and variable names to follow the
>    VIAI2C_ and viai2c_ naming conventions for consistency and clarity.
> 2. rename i2c_dev to i2c, to shorten the length of a line.
> 3. rename wait_result to time_left, make it better to reflect the meaning
>    of the value returned by wait_for_completion_timeout().=20
> 4. remove TCR_MASTER_WRITE, its value is 0.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Maybe not super necessary, but OK:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9hfYgXyyjSTUsoyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXV7eAACgkQFA3kzBSg
KbZL1w/+NKRqtnkvL0j01z/W4ho7bV1m8fM4r1liKFinPetocNDNw4hG96XFvMML
6YrISETN9fPsEjdsnxFfXFVj+STP5BhIEfAgJNqpNQ0SREWzHOKmYZGg14cg4O7b
zgoXw7iSa1QGCSHsFyvmjsg1tyHCRYun+hqWkAuyB/RUT5sjd73kr3xB2v1tIPM2
aVnZ5mvts4T5ai87enslB1w/LcrtV55C0et02W+ZGdpSnw5NX0uMHV2Q1dpYmJrg
5lNcfShphB3+OJn4bH7j/+HyLBZif/FtMf13NsYyjuNRBootXfkEsYNuinpowJai
DsqRTI6xEfmZ/3ztCWtvGLgTjCLn3wvGmPMGhMy1Nodb5GGR78A97k64DdmExsew
kJEKnzAEQ3GkkhoNIc7npZ4VVE8ZUKyFcevRBavdVO+D9xy5Oq5OCs5hHWiVlb13
F6uLnvk8xWER3kPOOmlry6bYxLfig7fE2Z7aUTufSdWJX5JY+uru4fDcoJDzFN2P
UZSpDTsdZAHkbYSOC0rCfgy2Ik/rpSY8Lyg0poDqGJ3W1a6EplziW12T38SywGIo
xq6hxA5kcpfrfYZJyqTXP1mtHiX4oTGltGYDwiZVCFZsnAdlkt9JJhCls5rzg/Z4
6DxPekW6XHrUO/pgIb1lQ88ydhaqyHPcS/i9IFmrHl7q6DbMfgc=
=VKCP
-----END PGP SIGNATURE-----

--9hfYgXyyjSTUsoyN--

