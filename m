Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F69B37BBB
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 20:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbfFFSBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 14:01:36 -0400
Received: from sauhun.de ([88.99.104.3]:36032 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbfFFSBg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jun 2019 14:01:36 -0400
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
        by pokefinder.org (Postfix) with ESMTPSA id 89B1D2C35BF;
        Thu,  6 Jun 2019 20:01:33 +0200 (CEST)
Date:   Thu, 6 Jun 2019 20:01:33 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>
Subject: Re: [PATCH v2 0/3] Add ST lsm6dso i3c support
Message-ID: <20190606180133.GB3782@kunai>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <20190606162522.GA3782@kunai>
 <13D59CF9CEBAF94592A12E8AE55501350AABE7B3@DE02WEMBXB.internal.synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <13D59CF9CEBAF94592A12E8AE55501350AABE7B3@DE02WEMBXB.internal.synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I think I2C ecosystem is also part interested in I3C due the=20
> compatibility and maybe they can provide some feedback.
> If you think differently, sorry I will remove I2C list next time.

No worries, but please do remove next time, for two reasons:

a) even for I2C clients, the i2c-list is usually not added if the client
   only uses standard I2C communication. If there is something which
   needw special attention, OK. But most of the time, the list is for the
   I2C core and bus master drivers, and not clients.

  (That might be different for I3C, though...)

b) if the patch in question is "self-contained" in the I3C world and not
   affecting I2C, I think there is no need to add I2C. Interested
   parties can subscribe to the I3C list.

Yes, that was a good occasion to write this publicly.

Thanks,

   Wolfram


--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz5VPgACgkQFA3kzBSg
Kbak4w//QNYKgfXtT0eQ+1cxXqpk+Kp3HUNCapn0Lm87sidQL1KJZp8EeQfv4RmG
PBFwx3+y2E5zSpOrlHAc5q2UYhIuQYaXNZjF4ZkHI//mhyuH8z9R/auU2Sc6Nqcb
F42untEqzImhr5wIDrnQSkQiDYT7ewJS03yXxHEGNS6GEmSEeJkRZ/KcbhoGoboo
mNYbJyY9EGfn14/TSoIaSu+cO4VivS0YXpVGr7KbIPViWCGBPexW5XafShvsWz4H
3w0KXk69/rdWAJkw+o+9nBgD8HX3EgEK6Xd3/c6t/BwcupEVC2k5yQHAPFZP0cw0
Lx1NAOdOBHjpY9wQKyDC3K7aClRhrkIvI4lFWlmEi7XZyBSH8MJwZ8sneNadlgsr
qFguhSJlULggJJuacbmWFnbrpB14TqqAkTYpLuBrtWbi/jr+xGoTft78lU5X3GjC
ZPdHvodYAKJxk6Unk6y/z6yZHX9B9ymvfl6STiImu01jpaFuC1mEbs4BVAHi9Nng
QDUcwoL/Fwa71jnJKXh24dqjh1xvYWSvE7HT0HdiwoWAx/m+5aAyHSkG8I4dX7zl
M6TNjN1Zvw43cbYQbzUEH/pTsRUdl3vb/R4MYIKOvbXFEjOHOqypuFxSKQ2nF2Uw
PHEDhX4gYl0t2tkquHWTA9nPxbDXIDVQXChux7VQdkja0+eBEfA=
=ZB1I
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
