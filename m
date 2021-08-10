Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28383E84E2
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 23:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhHJVBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 17:01:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:50540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231894AbhHJVBK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 17:01:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 302BF60724;
        Tue, 10 Aug 2021 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628629247;
        bh=FdKF9smxg3E0EXaS1euGXqveQmfFkFj6bAwW41jyB7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fn7i0KGIVCB3YraPlcYneUkXwWqtprEvKtloDXVOcsbGA3gNGWvP/EZ3uRwvFHeH0
         6Eew/a7jiA+nY6XDazIRXFC9TaCmFoNrbO0Q+0hetU3vM9ceIFZWNw1/wxkV6eEE+S
         GDNUWY8EvALgnPt4vgWvWs2ynrVFBHBPq25XRHiSpP5LNA4uQJwvSho1enV0Vih+7V
         HVb76wIOKHCJbkJpR8az7lV/F85yhBB9KQcZs9+DgyvMWk7dEa3n6hKy/L+PLMC3At
         w1zAfd9BRpbtB3EY52oYwPHIjIS2UgMmTBa53yXPU65kn/hrcUTp0l/sCDRNNAEffd
         hC/gKaDJ/1CDg==
Date:   Tue, 10 Aug 2021 23:00:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hu Haowen <src.res@email.cn>
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: i2c: add i2c-sysfs into index
Message-ID: <YRLo/PlLmFgW+Doh@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hu Haowen <src.res@email.cn>, linux-i2c@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210728155346.8941-1-src.res@email.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4VIhR7DobTcl6BkU"
Content-Disposition: inline
In-Reply-To: <20210728155346.8941-1-src.res@email.cn>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4VIhR7DobTcl6BkU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 11:53:46PM +0800, Hu Haowen wrote:
> Append i2c-sysfs to toctree in order to get rid of building warnings.
>=20
> Signed-off-by: Hu Haowen <src.res@email.cn>

Added Fixes-tag (please provide one next time) and applied to
for-current, thanks!


--4VIhR7DobTcl6BkU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES6PwACgkQFA3kzBSg
KbaO2xAAgFMpO9qWG4VvRHOpeBMwJ1r+lhgJhE3TBneQzbC4y8gYBaqBh/FGtK8r
VD0/PBdwm7BpXpx6zzm0HJIDwNHvB74rh9LV9lbqbzm+7fXYrxa9hB69Yex6kt7p
xGkZ4yw/j3KRkU0ThEXa6KS818Z5nXa9i6jrBKTZvy/MCqRylY2VEx4MBKgSJ0y3
R3cKNTMzI71lD+bWBQqO0pf1uurf426AXE+ARqpmbMdDoRYQDlLZD+ApFDHSmy4M
IEiCSuRC5vxvWzeJngMv658LhCQRQprbjzZFM2Oj+xcZfFTOb0tTfgEkr3GX5KCU
r3hSTfHTVDGaub6WE7JdlUQy6dViBkB3/1sMB3azUIKgEgSuO194Asg3SqmCZRs8
aCqys5MbxnfJ2BfeQRJKbN3W1q/wDFpO7UR/KYpugLnEW8Fe4lfM9OIf6uyEfmN1
yr6Ofq/XBepmF+f1Idb5mxvmegs2GTcYmCpnHBJ8DtALFQIKtk8JzBSSnr8GUVLV
opQ6aI39scoN5VBmHAwWXP5yjE+PB+136kacbGrA0g4pnqc+W2cWCGOjYJ+MDyb5
hpRhO4nPXtS0tNYuos6gqo/Af2KKnd8RyuYR0S+bAoZVY+C0pVwSn8SG9WlJ8bmC
qunAMm26LdtGqFhPLue7FMSeaWQxu7M6cY0VIEvbLhkOKW7I/Ec=
=ZhaI
-----END PGP SIGNATURE-----

--4VIhR7DobTcl6BkU--
