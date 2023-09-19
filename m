Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC3117A5D44
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjISJD3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 05:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbjISJD1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:03:27 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7D31B11A
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 02:03:20 -0700 (PDT)
Received: from localhost (dynamic-046-114-182-129.46.114.pool.telefonica.de [46.114.182.129])
        by pokefinder.org (Postfix) with ESMTPSA id E66CFA44892;
        Tue, 19 Sep 2023 11:03:17 +0200 (CEST)
Date:   Tue, 19 Sep 2023 11:03:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Matt Fleming <matt.fleming@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] i2c: i801: unregister tco_pdev in i801_probe() error path
Message-ID: <ZQlj1GXxXFEArJie@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Matt Fleming <matt.fleming@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
References: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nWFmj5yHiVN8gSxV"
Content-Disposition: inline
In-Reply-To: <458b1c8b-1885-6583-f45d-7548ce65bb33@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nWFmj5yHiVN8gSxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 11:08:44PM +0200, Heiner Kallweit wrote:
> We have to unregister tco_pdev also if i2c_add_adapter() fails.
>=20
> Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-current, thanks!


--nWFmj5yHiVN8gSxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJY9QACgkQFA3kzBSg
KbZ2RQ//WqcPJS09Okcf0oW8nBazB3RVJO1jzeTtGWswc89n7jDZhYz2Io8cVILb
PRCLJLHCTdFj/AUWnXqu7aV3nJQJ0g+VADXIUr0ncu4FMU9rCy74Kmki7ugFM0JZ
4WprOqXGibWyw2TGXs5Rznnt4MZC0qK6eiVmliLAzzR2j9HX+UCffvxRyk7rWAmi
6AiLUJTHSBIsVTmyOIqWvgzNvZ4cFa9+bAFG7cBCzyHh1SmW8j+6wHj3Cyxtjtpo
UiDHbTiBguDiR4sNiRQnP38f47FQnueBWY96bN3gEtYMPRcgwUxxJPCcQ+Lheter
TwTYgKJvFYd9NYjRuGUXeksvcUF6XQ4rW+lFF3BOA3521unIVTW0pUEToQiq9S14
8Wov7R2dfOuRLzy9+Fko6kKketyAu7aZ1fwF2ffjd4BSRUe6tGF4KS/TYaC4Hxbl
6P+uFuWMG7eCb+pgzZnhnxFr66RdCWBtJrng5f797xkiWJXsU/UDOINZjkk+1A+w
+h4Qzl694ipEAk+zbXRhJWJcERDXptxJLTNF9eHhnRu33csZqGJ/qu8JkCnS4WCB
HDtzN8AOY1vfsIjd1f3x1domLehS0CckAWGZGFR/Qfwxr8RXcN2LNmidM2gFHunM
z01nCfN8OM9q29OheC+TwwEqAleajC3w2vv5i3LE2WrwVrDW/mk=
=6Bvl
-----END PGP SIGNATURE-----

--nWFmj5yHiVN8gSxV--
