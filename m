Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE934200992
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jun 2020 15:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgFSNK3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Jun 2020 09:10:29 -0400
Received: from sauhun.de ([88.99.104.3]:57106 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbgFSNK3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Jun 2020 09:10:29 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        by pokefinder.org (Postfix) with ESMTPSA id 94BD22C205E;
        Fri, 19 Jun 2020 15:10:26 +0200 (CEST)
Date:   Fri, 19 Jun 2020 15:10:26 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-i2c@vger.kernel.org, robert.foss@linaro.org
Subject: Re: [PATCH v2] MAINTAINERS: Add robert and myself as qcom i2c cci
 maintainers
Message-ID: <20200619131026.GA20493@kunai>
References: <1592561864-6406-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <1592561864-6406-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 19, 2020 at 12:17:44PM +0200, Loic Poulain wrote:
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Was there a difference between V1 and V2?

Fixed this checkpatch warning:

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic order
#22: FILE: MAINTAINERS:14033:
+F:	drivers/i2c/busses/i2c-qcom-cci.c
+F:	Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

But mainly: thanks for stepping up!

Applied to for-current, thanks!


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7suT4ACgkQFA3kzBSg
KbY4aw/+KqtTvB+Rf8v7GjuB4TvsVBdD14QFXLD4dKN138iTvLeFvHcB/rD7enmv
GBMgCRbR1a7u9qrY0RFzNz5RxJuvnW3mLuxGkEheEVoBU2w/ajt2bctdGHF1oHsb
kVMo+tQT7uuj+/UnkZS5b9trB63b7YJsP4uMqQbNIx1ZabV+EZykOlJvh3xqjMN6
uss3bJYPFus4Y08spY9MGhyDEE/wO/e9AkDuOg6hwsRH4tHNExiPkxj/Z44wiChR
xNDChqIJ+kvmWBVXKwFwRRTMaWdIFpC4I5RI761kDw6hGpBUOg0C5gx7XXy+uWXr
yFvJXkKCwSmUxK1WTassC2N3tPKOAEI9FTTmpRZUt2FMGMBRvx5V6Oc2Ce0arNj5
hgS9wOQqZa4gPemDIo+RgY9ffCbRmndzl8MJfrmeq2I/Gg8ESDJURUoJ2QX1Cno9
CpccDh3KqGH0i5Koayz5eebm4XrLQ2JrpnwcZ/jPxPBPIGt/jj9bm8sha21dv9Iv
6cyh9VoOXLNs+kxYKgszdjOyu1Lk5xeIaZXvV5nCdKPAZbFQtUT3esNjRDze33nc
Mo6Su7mL+Q2ABo5YNhe16UX8jWw8LWE5fpVMnj20JaU93owfPUF07TQ5ULj8xAdg
KizumEgFM8KqF4fRQDqiSRvcCHz99+v7dDPfR2Bj0NqHBEEJCCA=
=ccnZ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
