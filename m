Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF29034189A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Mar 2021 10:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCSJlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Mar 2021 05:41:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229447AbhCSJkw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Mar 2021 05:40:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24AAC64F1C;
        Fri, 19 Mar 2021 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616146851;
        bh=+t8vPkSq5K1M4uYZCgDX1PyDYngFCmdFpvYLTGO0UV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mgMcOVvpwkZJpMf7eeFc75PxapvhBF+pev+0RhCnvzBKkn2g+kvAN683e5h7OY7vY
         0R/CqFqf5bMtHqNMqXGgQswlAt7yDpvwkIzJRrW+aXojzG1Gisw/KrfdcpLSfplfG8
         lGDPkbSjldHwG8kEoGxvFcp9rRbuI1ZN274lXvk2jEK/sJkH1yPkHRrq0v4i2Z2FA3
         6al9w5nxRbPIFvOYvQtnk1K0MoEQhw+DZZBOJB3QenpVzvmNBDwA0XApgmJMkoUg+x
         Iif9Z+xqia2O10cKeQQmY5/1Z8Lv+gNH6L2/aRRE/RJbNuXO9dj7LGTluTvsV78h6x
         VFwVveCuS6s2Q==
Date:   Fri, 19 Mar 2021 10:40:24 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux@rempel-privat.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Use devm_request_irq()
Message-ID: <20210319094024.GA1003@ninjato>
References: <1616146420-6468-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <1616146420-6468-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 05:33:40PM +0800, Tian Tao wrote:
> Use devm_request_irq() to get rid of manual unregistration.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Please don't send such patches unless you have a deep understanding of
the hardware. devm and interrupts are a dangerous combination because
you can get interrupts when the driver is gone already ( =3D=3D OOPS) if you
don't pay close attention.

For this reason, I won't take janitorial patches with regard to devm and
interrupts.


--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBUcYMACgkQFA3kzBSg
KbYDpA/+OKk/LVXAoO16xJ0ce0IepB6+ZwB0SEh9PnyNkBV3AxjbAh00WFcOnMil
B1AdSgZSF+a1Uvs8r/UT73aKtqonnkwTcXmUCi6p12gGHImSnvcu438X/Ko3jLqO
h4kkDlvcI/6gC5wlkcZV3v+GnkQH+Y8K+2O8Isc9Hybi365TGaMgMpBNTfItlCAz
4UcdR8MUWVf033zCKL45r6MNOvPecYioHpneOwRIrLm/YIr3cGzdf3AUXlHOOY3F
ImuGMAWhwcO0c+hdGzQ4LCySyaWlb+GYUZ0HqDQjw2Y1S6bGxDJvwUOiFjL164XO
XM5L0P5umDY50nfsBloOhi3Yeib65qbiqf5TA7AeNojaEf3ced2Hfig5vJdXhz6e
h9NFoiWdxYMfUUUySQIecGYY1108rZBZ8i1k9a01K1wdTcmAf9yhjf8Kr2g95ZKA
YKlEHSSnUl9eZhu47S9RjspJhAMrs1zhDVUjXw4A8WLqhjyP/25rPXydcMGxFvjA
mhLuYD0bBWdTzO3n5RQYz5//EhAT3CGPiFi7kMKNhrBnbsztx0Q2Oj+J2cqaCI/W
JZArQkqSLo0wgpczpSq3fPMmiNQCBHNUQ9GTVkM9y2KvB9IX8KF+AQ17fTY9rd3s
5bO6RmGybtG9UX63Ld/bn0GL6fPQZoc493A9mRpksisk/BNxsJ4=
=8GTT
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
