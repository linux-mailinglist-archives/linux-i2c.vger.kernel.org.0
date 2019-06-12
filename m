Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE154422DC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfFLKpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:45:01 -0400
Received: from sauhun.de ([88.99.104.3]:58420 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727111AbfFLKpB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:45:01 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 974242C54BC;
        Wed, 12 Jun 2019 12:44:59 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:44:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] i2c: i2c-qcom-geni: Provide support for ACPI
Message-ID: <20190612104459.gvji3qxym5s4odfq@ninjato>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190612103453.ccet2pneairnlpcc@ninjato>
 <20190612104011.GA4660@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ozob5i4arnc7fie4"
Content-Disposition: inline
In-Reply-To: <20190612104011.GA4660@dell>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ozob5i4arnc7fie4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> There are no cross-subsystem build dependencies on any of these
> patches.  The only reason they are bundled together in the same
> patch-set is for cross-subsystem visibility and understanding.
>=20
> There is wide interest in these devices.

I see. That would have been a great cover-letter, Lee ;) Thanks for the
heads up!

>=20
> > Also, the current maintainer entry for this driver looks like:
> >=20
> > drivers/i2c/busses/i2c-qcom-geni.c:
> >         Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> >         David Brown <david.brown@linaro.org> (maintainer:ARM/QUALCOMM S=
UPPORT)
> >         Alok Chauhan <alokc@codeaurora.org> (supporter:QUALCOMM GENERIC=
 INTERFACE I2C DRIVER)
> >=20
> > I didn't hear from those people yet, would be great to have their acks.
>=20
> I will see if I can rouse them from their slumber.

Please do. If they are not to reach, we probably need to update the
entry...


--ozob5i4arnc7fie4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A16sACgkQFA3kzBSg
KbYxGA/9HiQnj0VnFh9GoFzMImS2pCdkGgsTJeZ+9OUV4xzVVVJ5IqvMsTVveAa2
G8UW1TqfWoeNwaAW5z1DITb/F2FOhx162e7Qce8C5xYNJfybOJYixAvlkyjVBi0H
fT4/ei14NJgNsy2cGs2UUSwKqwMmR7iom3DQQc3w6fMBiXciQGKNXJ7Gr1iatsg7
jbOMUZ+SzeSLsfQutWvNR8kiN0K0AEnj9f5Q2nxPtwoK0cSx6HxH7x3KA6QK4NlO
tOY4FrVg4yXCu2arTUcp+1PBo2E9svLocqZwyxa1bJyeIZYNMI9XJXoliMNdMsJF
spDGdaHB3OPG1ipES/W6559y9MCdebjqlnE2JiSGmhNlrU+TIgj4q862zHTL9wyN
Ugpc5IMvaVafCfUJTqLHF/lGKfs4J5d568psLyJamY9XqVWG1LY+s/RQtD1OMATU
dfDs2ONGEbVK8Okvpck8cgPn25bOn0R67Kn5K31PX6qUhlggxeGl5laOhhdzg1h5
80Or9O8URxb6SHStnsgy8uA9OF3gpfKnmE6PVXxfIShQiCz3UxC9l/j46zlObUPV
Z1XeHI2cT0cjSTfgclEyM0Q33DyECfH3uTPuc0erjqNj+qWVxV506GsAOmU09GEP
lXw8C3DCPAdqrxO/bcIi8xlY//b0s9uEHokcV5lutndaQFyj+oE=
=E6Gx
-----END PGP SIGNATURE-----

--ozob5i4arnc7fie4--
