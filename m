Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A23D41202A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 18:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfEBQ3S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 12:29:18 -0400
Received: from sauhun.de ([88.99.104.3]:55620 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbfEBQ3R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 12:29:17 -0400
Received: from localhost (p5486CF77.dip0.t-ipconnect.de [84.134.207.119])
        by pokefinder.org (Postfix) with ESMTPSA id 2D3BF2CF690;
        Thu,  2 May 2019 18:29:15 +0200 (CEST)
Date:   Thu, 2 May 2019 18:29:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, skidnik <skidnik@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT] i2c: designware: ratelimit 'transfer when suspended'
 errors
Message-ID: <20190502162914.GA11535@kunai>
References: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20190424161632.4994-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 06:16:32PM +0200, Wolfram Sang wrote:
> There are two problems with dev_err() here. One: It is not ratelimited.
> Two: We don't see which driver tried to transfer something with a
> suspended adapter. Switch to dev_WARN_ONCE to fix both issues. Drawback
> is that we don't see if multiple drivers are trying to transfer while
> suspended. They need to be discovered one after the other now. This is
> better than a high CPU load because a really broken driver might try to
> resend endlessly.
>=20
> Link: https://bugs.archlinux.org/task/62391
> Fixes: 275154155538 ("i2c: designware: Do not allow i2c_dw_xfer() calls w=
hile suspended")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current-fixed, thanks!


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzLGtYACgkQFA3kzBSg
KbaSrg//dMkuxn7hTSFYPxUA/UxmqfAmhFcRp8ceOAhqiI7xvuPFlqridTi4jBN/
VI134YslZ/pArL8bi9xfdAfQS/YFQ11kx6TSHODXWI3FbKwOPaEPvcfrvDsXuDZL
kbOQKucHZuvGiCwpYj+q9VRxHMVWG9rkW6qNuSRG1k0t9JKMgDtpNdGqtklaejtB
XrlDd7SAhG8rzH6Da/DX8JDR09MVpBYd+6RwdDnZpnz7nb/kPurKbEjc7aATUoCk
w5gCi3IHLfCmP7z+4VNNNDixork0FqWuDlRTRQdAxUswBDvSZK9jSFVoAl7VmBqP
RNDBUaVvQzdWavWDcZo3af04m/AUU8k8Mft3w8Qgf2Bmm1r1NEwkAvsb9V/CfbfH
cvNaZB5uNVwXtL2QO55PeRtsga1q5ukl8VJZ4+TSGNvW0mVhE2nFQtzz25YM6Ajz
h79+sCn9M4WPRx4PAE1MhjaQ4ksiIMnFMX+0fmTaCDPfwuV1eUXqygqLKSGJO4J/
KMjFrKJ1vva8CqLXEAatgSBiqbMPQB3VzK1sq15GOekQKo1FhtV1NAKYgnRji4nd
cR+yQu9Vpa5tZox1mbv6JO7x6DtrvkrRA17NGsCu/Elr2xZnWOadB34SG7PiJnat
DtL2/4Ryff6p10dUmIjAjK0V6KlejhbZVfmu3CqihwqrsH7IwGg=
=YJdQ
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
