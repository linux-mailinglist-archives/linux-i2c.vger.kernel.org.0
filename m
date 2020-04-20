Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6118F1B1793
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 22:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgDTUxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 16:53:31 -0400
Received: from sauhun.de ([88.99.104.3]:50670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgDTUxb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 16:53:31 -0400
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
        by pokefinder.org (Postfix) with ESMTPSA id 279052C1F4C;
        Mon, 20 Apr 2020 22:53:29 +0200 (CEST)
Date:   Mon, 20 Apr 2020 22:53:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Patrick Williams <patrick@stwcx.xyz>
Cc:     Bjorn Ardo <bjorn.ardo@axis.com>,
        Patrick Williams <alpawi@amazon.com>,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: initialize empty eeprom properly
Message-ID: <20200420205325.GA1693@ninjato>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <150599be-9125-4ab9-e2a6-e792b41910e6@axis.com>
 <20200420164349.GD3721@ninjato>
 <20200420203146.GC95151@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <20200420203146.GC95151@heinlein.lan.stwcx.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 03:31:46PM -0500, Patrick Williams wrote:
> On Mon, Apr 20, 2020 at 06:43:49PM +0200, Wolfram Sang wrote:
> > On Wed, Oct 02, 2019 at 08:20:53AM +0200, Bjorn Ardo wrote:
> > > Hi,
> > >=20
> > >=20
> > > I sent in another patch earlier that added support for specifying a f=
ile in
> > > devicetree to initilize the eeprom from, corresponding to the case of
> > > pre-flashed eeprom. Maybe these two patches should be merged so this
> > > initialization is only done if no file is specified?
> >=20
> > Yes, I agree.
> >=20
>=20
> It looks like Bjorn's referenced patches are still unmerged also?

Yes, it might be easiest if he merges your patch (with attribution) into
the else branch of his fw-load patch.


--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6eC8EACgkQFA3kzBSg
KbaQrA/+J/BFo8rhuV/ObewANKKTUc0Tr1RAY+npkvv8asmIoT1xriSOb8TzUPI2
6wv5egQD9fQ8z3DjZlr3pxSISwJDT8aFyTMcEDeQ6JI4P0fFWZXBCIbtjyJqlwMe
t0U6leFUITmVB5HjoLUWFQb59l/1/CLvWYTmiE/VmYtaMhPIzN/ze4LKHLHdLPq4
3n0XEwtOhHTTshNNq3MuFSqpu0Hynja5IbuGPyekXdQYEOz7o9A0rcg80IZAdtvB
kP/07D6LpR2fIUW2Zi+Uo2q3S2K8H+sqr+QKNGlUArwQnsB7qwiFDcGOgY/Jp2xi
ZNc9homj0brUQnh2gxmqLrDyJfs8txeMQ0gW2fPjJeQdA1iJVisLc4gmXgqKnYmr
hyRm/7ED4SrkSIuvVIU8bJ0HKIxvdn/YYv4zDTMYl6xHjCcr3qrwmjMbaB+14X+a
eLG3b/NbGI/W+Q2rGJI3TNtT7hmoNaBGxMYe8vKJBc5WvrkL+yrBIxkK+Y573TYe
HiZrsBtairdpU+Knz6up0+Dx7yq5N06F85UMWPuizotI8h8jkbI+AW6Rxk/9xtwH
/WesL3yo0gD3bZRMJ17uT4wdiRZkDZL2x641jXVhX7+pYBV8mZYm+mfwdYs/UI/D
dEyL9FCo/U6fO7xJ4vT9DrSS0TjFbcFX/m6eKWSEtQ4UipWC5YA=
=7XYS
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
