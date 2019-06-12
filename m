Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 379C842294
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732135AbfFLKe4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:34:56 -0400
Received: from sauhun.de ([88.99.104.3]:58298 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727795AbfFLKe4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:34:56 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id D42842C54BC;
        Wed, 12 Jun 2019 12:34:53 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:34:53 +0200
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
Message-ID: <20190612103453.ccet2pneairnlpcc@ninjato>
References: <20190610084213.1052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="o2p7l3jstr6cxok3"
Content-Disposition: inline
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o2p7l3jstr6cxok3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2019 at 09:42:06AM +0100, Lee Jones wrote:
> Add a match table to allow automatic probing of ACPI device
> QCOM0220.  Ignore clock attainment errors.  Set default clock
> frequency value.
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Sadly, there is no cover-letter describing if there is a dependency or
not. I assume there is, otherwise I would get the I2C patches only? But
what is the suggested way upstream then?

Also, the current maintainer entry for this driver looks like:

drivers/i2c/busses/i2c-qcom-geni.c:
        Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
        David Brown <david.brown@linaro.org> (maintainer:ARM/QUALCOMM SUPPO=
RT)
        Alok Chauhan <alokc@codeaurora.org> (supporter:QUALCOMM GENERIC INT=
ERFACE I2C DRIVER)

I didn't hear from those people yet, would be great to have their acks.


--o2p7l3jstr6cxok3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A1U0ACgkQFA3kzBSg
KbaoxBAAhggdoyYJ7Ory41uJZnpyS7E81TmUKsmVqsSij9MOr2pAO6ksoixVcsKJ
o+uoFROtUHSJfi/0ZzdMkt9qn50fRBn525tiT+IirJnXotAS8f9eTtzZwl14wBCS
+yVDItXLHA5jJqBwgGQeGAzn+/PuGOdp4NxsATnAOEh9QJyVjHppT7nUQGBv6yrH
qEgQCLKuywZbsg/GSwwyZ0TfWFbVgenGRiVCWyYNEMQeGntZWG9/JF6ad0C+x7+P
GYPM83p0krqDMIfWCh/P1M02Tu++P+IB68u4cHwZvDDpKFTqgthSENVPdZYJ4RB4
irJUfrFJPOV+JNit85YZfAqV8gkt4bPWXm6+h/sOD2LyK2P5A7+X9+l5pyb7EJl6
t6YPDfHl1Z7dP8rgKzbBkyhPS0KJS0XoC5JyPm7YsYWYywMAOIqd4GDP869ZQGD8
FTbgmw9hsU9KA+j78B7DmgasSRUutFQLoSAKZLK+HTXPg8Zsa/XWA4m6zN1xH1Dp
KEo+IF0ioEhbhSNqN8PzfKr1OJcaW07Fw61syO497VS5d2JXml4mseeUGRBSXOwG
hD4R3Jv30x/U9HzyYVmjV5qS+P9hIcwrIKKWNIND0+kXwGsWYBD/pl4BQZfcufA8
qvL2wQs5sTFynh8ZgAvv6vczs7Nlsb/08XrEJjRm8hYpXu+8s9U=
=xlPb
-----END PGP SIGNATURE-----

--o2p7l3jstr6cxok3--
