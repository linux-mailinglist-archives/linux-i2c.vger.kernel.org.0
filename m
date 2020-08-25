Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649DA251999
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 15:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgHYN2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 09:28:52 -0400
Received: from sauhun.de ([88.99.104.3]:47938 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbgHYN2v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 09:28:51 -0400
Received: from localhost (p54b33ab6.dip0.t-ipconnect.de [84.179.58.182])
        by pokefinder.org (Postfix) with ESMTPSA id 374132C04D5;
        Tue, 25 Aug 2020 15:28:47 +0200 (CEST)
Date:   Tue, 25 Aug 2020 15:28:46 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Phil Reid <preid@electromag.com.au>
Cc:     Codrin.Ciubotariu@microchip.com, kamel.bouhara@bootlin.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com,
        devicetree@vger.kernel.org, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/4] i2c: at91: implement i2c bus recovery
Message-ID: <20200825132846.GA1753@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Phil Reid <preid@electromag.com.au>,
        Codrin.Ciubotariu@microchip.com, kamel.bouhara@bootlin.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com,
        devicetree@vger.kernel.org, thomas.petazzoni@bootlin.com
References: <20191002144658.7718-1-kamel.bouhara@bootlin.com>
 <20191002144658.7718-3-kamel.bouhara@bootlin.com>
 <20191021202044.GB3607@kunai>
 <724d3470-0561-1b3f-c826-bc16c74a8c0a@bootlin.com>
 <1e70ae35-052b-67cc-27c4-1077c211efd0@microchip.com>
 <20191024150726.GA1120@kunai>
 <65d83bb0-9a0c-c6e2-1c58-cb421c69816c@electromag.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <65d83bb0-9a0c-c6e2-1c58-cb421c69816c@electromag.com.au>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Phil,

yes, this thread is old but a similar issue came up again...

On Fri, Oct 25, 2019 at 09:14:00AM +0800, Phil Reid wrote:

> >=20
> > > So at the beginning of a new transfer, we should check if SDA (or SCL=
?)
> > > is low and, if it's true, only then we should try recover the bus.
> >=20
> > Yes, this is the proper time to do it. Remember, I2C does not define a
> > timeout.
> >=20
>=20
> FYI: Just a single poll at the start of the transfer, for it being low, w=
ill cause problems with multi-master buses.
> Bus recovery should be attempted after a timeout when trying to communica=
te, even thou i2c doesn't define a timeout.
>=20
> I'm trying to fix the designware drivers handling of this at the moment.

I wonder what you ended up with? You are right, a single poll is not
enough. It only might be if one applies the new "single-master" binding
for a given bus. If that is not present, my best idea so far is to poll
SDA for the time defined in adapter->timeout and if it is all low, then
initiate a recovery.

All the best,

   Wolfram


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9FEg4ACgkQFA3kzBSg
KbZfXhAAgtg4dw1Y8ofe9LYQHp/xN3Z+LqaNGBmsKeC7XBv0/j/OuBqokWUtPeZ2
LKs9hWvaKCiIBNZH8LElTWFS9XSlmiLD7Stw8pUm5Gcav/Hf8FRB3WJ93QGNQcA4
/kQFrmO7Mxez+Yb3ndImfXQyexOJjzteaxVfbmVLIHC8V2L+LY+M7QiuzEG4vT9C
/KhzaKVmfGevX0HL0lZcShLCf5Nk8Na/hMfxxK1GisaMvEacilOQBqWyFq5Z9oQd
h7T0BKO0wn5Az3+lVVzI7qiCTQumy+9bhWJuSWXeVoxmCk2dklCFw/bUnjuVpzOk
agaRh4BiBmp/zxDVtmS8rihL6htu+2JlFrSPEk1Pl5pfgx5oE2D+cuwRRqkgZwgZ
EOe60+VfNVkQ5epcCBKRKNOqKnL8ZOG0Q0iVkuxqEVLCnhe4sM31nZ0Z8pioHb8P
K2Mgr7GvqZCWQLdCHBy16B6LmsIqjwn2BwYcTo9EAGTWbhej7fGoykcuPI4r5QSO
ivHhv8+sR795YmveXuV9OdXThHoZXVjhe2CQMxm8pQ17PW0M000X3j2FHj4qb5AL
UQJfYd8o4WHPyJ8VtvdiPbeIQVhhkIysIg5FGJXgydrsMt/CyCuj6epLPWPRm+TB
vtXTdWN2BLhXYFdxGtnkQdHZnqo58ZGxM3eDHPwywGsWpEr/wAc=
=3nwt
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
