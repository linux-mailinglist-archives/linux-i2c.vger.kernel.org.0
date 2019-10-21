Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75657DEBEB
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 14:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbfJUMQc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 08:16:32 -0400
Received: from sauhun.de ([88.99.104.3]:46538 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727344AbfJUMQc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 08:16:32 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id 3DFD02C0076;
        Mon, 21 Oct 2019 14:16:30 +0200 (CEST)
Date:   Mon, 21 Oct 2019 14:16:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
Subject: Re: AST2600 i2c irq issue
Message-ID: <20191021121629.GE1145@ninjato>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>          spin_lock(&bus->lock);
>          irq_received =3D readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       if (!irq_received)
> +               return IRQ_NONE;
> +
>          /* Ack all interrupts except for Rx done */
>          writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>                 bus->base + ASPEED_I2C_INTR_STS_REG);
>=20
>=20
> I think it's a right fix for the issue. At least, we need to prevent
> any driver state corruption. The state machine would run correctly if
> we filtering the garbage interrupt out.

Just unlock the spinlock before you return...


--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2toZ0ACgkQFA3kzBSg
Kbb7Zw//a4Ol3fpjF5BX1DaosB2dPow2rLQgEcPnIiO04NZX0ELcrOuzdOSc4MH5
PidVa7mR1hz/HCeKFQIf69cBXsiRXkcE+SdJds33+tyHRy1Aff4/O6q8sgyRxooa
+ygrH6ulfaGW4ELzKsYpNNUH//SOuZnv2FpmITXVHMD8nW92qmcUGrvGzTTh2TX1
bcklAJy5jLxGE0RLI7L1l8D7jWotffAczJzeYRR1C0+g5guZz9kitAz0KFX5iFtp
Ogk8TbOBdFBZrgHsJtKfE1Iczayh/V/4GWYkKLKUmn7wXOUYvl6mudIbIN5No+VQ
zTOFcOVjxrW2rRNQ6bgn+LIkV+NtMmL3HY69RB4EgLOWBMe2Ir1lWQ1laQrVuvI6
7L9Zd3ruhU/qn4+pR7AworySRmI2yAG/et3FoW+LsIuqQWDK3Muuvin1Gqxxy1pj
b3+BWi7vnj3lw4NuzgMEqzzfVIgRFCvSj+pY8CL45H9YClw6iUieYab/iDSb4WD+
sH40YH7J4/UNKKXEBXoV81ZYsSrwDfGmOfSot/Ifb+BwirPmli/mFggtgBpMXibB
Ywx9YYkxpbN3OvwLOLxHxeJcAhyd88IT3NQtZtU4bVnE7pNE8oOFQ+6Gy96vmjmx
fL9qMB2pWA65usV4H5Cldha/mI9UWr9Zm0PB2HkiA9idEuxL5Hk=
=FyDm
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
