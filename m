Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9414C3E93D7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbhHKOoa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:44:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232565AbhHKOo3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:44:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73D3D60E93;
        Wed, 11 Aug 2021 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628693046;
        bh=dGOt1cYomh8yokgWuxB0xfISG6IQh8JAyOZf3l6hW/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cZbCNhWZGEeHVpWwjmuyYQBmC0OE/saECY4IcbvRbTO+sN10qEWJM7P1CV6geyatt
         POMp/QoksyoLQfYd27wKLJ3ObX2LZ2qU8G2YZPJbk0/J6Ve5Ugpig5NmrIhIQ6ttfm
         mCWclo1Bys4PdC7eO07QTrMntsR70rwxYJUnZgzZ/7j6KwtfNm3G07cZt3lT/Lfdt7
         WLk+A6D88P2lw2qOXCikpR7yD7PvOx2Qvv9vxs2lJbm7i0tAKr42rxHJnukHOywp7w
         0Y0ZaChMIdPcO3z5TkV4TWnIrn34KvZ2qukZsB4y5bHIJNwEI5NIDVwFBOgtXw70pw
         uwFr5VtAcPZ0g==
Date:   Wed, 11 Aug 2021 16:44:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/3] units: Add SI metric prefix definitions
Message-ID: <YRPiM4y/eSB0F7jy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lFgNly8v2zNB5wC0"
Content-Disposition: inline
In-Reply-To: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lFgNly8v2zNB5wC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:20:25PM +0300, Andy Shevchenko wrote:
> Sometimes it's useful to have well-defined SI metric prefix to be used
> to self-describe the formulas or equations.
>=20
> List most popular ones in the units.h.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--lFgNly8v2zNB5wC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET4jIACgkQFA3kzBSg
KbZufxAAksUlFAiJDB9zxnMbqyPTFFKJpy5c/wVFRR3iQBLxymOXR9QJLh27MhNx
Vp+mAv9LzDe7aQQYFTWzDBPXIsZLeq62wIyGHyJGP6YpQAdL15yEOzhHU9fqjB2E
lrKhjyx97hfXGghtUCPtYO2//ucqHvydMgnMBjHCkPo1lw+jry0C5J+l+Mz2FqSB
e2N20KnmyKJwiQtlvH4PYrNM/M2Syz3HK1ObZwvxeH1BxuyTRsG1qBVUax/LYHAl
eghtFD2q7fTMIYAHcokO7EV6srsCb3sJXB2MsdYKY+2rIKgL3qtJjPBABeL9FR7n
HGW6+j9E+87bqjZxshXL+w08N8avSqwp/whasv5ExVScBdJ68Mz2melm3EKa+EVE
lfGaAb+vTrGL/D5Q4O8g/KX+bLyfODHo3I1x4O7ZSRK5Z0SkmcpyFPBY+axekEfz
q8C9UnTon6lDW5Lhmjuihpuo5GtcbiJEs9J6FZqpRzDyWM0/1c2mdwLt4V2YduRD
2FKQHUgw7jDYdsIQJOC2DHy5c3/0A/QrG7H6flBF5DR7en0Mb7CGcamL6UutYLKG
OynYB2HTaF3t07a/r78lsN3m53wv63tPWeAOLiX56FcIrYyD+SJkcdWm/pLR7Goi
1LaBEN4SIZwAAzKoIOqXyzMIclzUuNyjwJC9OmLIn4s4V1kTv6E=
=FcKA
-----END PGP SIGNATURE-----

--lFgNly8v2zNB5wC0--
