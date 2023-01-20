Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A63D674FA4
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjATIo6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjATIo5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:44:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6760879E81;
        Fri, 20 Jan 2023 00:44:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 237ECB8206D;
        Fri, 20 Jan 2023 08:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74396C4339C;
        Fri, 20 Jan 2023 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204293;
        bh=Pr33/bdiK+y0I0R9gvlNXOOi2EdjVDGxeUKichdJAzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Su5hCWuQjgV/o1ATkjY1ko+d1yNh8WgDRRmCRixYc/FdMAkRuSYdSi7pHmRJqm2jj
         AW8mgxLKAYF++YdRBctCLsIQZSfna7K0qJH10YCCqBC1YAM35sIwlQeHJpaZvhF3KE
         N6UNWvWi4q9OmAMtgO7zx1Qbdbx7HC4aw8gsrXdskpxi+KYVZWEU5hnjmFnzqzleKO
         Y3MhoSoOB0v0269Bu2Dye337FxJZ2p0ttSen6tXa+nBa8ZWIJ3v/Ovdch6M/p13J1b
         VKNK232Q/hGWbkZkNEBjQPwLhHVFPex173U6kCvcNPFMPeX8LuP99jVAlXtse++Tgd
         n98bJv7/sDOxg==
Date:   Fri, 20 Jan 2023 09:44:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: i2c: renesas,rzv2m: Fix SoC
 specific string
Message-ID: <Y8pUg1wO4ClaesA6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230117175017.21239-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="B56/9tp67dbgWBKK"
Content-Disposition: inline
In-Reply-To: <20230117175017.21239-1-fabrizio.castro.jz@renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--B56/9tp67dbgWBKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 05:50:17PM +0000, Fabrizio Castro wrote:
> The preferred form for Renesas' compatible strings is:
> "<vendor>,<family>-<module>"
>=20
> Somehow the compatible string for the r9a09g011 I2C IP was upstreamed
> as renesas,i2c-r9a09g011 instead of renesas,r9a09g011-i2c, which
> is really confusing, especially considering the generic fallback
> is renesas,rzv2m-i2c.
>=20
> The first user of renesas,i2c-r9a09g011 in the kernel is not yet in
> a kernel release, it will be in v6.1, therefore it can still be
> fixed in v6.1.
> Even if we don't fix it before v6.2, I don't think there is any
> harm in making such a change.
>=20
> s/renesas,i2c-r9a09g011/renesas,r9a09g011-i2c/g for consistency.
>=20
> Fixes: ba7a4d15e2c4 ("dt-bindings: i2c: Document RZ/V2M I2C controller")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-current, thanks!


--B56/9tp67dbgWBKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKVIMACgkQFA3kzBSg
Kbap8RAAhCPMVOdcA8CClFqW4fB9Qy3NxY9CuuZdaF0Qtn40/iHZqcpZsChuW0GK
+RWusliwlpmK5HRTV6koNxOVqO58JBnmLtcB/VfzCYRvKkd+OF09TpVYNWhMuEiY
rHdOLt+685qQtFSsHBS4s6u7Yt7fa7WPTrplCIx9sutqIFaKGc/zx6HdhZVfWkmS
dbTkxHlDK+w1VuvZhVcWugVWDF3iJIRFUuzgsxvKXwhK8m3mxQGRYyMpjoyGIV8+
+SN56fc6UfyyMDAvHgcQSLOyk+yqoMED2OBi33eOh/zrizRfjK5N8tj49RlUuUJw
WZOq+UwPBzXpE7Jdmf2cbvILMqDPGn2o9J6j+9qA3eNUKvviOj9epI6OmIIkyx7n
lwAgqYCXSRyIkd9qeu/B49HcwgMtBSjVt7Oer8/d9rCB8qckr88Z01yyEruOeYwp
XOdROQfwrixxAMSWj3H+ZeHCOKIp2N8e5QxoiSsSPRPUL6udDiNiaeGZqe9zJ7x8
rd02yRC5V++GqiBzMj5myjCAPrb05COvOrW8h9gPO7woWH7kGNgBm3J7rCVot/K4
Q0N3T1v1imsVZNNH2EotKpjfrRl6ri5hiMCXcChUzRccwjyGhLFotL3QzCQEwVzJ
dH7Pc30u25TYjximHzrc3QpY3R2jxBublBJE+aVRL4XHis4bwwU=
=n2wc
-----END PGP SIGNATURE-----

--B56/9tp67dbgWBKK--
