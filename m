Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722D16E1298
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 18:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjDMQoK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 12:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjDMQoJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 12:44:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC5093C0;
        Thu, 13 Apr 2023 09:44:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A34E763FF5;
        Thu, 13 Apr 2023 16:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5815AC433EF;
        Thu, 13 Apr 2023 16:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681404248;
        bh=bZHaxOVvbCI9BInHBeqyKIDI+UQJ67gmJoVEA2sM1IU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UHzt3Jhc26A9YNZnmjWP/XVhPfsth6NUPuea+2VTONzo6/zf+87tFUbbVubtWCUZE
         vOhKw25L6BDY7wPwF5L9GDswfBhIvvR5X+Vbx/n0EB/jeGjTfvj9cqvVN4DBdftM0i
         aEkTi+d0qSfRuP19CRT28zUnQFC6z+Kun02QRs398Pbc7nrKJzb7GR8uWmoTlCpyNR
         PKj98V4XUxMCQF8FTbkMXZeyq705Tbu7BT13zQPtwJGzc86e80pL0wmbE4zldCVxOa
         tav4B0jH3s6YZu8eLDDDG0oChdbnWsJYgX7vN009yy8hoB7Ax1vDQ+xFXu0Hx2JyHY
         sLYwHGkrHe1nA==
Date:   Thu, 13 Apr 2023 18:44:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: cadence: Document `resets`
 property
Message-ID: <ZDgxU5KeW+APspGe@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230406154834.171577-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g8NGbeUkU4y6kz5G"
Content-Disposition: inline
In-Reply-To: <20230406154834.171577-1-lars@metafoo.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g8NGbeUkU4y6kz5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 08:48:33AM -0700, Lars-Peter Clausen wrote:
> The Cadence I2C controller has an external reset that needs to be
> de-asserted before the I2C controller can be accessed.
>=20
> Document the `resets` devicetree property that can be used to describe how
> the reset signal is connected.
>=20
> While the reset signal will always be present in hardware the devicetree
> property is kept optional for backwards compatibility with existing syste=
ms
> that do not specify the reset property and where the reset signal might n=
ot
> be controlled by operating system.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-next, thanks!


--g8NGbeUkU4y6kz5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQ4MVMACgkQFA3kzBSg
KbYjYBAAnhEiBtn6Ev+NasvKWBZ7ReJ+2zFO//7Co8yoo69z6PaPrE4PwghlLs+7
CA9+j27ui/zDzWmIDRBT2IfrzJbgD92qQz3T+UMwnwIH1rCVwU9nc3mRk5WKHKGb
pQisqAbwuteH7j31NYxRPwBRZK92bUH0bVFY8zrcwxbPjQxdSs7TzSRctoxYEZch
JusYS+UVE9xg1Uq94eaxQwzUTALNnjrRtVAM/a7iVh9wHlQKcTililFQfTC2ei5N
m+fmCHbT+GpdhC6gB5ZwRNkxdpIo3jeSLgQW6tFnpvRH9wxc8aDd++cuTmjjpD2k
BB0ccSSCxcH15tqUyqUbKCH9Q2iyEkhktlwWLd1Jtw6t+55mzUp+LKgvWmRpaG0F
HJr9GJ18b8Uhp1OXO4S318xLh1Q2//0mzrbASeIzLhSxZZ4Sccs1NA5I81srx3wE
TcIyjG99y5zTJCe+gGqr9MCU3OTu/A33JvFa+3ajt7oyp8cSH2Pm+8j/tsGhd98g
X7grNdhVg1RrFlJf5fgJzdrEmUB2DqJgPrBbp8Z6/cZWLRexXMuGXle0DCafxih1
0dtGa+rZJmhSFzk+dOQI2VTFXzrIreU/HPU+NR8BtBL+LhzLPMnl7ZLJ7V6fw3bU
IQl8IV81J0hbmf+h/s8BXxnJqwuzzgFLrYomb6ANHwYudylzLkE=
=A23I
-----END PGP SIGNATURE-----

--g8NGbeUkU4y6kz5G--
