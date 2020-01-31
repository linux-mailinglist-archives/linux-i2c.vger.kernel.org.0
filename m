Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2812114E936
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2020 08:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgAaHsD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jan 2020 02:48:03 -0500
Received: from sauhun.de ([88.99.104.3]:57226 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbgAaHsD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jan 2020 02:48:03 -0500
Received: from localhost (p54B333AF.dip0.t-ipconnect.de [84.179.51.175])
        by pokefinder.org (Postfix) with ESMTPSA id 40B972C0830;
        Fri, 31 Jan 2020 08:48:01 +0100 (CET)
Date:   Fri, 31 Jan 2020 08:48:00 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     enric.balletbo@collabora.com, Akshu.Agrawal@amd.com,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH 1/4] i2c: i2c-cros-ec-tunnel: Pass ACPI node to i2c
 adapter
Message-ID: <20200131074800.GD1028@ninjato>
References: <20191121211053.48861-1-rrangel@chromium.org>
 <20191121140830.1.Iae79baaa31014e8b1d8177bcfbcd41514af724f9@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline
In-Reply-To: <20191121140830.1.Iae79baaa31014e8b1d8177bcfbcd41514af724f9@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 02:10:50PM -0700, Raul E Rangel wrote:
> The I2C bus needs to share the same ACPI node as the tunnel device so
> that the I2C bus can be referenced from ACPI.
>=20
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Dropped as requested.


--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4z27AACgkQFA3kzBSg
KbYHeg/9EXOoEKcHq+aytzh7yQPTx7n5V7TScfKoAeqSCgx+e6bSynfTB4k8JUCD
Fh6/1wwque8Jydaky4dx5bJ6s+UrxWlJyRQIOR3ALqkrKKUm24e2432sh0CJq6MN
vG0m2zZpiRPpsMG8qUkm0VYdu0IB6S/agFcgo9VXlJ9szg1BICTKkV3f0n1IYS51
mwG3uAxK9ULrWJpkB1zcphG6g9QcG0NpC/bLrflY6gJLtludwYovfCBkjyGCPK6U
POKDSgs2Crbr/K6hRiPkWwz1Hlfz4AeqNsun+i10IouTlzcvr4mfKEAzZ5H8SDht
53aBtz0WxlOiZgsx0U6PEzBtqzhywL6+GEuUM537T7K3xcdOeFZHs3TH1Iz29i1z
/MeDNVPY++VQrGJeDLyIEqFn4cqCGwFOaO+jaHHBQUejl0IX8kjkihR2Zsf8LDfU
eLI7SWp64P+JGMvCfx2DaRj48abYBVH05uDR/qzg6W5949cD85u2y2Cdur4iE5OC
7i0M0lIr+CNk9jmHx3UCWfktPbMy0LwDuU7883uOwhjmWX5+4XLPwKIj/5n56nWe
NdNivWGIVKt8przSQWm/CGk/q4kfSrMFGJ10HVWGa04YEaJTsYqVVa5cEYNNeNEw
Nx4hhl2lhCLygi3/Wu2SlMrBxHGuFam2yoi3VvV/vXVG2UWKacg=
=ppB1
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
