Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9435696C0
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 02:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbiGGALN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 20:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbiGGALN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 20:11:13 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CAA1E3F8;
        Wed,  6 Jul 2022 17:11:12 -0700 (PDT)
Received: from mercury (unknown [185.209.196.172])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 807CF660195F;
        Thu,  7 Jul 2022 01:11:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657152670;
        bh=xe2QQQvpUl1Yjfdt6nmwK81IMCIblWCHN82b7IvdQ7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jh0zfztGXTR3/xe4d0d15Y1k+0S9O2tRQMs/I8M0LxTMYhMw86aNOZlD6eAVdrsGP
         SsqbbRmi6WZQ6R/zixuJpO+E/M9+7amlxXaPystowObEZ4c5qRstBynEw8A6eQ77zW
         NgoNMiTrOIKO5uF1zF8bkY1d+GK2t9ho86mb3FJa9jkMjNrxccPQ0bIMSLUkTBNyyU
         VCmP/5WihONUqbVsTgHYx8GFrMDY6CjdT9Kvq4iSze09dtcnMatH1N4JiIUqD6FLIp
         23W958j6IIEqnaxO79ikhAEYsLQIByAxn6r8lrXVsXR1wQaTJeBcme+1C1zvMUdIsA
         l9Nw/ta5J3Taw==
Received: by mercury (Postfix, from userid 1000)
        id 9F0F7106069E; Thu,  7 Jul 2022 02:11:07 +0200 (CEST)
Date:   Thu, 7 Jul 2022 02:11:07 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/1] dt-bindings: i2c: i2c-rk3x: add rk3588 compatible
Message-ID: <20220707001107.bfdd4jefwzqrrugq@mercury.elektranox.org>
References: <20220623163136.246404-1-sebastian.reichel@collabora.com>
 <2664d6a7-ee4b-9cfa-800e-e97522e3986c@linaro.org>
 <YsXjrUVbGIObUroU@shikoro>
 <a965913e-39ba-640a-0d36-2bf7ecc10e94@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3cpbanhashaymclp"
Content-Disposition: inline
In-Reply-To: <a965913e-39ba-640a-0d36-2bf7ecc10e94@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3cpbanhashaymclp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 06, 2022 at 09:55:27PM +0200, Krzysztof Kozlowski wrote:
> On 06/07/2022 21:34, Wolfram Sang wrote:
> > On Sun, Jun 26, 2022 at 10:22:09PM +0200, Krzysztof Kozlowski wrote:
> >> On 23/06/2022 18:31, Sebastian Reichel wrote:
> >>> Just like RK356x, RK3588 is compatible to the existing rk3399 binding.
> >>>
> >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>
> >> That's still some old tree you are based on...
> >=20
> > What do you mean by that?
>=20
> The patch was sent to not updated email, so I assume it was based on
> something before v5.18. Could be relevant, could be not, but it raises a
> question what was a base this (and other Rockchip) series. :)

The last round of rk3588 patches (incl. this one) are based on
v5.19-rc1, but mail destinations are not (I do not generate the
mail destinations fully automatic).

-- Sebastian

--3cpbanhashaymclp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmLGJJgACgkQ2O7X88g7
+prl1A//YrykhjxrG0HEDx+TLLA0SwDdxCSG6YY1iGcJMxRU9tkVV3ibRr99xXrb
7m0kP5okAn4hfNkEhy4/p0Bc7CDo1IYrk7TWcUM2MvrhqSg9ee7h/pfAOn2DzbEa
XuSPUgMaYuZPkrtR4vYzJVctcDixqsVQ+HqKQsHbqVXtNtIiybou5DrSPOxvZ7ye
umXeqS70Ku1DEIA4oexJtFVuV2SB+7S2bhNSgy1SEtlmxbXarSq4cED5FudXnc9s
Tw06dBYH7HInuatwxZFCmaaTGbzjSzhIxPhb/Ufbzr5HpsHaLUBUIKucPPCHh0XO
Yr2ta7ORl+nE8Jd7bFrhYXev9jmbGKYVCGNlDsW0bIaC7D2+saDgDmMXJui1+jd2
K+8fbJf6pnKkfaO/HtUBiJ+kxBC25WBGXA75rUMNEw+ZQFDoBoWF1DR3SRWqoS5N
DyXkafXpBLhA9mg+KaROKpE+qsMG7FCvFbSsnI2/AcvNbu0LRJVhMnyXald/sNTZ
lx83sZf//01jITF+XRnyEJvybsAEQscQ7WbbSNLkwVT+tghWkP4WIdjj0icU33JG
EBfISd+pH0C0IP9zfiXKHyRJA2t/8a7Pv4R57PKxCB+Wkunt4EwlWYyCAyfuKt9Z
kglZijIXe2sh07i/HElia2WSWYmpAYOpF/LlbHZDrtju727BZyg=
=5RhB
-----END PGP SIGNATURE-----

--3cpbanhashaymclp--
