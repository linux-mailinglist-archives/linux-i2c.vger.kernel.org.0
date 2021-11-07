Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D85C447328
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Nov 2021 14:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhKGN7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Nov 2021 08:59:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:38410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232018AbhKGN7U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Nov 2021 08:59:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5546A610CB;
        Sun,  7 Nov 2021 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636293393;
        bh=ntcOaB39mE90ziGkA5DJC7KRvRLFm+eOIDtFf3JWZcY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ny0enYILNur8/0L0xMWrtwCT5blgiBiOR/EZyi3Gz3+/OevH/sQQSrMTBNogglRWq
         JYMXsLWZurBDKlMrlMWU3YB9/+flBhkV06/H8VeUjA+Nw6lvBGiqzdjRxNNzfz2/Z2
         Gr6o/TyxvI9J5v1R8wJMDh0ohwGLkDTJ0ipzY4puNcNFGRxRYpYULePpcKO65sH/9i
         YkEsHP5GpchmfUOpaCAlvTiBlBDwNnyCQA5Pv7JDKc4A0hldynJOIXRnMTgc6+YADn
         rcmBRK1Df7bHeZ4EJ5K3GQ3QkmQDgUsgqHnRVhJLaiW/eReJm1lOa/Y7nAT7hWrvnV
         tu+iFhbf7cxzw==
Date:   Sun, 7 Nov 2021 14:56:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Did "i2c: i801: Add support for Intel Ice Lake PCH-N" get lost?
Message-ID: <YYfbByTeYeCr26gD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <bd689d60-f197-3509-f259-789aae28d88a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z4iA/pO/TVqkUXvt"
Content-Disposition: inline
In-Reply-To: <bd689d60-f197-3509-f259-789aae28d88a@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z4iA/pO/TVqkUXvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

On Sun, Nov 07, 2021 at 01:09:11PM +0100, Heiner Kallweit wrote:
> According to patchwork history here the patch was applied to for-next on Oct 17th.
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20211001172154.15660-1-andriy.shevchenko@linux.intel.com/
> However I don't see the patch in i2c/for-next and linux-next.
> Did it get lost somewhere?

Uh, seems you are right. Sorry, I don't have an explanation for this. No
idea how it happened. So, lots of thanks for reporting it. I added it
to for-mergewindow again.

I'll double check that I didn't lose other patches from around that
time...

Kind regards,

   Wolfram


--z4iA/pO/TVqkUXvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGH2wAACgkQFA3kzBSg
KbYaOQ//YYQgj+t1Q/4QAXiEguqWqODXCqaFPgmJvbkTmHny9EP8nm+EYs/rHIGf
dzbKsiAKrJVYbRspv6+H28PpBcHi7GzFxft2SjlaCwisOsE8IuQEbdn6V3/6boCr
YLvolbfF4aK2GVBnAiocV1z+e4ZlHY7yvg6ouhs24pazF6tfhBlgTpynUfuqeXcC
k7Am4tQ0VLqwZKpldB9q7nWtLL4ipADhsPdkwRMtx6cN+IUL8BV4a82n4EJ2xch3
JImwoeXYk769TDOOxnTehL6Td4MhY9BpQmSJENV2TcgYCKr18LvaYCY65wHfimN5
HdKzMXGhlkbl727/UkP35oBOEyOP6vLQO4jYCpFkthOT8W47Y7JYSWlMZ/q8/AVx
s6raR6pTIFBCSeiGzGySRiG6J1JzyqJ50gP7jgLuoG/vlbtOPjuSTbn4awgAhl8m
NPbUlMWY1FvCxwK4hiW3W+LiF+kdVrY4aT2QgxldKp2KuHGNL6NasSqsxrrKw+qn
mFpR5abikKMCbC64ZSsR4qAzfjfyTJWepD/04O0Se8/SjF6FpQ2LJimXaZUyRetZ
Cx4myDi5vQMBNFU//znj73BTcIMyQT7BjRSb49a3ug9AWr6vrj6XbiiGakCXDkhl
XtVbib8z/Zqnt9bwzCXR2giliiGAR6i5YltPwFJuGJc2ikjhdXI=
=QpuF
-----END PGP SIGNATURE-----

--z4iA/pO/TVqkUXvt--
