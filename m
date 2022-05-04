Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE9351ADF5
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbiEDTlv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357905AbiEDTlt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:41:49 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65A94D275
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TGgkgf23iNHhaoSkxSXOTrm86Jx7
        Qux/bkGK37Em5mg=; b=vDllpQVtu4fhUACN74336A5z58Y29/6f8YoYskgikImC
        RdDwgzAwHwGuCbTT20UjUZgVKA1+idTa1TTlmC7jTA3g2Px4LG6jmnnVLhLoH6eE
        t6We6MOGK+ZQfClRvR835fqxwuAAJOeAWmab7BZkJ/FnSEieuT2Ym6vw19JHRx4=
Received: (qmail 1529673 invoked from network); 4 May 2022 21:38:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:38:07 +0200
X-UD-Smtp-Session: l3s3148p1@GrSuwzTeDJwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:38:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: i2c: renesas,rcar-i2c: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLWHLIqhTfoP8Mt@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1651497024.git.geert+renesas@glider.be>
 <a0402ff46027196953fe9c13f60576d40c5aea4c.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kGLyuym/HQTEyUai"
Content-Disposition: inline
In-Reply-To: <a0402ff46027196953fe9c13f60576d40c5aea4c.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kGLyuym/HQTEyUai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:54PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  I2C on R-Car V3U also supports some extra features (e.g. Slave
> Clock Stretch Select), which are supported by other R-Car Gen4 SoCs, but
> not by any other R-Car Gen3 SoC.
>=20
> Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--kGLyuym/HQTEyUai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1hwACgkQFA3kzBSg
KbYOqw//bJ23ewfmiFVcdK0TufqW6sqkNrE0FzNmzZxZ0mDbeLG8bT9fMik5BI1B
dorQJi9Goqzg+o/TwnvsdWU474QRZ4SIEXmSS8n1af4LaYYHR3iY6F3kvYSgoVgB
bjiTXCqwcIKMRVkKqFd+oi6rT0snYpkYKOqu/itKeQOdyqf5736rk78mEZjH84c3
fwoaFApckiRhMER0ewSndwRCUTxcB46XxLe6rYZpTD5i4gzi0WPTt6XG9T7BWzqq
GkW5Gzzob9PZuIsVFsB+e6WMrBapTp5TqyDxR+97AtF/ri2OwJSini0GKFx4udfz
CDXY4LlNuQxZSucu2vpa0e9UuOZh7KfseUl8ymO7cx2U/1/+TvCWIlQzdHiQEGrV
HGYox7x64M/jpi2+g5hFjWNNbvP7e+lLjjtHut8JNbS+TjlZpRU8OLxcNc1t5CCc
f8IRqsbQqkJLHiYW4Jj2ZB4i+SVyxBT9EcXbSorzjrZmFRsfdcu/qS0zcTJcH4hT
GwvvGQFJJ+T16JpT7MtEuNTgjXuoX6P7oOU2f/s6Utnhh55goss0GfIF51ecnC6M
x+2lYPLI9nv9BkYlMaiONKIdSs6BA/rpbss+xpfBbW+D1r37mXRkGLTxQ3fNet+3
OG1OD4Ao6IGh2cliDjrzWH4CLs+8jZgNzj5l5HNKTQAgVdFYhqk=
=f8MG
-----END PGP SIGNATURE-----

--kGLyuym/HQTEyUai--
