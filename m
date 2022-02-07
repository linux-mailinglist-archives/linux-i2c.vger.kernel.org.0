Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60764AC530
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 17:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239482AbiBGQPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 11:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386896AbiBGQBk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 11:01:40 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94431C0401D1;
        Mon,  7 Feb 2022 08:01:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CCB0CCE112B;
        Mon,  7 Feb 2022 16:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7FAC004E1;
        Mon,  7 Feb 2022 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644249694;
        bh=PWwSvTHrKik+WHkFYTy4105egats4siq+txQzN9k8F4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qbld5TRvdN3JK2qBA/enz1wOCB2gKXQpDexQEKA0I2oGPR/w/XQnzeJpaLue5P6eN
         pM6pQQFDCFKUEiFf28DxJ2NETNCKs07CGHmblczmM2dQOhAdgv3qSe4DK0NDr+T40F
         xvn1YnHqr+eZ6NSYhjrNDagleMKiHaMjz5mJ0EiYTEDsSmcKpROSnenFoUS8WheatQ
         ZU980LBUk8YVbLekOWx6ENkIqiySkTx8lZIhvrWswvRY3OwBH/esSsREKCcb5xvFLz
         c5EUeqCb/zuokfJesm06e6DWxWJFlL6e/t5CUWe4j0egzymjBj4ng88RPZEtX3CKu7
         H+xcbalp7/A9g==
Date:   Mon, 7 Feb 2022 17:01:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ACPI: Replace acpi_bus_get_device()
Message-ID: <YgFCWq3mMQkv8UMY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <4374434.LvFx2qVVIh@kreacher>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fA8vdV3lkfQ9XeqW"
Content-Disposition: inline
In-Reply-To: <4374434.LvFx2qVVIh@kreacher>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fA8vdV3lkfQ9XeqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 07:00:42PM +0100, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> Replace acpi_bus_get_device() that is going to be dropped with
> acpi_fetch_acpi_dev().
>=20
> No intentional functional impact.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied to for-next, thanks! Let me know if you need it in for-current
instead to get rid of the to-be-deprecated function earlier.


--fA8vdV3lkfQ9XeqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBQlYACgkQFA3kzBSg
KbYFHRAAjCNtHwASK/9YtSoj9aaDnmw082YXj89IHSSkNj02vkjJhvljsYJrz9EU
KOVIhQUJRSkmWO/5FsQCNGzqtb8tfdPgeRPV0JtMQDUcEI7Z5CSnmnvBAUXItj/C
FkSE8DfBykr7z/47LOj5tXUn+yet/mevpojDYgz2meo6++bqEVdZjMVaZYSjt7rU
GTLJFjMzlaZBDEzfh/Rz8tS5zPsYteQijT2x8yujo89qaZ+jRqnw/YgawFRXN5Mx
e1Wj5wdXWGrYTiHlWC/B/9InZ4sFtcebOIKzkz8nFNCFdmEXelJ5MM3B+owZV5nN
/J5nuV94umPntEoFmd1nHYfxD9rLeoyhkX1muSRa9O6PPy+BAt+zr6Laq6rbj7eM
bZVOdbuevrUYRP5Tz2UIDr1sArFoTeqTdQ38AKTfyM2LTxWJ8DaeBdtiuVak95Jh
y5RWRzoNp/vSNaypF2qSsHUrozai83o5WqejVmPThs1NblKOTNAVGh9tQqOcK5Je
WMNG2U2bOIRqQBH0Z1yN/jcAa2EWDs0UY+Mq5A5+Bq6PQgicyCtIShZeyAawPAic
yOwaRye8QU85RK1O4RPSNN9Yska+A3a4wYQB8HY/SbdDM3igpw5H9+/rnTP2PQkk
tuMQYoyEb9QoYFBgqHO2Or45jMKtNiPrfpmaf3OihhDCYPy2Wqg=
=X+Sc
-----END PGP SIGNATURE-----

--fA8vdV3lkfQ9XeqW--
