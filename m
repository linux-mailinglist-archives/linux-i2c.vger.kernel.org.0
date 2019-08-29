Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01AA0A27A3
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfH2UEZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:04:25 -0400
Received: from sauhun.de ([88.99.104.3]:42988 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbfH2UEY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:04:24 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 53DC72C001C;
        Thu, 29 Aug 2019 22:04:23 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:04:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: designware: pci: Switch over to MSI interrupts
Message-ID: <20190829200422.GK3740@ninjato>
References: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4wkndigzIeYF6Hbg"
Content-Disposition: inline
In-Reply-To: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4wkndigzIeYF6Hbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 05:29:43PM +0300, Jarkko Nikula wrote:
> From: Felipe Balbi <felipe.balbi@linux.intel.com>
>=20
> Some devices support MSI interrupts. Let's at least try to use them in
> platforms that provide MSI capability.
>=20
> Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--4wkndigzIeYF6Hbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oL8YACgkQFA3kzBSg
KbZBHA//VsO/75+6v8HQcvaK37ecb8N28/VO8FODxWLylClEAe5m8xs+OagOae8l
iMjXizKC2NGXthabMHB4YDXrARrbYjuZp/DCRjbkcpzWNvKIv8OA06O70bWx64OK
T/XEaQQWXcXg1SJaAbpIldnOx1CZfwDlF+J53oqIfJo0Q3bNb1ZyCd0IiRrMEZuU
5Tfg6xD1DlrsWuqxVtn5Mjjf5kG1tnS6UX2FaY5nyqtPrgDk35DGYtfFpUeDpZNR
pUgtMwLEsiV1Ij12x6DNMVLAYh5091EzviCIk0PGSowrz2Bto4Hn3QnpGg5kMgS1
oOwvt3WREDUf6XwpuAuxOG075uUxKF5zl3TGtix2U/hRUVEehl0SZBeg0gULsEId
cd1jMiKPOQouuaI+hbCwiCZEEvMnflux+EsmKmN43tGwvp518GQkxZgbz9a4BGSk
ePHtzSJ+CsMVtBXdW+y26Ld5BSVWT0gmWkhTdJ7Nb2Oa+oLWso76XRSbvzAfBFKv
2baAasd1+hGYtGiQx75ASb25IloIA0qdKdMxHUfA1d+Ey9IEcdVu1OKMD9Mbm9/m
2lMPjG4Jts6aDBPWRr+0OihZ58ApTNcwlo+CaaeUmzCAWMaIf12sCz3xkJVO2lc9
nBo08HZ+rRP4nuMw16n2XUnCUV8qTHpYbOt8Sl6V72Et4mt3q8g=
=wD8V
-----END PGP SIGNATURE-----

--4wkndigzIeYF6Hbg--
