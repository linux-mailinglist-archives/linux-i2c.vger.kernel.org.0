Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4ADF251316
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgHYHX1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:23:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729301AbgHYHX0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:23:26 -0400
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B780820578;
        Tue, 25 Aug 2020 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598340206;
        bh=Wot+Np0GLyOzU+gmkDDw/WJJgyB2AmM4/4p+BnVMe1U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PALc3FehzdyPhF1SI5Dr7P4ua9q74t++DyMTmK0dVA4LovNWm+r6W1fAAnhfy+3Gi
         0xhZ8HB3wr+z4U9tvIOylWHTTscwI4Ipnf+i+okZjFdUKBpktAuona2U8lfFoE76OH
         rqPWJeH3HsJPaNU/CxDKa5xmkKYU3Ul/TzS4ktMM=
Date:   Tue, 25 Aug 2020 09:23:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: acpi: Remove dead code, i.e.
 i2c_acpi_match_device()
Message-ID: <20200825072323.GE1861@ninjato>
References: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
 <20200821170334.43555-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline
In-Reply-To: <20200821170334.43555-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 08:03:34PM +0300, Andy Shevchenko wrote:
> We have no users of i2c_acpi_match_device() anymore and seems
> will not have them in the future, thus remove dead code.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EvGsACgkQFA3kzBSg
KbYZlg//T1HmfkCkNB11atcH+9MXU/6JrowTrDXiuhu+rC3R1WQRbvpDt/1BT562
+QEXOyO2lYXqOdSMdg88B9e1Wzww3WwKNtgQrnUIRM8phupRVnlzmccBr4e1U1IK
Q1Jw0Tck/VFfLI4E9DeeQpV7z3cF6GJKiZv5inYjHybXoct3TsJ3mAHPNO5+QXqT
RzPR+9UpOC8gFEwH37Do2iR6NdvA13RpMpGB2OSiYVS/+puP/bo+XN8MQDyGyMeW
jmEyy9cCNkdtw3ShpH+K1v8yFWObkLXX4PfayWFw+YgPXyZzPSHYrGJ36sIxDfXs
dfjEon4oQPlvT9bykHsyolFzHK1MwwUEyz+D22f/kaiDPukn/q1h2+TnKRCga4dL
xBCxJeQZL7nERW2MrkoehcMOAUV2ylbGBNjiSkAH2djmYg7/8FiY8MIqMJlnMzUp
+PvOPqqzu16E/mBqov+szrAspiPt/bzsBPkjZD8qpz2sI2PXHP3U0OCY+QaCETd0
exsPEbLI3y7qwadBKQWq3Txzvbk+0GuudYjiJNgj8ooUfSx4vrvfyaMLSckti0vS
946HVzHHo2jievs0j2cXfGesNG/SRi2PjkkoIQFoQoBCMbcYL5xm/gO19Ir7mKOD
c7v8JEOOEY1uvLCmLQKxmfIFz2/nGWazArUpQAEqbAFg6q0aPLc=
=bPUP
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
