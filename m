Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56EB2A728B
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfICSdd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:33:33 -0400
Received: from sauhun.de ([88.99.104.3]:57076 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfICSdd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 14:33:33 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id C2EF82C4F33;
        Tue,  3 Sep 2019 20:33:31 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:33:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     eajames@linux.ibm.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
Message-ID: <20190903183331.GN2171@ninjato>
References: <20190706131911.3068-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BtmVPk+Smchi6n7w"
Content-Disposition: inline
In-Reply-To: <20190706131911.3068-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BtmVPk+Smchi6n7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2019 at 06:49:11PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_available_childe_of_node puts the previous
> node, but in the case of a break from the middle of the loop, there
> is no put, thus causing a memory leak. Add an of_node_put before the
> break.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied to for-next, thanks!


--BtmVPk+Smchi6n7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1usfsACgkQFA3kzBSg
KbbHqA//RwujgS4uaBK1Ojt7XUWb2fC1z63kOV4O01H1vsHLztEKc2Ix2iRXjGz+
qGW8BcGjeJ82n8tKxssnBv06d28UdwAtS+kgN+6EiG5XBtaYiSWaQeMRG/qiET/t
AIBOmp3uMKNr0/asxGcq1aWQ1AbwcMw22so/TzDQ/ZXxmXiH7QYXfsqyImB4XnJH
0MJ+RW5f9JnpSN3mMBwMgFDgvurVt7Wuubv5QMYPrtLDrUVY/hXSFb/hhEWTkHG+
2TjcvtdRyXhRyxS6bim9RsMViSy/p9HMDafHF2QyUNCKJ1peK8A8Qg0NR1D7lEwR
xIgl22GGq3Ej4VHqtj+TH2Z/ZJjTxNAR9E55orS2RWa9nDpbN0r9bwRTv9y4CsBi
WaTjm8LzaUbIaBU1KJjC4izEawGnp6JcgX25Tyj/XwSzfJIhAPEeflUNAAZ54Fxh
ZQeVS7G9DAbzWV722aD7Gpt4/HcjrKfH4hJNcerpipGmFz/gLTu7vWZmo7+lalce
SQn6l+vUm5kNnoyZ7KytNgOGTdSkcNYQUCOXsQZLMbrhV6dhgAxX/EEeNKCasyt6
2ak+GEByX5rnFfEpw1VIxvbesbdq3Ra1t6N5pln8EtrVjiVcUqmNXoJpIV8C4zlY
48UKMblMB1qLjUhLpDrIrO13LCJA0HZD7ZYohCSvSSIO9RpPkzE=
=CxMq
-----END PGP SIGNATURE-----

--BtmVPk+Smchi6n7w--
