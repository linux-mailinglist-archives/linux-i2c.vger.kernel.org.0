Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C544E5E5436
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 22:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiIUUKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 16:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiIUUKw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 16:10:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185ED9C2C6;
        Wed, 21 Sep 2022 13:10:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0741B81F90;
        Wed, 21 Sep 2022 20:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1FDC433D6;
        Wed, 21 Sep 2022 20:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663791048;
        bh=rv29LAUUGzQp6QdV7CsyD9nRXhzFSX+5EI3EqTFY//0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sOJ5Ar1d9F/nJocBjvVLGXQp5u56v5HPdEXmqyScEbkEqDaUmWmyarqyW0fCarpru
         RcPvnInLNbdcBSriYEt+P1wp+9K9B6dpLLcYPwdXd7oUl9GpGqRBNUPY0vKemZ/Sjh
         0CAR6Bse4zciv2/CbLrnq901bfgXQooSlkrJZ3ZmqvBhcmSU4y66s+AsULFzdqVC+5
         HfA/vkBPgY6+x1vxGOPxMXlH92N7/T1UfetyhKPxtnj3OeIiFzGY+CtUQQ6UM7YhTT
         CcJ3XUcU+NVtug2zgPKLQbm5wW4Oz541VcFfOxs8iZBYBNAE+OXxq1SBRmBVoqHb+m
         PoAOvMMd/zI6Q==
Date:   Wed, 21 Sep 2022 22:10:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YytvxVs7g5vx8AAM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>, linux-acpi@vger.kernel.org,
        linux-input@vger.kernel.org, rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220921155205.1332614-1-rrangel@chromium.org>
 <20220921094736.v5.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I1sEXZoSjXGGazpV"
Content-Disposition: inline
In-Reply-To: <20220921094736.v5.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I1sEXZoSjXGGazpV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 09:51:59AM -0600, Raul E Rangel wrote:
> Device tree already has a mechanism to pass the wake_irq. It does this
> by looking for the wakeup-source property and setting the
> I2C_CLIENT_WAKE flag. This CL adds the ACPI equivalent. It uses the
> ACPI interrupt wake flag to determine if the interrupt can be used to
> wake the system. Previously the i2c drivers had to make assumptions and
> blindly enable the wake IRQ. This can cause spurious wake events. e.g.,
> If there is a device with an Active Low interrupt and the device gets
> powered off while suspending, the interrupt line will go low since it's
> no longer powered and wakes the system. For this reason we should
> respect the board designers wishes and honor the wake bit defined on the
> interrupt.
>=20
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20

Acked-by: Wolfram Sang <wsa@kernel.org>


--I1sEXZoSjXGGazpV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMrb8QACgkQFA3kzBSg
KbatIQ/+IyW1ZAyHqbyjAHsEBC9key1KUPhiobZS22Yxc2Q/c0MpSccz/wTjHC+5
daB76MkxT2eneJRlL7QhDB9Hrh4o5s3+knCKjjPjg6MddrOxpSK+OGz3Ec+FaUNX
K/tnd1aXprE1iClRyluzfs4c8wmR2QATMY1d9+foBjZhPwNhyL4GnEoDV3SbctAA
7iGOMayy0VjRB7BbGk1RjNY9EFV91NlgI4wijFhKG8u1X5x1ePfJOK+MFcWrZy/P
HI8b11gZ5WDCh+hOb0f453cU+DQB20ZEzkiF0mIZGabzlhCJf98yYbbxmsEGhVX8
OCIlDgxf+5LDQy8DqCRiLqOTVZvqZQNqBEG7871Xwj/m3ST7LtaXqAMHyMqM9z4G
JWco49ygFV5M3XSn/zEml4Fv0WhUTccVxbGOy4ehDmMLkhZQzNLZnMfu3MNITURK
4YcQy0t/MrvYRUuSscpiRXzx2kHGaW+L+eEOriJ2JIl/q6y5RsCV58xapoj35Mxn
SuQm8yh4+i7IogqfA1zX2W6e1e161nfOHDyqFDciP17zTa29k2oSFu7VM/tlOzHO
oxbu9O6pnEZveGR2QAEodH2sDaEW+Tme5RejJostHh+NHbl/DGh4dIbwP3gcOdIX
tF0MQ0Ef9QQHodTQcu8w0jblwR4pPQkS6X2uLNKBNv5G4whvNgU=
=2Tdp
-----END PGP SIGNATURE-----

--I1sEXZoSjXGGazpV--
