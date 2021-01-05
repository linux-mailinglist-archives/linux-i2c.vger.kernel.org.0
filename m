Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2A62EAEB4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 16:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbhAEPgU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 10:36:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:52958 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728273AbhAEPgU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 10:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=hBkt4Tpa6dR3X6Oi8ooA8vMI4cQs
        8XtCSGRVopoEM+I=; b=eFVtkQPQjqzSy6K5yLksAB6V4sFwxEPrCWLkWaZdvI+D
        9pPb641lq//Xich12nEDv0V3O5bgRADTW6HsyYpwLftHkPPrtvsI2BAwSFbugO0s
        iCSY2OcX/h6wwU2iziz5qZM27SF7a7kT+Jkrly+Trbapcyz/bWXHArXPVkG6pGI=
Received: (qmail 107864 invoked from network); 5 Jan 2021 16:35:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 16:35:38 +0100
X-UD-Smtp-Session: l3s3148p1@gxhe9Si4IOUgAwDPXyX1AEdA8SGgn5QT
Date:   Tue, 5 Jan 2021 16:35:38 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 4/4] i2c: rcar: protect against supurious interrupts on
 V3U
Message-ID: <20210105153538.GF1842@ninjato>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
 <20201223172154.34462-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline
In-Reply-To: <20201223172154.34462-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 06:21:54PM +0100, Wolfram Sang wrote:
> V3U creates spurious interrupts which we need to handle. This costs time
> until BUS_PHASE_DATA can be activated which is problematic for Gen2 SoCs
> and earlier. Because of this we introduce two interrupt handlers here
> which will call a generic main irq function once the timing critical
> stuff is done.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0h0oACgkQFA3kzBSg
KbaxKA/7BWFuMbWwf38AA47rW1/8h78R+AHF65sZALkLHs+zK62lwWDPrHyLtbBh
GvLd8BGZwrsdP16iV7CE+Aztw9tdPY+H5oNPu/UUUDfJeASx40LO0JPsxdW7FWbW
xax4tnQOJYXhvy9nr0zchEJnlrY5/rgir05XraPPcS8XaNAGF4Hs32qGf0em15DL
sFjqlpU8fBTTqLBQKZ8cqZXe6Nx9Py3P0cI4vBb4KQ8gklKuydkENPRDpMfSBol3
6+Q0qIg40JDkjH1y2NiTxLdGhsYQF7NU4Z7gPjjDgdEjchax5PZtivEaFT0z6fDY
rBSHWZVcm/2jJD5dlNVNxHmS/o6GoBk66sAcx16BN1aZfaREHrBCyDLTxX/no2Jd
SEhZf9VabnTuzFc8ntEErchmjjnhZZxW4uVYVZXgG55Php0SuDOM9X8NMFB3S6mW
2uCW3q15w6eXPwYQR8hm/8JBmj514IvJAXlnf9PtQe7GmsoXEHRfR18hJtolt8al
yr/CbC8TA3/YNlPwo/W/qa8T0fyZl4TyobbGjUzArUER8Yg+yQS4+G4WCLklDWCr
pW5bboA5+NPCLBEILfZcIEP24YpcNleICr9YyxHrl5JaHr201B0CgXT/HzDGvzwG
GKnlX4ZY+cdRIzlamwKdzSTStmPxD7lESBGmhS0n6MVwKl2wwi0=
=EDYF
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
