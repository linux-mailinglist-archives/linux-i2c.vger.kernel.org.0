Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED652A9793
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgKFO1j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:27:39 -0500
Received: from sauhun.de ([88.99.104.3]:45396 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbgKFO1i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:27:38 -0500
Received: from localhost (p54b33740.dip0.t-ipconnect.de [84.179.55.64])
        by pokefinder.org (Postfix) with ESMTPSA id 4243E2C056C;
        Fri,  6 Nov 2020 15:27:36 +0100 (CET)
Date:   Fri, 6 Nov 2020 15:27:25 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
Message-ID: <20201106142725.GA1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200928155950.1185-1-uli+renesas@fpond.eu>
 <20201008094807.GA76290@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
In-Reply-To: <20201008094807.GA76290@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 11:48:07AM +0200, Wolfram Sang wrote:
> On Mon, Sep 28, 2020 at 05:59:50PM +0200, Ulrich Hecht wrote:
> > Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> > similar boards.
> >=20
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Fixed the blank line issues and applied to for-next, thanks!

Sorry, I did something wrong somewhere so this was not in my pull
requests during the merge window. I'll put it back into for-current now.


--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lXUkACgkQFA3kzBSg
KbZ56w//RSJoC0CO6aJkhFIuo0MP9YGo1p+5DHheXI2VH3LZ+icFCzL09ZhUwmcy
wBBl2pjyofmPHhIO2QqsSK++QPGAHF83t3bdhHxrDEhTaxTWnSyrnohWXpArkynd
BToY8ikCgb7OM6a+GnZ0yAECuahRhbdugVI9AXgTDmJHfqqot42ISI5MsJyaDvIh
VQeMJ74NZnfxlwODwB3vguriHkKOfrCysCqPL9xOjP7EAJwXW8CH5LlFwiwik+Vn
FKj+1qA+uabfl9GlTj+oDu59+MkW3w7xBJ6iG+DqwBXraQ0/aEdnT1Es739jMAmj
WJmhlhID7woCrw7jtrvtEdh6ou0eUjbHcxaUpJLy4yJJpttccW9VG5BcHltI92ax
L9UYOZgBJWknPrhuw2nOhb6xN9poiqFr3K2BgN76xlBB6EKo4566ycZPCFIsZF5C
fUizAb8EBowO2sk5Np3sahKefYaVTKpF2pysfauY11c0Y3Fg5/NxvU/J9Gh0/xnq
VEBfCl9OyJVfusVr/Lsr0P0rYDSpzfoFwCrcDqkivl3Hkdrz8z7jKmqYNr9hMHVp
01O7DUf/jovuDxy5sXN6KVCLEqkCSr7aWrGF7lENtDXahHSq7E/fyhnlEtoOucKF
FY2WkUNvpMQw6OugD+jBkhhG/GBEkeTT/LcHuKsggjwzNKFH3mg=
=LoPF
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
