Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC92F10906F
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 15:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfKYOxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 09:53:40 -0500
Received: from sauhun.de ([88.99.104.3]:55016 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728299AbfKYOxk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 09:53:40 -0500
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
        by pokefinder.org (Postfix) with ESMTPSA id CF02F2C0456;
        Mon, 25 Nov 2019 15:53:38 +0100 (CET)
Date:   Mon, 25 Nov 2019 15:53:38 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2] i2c: i801: Correct Intel Jasper Lake SOC naming
Message-ID: <20191125145338.GC2412@kunai>
References: <20191120151932.40269-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <20191120151932.40269-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 05:19:32PM +0200, Andy Shevchenko wrote:
> There is no suffix applied to Intel Jasper Lake SOC. Remove it
> from the comments and definitions. Besides that, it's a SOC,
> thus replace PCH with SOC where it appropriate.
>=20
> Fixes: e0c61c04791a ("i2c: i801: Add support for Intel Jasper Lake")
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next (i.e. 5.5.), thanks!


--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b6vIACgkQFA3kzBSg
Kba1Gg/+JkPMsgAelqVwPdIhAGEd/vvUdGXKaZ9Pv7k2T/RKKUH/WGXhwi8Qe/+G
UYLEtLKfXispHMyJScFezFVlXqk7iy1rEjZAfsos5H3lq0utTq2NG+J4X4VZxYi8
0SBqLaMSxGqVNVyaNARSz5lSnAeIGVLqRmeLl46p2s6zGStVR5U9KZRABRQdgk3j
ChpiKBvMqcmD0dpKeAceHaeACUXqjNHjrNCdoYGjlqLZVyxQ0oyNIDBD8SPjvHyJ
WxT2wynZREQaZwg247Izqi5ITfxB6fUvBz72bZqEKy3B/ZPyR1P1wyUnoCryqMZv
Ayvqvh3uIjA1KCFbplr7kpmCqrxyz/GCSwL7LM+q03OWquTcKDxc17/eOd3rvwHE
GH3URnPng8JNmsbJjIpIWjDT2YRwxSXKxc0pxlTrbIUJYSAD+t9aW1RcGLxXhnlv
2L9fpNnEV6g7ds7valgAxqCauNl52JuDNr4k+kPtUeAZYcrSx/Qi7pWzm4chzBpb
3FeEm6NnRtQnDw3bxwlP5KDstEwe6k0WqARoI78aCGBfLIaP5SA/7mSDNQXVg2do
wTjewZV4LCbO+EgtSGK9TG6WAFOo4wRITME9DUPQUsvzXsZZ2GWnskV5MWv1rXKo
iPucCyA9RYhVrfN4bNL5iN0KADBlMnTDdBLG+h33SpOjdRT3/I0=
=qvlQ
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
