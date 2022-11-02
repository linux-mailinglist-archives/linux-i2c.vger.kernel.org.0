Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030F4616E8B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 21:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiKBUY0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 16:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiKBUYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 16:24:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861E2195;
        Wed,  2 Nov 2022 13:24:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C0C0B82469;
        Wed,  2 Nov 2022 20:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCE7C433D6;
        Wed,  2 Nov 2022 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667420661;
        bh=50CRcZ5RN9P5gsD2ticqR1JUJpYrPM4a4xZBbRXt57g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aM9vpPlhOfOnL5AirDKrnjVT5iUm8SsDRqhHIZnmvR2BEbv25oZcPwm8uVNNSi23z
         99QLouqZpXOcmHlXHE9uiGsnLYxr8jhbSRUMkdz3zEWzhP6ODsDz+oWgXcJlQ3S7Tp
         5RBPxNgDbhjo2iPEV5SsJhFS79acR1v9/Vj9oq7PnXNIy29up0Uj7KtTGP+WtKSPrS
         ybz/YV+UirTB05fqmI09t1fk9m4g+HMenzGW0YaEDnUJSyKcpMdD5ex/lLlSN7oiTG
         2DLAkjARb00Ah6iUx/gk608M1tJuCQ281h9+5N7hoJ1sZtLFurnT7P6vl8JLvKLBmh
         tmdFVE19zhYsw==
Date:   Wed, 2 Nov 2022 21:24:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v10 1/2] i2c: hisi: Add initial device tree support
Message-ID: <Y2LR8uC6t1XqCv2I@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101080728.143639-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zlYDA4C+XDZaLiOa"
Content-Disposition: inline
In-Reply-To: <20221101080728.143639-1-chenweilong@huawei.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zlYDA4C+XDZaLiOa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 04:07:27PM +0800, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.
>=20
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> Acked-by: Yicong Yang <yangyicong@hisilicon.com>

Applied to for-next, thanks!


--zlYDA4C+XDZaLiOa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNi0fIACgkQFA3kzBSg
KbZ+nRAAqlH+bviznGA5DyYmoUpYRfH/w4vGsyjfNbkDCTEa87jCpnvhrACCEo/U
wlh4Z55Fj3SL757AfwVGuFWu8fab5eS9+6UjlcVRmp8tZZKOl42/U6Aho8Q1he8n
f4ZnUz+4HKrv6Q0Zw7vzTjQXGM+b25FDkn/EOXopS65rb/Bs3Yi2pqOPMuv6biaZ
+x9UKlj98HHf4mLyT2o1moKq452CyOq9bN+6rttSMZB+gFkU00q/syhjwRx6LlYM
bko3/c9VVMuXliNsY937rgVwUO3l30fI08CTpp0PvAB4QsMde1QWwOWDlotGnJfr
Zi5QP/REdBMhaxxwjQYIR729y9GFSqW0aQDfb4symitYEcVjn3r1t3VOi1Ud2DeI
0ued995H7XxdUe83yClELXRr9hFI+0Ye13Fp4c2zpOhoQvy5vhfHr03X2smMgWh0
oOP0C22q2p4hStGfIjajwe2D5i4h7aCtrEksdVtocBWCCUKvuqHMuboKNvssJ4wa
gOqzJazZfLxz+XmiQsHZqLLjkOlowU5JMZcgTiLe7ciJYhwGNDry6GGGlzDvU6RP
Vgy6TMnU+HzaAdEPwEpIlt4v7K0EnK5RMMQ5sPGAHfTm8tJrGWMEQcU2PPV8ZZzL
2+avOc+PLKj1FUcNmt9HUEhDBRvFyB/zmed++0A3euIfws4D2Po=
=5sMc
-----END PGP SIGNATURE-----

--zlYDA4C+XDZaLiOa--
