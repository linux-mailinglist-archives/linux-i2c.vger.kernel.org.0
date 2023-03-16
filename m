Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB00C6BD9A4
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Mar 2023 20:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCPT5v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Mar 2023 15:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjCPT5u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Mar 2023 15:57:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722B6BD4D9;
        Thu, 16 Mar 2023 12:57:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAEE462040;
        Thu, 16 Mar 2023 19:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9986EC433EF;
        Thu, 16 Mar 2023 19:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678996576;
        bh=PfUYV+9ZbNdnWPZGJkz3rVty4AE/q0+P1FyVLuVDiTE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UknZIvIYCaejql9hITewhMGmVoY3p/uDlBHS25lpySIMpMa69hr1OzfiivzcyaRnR
         32cfYTtKa+07kLPidicqI+9As3sC1Iw5vs4QKSvAw4mLzxjqiWCCCcY8KaDe6AXiyc
         7s8G6eIQ3BF31cyqhiGVD3qz/6PSi9eJfSNMDPA4hs76d3DN6dInc45lC/ithmu46N
         9DW8Zecux1xihK/JeEy8D0TVDrXQXA+0f/Ymmr6p+GgjX5dcFK7KDKY7Qt22KI35mS
         aNsB8fbblnOd7OTn47B7ZUUZ7BwQAgVlQ3nw9kOafdXUPJ7jPPXuEiCRgCHesH+3Jm
         v9Lalxrg5vtHw==
Date:   Thu, 16 Mar 2023 20:56:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
Message-ID: <ZBN0XAp8jm095my/@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bKW2mF7l2ILB4D6Q"
Content-Disposition: inline
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bKW2mF7l2ILB4D6Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 12:16:54PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>=20
>   drivers/i2c/busses/i2c-mt65xx.c:514:34: error: =E2=80=98mtk_i2c_of_matc=
h=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--bKW2mF7l2ILB4D6Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQTdFwACgkQFA3kzBSg
KbblQhAAhR2X5U38APPQWOy4gWDy7Xl2FMahiZoLJSZeabT1t8HHafaSSbQCKKbe
FvGEcDNCkPxAYqpeUW7gUgWsjRL1JB03UMn3B6TygU/rMD5Ty5RpHQnc16i5KX5r
Ebp+fhOo+BQhjJDld6bot7raM9ifyvq7tkzaiLjXeg1JIgEDklDRtTH6Yp7P3Rqr
irJ20AAKQbUWCwJQ0iL3hraxY+y44Ce3ofqi1e/eUha+4EFaC7KyWdyxXZfY8Rzt
+9G/ZZeBa71grd0nn6U4XjkkgLnA1cYg4o+UDPI//Q0LFl0puR6KM9wo7M4SOJ+1
5m2HSyO0kxbxaWmcB82jZWOCv3yvU7gx5HtOZGLTikSpnlGQ3QiMENwjDVT0X842
wis1bWmVcFq2hsx1XlJyX3jFY50icYw3M+A0pOYa0lWkk+l8Qkdn6LUI0ipq23IL
PTcvRzcu0Wcqatt9TOG9+f9LoV49j+18st5S3/3sOswCN5gqYzDhYxI/p/aDzCXF
cQh29BVe3nKmlANsGQxHDyn2gupsmNN1bCqk5Ny+lE22bMoR4vIcEFFmYVRAb1Ih
jWOH7lw/SzdNkhFjSqD28IHbrWLN1pA0v27UxqTi5lZT52M9qQncJDipBdK5kcpt
vNZa1plwLpOtPodH0cPEdj1xZIwSC/wWCCmbq5GGpoTCeSBb9rU=
=P7Qe
-----END PGP SIGNATURE-----

--bKW2mF7l2ILB4D6Q--
