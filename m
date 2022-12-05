Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF686425CA
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiLEJ3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiLEJ31 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:29:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0784F15A10;
        Mon,  5 Dec 2022 01:29:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 982CA60FEB;
        Mon,  5 Dec 2022 09:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76619C433C1;
        Mon,  5 Dec 2022 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670232566;
        bh=wOIgdTS5+LY6LwdutNtlRBp6YjjmQTDkbAMmitLdD1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GQ2RDXp8WvglH0rSpUX/1WeA08ECgYx2FIFjWSiXtTpV8IfDvna9baL+JeeSEw1Ub
         Yu/wY5aAPIq8F31k4Jlb8hJRgMHWZ4K8gGkMWE2Of3thjL4UlC25rebTEHKdgsk3WA
         lMKF8XnGZRVqT943qlWAuOkx4yrB8uuc3csKhfF1cQRIVSze2G8Km4I2h4t9RJvBcd
         wBjV+LhQPaFNv4Q7nLTUn0IaIQA84YO531XzvjYZpOjbQj6IVKnTWL47bsHdJtHUXt
         WwJOhTt8HMShlZyrwBFm7XxxWExVBE/wFWT+cCYSWzWMkqwaL7/o2yYp/5SbLLp+6M
         maRTYm8/gdN3w==
Date:   Mon, 5 Dec 2022 10:29:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V4 1/5] i2c: gpio: Fix potential unused warning for
 'i2c_gpio_dt_ids'
Message-ID: <Y4258kcvPwtA5YvY@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <fda9f8bc2477a3a49bd57ea219f88b4199c2163e.1669777792.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wVwLnbPgqIqSgWNQ"
Content-Disposition: inline
In-Reply-To: <fda9f8bc2477a3a49bd57ea219f88b4199c2163e.1669777792.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wVwLnbPgqIqSgWNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2022 at 01:55:51PM +0800, Binbin Zhou wrote:
> Dropping a matching #ifdef check along with dropping of_match_ptr()
> is just a cleanup, while dropping of_match_ptr() that has no
> corresponding #ifdef fixes an actual warning.
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Applied to for-next, thanks!


--wVwLnbPgqIqSgWNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONue8ACgkQFA3kzBSg
KbYrtQ/8D4XmsGL3LvHHPDjn+Ghpx73AUmU0ESeUC+sIovCGAGClW2Y9DKAeP97v
JJINAq5eJ8OStqmVGQCsqz8T3erEOgnuy3Od+5Bv4pK9yJ0MdL5jWYICMUYDpc9x
ImcpuUD+6sGFbSIYL2iWTkFqGzu37sDmHfQdTD74/fBGbzG97XhkSwpmTTLzbaP8
jAVVMT51n49VedlMktCH+ACJwM2M9Vf3mbm/TaWdA2VxkWRRQ2M+RW48Yk6qApEZ
L9a1yfhof1+rbbOtktMfRMLKzPgXaZyvvBk5l3rYYrcCI6tQIJ64QX2+NDXytHVn
HBQm3GwdqYKzP8HeLHlcWgEQpu45m3Grv/IIPCJe9zLlQ7086Newy1u/y6wmig6+
y5UMTFMyKpLqC7DrQE8upMEDMfpTi1ztLncxdE7cIUCvhhP99awrR3TqJJ0so6gB
KkHAD9iSpyclHO0ygZtT3/XznBqYDP3v5d2xZh2bSZlsBLf5yzWZMKoJRurVszrc
eR+dygg3cpw6jm6ZK00jrxPJsrT5SOA34xMeYRkmROxkS9g1WqXaGIign7+ucCLh
zYD3Zkui2O29A7wl9rScQaQW7QXIo+KFSU2393cRi4+D33AMs/2mEJJIIMMPoqs9
FT41Yo4VG6yvdsgwsn0VosygKhjOrNS9FuQdcr10YxoYBDXo+yI=
=Xr/Q
-----END PGP SIGNATURE-----

--wVwLnbPgqIqSgWNQ--
