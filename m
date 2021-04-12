Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BFE35D01C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 20:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241769AbhDLSSK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 14:18:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239725AbhDLSSK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 14:18:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 665B76023C;
        Mon, 12 Apr 2021 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618251471;
        bh=uJJRifarGIODCUzPS4eMxH7H3QpnpG5zaKsq/qAvQR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gGg2lmmV5P5rw9Y2lZ4iL9Cgq9FUeg3+YrzkUmnIQKXN8X5ywIT1zha2vACEebnsC
         wXHcYmhlqo+4elfDpgeodriEKOblNSMtF2XUhfyxpGuUVJV4ewaswrpdnwALBs0EfC
         4nDIwHsebnd2ojxA4oulJkqH63cS99d5bmzWPXwA7E+5Ivlfy7SvmNdJPMIGj1v8Xm
         LoSxG+OgrzDqX9zBU3jlW5OKkUg6qmz0Q+KrGifycZ9tOKAfCvCYZGnLQMdcOXpZI7
         iPOOfziUycauIXON+4lznfGD18oWCaf8KzH0RSnDTDyZlhk6JKBatVDdbAaTLQ9hNe
         5sfRXC79V/Aaw==
Date:   Mon, 12 Apr 2021 20:17:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] i2c: mpc: Interrupt driven transfer
Message-ID: <20210412181742.GA3175@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-7-chris.packham@alliedtelesis.co.nz>
 <20210410201302.GC2471@kunai>
 <723acaa7-ff57-40c2-a733-a520c5899800@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <723acaa7-ff57-40c2-a733-a520c5899800@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

> Yep I plan on being around. I've got access to a couple of designs with=
=20
> P2040 and T2081 so hopefully that's sufficient to deal with any=20
> regressions. One issue is a lack of different i2c devices (the systems=20
> we have tend to use the same devices) but hopefully any reports of=20
> regression will be from people with access to such devices.

Sounds very good to me.

> > That kind of leads to the question if you want to
> > step up as the maintainer for this driver?
> Sure can do. It'd be nice if it was someone from NXP but I think they've=
=20
> lost interest in the PowerPC based SoCs. Should I send a patch for=20
> MAINTAINERS? If so does that go through the i2c tree?

Yes, please send a patch and I will merge it via I2C. I don't have hope
for someone from NXP because it was difficult enough to get maintainers
for the actively sold SoCs.

> > Only thing I noticed was a "BUG" and "BUG_ON" and wonder if we really
> > need to halt the kernel in that case. Maybe WARN is enough?
>=20
> Yeah I think they can both be WARN variants. The one in mpc_xfer() can=20
> happily continue. It's a little less clear what I should do in=20
> mpc_i2c_do_action() if the WARN is ever hit but in theory it should be=20
> an unreachable case anyway so the only thing that could get there is=20
> some kind of memory corruption which would likely cause a crash elsewhere.

Yeah, please change to WARN.

> Do you want me to send a V3 of just that patch?

Yes, plus the MAINTAINERS patch, please.

Happy hacking,

   Wolfram


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB0jsIACgkQFA3kzBSg
KbYeIBAAissVnxsuTbOn2jT37M9pIfqXU+Gl91o9naCeVYf4xJzreGcyyKYXTofj
QXNLPfeZcJU6cPZjOwpdE/J7dLtHsTN21AdyR28COAdOCiktIaN6kHIWYxjmGMHj
dTT7pXnYB+/yUyogVJvWJMMfSG1OPK7Cq6sSgElV+c9e4mEpnQfurwjsGF9Tdzt4
RHvXmNZTlVTW9XikvtqOTDDx/1D5Ajfof0X3PvQ0k3LfKOz3Z8Nf9k7hNwjgVRdZ
ZCrCtNdQWasc55PjDQFcX316cwVPdAViY5lMH4pldqn20XgpLnze2BR5V7m5WVha
NttS+qBCIdSx90Bv43NYWpp9xLQhXHGzoR4IrpE9BfYenMlLAG6Zu+xqPHdqQu/l
rGShMFBkuSOk8BtNc9n56wMN7CEyAwIzUKbVWqQi3u3w877cvgKSpqO4xeXHj6nC
oHFhdGUhgSha0UXOM6+1OHzcDb2Oh6mQzDYxbrdpTJyPZnMHy8JC6FqV2KMBrGXW
AaojiFm0C5S9zAJPzhDc5EoToxXsjuFvS4aLas996moCJmplFLVSzxKvhc+Aqt1j
yo197bjgkQtytoKWKYFeUQwwu3eSNSDb+dSKmTED03Q4pUouVJZmkldGhD8I3J6Z
vtXslgL2smvgHkA//CFFrWiSbpsB8za9yeAHkwHUBR7AwWDVZV8=
=4Ind
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
