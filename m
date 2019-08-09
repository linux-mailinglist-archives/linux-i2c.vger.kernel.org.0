Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADB3087810
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 13:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406318AbfHILDN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 07:03:13 -0400
Received: from sauhun.de ([88.99.104.3]:36414 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406247AbfHILDN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 07:03:13 -0400
Received: from localhost (p54B333D4.dip0.t-ipconnect.de [84.179.51.212])
        by pokefinder.org (Postfix) with ESMTPSA id 762D72C3014;
        Fri,  9 Aug 2019 13:03:11 +0200 (CEST)
Date:   Fri, 9 Aug 2019 13:03:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Subject: Please check your unreg_slave() callbacks!
Message-ID: <20190809110305.GA1143@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Krzysztof Adamski kindly made me aware of a race condition that most
'unreg_slave' callbacks have. Quote:

"BTW, I have added this synchronize_irq() in unreg_slave callback just to
make sure it is save to set idev->slave to NULL already. Most of the
controllers do not have such a guard and I'm wondering why that wouldn't
be a problem for them. Like the i2c-rcar.c - isn't there a small race
condition if some slave interrupt triggers just before ICSIER is cleared
and somehow does not finish before priv->slave is set to NULL? This is
the situation I was afraid of and tried to solve by using this
synchronize_irq()."

I have fixed the rcar and emev2 drivers now. From a glimpse, the at91,
designware, iproc, and stm32f7 are likely affected, too. Please check if
that is the case and if you also need 'synchronize_irq' or spinlocks to
protect the pointer to the slave. Let's hope I managed to get all
relevat people to CC.

Thanks and kind regards,

   Wolfram


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1NUuQACgkQFA3kzBSg
Kbab9A//YdhgFHQbudYZcouOkvErSwljt50wz5Oqsljvt65dXmtem01zWAnij6i9
hAZvhp7ZRimT2hMMuKu3AS+HRzD1ptp2YMn0gTifMC5+HdiUMlYRJH8YUKvW2zUQ
I/b2kskywe36Bzs5QKTqVa85y2j2fQSxUfsSdSzne4kUCTHtkcT+aaZmB7q1q5xu
sqddaf1mG6tjptaHeI4ONoI7SjDbKT1yiOAvtb1y+gmyHwdHHwuIPVsgV79a5cMO
MuAKEeOp2YTc+2FKCjqiDvuJEKou1qaI1MnJUZjmnDasZmEiefPlAsf+tF8zoHl3
yotfVwBBtGDWLd0nIj+6QVCAdYJQzDihk4LP+J1uTw7dTDXJb2g6RIizUK2NFHHD
HYPV43TxZvZW0LVBKSCBy0lRsjlzwMyhRWAPm9mU/JVojPR4ksF/OkEVvLSVQ6X5
qy+V4yssgIiuT7gsBbrwHPsZ0p33Zn9XsAvGRmHAmVe2cIWe9V2c7qwGCVpZkWi1
0//oVD94WaYlzpJ7CeC6ZgjJWDhkuPZ30xkWLnisUhBGdsQkYdqasCtGFvpaZj/V
viiK5VCl6GrYwhS6D3+UHC53PhIv9GtmyC25IGEuRHuRkRk081Z7h+Ay2T6jcLd4
OB4ue2xbI2GpJER09hhPrding+s8D2emSNLLnWxCbWp4enBzUDw=
=OLk+
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
