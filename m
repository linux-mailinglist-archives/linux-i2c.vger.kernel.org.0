Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5342E7D3A6D
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjJWPMq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJWPMq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:12:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B99290;
        Mon, 23 Oct 2023 08:12:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7819C433C8;
        Mon, 23 Oct 2023 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698073964;
        bh=J9r7nlhJFffvRTO0VNXoLKm58fWmXlezqgcthHqa3e0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MdGy3kRYTvrPOsVt3U6yr74m85OydntGKdh7nkzwduKWQ0xLqzEd4m4bHv9QwYYxk
         Q7e3qLQMLo9O75vuto8tlDZl1Rq0t0gvXPip7obGF5r9/Sg8VCNYJcnm73sYhskdQa
         tc2ZJKxZcw5RI0KvuOx77VQJtDnJBU6Pig/e6xMsxzvnAYpMejAnhyNYksNpxpKeop
         BoLvDwJo9nEx47/Ue+t6Y+pl3QtJs9rx8n7a9PBsqyOi3WRm8rwaKovbSw3zMsmrea
         d6G04BL/zFlz6fd7QcG2bHgPsHMNx7WC+4ta58zZhQQLt8tGuzjtp8p0ymqSR0wW5P
         oWwuP4uUpAS3g==
Date:   Mon, 23 Oct 2023 17:12:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Camel Guo <camel.guo@axis.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH] i2c: exynos5: Calculate t_scl_l, t_scl_h according to
 i2c spec
Message-ID: <ZTaNaH8qo3Ho+yvL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Camel Guo <camel.guo@axis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
References: <20220912085943.1098651-1-camel.guo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NHBuWLbeQWJ0REJ9"
Content-Disposition: inline
In-Reply-To: <20220912085943.1098651-1-camel.guo@axis.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NHBuWLbeQWJ0REJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 10:59:43AM +0200, Camel Guo wrote:
> Previously the duty cycle was divided equally into h_scl_l, t_scl_h.
> This makes the low period of the SCL clock in Fast Mode is only 1.25us
> which is way lower than the minimal value (1.3) specified in i2c
> specification. In order to make sure t_scl_l, t_scl_h always fullfill
> i2c specification, this commit calculates t_scl_l using this formula:
>=20
> t_scl_l =3D clk_cycle *
>     ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)
>=20
> where:
> t_low_min is the minimal value of low period of the SCL clock in us;
> t_high_min is the minimal value of high period of the SCL clock in us;
> scl_clock is converted from SCL clock frequency into us.
>=20
> Signed-off-by: Camel Guo <camel.guo@axis.com>

Applied to for-next, thanks!


--NHBuWLbeQWJ0REJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2jWgACgkQFA3kzBSg
KbaidQ/+Kzl5eb4XcCOXgAi1kIsBaqIK0qMCqygYCEr0/uQi7gVIcTemI0AM86uu
M1M6UwxYcVGms/5kUHiEsCBjHgDVkistUr49W1Dur4zVvHj/aPwDoDgyXwpCGL08
0H7L/aJilgj86wGiDASH8/ZLaYrkV8HKWae+ocXVJDLTOrgWlVyjLnklZpK2e0WL
OCuKjD758ebaTNITimU0BaMZRS08NBXsxlunQN0IaIYdrqa48mSyHb7/EVhcKnp/
AxjWzxmJxtDakVKPCFNHjLFoeUp2NplMZ/pORRR6k6n/rfa9FWTFFxnuO7TTEDv6
lhnKqszlYAjFxyToF5prTQMfzKPqJcCVvEnskZjMdIB2/kZyvsW2v3clfx4R0RHQ
cBdYtEbVeATLDMdAQ3ynh8guAW37/jUF/CnKFOIeuzeMwX3y/bZrDjEwnOmVkyeQ
mli3gsQoZHAaYXYJcKmYE3/mI2gCoIOiscZfPcDbPSOzLzYV19LgZOcYfS7m2+xl
qsJQgAkRVgVFFzlFS78F2iGBTEJ2tH3gInxhP9e+uFgOv6jGkMuPWg71aHcI2Eqp
bLo7xevHVbVu8horeHE9L1UQ1QoxndkuWnPiDPdwaupyU9kD+Ex9u9+SaNfZN/9B
GiC1taDV6hQTabImUOU9x4rME4noqFUM7pPA/LRwGj7RFwC+NiM=
=0Pt+
-----END PGP SIGNATURE-----

--NHBuWLbeQWJ0REJ9--
