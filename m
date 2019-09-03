Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF6C0A71F2
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 19:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbfICRuf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 13:50:35 -0400
Received: from sauhun.de ([88.99.104.3]:56524 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbfICRuf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 13:50:35 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id F3F902C4F2F;
        Tue,  3 Sep 2019 19:50:32 +0200 (CEST)
Date:   Tue, 3 Sep 2019 19:50:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 1/2] watchdog: iTCO: Add support for Cannon Lake PCH
 iTCO
Message-ID: <20190903175032.GC2171@ninjato>
References: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
 <20190831142402.49736-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline
In-Reply-To: <20190831142402.49736-2-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2019 at 05:24:01PM +0300, Mika Westerberg wrote:
> In Intel Cannon Lake PCH the NO_REBOOT bit was moved from the private
> register space to be part of the TCO1_CNT register. For this reason
> introduce another version (6) that uses this register to set and clear
> NO_REBOOT bit.
>=20
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1up+gACgkQFA3kzBSg
Kba/qg/8C2X72+W7U9TjAqr2W8z5j6nwv5EcCVHM5RR0Q+Ubtmr1kKqNkAZncjjL
YLzz1SVQDJJznfWyXSGKPA/X0b7fb44cTFBPwh5GQpKxCywbGr/l9F2EiyAe+ro1
OaYiiy8JW4ikvLaaJT/JrKXgB/YVO1Ik5EaJNw42aK9yG1blDCpVDx9eK0E7C8n8
GwY9kTNVTDo2D9jP3vxa0IRj5I1MMrc7pdnHnVMpbiXVPv1pAqyiofJk4a8j27ZZ
cvg2ksKuw2AHVdB2rr4TeXOtu4J5BdJOeal+8sRUa4mXII0g2SM0qnPSCTUewwdl
4qios9NmJbMd+f+XrGVUyuCEuECHUEx0tosnHkZAizqsOtjeUSnUFGlZdlNcf/U9
Zz2Te/QczMxDFKDLMdMDWBDgXt+OSCh+5IrMLQWLgQbAvgWeDu1CDMj7+dB6Ivkc
xRqZJrTdmTFWzUKSJ8xjGvpqbywTXf/FsGNLSfsPMddX8+rtDoM7zyB5hgefHxv4
G4MR/TtIHvIIpC/8XEG6RyQDpKm0IIvpYqXVOW3WanqmmbowePUqcPeCOuhR/zuY
WL/NrvtnhWf87iimRbJq05w/HpWXOOZVAo0PCVINaYnGdHvxk9kldzIFgxrhfDgY
0P3AWBa3KWh5jK5fDlh71BPB9keYjGCwIsb/dPKQ4CHUd5F59G4=
=fHbE
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
