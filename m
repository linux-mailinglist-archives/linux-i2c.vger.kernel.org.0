Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9669EA27D5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfH2UVE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:21:04 -0400
Received: from sauhun.de ([88.99.104.3]:43256 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbfH2UVE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:21:04 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 841632C0021;
        Thu, 29 Aug 2019 22:21:02 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:21:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Andrew Cooks <acooks@rationali.st>,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 3/3] i2c: piix4: Add ACPI support
Message-ID: <20190829202102.GS3740@ninjato>
References: <20190802145109.38dd4045@endymion>
 <20190802145526.6edba0a6@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UFRfxei4j9xfgtfb"
Content-Disposition: inline
In-Reply-To: <20190802145526.6edba0a6@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UFRfxei4j9xfgtfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 02:55:26PM +0200, Jean Delvare wrote:
> Enable the i2c-piix4 SMBus controller driver to enumerate I2C slave
> devices using ACPI. It builds on the related I2C mux device work
> in commit 8eb5c87a92c0 ("i2c: add ACPI support for I2C mux ports")
>=20
> In the i2c-piix4 driver the adapters are enumerated as:
>  Main SMBus adapter Port 0, Port 2, ..., aux port (i.e., ASF adapter)
>=20
> However, in the AMD BKDG documentation[1], the implied order of ports is:
>  Main SMBus adapter Port 0, ASF adapter, Port 2, Port 3, ...
>=20
> This ordering difference is unfortunate. We assume that ACPI
> developers will use the AMD documentation ordering, so we have to
> pass an extra parameter to piix4_add_adapter().
>=20
> [1] 52740 BIOS and Kernel Developer's Guide (BKDG) for AMD Family 16h
> Models 30h-3Fh Processors
>=20
> Based on earlier work by Andrew Cooks.
>=20
> Reported-by: Andrew Cooks <andrew.cooks@opengear.com>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--UFRfxei4j9xfgtfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oM64ACgkQFA3kzBSg
KbaMRg/+OOl8TdOzxtR2FewvdqEPOl2p/SvaK9SEFqYndD4QYq2+gIOG3ROK4ovQ
P19jHsbob6OQm8BrSEO3wFNq1kqQRRNKev7235NGeK5pYbj5trTdKIUmGbysxFwO
oHwEdxsuX76ofm26XU/mlAuxfUWLPbK9u9ASJdUNMU+gcG0UHlAWwvaanBeGoUGR
icOaIe5DC475rZh6tDyGvYJGFx0De9NQm/TtNAdGzvZTamK/K04q0viqoaBtRcjA
fvG7uBT/eaTa2bHwK7RzvcKCXUL8HfgyHJ0eQemaa5KeKsJ4AlXjgFdl55cipQlM
gai3FXMFrp9Dme5XhxWFDibjvq57I4Mb45xYfOq9r0xtIKuSlHicRQVnvM7njc8E
aTy5aRrPw7a5K5sSxz6DBMf8MThWuX5TLEwsYJPLjYCgC/0Ek7Kg9USqU8oAWZPr
0LiNvJ/Z46RXyqkrSBrmEzwKtdZ5/CX+T6HailqLhNbACgUuMafKCTAW6FZYqIaU
cSiXwqlvjEk2pSoy9l9FThZVSBGE194hhol4HH4Dajzz9NWMiP4IPOylm0o1Ssgh
8d5HHCNT5+8keWqaiWLGhUkO+0Oe+DMwtdsyJTLIMlQ8jTqUHt5h3+cOK2x0E1mN
3G4szoUEaR6DnQ2T2juQicbquyiqAK4AxXjCqT6tOigP2nBgjR4=
=mybI
-----END PGP SIGNATURE-----

--UFRfxei4j9xfgtfb--
