Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F3C4E9F5B
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 21:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbiC1TD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 15:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245413AbiC1TD5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 15:03:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDB23B03B;
        Mon, 28 Mar 2022 12:02:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8391BB811FF;
        Mon, 28 Mar 2022 19:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FDDC34100;
        Mon, 28 Mar 2022 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648494134;
        bh=pdX1BX1PZdrDcnNsgWZ22Gn23YYMTZ9to6el0G97/Ro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qCv00nOJzA0Pg3NMSpjiOGfZ1Lpp9SWGdg3HW7z6y7Zj+7kZCx/qBZsSizEElljf3
         9CEvI2dz+yvfpyYVRc7f1e+jFWiOVYwFIFF50QFzMkAgfLH2r0x5kF++rlLeK5xHj7
         NWQd0T/8rSgdjEsfruQqsCDeTNuo6BgnG3U2dxpnntCcnNkt/qsz69yVusgplROFyQ
         w2IgFWlL3BCKNOPglhCz3w6nw2jDwjPyL9rMxLapHX1/6EUvuPdea8uZmMN6gYC58i
         M2g+OmosZfq66ahtRPR/Ke3iV2h54c8MzrlrYuIvcA7DerFVJAbZDLVEvpR4wXo1Ow
         gfLcLLuyzrdFA==
Date:   Mon, 28 Mar 2022 21:02:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c for v5.18
Message-ID: <YkIGMh8/yoAoTQ+J@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <Yj19RH3qpzQsIV/O@shikoro>
 <CAHk-=wh0M10owjNcKvw3Vgdv7_SwJch4d0HEjBXYj3nPfrJ-UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5Kr8KM/T+J8T7k7W"
Content-Disposition: inline
In-Reply-To: <CAHk-=wh0M10owjNcKvw3Vgdv7_SwJch4d0HEjBXYj3nPfrJ-UA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5Kr8KM/T+J8T7k7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-m=
ergewindow
>=20
> Oh, and another comment about this pull request: you are one of five
> people whose pull requests remain unsigned.

Challenge to be not the last one accepted!


--5Kr8KM/T+J8T7k7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJCBjIACgkQFA3kzBSg
Kbb9cw//eZNtBYj2BmuuwKUmX69rwJbeafANyg6J3JHMfdia3bRqnjriLgCJOYg2
sjk8ZI3CTK8cX5eZH0F3CL9UY0/jDUQwudhcC0wXONUbDqKsZSBpHAXefT6smaHI
3OSPizpAhHSrbxSROAL7/vsu7RHWf0z6pFOyGSu4p5nrNO4mENj2/PH3sMGhg0wn
EwNNIpy3Q7ULD1I6dwnpKJJL0Vq3Lwg/JjgLRHqMgDp7hxXQCF8XeTKgg9U+5fGK
VJ+RdjJ7jRZaxiBDMHVBmzzKUcMNEswJdZyUJ1FPSlxJAZYyVhb2vuMW+UI2sK8I
aSf65NXybgTSqjOSK2GNL5C57fHJBgWU3HQyWQk+qAocn+fbUgbtPPuVqC+gH5rp
6vejDgndkWbuqxQyKmZWINgvfIPF6QTz+bcddW8AcBXcCspmEqrh0wrorp0oeSnI
TKq4s/D88rW7f0mREd/FQrjumy+1QNeQxtmPecp9OXl+/LF3wI66ATt9PyNPPd7s
6zL7wotk6V1RrSQ3KTolnoZXMu8unWB9meAAoMrrE++tlXRbhHE5v3s8TznkiTuY
MrQ87DkjJK/amb4Te11gtoE9/5//s7PbiDIQSCelCa8YfPiX3WR2csI4Hlup7hST
aPAkoSp86ynRGXNrKtkIyYS2HXXdmwSDXdqGbOCvOrya2rSof7M=
=Nn7g
-----END PGP SIGNATURE-----

--5Kr8KM/T+J8T7k7W--
