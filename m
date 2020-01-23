Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F29251464B7
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 10:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgAWJlK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 04:41:10 -0500
Received: from sauhun.de ([88.99.104.3]:51474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgAWJlK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 04:41:10 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id DC3322C00DA;
        Thu, 23 Jan 2020 10:41:07 +0100 (CET)
Date:   Thu, 23 Jan 2020 10:41:07 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Message-ID: <20200123094107.GD1105@ninjato>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
 <20200123091228.GB1105@ninjato>
 <20200123093120.GA2365@pi3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline
In-Reply-To: <20200123093120.GA2365@pi3>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 10:31:20AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Jan 23, 2020 at 10:12:28AM +0100, Wolfram Sang wrote:
> >=20
> > >  config I2C_ZX2967
> > >  	tristate "ZTE ZX2967 I2C support"
> > > -	depends on ARCH_ZX
> > > -	default y
> > > +	depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K=
 || RISCV || SUPERH || SPARC))
> > > +	# COMPILE_TEST needs architectures with readsX()/writesX() primitiv=
es
> >=20
> > The list of archs neither looks pretty nor very maintainable. My
> > suggestion is that we leave this out of COMPILE_TEST until we have
> > something like ARCH_HAS_READS or something. What do you think?
>=20
> Indeed it does not look good. However having compile testing allows
> kbuild to run sparse and smatch which already started pointing minor
> issues in existing drivers.
>=20
> Yeah... pros and cons... I don't have a strong opinion to keep it. Since
> patch is important, maybe let's just skip this part?

Yeah, let's skip it for now. If you or someone is keen on having it,
something like ARCH_HAS_READS (<- needs better name) should be
introduced so we can use it here. But that can/should be handled
incrementally.


--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pai8ACgkQFA3kzBSg
KbZuMA/+MDdZn6LKAYPb/hGGIvu1E0SYz615wqwiPR0e0E+41UdROF/YpdKyisqD
oMbbHYOilLd2KIF/7Df+LnU4UHjGj3PV7U6+uO2ZHYxHlZHY1jLLk4zaS/2U6IUm
AQ+ItfGt6ShpBeShwTtMTeTB9HRh9Btpyv5fvD3Y0Y5g/u/nTzTx3a9wqnUPQy7g
JNrazF6w1k//66RxU4X1hRj/8Bw50C3Cubj/1CI09BtNhjSECeGXVti9658ujvU2
d10NY4tUyAPw4SL+nbT3BTAQprJLQWa91s5aDBQa3EheulM17deLNux97Sj7lwv9
y2Uhsgm1gEsy2rskMvxeKMr0nj6YfA782FbLY7cCXAApUR2moJqIwM1JWGCY8Oqw
VdT1oPG46f29CeW9JvEv7OPp9WfhODMnvbd22tY2sy9GmsToRqRZV9qfSlRAbgiX
xVJ2UiZT85Phdk19o3xcHAtYXQlzG1PARVkYrEaSN9hd6RHZirojM4WyWNQ1Jge7
5KBdmjzVjj9RBaV1XKxVdoAht6Sghesog5S+k13eB2a/UURXOgOEZX+1M4QfoLBM
/uoguJSkyRXSUUVThcZGXCgu3j6yRVUTBM/ZLDzT5yNgQRzfcdLtuvn0xuUoj+pH
WarmvqCuPGb840nx3XN0POZr30iIus/U+HVCEQw2//9MLEjQh3M=
=iauM
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
