Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEA23B4F37
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Jun 2021 17:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbhFZPcv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Jun 2021 11:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhFZPcv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Jun 2021 11:32:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12A0C61627;
        Sat, 26 Jun 2021 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624721428;
        bh=2UxB53HP75l/vNHDJAp80mRZXu0ELhhNcYaBvs1m6ws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CRtrx/dinH0isTGYQJxRHI2a+qjA8V1bLxqqDA4OGwEj6ucTzCDDDMkHOHrCq+kHi
         MxFzgYEyOiFJvu0lBRU5pgV9q+bLcQjiDrA+HjluEOyCnKT4HaiqrVju6KEKor8+qX
         0DGEnVRinQc9J6juGuSp9qwnqQQC2Eqfx3w0hgDwZHHEeCYdCHz1Ir4hn98rum8acX
         1aFPMBgjvWSYIjDw+nFp/XvGNeFe6bnMKx0iSOk0FregRshnbZDmMkq4P9I226HVvn
         bisPSe0lUgNNTTPeDr0vt6T1fcbSOqwoM6pA5g4sM8sAOKsNA2ACxsgDNUTj7mh2J7
         bJ6Dx/ljyyJLg==
Date:   Sat, 26 Jun 2021 17:30:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Crestez Dan Leonard <leonard.crestez@intel.com>
Subject: Re: [PATCH 0/7] Rework block read support among i2cget and i2cdump
Message-ID: <YNdIEUpBoToGN7JY@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Crestez Dan Leonard <leonard.crestez@intel.com>
References: <20210608172338.0cf520a1@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BsviPprBJodQtJHb"
Content-Disposition: inline
In-Reply-To: <20210608172338.0cf520a1@endymion>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BsviPprBJodQtJHb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean,

> The idea would be to get the first 6 patches in the upcoming i2c-tools
> v4.3, and apply the 7th patch "later" (either immediately after that
> release, or some time later, I'm not sure).

I agree with this approach.

I had a glimpse at the patches and think they look good so far. I would
have squashed patches 1+2, but this minor, of course. I'll try to test
them this weekend, too. Let's see...


--BsviPprBJodQtJHb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDXSA0ACgkQFA3kzBSg
Kbaw2A//V5Iv5+6frfm2Cvbr6e0PgX1A/FlIZxfEwxBYe9Iagnhv77vMNjuSulb+
ATlO6cndbt79B9etJ2PLAhA+AvwvaeqZe+XrKZ1NLf0gKurLZ8WDrnhsvplIFRRE
yW1tWE754tZqNaw8k3NuH0fnOyg9eqlactTq+qwXy6CkPco1JzUakN502s1dGLRZ
ecWAU1sJRLxVONS5peU3vRlZjz+SgozVhkm3koo93WQjUPwLZikatDf0tQDeUMHH
cvp7G35tVgG5Viz5FvnzJU6MxTCvMLiHI/BJF+X+IvRqSS4/+53NySzJ/OXxYIvh
PaBLFqVLWOCfcpp49H4EIolHauEn2fd9MP80Gb54a2ltmGm78ZOmrM+4cRYp7LpO
7ZyfW/GGDFAGmXewSDniE4DT6Q2WtIgYnFrib/yXQHb6u6+lADPcg8NYh5UY8Pz6
oVnpJwhbPD++IocaeE/hefPhy2WLtPI2jdUVJVol6no3pMjPjqSme/xtSaakN9dx
oRFU/mYs+ePA4ZifEFMBaYr6AC6kU7WmH+8BIc7oyxLwsOX7IAnHH+UPPoNcoTsp
PDivEgZJi+paSbh9Rqgs7m1otaJd5YolVSsYCQbJKNyNCYDygZjk04yePQCEW+9Q
zjlQQjKCRPwYqm/Yt3ueYUu7A9T+H7COWW+AeqanAlR0oBZ/Xl4=
=rjDs
-----END PGP SIGNATURE-----

--BsviPprBJodQtJHb--
