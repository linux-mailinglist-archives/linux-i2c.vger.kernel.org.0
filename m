Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74247591ED3
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Aug 2022 09:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiHNHBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Aug 2022 03:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiHNHBj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Aug 2022 03:01:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2491CB26;
        Sun, 14 Aug 2022 00:01:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1A31B80B36;
        Sun, 14 Aug 2022 07:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B77C433D6;
        Sun, 14 Aug 2022 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660460495;
        bh=l1MwA+3lDNnRrnI1Ch7mCCezneYBwqpmpdRSrnuAr7A=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=jZL8NY5tK+xrm2p4hutY2CqExgOt7P7Zhh6ZvrDl/cpW3pw/QZakMg6Yck4ZFtR1f
         Mv0WrYCtWdegUXara2TzGX7/Z4TUc0N7t7zLc2UkIG0b4VRN8Lj+k52Xf23BQCPJpj
         3pismuwPgHFFQD6QTb2MbY3LzFThRN7AxUDzVq6jrQzOnWFxEOYXjqrhHS7kCfxSnj
         EQ6ImOCCV3zHMwDZMPwaoUjIqOKpXNfNYEKWJOym0iEzLF3We9/osUoHWdmrwi6bkv
         AjSA7sq4Ozl5skpDuwItntpejBVDnRF7lCM6Ghb3a19o3Wn3ZlKlMgQ0Zi9bw8eYVl
         kjkeRQY9AdGcA==
Date:   Sun, 14 Aug 2022 09:01:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
Message-ID: <YvidybasUAuhGPMB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
References: <YvfGY2qnl2YXrUgX@shikoro>
 <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
 <YvhC5Orb+JeZFDEO@shikoro>
 <YvhXzarjOLEJ8nsW@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z+ikOLADP8s53AlP"
Content-Disposition: inline
In-Reply-To: <YvhXzarjOLEJ8nsW@shikoro>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Z+ikOLADP8s53AlP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I pushed out a branch for the testbots now:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/strlc=
py

Pushed again with patches for userspace programs in 'tools/' and
'arch/um/os-Linux' removed. That was too late yesterday to notice them.


--Z+ikOLADP8s53AlP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL4ncQACgkQFA3kzBSg
Kbb17g//THkLMrcBLH/2nWZYe8vQnRlGioAUU4Iwht+wOIZGOSbikZkyWXureChJ
t357v7PhzNm6mqBkJqFVTZMrfV/aKKEEpEEyJ31PQq/lqqP2vhwCayt8lIZkhyXl
JFtPPLtkcJEUJVfBgs7LCdNCWvRGWdgzqS8MN66pmC+zp3lu+w62fWJLKT1AMJyg
G/sWqb7qhO1W7gwrQtTiUZysmW72h4jPgvV3QzPa5djb2ko/aWxdgiUejUJGYCTq
KOI3WkDGccCdI6bwowemXoj2qwJC4g8UOi/knhDRbODiFFhkS9b4L0Yd8FZ9ol5E
ExJv8WtguiauKjDabPMy7x60Styc2ISzMADETnkmqCuksSpCzCvCXdguGn6uUq9o
gFJ84P6gQ7K3c/rIIxOv65zN6hmjC0EGosKt/Q15IWS8j0ZC/y/73CZE7OglJtzR
E2HeFZxMHdAD9ujLOpt0XgKJBqaQwMOod5E4hdF+dPuGghVEeG7iu8ceJtLiKqQ8
nJ773FP2hKmaAJ4NrreaWmnuCk8QXecTASp2xKrDRAvZUE1lSlwMDvucuyAjgdwq
e6Gru9RUlaNlHQG3uK1o5exUVAB/1kE9/aDVgQzwpDLgj0crqXrGIXI55hg7Fu6k
IFk8ZBaP0Q1x9b1RFnYxMkGd7G/bivYaWTvj9+94MplIrbmX9V0=
=CL4Y
-----END PGP SIGNATURE-----

--Z+ikOLADP8s53AlP--
