Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0DA788F80
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 22:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjHYUDR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 16:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjHYUC5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 16:02:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC752121
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 13:02:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E08C62E34
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 20:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7526FC433C7;
        Fri, 25 Aug 2023 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692993775;
        bh=meZ+ibu0gEqwbNODjzvuqEtPm9utSxBWrQcHaKRGYT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gIzmxj6ErMUTrOY+CoOIm2fFgY7b7SKuvb3FWLOAnfmMLghUX+4xox7qTeXt74y/U
         hcgNVuBufjJCx+zQwdwUdoJhlkxo7lgHpubqPSmyYowKTT4xlii2SV02KkS5wGwc0g
         V+kRTHd3FEC1mqRKoavEJihR+WQOlNkNn7OMRCMZMaqHzIWqZYb1QCcgsFoMrDqZEM
         33mL5dkC733OKf769/3uwpZ8mmH1DfyloCSijFnr9u96GJ7Tt/6m/hxnW4ODiNbAEw
         7xaedg/Ts/0/6i21q+KOxSWnPJ+BEtUdrW6PawVYXzwEv7zvTzzHaEpq0MVwog/7TB
         Cpn8xT+BcCRyw==
Date:   Fri, 25 Aug 2023 22:02:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
Subject: Re: [PATCH v2 1/2] i2c: wmt: split out i2c-viai2c-common.{c,h}
Message-ID: <ZOkI62MZee+3HR6n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
References: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
 <fdd2968e0ae028ce3d4cf389e4e2d55a4641c0d7.1691999569.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sOV0A/R6sIo3ee8q"
Content-Disposition: inline
In-Reply-To: <fdd2968e0ae028ce3d4cf389e4e2d55a4641c0d7.1691999569.git.hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sOV0A/R6sIo3ee8q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

first of all, thank you for reworking your driver to share common code
with the WMT driver. This effort is much appreciated and we are close to
go, I think. But some remarks.

> +config I2C_VIAI2C_COMMON
> +	tristate
> +
>  config I2C_WMT
>  	tristate "Wondermedia WM8xxx SoC I2C bus support"
>  	depends on ARCH_VT8500 || COMPILE_TEST
> +	select I2C_VIAI2C_COMMON
>  	help
>  	  Say yes if you want to support the I2C bus on Wondermedia 8xxx-series
>  	  SoCs.
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index af56fe2c75c0..b7e20c3531b5 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -120,6 +120,7 @@ obj-$(CONFIG_I2C_TEGRA_BPMP)	+= i2c-tegra-bpmp.o
>  obj-$(CONFIG_I2C_UNIPHIER)	+= i2c-uniphier.o
>  obj-$(CONFIG_I2C_UNIPHIER_F)	+= i2c-uniphier-f.o
>  obj-$(CONFIG_I2C_VERSATILE)	+= i2c-versatile.o
> +obj-$(CONFIG_I2C_VIAI2C_COMMON)	+= i2c-viai2c-common.o
>  obj-$(CONFIG_I2C_WMT)		+= i2c-wmt.o
>  i2c-octeon-objs := i2c-octeon-core.o i2c-octeon-platdrv.o
>  obj-$(CONFIG_I2C_OCTEON)	+= i2c-octeon.o

I'd prefer to link the core object to the driver object like pasemi or
octeon do. Or is there an argument for having a seperate module?

Regards!


--sOV0A/R6sIo3ee8q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpCOYACgkQFA3kzBSg
KbaPGw/+JzowSs2QrZknEye3O69YQOT1tl83kBUmc+rGKUvZsr30WaVBV7tS+CHJ
bnsFk8evoGgMXimmq9URoPPftDGGenRF7sAd3dZA3JjW5wC9RDzBJm8kaX1mLqz2
UJKOySjBAK7bQlAxEGsrUk4QMxOx08PocMz9hNalfpMTpHCKazrLiVoloRNruCov
fHvNJmSO6Wzwf6aN744XHOk8wF2CKu7K+unYdMDO25hxAsUYMmHCqVDaAN5yHt/a
mThm4aUr1d/xg6Z4hWmxPbD6T9aSG7T7CYkZliPUscKhmFQMh9Sb8R5BJLOPSVtl
jWRY0fit56ZI6gbhkygSbljqnP2tAi6WfLq/D59qLPpEahN5WkBTrIR4ItzNCZwl
WaLs0u/8y83XUdswRMicIm4dOiFHTKdG1Bzx9SJdqYenB6WG36mWm6YHAffGgPVR
IPrV2MHDlAOzqvQwAdjNnO29rH8uaiXnsySnYm2a2IMsHAJYwUhTIwYFk3230VUA
F6pdeBFo2wSIhVg/GuV4TsceBJCFVqlQIdHjmrAoP+6VS/RgUnnxkJpdYjzky9q4
MVMYI+CcEfZndB5nvlGZRNrYT7EmK4T62wJl39f7EYjqYRQHB5WU2Wsc9wk0Ej7U
BtXX9vodvRhX+vT75CSIRx94hTp/AuyjcZj8q+kIS8FbyXB33mU=
=/9xu
-----END PGP SIGNATURE-----

--sOV0A/R6sIo3ee8q--
