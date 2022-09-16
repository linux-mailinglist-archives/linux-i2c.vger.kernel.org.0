Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE475BB2DA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIPTfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIPTfR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:35:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2E86EF12;
        Fri, 16 Sep 2022 12:35:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A539B82925;
        Fri, 16 Sep 2022 19:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58116C433D6;
        Fri, 16 Sep 2022 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663356912;
        bh=vEtGrIckXENdQP+PlpzHaC+C8Bj2FnCyv6O2NiXrnu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KwqHFI2zYnQdRXbUUbcDkwkNDBa2AZeo9Lyqn7VvGGIjEvZKR1NfUiYbDzboD+jLD
         wHVP3NKfng4SR9nn278oznyHvmF2ARhitYDLV3FIqmMJeuN8UUqFD7iYmHFe/KB09a
         +wMvvVHoAcEqUGsD/U6iL5TGodVYlfqcOkfKTc8lg/P7nASV3pTMskBqzc+p7IvCGY
         Nn11mo48yTC3oV19EiD8L1X3O/rSqVynWTgXVEPGL4qx63EyDkRUQTah5InQwKg+IY
         mMF682bQ3YkLMA5OY8Yu+KiIJc0G8jN6er3sagkAg98jlTZ49sCW/WbAPbnaTWaW/X
         v8Q0l3M23n0xw==
Date:   Fri, 16 Sep 2022 20:35:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Message-ID: <YyTP555S2/irq/U0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qLZaM6GUZq9AfAXe"
Content-Disposition: inline
In-Reply-To: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qLZaM6GUZq9AfAXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko wrote:
> ACPI core in conjunction with platform driver core provides
> an infrastructure to enumerate ACPI devices. Use it in order
> to remove a lot of boilerplate code.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Doesn't apply anymore after the revert. Could you respin this?


--qLZaM6GUZq9AfAXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMkz+cACgkQFA3kzBSg
KbZEyhAAshPg5PCoyNh5kElVgh3j28BE1o/YULRjK9BNFVGK7kE/m4PVMX2yOg2Y
N2FDRitDBoHBOviIulMUAYnZQLNkBem6HirYHCqeU8JRqpicszwdC7KvQQuMAAN3
KA7Sq1CgNKnNzKLAfYTS9vWFVRg2AKukId0qE/iopZkRZnH5b52AdkxfarNJPaXq
un286TP8ZwxYd5b1f+FOT7MjuGkfWar+dyOmodZV1CH6ObE+XBEuo+mpcqLpwRYH
5nTVhpKsRR+L9bb8comtsMyhNiUkyTvO5FpEhtJ+IlFUvsoWCMC6i61CkaxNyIwb
WYH5vyDk8c2xsaR7b7cEStRSMEdWH3AolffKUZobj9WFBKwdJKgsDUrWc6eBMbwD
sfBzvTM6t2JbIQ5r3T20Ai6DGEXQQ9TEERhbcXCCf0ztAkLsej8epeAV1Xm5dJmQ
V0EPlD5rTaOskU/hCb8+qvVxjfOnJ/wIYdUe1aVPgbVgjENfu7Ymy9oyTq9iDf9E
40gq1DkB0PGww/YIIvAVZ2iTAbPXhafkNhXZHfKdauOc9eQSK4aZfYtWxMYWkvsM
JzgCAqSZXXqn5BSpYJalV7EGGUck9cChMw7btgwVKgLHYbFXKd+r2UVQlNYMbJTg
O29utORG/ufFTokaPFAG3Yqc1NhpjuJKULGhNhVCepuoPCYHw6Q=
=rWkh
-----END PGP SIGNATURE-----

--qLZaM6GUZq9AfAXe--
