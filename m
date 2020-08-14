Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F50A244EA7
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 21:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgHNTFW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 15:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgHNTFV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Aug 2020 15:05:21 -0400
Received: from localhost (p5486cfdc.dip0.t-ipconnect.de [84.134.207.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C94E62078D;
        Fri, 14 Aug 2020 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597431921;
        bh=01u43TGkIz3TmAdvqXr1K0R9o7+nQoyMK49BcGq6MTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nPTsX+zxa26kqOluKI58sv7Ccxt4HMb1awE4+OHkF/xHQOWe7lojKB/7vqqvpS4rA
         WxXHGZIkECtVB+98N/385KDjhcBAhJvJhbfhKUbMslSSeyXBNKcs8q0fr5RJQTlkLX
         16BCK5tmtU1nS2JtOVXhebcebfjJBz6KkQxnGd7s=
Date:   Fri, 14 Aug 2020 21:05:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Mohammed Billoo <mab@mab-labs.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: ocores: add be/le support for gaisler
Message-ID: <20200814190515.GA1250@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Mohammed Billoo <mab@mab-labs.com>,
        Peter Korsgaard <peter@korsgaard.com>, linux-i2c@vger.kernel.org
References: <20200814163134.29493-1-mab@mab-labs.com>
 <20200814163134.29493-2-mab@mab-labs.com>
 <20200814165058.GC2239279@lunn.ch>
 <CALkjhPppeOwekp-ZJZ9QGfNGa=K5g6P+TWs42Anrb+QvFSrspQ@mail.gmail.com>
 <20200814190259.GD2239279@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20200814190259.GD2239279@lunn.ch>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 09:02:59PM +0200, Andrew Lunn wrote:
> On Fri, Aug 14, 2020 at 02:56:58PM -0400, Mohammed Billoo wrote:
> > Sadly, this is a case of vendor-specific implementations causing indige=
stion.
> > When this was implemented on the FPGA, the vendor-specific AHB bridge (=
we're
> > going from PCI to AHB to grlib) had a built-in endianness conversion wh=
ich we
> > didn't want and found out later. Since it was easier to add the big end=
ian
> > accessor on the software side instead of redoing the FPGA design, we op=
ted for
> > the former.=C2=A0
>=20
> O.K. So please document this is a workaround for broken hardware.
> Otherwise other people are going to ask the same question. Add it to
> the commit message at least.

Very true, this should be documented. I think a comment in the source
code makes more sense.


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl824GgACgkQFA3kzBSg
KbY2WRAAqVBPO6PHsFmuAB9PRZokTvRWbUKaAWOr5zb+Gg6ymjhwmy5jNImIlj9/
SFTLWotYnsRqUsHW7+qM+yoIbVa3piJsw7mzgE6d6pkMXIHj77LYfCp2RjA9Gxb9
RvewydIs4kwuW6O+1Nozr2wYWHirBlBY0WHLQte8OvsPozVfd9zLGbU/c8Aw5Rr0
GLYRoqVv/lIzQ+6zNm/6u7Sh5JUIMK9SZEbFPRhHd2Da+Y97gFNB5oAD0rifuCcL
D/Uw5kR0VGLwhmAFNrFtqKps3ggH65zfFfNcaSAkhWOjZwnGxUpDW/B1uHElim4G
80fvoCuVT00wrybAe04jMA6vwpKTxru0Q30V4XNeheSeAnU/ZykYeKkTBpV8ZWo9
sOpXxrFloXN5tJa3z5U4i1MMRVFkweVfxjEwSpLvyT6/rJjnI3tqlEQrJEqh9QIr
oju/3zBv+YBiNmqZlMTEdDXj0fxA+CHoc01HrSaX5vS1SrhBDDYoPqHtx3S2GkDc
gDSEPxQySDDXcj0RxX/rE2zwUP2xuwCK3XdLijYwGXYFIdamqLUG2dTgQJgvY4r/
GxnZx1cjvx9kdRYDcMkAzhmBhCJicJ6gstLedzwvP2bN7zXyGAfiloEIPGEM9I4G
c+ZeH2MyZWAda0MW5jjxXNxBM8W5OyKA98Zd2aKe9KvR/ULCclQ=
=JAzX
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
