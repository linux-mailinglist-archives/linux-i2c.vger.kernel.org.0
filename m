Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8806248867E
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 22:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbiAHVtv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 16:49:51 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55030 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiAHVtv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 16:49:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3ABCEB80B9B;
        Sat,  8 Jan 2022 21:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4243EC36AE5;
        Sat,  8 Jan 2022 21:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641678588;
        bh=QJzWduRV0XXJmS+zFAvoRkFyeEQBm0h8/sDIkY0UrhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qwfBU2/k6DJwwavWbPsjV94HkbteNMrge/f1urb2Ml+gqL7eimHaAdE4SxdU6Bxcv
         RTXNwJCPaSLCavxis2SLEkzqvJNPCCTuOxVxoLQiD49JZfEjF4dkLSWjsbsP3l5zX5
         Z74i1LmiLALOlzdHl/0nsdO1OZIoEsS1yeChjVx1TQPI2q9qnfe/L8Ur2kvwvdwnIL
         CoH62tsstpAuKqZ6RYbMYp6jBR/b0MBCpqGyjY+3dB/kVv/QIVcoIrlUrh/t11NBRV
         7rtwzjXb6Ygfe4yFAodFtoxxhMjRVtDWUx6FE1fjt51BYHEL6/qOyLqv+VEhtZ9L2S
         XIczwpHcuXSjg==
Date:   Sat, 8 Jan 2022 22:49:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Terry.Bowman@amd.com, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas.lendacky@amd.com
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <YdoG+en5Z/MaS/wu@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Terry.Bowman@amd.com,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas.lendacky@amd.com
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
 <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pO8Sf19TDHcJTC4i"
Content-Disposition: inline
In-Reply-To: <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pO8Sf19TDHcJTC4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think you'll need approval from someone with authority to accept the
> suggested change in include/linux/ioport.h. No idea who that would be.

ioport.h has no dedicated maintainer. I would modify it via my tree if
we have enough review. I'd think Guenter, me, and maybe Andy
(Shevchenko), and Rafael should be a good crowd. So, I suggest to do
your v2 and add all these people to CC. It is usually easier to talk
about existing code.


--pO8Sf19TDHcJTC4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHaBvUACgkQFA3kzBSg
KbabVQ//fueRV5koTSX3RE3AVT7uA4O6RwpjY5YDbNgF6xD2JtJWUD3upGRN+Hn4
3ZrUjmQ7wfYLtBrDNFe+JzX1LchEzgOH6W1bVQgdglAaMom/K3zfXGcPql5NfNuf
eOhohD7PvLqG6ssJANvEPe3HQFKA8j6NCNNMH7kOSONDmUhIeIhG30pAqnXNa+1Q
/W7rVfDK55VrOUMJPHSC9VG1CJMm5/GsfhGKylXb5WgFquKc5N/n3/R0a/IPWLcw
YPH2KrmwCwBPV5ah2Jeyjrm05LmvCKUsMQT4tKshXxvFiXaEfdoCkmPrwFn8hya1
ZbqrciOyOr7lv2K3BRjTNjuOCIAwY4pTgx0+Tj9xXoUeASsBA27tYormUnckbzrz
Pqg//tHBzmHYBL4V/FlUKWlnmjlFC74b2zWnuHd4gycvtXC7Fx6kGTjD6JV2Y3qD
EYqv80ou1FFFFUbuhNz1g5FUOyVOHfDUi2ZECnkF77b3/iBYA3ThZMkiYiN/4Hvl
VmiDWqspsDsQ6AAwdLqsfm6bjVeUXiFchNr3qp2J/PAPsh5OG9xJpv7/GtJb1cyJ
vvCnb4wqwgF14F131omQ6E/gzWOFT/DZTAkb3N6J8yYCxCI23W8lFy7IgLhORIyL
cVL5lPyUAKrW7xlFcR3XrzkgmTGPnpMvFBYMSWiCReDm3nQMjSk=
=y7En
-----END PGP SIGNATURE-----

--pO8Sf19TDHcJTC4i--
