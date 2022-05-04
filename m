Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D3A51ADFE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 21:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245161AbiEDTmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 15:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354351AbiEDTmO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 15:42:14 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6E14D60B
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2q9kJ+8J6Nj+noa+ysAgVWxp7HJp
        3YXTWBSQdDFOrJc=; b=fgyqMor8BnT+jCMFTTvVxSewqorJTU4N5FJ0aU8PIag8
        4W70pUpntGfIkHPplckusA1ZSFmtO6vEzkszXgjt0lniXjmK+ga40g67m0uqhey0
        NsgEoY72ww39sYg+FHCmMHBmiHh45LVpx3hd82IsdwMXEzUUk1rpBg9NOM6PYRM=
Received: (qmail 1530016 invoked from network); 4 May 2022 21:38:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2022 21:38:33 +0200
X-UD-Smtp-Session: l3s3148p1@gHM5xTTeEJwgAwDtxwyXAP9dq+3qRUcy
Date:   Wed, 4 May 2022 21:38:29 +0200
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
Subject: Re: [PATCH 5/7] dt-bindings: serial: renesas,hscif: R-Car V3U is
 R-Car Gen4
Message-ID: <YnLWNd8+k7zJBjLk@kunai>
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
 <dd734aaa4e5e0b32864b038b79eafe72907fb99f.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lpHmGhsqe2VKaOCt"
Content-Disposition: inline
In-Reply-To: <dd734aaa4e5e0b32864b038b79eafe72907fb99f.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lpHmGhsqe2VKaOCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2022 at 03:34:57PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lpHmGhsqe2VKaOCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJy1jUACgkQFA3kzBSg
KbYcdA/+KOq/qUv5ohpWgXUssCajSQofvIxykUKlRr0VJyOTFZ9AvfuLieks6ef3
SLHqVP+dXXtBULOUYR/KxM3wouSzv6D08bAqiI175AUO2bk06/wzhjp4YTaWRmU5
cABlT8bz/WvfWkvjBBTOQvV/TQdzGdxnlk/UNGsdnHbk6FW5TT3uMZURJtbSbVX9
+SIuK3dtBAAlj17ptceU1pt+gHzmgcXwwsoJXt81IS85p0X+pjosSjmS+4OZZXME
vtvp9bIAx9MCwk0ZE0CwpDiDNXXnpdrj7CKq6gtm+MvLcoANhf5TJ6jrDXXu7+cy
VGov/kaKccz9ZJT9s6n5AylCANBK78a8bzConwx+E5YMSOK+V596Dv6i5dWIJ8vl
WD8jnOvOHM+T+gxJ8srDEnZ/cn1q+eJ1Y42XwiL+zLHwqOc5Fb33DbFdoMaNsshL
IDGVvLtU33r+ofI/ZDpR2+f9YHuAKhVA4AZLXFOvPHCly9XvNjr2nrGjr+WUD86f
YvG6jo+X4HdiFnYcuWIlqtJETIq6nlsJb0l8sJI1RiVf8EgJySKXYewN+Pl5i663
S9+VtROVKYAqtyiADUlkzCo3TtpUpQcRpuAAgDcBPQpbKw0oRf+anBq7cqd0Mkzh
OMR++YqPqnsky1N7TkTlQIKuwIBU9HmEkYPO1kdCBPDd5yoPIE0=
=YkWj
-----END PGP SIGNATURE-----

--lpHmGhsqe2VKaOCt--
