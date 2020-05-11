Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C1D1CE4E8
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 21:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgEKT7T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 15:59:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:40530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727873AbgEKT7T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 May 2020 15:59:19 -0400
Received: from localhost (p54B33735.dip0.t-ipconnect.de [84.179.55.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 136DD206F5;
        Mon, 11 May 2020 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589227158;
        bh=HM+YoZKB34Fmroflmufsz6/JtWFVnCSPEzzO4iTRINo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=psjHFr0/pHZ92YwADXf7hBRaIz8NSUQCjomzBq17LGOyzzQ2Qta4ibPFy/oxdtiim
         6C3IZybAcTY7ooeK517rP9ZrtkSSIdTWBhPXUMJa8AQoBCjUrMdP8/Aji1ZDr/AZz7
         d8A4MzTUKg+UD/um5FkKlOXAx758QeOYAU38ZOng=
Date:   Mon, 11 May 2020 21:59:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/4] i2c: pxa: consolidate i2c_pxa_*xfer() implementations
Message-ID: <20200511195915.GC8724@ninjato>
References: <20200506092831.GN1551@shell.armlinux.org.uk>
 <E1jWGMa-0000N1-L6@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline
In-Reply-To: <E1jWGMa-0000N1-L6@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 10:29:12AM +0100, Russell King wrote:
> Most of i2c_pxa_pio_xfer() and i2c_pxa_xfer() are identical; the only
> differences are that i2c_pxa_pio_xfer() may reset the bus, and they
> use different underlying transfer functions. The retry loop is the
> same. Consolidate these two functions.
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Fails to build here:

In file included from ./include/linux/device.h:15,
                 from ./include/linux/acpi.h:15,
                 from ./include/linux/i2c.h:13,
                 from drivers/i2c/busses/i2c-pxa.c:23:
drivers/i2c/busses/i2c-pxa.c: In function =E2=80=98i2c_pxa_internal_xfer=E2=
=80=99:
drivers/i2c/busses/i2c-pxa.c:1118:13: error: =E2=80=98adap=E2=80=99 undecla=
red (first use in this function); did you mean =E2=80=98vmap=E2=80=99?
    dev_dbg(&adap->dev, "Retrying transmission\n");


--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl65ro0ACgkQFA3kzBSg
KbZMww//SGA7k1sft7xZZV6KZpWAiS4XInPv2P4fthMDgRNqBmNep4N0aN0U97eR
gloV3pCnSbJQLKYI+xmyF2O7IRiqp+B0hkLz2gVZnNfd6/57sKlUO6hgd1QUlcbq
UipMH5G/I3sFX788CDTn2jnlfu94oC6QpG2WrsbY0DXxaAVxMS5HxVc/vPHTfVay
YpM0ayFPP++6k9qDEa6c57ukGNmCt04ccQZFlw+D+q83C1hbCqDTW5sLMkeG1L9U
YW82b/eUHiUfqMNQy/24CJGCxVYOqDotPuSwk3KcC8Nf8DCe2+RG6XPkrsG74feB
224XEqxX7IxpSTh+NeheFiSU4Qp4+MPaGRmA3nROneW4aAx2WIaQvCxfZXVFtVjO
Z4wf5RHbfUNiLDiGdVSPhqDJiSyYu3UMN9z8i3Qo0y9pwt8so7ACLT0cIzaIoMDv
IJ4WyEOkd8k9uMT0kccJ7M4eND2IfYqMe4xUIR+xvL9dBogLQB3ywwVU9zEf9Cli
A5Tglmy9ZG30ROH4iogVUDQt7H89le6k2Iyy//m367l8ChFvubi5M/hXrulRm5NC
sK/GyyKmMP4GyKXwWtqvKnueUOCTcijDT23dKYZzvFFCV/doZLwGArozMNQ729Lt
acgZAdBJAXcSf3rJLP4ZvPmaTXfKMykFqaOfWqrCnr4VUGWed34=
=Ile4
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
