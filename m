Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D89AC21C95
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 19:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfEQRf4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 13:35:56 -0400
Received: from sauhun.de ([88.99.104.3]:54536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728551AbfEQRf4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 May 2019 13:35:56 -0400
Received: from localhost (p54B33248.dip0.t-ipconnect.de [84.179.50.72])
        by pokefinder.org (Postfix) with ESMTPSA id EA4292C047A;
        Fri, 17 May 2019 19:35:54 +0200 (CEST)
Date:   Fri, 17 May 2019 19:35:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v8 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Message-ID: <20190517173554.GC11396@kunai>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <20190516211310.22277-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 11:13:09PM +0200, Wolfram Sang wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> i2c_new_dummy is typically called from the probe function of the
> driver for the primary i2c client. It requires calls to
> i2c_unregister_device in the error path of the probe function and
> in the remove function.
> This can be simplified by introducing a device-managed version.
>=20
> Note the changed error case return value type: i2c_new_dummy returns
> NULL whilst devm_i2c_new_dummy_device returns an ERR_PTR.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks everyone!


--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlze8PoACgkQFA3kzBSg
KbZqhBAAtKGhSXV9O6twYtxb++AsKJjC269z2Cfy80Gp8VRovA9ND3PjUfyc9zcT
g8JIO6zN7tHItEteBaAp5HEWBJogiZ+MXaVjpj9R+ntMBzex4NHwDz9/olqAZelC
2VtCr2BUCVnwWmMHTfZzva288rVMz2hLr9O8r2txB3UcVDN1lvGc591ZMQPU0/W2
sGlhXbHogBcPrs/HFhfbG4v1wMX9ChT6US6hnbskvxkpQF5WT1hMM9NX9S/HAxsT
Hq5Uuo8gL7Du9JmIfzwyVXe/mGPhE8TYBSL3ndBXn1Lo7qlgY1ETN3hyxgdOiBc8
QOSH6A0VAFzuF5dYCJawGhdUHhej2a0b9YP8u+RYxK0K3q8Lym1m8JItYYe30rh6
1xlaXYx48o1USEdnP0ov/HGkeLYU7JHeuFYmDOq7r4aA1m4BkJncTH/oL2YjsZ6e
pzR0xslsReIevWQj/2CnBRhDoR06kwE5wTjkSfrYoh1FHjuO1XabhvUrK3WU8zuS
ES/Lh+94DSKCI2pbau4XQ9MyYdzTWyB22pGoORND34l/0BKIBx6OLfG2PNu7wTUz
L30WVRZwZ27U7pzF/YQuPLoWbXO3oBb68LuuAedS4LFT0ZOF4XPBHiDd6IQcNo3m
61O/8pmfLZTaLYt/jqk97UxaRIGaPOtMCDAZxoOtEXcDbcB+q/w=
=q8v2
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
