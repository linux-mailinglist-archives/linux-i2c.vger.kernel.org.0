Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11233E84F4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 23:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbhHJVIf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 17:08:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233153AbhHJVIf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 17:08:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F3AF60E09;
        Tue, 10 Aug 2021 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628629693;
        bh=VCknxQ8XebAwOlomRtsChDvFl0zg3vZtQqtg0m+qLGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z4A6MQyg4QgCF6Oc6CCs78DVz5bktB0WM2rDYHI+tNoS0t7uxU6ELuCBPQnVjYejS
         WVdJSqiqA+vnkMqn0+3DFIGgya8G+rXztysjN72df43DJTaKvraQF7pouFMtWxw/Ug
         AJc4TIkTt38NAypGk99r9VRBl8tG92+ssBQMSKIVxk+ojV3OyGX/ImYAMqX7+HICD2
         WBdW/Hk5toA2Z90xDMwhWAD3j2UDKTkccXmW9t/n+HCAhld11ExOa3MWs1m0kIlGw0
         6P87xj+hdNfVjSSnvJbNqBxTReJ0ggT4hi32cUdwxq0ZONJaLcN+GCHZg4QJi+udD4
         pIAK+qgHpJf/w==
Date:   Tue, 10 Aug 2021 23:08:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 1/1] i2c: parport: Switch to use
 module_parport_driver()
Message-ID: <YRLquRXkQvGKjQ3K@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
References: <20210712141119.22426-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1Fp8NoEhRuznlFAk"
Content-Disposition: inline
In-Reply-To: <20210712141119.22426-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1Fp8NoEhRuznlFAk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:11:19PM +0300, Andy Shevchenko wrote:
> Switch to use module_parport_driver() to reduce boilerplate code.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--1Fp8NoEhRuznlFAk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES6rUACgkQFA3kzBSg
KbZufA/9GdOq8rDzqAi0jSwSSLHATht3jW8/BigF+ydPbwnUoxYoNdyvuv9Tu8M6
ku5A0z1dhUKtma40Fv4By/Hi/JTvDzsvrsLijY4swvVM68VzKLcMjb3aF+/6tRQR
cqjplsrZy+IDBoL/nMEPAq3kmw3s1mfA+qy09rl3HluSrtttQpgc+4P9nive91ya
3AtaV4ZXUcLO9Vl56N8FJMTNukwvAap/7Esmz4HkE/krFrZQgw9gQ9eabyGYXrp8
c1yazMgTKz2wIXNqHiSVzQPmtkgXANKYgfVJYkuUIAka/f2IUg6bQi6A6k2dYCnU
eYOO9HzecZXFjLn2X1CUfpF2eWztROk7be5G9tF81FZ8Z+Xchy/5dAj3NbG5C8Av
zZOS9yTFPCsTV0V7VW2s7WYIZ2VThodPcry/wOQnm9mRgURtaeUQMc7/r1y6lk4b
2hihrdFS7CbGEvCy+d0QzDOwLReCAWHo62ADEgQDwPABC6d5lCrW2lfQtNPZWDxR
GajxV56Mx4oqdrD4gcIZqvL7LZWpGWIKar8BGj8ns48FAwhPNJUyaLyt8DFTYqD2
O3E99gDRzQpOHmKmAbOUTkGTtJuNwAJHcBMemAqZ80HFsivHe/wAKt4GVwuZDh5a
tibvO98UfyqlbJ8mEBnYcRykOrCQl7ZIrwakQyuEkhKfYwl5Tcc=
=7ZCw
-----END PGP SIGNATURE-----

--1Fp8NoEhRuznlFAk--
