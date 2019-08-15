Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2F78E542
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 09:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbfHOHMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 03:12:31 -0400
Received: from sauhun.de ([88.99.104.3]:58504 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730121AbfHOHMb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Aug 2019 03:12:31 -0400
Received: from localhost (p54B33431.dip0.t-ipconnect.de [84.179.52.49])
        by pokefinder.org (Postfix) with ESMTPSA id 384F32C2704;
        Thu, 15 Aug 2019 09:12:29 +0200 (CEST)
Date:   Thu, 15 Aug 2019 09:12:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH v2 1/4] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
Message-ID: <20190815071228.GA1054@kunai>
References: <20190812235237.21797-1-max@enpas.org>
 <20190814194714.GB9756@kunai>
 <f33ef44e-61e8-0392-7f5c-5a0bd7b42fff@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <f33ef44e-61e8-0392-7f5c-5a0bd7b42fff@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I kept it in because i2c-elektor also exposes it in the same way, and
> it seems useful.

Yeah, I noticed. I don't know how useful it is in practice (same for the
getown callback) but I don't have better ideas, so let's just keep this
to be consistent.

> > Your SPDX header says GPL 2.0 only.
>=20
> Thanks! I'll change it to "GPL v2", but unfortunately there is no
> option for "only" in include/linux/module.h.

That's the correct option.

Thanks!


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1VBdgACgkQFA3kzBSg
KbZzuxAAhRPA+wt/Pg3SLLAnPHGwfDuJSXks2IBSp1ULDxYl2Bk2oy8ytkWwBzCE
nEPUpfi4z2rnWTs7HxlG3DDIJb3ZNU4J4ZQPyz/H8MtTOgUHa03uWelac1C3/QWF
fk4O4G5h1YHBQcYtvfqjjXyJYdLUHFkj89J0LOp6ij2bU233NSK0H1EXR8zeKKtK
taJeBnY2zpH1z55iLUDWX7pa0hn+qDmutyuhDyh42eor2y0gOBKzAtL0M233K8ct
KI9BXNlxe8cHecegJbpBzUmfy4UkGLPorlbk2Rk6v5pYw/4BaNh+WYq7bDybb46N
tlu4Y84TNIwezVOBBBiZs+K+8WkOKOQVl7E//cQ50kSJwCsjRs05N+lhxhWbXI94
VzYXyDnrgiMGitdHrijAOqz0g9ZfV+kxwr4DaEAciKIeyukkEp8m/+oDj2w4x8AD
pfBvzQi3KN4gbXgtnwpfmFFSC6WNQFZXFQ/MdsrLeqYBguJRlTIhUXq6g8AVjfMH
peqioG8ZQ8RX8zLA/+C0kzXTM8Gvl9E1khHEDx9rQFMPo/7Ps5JndnJOB4cFzaFl
voo8uV+/2xIei44c1IOAevhLmF/Fv0Ep10vScpkbIQcEkrW43ju/8LVUnsxWFT5i
NGAhtqAjm0NPKxbk1TI6WfDko1a6OqaR/H8CG3G287jynqQjnu8=
=xppG
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
