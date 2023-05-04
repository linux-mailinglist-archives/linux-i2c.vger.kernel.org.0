Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4CE6F63FF
	for <lists+linux-i2c@lfdr.de>; Thu,  4 May 2023 06:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjEDEW4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 May 2023 00:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjEDEWx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 May 2023 00:22:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B273E7;
        Wed,  3 May 2023 21:22:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8BA163121;
        Thu,  4 May 2023 04:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61ADDC433D2;
        Thu,  4 May 2023 04:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683174171;
        bh=gY1ydfARY0H6BviA3v1wK7lwT2Jma3YmK8B9vIKhEmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cdRw7XEP8KRN6VygwefZ1LCfApilOvZ5W5b7JRyLvGeJMM2nqY4t9YbZ7jMZuToHe
         z/VxZZ+G6wQ26oAKmkPi7K00CmsrYKnfP7/73foNFUwecOSyUsBFKEDnuYE874IM25
         oyLTalLQRlyDFFFw1N0sa/w/7gWGu2G0Oex4oyPGuFnXgq4WAOG36cZFCS0bnSZ4Db
         zXw2r5NY5qbVKB8MLwF3PAsMk0rMZI0tzGmwLNvHokJn1L72psOWCKn0zJDNfZ9je1
         RbytrokhniXo7w2JDypXEt2ED6TWdjcFyknN7/P864uI8FSs+OEX6EdvnTgXIP2Rh1
         ntELuzGUeLOjQ==
Date:   Thu, 4 May 2023 06:22:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Message-ID: <ZFMzE2xZxnya8F7p@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DzpMF8U0002ctXbi"
Content-Disposition: inline
In-Reply-To: <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DzpMF8U0002ctXbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2023 at 02:40:18PM +0200, Stanislav Jakubek wrote:
> Convert Broadcom Kona family I2C bindings to DT schema.
>=20
> Changes during conversion:
>   - add used, but previously undocumented SoC-specific compatibles
>   - drop references to SoCs that are not upstream
>   - add supported clock frequencies according to the Linux driver [1]
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/drivers/i2c/busses/i2c-bcm-kona.c#n731
>=20
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

Applied to for-current with the link removed, thanks!


--DzpMF8U0002ctXbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRTMw4ACgkQFA3kzBSg
KbbrHA/8C4xTAfCocjEVRzkGZwzZmYkvNW+nEao9zKsjdszZMs15Y40xKR/4vlQa
o/2vE6uc9LEq0hbl5hlgy10/lYrF3P+tK7zXBZwldLoGUUab3q0QUvqu4x+RsXwV
N2iB521IYtITsRaO94+l2HupvMUEdX4H9jZnrZVFokIQW3Og8xiZVeEA+Gkm0yfB
2hWLQOgO44JGPQHf8mho/b3lTajjydYMRNM6Q/t8e+YtXtW7u1YdZM5Z4D6I2Hf3
hxoNNYT3NqyVk77gnEwpkHdDjFYz7zVMSotlFw1zCS8iqVAHuD/IhQtEeparhM3C
WX+Ah6TGrLjEHqZ2Qh2q2ZrhqjNzPpSRzXv0XW/kzlBGDP9JiKU5ZUxX4kZLbXjz
Uv3p2cOA0madvIyMmEwolTSPxaWWEDvau/N77unL3PmxC5C0aaA7FLqAOILKkrCj
LhkQNuGCGcvnQHpvRrCqNodZuynF5LzK9NNR1qZcAl9myM0z7oTy78qQua2uR8ED
D+dKGCi2YCTd76V1gxCRwM5A2lpAHyGEoDPzJfoIZZbe9/P98c0iJXq4Ba61mKFX
tS4xJm2QHv1rNLle0Z1crbUYQvNXh8Y8AnrZJIBPD4At8MykkPLqJLAzoAlr7zYB
9XSuIoVXoWaCwkaUI9qKTdQXr9tva/0WQCHGMZRN7rRkJCRGnnA=
=2DxL
-----END PGP SIGNATURE-----

--DzpMF8U0002ctXbi--
