Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569501B730A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 13:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgDXL1G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 07:27:06 -0400
Received: from sauhun.de ([88.99.104.3]:46698 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726582AbgDXL1G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 07:27:06 -0400
Received: from localhost (p5486CE62.dip0.t-ipconnect.de [84.134.206.98])
        by pokefinder.org (Postfix) with ESMTPSA id 6B1C22C1FE8;
        Fri, 24 Apr 2020 13:27:05 +0200 (CEST)
Date:   Fri, 24 Apr 2020 13:27:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patrick@stwcx.xyz, kernel@axis.com
Subject: Re: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
Message-ID: <20200424112705.GD1959@kunai>
References: <20200424090443.26316-1-bjorn.ardo@axis.com>
 <20200424111337.GC1959@kunai>
 <5038e4c1-440b-0a56-978b-a8c9fac061cc@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
In-Reply-To: <5038e4c1-440b-0a56-978b-a8c9fac061cc@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> As I can see in drivers/base/firmware_loader/main.c in function
> _request_firmware, then the fw will be released internally if it returns =
an
> error value.

Ouch, of course!

> > Also, do we need 'error' and 'ret'? Can't we reuse one of them?
>=20
> Yes, I can fix that.

Great, thanks!


--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6izQgACgkQFA3kzBSg
KbZ2ThAAhMsZ3tQuyAqOGMN9/wJ9va85sHDKjPkaNaXrPFpI3R2IVgdHPYS/5c6Z
y1hVZu7mL7tTXMjS9gnt0cDQhGJ2w2K6uMDo4JFx7LdaWE/wws0j81NhzVJCUcfi
RYt+8x5cNJYPi6u7HDtNZgiX1DGa2oZRodSvkbbd0uyxNiZXc4dKuenXY8trrN2E
YNMtXee5ChsDBZl0AhNOo+TASMUBepo7XAcPaigJiDol5nDYdSMvKu52g4ys7eZa
aEf9iFx5o6qbVRUGiUptv/5XjuN0mpK87vB9qJNNqWMp9ACheRAG87nEtRx0qp3P
YlY8uT7nx1cCpcqaICfDpHyWCp8+VvKWHFd+omKsQLx2fODjMO2otEPsqGEcMxwX
OKgPwrUlwnymlRFvIfmJ5b+JQsoXCIeCGqvo82RIa/4U9Xo/019n8dFnAj2VWqwV
fcrUERYQ4E0pGH6IIsXvZYTaPIFzhtPbIlBrt01SKIRLvZeOLzU0mnNmEfvU2iwC
YUVnnVgkp0ReGSsjsLE+27UN7JJN/9cXt3Ofy0FaJyPcHlU8gwLh/G6+rUXIfAO1
wUjuS0H5N3ef5NfLK67L9SO0jfrvlrxP8qIsR3VCOGD6gP57VgTQL/jLFi620OjP
/WBsufP+JjSGdOkO4BDMOu06cKDmExA9QaaWRkLR1Nqr4ilXIWg=
=kSjn
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
