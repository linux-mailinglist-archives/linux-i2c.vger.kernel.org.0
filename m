Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7746E7F438
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406841AbfHBKCy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 06:02:54 -0400
Received: from sauhun.de ([88.99.104.3]:35412 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405909AbfHBKCx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Aug 2019 06:02:53 -0400
Received: from localhost (p54B3308A.dip0.t-ipconnect.de [84.179.48.138])
        by pokefinder.org (Postfix) with ESMTPSA id 0413A2C08C3;
        Fri,  2 Aug 2019 12:02:51 +0200 (CEST)
Date:   Fri, 2 Aug 2019 12:02:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/4] dt-bindings: i2c: renesas: Rename bindings
 documentation files
Message-ID: <20190802100251.GA20977@kunai>
References: <20190724121559.19079-1-horms+renesas@verge.net.au>
 <20190801125750.GM1659@ninjato>
 <CAMuHMdVBVFbcTDcXbBT18NfTnAxW-Gz6XnBgKO5REdHtw9zeaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBVFbcTDcXbBT18NfTnAxW-Gz6XnBgKO5REdHtw9zeaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 11:27:19AM +0200, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Thu, Aug 1, 2019 at 3:16 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Wed, Jul 24, 2019 at 02:15:55PM +0200, Simon Horman wrote:
> > > Rename the bindings documentation file for Renesas I2C controllers.
> > >
> > > This is part of an ongoing effort to name bindings documentation file=
s for
> > > Renesas IP blocks consistently, in line with the compat strings they
> > > document.
> > >
> > > Based on v5.3-rc1
> > >
> > > Simon Horman (4):
> > >   dt-bindings: i2c: sh_mobile: Rename bindings documentation file
> > >   dt-bindings: i2c: rcar: Rename bindings documentation file
> > >   dt-bindings: i2c: riic: Rename bindings documentation file
> > >   dt-bindings: i2c: riic: Rename bindings documentation file
> >
> > Applied to for-next, thanks!
>=20
> Without the wrong names fixed?
> And with an R-b I didn't give, probably due to the two last patches having
> the same oneline-summary?

Geez, seems I was somehow distracted yesterday. Did quite some mistakes.
Simon, please resend this series, with comments from Geert addressed.


--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1ECkcACgkQFA3kzBSg
KbYJNw/+P1UOHgYp1ZDdkVmz1A0OOOYJFI3fhgu+E+LUwz8BqNS963hviIxZ/59e
b8W0I1gjCuVsAZ34l6XohZKD0Av70HUoqPvqCoX7EBxhiJ0Ru8dDX+v4sKK9o+RT
yCYbJbVI5Wivy2yekznv3uo7WBSb2ZTgR3B/tMbicEY89OoW9D+DSD5GXdXZmktj
5CneKwDIYlxGWrXQL2MFVhw0DcdnB1mFReNEqjFBXNouY+hn7l01bKopi+QKCt8M
iN5kPzMrRe4CWu6HJdvNZ1/wXLLSQhDHu4om1u94cN8r4P6IllMf14QSgovKiJHU
mD/hku/kgeO0Ng7VT+PxVPJaME0fCPSYW+may7b439xrF5MqlRhXgyHdZ+ntwf7A
AXzr+r4MNxUpL++ef58GT92mOK7LpqXWehynzOWBRMapEdR/k3ZsYBKRUze/a6Pv
kciLpjca+vobAvy7aBHpfIwfRgF832faivYaL7SE6nMro2m5QESuIVG9c/Mc5Wmd
+YZBTwqhN67AQoIHJgHDXhMay7gfS0TnI+s2XLzIYf+SRQc/n8iZuYvMPpGnmzrP
htjRtstK7PErJsAHbRHwFtJxOWwHLhHjjNv2/uZteO8BwyqThtgxQ7EktBREhtTq
orCXwTe+dz7ENxOAnR0W8Ivp/SYrth8fKBcqIBUd2d3Nu6jzmBU=
=kh+P
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
