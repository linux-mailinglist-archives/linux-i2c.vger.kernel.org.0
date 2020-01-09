Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 809CB136267
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 22:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgAIVYQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 16:24:16 -0500
Received: from sauhun.de ([88.99.104.3]:51122 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgAIVYQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 16:24:16 -0500
Received: from localhost (p5486CF60.dip0.t-ipconnect.de [84.134.207.96])
        by pokefinder.org (Postfix) with ESMTPSA id 7E1C92C06D1;
        Thu,  9 Jan 2020 22:24:13 +0100 (CET)
Date:   Thu, 9 Jan 2020 22:24:10 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: fix bus recovery stop mode timing
Message-ID: <20200109212410.GA3046@ninjato>
References: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 04:39:05PM +0000, Russell King wrote:
> The I2C specification states that tsu:sto for standard mode timing must
> be at minimum 4us. Pictographically, this is:
>=20
> SCL: ____/~~~~~~~~~
> SDA: _________/~~~~
>        ->|    |<- 4us minimum
>=20
> We are currently waiting 2.5us between asserting SCL and SDA, which is
> in violation of the standard. Adjust the timings to ensure that we meet
> what is stipulated as the minimum timings to ensure that all devices
> correctly interpret the STOP bus transition.
>=20
> This is more important than trying to generate a square wave with even
> duty cycle.
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to for-current with the comment kept, thanks!


--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4XmfYACgkQFA3kzBSg
KbZCWA//bbVEZrZyWmBKl4Le2HlH3oHezn7AFjfsgO7wJlpaN4ZuMn0B2i9zpCqr
/+swwgKTgBAZagyrdP6rfbsOPUmO6Po16j4cknTp+GCqcB5ftcJxW+mn94rVnWLz
n3KpQjqNJtUUlFUMkFI3NXD1iqwHMgfjGFWphELkwt0wgLYik/3A2zBxursHcFsm
gNpIB2iCxVv8556nVlGs8vD/HOKjUsmIWwN7UrqNYwt0AVi1eZkUufFmcz1uHBOT
gOHMIGflG/cl/l2u5gDTP9NDBN+NLpdpXeGuf8i+XMC93kTrmr95f0WyA4p/AQ13
krxnGOg5B7G6ujM0mwXXSj6W7FIQVIkE/VFms50p+iyvGCsCbjmds9vaKv6BxPpj
RlMPCLCPTfI7xBjGtQ5YSWqC07fcqVAkHBAYMvcJ/L5eYjfMLMEhAwY7ku9vHEiW
0TOxBILsj6wVW81GMb7KvUS55AOwXJSYy/bDQs6eMBLzPNtj0gby54XWwTiqdIS3
7GmK457oX/CMRZdJbOxDOBfGlJXtsSC3tFE/TrEUPSl23K0KzkrrW3N26nmy5+lt
CLy5c27Po5ZklQkx/R0juG2jwrXqcRtUDZRhtIF9QrPO8x9VlcM4qCLggxh7le8G
AniEtYpA5IMCMcwGjjw8BR7ECO2idWYdtNrsi3vT6EjltAlSD6I=
=tgSC
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
