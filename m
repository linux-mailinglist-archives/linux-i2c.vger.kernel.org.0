Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0519B675067
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjATJOt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjATJOs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:14:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CFC82994;
        Fri, 20 Jan 2023 01:14:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8B61B820F8;
        Fri, 20 Jan 2023 09:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F33C433D2;
        Fri, 20 Jan 2023 09:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674206063;
        bh=/DoKOdyFC4qn98SrhJyhz8UuP25eGaTNRWgeWw0pDY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cb2o+uGXv7R/Snm5gKP3w2bdFBJiK7JWFYmdKt6YXkzHhZ/ATp/LnOb1OP9fgLRdL
         WKVhomKLMVxRsZpEHQnz0qgR7TwaNyeSAWzBcc/iGM+6V0POLy4wXeQz1HdPnpgFdU
         e87nxjrmiO0EDu/PkUtlQhafna0W8TiOhi+UMsNf8vUJKrvf/GSaJztxn16h/uPIzf
         xSVD165Qk5jDp/w13i6TWkojkU1LtLYwbI5UygyyE517/vgCk5PmUQD4d4au2hYP8L
         mpQTTgHCNvSc9H1tfVRAvbJfyAC0nt1t8+Dz77WBbV0CSsZZ9qrgPiBl7QTHJb9luf
         yRjBF1bprs4gw==
Date:   Fri, 20 Jan 2023 10:14:20 +0100
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
Subject: Re: [PATCH V10 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y8pbbP+JbkbLwlo5@ninjato>
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
References: <cover.1673340642.git.zhoubinbin@loongson.cn>
 <316ceae02402cffcc641b20890b7e232b531a1cd.1673340642.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Eb+Ewxejn4HT47QX"
Content-Disposition: inline
In-Reply-To: <316ceae02402cffcc641b20890b7e232b531a1cd.1673340642.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Eb+Ewxejn4HT47QX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 09:03:53PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration, so that the driver
> can be also enabled through ACPI table.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Tested-by: Peibao Liu <liupeibao@loongson.cn>

Applied to for-next, thanks!


--Eb+Ewxejn4HT47QX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKW2gACgkQFA3kzBSg
KbaSAA//e3lIEQhlLhfQC7SPvP3P3h0tl8RDpZhZHy6h+TmHAGGX+PiGkXk6WJk0
vH8Xl+zQC17Nz85J2XcWU7VfdeJTLGsE7HQo/wY5YWcjw2eHFXAGsVtfezo9SjC7
I+kAyAgW1TcKfJZYyz1n+KbBvU/1VlGj7851QvI4QD+/OXHj8GPvMyZWspIA3zgV
MOkNAjgg66d2SSTY9rXxv9Vds/ECD0UYSfmmpes3SdynwwChq0a2pCnLuo/c5Ycx
Tp+iCrPBcU1tAeSr64SYwQQ3+czFpOvwQpYNTA+Hd8MRsmlPh2ms1V9WMWxwTzfZ
J/2vbCiuok7w1yqD0rqcKQfJTLuqTDsIMigHkcHNFvAMpKwpBYmVQmi94xhnX9tW
RNwfyGOudhrmrJdXrFmFV8nmiD6mppR9WuYcLbVTs1V7b2DDSE5mC7QYfWfXW3tC
Q/JGBaFkbsaVI5Qqx6YPHV39ArEYktzxT5dfk8tRcaEAdveclUu+NY2y1CqrwskZ
Cjws3VW1Efd3BQ4pEeef899UNzCdUXidwmnR9/tcxh05FBaX5gc4bTWo6BuLEjT0
Qc9bKHunqIKABG5ztekFYh9uRJjl4Ldr+OQz/10e/jCMgAoawli/PHd3rluFNfgm
/f8OXDaTju/99/IeY0atwEv7Z9SiEIvRKBgNvR3U2lT4KVRafBM=
=erA1
-----END PGP SIGNATURE-----

--Eb+Ewxejn4HT47QX--
