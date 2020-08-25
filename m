Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08802512E0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgHYHSg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:18:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729194AbgHYHSg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:18:36 -0400
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9847620706;
        Tue, 25 Aug 2020 07:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598339915;
        bh=mThe8ULfwqaL7QWVlbvoAiCrlkSf7dv+g0CvAzGAuB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ApAn4SjCCsJn9awz5zh1lF2tEhxr1WpqnD8DNr32szyxDcwtpR3I4mOis5eNaLkd6
         EgUXquJavwpFE9PDuUEhMnaXrhQFu7puiGe0sFluKO0tON6FiXtrguJf0E/wH/toKR
         hoJgv94FvTnoTufRxerVdZHRBQlpqrBBlVx2H6hU=
Date:   Tue, 25 Aug 2020 09:18:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH v1] i2c: mux: pca954x: Fix trivia typo: busses -> buses
Message-ID: <20200825071832.GC1861@ninjato>
References: <20200820152729.74944-1-andriy.shevchenko@linux.intel.com>
 <44d27a41-9dd3-d8ba-eefc-da518df98ff8@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hYooF8G/hrfVAmum"
Content-Disposition: inline
In-Reply-To: <44d27a41-9dd3-d8ba-eefc-da518df98ff8@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hYooF8G/hrfVAmum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 10:02:04PM +0200, Peter Rosin wrote:
>=20
> On 2020-08-20 17:27, Andy Shevchenko wrote:
> > Fix trivia typo: busses -> buses. While at it, rearrange LOCs
>=20
> I don't think it's a typo at all, it's just an old spelling. Not worth it
> if you ask me, but then again, I'm not a native speaker. Anyway, unless I
> get more input my call is to change this whenever drivers/i2c/busses/ is
> renamed...

I follow Peter's reasoning, especially with the directory name. From the
Kernel top dir:

$ git grep busses | wc -l
653
$ git grep buses | wc -l
867

Not a typo in my book.


--hYooF8G/hrfVAmum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Eu0gACgkQFA3kzBSg
KbYLvxAAoZYPu+0ElVDyESJBcuVWARv7CUVInE2fxqKbtUr4ur1xEM8mrbbtKHdp
AKvrWn+1YX9Qg0SWoBSJje7+/aBYQNsKRrWYinH6wvjTFJaXbvfRbLAxCCvAC81g
w+noXRFez9QYFkXXEb+q0wJ/5b6Ai87/7RnZ3LWiswL1H0aBzt9uaMUtUk0ZtoIZ
FVzgnxE/Nlq5MogORZBfNzM1Q2qyhmDRXzVLWrOMO29UlBU7uTDQCc5wqGs3Iy5z
4H3R3CAkbB52HlAgzHurF27dhcD4E8fKmHAyKSrA9k/VkdW3tbDsY6fU6WccuHks
Uk26UOQj/kLJPS+hn89+t6173I7yIAoUD8gN7I7TMRDYThRp9nbRxIhn1Gaw2Fme
i8WxSYXpXt+Zmkoy/FOvfRc/xZblWH1JIiRvRA/pe44qqY1J22691fFqyRJ38R6c
mi5OED66CUkT3BSw7+Ldy81P3sRYMB3C7dgXTOApnRtIp7Et0TLS6zo8pioTuGXc
+Be5Z63L1H8CGd4myJCjtlTiuHjphSbyo1IL11UmCwYMH5a5sVbC2WVtVE+wdfpa
gLh/tZCsipoj5G2xGI0IE82/ICAsMM7RPJhYkC+Q+CMqSrAWrzi7z8Z43bStj2G4
HHopdDBGsGphpOVskhMgD0Vopff+peo0r67MuRFfmbMo+1A0LTA=
=bsLF
-----END PGP SIGNATURE-----

--hYooF8G/hrfVAmum--
