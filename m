Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE47968084B
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 10:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbjA3JPL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 04:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236144AbjA3JPK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 04:15:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0FB23C45;
        Mon, 30 Jan 2023 01:15:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C08D60F00;
        Mon, 30 Jan 2023 09:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449C2C4339B;
        Mon, 30 Jan 2023 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675070105;
        bh=QJvgPtgA4XP+88EYwXRBCIa5cKyZmpHNcrpe1d6ewXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MKjMRfN6+PNng778poMRs+q0LB38LlUAXREw/Qy+jMbWbMHfg1qKTsAvXGX8VPyTz
         8/z5aWLHJu/kn/NkEYRsX5zsW9v+ll9lTJiPbXhyFBVzM8vR//4ALJ2eYDctJJC8d3
         5w0OseurwUSIN8YET1maFDEnhxeCe2ohLOCFB8OJfBT7j4/YmdTo2vpHs3WcDIbWVG
         zwc4HYT+p4a0Xx37e22zU73sYH8sQTHyHKGwzZWzBtyZpigy9C/iTLosbF66LaNh52
         ytxo6/6OSwf2spEQ9PvPNUgoMCrQ6GuDhKB82bNCX4fsJvyxu1vDY9loHy+HZKUSkb
         5aWvu0olVrnIA==
Date:   Mon, 30 Jan 2023 10:14:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Peibao Liu <liupeibao@loongson.cn>
Subject: Re: [PATCH V10 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y9eKkBwuIR2okuXt@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubb.aaron@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Peibao Liu <liupeibao@loongson.cn>
References: <cover.1673340642.git.zhoubinbin@loongson.cn>
 <77046b03eb0e75b25934406afce597997624a2b8.1673340642.git.zhoubinbin@loongson.cn>
 <Y8paBAVsBJIqLZnH@ninjato>
 <CAMpQs4LVc2nMR_ZxcqX_vOuyyyhip=fgEfYPqctJGy7YS89=Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tFRBaEWS7ODtTzyC"
Content-Disposition: inline
In-Reply-To: <CAMpQs4LVc2nMR_ZxcqX_vOuyyyhip=fgEfYPqctJGy7YS89=Zg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tFRBaEWS7ODtTzyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> Sorry for the late reply.

No worries!

> Yes, I have tried this, and i2cdetect shows the following:
[...]
> Do you mean this?

Yes, very good!

> > > +subsys_initcall(ls2x_i2c_init_driver);
> >
> > Can't this be handled with deferred probing?
>=20
> Emm, I've been trying to register using the generic method before and
> deferred probing should be a better option.
> Also, I'll use module_platform_driver(ls2x_i2c_driver); instead in the
> next version.

Great, then the next version is likely to be the final one!

Happy hacking,

   Wolfram

--tFRBaEWS7ODtTzyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPXio0ACgkQFA3kzBSg
KbazfBAAkT4t967ZltCgW1CPu6AKIaQnocofOJunIpkf6pPXUteiaRpvZGQTCBzR
UOYL93T/yzcxgwVXGJsS3bbkm+Qt2IdTphzmilIVnz8fPER4pveVFS35zzCbWfR+
1xSYYr3kO6d4XAIHs+g6U6bwS5/413yfA/pQs+wk5ALoaTS6o70CoUP1OOQVZRC0
4UJCRLOlou2nGmp5VaX1fvNQGSwvTuChHhgvJTrdNDI7Rkj0c2lcS2sxMHZ2Ze3s
8ulcGhgjXJACOF/rtxslKo1ZRScvvAY0eHQvMKOe2N+4sL4aR3fPh8hEH/LCuNy4
9HOyQW6ntfoO5jysMMmOfeutJrbU6pMpsAVhisU/r9M2NoBJXEWwAyTJ0vpCClCC
dpBkGuuMXpcEEPi3aFb5f1EmJAlrKddD4+NBpvb3uKgxSZJXJKBqFZ5ncDiC7FW+
9dnaxn3XvroRzeXkuTZGRLTgZgI8bN27UoRau/SADUpedyte7EKju2GYiWaQsPPF
R7HtxlhA9ZYW9+fjMBaD4cfj/qu4414I1QKHs3K1cwSM1IrsldK8AOHanNZsMSLx
Uh5yL0LT4fPLCl2/UHTvJyiAHgDveydgtUpt7SugUIXmRXf/zzPyI5wXysluTpPq
VFYY8BOgqPHcN0t6KciSCxEbJMItBHbnX4nvi9qH1f5YuFdwyC4=
=qTiY
-----END PGP SIGNATURE-----

--tFRBaEWS7ODtTzyC--
