Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E075F2075
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJAWve (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiJAWvV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:51:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C200340E1B;
        Sat,  1 Oct 2022 15:51:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D519B80C01;
        Sat,  1 Oct 2022 22:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6130BC433D6;
        Sat,  1 Oct 2022 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664664670;
        bh=hrLQYppdb7CqP7xkSUXXw+Qfwy9vLVycX6g7AnyQiXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MY83KDh/K1C+sxW/JJ+PABlv1x8mKBQaY6/KL4yDlClyQMCvW/0lPkRrjBCSttgoL
         CkUkU03dhlFprIdaaXrnSIGppnvivMok9p/1tGBcYOyEOepjJ1kGrUVnnCaRuh4zFJ
         eS7k+qf+5JzpZA0q+48IV+65wqy5nFS+gjRGe10IJrzEI8YLWcjztAvkz33laBEu+0
         T2ElLnfWRcpJ3fzulmsThKiZYfcplkvON3y6Y2Q/25oDz/3ItrApUrepYa8tP3ONXW
         iD/2mAOPjrg/JVe3egZohk31KyxAP3goVrgFmnom+F03AthC6kpqaVHO/CUQkoTAlW
         yUMfaHSQV8YCQ==
Date:   Sun, 2 Oct 2022 00:51:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
        hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 07/13] i2c: acpi: Use ACPI wake capability bit to set
 wake_irq
Message-ID: <YzjEWisPFQ312w90@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>, linux-acpi@vger.kernel.org,
        linux-input@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220929161917.2348231-1-rrangel@chromium.org>
 <20220929093200.v6.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HQTkTiUnVoPhWCYs"
Content-Disposition: inline
In-Reply-To: <20220929093200.v6.7.I8af4282adc72eb9f247adcd03676a43893a020a6@changeid>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HQTkTiUnVoPhWCYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 10:19:11AM -0600, Raul E Rangel wrote:
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

I assume this goes in with the rest of this series, so:

Acked-by: Wolfram Sang <wsa@kernel.org>


--HQTkTiUnVoPhWCYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4xFkACgkQFA3kzBSg
KbbtMg/+OeOfIdnhO43tSGXnoUHdJyhiRUBhiHgxZ6tCwJncYH1fBBPBW5hAu2CY
+LD1pDaU5JqerLqTrOd9K/8SOduwPmzP0aOtE3sH0mMDh77pJYri5RacSUI6b+SB
NC7yQCw6Sgpeht+VWIfe07lvwPZPFe4Mc49vzDEK0tJ859w2LBKOSQc6jfW8GVTY
zvKtds6bd81I3LC3A1AoPM6p3PzZTuD6SZqEYP8OxAHwyhtv8Le36UL2G9/zACXZ
X3IHNSCUnMSYder+r0tKAaGvImogEIL9vDjs5rbR6AKwiPu1kHjYDsM9U1UADygP
xCHlhyanqZnhBt7XyI9Jfb1ah770yO5txqkJGOZ4FUbjbeQvq7rD12sBnt5PI7Vf
3kDVHavhUtuZwd4QVH6LzJGuvvbndlVH795+Sz0CqLGi2JrsPbJyK2pyUS6rOW6p
numLwypXGDJ4ymCplMnlONPF9fRxfd3YpvSCzuaZp/6QHr/JTqKBq3buNHHt9VB+
R2lAow75vsNg605v6vbquQw0OZ+ZH8FMZo81UsnH44Vd6oYpi3w2Ksb7VvK8Z9I4
vCk5a8tymFk/XI3137GxAwMCKGI269l4JaUQ6haUtALk6vVQ7B4y0ISdbETas8nt
GaW0TWAYc36Wpw+iq7uRYMwWGqbM9dTSm+21c9MmOoNTH5YLYqA=
=Xy2M
-----END PGP SIGNATURE-----

--HQTkTiUnVoPhWCYs--
