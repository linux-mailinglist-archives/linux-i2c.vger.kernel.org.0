Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA505BB2C8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiIPT3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiIPT3c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:29:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFE3111A;
        Fri, 16 Sep 2022 12:29:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E6605B8289A;
        Fri, 16 Sep 2022 19:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E12C433D6;
        Fri, 16 Sep 2022 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663356568;
        bh=tzk3t7V8ttjBET+05bB6lS+OgI6VS5dvuGoiNpicLww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RzbbWAXJW7SXapU3aGxzwC7Sa8pTk/Vea6SsDBwP4M97X8gqO9KDphV0fKC5AJ3Wl
         vjx690OkvIPiDHppuBWeAYYLBTjPddbvzwg6KI2NEBwmLYYgzg0e6OIw17ZO7A3G+k
         Goe3nbhelxdw9W9Z6/NrLurRpLUnEJnVmhoIrFfgnfI9HwbEUW8n3FpfiVQEcjDtJd
         ekxEFMcWS+v/W6PgUYLAu4V3tBLFiK7s5OjNCj22YN2z/uKrmfbtM12srhG7LCzXbi
         /TEdu6ILDL7j5aXufhxCgaon7RVMmIvJp6zS8nk76/4iAuqzwCoAJGZmTUzmOl05H+
         GB2K5Ntnw82nQ==
Date:   Fri, 16 Sep 2022 20:29:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jagan Teki <jagan@edgeble.ai>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, David Wu <david.wu@rock-chips.com>
Subject: Re: [PATCH v5 1/6] i2c: rk3x: Add rv1126 support
Message-ID: <YyTOhBJdK8l2ZTVQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jagan Teki <jagan@edgeble.ai>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, David Wu <david.wu@rock-chips.com>
References: <20220915163947.1922183-1-jagan@edgeble.ai>
 <20220915163947.1922183-2-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F0ZKK/iF5YjAHD4y"
Content-Disposition: inline
In-Reply-To: <20220915163947.1922183-2-jagan@edgeble.ai>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F0ZKK/iF5YjAHD4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 10:09:42PM +0530, Jagan Teki wrote:
> Add i2c support for Rockchip RV1126 SoC.
>=20
> Cc: linux-i2c@vger.kernel.org
> Cc: Wolfram Sang <wsa@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>

Applied to for-next, thanks!


--F0ZKK/iF5YjAHD4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMkzoAACgkQFA3kzBSg
KbZf2g//QOd14HvALQA/110/bhCs/fkCXunLYK8UNZnXsYR3gC1SFnK0uDv2ftAu
L3fbFWEP9Us9KOcFK9VgQhc9sAEtU3lii8YUkaFd3GC7cAOi7p7zEaYSVQDdfs95
IBlHYHC1AbiS8znPoH6arF1nqT9oz9qqlf94rIhnALlasOeErE4XcycottveI4sy
F9upSlApWK1h1sVhYqT+FikVx7L4IxRk7RLbedngeaISQpcT29zsbCmFFkAwET/2
jWcD1X5SVDD5u+iHYc4zrxKEWHWzngDBdt5+0GDPMg62hV/FtMu7ZAPpEuPsQ56s
beDsOcj6Tm90G+pL5/0iXal/nw64YLFHVgzOeBPh3kznID+TBRr4dcxQekp7fz8T
uL0San1A+Oy+E0qgqI+IOvb3tO0UWWwQznYGEw12Uh7dunF04MP/rA3tnyX9yvRR
+nhd0fP6z6Uw3nSaX5ZwR+8pgM3tyBFAmk0O97iprY3yA3rvF3E4+f+rko9L4TKm
e4z2WApfGFO2jwXtYRJ1vl0Bpoy/yibLvqibV8l2ugsboubBl3uvc3r+FOC4oox2
RWtAbv4o86gJVEQPpXCKgDBYXUBYgnNVxEyotl1OEDe6MKAI8NLJkMy19xtwPZHI
/KaBbvaGdDPpinc8FU4Th0jcHLbJTUkLL+eSVLsj8M1gaBzslaQ=
=K0E9
-----END PGP SIGNATURE-----

--F0ZKK/iF5YjAHD4y--
