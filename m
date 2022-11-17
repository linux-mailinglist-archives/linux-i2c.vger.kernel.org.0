Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A900662D51A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 09:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239547AbiKQIfl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 03:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKQIfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 03:35:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C153F07C;
        Thu, 17 Nov 2022 00:35:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0641B81F6F;
        Thu, 17 Nov 2022 08:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873EEC433D6;
        Thu, 17 Nov 2022 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668674135;
        bh=SZcUMLjHCHfrspzcORoINEugZp4m9824ASw3unNVtxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aS2alA60oszQSCWly2iMyaME0RlqfIUz6Oq9lIgCzbT3lQbpk9Mk+5t9Ugko0Ky12
         /cGpJy9hjmH1NCjYymOtqmaCKzpNoiyjIlcf+zep8MBHajNa2RLyBbV6Ih7+u5BgPK
         pRoII17t8cycR4A9ZIjPwOgGA0jTgBL5eV0KITqgHhRaswabtkWx+92ymNXsyw2/2d
         /zML9JY9V/enFsyKJEJTCjzDiVbKy6GfJycgpbwIwIrGobpd3HfciYdz8lWcMEQWDK
         Tybcfa82sQEB/Fb82MvWMajP3zeDBBfxeypH9tQkDCDx48+YWDrStV2YwUWNv+bFhy
         jNUwkgNVtQ7ag==
Date:   Thu, 17 Nov 2022 09:35:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y3XyU70QJruJUsI0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yinbo Zhu <zhuyinbo@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
 <Y3Xwt2xtAbd8ubkF@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EomtMclmg5oGyn0c"
Content-Disposition: inline
In-Reply-To: <Y3Xwt2xtAbd8ubkF@smile.fi.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EomtMclmg5oGyn0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can you split slave part as a separate change? It will help to review and
> to understand the code better in the future by browsing the history.

Thanks for all your reviewing help, Andy! Regarding this comment, I
don't think a split is needed. The driver is small enough with ~500
lines, so I think it can stay this way. It would be different if the
driver was 1000+ lines, then I'd totally agree. I will have a look at
this driver soon.


--EomtMclmg5oGyn0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN18k8ACgkQFA3kzBSg
KbYsFhAApX6x8v38CApwilC3pWk1k286lqIg9z9lVoMVx0KN+NKzNmheuSLj80I7
jL0U9jJThoRAlShmYPHzH0TkQOEjG64cY9CU0lOk3tsYPDtqhgguAk5wvP4ijT9u
OziQJvqOVAbzEN1+f8WQRaAOhhDi5uivyKSP36eFYhjgqCNK+GDdL1DVQIePq4M9
ShRUguh09svbsdImFfANg6mAMFmoXJ6VXM6C+3oxdHCBRvGNSGpGSFZF/glq8lJ3
WCDEyd13h6fhtDKrONP91qvd1JVK+4Yq0jdFBMvcMZIjpNhUSj5BWMyDmno0OWmW
kPB3xuWC6BxZiYW7Kj53hLwiu06XR0QhZvkjbaLUZkIJU/xLdbjHkydmL/fUP6fe
qDqvmHbjzK9xoqiQbAFHSac8yHuCFlx1bMBH5vWXvCxpL0Jh8ykIeXWyH+tDogPF
pBF5lr0vFOn9r6qsXiQjzyIN2TQ4797l0aM4kkCJZamRH97DK0aq5r7cGv5IkgaY
VHQrLcA4gvioEY6d7EOqGjIjqJF+/uuJFC6kf1eq1mE5YiMmz5nYwS+25GJqSERx
xXbzlu2JEB8JGAdGL4v41vNOnmY63ISiuRi8lPUzKhdVQ/+EeL5Kzs9GWIiSi25T
yMv5GtiUSMUqG1iMmC8bqTQAFtvpz8jlIVbMJy8C8EdSaqSoFds=
=T0gw
-----END PGP SIGNATURE-----

--EomtMclmg5oGyn0c--
