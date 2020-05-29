Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DA61E7B0E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 12:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2K6i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 06:58:38 -0400
Received: from sauhun.de ([88.99.104.3]:48958 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2K6i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 May 2020 06:58:38 -0400
Received: from localhost (p54b33184.dip0.t-ipconnect.de [84.179.49.132])
        by pokefinder.org (Postfix) with ESMTPSA id 10E282C2034;
        Fri, 29 May 2020 12:58:36 +0200 (CEST)
Date:   Fri, 29 May 2020 12:58:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: smbus: Add a way to instantiate SPD EEPROMs
 automatically
Message-ID: <20200529105834.GB3417@ninjato>
References: <20200316112224.0eaeb925@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <20200316112224.0eaeb925@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 11:22:24AM +0100, Jean Delvare wrote:
> In simple cases we can instantiate SPD EEPROMs on the SMBus
> automatically. Start with just DDR2, DDR3 and DDR4 on x86 for now,
> and only for systems with no more than 4 memory slots. These
> limitations may be lifted later.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Wolfram Sang <wsa@the-dreams.de>

Applied to for-next, thanks!


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Q6toACgkQFA3kzBSg
KbbXUA//fkcbtgMSVTGOcdWuxRQqb6nPrM7eMDw05FaDKxfYKhJUm/tPzPj16RdA
KgWIQ1ULqhj+HpDL3v2SO86QvroQBdSQlY5tEHyN1x0UIARW0OLD9oLApwgBxsf/
wXmi53UFNIAqF43Z1KUMVvuJlAV9mtDB3gmwnbpIiA3qdh1TgyIpgHVC15Ov0+MI
ufQZ5aPcrhhfmqnFGNOW3bRsedVympZD+wbu2aOlYsmEfFfPJwC/AQhNlZn2fYI1
do1pwJGdu4grrk+/RO1H/JW75yHTSZhGXm96WIydYm/aoCYn+vSoYP56ywN8ZYVd
zWgE/AkbRlDAHfZ19nfIJ9gttC1iTt0cJBRHkjyNy4RbbkK/P97pEujtaKeio89j
pvrwk3vhwdQE2iHcfPPW6+3P6J55ivpgHbIc3jg/i8EQrNQVzuLez1X4paI1M196
FYHjXwKBJy60VwUBX2HZVZpCnrNJgCW0nSODqDSbZdDRZAgp0ri211Bb3/RmWTNk
PO01xZ1A7bb3gAL/+BkQQ/73NShfzn7ozTW6+V8jffzLQnhha+7o4a8ZjyMdQj9o
nACor8n1xqKHCztmuc+NBLBYwyix4pexIWIfPOBvBi9ej5nvFT4vgeYvgq1zwkgd
4vdX3fq2ixX6P/iNHryqPW80B4Mz2mCab2EqnF2qYi5guN9zX6c=
=9mME
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
