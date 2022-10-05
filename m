Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FD25F5A43
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 20:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbiJES67 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 14:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbiJES64 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 14:58:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F2A7FF80;
        Wed,  5 Oct 2022 11:58:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2B1C6177A;
        Wed,  5 Oct 2022 18:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990F8C433D6;
        Wed,  5 Oct 2022 18:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664996335;
        bh=AZxtBYB8j6Z/zGuXMZs1pYNDfoaFHW6kFA5IZNucOAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YB9rGed3GsyoGFt6oTWcYDF+QckvGcX0PgBeml+JsOsuRVci/RQOn/CpAHV08o+AC
         BMmSfpqyuWeNqfe8K0ROqkVg/+dOC22ZAiad4PXdys/0eAisAMX7NBGH5GJEMYq+ch
         PtPVHbGIKl6XI/T/avDgYzJctIrA7Id9LOMH69MAgNnouNQYYW9EXWmE91+hjm5vz/
         0boEtezFAsZaoaWBY8KSPd8UaY23V8WYO0c4Vml5AWk6Vg4CpTsk8nonhFl+uun4/I
         7XlxrJzeAuQWuA6BDvlRsmgMXntz6yPOT7r6nWqPyoR06PXbEYvz4eaH3cIQgXRUW1
         dr2i+r0vLETdg==
Date:   Wed, 5 Oct 2022 20:58:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] dt-bindings: i2c: qcom,i2c-cci: Document clocks
 for MSM8974
Message-ID: <Yz3T6uTHKTiy2Atg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
 <20221002122859.75525-4-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4/X/2G7AgItRvEd/"
Content-Disposition: inline
In-Reply-To: <20221002122859.75525-4-matti.lehtimaki@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4/X/2G7AgItRvEd/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 02, 2022 at 03:28:55PM +0300, Matti Lehtim=C3=A4ki wrote:
> Uses same clocks as MSM8226.
>=20
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Applied to for-current, thanks!


--4/X/2G7AgItRvEd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM90+oACgkQFA3kzBSg
KbawDw/8DKVQ+9RZE0plB4cd01sqJFQno6fQBVMf6NGG6HCM4wJlJJ4PR5imbmXQ
Vz5N3eKD+Ji1jyeNyzq/afUO5VrcuyZ87wYtGR2FolYEwt+YrjnLC24IOeNPBB5/
b7rhBQiKlqflPzT1Dff5pCP+RF79HyuMNrzMVwETeXF9QwucjiFJF80lKzMPJIIJ
ix9WH2MPEUdRg4AEKQ1Puarxwb2t07bjIOrT7bn7OplUnb540N1r4hwc2Jl4rBUc
GMCihIo6vDKO0yqS7R2pm+H9I2mzEI5Y2VEbSuG1tYFnYj/kKcFm+gL5rUacv0Wn
bBi7J40Pq+YSZwinCwxW3iNsoFfASH1nnJHya08T+iHz6xqCayzCafFfGYhJBe5e
i72nrJ1E96b3aQg9DyCvr+xMpTuxUHnng+6+5WbQGsOtTqSlKyJPvhmWCBrZmm75
Bp42Lor8QVaobbpwiZo6Pth5Ck0vof77qniSRG6k/W+vSRGSKpxZF2FHPm+dQiIo
UO9uQUDtBdreb7/f7MG78iIYnMuFRaJEeOxMLXGlDtieaylWa2QaBwegRIE+2ckv
q4LHd69MFrZxZ8H/c0S8dZ7A55zzzp2ErzkYGfOZN6Lpyvoji6dzAXCKtNAXHHdM
RGl9AVUuNcPVnfExyoqlZwZjAL+xH6ZkikRVa/aWxqm7oAr33KA=
=vjMx
-----END PGP SIGNATURE-----

--4/X/2G7AgItRvEd/--
