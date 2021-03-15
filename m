Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500DA33AF9E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 11:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhCOKKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 06:10:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhCOKK0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Mar 2021 06:10:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6867A64E99;
        Mon, 15 Mar 2021 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615803026;
        bh=yiD7LAsgvZAMSeKj5tHXSgb6cP+41vIVRvbaksxKyhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mf5MwuKNtJPpyrQ54S4ZnRtClTOOM9NgK7ZA11DNQsU0DWfVLEoxIziOZVi0LfIVw
         CNgZeyT4nDFYYXOSjJHYXXxyQkv1oWbCbWWs2E033DWUQLEG36+FQhiPzR7D2+xPW/
         MZ8iGQT+yhkopzobrcw5zIlTcHu8WuIeJ2wSWrNPzgkktjpQ0bCgO3i4+VzMU2ywz+
         llxi10N7OnUBOp2Vzz5KGx6O8ushOxMk4BcRXQuRNhpltj/Z777b9MgadhTGw04f7O
         YZiOaKxKJ8iwrh/rqhIB98UMgHmHYKu3u9B11gJxKw4I4Rwq3ME5znJ1mPu++KYzvV
         Gk+rzBzXGyo+w==
Date:   Mon, 15 Mar 2021 11:10:14 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Klaus Kudielka <klaus.kudielka@gmail.com>
Cc:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        linux-i2c@vger.kernel.org
Subject: Re: Linux 5.11: i2c: Confusing error message
Message-ID: <20210315101014.GA1182@ninjato>
References: <1787a9ee-efae-7e4b-9e6f-d4bf532c6b63@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <1787a9ee-efae-7e4b-9e6f-d4bf532c6b63@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Klaus,

On Mon, Mar 15, 2021 at 07:58:21AM +0100, Klaus Kudielka wrote:

Thanks for the report! I am CCing the I2C list, please add it next time,
too.

> Hello,
>=20
> I recently upgraded my Turris Omnia (Marvell Armada 385) to 5.11, and now
> get the following error message during boot:
>=20
> =C2=A0=C2=A0=C2=A0 i2c i2c-0: Not using recovery: no recover_bus() found
>=20
> As far as I understand the situation:
>=20
>  * After commit 9c7cae2427715502227f823364a6a77828fdf3ea mv64xxx-i2c
>    unconditionally sets bus_recovery_info and bus_recovery_info->pinctrl
>  * The i2c bus node in the turris-omnia DTS does *not* have a pinctrl
>    state "gpio" or "recovery" (like any other Marvell Armada board, AFAIC=
S)
>  * i2c_gpio_init_recovery() throws a debug message "no gpio or recovery
>    state found for GPIO recovery", which (under normal circumstances)
>    users won't see
>  * After i2c_gpio_init_recovery() returns, i2c_init_recovery() throws
>    above-mentioned error message
>=20
> Is this the intended behaviour?
> Personally, I believe an "error" message is quite strong for this common
> scenario, and a bit misleading.

You are right. The case that a pinctrl is provided but not the necessary
states for recovery has been overlooked so far.

I will think of something right now.

All the best,

   Wolfram


--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBPMoMACgkQFA3kzBSg
KbYSlg//WkBe0MF28rSdtnZeAtIquBEfkGsYLMvfeTIoNW/atlhQTuM6DmxsX/ws
Ekb/oO2bPsZmW6tkKWPNwfmo9fQbSpDsZ8OPNTAgviFAJf+BAbPgthzN7pCmycai
8o5gNpJyLTI2JrU02xv0DIV2kNHafDPeJBodCJC3TK2PS2mXrbqXOyxO9Br4eVwP
xpw62L9MXYsgQUN0szFViicv72tJyv2mjAJgy3eYewg1Xp64FbQgoHtGbI/N93pu
oOPYRV/XIhWY8gcrtt9e3hcJkK3eOBRxa5ZDlgQ97B9Gxty8j4nD7ab5AmJex0no
EPHbdVWt4obOhTQUZlbUYz3giT5B2FyUX7THyp/EyXqH1CseO2bKhXX8V9wIXc5W
0KJ2nrWe+jbfy6GH3LKAr4Wd7EARFzODVNIVrSUebXy9B3JLVoHVOq5QUUGhDlvG
iRw2PHk7E2KmejWi1HHqTc5hQawQt/iAPABVt5nm7zdenp0E3viZ78pkyOmkHs++
0khoegxjyamlV+zi6QOYVJkMxE6F2iBFcL5RdeGwmuHUmxmDIHwioesquWHPOLo+
djUzqbUfwbZSWkcK440XLrXeZ427nVpk18wo6Vr3R85yo156vb6QVrq8yzt2INNR
PvFVGjxohU85ZvCzTClwbbO8uSzsYU5cpC099oFQ7IMlrbqUg1A=
=sfIG
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
