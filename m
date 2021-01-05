Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA192EA879
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 11:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbhAEKTz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 05:19:55 -0500
Received: from sauhun.de ([88.99.104.3]:41208 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728016AbhAEKTz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 05:19:55 -0500
Received: from localhost (p5486cfc1.dip0.t-ipconnect.de [84.134.207.193])
        by pokefinder.org (Postfix) with ESMTPSA id 00F8F2C03EF;
        Tue,  5 Jan 2021 11:19:13 +0100 (CET)
Date:   Tue, 5 Jan 2021 11:19:13 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 3/3] i2c: mlxcpld: Add support for I2C bus
 frequency setting
Message-ID: <20210105101913.GF2000@ninjato>
References: <20201210165113.6130-1-vadimp@nvidia.com>
 <20201210165113.6130-4-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline
In-Reply-To: <20201210165113.6130-4-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	err = regmap_read(pdata->regmap, data->reg, &regval);

drivers/i2c/busses/i2c-mlxcpld.c:492:54: warning: incorrect type in argument 3 (different signedness)
drivers/i2c/busses/i2c-mlxcpld.c:492:54:    expected unsigned int *val
drivers/i2c/busses/i2c-mlxcpld.c:492:54:    got int *


--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0PSEACgkQFA3kzBSg
KbZwtg//fpHQaL4TXxNcOt1qNnf7VJPMmFn3sh+zskbyJDm9om118p60N3/L4Xeh
juuLf4yNgHH3b4E3wckxLLwvdRdv+S9KlrDe/7RtnJ0i7rxcdfsW5wvGQ0Q2QyKU
Goq8SE1KukBNVvdRYQR5o0y5ZYKKcdtOT7VkFKRWzIVneVIIUe0Em/02NpUKIq2h
MJq8TRTQSG94JbLAiPkC9DUcR8dNs6f+9wj7W9eqNgqzYXq+ubwwSbl92vrXApDv
kkozDfiMNiMdD73dNVCi+Z+KC9tdSIXK8hSk69svvGhN+JqIO2FKmm9RjG2ARbDs
wI738O+7y2s+gbFSDLDkL7hw6P3kwFIUggNfRrLM/2QsPW+k2MwvtkTcDprh08fi
fKMSKunBtuD74bOLEuaEUVQkDJqYIywxCXRhZsMK4A9VrCtvPHPCikl0tHv3MI2W
ejoTsV0x0rAQ3UZeccxz5gydRoUutPgucpW7OjVmzYYjd283FXq6DrGSq/dWq00s
6my2eKYKyvB1809SHY7b0JglRcMZumUslW1oOa3oOnUvTKI6MD3UKr9wzjjhy87H
WQYwG9zr8ztS4v+QRfnPcl1xqzI6wsQI7kvx+H1LhfmWQ5EZ7+nZYOV8krmRqFJJ
DQaD9+MTyQrTqwKQFDL28dNbmvOWZj0ReKBGnd5CtVUBBuYlPVQ=
=bSmf
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
