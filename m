Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A185BA27D2
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2UVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:21:00 -0400
Received: from sauhun.de ([88.99.104.3]:43238 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbfH2UVA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:21:00 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id AC0692C001C;
        Thu, 29 Aug 2019 22:20:58 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:20:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Andrew Cooks <acooks@rationali.st>,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 2/3] i2c: piix4: Fix probing of reserved ports on AMD
 Family 16h Model 30h
Message-ID: <20190829202058.GR3740@ninjato>
References: <20190802145109.38dd4045@endymion>
 <20190802145438.601c9a8c@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sxhug0Teuf3tiWmo"
Content-Disposition: inline
In-Reply-To: <20190802145438.601c9a8c@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sxhug0Teuf3tiWmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 02:54:38PM +0200, Jean Delvare wrote:
> Prevent bus timeouts and resets on Family 16h Model 30h by not probing
> reserved Ports 3 and 4.
>=20
> According to the AMD BIOS and Kernel Developer's Guides (BKDG), Port 3
> and Port 4 are reserved on the following devices:
>  - Family 15h Model 60h-6Fh
>  - Family 15h Model 70h-7Fh
>  - Family 16h Model 30h-3Fh
>=20
> Based on earlier work by Andrew Cooks.
>=20
> Reported-by: Andrew Cooks <andrew.cooks@opengear.com>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

I wondered if this wasn't also for-current material (it saves timeouts),
but trusting Jean's judgement here.

Applied to for-next, thanks!


--sxhug0Teuf3tiWmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oM6oACgkQFA3kzBSg
KbZjTRAAl7A828oHMkIZYP1so38acetYDVlG4SIK/LxwUJnWRJJ3EZVM67yF4XBn
JkHcT34lt766VK1Q+iIVVpPjaAZBq4/noU925K2HEsSS1rK8SgyNfodrOjnTMOEs
xAN7svzMX/ymHxPj4dn1Ka7Jxp9/F1iA8/J7QkZ9q6X1B9M08S6Hez519TPV99QM
RjsoGvD4m70N+WVRswy4Ld2oois7YToDwmMkhF8Z/p0tL7+R6MsTuEN6FXjKwNqt
vpqQjs1iDamnuJ+e1ADTpDx0bgwS1IXHMCa8ievajCn5lXYkj2uS/CbimPW1u9tq
TW07yy3Vq3Qff5RJgYiPXynKA08LUwEu5sbiVdr1EKlgh9djYWvzLCjDh4mtS85U
sA5iVSOXxAiBxpUplw64qQU7FjEFF0SA4Ie/Nt0OqIluG9gYChYet3P+7ctqxSbh
4l5KbN2a2ieCpwNz3KMpfg4yI+t47Y7XZwRe+k0LgR9kWpWy/I+0LPwRLSPUvWrV
/977Xo0QxED/D6AegTzR3lFQx4H7nO34DP19qjM/d6hCxoCliyHeG0iKXh8ZcG0y
1QHgytEMmgFeXEIu9717L56Y4Iy/C7ENi27xWtGXBqR3tJy6J7OJhWyWoWP/XEeD
idcXI1qrcq6BENy63Tvc737i+3safn9hwe/wbByyIiUT5uo/SCw=
=tvbj
-----END PGP SIGNATURE-----

--sxhug0Teuf3tiWmo--
