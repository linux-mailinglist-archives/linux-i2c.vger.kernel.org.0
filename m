Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656D4262AB0
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgIIIoL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:44:11 -0400
Received: from www.zeus03.de ([194.117.254.33]:57404 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgIIIoJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=psUPn3v0Njeh0Dci/nYFMywfR/UO
        eaHtZLAwZ8UfseQ=; b=rX2PA5am+kcMjxEDSxiFLT3kgrAc132/Fp7LybW02aBt
        mePLd+AV5NRL+Y4fMsB8Qt1l0IVzI7RiI8M83JxzCK/dz2UyYKy7wW2ygHX8Nu+p
        epbfUQlIse7AIgJjZnKa7Xas4D9bG5TKl4e04P4psl+1Z9gAaBt99o2TfQtL5Lo=
Received: (qmail 234828 invoked from network); 9 Sep 2020 10:44:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2020 10:44:07 +0200
X-UD-Smtp-Session: l3s3148p1@3HJqdN2u/IQgAwDPXwesAAPl1NpCEY8B
Date:   Wed, 9 Sep 2020 10:44:07 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: refactor and shorten timeout when
 resetting
Message-ID: <20200909084407.GI2272@ninjato>
References: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
 <20200829203810.1467-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jaTU8Y2VLE5tlY1O"
Content-Disposition: inline
In-Reply-To: <20200829203810.1467-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jaTU8Y2VLE5tlY1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2020 at 10:38:10PM +0200, Wolfram Sang wrote:
> LOOP_TIMEOUT was only used back then because we didn't want to introduce
> another constant. The timeout value can easily be a magnitude shorter
> because the typical range is 3us - 8us. Refactor the code to use the
> poll_timeout helper, use a specific timeout value and get rid of the
> ugly LOOP_TIMEOUT constant.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--jaTU8Y2VLE5tlY1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YldcACgkQFA3kzBSg
KbYy3A/+IbGPHtIIioxUGCueYH2FvDFVQ8yBFT0Yq87/3Eo/0CS6EDQoTDdLwBVf
qgCHk1tMXXeEvBBDws80KT7qh1jCSUaslT8Mqa3qWi9HNvNWzggUps4CMiZ9oJFG
19kG6eoT2NSwZ2PTyVBM4Sf2luhQ9IEGkROajZuftwCS125kHyYr73X0Q8Y1xHsC
I9YNLrZ1kphPaOS4SPd0Pug986nryH82QX/c6kZvpuLWQneUORYWKwNeiEvToEmB
X/EaLrZRjUrEIWxeGTSJ0gMSeuU0d8Ld8VedtiXaanVgvo5TmkolvtzVQEd4tyfk
cuTnks60o8lfvLdMOYLTeqXS+C6glY/kjUJBs1eISQruFRVzvq/E4DM86uUkFKWK
D0ySWQsGU6Kl2R3PSbhI/35BeQSvFKewPKA7BuGJkjYVU9ZVKWVTGBZjn5BAHiav
mKKWC2dBW78M8+j2kBHsNokUC/AK3eOHeJIummWtcEI6Z+rTe682tPxK/24aIjdj
ieRuxxYGg2eHJdcrCYc6oXDoTpiUzlBpOMnxWQ+RAlJXiu3jpxZvrde3YX5BtEIn
sswMf1pAJWNkPLEEWxe88tHVKrAXKDEngBadHtj/sU18ULe8jGisLXicq2rqMjZ7
62+tA7hLNDSIUZ+XCf/yfYpAmrUwWQe6NgF90ERf5UWSYiRXdJY=
=+Hd6
-----END PGP SIGNATURE-----

--jaTU8Y2VLE5tlY1O--
