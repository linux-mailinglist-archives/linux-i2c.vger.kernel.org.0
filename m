Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4640C566A3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 12:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFZK0S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 06:26:18 -0400
Received: from sauhun.de ([88.99.104.3]:54654 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbfFZK0S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 06:26:18 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id CBEA72C0114;
        Wed, 26 Jun 2019 12:26:15 +0200 (CEST)
Date:   Wed, 26 Jun 2019 12:26:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Jonas Mark (BT-FIR/ENG1)" <Mark.Jonas@de.bosch.com>
Cc:     Kjetil Aamodt <kjetilaamodt@gmail.com>,
        "WANG Xin (BT-FIR/ENG1-Zhu)" <Xin.Wang7@cn.bosch.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Bug present in at24.c in 4.14 kernel
Message-ID: <20190626102615.GA14324@ninjato>
References: <12a06d759e3d44a89ae41f65631c16c5@de.bosch.com>
 <20190624170228.GB6164@kunai>
 <CAKAz2q0x8Qi8+RT2dFNv74X1Cm_SyTUvzBmnZ-YN_x6d3bQS4Q@mail.gmail.com>
 <20190624184330.GA8035@kunai>
 <CAKAz2q3_jCRB0=tOF4BWMc8Bof0GGw_G_rQaeFM+ZPjxfD7WLg@mail.gmail.com>
 <20190625215848.GA2987@kunai>
 <8d3189f60c5a47598c2dc62757558dc7@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <8d3189f60c5a47598c2dc62757558dc7@de.bosch.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

> I already started working on preparing patches for the stable mailing
> list. My time budget is just very tight. Please bear with me.

Yes, very understandable. Thanks a lot for doing this, much appreciated!

Kind regards,

   Wolfram


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TSEMACgkQFA3kzBSg
Kbbh+xAAoHuzSYPzT1nQy9R0dgOEZeusujk1s+gJ6RWp9ALEhNb6bn5oGZoUeqEr
j3GMEW/BIHbOa0+tBwifJIJvpwvKiYGILvICjZ6qkNpbYQ7mKgOqyJK8nI4e5NdP
4HwBGZJvyFB7nt8exSuTldotvtol50gU8BaOEOWBEyvN5oDBH2rTFzi/tlXe4Awp
Fg1ogcifIfYx5IOEK76GL67jE1pG5GBJbVlaalFoRg6fsEC3NE4b82MPH0NyYbeM
g9SxkvS9NcWcW30pF1CAJdt48gY2RxIyidy7+djJoqaMklRiz52/2NL+kNSWt0fa
WV4FXuaQncVxcXFtud+7W4BxhfjSVmdijl5c4kYjVKANAYsoLW5bPoMu20yEScF/
VyAK8cl5XcTR1EYXGQ9bOt+d81if27fRY8VX7M8yi3wFnStmJBNxNtfJV0BIStHG
BI1g5QU61f+Vp3JETgoiw3nmBH50iIy5vYzy4FZ74u51kD4o2XetLOEsv36yKv+A
qL24469OdRyGoqsb0zj5ftCoF6GtELV7TqO8VJu10PmzE1c+nibJ7TDv5sVByisL
RNHLnUCVfKEanht+INdW8EvSmFUZGfmEOAumHd/fzN/MpG6+5WotX0tqfBpai84i
9y5N4YNAYvrp389jAUJ6wYw608Z/nnjwTSe8ldvH9zW2zUbzgk8=
=HG2Z
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
