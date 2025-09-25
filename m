Return-Path: <linux-i2c+bounces-13179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FABA16B4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3333A896F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8970831B81E;
	Thu, 25 Sep 2025 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SIVhPZZ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C8271A9A
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833270; cv=none; b=cn0wxU/231ZjmH2iH6lh4NxxeQETR+uJy+GJQ7iiJzjaumbztXPNPlSeZrsio6z58aq5flalUu2VcmevcYLZS3q6Vi2FFyPshYFusQSBTeO1NiuG7mFWI7aol0aVkoxpEGR+8x3iPFoMlADqVAeIRN5ObzfVK0xvoCn4w6bLfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833270; c=relaxed/simple;
	bh=Td5wedF/ko03/Ts2lHkLsgtAKs3yoinI+gY2GQFnCPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbumgCoS03ZL1mA6RI1CuCvNFOCiyle88O1dYwbkjklie2I1kWOI/zCpE8OpoHxs3+bQnN4tyQ4isDT10ueB7jTA8v1TaRPYZb1Xz9jVEa9IYL39keuCzoyR68OZwp2SMu4mJL1MtpDRND+OgwOlCF1OLnvk9SPyVRTPCwG8uV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SIVhPZZ7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2RoC
	f2Ey0TRUXVTwOhW29AJp0Btax7AGtGRse5ka/qw=; b=SIVhPZZ7alBNaqUCcNem
	lYSnwl3z6NP8ERiB6JcVSLFwUiDwEAu88HBuxVUtM5WmqL7PbI57rt+dSo08FG2M
	jUii6l0stYZFj3NMAY7oUATmzG7z7nzoy/TXKnLbcd5wEfuKx9/iKhWYT+avJRLg
	IlBCMiGVuhIcHzU/VxvXvnz/REEhIfT1sSM04TIROZuiErlWImr0+u2Sld1jp+PD
	RotomGmKUWGxpD8tUfd7+7U0N4ekQz8xIzBeZQEMEN9dEJv+7qOB1ASrsJYAhjFz
	eXkSLtOYRVu9BDWXv2I+WBwR1lhTWX2ef1S9++MDqtfcOvknXsEasRQkj9FhynZi
	oA==
Received: (qmail 2012128 invoked from network); 25 Sep 2025 22:47:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 22:47:45 +0200
X-UD-Smtp-Session: l3s3148p1@pfz+R6Y/aMEujntx
Date: Thu, 25 Sep 2025 22:47:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
Message-ID: <aNWqcYjCQ5SS6d_r@shikoro>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8/ZG0YvnSJZSUjJI"
Content-Disposition: inline
In-Reply-To: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>


--8/ZG0YvnSJZSUjJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 14, 2025 at 10:24:13PM +0200, Heiner Kallweit wrote:
> Annotate two places in boardinfo code:
> - __i2c_first_dynamic_bus_num is set in init phase. Annotate it as
>   __ro_after_init to prevent later changes.
> - i2c_register_board_info() is used in init phase only, so annotate it
>   as __init, allowing to free the memory after init phase.
>   This is safe, see comment: "done in board-specific init code near
>   arch_initcall() time"
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!

The other patch needs some more time to look at.


--8/ZG0YvnSJZSUjJI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVqnEACgkQFA3kzBSg
KbYyFxAAhHL18Wc4ONOYtwEDUSw1Pf3S1bo6q/joYqduoEswhT4DlBGGG0TrvkvM
lFdlL+3u5VtgfHkMyNP5xggmg0u8U/rok1MBYs6mVtJJsS+npFt60qs35VwvBpcz
f5xDE6CeYvMNXSRgkFSgzsnCD7SCfI1URFOkpouCToTWeA7D1OaEb12Oin8n/xLZ
8iWUK+Eyj0NloLkTNbephBGcF71hRL8A/uFzHbWE/681rTWS9cxDX7w7h+TQ6B6L
kynClUTwnyRE2W/wjYIjB9aAP0H/XNuLXVKZgJAEivJ+QU9UPC3J2CrZVETcN63D
FPvvQEHcSDdnw2VD4+g4RzwKFZCNcmVSEILMCblz/MixK14EM7AnAW9ujYv/WEP1
V3MZniPDnQsfyMQuGNlm2jlhGV7HXFeeVTDfeGMf2kWJKCYXUoB+6ow44Ja1zwKy
c1RZG/mSS1KGdKUpuujh4/q9aadNQyx2Gj8j+WeY1iVetVnP+fmzqBm00tKz7fxu
vs7xAw0+n5zygtBNkVF3v50+NDUQdPbtr2QrT/tzga3Ds6e6pXinFOeFkNdCykxj
mqe0GBQBbUuKZze8Sf7QKBkiWz1yBsHKp+kx0KpWkwnnF5XqbFo4BWTCywvr1QCv
cWjtZaNG0FkbpQPNiDzMMYfNR/kwIsZJstDwXWyONnirXenKvcg=
=3l6O
-----END PGP SIGNATURE-----

--8/ZG0YvnSJZSUjJI--

