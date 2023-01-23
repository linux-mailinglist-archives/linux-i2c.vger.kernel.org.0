Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE59A678A81
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 23:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbjAWWNb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 17:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbjAWWM5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 17:12:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316B4392A0;
        Mon, 23 Jan 2023 14:12:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48F85B80DE1;
        Mon, 23 Jan 2023 22:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDAEC4339B;
        Mon, 23 Jan 2023 22:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674511925;
        bh=T4OUyD+gMfLi4t8TV225tN/XhFfB3kBwKhfR2EqDfhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yoi5yYwgUE0ymFOJ1VSucmfsRg0usKoyceuEV9GVihlqvhT4KlLQpeJxjvfHBUfuV
         lUYtSOA+6yT2GzMcuxA70lIyvs9FpfgCascM2kx6pPGdtaZxoSTV842ZbsQCXsvcTz
         uAhwYAlNJaC6mW8bvw4NRibMBoJzrdi74v3URwlH37xT0lWKEiNgrsR8G7mGUe/Vuz
         SPNC1EMaCc351AkUQurhLr3keaQrqWTdrXgNcbf6NFHOcGzL+V1An5Wo8XCBms9vJa
         DRp42l22VsvfUH4jBtrDR1yn5OPzFD9p75c4l8lAqKRNe8IenOE1A7tpMEMrofmmpk
         piS8ZcYSw9Lpw==
Date:   Mon, 23 Jan 2023 23:12:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document SM6350
 compatible
Message-ID: <Y88GMAjn6scr1DFv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-1-15c2c14c34bb@fairphone.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M5DjASHqtfqGSqrR"
Content-Disposition: inline
In-Reply-To: <20221213-sm6350-cci-v2-1-15c2c14c34bb@fairphone.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M5DjASHqtfqGSqrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 02:13:44PM +0100, Luca Weiss wrote:
> Document the compatible for the CCI block found on SM6350 SoC.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied to for-next, thanks!


--M5DjASHqtfqGSqrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPPBi0ACgkQFA3kzBSg
KbbLwg//S0qCFdJcJKzs8y0lQOit1uSGRCIm5yWVdF+aF/DEDoeg+rAildQMvdRu
feERgXqbEJUHtNLH1K7K9BwnhTAcvUIGYC79UFz3OWmZiMaX1Gl8HPTJXSc4Y9wy
GWBGhl3QXUGDeyApIV33sLSauZe220PXg0Zw/X/5WTZo9R+KnkoL8JqvNJIQsQ5v
PwQ3c6UJUjIuL/wmbqM7AYe45UOGmsPi87nTgbdJFbgMvXp2xD37e2Y2LcYMICh5
M1iknYmk0FMC2E1rBAwsGjmgwyYtbIEGMJqK0qkR+cuTu1KD0Fv2Z2nGQJh4TcK1
ftkGfPEKQAzvm1GqH5ExzpijZU9/c8lQIOaIiHul5CxPJEqBZgn2KBj+1OyErfbH
nL0ymeXrDzp01/gqrVwv1RYpg+wAzuie/uxXjnAJ2vInvEVx2osOy2sykP1Bg8FZ
3Q74VMCQJ+3kM+BXMh9sEinr8aGs8qGEUIXL32YQp2dG57T3V8teqDJamYOMXXpT
U0d7ff1Cz1FPYKkNzX2b9HXgsEbjrBh1XGZaDjJZTwbJuXtnN12lER4u+PzKaGZa
aUSZ8ugLTSbRxCAJTPARXUGBTsOKiuxGTvYS/tYe1Hm/zHVGORUeqlIcTHuxswdV
4PYbYwEE1eFwVxhJBsxsxG7XA+3OYWR/4HKnkqcgGWksO7qf4b8=
=3gYL
-----END PGP SIGNATURE-----

--M5DjASHqtfqGSqrR--
