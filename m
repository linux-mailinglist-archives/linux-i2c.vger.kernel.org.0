Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03A22841D5
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 22:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgJEU4o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 16:56:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:36270 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgJEU4o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Oct 2020 16:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jCh73zm6FjGvc3ugF/VXfQNitZGD
        ydaHb4vZDZryESk=; b=AH2kMIuncc+OGbnrQ0upH4GzMHNYY5oDUZ9g7lLaJCfi
        2mzeiq7HZJze2dZOB6USZLEQmgsVmR+KFgnFMzMSFLGrPrRdxa1wV8nGxFiQEWLm
        Z3VPn4leLP+Mi+nfqXy2pn06kvMY5LqPD+khNyVB+8HibZ0OlN+uvc4f7POMVAc=
Received: (qmail 2370074 invoked from network); 5 Oct 2020 22:56:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2020 22:56:42 +0200
X-UD-Smtp-Session: l3s3148p1@mogyuPKwhLYgAwDPXwUgANl8elq/Sjdv
Date:   Mon, 5 Oct 2020 22:56:40 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: testunit: improve documentation
Message-ID: <20201005205640.GC1397@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200928110647.1791-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <20200928110647.1791-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 01:06:47PM +0200, Wolfram Sang wrote:
> Mention that new CMDs will be NACKed while the old one is still
> on-going, that the I2C address parameter of READ_BYTES is 7 bit only,
> and reword one paragraph to be more precise.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl97iIgACgkQFA3kzBSg
KbajOBAAjzsxDNRv5wBCwT5CTjZb7gf3tbiH4Iyu5ZXZOfcmLR1TWqes+HP21o8Z
8MqWO/mUIw8i7j8O/U5NM23Ca38eNhUfsDlR3HUAD98ngfqC4RPoq80m5Kt76qwA
qnVzhLTgYcGIo8DOutgfflXc3jAf49GdOtW2J/09kRhBOmcUGouhTFbpH+0EtApS
CDRwMIEpK6ukjfTJNv1IxlcX7jfM6lPDLcJn7HxUWJ15LAp+wvaEaG8gOIu1pswI
kFXK0xi75kTU7oE33LLQqBMvKkovEa05AR/bJGJLmxdFmdGKYYgm2haC/RDbMuGi
AJvCVMNyOao8LN2XYJw9wNyy+RRph2autehcfRrFXNSU8T6aLnBf+o9CQFJ8juoF
1Lru5dM9fNgHRzAXZVlhA+FUmeyn2dMWhngSn+XLI2lL2d34cXgLUDpwlcYwccSA
+PDqatJGGw3wuzLbYPdQLZ/gxQ305+FqWkLtXvUYwhnzqkAyLHMkem5ckhnC3gtf
U3pwUZC1UNHoI1ilNouHJGtTrrgglMjbiGT5hNAEoU1r3IboNc1OdslVHTPxM3mp
o07O0nAeAM4enPEX6itLivvo1GeziLPh1/hBQ1Q8l8YIVF2c5WmJRclC/qkRGlfp
JuvUrkLLtQc6hhi0Wp5/zCinZ5ZE8RQkR2lWnIFhNWXbUBh4JxY=
=nlap
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
