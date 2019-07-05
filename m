Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B2E60B76
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 20:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfGESfc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 14:35:32 -0400
Received: from sauhun.de ([88.99.104.3]:53518 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfGESfc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 14:35:32 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id F03852C0398;
        Fri,  5 Jul 2019 20:35:30 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:35:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] eeprom: at24: remove unneeded include
Message-ID: <20190705183530.GG4717@kunai>
References: <20190703120754.2602-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TdkiTnkLhLQllcMS"
Content-Disposition: inline
In-Reply-To: <20190703120754.2602-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TdkiTnkLhLQllcMS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2019 at 02:07:54PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> We used to have a call to ilog2() in AT24_DEVICE_MAGIC(). That's long
> gone so this header is no longer needed.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Obviously correct :)

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--TdkiTnkLhLQllcMS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fmHIACgkQFA3kzBSg
Kbb9CRAAnYcDLQWhA1oUAOx5SAswbnRV7YjW3Aw92K9ECBPaiES2n6m1aypvISkW
Q5OgOPK3mp9tY1VcydeGA8GN5DvogLM4pVerI7ytad7v2TiOcGFcPMl25PgxuuPW
Taog7l0v5O6dCafwqW8swpPEAoBL0faHOyaASQ94PzC9JrJZ7b1msJNAQukURDis
MMdT1/evLVXVYbeOrk+f6bL+TMc4ajxN/8yYEag6evP8FRLyK+UiQUJhxPc6WwjF
DjhraYbyqnIm4dZiJi0uI+USAd8pILRD9x1wp8fIrvmAWkeSf1/EU9u/XOIlfItI
akecPR/oB2WuHRpK0xWJS23JBf7iVECHX6yEiTvfecsaravO1JEBeovkF1TRD2ua
UhmuDQ1K7fZkjtRMYGmAntSwDsOX2Up3UvWUUszr+q9pHPektlTI3u7G6L8ydJvs
01QJR1h0iRoKYq7LEwXVbqskT6QRyB7x6yliGb146MgIjwcgN72qKW2TKPW3XML6
+gElT4IvMuWae6FKlK/WxWKInVZDn1zQRIWU8GzwMt/rSEPxJ+0HgeNL0AOEhzfS
6eBzH0rGQT5S3pzVYxWvwWDKd7k1HGSzszrtktUWzWriXUfXQK48DPKcQOE9Xk2k
NWWXt6bosYsH9t9xZJud9/DoGA6+vLP6BlOetZSZIGkJF536EWo=
=b4Xn
-----END PGP SIGNATURE-----

--TdkiTnkLhLQllcMS--
