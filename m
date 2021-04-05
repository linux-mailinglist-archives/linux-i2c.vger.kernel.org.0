Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2124C3547ED
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 22:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbhDEU7n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 16:59:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237300AbhDEU7m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 16:59:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB186613C9;
        Mon,  5 Apr 2021 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617656376;
        bh=TOXP82cSi7pZ/YRoA63Y3vzvnmkHd+JRrUjlSNEhEMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XVl2M99ABHEe63e6zsv9igyEzYgtY0wuDjZ40WPLw+aii6P8suCWweZVpD/ceyMv/
         dCPjIMW9HO+QCMHp8/yVivHBJc3rioLMjlse/9CsfE0ii70UwrMeSw4J1K4rBbhK5/
         6n3x1qUW1PLqOFo5/BhVt95w2vmVj1us8MHWllna9IEHA7QY2lmEttJKqnmtD6uZl0
         ObSVbkPTVYJJmiQifuc//nNTBmTahhMfBIAmzZN2AAOFU7wZ1Gt/zq/drdbf5UlLhK
         8CoiIO/cptwQq6eQixM+9axBMriUlHq60Ni9bGDg21jPLJOD2dA1W7zMPN9yS8nohb
         wwZa6O90h6wJw==
Date:   Mon, 5 Apr 2021 22:59:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 0/2] mfd: =?utf-8?Q?intel=5F?=
 =?utf-8?B?cXVhcmtfaTJjX2dwaW86IENvdmVydCBJwrJD?= part to software nodes
Message-ID: <20210405205928.GF3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline
In-Reply-To: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> driver). In any case I guess the procedure is pretty much standard, i.e. Lee
> creates an immutable branch that Wolfram can pull into his tree.

Yes, that would be my favourite.


--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBrei8ACgkQFA3kzBSg
KbbINg/8CVcD5Av5Vyw5BckeTQ3ASOHMQGAH0Zz5UnB2mjKpbgUV2vuWjyfG5JqA
5EosQoOsEa7080Yc6wtmRJw5tCM8y+MDLVO9b2XW1w5+rmM6+XOI19rq2eQ87fO2
Mni/Jt80tC/N2AFwe23ztMAokv61mm9RymmBopcI8kFojhyJ3h3fBzUth08PS9l6
gRakCpIt/mp4MVbLXk/wJBg0sJpsN79eZA81ibCf6rtHgwwGymtofSCfcqWn8Hx9
IH5Cj508frGeINRkpV16Xk6mIb8Owmg8R1EEn4dEwFU5+CJjIWphcWBZbrumc7F2
DmzZlBoLmgeFroL4mq7Hi8czqAs5NMm0Fcv1OIj0shSgErMD/II1xCDKHHabO5wg
Rqn1EKijzEW1qOTAk7xOuvIWMteNv99gbKJMbsvW/tqYBmcZU9JpCZzJdu9ewdYO
5oERaEIuLPYqSsJWs+TzQG6+V4nyAENx9cQ8l97lgz0qe4BSWdn+pbnykCRKYKAi
WNlWCgm733fzOpJZVZdSja2d3sOQsL371PAqIIqI2FeU2wBza3gHpgcjhLrFCblP
eY2YYDctKl7ls/NIlfTdYH3vOHXs18EuNqOIGTTxQQIQr8pjUmIjDwFQVvWLEezL
wUTOInt1+IG7dtM/tws1Ju7GIkMuIho3uMIfVQsjRZX3T/RA8fU=
=hGu1
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--
