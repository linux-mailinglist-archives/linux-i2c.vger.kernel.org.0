Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05E113CDE6
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 21:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgAOUOi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 15:14:38 -0500
Received: from sauhun.de ([88.99.104.3]:41330 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729026AbgAOUOh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 15:14:37 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 3A2AA2C39C2;
        Wed, 15 Jan 2020 21:14:36 +0100 (CET)
Date:   Wed, 15 Jan 2020 21:14:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v2 3/3] i2c: xiic: Fix the clocking across bind unbind
Message-ID: <20200115201435.GI23789@ninjato>
References: <d328af197cc5fec64d203fa45b768571f28a54b2.1578569758.git.shubhrajyoti.datta@xilinx.com>
 <176b8f623a2994019d775dfb5dbb2bdcc3852069.1578569758.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mXDO3udm/xYWQeMQ"
Content-Disposition: inline
In-Reply-To: <176b8f623a2994019d775dfb5dbb2bdcc3852069.1578569758.git.shubhrajyoti.datta@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mXDO3udm/xYWQeMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 05:08:00PM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> The recommendation is that the set_active should be done
> with pm runtime disabled.
> Also fix the remove path for clocking.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Applied to for-next, thanks!


--mXDO3udm/xYWQeMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fcqsACgkQFA3kzBSg
KbZaWA/9HCviA3N6EK+lNHf93b3HeNLIg+moM/fsDTk0mGilWAwjcW+mWNSAl00Z
ZHdm8IE4l4SVyhbe2dDITTxWgGERWuY2xXe741PMl3D6gmQjXF2x3e/2VvJhF4yx
s1iXLQkNRb2acYd9ZGxjFB48GDkdZqpmSFmWQc9mhgMVSSjtNiRvVAHekL3f3Rws
2/WFYxl2Ap3Dea55jtPte/8PCUZKBMq4se2QrwFtoGQKNggjWt0Z8UAynyRqaLbK
QWL9w5tGi/TjCzatw89UyhPDGhXKvuLga6ol3IExL+YfFQvxOkhqNmnSDNKnq2LI
Mwt0qVK0dLn9eGbdwJ+AmdsC4Hsu4oujiczdZTq8y9U6qJbFaMz9uR3JB10eKJ2m
wjk0lED7GFW3wsAP//oseWGRY1Qqaq0ZYJGrm1poxJMtvIG1jfcH4yeg49kiUsZT
HQGbNrenFuPqvmizwcTbgehxOzVo4r8f+z4riVjP5TJr+EzqJjNKdSNsKszl1IMi
v8Xo1kR1l7Br0sM/KyTIzUBJHi3n9ujw9qS7bX2bT9mBPMNb1xY2qrB1XuYmIxu9
f/4oUX/juST74Oc8laytMKY8NWRRZho3oycFQ4oHOF0Knhi07vpBCxd6w4et4sSv
cxW2s2eOIeTmRY1Gnsmr5FeILdGb/cZhSlErZ5BaXAFtlvamMFc=
=yNEh
-----END PGP SIGNATURE-----

--mXDO3udm/xYWQeMQ--
