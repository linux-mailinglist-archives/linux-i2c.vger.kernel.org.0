Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A803C37C254
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 17:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhELPJE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 11:09:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233001AbhELPHD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 May 2021 11:07:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 272C261447;
        Wed, 12 May 2021 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620831684;
        bh=eVJIJPQRut7K9Tu8mkfXxVF3G+ycqC5k1sE42YbMqek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/0LG8JRxfEogycKZwPikQR2FSRaY8mYTVNlj0kpvzGT4vBoJazp+qHlrCrKRiYyS
         szXytK/8Kd2+8YxKYesZ2j+TTsP1xWg+l7Ljb+6oUhgWb59z4iOmC7yIR1MmgNA2BG
         WiDhShGGqolDFtrTLlToBMa9r8Bp1h5JDg+ZI3B7CfZlj8Q15rKIHL4WRoEk8d8YZs
         lND2A3hZlX0yZgZGuAY06l5+/BYeaaclG55FuVDCoYB//vIYbfcDNfUD2N7Mv+PPwm
         ebd115sfs2YX9WF5Sw8Lf+XpOFHPx4jJPV+18kiJ2yDnoNiOhPRfd3Bll6z9GfsFuz
         CcG+OwV8n7Z9g==
Date:   Wed, 12 May 2021 17:01:18 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "Chris.Packham@alliedtelesis.co.nz" 
        <Chris.Packham@alliedtelesis.co.nz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Message-ID: <20210512150118.GA1004@ninjato>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
 <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
 <4e96247275d559bab133d6c318276fa6be4d7be0.camel@infinera.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <4e96247275d559bab133d6c318276fa6be4d7be0.camel@infinera.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I've been doing my recent work with a P2040 and prior to that I did tes=
t=20
> > out the recovery on a T2081 (which isn't documented to have this=20
> > erratum) when I was re-working the driver. The "new" recovery actually=
=20
> > seems better but I don't have a reliably faulty i2c device so that's=20
> > only based on me writing some code to manually trigger the recovery=20
> > (using the snippet below) and observing it with an oscilloscope.
>=20
> You don't need a faulty device, just an aborted I2C read/write op.

If you can wire GPIOs to the bus, you can use the I2C fault injector:

	Documentation/i2c/gpio-fault-injection.rst

There are already two "incomplete transfer" injectors.


--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCb7boACgkQFA3kzBSg
KbZ2cA/6ArsdZ8oeQnb4ZdE6P2n/iEJan1gFTBse4voG84wLXndcRs9ylZRRy6gU
kn+ZRsP8i3eRyJrYHd4a5s9IAfxYlOplIm6VvNLQRe7sMsjNkIxYdCQPwqUA02wy
1jrYOPhAFBnggzP6k5eTtvnf2k9yuma2hJtvu3tzaBs8x0eSx/LEu+K74mPFTkys
nmRI2IbgXxkhLw9eVP652bqPkX/kkT2oiABwMw9m9m2qv4Ce/VflEYPq/Ie+9gIt
ktbAg/E9UlGMQMzhPZQ0trOdstvXU3U7gD9RoCSnJiUjJaDM2iBtWfM07V86Pptf
VOKjbWR2POER3llDyDxdkNVW1bUFh38zprWRkDfQd9pD+F63pTrcwo+iKwST0Lc0
BLGWw1OElr3IaXHSI/bCMtgpUQxplq5unc/+bXydd/DvIw1X0/f0dJMihjbHDYy1
fXa1Ac7plZGHxEdrt4wRLimgjoA/A0eOC1Ixkoc7pKylUjAdOlA7mC7O5tcJ2fg9
p0CuWascBRY/F+UEAtI10Fc9E5q/uLrmmWUPtIvivm+wQx8frIeZS002yeArsvvR
+J4NQRv9VPbg+sgDxtX2AHJZnGsKJ22+htHkHE4RfkiNUYEzjNgYwAjd+Fu/cMOw
0tj3LuG1uhYsmHwVwdLC2/MwNh3qVGL1/rbp5aFICBDcF6EZ5D0=
=ar4h
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
