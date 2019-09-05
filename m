Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788DDAA51C
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbfIENxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:53:40 -0400
Received: from sauhun.de ([88.99.104.3]:57438 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731109AbfIENxk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 09:53:40 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 9B2412C00C0;
        Thu,  5 Sep 2019 15:53:38 +0200 (CEST)
Date:   Thu, 5 Sep 2019 15:53:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     Bjorn Ardo <bjornar@axis.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190905135338.GH1157@kunai>
References: <1567497091-18270-1-git-send-email-bjorn.ardo@axis.com>
 <20190903174359.GB2171@ninjato>
 <ea04722c-81e5-1fb3-d5fc-0ee24e073025@axis.com>
 <20190904154814.GC1157@kunai>
 <f8629df5-c1b7-aa72-c403-9de393e87a93@axis.com>
 <20190905083851.GA1157@kunai>
 <20fc32eb-e2ff-84d1-da3d-3ba6484653dc@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline
In-Reply-To: <20fc32eb-e2ff-84d1-da3d-3ba6484653dc@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > The eeprom tested is from ST, model M24C64. Should this be added in t=
he code
> > > or in some doc folder?
> > I think FIXMEs should be in the source itself.
>=20
> Do you want this as a patch of its own, or as an update of the old patch?

Incremental please. Your other patch is already applied in my for-next
branch :)

>=20
> Well, the "24c02ro" version will solve our use-case and is by far the
> simplest to implement. But as you say it does not scale well with more
> features. I can however not see any practical use-cases where we would ne=
ed
> anything else (like "write-only" for instance). I can make an implementat=
ion
> of that so you can see how it looks. And most likely, this could be combi=
ned
> with a DT/sysfs version to do the same without breaking anything in the
> future if that is required.

Yes, go ahead and let's have a look. I am quite positive I will like it.

> One more question, I'm thinking about trying to use the "request_firmware=
()"
> in the kernel in some way to be able to automatically populate the eeprom
> with content from some file (the equivalent of a "pre-flashed eeprom"). Do
> you have any thoughts about adding a feature like that?

I see. Sounds reasonable, yet I need to think about it more.


--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xE2IACgkQFA3kzBSg
KbZCxRAAnzGnAqYX9gc+bfaOQ0GIXnnRpO8sMtI2sRjj0LjbRMVSc517idjDi46V
fOREMpEWbdxVlYegYUN671YupTAwvJvOWtv1U+7c20QuM9fTWidM4tMQdKvWSLgC
ljiVb+z2nL1kJf/lEfI/6Z3MAPwjoK0is6mHukFpY1CioArWiS5zF1GDia7oNO6y
MYv6RrSlOvUMi96IY7ohJ8En2LU1J5sG28VmD/XJ8DePsLic7GER2NrgvdOAssLO
JMxxpftGFP9pCbEPchTBoU+b++KTa/JCApgykYqgYMvLp0Bp1IdSgtVYX2/EK7qH
8+UYBBPaPjtqqHq39ucJ+XXr9HY/ijsszU+ruQUP9QSSHA0jJqMsKBY2rKvY+aoh
A88Yw8UPcs++dOPbt63x2zOmX+gqbMXH33K/cvRM98Sv00OkJDb3omC+V4HTG3rW
ZbyK6KsWn3ZZsAk5pTsA1f85OLIxhvPlgW2RGcpBnbr5rbUSlo6bqQB6fRby5yIV
akWUOGDjuF8pe/s4iC1ObZUgNQVaZe/envDg956YkHQ2nraprIf3lYKEOy5UBX/E
YC5RSKyOKGwuQ9SyWRnUgsAtu8YBMsd0wrl2ltp7BFoaz4jKTcUXk7PnI2h81tzd
0mRTi3Q7HYeXs7sAaRo4N7Nl5KZ7z52Uw498gD2syOmYiVBo9MU=
=owjw
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
