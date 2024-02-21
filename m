Return-Path: <linux-i2c+bounces-1887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4785D7CD
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2AD7B21845
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7AD4F889;
	Wed, 21 Feb 2024 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5py4vS7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99F4F213
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708518002; cv=none; b=tjA2hGzxip4L27mxPTMLBFCjY4Q2xzpTk4SWs0Szb/SCtKRCngGLbAzrRNZRTA6dcWQW+hiX+qAWOcbJkE70J4xYxTI3cBd7iTeBKQpBnneD4ibIyQUA329aWSGF9DxAAGddSLetgub+sIXsmXauAN7xp2jQx4csrwGv63yRft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708518002; c=relaxed/simple;
	bh=K3KXVPN2qZORpNEcBo0+qHM4sgzLkGQPXs1jagOi4lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTvWZjHRfRkg69j60kKjtiJHngixqpGRwknrslaPpdUr+w+/4HNCG5nLhQZXOb4G66cITL9D4LrW+BBQAW9rm6Q/BA8b+5Ly2zpQWQrr9cBpZlVOeYsINYn+3AwfTs5QS6sw2n1KMHJVeDXqkPnbccqz8o31HPWDAxBWtCr3YjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5py4vS7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F286C433F1;
	Wed, 21 Feb 2024 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708518001;
	bh=K3KXVPN2qZORpNEcBo0+qHM4sgzLkGQPXs1jagOi4lA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5py4vS7ILN0IyPV6PUKbG2Rtu9OKx7FIGB2e3+MpTywTqt0AvAjM0tr2xI8WAvGA
	 7r33xk8Mh2+zMyP43rkAvvhQv25p2iuUFso05+2V5xW19/YIBIf+Azquzh1EW3r/rt
	 7RCiIvfT4b8lr/yg+gQPBp86YtBK2NWSFCGhHdUwpW/GXhWOhxdBMsfDnMTX+3G8Mm
	 np583RuJnbFy9JzA+7XWtH/os9GGwRS909li+iWqXotd+yoKK3FautqE8RuIBZ06BY
	 XgNkNVs+j0nkhgdQ3H9sCEA6A9mAQBvaMN0hYY+QHyYS7/7pYTiaN2XRKrKMNPqSjx
	 JZK5yMvuwV7LA==
Date: Wed, 21 Feb 2024 13:19:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 2/6] i2c: wmt: split out common files
Message-ID: <ZdXqbtPXUX_uY_V9@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <6ad69f15119b1ab8afc781d31bd4c4557df85ba6.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5nK2sqbb5G99niy"
Content-Disposition: inline
In-Reply-To: <6ad69f15119b1ab8afc781d31bd4c4557df85ba6.1704440251.git.hanshu-oc@zhaoxin.com>


--z5nK2sqbb5G99niy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 03:51:45PM +0800, Hans Hu wrote:
> v6->v7:
> 	1. adjust the patch sequence: move the split file patch to the front
> 	2. rename i2c-wmt-plt.c to i2c-viai2c-wmt.c
> 	3. remove '#define wmt_i2c viai2c', use viai2c directly
> 	Link: https://lore.kernel.org/all/1871ceb5c3d6804c6a7f7a38327919861985c0=
66.1703830854.git.hanshu-oc@zhaoxin.com/
>=20
> Since the I2C IP of both wmt and zhaoxin originates from VIA,
> it is better to separate the common code first.
> The common driver is named as i2c-viai2c-common.c.
> Old i2c-wmt.c renamed to i2c-viai2c-wmt.c.
>=20
> The MAINTAINERS file will be updated accordingly in upcoming commits.
>=20
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Looks good from a high level point of view plus some detail checks:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--z5nK2sqbb5G99niy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXV6m4ACgkQFA3kzBSg
KbZk/Q//ap++sFl46Xa6BwjXym3+PE/gTpdCtxJ3VRpLjz+WXawqVO2QxYFxmesf
mwfQU0qhpwlyzhdplChy8fkL5iEIHlwc0VTsVPf/kpEz2AP0xnlCUDdEBkMQ0jah
ildpllPGVSPzisJlC7Q58u8mma8b+xL56kQjbHoUcwzmf+SrB/pT0qnP/rkj0Xz2
kwkuLMRMX3T05UBiNofzcgEbINmRGjHco5H0Hl8vOcMmfn8r0uo2Dlcdza0yMoCw
byNOTZHWOpgJ8x2BasaERzMD7G5u/DNDW+mbQM4aQmW/LpePdT+3+esJ5C+QAMVk
ldi3HWhUX9k0ZfMguh9dzoM1dqekFLvG1X+27LSvHOX0rWJ1FHmOCuu3CCWLEBdh
TmOJctXdeDUMTcnB/hbWWEiK9766KRpgwCK/YKYUU/aKZUMYgVfXQYYK16IoSP4P
uH0kGLZG13k6NX96m8oPM3X/c7S7syYmQhjQZE2M5FR+f4+jlM2rx3EpgWIqnuZu
hVl1FmYEv388E7ddgoeNfTDakBUGEf6/BmECQ98lM7cFHriKVKtqITR6mfllIfBX
1q+Tz7O+t+egxg7NqI9nl8zMu6pzdqNTaS8s32yJql22g1BfTjGqHfnD85/dItl/
TPf3LFwk3ux6QKF8j8gsUdiHzaZM8LDvzcke6qzFJcmvNvK9vEg=
=Obb2
-----END PGP SIGNATURE-----

--z5nK2sqbb5G99niy--

