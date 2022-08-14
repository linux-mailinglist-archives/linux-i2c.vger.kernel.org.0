Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AFA591D88
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Aug 2022 04:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239760AbiHNCDC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Aug 2022 22:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239721AbiHNCDA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Aug 2022 22:03:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08486580A;
        Sat, 13 Aug 2022 19:02:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08D8E60F3C;
        Sun, 14 Aug 2022 02:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCBEC433D6;
        Sun, 14 Aug 2022 02:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660442577;
        bh=2f9sgPZkZa3uduFERP0l+Px/OulLC7YZ8qPnH0ayO7w=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=NqFubWONKd1D7K8o157UnNL/EXexm0MWqu0ayWjlYvmpAfc5LzI+CjEZuNELLpvPn
         LZp9bydUkuDJZ9Qrbv3bIGIboofNU9Dun7cqD4xfwCe6YoJR+XynFxzZ9yroKdyzZ5
         G93TagCTnSv2hm3ld0OdexSmYJ3zeIHYKNI1hkHU0iWbcv9HyqTc89DLJnAhgbqAO4
         6Y1S0UcomFwE5B2AGsF1g0apC1r3dci4TilUNIF3hw4CR6vxehSUz4xcS3KfImPPVD
         HGyq22xr36gKS7LW/5+FETFQ20W4uo5UaJM35yxHPU1Rzh3eUT1IdrvrpOZPrJE5de
         rbb7Il9Z/ZtnA==
Date:   Sun, 14 Aug 2022 04:02:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
Message-ID: <YvhXzarjOLEJ8nsW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
References: <YvfGY2qnl2YXrUgX@shikoro>
 <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
 <YvhC5Orb+JeZFDEO@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CFKOW2U+ugfszIQ5"
Content-Disposition: inline
In-Reply-To: <YvhC5Orb+JeZFDEO@shikoro>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CFKOW2U+ugfszIQ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 14, 2022 at 02:33:40AM +0200, Wolfram Sang wrote:
>=20
> >  (b) auto-convert (with a coccinelle script) all the 'strlcpy()' users
> > that don't care about the return value, and leave a few broken users
> > of strlcpy around
> >=20
> > I think (b) is the simpler thing, but I have no idea how to write a
> > coccinelle patch that basically does "if return value of strlcpy is
> > not used, convert the strlcpy to a strscpy".
>=20
> That shouldn't be hard. I'll give it a try tomorrow.

So, I tried right away and it was really as easy as expected:

=3D=3D=3D
@@
@@
- strlcpy
+ strscpy
  (...);
=3D=3D=3D

The ';' at the end ensures that spatch only looks for complete
statements not containing anything more than expressed.

I pushed out a branch for the testbots now:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/strlcpy

Patch granularity might not be perfect currently, but for testing this
should do.

All the best,

   Wolfram


--CFKOW2U+ugfszIQ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL4V8kACgkQFA3kzBSg
KbaBCRAAmY5rNGESZ69ldZiKjdDXJGMee7pYez+og0TUy/CoQjOGr/QBEXYy75Ao
OLaSW6yfpZRxpjkX2EYacMWubMgNPeQzaUPWNv6v1Lm67GCd0Hst/vwXRd3dgY1E
bLFtwdYizANEbHfe0+RyD0ZKdvCAmC5CWlNZag1EToJQj1sh2oPZWcwCfBV2kE8D
LH0a3i/r0KvqrnwB8ESdxliKxuUiPpG6Y9oZDVYCE/VyPN301kZaNKVIjNKLJLc6
XdKu72gDZWz+Ex85MCIUkKR9vSGrVMaL/lqUY4YdcIcu2htMTzUrK40GmRSPrWOR
CfY2U6WXii6WLQU1P/yxru0FQc7oNkTG+J0cjyYI4ubdGlrz5RkxMp1So4VWgHvq
DPtMFY34S7e69Ue5H3Wz6kiVzbS7P6ZVwvAb//hh/rkoA5QkQX6fjz80hVlSbHSJ
gR/HNxtrbUqpxklk45fI8HBCvpFMhasNVCUQv/YsoyrkH4cjKHvUd4xz1bMJIunh
HmQWeTrHjYWCji69MCE+n/rc5V10Yc9ZXDcoeh52NNMdwodQ1Lc+liEZMC1krKSp
ItR/eDl+9APfhjx8Kjqt6/RuBqufyO3Kt7j3of+Kz0PfKHY1cAytqXuTH6WWZZ4G
D662Mu77nAV4/JVOSOrfrYf3zzLtoO2gHrXiq7MDNwGFJEDcri4=
=BsLP
-----END PGP SIGNATURE-----

--CFKOW2U+ugfszIQ5--
