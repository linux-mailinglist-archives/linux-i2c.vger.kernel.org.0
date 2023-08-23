Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F54785FE3
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 20:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbjHWSkB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 14:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238219AbjHWSjw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 14:39:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE8910C8;
        Wed, 23 Aug 2023 11:39:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0905364751;
        Wed, 23 Aug 2023 18:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBC4C433C7;
        Wed, 23 Aug 2023 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692815982;
        bh=asxMeG59goJrKZqpcF2iRdaVp/sUaPD7C4KvDd1RyOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WKFlXytsPC4AZKRXJ+Qa3aZloUnUGFQL+LYIK0C0yNJLrYaq3eMPpbo80zLpu4qto
         lpY+ICEHYrhqIDisEmDc8i+CTUU5M6YevwUcK+BBYB19uVE8LN3egnOYMfOK0BeJ4F
         WHWajKhvsx+/4coIQQsTBVHEQvqI+3hnbY9PdA2ra0NgL2OMcMm2cRGzFDJtKECskO
         uglY+LaDK2LlsoKxLflOIfuLU1v/oxQO7/zXj53GgYBIIYPaI5/qedFjKx1XEw5pTB
         IhIylskgfH1wBcxjjaptNhyC6vUYR254sjOYfyiHND++Dd24P9E0EGw1IaBu859/sW
         ksi0bflQh4y+g==
Date:   Wed, 23 Aug 2023 19:39:29 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Corey Minyard <minyard@acm.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-iio@vger.kernel.org,
        openipmi-developer@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <603cf881-b423-40cc-8bbf-b09d929a8597@sirena.org.uk>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hFdtHq9Mievm7JEW"
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-Cookie: Some optional equipment shown.
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hFdtHq9Mievm7JEW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.

Acked-by: Mark Brown <broonie@kernel.org>

--hFdtHq9Mievm7JEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmUmEACgkQJNaLcl1U
h9C17Qf+LbbaWfPVYoNHCKOts2RLh6E9FZYojlWRsJWrOhMsIwoY8wMxMPxpOUUY
XP0Hy/LRxo4Khds4zZcNYO05Pkpx0eBSWvzrKSppmA6Pvn9Tu8NkUz7kDmjc7Kwx
7x9ZJKzezKxMkDc8yM45Kc+WC91fV84eflnTL8pAv54aLIuOXqWjh8rTfwT5no7m
59U8ovuRPz477vFNoOu3dqqxSk9mpvY4bLXFGfKZPXGVAoTiNhqt0XML2chc/qr0
tr8971bllC0KXR3Y/8NdZBPwgeHAADvHOIjIGMHVrF+ZbPLaP1b3f9Abc+yd0VBF
Z/wO8E7iZJaNTg95zGWIiXzaYmurpQ==
=kJ5/
-----END PGP SIGNATURE-----

--hFdtHq9Mievm7JEW--
