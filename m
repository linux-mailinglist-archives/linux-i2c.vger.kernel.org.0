Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C127146652
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 12:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAWLJL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 06:09:11 -0500
Received: from sauhun.de ([88.99.104.3]:52208 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgAWLJL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 06:09:11 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id D3A702C00DA;
        Thu, 23 Jan 2020 12:09:09 +0100 (CET)
Date:   Thu, 23 Jan 2020 12:09:09 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Lei YU <mine260309@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 2/2] docs: i2c: dev-interface: document the actual
 implementation
Message-ID: <20200123110909.GG1105@ninjato>
References: <20200123105246.67732e33@endymion>
 <20200123111137.5899fa5a@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline
In-Reply-To: <20200123111137.5899fa5a@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 11:11:37AM +0100, Jean Delvare wrote:
> The old i2c-dev API based on inline functions is long gone, we have
> libi2c now which implements the same as real functions and comes with
> complete API documentation. Update the dev-interface documentation
> file accordingly to only mention what can be done without the
> library, and redirect the reader to the libi2c manual page for the
> rest.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: Lei YU <mine260309@gmail.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

I wonder if we shouldn't move the 'C library'  paragraph before the 'C
example'? To make sure people are aware of it (and use it) early before
digging into the low-level C code?


--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pftUACgkQFA3kzBSg
KbYEIQ/6AyiSPQ2hqgEkBMprue7dR82NKOHwASOfpzduyro0EG6LcSBCbuQ0mQLY
YM7iPCmpBIeCXVqw6SNku27L8YOM6fDTTOmQ79JX9+pDdeaPQSHFgKRZkxgRhWXA
1MqK8208X8CU673F8FhiWkDN1BbJRqsJbcN6TFMZhAB8cxNS6WnOcbX0WJ1e0FM4
k111Ycy6k/LJIBkm9TK23sCj6SeHe6WvYzNYpS49FBOCY+1y2IPqaUpQ/CVPaYYv
uGp9yCzcuceoSJ8c87Q1VdvU99Ts7fhD1U+E+tFt0GonF+mGW+lX5/jQZLg/SaS6
IfA+OmAaUHzXtM5jmxz3H20xq2RjPjsTpSX23TEZymmGjYp8yM9l6DmESIfoLlE1
qqT+v9ysUuc1t14/SbkBGeibsGaRVt3F8YOOSMyENthom/CBacrA2hu1pl8fyJPV
dwi4gLFpgSzL1yKeJ8xc8ZTBjnY94LYBl+KL3eeKmsND4ze9cEO6KzuzuLMUo/4t
kgUNK8fOmzhq90+5aLeQT36wPBt8MHd+GRF/A2fFRMowV9gt9fHmFuTwEEdlge1a
Uif24ajLJ/ZiJCEKrgB4DjA+woypbqHkGvY1dxeseMmGqm4QAovWN/joi1Ui66qW
ni4E4PG2TLZYEIG6aBc+gGenD20bydaazQlqr3NEXxVuvv70kjw=
=x4z7
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
