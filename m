Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB3A6888F4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 22:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbjBBV0P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 16:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjBBV0P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 16:26:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCE473056;
        Thu,  2 Feb 2023 13:26:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A3B6B82878;
        Thu,  2 Feb 2023 21:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64382C433D2;
        Thu,  2 Feb 2023 21:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675373171;
        bh=W3AjyQkHsWUf6ay8jgNtEs+jDZGB5ySJ+PvHC36iymc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fqz8oEDaC0pm9msf1bl82X05/7cYVXF/gNC08TXfH2ttImmdnfrLRNcAWAwLLcGm6
         Lh/2mshRsNKsoK0QRGn/3nzCCTo11cj9RrAqnal1/TYJh0wQPBBVsii8bHtZlN2ENu
         W1g0OqgoY2Phy3SnFOMdAdIovXN7GFJvGDnao/mN3VKJdohIAiLqkPsHXsDb6V4UMc
         Yf3Yi+Fee4gqPT5sDV0NweMVCk5Fw0NcaGM6KlBMPgAMgsx+guVvlQNUncgW0viqlC
         qtdnNwK1MUK4tmVKf7BZfZggh1OThY7LuImHw2VvzT8cFdkKsxZMpPXoF5FfqKOIEK
         QfGHJupa18A4w==
Date:   Thu, 2 Feb 2023 22:26:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Andy Shevchenko <andy@kernel.org>,
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
Subject: Re: [PATCH V11 2/3] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y9wqcWHBO9y/xKfO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
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
References: <cover.1675167975.git.zhoubinbin@loongson.cn>
 <c6d7ee649e73536c62f665d11b0504029bd5613a.1675167975.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Cs5t7USZHMZZKuI0"
Content-Disposition: inline
In-Reply-To: <c6d7ee649e73536c62f665d11b0504029bd5613a.1675167975.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Cs5t7USZHMZZKuI0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 08:37:31PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Applied to for-next, thank you and all the reviewers!

If you like to maintain the driver, please send an addition to the
MAINTAINERS file in a seperate patch. That would be great!


--Cs5t7USZHMZZKuI0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPcKnAACgkQFA3kzBSg
Kbb9hBAAn/ENrQRrLTsNXOb+h1W+3dKdvAU7Q1MZsTKMvKfEqYXA/qB3agngvtdh
wjeBpCVcmlvEwo/shFseEdMeedYQkhonVydcxkcJfyHQKFkbgPYF9FQ9boCINpR5
k1fpt6azn8fRD1zOJJ/EvcKaaIV9JSLqvp0OgVpaIepNMtEdDWjJj5zQhqDBOw2Z
jpICbpPpzYDK/D5sCXiLSxM0XjKFm3SGGVMekNRV5a/N/25Nwdtxk3wbvx4BixT3
NBg4hfl3vfBnDaAqTacSW9EnpZUJ0dyHyMQ75rLaGcjScAGYQ/rR+6da4y2I1t7g
ubjuRg68FAPjU8RjYR6eha8ocI84WFA6UQMU1VvJYwvTYqTsz8SMFth6E6QOJfti
4GEVoE/JyiLFEBRvD/jE4Xej5SehknZO3VChm2qGNvZzdLB2aW/Ua4xVJIDY7P04
h1bvZ2qSGz5zrmXGZ38Z7HbF1SY31Wh983CKsjTbZs0f1+9hhVMBgFhUc5J9FyCa
MfE/GjRNrvoEXAjEGCseulUaDkxtW11chPebcFwEp07cVA0Tm7IVUswKG//eMmYb
auIGwlYW2kbMnBDSJoTYS/ClJE0W0HOu/WiOt9kNih58e2gZKugazyKQ8+FsSPri
kKUj2ALDzjNg/EWE4l46JsJV9UhmTS1LBYmRlIdTq9pZD59xtG0=
=ErXU
-----END PGP SIGNATURE-----

--Cs5t7USZHMZZKuI0--
