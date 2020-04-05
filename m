Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C8919ED3D
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Apr 2020 20:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgDESFN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Apr 2020 14:05:13 -0400
Received: from sauhun.de ([88.99.104.3]:38412 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgDESFN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Apr 2020 14:05:13 -0400
Received: from localhost (p5486CC0D.dip0.t-ipconnect.de [84.134.204.13])
        by pokefinder.org (Postfix) with ESMTPSA id BDEAA2C1FCA;
        Sun,  5 Apr 2020 20:05:10 +0200 (CEST)
Date:   Sun, 5 Apr 2020 20:05:10 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Stefan Schaeckeler <schaecsn@gmx.net>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] i2c: imc: Add support for Intel iMC SMBus host
 controller.
Message-ID: <20200405180510.GD6313@kunai>
References: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
 <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline
In-Reply-To: <CALCETrXcFrR9V_yjPRh9eJ1=1efo_DCCwGTeusmo2CQXpFFdrw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 01:49:34PM -0800, Andy Lutomirski wrote:
> On Sun, Feb 23, 2020 at 2:52 PM Stefan Schaeckeler <schaecsn@gmx.net> wro=
te:
> >
> > This patch is based on Andy Lutomirski's iMC SMBus driver patch-set
> > https://lkml.org/lkml/2016/4/28/926. It never made it into the kernel. =
I hope
> > this rewrite will:
> >
> >
> > Overview
> >
> > Modern Intel memory controllers host an SMBus controller and connection=
 to
> > DIMMs and their thermal sensors. The memory controller firmware has thr=
ee modes
> > of operation: Closed Loop Thermal Throttling (CLTT), Open Loop Thermal
> > Throttling (OLTT) and none.
> >
> > - CLTT: The memory controller firmware is periodically accessing the DI=
MM
> >   temperature sensor over the SMBus.
> >
>=20
>=20
> I think this is great!  One question, though: what happens if the
> system is in CLTT mode but you disable CLTT and claim the bus for too
> long?  For example, if there's an infinite loop or other lockup which
> you have the tsod polling interval set to 0?  Does the system catch
> fire or does the system do something intelligent like temporarily
> switching to open loop?

Any news on this question?


--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6KHdYACgkQFA3kzBSg
KbbHcA//dmYTyau5m8uZUNnYgJ+AsL4/jprivL0wMkLtFlXO29EHjt0AgQnkYz9L
OrxVH8ZMR0e/wXpICbP6mjf3kdPIQaE5uAs6FPS3Qb+jFpWElQlaDFpQqLHTJEuJ
q4Vve6nnYnLMa3RQLpZgvhn2tYmPRSee3oir54wxovm7NOV8hB726azr61UwNvl7
W0GAJNI1V+jBZxeauTx4j3yBO1nGDaDqeQklLcfusVxre4UO2KJvJvrQ5W1nU90k
yMtV+AIV4tD0io0KdvMoguu/3VsUDXHfPc9XHihHot+SnoUgAisqOdfPIUUIHEwI
jV+zc+c9Z3nXy8Az6/MW5fMYLZulDgTdAnjNUTp4HYgcrPDUrhQLAULI6NIlxF/V
CB26nDNFg6Zri+DXqjSRMKKvLC7+c11X0YJ3TI7zGDnastv3YNE1ZqIuALlb+oxM
iN1bjYwRvkL25fmzl4vKsVA/BM1YPReacT3OIVwd+5pLtglDnLDG3lZujX6nFzcp
+bxDqpLonNPOcjk+E783yW4LzWEhqajDODeDaDULPLeui8Z3oBSLvZvPG/hinWtn
+8nBSHtyfzEEptd1oqP94FECiDu6/Fra18Gy80xn790nlSSwKCqy1xU9opB/1iPx
WhRaTw/6aIQA0Is2TWh2c0/Jk4c9FKNBFCn9XkixPcNUA1mAJpU=
=XoV1
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
