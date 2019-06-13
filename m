Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADBCD43E41
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388431AbfFMPs2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:48:28 -0400
Received: from sauhun.de ([88.99.104.3]:38560 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731731AbfFMJT3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jun 2019 05:19:29 -0400
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
        by pokefinder.org (Postfix) with ESMTPSA id 7A4352C3559;
        Thu, 13 Jun 2019 11:19:26 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:19:26 +0200
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
Message-ID: <20190613091926.GB952@kunai>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190612103453.ccet2pneairnlpcc@ninjato>
 <20190612104011.GA4660@dell>
 <20190612104459.gvji3qxym5s4odfq@ninjato>
 <20190613085204.GF4660@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20190613085204.GF4660@dell>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I contacted both of them.
>=20
>  Andy doesn't touch anything that isn't QUP based (8994 and older).
>=20
>  David doesn't deal with MSM platforms if Andy is available.=20

That's good to know, thanks!

> So I guess the decision is yours.  Seeing at this patch is pretty
> trivial and has our ACPI expert's Ack, the decision shouldn't be a
> difficult one.

No worries, the patch will be applied. I just wanted to check if the
listed maintainers are still there. Otherwise I need to orphan this
driver.


--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0CFRkACgkQFA3kzBSg
KbaquBAArPmt8Fz3DGFNlnfxI6ee/fBc4huwdqsLrUXhirCq2NxTHi0g8mc1Y4O5
js7pOOLQSqZ6cTamIqHGv7wNonZ16xhvJPexVAz8CPT9BOysmHI/Z1eBEorBqOh8
MXkJGWXCSJ8li3yAdDLcQWKyj42zzEV7YJ/7kzEVpodSec/ufP1l34mxPNY+gVkj
b2YAX41oX7KMQ+ix+O9dK1U/wja5costVyUNXxjLuzZBTooVShj7dnrcLuROw1ss
I3V09OpXN7E8tF4Tq52gJ3xH1wJslMsi2GGGBFC4kKC3txfO04cuOZsLmf36Jomd
hBFUBBQotylM32w5lshWXcPQOUWBsKlDtfK5qyAhKIeBEvs08pbqK1Lw8hFT8T7t
6kD5Ty0cRPx5yBU0DE46FWuR60RYUqfq+bLYy4Y1O5lyCY2IdM46SMuFo6pp96lq
GQReaFopNp4SCpNPNJCDFtoHegeEoT5JKrcjLHRV9Zg2+p4mNL2O7Epkvi+4JvzV
p1gVvtL0/x5wVD8QWtXq8a7/IQ5oYUaULExw+WzhWD+VV4c/4JyyMNtGpCmnXCAr
EXj+7drBHheZN7nmmrer+sEuAySjTlhhHtFvb2K735P06Etqu5YWAtm88j7FcZUU
SaCzuSKqPQgU401V3+k5aexWOMCEN1DehlbyL+n7nQazEovGM24=
=dLE0
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
