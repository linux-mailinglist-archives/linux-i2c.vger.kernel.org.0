Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDC21D17D4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 16:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388857AbgEMOm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 10:42:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388777AbgEMOm5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 May 2020 10:42:57 -0400
Received: from localhost (p5486CF35.dip0.t-ipconnect.de [84.134.207.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D094A207D5;
        Wed, 13 May 2020 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589380977;
        bh=zHZKVOQrw4iw1BYZotmmbCpHSm3rHNSI8b2j1BlvFYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mvXJRT2oJSavng4jGGwzEFhHegydiclz8aPDt0QP1O1szj+96SM3Yk7nkkc8UZfYj
         XXLax2E1kLirXPhiZwHSP8AQ1KkAhN0sygzJqxmioG4IGUY7q2t/sKRd37eAtrRVcW
         HrdeG5laMpYZK9LOfM+nI0xX5K/T0d8jO+TIj6wE=
Date:   Wed, 13 May 2020 16:42:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH] i2c: pxa: implement generic i2c bus recovery
Message-ID: <20200513144254.GA7446@ninjato>
References: <E1jYnlI-0002Nw-83@rmk-PC.armlinux.org.uk>
 <20200513131843.GB499265@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20200513131843.GB499265@lunn.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 03:18:43PM +0200, Andrew Lunn wrote:
> On Wed, May 13, 2020 at 10:33:12AM +0100, Russell King wrote:
> > Implement generic GPIO-based I2C bus recovery for the PXA I2C driver.
>=20
> Hi Russell
>=20
> I assume this is going to be merged via i2c? So Wolfram Sang?  He is
> not on To: or Cc:

But I read the i2c list :) I know some maintainers request CC, but I am
fine as long as it is on the list.


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl68B2oACgkQFA3kzBSg
KbYAhg/+KOJpSs2n9SV0i9OsvjhuoQNKYIuQKFbNAyoFkDrIOxv473cx4JA89DeF
FdwdSA5p0K3hqzXyb2Mp+NFTHW6BdHrkEROUbJnR5GkAdWW/lT7qjfrfRDaMvO71
BGMn7mRwVb1eU0bzIsxZjMEQ7rDxREMn9FLmwfvlvE9CJ3tZkp0PU5vYQ7oR6481
+Syn6EusLFjH4Jb3HJdNI+6HVSe9wPSCul8E8vWgj9n9dXr78WMtAnKzpm+x1RZy
gfaNVDQtMtWCX3wcdQCGegBumZ9H2CUJ56CIERdn3p4BmCUJX1sm5M+ZprhfLdeI
9JHZIYi5rxLnbe737mntlHQ/BcJgkTRQgldPre9IE91a98QV/UL5v+4YXSGTa9TK
+BDs0oQFin7ZrOkq5330SsdPzs5CVDoYsjD2VYmy8k7DTLU2ArYmkusBTiRKwBnB
SKFas7O+LVNEQyX+qJ+rmf2nqZGDBXKui02t7BQm+UoGq59Qw2PSVh9C2jinaRh3
1auy5B1LN2pUXpiQnliwllO63bE+yVBBey3vPx/AkXh+Fu+a25h+N7F2lItIeWMo
94/PHne8JInu29fkK/lKYDo71T8XpDIVEEqLG9iNAbTzInbXMB3CCDvoqj3IjhFa
Uki43KWsNZ0RkqhCWGG0XZf1r6rhtbyXJIET6VwIXDeFYE1fjJU=
=SnWv
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
