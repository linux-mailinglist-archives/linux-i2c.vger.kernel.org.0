Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6AB1A3555
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 16:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgDIOCc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 10:02:32 -0400
Received: from sauhun.de ([88.99.104.3]:59352 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbgDIOCc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 10:02:32 -0400
Received: from localhost (p54B33209.dip0.t-ipconnect.de [84.179.50.9])
        by pokefinder.org (Postfix) with ESMTPSA id 30A8B2C1F75;
        Thu,  9 Apr 2020 16:02:31 +0200 (CEST)
Date:   Thu, 9 Apr 2020 16:02:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: remove i2c_new_probed_device API
Message-ID: <20200409140230.GG1136@ninjato>
References: <20200406122531.3763-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <20200406122531.3763-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2020 at 02:25:31PM +0200, Wolfram Sang wrote:
> All in-tree users have been converted to the new i2c_new_scanned_device
> function, so remove this deprecated one.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6PKvYACgkQFA3kzBSg
KbbY7RAAq/nKzDJI4iBbIdB3AYiF/CixIbNW1agqMqGfql78vRMNjEoNHg9fyDlz
ocq5dbOSltRBoDDqV47fIGPvLOzli9acaeelvubeOpx4XSTrbsimoo5nvmBl2rfl
YV2JPjfbOCr6RCGTPa5xUjkirvxmi2qYs873n44gX2Jm0nqhh7V810v7STy+Rn11
YEC0yGcy1BDnCV0gZfcqqk6a3L9gp0l4nsEsJ4nsYc1CALVxXZcWQL0h1xV04gxb
X4m69uag98w3vGgyxz22uYyhYfEwI54drfhOHgZQ/Xl8MfiAONgqy9Tk7/9vVipd
Uk3Xh4xJJXtlTuYAsQvhSxxWPIU7DzA5sUGYLhCvB0ENDQlnPacguSt6fqtzrkYR
rcdOgUjqKpXfTkbDVIZEiyPxai3/Ju85fgcklH14DS0MlLOJUk51vjhtUs2ak5A8
JMkgOk9JgGPBBu7b4hDEbx5Dsbxii+SiSBEto37f9aVY7WvRuVnacg3Ai6zKtV6J
krfdI7/WtdUNg6PanXI1fuC++yqneAvW0UuD1X5B2RcWzPuECfpYSfFb4FWQTkHq
sslkY6lYc4U+VQrJmeAcelbwUpnwPUpUx0YzYGEwO27sEi+C/Yx7KW3ce5zZIMOl
nYXI9PRS7ODLQkbST5nTM0x0xmoYTcYpwLQI+hxkXeN65zr0/jo=
=DsGU
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
