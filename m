Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B144921C92
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 19:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfEQRfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 13:35:44 -0400
Received: from sauhun.de ([88.99.104.3]:54516 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728551AbfEQRfn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 May 2019 13:35:43 -0400
Received: from localhost (p54B33248.dip0.t-ipconnect.de [84.179.50.72])
        by pokefinder.org (Postfix) with ESMTPSA id C23F42C047A;
        Fri, 17 May 2019 19:35:41 +0200 (CEST)
Date:   Fri, 17 May 2019 19:35:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v8 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
Message-ID: <20190517173541.GB11396@kunai>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <20190516211310.22277-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 11:13:08PM +0200, Wolfram Sang wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
>=20
> Currently i2c_new_device and i2c_new_dummy return just NULL in error
> case although they have more error details internally. Therefore move
> the functionality into new functions returning detailed errors and
> add wrappers for compatibility with the current API.
>=20
> This allows to use these functions with detailed error codes within
> the i2c core or for API extensions.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks everyone!


--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlze8O0ACgkQFA3kzBSg
Kbbu5A//eP9J8YEq0BQSvXME65SQ+LVA5cSRKKgt0fuWgQpDY1P/uWz0ZW1e+lGE
5Z4xM+VIkUoGeEj+jvqhFzSOgdgbZ8vkFbkV1wnqkya7AbohJ/CF6GYYYJCaJ7vd
IIXKMQ9bEe46DEq8/asVTdm+kmDthjHjaQIzNOB4V2mKDcGrCYxpS+YcVUAlKOVN
jiUL4Q4GvhwAEO7j3m6gcLUytb3oH7PqvSqnX+x2mcs7HailG9oL70W+nwJJIHlB
HhdlmrJnpaDnymccD8H7n1K7Nkdnt4nCUvZ/2HctRrEP4Qb0q1ztNK9OOo2JDyZ6
cM8NMfeghPZehAfSGag9MZKAJSU20zsmXpR4JLx4D4ZH4toyIAREz1HJxgI+/q3e
surQFZ/Oi5kyPjzhPvLUK+P1OsyRIIdQV8Iqz/nZLq1HrXpuC71zCofEZFvb+8pB
Ebcd/BZgzQrBANAVFafx+FKOW3dGL9/7yAJ0tHDuG4MV+enF0jVu/y4vDVU5MhjI
KqY036UNwjqL5hIRjgg/Mo4TOBom/y2HNsrIToT+gogYA9ssT25aOHcyJ8bFf8Jl
3PyyksyQnN7B6RtEHL7TG5GiFNK6upH6yO3r4eAOAAGNRjNr0Oo2bprLZks+Cgup
62uAKD+e10CEQlk9MG5qjv32R+MxlpXKvDfGheW6GWnWkxl5zzg=
=UD7H
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
