Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A79A23473B
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 15:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730706AbgGaNzc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 09:55:32 -0400
Received: from www.zeus03.de ([194.117.254.33]:36594 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732402AbgGaNzc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jul 2020 09:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=UowO9dFG8ngxMdaq5/AOFmxXrA6A
        eQawaeMQ0zmHxF4=; b=GpljosT9Ypquy0Qcromr280Wvy+KC6z4es7GuG9iafoL
        Xc6doXewqAWTmug2z9rrxmnDNws9PHfCti42W7t5QllKDVUrIk3C8AcK5eEWAJAn
        dh8xILiR4Y5rJ4vb3l7TEPYkRuA/4iehDk7asn5YHoINRCJhOisd9L42WIkG4QQ=
Received: (qmail 1608537 invoked from network); 31 Jul 2020 15:55:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jul 2020 15:55:30 +0200
X-UD-Smtp-Session: l3s3148p1@nAJWJL2rhOhQT+F6
Date:   Fri, 31 Jul 2020 15:55:30 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: Re: [PATCH] i2c: rcar: avoid race when unregistering slave
Message-ID: <20200731135530.GC1679@kunai>
References: <20200726161606.15315-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline
In-Reply-To: <20200726161606.15315-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2020 at 06:16:06PM +0200, Wolfram Sang wrote:
> Due to the lockless design of the driver, it is theoretically possible
> to access a NULL pointer, if a slave interrupt was running while we were
> unregistering the slave. To make this rock solid, disable the interrupt
> for a short time while we are clearing the interrupt_enable register.
> This patch is purely based on code inspection. The OOPS is super-hard to
> trigger because clearing SAR (the address) makes interrupts even more
> unlikely to happen as well. While here, reinit SCR to SDBS because this
> bit should always be set according to documentation. There is no effect,
> though, because the interface is disabled.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8kItEACgkQFA3kzBSg
Kba2aQ//fRf6nU1nrdjBSoh1xn8AYxG2COLDQLMxFYmJdV/TBziC0+QG4rieUhk9
KAdTu02ZAuKFPAzFryWEwoGKu1cDgXsM7OJdnlK3TVDu3LRKnEo4rctkspKnVuBp
VXL6nYyKCC4Uon0Vsq4RsonFk3V6Xp6X00xhVWOMAGbL9OizftDE3bbjnGtiL5ls
oqYqT9IkYalZUh6O6uLqZVAavcZ06yA0anemKEqkmvwf9w0+F5uiMt5TEktnceZf
H0Q4JCEwVW5iFT6o1yhRwo4H/1BqZAaXtqntj0/MXX2Gtzorpnsy28aWGYvLZIy7
8PEPPXCZN/s44q4DSdPBOokAPwtQ0Kdc2a4DUj5W0TRtLwRmB0B7SbG22MDAsNz/
dJ2ya4hPjZ+bh833+E6nVseR559cQ6yHheb5gvvjjxGLzCXBO2Ul3UnQqRVzmOOo
hLN7/FRmimS2gNi40a/DS0NdvhJuNS3hEjaHjzG80hRdfPn1v+bzF1X0in68bbtT
rrEfB4qh6IXXX9kqwgpU3B8JCKOPHLFZDyLSbIcYekh962Mx79rnlLHiCiisD5/y
CmCsHORRpseaX36vXcDLV9rMPXDyhqm8gywhrF61zasrzWKxhz6mRhfGPYuaziYw
AvsElvVTPGYzokf8op93geU1uKw4FHk12aONc90UTKAFBRwEnRQ=
=iKy9
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
