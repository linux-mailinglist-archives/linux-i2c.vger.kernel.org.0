Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1131346B90
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfFNVLc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:11:32 -0400
Received: from sauhun.de ([88.99.104.3]:57162 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbfFNVLc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 17:11:32 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id E3A492CF690;
        Fri, 14 Jun 2019 23:11:29 +0200 (CEST)
Date:   Fri, 14 Jun 2019 23:11:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Message-ID: <20190614211129.GG17899@ninjato>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
Content-Disposition: inline
In-Reply-To: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 10:37:47PM -0700, Bitan Biswas wrote:
> Post suspend I2C registers have power on reset values. Before any
> transfer initialize I2C registers to prevent I2C transfer timeout
> and implement suspend and resume callbacks needed. Fix below errors
> post suspend:
>=20
> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>=20
> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, p=
arent: i2c-1
> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns -=
110
> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 aft=
er 127152 usecs
> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>=20
> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>=20
> Remove i2c bus lock-unlock calls in resume callback as i2c_mark_adapter_*
> (suspended-resumed) help ensure i2c core calls from client are not
> executed before i2c-tegra resume.
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>

Applied to for-next, thanks!

Without a maintainer ack, this is an exception this time. Should we add
Dmitry as another maintainer or reviewer at least?


--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EDYEACgkQFA3kzBSg
KbatyRAAq25OtkV3cyL//wLtpPgiZySC7XMTWyb09F1aXkX69Iz9IQdZYmIhMc4d
Ro1OEv1h2R4sS+iN6LAVWyjyA2VyYKYTPmu8ap64AcEulRgW8RRXYOByMc/6ZuNn
PSVJhy3yTyyPaFugZBrKtd1I6pwZ0RIzaDkgFIBYYRmP9vZzKU2k0LowgNlUcatp
3rJUMfmZtsZgTWEinbIGTJO6qW9joHdB320mGaS2rEoAVZDu4HNBV/+y9AZzstXT
/2I5iXRp+/YCDhy0nek0X8joT5WMFMUwaCY9nGmkZ8eLEi0SNW/7f1u/zRlRgNEf
BLsnphrzIsTaDUIfvs4+hv9Pe34lBZPuhMGnxw55jQePhcOSbIdHIWkhlYQ+56k6
LraTrKh0NuYSV9kPbaTB8CI2bT/BZ3cXpseMUSuaYNVBRjaUDWNe+f4YT33corgx
RCLdIRvmnRcIRkIoJit/zAO6rPvCeLsjOc6msSkwdDulAKkX8A7O//6X1zJbwkS7
B22J0WMP12JUCx7Wis4DVYcZFs+5PKSbKe+0woRavBltd6DmRD5M/ilYt3l59yci
L7EgB3lYyS7CLjd74tpqJ+XW+DNe5nX4ssrwDFMK5KPWYvOjCWxjC3Qq7jMyVWTA
77GMA8UB+dLdyvNXpi5Kozgy7ud46IXWtg8gihcUIVd5HEU9Mco=
=SrVB
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
