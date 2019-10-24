Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 629F7E3B06
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394141AbfJXScF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:32:05 -0400
Received: from sauhun.de ([88.99.104.3]:43674 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726155AbfJXScE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 14:32:04 -0400
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
        by pokefinder.org (Postfix) with ESMTPSA id 1DAE32C04AE;
        Thu, 24 Oct 2019 20:32:03 +0200 (CEST)
Date:   Thu, 24 Oct 2019 20:32:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Comet Lake PCH-H
Message-ID: <20191024183202.GC1870@kunai>
References: <20191024105726.10802-1-jarkko.nikula@linux.intel.com>
 <20191024105726.10802-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <20191024105726.10802-2-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 01:57:26PM +0300, Jarkko Nikula wrote:
> Add support for another Intel Comet Lake variant.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x7iIACgkQFA3kzBSg
KbY9gw//U8PqApbaa6/zN+vsSG2QKUmPeciBHC+WbD95msUex4btgnlpC9zhJPG6
DQAlOxEldbVMPuxzJeBYxAOpQ9UAFOeWKKf/13zSe2YFAmxwNeSdjQh0Ewu2aiYU
6OwLlhRzxZasT0FOLgNj13c4opE1T2tHx66rCe4huKmcHrMsrxWA6JRPgi+FpOyW
9C1BuaeoHSxISV8DHQ5eV45u/4D8GcfWpPqSi3OWD859M72ApqjNAIE0AduzGVc7
JRJ1GTI9LzGzXolXDzSKuogdf+PM0me9cWT913iFSyOp3mr5x1rt65BACiwKxTx5
Df7AuXTbhmEMCRbZaBNJJmsowJGz4GtfJEiVkk+tcGV5O++diqqFHjwXWWGWXAq2
gnWn1x6+ZmYNLmk5WQ85ZOU8UIr3OAtkmEYQhBprOXS8CifyasImTPrsBY2ugycC
RmmnV9CP8mp8tvRZc2y8mXoPMf/Voy24YGjpePZ4cSysccgWamsvCnaZ33rqJl7E
WVo833+fQu45JukIl3PxgiGyOB9Onor8RCdT4tPSfdrNNyBQb4hHTHu6X+blXTcF
++PPwVK/tTHhT9Bl8OFcl5rWFni6r395jpZyDpRZ10hkXo00lPb+ROK97b57etwd
bE1iNJE9VPL7YE2ifXuEtzy3drwedigVmE2sqg/b1+agoMRu4pE=
=/b8F
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
