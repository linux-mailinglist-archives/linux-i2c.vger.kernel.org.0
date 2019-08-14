Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 249F88D219
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 13:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfHNL01 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 07:26:27 -0400
Received: from sauhun.de ([88.99.104.3]:47714 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfHNL01 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 07:26:27 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 4E02E2C311C;
        Wed, 14 Aug 2019 13:26:25 +0200 (CEST)
Date:   Wed, 14 Aug 2019 13:26:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Subject: Re: Please check your unreg_slave() callbacks!
Message-ID: <20190814112624.GA9343@ninjato>
References: <20190809110305.GA1143@ninjato>
 <20190812110301.GD30120@smile.fi.intel.com>
 <20190812143842.GA5804@kunai>
 <20190812154949.GO30120@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
In-Reply-To: <20190812154949.GO30120@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> > > I'm wondering if synchronize_irq() is enough. The free_irq() theoreti=
cally is
> > > the best option, though I dunno which one suits in which cases better.
> >=20
> > In which scenario do you think synchronize_irq() is not enough?
>=20
> I think if the driver is using tasklets this is not enough. However, I mi=
ght
> miss the context in i2c case.

Do you mean 'threaded irqs' here? If so, synchronize_irq() should be
safe because synchronize_hardirq() is the function for not waiting for
threaded handlers.

If you mean something else, currently no I2C bus master driver is using
a separate tasklet, so I'd think synchronize_irq() is a sufficient
choice?

But still open for criticism. I want the best solution!

Kind regards,

   Wolfram


--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1T79wACgkQFA3kzBSg
Kba6jg//f2Ikqjw5P82bJWUQXcFNJmPT1jRKQGNwh1OgIG2V409JLG0Q1+p4aaTH
SoOpZU9Zbc15Axn9y7knuCOLvFpJ6LNszOpqM7orS2uRkM/B5L2/Za29W8LKzi31
cs+qNlQTjrjBCm7axvcDImhp8Je8HIIrNCrjAlX161vRGdkZHcVVFnmHLVEocVBe
2cR7AM8RmB0ARMcTfwwKZHll+xUDA9OH8NlcVWh2EDSiNTRD7qOTqI6ONX3FnVgk
eyTMuTEmnmX5dmters1tU/mxrnzC8Is4l6lJI/G8xBQkjfCPNkcw7wG0WwN2iaRM
ErCpnGhQmnROXqapTTaqbAQ0QqwIDvHu+pGK0QI+1RSqDSS57AwXE4Aulq4Iq7V/
opKuGmBLJU152v82LzfIfIsg5DS+pdTEY6BdS5YGXXuJUjAkkJ0lJRqmoEAoNrd+
Cs39Bd2MtH1zJq1/GYrppT2AX38bkjH7TvVxw3NI/j+NGZBinzeYEio15dXhlPQR
rd5aP7ysPTxQDOV0pwzFWyFVjhLD/lHWv7OWB9nqVNulrK6NkCgOc8zShloQEtFi
V3vznq+3sC0T5MT+PKcVO2C7NWqxKOL0MN9YJGR+2DZUzNobhXHTyMneN5RpVCyZ
umgc5GI5M4xcU35JxmP635xLZZIhSiXbvSt95NKFL0wIV6GjwtQ=
=tUhP
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
