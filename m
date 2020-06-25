Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A439A20A1B1
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 17:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405619AbgFYPRB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 11:17:01 -0400
Received: from sauhun.de ([88.99.104.3]:46564 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405309AbgFYPRB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jun 2020 11:17:01 -0400
Received: from localhost (p54b332a0.dip0.t-ipconnect.de [84.179.50.160])
        by pokefinder.org (Postfix) with ESMTPSA id 4CD6F2C20B1;
        Thu, 25 Jun 2020 17:16:59 +0200 (CEST)
Date:   Thu, 25 Jun 2020 17:16:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200625151658.GB1041@ninjato>
References: <20200618150532.2923-1-uli+renesas@fpond.eu>
 <CAMuHMdUE4v+8Dz+eowX5RNJuRGmXcFuYQCe7JQxrFXEQV3xKJA@mail.gmail.com>
 <20200625070636.GB970@ninjato>
 <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWM3VUNUY-r_4cJw8FNFHcfpjY=s=sj2CiC67FRmNkALA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

I spend some more thoughts on this.

> > > In general, pm_runtime_get_sync() is not safe to call from atomic
> > > context.
> > > For Renesas SoCs, I think both the power and clock domains are safe, as
> > > the respective drivers don't sleep.  The PM core might, though.
> >
> > Still, that sounds to me like we should protect these calls as in V1?

I still think we should guard these calls just because it is not safe to
call them from atomic contexts.

> And talk to the i2c controller while it is disabled?

Is there maybe some "always-on" property which we could add to the
respective IIC clock?

> That does seem to work on R-Car Gen2 (similar to SMP bringup accessing
> registers of a disabled WDT?), though.

Yes. Uli's patch will not cause a regression because we are already
calling i2c_transfer very late. And we do call the runtime_pm functions
currently. So, it will improve the situation there.

> Needs testing on R-Mobile A1....

That's armadillo, right? I don't have that, sadly.

Thanks,

   Wolfram


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl70v+YACgkQFA3kzBSg
KbZh3A//eIkvsDHPdTMkp5WPV3l20XlTCHjKQwV9mmmZwbF8bmBMu8a9gRCb/jnO
ULWvz6PlbJ7El6Y6err+s4UZ+bm9J7P4Iav/G5Fuy+HJRGwD2pyK4DrXkQVzg1o6
a06yugDvODpxh23BL/nFw3bImdTgORiqj3YD8j/w0FJK2fulWci3mp1xLE8cKTLV
dsWhlZ/a/5cnQjYhh6PrR23ZsvlYVVRo0HKYKzb2vuVGobh29FXLbjyKQKyViXJf
+9bsFNlJe76noK7daznQTWUcO7eZJV7976K1DDeEcf0x0LYPiLj9BUIbHvFj99Zc
wZth86j8B+7DLbGuIPneyJU2/9re27fYsiSUiEuhf+ViMNLV3SMUGpaZ0AmrNW8n
f+lEEvKl5wL3QoeL83jEnRtWseKSkWgnP9qxw03OLdd+MlPL8WZpvrBC64jF1+OO
kdGJK2ulvqcdPCjENPnFpWQLMtoEjbD/Cf25/xH4PL1/2P7q1dI1rnS8UuFt4RRm
AYrK6A0bCG938CS0I4VVP7aRxDp+zYUUoH12qUiBiGWHGa/0f0CmSg2jAXqawcMP
3Zpvm1/QUXql4vF3Zu5Dus8OUa5csAPjacWgvTNxPDYbQ255TuVjTO06YBdIOy6M
9MQZXk4AyQ2uJnN6bQttbJ2vFsRBx7AmtM5Ypk23I0Nc2cRGsMU=
=Y6XR
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
