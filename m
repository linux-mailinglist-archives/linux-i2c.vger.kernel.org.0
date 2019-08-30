Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47152A36E4
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 14:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfH3Mi0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 08:38:26 -0400
Received: from sauhun.de ([88.99.104.3]:53442 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727603AbfH3Mi0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 08:38:26 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 951B72C0095;
        Fri, 30 Aug 2019 14:38:24 +0200 (CEST)
Date:   Fri, 30 Aug 2019 14:38:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Denis Efremov <efremov@linux.com>
Cc:     linux-kernel@vger.kernel.org, joe@perches.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: i2c mv64xxx: Update documentation path
Message-ID: <20190830123824.GA2870@ninjato>
References: <7cd8d12f59bcacd18a78f599b46dac555f7f16c0.camel@perches.com>
 <20190813060913.14722-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20190813060913.14722-1-efremov@linux.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 09:09:13AM +0300, Denis Efremov wrote:
> Update MAINTAINERS record to reflect the file move
> from i2c-mv64xxx.txt to marvell,mv64xxx-i2c.yaml.
>=20
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> Cc: linux-i2c@vger.kernel.org
> Fixes: f8bbde72ef44 ("dt-bindings: i2c: mv64xxx: Add YAML schemas")
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied to for-current, thanks!


--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pGLwACgkQFA3kzBSg
KbbpVQ/+IH7kcAXue6rPOWOPJdmutU+Eg1LqiWGcV0Fp0IKxRdK3uEVk9rZriZT8
QgkS+eBpPAF+R4YEmPaUtiCeQIZM32yefBaPxY4PxNb8m02ZNKmMXekaP0cu2Ng5
XC24aUH73PJfZ/iK0v4BLUA8CwrUi3wWnrLs6cvBEqKpiIDvs1K43WDlaeM5nJIF
pYRlM3W8GE9Qjh4eIPye9raAqEbEzNyHkyeeeNRSOZlDnoni21hyRBTpr6O6XjSa
pUzjMQRUSTpA97fmpqQ4s+Hp6DDZ2CLrzFNT+c+9OJX6YzHYkKk7SN0OVEu/Wf36
fmWySelznaNUtARrvhQLfkIBpjr3QRleNoz9A8YKHClgrFuyCtZc4foPymU0pzhq
h8na8FuE3g9OAVyyL7BzI8Y9954OKvFjFYlbA62zZjlFuhcZnqeEKpL1US5FRUDX
SsiZjuhJzF2RbS3HxjUIT7IH+XmLhZgH0YZ4yKCV326BCHUCD0IeZS8ty6JKEUGL
GBlDcSeWt8LX4DTUv5v6/sbxdDlRIU8jnSP+vN2/CicfIGnVGvHCXC91wQsT+Zzq
vBio/Mk4H5AaaAKsQcAGRWO/Y1EVplLLHkflsKcGelnIYZflvxi9BRC0DjCHzWcU
80e0Wi67lOn5det6t2sKDoFtuClMfyL51UU5GPtOU1Gyj/ZCNLg=
=E8jy
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
