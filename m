Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF63D16E930
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 16:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgBYPAx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 10:00:53 -0500
Received: from sauhun.de ([88.99.104.3]:40208 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730317AbgBYPAw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 10:00:52 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id D70102C1F2F;
        Tue, 25 Feb 2020 16:00:50 +0100 (CET)
Date:   Tue, 25 Feb 2020 16:00:50 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: therm_windtunnel: fix regression when
 instantiating devices
Message-ID: <20200225150050.GI3677@ninjato>
References: <20200225141229.5424-1-wsa@the-dreams.de>
 <0fe4740a-f331-f885-c60a-6735c4c8e1fa@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline
In-Reply-To: <0fe4740a-f331-f885-c60a-6735c4c8e1fa@physik.fu-berlin.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 03:41:22PM +0100, John Paul Adrian Glaubitz wrote:
> Hello!
>=20
> On 2/25/20 3:12 PM, Wolfram Sang wrote:
> > Adding the Debian-PPC List to reach further people maybe willing to
> > test.
>=20
> This might be related [1].

IIUC, this is the same as
https://bugzilla.kernel.org/show_bug.cgi?id=3D199471.

I don't think my patch helps here.


--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5VNqIACgkQFA3kzBSg
KbaUZg//cUU9Y+K3KAVvbmdV7d0beRntW+8rVa8q2Xxx30zgb36ZYqVIkHVqQQdz
fhc7oMCuQnnnaJfW6SesxmRguKfNXKEuoEe3U42CN1fMKJVRrN7icuy/x6gpaAfq
XAbpfiNJiHmhQGYlvxqMMmxNtcQC7/cN3ikEiz5jOULc8FbTD47CzvGwNpLTJ2vF
TwgfbibPJlzquHoYXt87KyeN5GhaTvdm2fLMmn+bpshKUKaaw7ctAE/5N/MtC+g/
tmXj5rGrOhPxUbCyAXxJpmK5QIbYy96UrD+sApLodBmI2y/y+rixOL6uetGOzga+
3w+SEozOLC0B7SUbVVRjAm6shi4OKemuvSSnkouf+/w3VL+ww5v1irpUwH3C+U1p
BG/6oMsBcQr2O8W+Ij96UIr2bPw7N0oQhZo0K3ORjp1g1YEsaCLKIi5C8QVb0H4S
3b0Xj48rkxYHhrVjNu7xfAWgNV0szbmvzzcZpd18mpREO2gC3spCyVfodJg1Yezv
7jKNO6+hke84MHX/Y1jKbTABMm9/NX7FCQFoGxASfCW2rVP0cmJtMAWHPhoQtCuL
nVjTo0d5T34BTJEJXh62zMGyqYaL7JHdfU5r35qXTdxr5AFW4WCd7k3Y9W/cJSdW
+CzcDbDNsCCe06elJOpPj96NktLX3d8OYiuic6LkLBlfHArV2WM=
=Tt5A
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
