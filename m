Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C198CB695
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 10:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfJDIn3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 04:43:29 -0400
Received: from sauhun.de ([88.99.104.3]:52636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfJDIn3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Oct 2019 04:43:29 -0400
Received: from localhost (p54B33499.dip0.t-ipconnect.de [84.179.52.153])
        by pokefinder.org (Postfix) with ESMTPSA id 180E32C05A3;
        Fri,  4 Oct 2019 10:43:27 +0200 (CEST)
Date:   Fri, 4 Oct 2019 10:43:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] eeprom: at24: Improve confusing log message
Message-ID: <20191004084326.GB1405@kunai>
References: <20191004103748.12076669@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20191004103748.12076669@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 10:37:48AM +0200, Jean Delvare wrote:
> Currently when binding to an spd EEPROM, the at24 drivers logs the
> following message:
>=20
> 256 byte spd EEPROM, read-only, 0 bytes/write
>=20
> The last part is confusing, as by definition you don't write to a
> read-only EEPROM, plus "0 bytes/write" makes no sense whatsoever.
>=20
> I propose to have a different message for read-only EEPROMs, which
> does not include this last part.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

I like it!

Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2XBioACgkQFA3kzBSg
Kbbrrg/9Fm1SCRAA0ibENwkD4hOUp2y4tPGzksiG/j2FKUJXAZfoP8dP/XLYqeGp
O6j0eh+emVUPlAk9bAwk8EgN2iIgjEDbYncFZiXRpFGFsHe+uzkKy10rBGcBuTY7
i3rgA1kuHDbzjx/nPHmr9N3+868TQJeKPRsLx9eLyJVDxzQjzWxEULpyDsSqbmP2
+6E4RJQOuVyvc3T15UmYxGpZxNMHQvYiSAzu8DnA4DsAnUVZgxRIIlsRu3482WBT
36bwA2ZWDva0mDXAscgazN0SKTYNpcziINwI0mO9cvUhheWHQXeOG1u+SBwR7BDk
Opftp8ZwT6IaSETDTQ47+iUU2N2gt3QHuorrT+ruD4gPVlVSsDICfm8jBOASJcv+
e80JrhrO2jfrZec/m5iABrbmoG5UkXhiCwmIU+7DX0U0Gxmyw2G0AB7mJ/TdFYIo
uO/yz4r9cldYyw9YpDMngYjr8JYJhejNq/DvuAaOJeRVay59U1LmsC2RvNLDZybD
/9Xw1K1QCaRTnIZuE96xPCcc7+MPck1PqGJdt68/0kPGHdBn/kkxK0z6OmKjmFqL
Vza7ZyOhcsTSNAMAmZAhXSIp0bzLSpMqXX38d5Sfh3FH9yDmL37FGVxWv9BHRgy1
jjT8bUiPcpCzDCnvTmzTrKdn58928Drve5Sw2AoMVbPUWk6z3Ns=
=bU1P
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
