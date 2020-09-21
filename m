Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67441271FAB
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 12:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgIUKGG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 06:06:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:52712 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgIUKGG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 06:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=nlLXi3uGep08cOkABv02p7Zv/TXD
        UgXxBqHFSOAE9WY=; b=nluKbynNpr4rbu8BxAb13WjNpgQMqjJeN174O3r+4pGJ
        93TEfxYpRQ97X5AOwiCv2fWIGH0CEQNeR17geNWTkppSLW+BxrzBwSKjy1qzn9ql
        45IKCEAYUycFYZnBuP1fu9VL7UcummwHmNx+KWMMCG+2jJIEjRexRlWzeRXAp3Y=
Received: (qmail 89727 invoked from network); 21 Sep 2020 12:06:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2020 12:06:01 +0200
X-UD-Smtp-Session: l3s3148p1@Cy9p/8+v9LQgAwDPXwWzANnLaz0lJiia
Date:   Mon, 21 Sep 2020 12:06:01 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: nvidia-gpu: Use put_unaligned_be24()
Message-ID: <20200921100601.GS1840@ninjato>
References: <20200716145319.53773-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xe2geHXJg22At20M"
Content-Disposition: inline
In-Reply-To: <20200716145319.53773-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xe2geHXJg22At20M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 05:53:19PM +0300, Andy Shevchenko wrote:
> This makes the driver code slightly easier to read.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--xe2geHXJg22At20M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9oewkACgkQFA3kzBSg
KbbVCg/+LNZYGtOloEJ20ofBgcMzOuopavLDNGhxhOaUFJvJJFt+9V9NS8DEe7PC
Xk9AIigiW65HHPEP80gVkosHZMgJEDmIrauWi577VVnfh/fKFCjAd4tK9PfWg1tw
G/cN9ufSWgVLbLzbhpDs0S2EVouGCnOnqVFch2TKE0NXbbH82ZYWwvKnqwmWPSTA
5Fe2ffWK2x4w3v9uLFn9EG6DSCo4xEzIVlhNYjCpCY55J8Xo+uPSFAytQm9SvEtu
1uexBN4DZFef7uLCO3uUqUmYsYillum09/iFGCPFzG0iDDz0Bw/b5pRKsbDgN6JJ
A9aWkHlOgaBzounBXYofEbGj8PY76U1AM6LWs3Qa/fcAxevwDZO5+PrdJr3mbrx3
y765fYSIN218lun+GL1PlLyvAk+oTuEg3u+bLQfRpa7PHlmYoDkfGkE5Vgp3lPVj
rHb8W8tNkhz59Z93qI6aA2ii+UU/i6OQ8v35o+aW7r1ccCkqGbSMFghjpknS3ZwS
sGsktls6DR+5+JMRIC/g+MCYQ0ofzXEiquVo3pwOtXsngO9tbsrMpZ3DAO4nn/MQ
fS/nvGpsTjCO2OyYr5rOvn4UP4W0KoDgOiy8A5cHacBaQsL0YfpxLLAPHOEaEnIv
xa2DqNUhhOD+UavzfdZ9jmcbc29tc/49ErYt/saMOF74PDSn280=
=GtmZ
-----END PGP SIGNATURE-----

--xe2geHXJg22At20M--
