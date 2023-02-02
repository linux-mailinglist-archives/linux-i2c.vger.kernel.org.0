Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF94C6888F1
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 22:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjBBVZQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 16:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjBBVZP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 16:25:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C816F6DB38;
        Thu,  2 Feb 2023 13:25:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6B34A61CFD;
        Thu,  2 Feb 2023 21:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C40C433EF;
        Thu,  2 Feb 2023 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675373113;
        bh=Tu0Lv+jemAQVpkWaP+lSA87Ark9WBZjJyyhKVYChSDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k/HX4KJ4k82Ckc5k8aqlhZgpvPdUYRnNJ7SdFXp6M8owpxCWWRfX5pTMbLD8woDo3
         k0E6dvJo5SHvABdTzmPMKhuNcq0U5n9l9/E3HCiN9effa73IMVNpEuu9FmERWGjgV+
         nnSkK6Eoaqy2Jo9wk7SgmWWptUE5sYOVRdtUZT5JIfpNv1BVZlvUd4ZHMej6jc/pvh
         dMp3NgfUZbe+0C5TlYl5+w7Zqf0j20uAEhFl77XGjLvabQ6GVWHbQmf0vcU4BsUdcZ
         PFLycF+3rdJjT7teUcS0shnrmvPhbZfWdiIOKaMe37aapcfE0oBaLCQaswtprzx9xH
         ZPg9uZZc8q5Vg==
Date:   Thu, 2 Feb 2023 22:25:10 +0100
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
        Peibao Liu <liupeibao@loongson.cn>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V11 1/3] dt-bindings: i2c: Add Loongson LS2X I2C
 controller
Message-ID: <Y9wqNkaNI0GuwrGk@ninjato>
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
        Peibao Liu <liupeibao@loongson.cn>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <cover.1675167975.git.zhoubinbin@loongson.cn>
 <ae46e649085d7d0dbc329e441f577efcd9a3d68b.1675167975.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZCBEJVsENUzayXv9"
Content-Disposition: inline
In-Reply-To: <ae46e649085d7d0dbc329e441f577efcd9a3d68b.1675167975.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZCBEJVsENUzayXv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 08:37:30PM +0800, Binbin Zhou wrote:
> Add Loongson LS2X I2C controller binding with DT schema format using
> json-schema.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--ZCBEJVsENUzayXv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPcKjYACgkQFA3kzBSg
KbaabA//QJIjSdVf8DnfGVbX1yxGDCKhHUBN7QvxmhPQaXlwPM5oVPPIgiyEWVo3
xXBcSBCNc61VBzcSi5kAhMft9vG7xp13rPRU9EPD5i9CqnA2tIerJfnbhRLMtPVo
MNOwF1WuSggfWVFQQUI4sjfiYnEh764kQ/ge5EsJw2SkCgXtaGtAu716/I2AFxIT
gSvbJ2NZCX4v+iBu1qMOFrYwAETsPKiM6WUba2XQjBU+32Eg5JeQB/fRdwl8TwkG
7yBcTVZryX/IGgnGCtvRnviqSnwwS3NiiidXnFkYHdCY7jvJwRVytr3d2J0DTVkG
iMdtsp5X7nY1/xrnWholN1MfWjUYVk1GFJIIdQvbGrCyNHSlczoPrjIyKZbYNhOf
2fnvE28zsaaeZx8kvJkRPBXhEpKZ56kz57lEkzzUhqvNXEBTXVZH73TT0mkGEWSZ
8Gr+sudx4tmRMOoTSSJrS+j56+TvChmvQlsNygJX+G0E7XrqMiHXBNgSA56boYwF
8Bocr8Z8+U86ex6n1VxTRnGCtpuNnCJOt2XHUgpDg+cHQfr0FBVUAiZjYpuvRXay
K13NHVgJgE5f7CFYvwR2msWCvChPiZLYHY+DdZHIijsLsXDgrtMmA6E02gjJpkLB
9+C9Ot33/gNVmGz/gFksS0dbNbSm0xH2YsdygJ/QJDu0sD/h9/0=
=/CL8
-----END PGP SIGNATURE-----

--ZCBEJVsENUzayXv9--
