Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCD55EE66B
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 22:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbiI1UIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 16:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbiI1UI2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 16:08:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DE795E65;
        Wed, 28 Sep 2022 13:08:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 18CE461FA7;
        Wed, 28 Sep 2022 20:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CF4C433D7;
        Wed, 28 Sep 2022 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664395706;
        bh=+tt0fM7EMCJJCPyGEq+hq/t6ZRlbrr0U5TAvdvVSJnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fybiu5bwXDbneeyL/tR4SQZRzqCdvd755VQRuByba4Xw5gvd8yLMNHFkDnGwcTup6
         mVApZ18/PshgL4ExIQ5PkZ0caclHs3mWFouYa1I26kyk1+2ImCifKg/t/z8/n8rc0x
         yomO0BZWac2i1Qhn0Q+wQ9zU6JZc5ikGj/BBUnv7M0FV7YFIjR/Kj3g0ASC+NwFCKc
         mvu2EHjbaYat2Z67dqIvUKOYXGoDydV33ZG4/dkdBw/R3yRu72a2ySnbo94V4YCcFb
         vyWhaarvg4ROhZj3uLnbxy0yCX83fuDz+Oj0sAlizt+vHTpLvSMQxE5myI9iU8zx5T
         7JnAGEHW1q+dA==
Date:   Wed, 28 Sep 2022 22:08:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, krzk@kernel.org,
        jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
Subject: Re: [PATCH v6 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Message-ID: <YzSptqbZoVj7rvrD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, krzk@kernel.org,
        jarkko.nikula@linux.intel.com, robh@kernel.org,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        rafal@milecki.pl, olof@lixom.net, arnd@arndb.de,
        UNGLinuxDriver@microchip.com
References: <20220927085949.2800504-1-tharunkumar.pasumarthi@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L1oTSugS1IMpy7U2"
Content-Disposition: inline
In-Reply-To: <20220927085949.2800504-1-tharunkumar.pasumarthi@microchip.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L1oTSugS1IMpy7U2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 02:29:49PM +0530, Tharun Kumar P wrote:
> Microchip pci1xxxx is an unmanaged PCIe3.1a Switch for Consumer,
> Industrial and Automotive applications. This switch has multiple
> downstream ports. In one of the Switch's Downstream port, there
> is a multifunction endpoint for peripherals which includes an I2C
> host controller. The I2C function in the endpoint operates at 100KHz,
> 400KHz and 1 MHz and has buffer depth of 128 bytes.
> This patch provides the I2C controller driver for the I2C function
> of the switch.
>=20
> Signed-off-by: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--L1oTSugS1IMpy7U2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM0qbYACgkQFA3kzBSg
KbZlOw//SXUTwleVkoOmwYRTaBjtvaD6Eei2+Anq1FDQef3uf3X5TNX/YYPUMF6e
lbbK4E+goOaGugmjHm/jt/MBn4J/iyUnbaCafu5dXSVmFl4v15N/WPZN8N8ssvn7
uKYVQNC7jLs8B6PDs+v6xG+Z+ntess5sPjfgA5SXcN2ERZwJ+5VXt2RnriK4jQ2/
C7Pl3bcqE7t8m0Retn+U/VJZ3vgyA1Xu3Snqrx95Eo0shaB8O2+3c2O+WmAx0Si9
W1PDUsxHFizh0MQQE9/v+4kx4iC6YdpVB+StHRzcQYYP02LEFSvdIdae71PF1p4u
jjfEiDyRdCoq0jUiEzDtb2/KFHW/a49tsmS7AVq6+COUAM9AXJvPazrbYIA3Wo9d
5NJ0AgQOrcUFfA7Yfh/xXhjan+FtFnLWTmFYhrnTsORp72psJN+x9JBDFRrsBJTq
yL0ID2LkQfUS4QrGdj2jA3Cj0YGt5lj0LM4FNtFw4eHfASwXFNU+1NTCqq3d91vI
jWMWeoevfsyDDq5o05skUk8fBGZBIvo6AcUKYftLcVC3Eb5ZmvHlyDKQ6ml8uE9B
vk2ndPU2gg92c/gZJyClVMFTAnUh0/h/vSHG3m53Mo100NZAIytWBVT6w7SJdSWD
5fr0HmbO7eKCpyp3N/uQrssxqF7f4jtBsUt1whfP1FCYHb1IVO4=
=dwZH
-----END PGP SIGNATURE-----

--L1oTSugS1IMpy7U2--
