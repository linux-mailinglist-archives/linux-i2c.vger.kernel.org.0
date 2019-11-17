Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FBAFF85E
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2019 08:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfKQHVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Nov 2019 02:21:53 -0500
Received: from sauhun.de ([88.99.104.3]:60248 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfKQHVx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Nov 2019 02:21:53 -0500
Received: from localhost (unknown [94.230.152.199])
        by pokefinder.org (Postfix) with ESMTPSA id 08BD12C01C5;
        Sun, 17 Nov 2019 08:21:50 +0100 (CET)
Date:   Sun, 17 Nov 2019 08:21:50 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: remove helpers for ref-counting clients
Message-ID: <20191117072150.GA885@kunai>
References: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline
In-Reply-To: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 09, 2019 at 10:26:15PM +0100, Wolfram Sang wrote:
> There are no in-tree users of these helpers anymore, and there
> shouldn't. Most use cases went away once the driver model started to
> refcount for us. There have been users like the media subsystem, but
> they all switched to better refcounting methods meanwhile. Media did
> this in 2008. Last user (IPMI) left 2018. Remove this cruft.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Q9OkACgkQFA3kzBSg
KbYxiA//U0A4/LrM166YRQn5IKHVVc9zXi/J0DCXl9kE4Luo/Lexd8sKF1J+D33J
t2Q+Qiw++MiFF2+lLnrAU+sfJGj4pRSU5874CVF56oUdGygQ+FI9u2sEt+UG4aFE
wEiLySOebVUProNKIlsbb1h0nQ6fR01TGHNMAKqRvNiqTJxi+AWOJCSoCN3he8l5
Y2kg3s8a2gNefJ8BQRPuARHYAcysNaHtIcZFT8G8tCCPNI08UlQU+eSHYW021cVn
rfkctvIDjjTQOnoa4QX4EjvKIqDJcNMy4OWHbGRpdDquFW524ZXsKdGYCe70o9G0
X1GltUR126aQgf1BSR/gwmKar/KrIas01ysfXI7pbH1BO1hv6kVGZi6cpWw86Dmm
vz9STNMMaPW31ky9hv6pHMZu5RkrvuiCeYXySber4bdggSzbm5ILDtYByG+T1ctQ
iT7viLWwnFuBXzZIruNZDdN1T81oriTNG897roP/n4hc5yzrOdjr1oaMOD6IeoB+
jnlTagm3YZd7EUzEVRc4orW+QVNt96DCK+EsEpraXRAQz0Dsc3K/VvTlKdI+xTzd
TlGm/e8DKBLVhad2AQZqSky9Ovo7Rst0ZD7YQG+YkrLHLtBPGjarRq9J1gQMXDhT
6IQmIfblmdrc+Zpi9A1CvN48VmJgKz6Q0elrSa9567JrEf6apHk=
=XZ/m
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
