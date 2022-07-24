Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8765557F353
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 07:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236898AbiGXFPW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 01:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbiGXFPV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 01:15:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E6163A8;
        Sat, 23 Jul 2022 22:15:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95ABEB80D10;
        Sun, 24 Jul 2022 05:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55261C3411E;
        Sun, 24 Jul 2022 05:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658639718;
        bh=jLHm7X4SbhvW6kSnV20B19m1bkyrmO9RwcNJRsrCtRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OrY+MacxNBvZ4U0njGBCh1te8IDmu8YLM3++iQlqOC/Vzt5r2KPTUy2Gfa7UCFqQ0
         1zh0wAM7+3+uPXjLu4iIS6kUEeS92uVa71sQu03fbr53DvElH8OXBtklIugQ4e9xTO
         HBeL8/D9q9POJeJxlU3GWo7xHzWUwXwvVZ/xP3JUHH9Xgs6vrd8Uso8vTc60ZW7vS9
         xRjwZz+rylM58Udh7qgAyKppp54b54JRXns4Xdp645dLtv9BvIF5wZ+4Y6cGtJPKVi
         Pa1BrDuEmoVWRh+xZLUiAUaJuJPNk7ZRhJhxYwxIifSgDFqntT+X3wOMTuHoAAeu3N
         Qtm2XboEVYkbA==
Date:   Sun, 24 Jul 2022 07:15:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Propagate GENI_ABORT_DONE to
 geni_i2c_abort_xfer()
Message-ID: <YtzVYQyBVLfFY/C6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mS/KBioFEQfj3PqP"
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-3-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mS/KBioFEQfj3PqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 16, 2022 at 08:50:26PM -0700, Bjorn Andersson wrote:
> Waiting for M_CMD_ABORT_EN in geni_i2c_abort_xfer() races with the
> interrupt handler which will read and clear the abort bit, the result is
> that every abort attempt takes 1 second and is followed by a message
> about the abort having times out.
>=20
> Introduce a new state variable to carry the abort_done state from the
> interrupt handler back to geni_i2c_abort_xfer().
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Applied to for-next, thanks!


--mS/KBioFEQfj3PqP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLc1WEACgkQFA3kzBSg
KbY0ehAAm0VLtGkmMNlsgHTX0y9yaSzW3iebmU6G+4BKflGK/B7ETRbhKiB8mf+w
UoFrrcdsP931OD8l/qopwpzkHfv/UHWYf2dSbAD9cvlNinsz+scQmuL7peyavBEx
Pk7cWlEyLbJPKHHNqhGUlmotn2UifPihsSLU5QIGmtAECiBnxhkJ63ZlGhY3conC
rvCSXc1URdQolZFmN9kU00OADCNTmD0uEyiLmaWe3To6h0Hm35Qcsw5wPckNw8W4
sv6yO1LtBqpUSAu9IicrOf3Xu5TmvBrXrG2ie9x4dN1R4UCVSQunoNwCaXBtoXCu
tLYjgetI80nC34CMtFgiWHWnO5KMJFqwx3ro+dKvvCgnkCtGXCj1hGuqUa4/Ytj4
RJzChbCGFxn3rSjzLpqDh2Na+81Q+5yBg6NRy0apZydYGDXPq0RURlt5c/19aeu/
pGpUCAw5OjgVyjHUpX8BgabQshEgWExEuCGfQo3zXVoei9wDafo2/baf3SEYNGOO
xxC630CfmXvAuY5YabmaC4RSuBaFTSdx9WqT7TihmWwIT/hLoa3mDY2dkDBPtk1A
0zfIKIuzlpxRT25k/DLuCKXd6AC6QiClJ/g45VI6XEW7hD3DuO8zCzJ446lmvFzc
GOpx8XU9eaE4THiKOsHhE7+AkJR5GDuBTWgquxZaQzb5jpTPsjE=
=lY0K
-----END PGP SIGNATURE-----

--mS/KBioFEQfj3PqP--
