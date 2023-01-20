Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1C9674FD7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbjATIxJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:53:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjATIxI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:53:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835E8458B8;
        Fri, 20 Jan 2023 00:53:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2ED50B8205C;
        Fri, 20 Jan 2023 08:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80481C433EF;
        Fri, 20 Jan 2023 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204782;
        bh=U6X28i62ui2V9lEmzG7D8h5vunsSgjjoPEqlBRcAaqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y9VqKWIvqbaYaPXymE4NJ0nvMEBrAj/UVpalxngKwh7fzcGc645m5RgcAqyx7QYhI
         pDUtTxFcJsB48kE6v9qeqFhzHkWRXGjgUl/4bCd5P/PmdQr4Zpe78/vRg14xepz6Cw
         Jv5Cqca9kvxQWY7DBLsRSGTCgIf/PYnH1drxOXkjJC8GATRTvrXPHAGks7x7NMg0Nk
         y8ECZNn8ircJ1o7J5xEEoQQcfK9mXCAyAvh3CYx0XBU7YhTS8ung32ij8qdvsJS5VT
         u6Unj7yDn033yQ8qbCBoeyFB7ZzjHzzrgDQnzbvG637e0Lji47fm28FYeLjsRHU+Ou
         XOHrHJ+WQlX4Q==
Date:   Fri, 20 Jan 2023 09:53:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v5 2/2] i2c: Set i2c pinctrl recovery info from it's
 device pinctrl
Message-ID: <Y8pWbP8+FJaccUuf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hanna Hawa <hhhawa@amazon.com>, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com
References: <20221228164813.67964-1-hhhawa@amazon.com>
 <20221228164813.67964-3-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HzdZc+7RhMqTyDKr"
Content-Disposition: inline
In-Reply-To: <20221228164813.67964-3-hhhawa@amazon.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HzdZc+7RhMqTyDKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 04:48:13PM +0000, Hanna Hawa wrote:
> Currently the i2c subsystem rely on the controller device tree to
> initialize the pinctrl recovery information, part of the drivers does
> not set this field (rinfo->pinctrl), for example i2c DesignWare driver.
>=20
> The pins information is saved part of the device structure before probe
> and it's done on pinctrl_bind_pins().
>=20
> Make the i2c init recovery to get the device pins if it's not
> initialized by the driver from the device pins.
>=20
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--HzdZc+7RhMqTyDKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKVmsACgkQFA3kzBSg
KbbYgw/+Om9otkkRA4TXfNH4680VSI9d+chQHh/zE+p4kKq2kJeSjSjzSKYqj9iC
MJb1zbQ6TyFv7h2Zyvj3lwYvobsnzA48q/L2DXdxzRIHuNciWXHrgkT8nNVRUtVj
xuy3qDWP5nsqMZ/gQSzEwTGVgxfY5NceFfJ8fQnvCxOn8dRXBPKVLZ7iVp+HSRFh
d8YO2/CJM1Vv07TYf46EZZawvp4t58/OIQHc5IbkcvxukNXt80bzl+G/mrn7XG+7
HCVV2jThjzRKkeMsfzn3gB7a0jpOHMb/yEqO8a2+Egd0KyHJ3N5v42wKSXrIHN6t
mvaL6hN/13IfgZLemszwvF8bRzv9iV/eOToD99ytI5yiEJo6YvqKIEqmqNGd4rv3
K0Fwjzdwh8xUjAhiV8MW5v/a4PGaNgcCzGmvSsHBj6Sb3FtalHtgcuN9RgvoZuw/
MLCNApNOaQe50fJjAQTIuR224nf7zO3ANc/TlMtCoxInubmf9wkop6iEa0eyhsIZ
KyueWPCVSi9H5kSertYSKGFAYCS/y8osbxaErpH7MrNGO5Og69P7AVWPYQzdtV26
DsLDoWmNjHgDCu2mbtGF9CrIabXlTxd4Aqz35E5Na+EIdInsZaJV4hJ5cLm8T2UY
GfKXXzCqECvc5N3RhVfBxihSW2MpTtYLkpGCSrmoRbfny/dGSGY=
=ekZg
-----END PGP SIGNATURE-----

--HzdZc+7RhMqTyDKr--
