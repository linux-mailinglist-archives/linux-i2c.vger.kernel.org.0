Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C222EA89F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 11:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbhAEK2B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 05:28:01 -0500
Received: from sauhun.de ([88.99.104.3]:41302 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728422AbhAEK2B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 05:28:01 -0500
Received: from localhost (p5486cfc1.dip0.t-ipconnect.de [84.134.207.193])
        by pokefinder.org (Postfix) with ESMTPSA id 783E02C03EF;
        Tue,  5 Jan 2021 11:27:19 +0100 (CET)
Date:   Tue, 5 Jan 2021 11:27:19 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>, Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [Re-send: PATCH i2c-next 0/6] i2c: mux: mlxcpld: Extend driver
 functionality and update licenses
Message-ID: <20210105102719.GH2000@ninjato>
References: <20201118144416.184120-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline
In-Reply-To: <20201118144416.184120-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 04:44:10PM +0200, Vadim Pasternak wrote:
> The patchset adds new features for the existing Mellanox systems.
>=20
> Patches #1-#2 update license to SPDX-License.
> Patch #3  moves header file out of x86 realm.
> Patch #4 converts driver to platform driver.
> Patch #5 adds support for word address space devices.
> Patch #6 extends mux number supported by driver.

Hi Peter,

I hope you had a good start in 2021 and all things are good. Do you have
time to review this series in the near future?

Kind regards,

   Wolfram


--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0PwMACgkQFA3kzBSg
Kbb9IBAAnrN91ZhG/BgLh0JafoZ6utxBte0mMTQGJB3x7Z9gfKaejW+ibWhMf0+Q
/mKBOXdnye+cUIAcjpRxdzIdAZLdZnNf+JVDgFTp/kdUk/PXXbfCInyhvNs2YhPR
EG9kPswzVLmmhS1GYGKJxHbS1ki2h9T5Z/jOOhHi31C5FR6OFhDHFJW+DOVOFHcQ
FtXc8YICtnb9OoVNjocMWwnV518iStF/AGeCnMAfdZ594PF67N+qnWM9c3Zg6XJP
TEKgs3/XctfHOgQsZ/zAPwHqU5nNKU8Hphqbk0/ga58XSs1Ub0/K2czZSowiLZ5C
WDmF1KW1DxrQrdDSJpc2+1hyG2wVsGi36ZO3BFqxzF35bvzlwMZ3qctk5aZug09V
nf+WjDI9+gW7IeoHVHRUioPQhSEv0089hGosCg8wELTwIHyvL38NFPbYYCj60gLT
fjOr31X1ecKAPU0EYNjlJ5tOfoTjUFHYFWpu5UACYwKudObrtLK2ojVbTwE8rAjv
/3Jby/Axtc0cXyAjZEj/QvdnVLzSyC4j1HOyOSHMYnaChauPP2ZHAZ0qt1g0hFXD
jvn1DRn+Nkbte9yGRr2NqDWlFzmMBBeYBBbyB3YPW04bzIAJvie21Yy7AHfoF4Gh
FMeiuav5Gyp7Qjusn1pBuUIV9DmXVKCGqVdtlri5b0FDG0T3a/E=
=zkDV
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
