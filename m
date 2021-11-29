Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D358A461443
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 12:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhK2L4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 06:56:41 -0500
Received: from sauhun.de ([88.99.104.3]:41190 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232592AbhK2Lyl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Nov 2021 06:54:41 -0500
Received: from localhost (p54b33788.dip0.t-ipconnect.de [84.179.55.136])
        by pokefinder.org (Postfix) with ESMTPSA id 3644C2C00AC;
        Mon, 29 Nov 2021 12:51:22 +0100 (CET)
Date:   Mon, 29 Nov 2021 12:51:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc:     linux-i2c@vger.kernel.org, Scott Wood <oss@buserror.net>
Subject: Re: [PATCHv2] i2c-mpc: Correct I2C reset procedure
Message-ID: <YaS+ueLqCADpvBHP@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Joakim Tjernlund <joakim.tjernlund@infinera.com>,
        linux-i2c@vger.kernel.org, Scott Wood <oss@buserror.net>
References: <20170511122033.22471-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vCQhYB1eIMPvaQgH"
Content-Disposition: inline
In-Reply-To: <20170511122033.22471-1-joakim.tjernlund@infinera.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vCQhYB1eIMPvaQgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2017 at 02:20:33PM +0200, Joakim Tjernlund wrote:
> Current I2C reset procedure is broken in two ways:
> 1) It only generate 1 START instead of 9 STARTs and STOP.
> 2) It leaves the bus Busy so every I2C xfer after the first
>    fixup calls the reset routine again, for every xfer there after.
>=20
> This fixes both errors.
>=20
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Acked-by: Scott Wood <oss@buserror.net>

Okay, I admit it is strange to apply a patch after 4 years, but I am
doing a bus_recovery overhaul right now and Joakim mentioned a few
times, he is still using this patch.

I still do wonder why the generic bus recovery algorithm can't be used.
It has been updated quite a bit and at least sends STOPs after each
pulse (as a result of an earlier discussion about this patch). But a
conversion to generic bus recovery wasn't happening, so apply a) what
users need and b) document what worked for them. Maybe the conversion
will happen somewhen and/or the algorithm here might improve the generic
one. We will see.

That all being said:

Applied to for-next, thanks!


--vCQhYB1eIMPvaQgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkvrYACgkQFA3kzBSg
KbYb9xAAhTTbkQ2V0Rc9H8p5oNL+Tlpj4w3vTKUrGPddq1G15Qq2cVfqG3MoYEIE
dofXoRkQ55ICtCfrozvYdzMnQeJ1M96zDHpBf4Rqgxr/zMIkOk2TiCu9pjFdYzcg
EG3cSoOqwpkFGPnx+xHZxMM5LO+VrBqUzrWUcybmyY+Tq7ej0dR7eglDMrHj8UZD
PMDudtQBMce1mnzYZjF1Map1BDpYKY0F91K+wTaDT71dd+7CW2p1U+1bAIs74VKV
vmfGnapXa8hOFotbUSVsVpPtKlld06xY9Z7H8ounLvBTucAUTrLYyQwtP+CJ+hrM
i7RHea6STuWsj6F5/+dTs2vzqiFnAh0+mRMlChNXQD0JZqHPncsf6sFi6YrdJyoE
QO6V6LpmDvzPn7MvaqvGTUEURRjpw+Ril9AcYoOx0Vwi6c0nEO632TQUZlgc8SZz
w5htYHJdlQRgEAfGJJysH8NfZm8uyXtFa7jGxTzuUQuUCI9BgaLfP5xoEn7FmQRn
IqyGMzdUkE+mn2LOXVXI2U8/PokfawFi+3tAjLkdtm7Clwi2O8YS6pYOENIyftAA
4Hc10AKni+Mcy0blGUjVmSBfZ6ed5LYm1CBXJIE01ior5JXWti47B9c7Ysx1GG2u
5fcYgfAygvqlyfFYORLJteki88Dylh3d7FIuOD5gzloJl0Yxj6U=
=QeKx
-----END PGP SIGNATURE-----

--vCQhYB1eIMPvaQgH--
