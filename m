Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A084E1904
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Mar 2022 00:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244379AbiCSXXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Mar 2022 19:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240641AbiCSXXV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Mar 2022 19:23:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ACB45078;
        Sat, 19 Mar 2022 16:21:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 47E76B801BA;
        Sat, 19 Mar 2022 23:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40892C340EC;
        Sat, 19 Mar 2022 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647732116;
        bh=7rNCrigihKYFJsz9mQGJnD95OoZCiJnpX8Y/WhFL9sA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9vIasWY030kTGiFRsRkRw4eze+GOnjq3FST37B19P7HkJJJCB0v8Kjc73NIIS9ZV
         dmfdScdCAGGogjXCOWhp0AHhS8XiwSPTP1/pS6YY3iOGpiizn4Uzycn1g7VHGA1yN1
         RKRSBp7uFk6O8C41fL6vOCll8lAHv/FGMpOjC4LmqWdlKXQiYXbZLzSV4LR44RMMWr
         QyRSa8nWJOhIIH4wVe9zEHeIkSRMHtN/TfoJQ7hqq4Z6AywL0wPL8GYsD7POo6rTaO
         pTozNIfl9JM+kZsu4z7irfwL6Ai+9cn5Kbxou4pohaWfA/3XOiZTIEy8fGYhcpmMtR
         ORIzS8OWT6NJA==
Date:   Sun, 20 Mar 2022 00:21:53 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Lucas Tanure <tanure@linux.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: meson: Fix wrong speed use from probe
Message-ID: <YjZlkRHWsQRVuj4j@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lucas Tanure <tanure@linux.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220301072600.12352-1-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M1jqmkmfi3QEXijd"
Content-Disposition: inline
In-Reply-To: <20220301072600.12352-1-tanure@linux.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M1jqmkmfi3QEXijd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 07:26:00AM +0000, Lucas Tanure wrote:
> Having meson_i2c_set_clk_div after i2c_add_adapter
> causes issues for client drivers that try to use
> the bus before the requested speed is applied.
>=20
> The bus can be used just after i2c_add_adapter, so
> move i2c_add_adapter to the final step as
> meson_i2c_set_clk_div needs to be called before
> the bus is used.
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Applied to for-next with a Fixes tag added, thanks!


--M1jqmkmfi3QEXijd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI2ZZEACgkQFA3kzBSg
KbYFPA/7BD/tp4i2gYsqEpAqGKr1iM9kvlzI8IWgsLobfM4DUGr3pLs/ftcJJNWV
XxlgAWGqjG9YKVNh+o8CWunvGDvxoCZIZoMldP+wiBlLlTmMMXy4mhYMJ9So1Im5
FFX8zbS0bBNPXQXfwI7v523ibOB/fpue0cmM4nVVIY0IGh1/FxKgvpNcTDlLl1e0
4IuVNa0WL3PSdaKpkbZC5bvWUaAFZOoUhDGu0UbfTlyNtsH3DcAxYYPi6xq7xYRA
WHPhfwfKhMf8tvIK4IUSw7LY1fPa6p69TvUOtWT4/tXjGDASgwRPzcPAlpLty6wb
G3T0lun5sSFegy0wyBem98avUfulHU+8KP5MG/lWW5NUOSUL2gL9UQMuFwMj2tbW
OxgUbj7bt94EXfbMVyTaIWLfHduxPAUij2/rWMnc767bbb4vKuV/bMJltnAwpA4C
/WdSUysadIRlvsR3ttPimKE3U1nHxrHG/gvOR+HUkOJaB6wAW0nawotK//jHFftw
rk+16AemIhRy71h/qt+JPYdVpdJbyzMTloUSeaiywmusZl4eNuxRHHEHQaaVPWh8
DqjmVDOyn8DYJIT+vJ4ZnMJnnrpM7RU1d5kWIZYXVDZnlsUSzWhHiSMAZORo43hX
TQIFqIoiAfff05ic3+LIpWp/nIN3yuMf76adaIpdhygCMYJx+i4=
=eJIv
-----END PGP SIGNATURE-----

--M1jqmkmfi3QEXijd--
