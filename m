Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670F57B5C7F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Oct 2023 23:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjJBVfw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Oct 2023 17:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjJBVfv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Oct 2023 17:35:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEB2AD;
        Mon,  2 Oct 2023 14:35:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AC9C433C7;
        Mon,  2 Oct 2023 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696282548;
        bh=dtMicesKSYyffCRL1N76vJcab9XftRh1uSrvFlXyJlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H6oQheMcpgg3FqmQTqYroj15/fG8I5vXCMRa88CBhuyBN3mstQ0cxbevUHPrWkg/F
         CKAohIBN5cRLup6hOZLTxl8QhgsZcfPFhKm3+4V683KHwb0KhbEZB1Er4FG2UWxrc/
         3/3hQaiaYkmJwXDf95Nmts2yk/jb8tP8wHccTv8XMWqQGsXLAzZu0FhZ6j+cuE8dCY
         G+kk7NyGmDF770sUphucFI1SFADPh0BXdo0kZJpSN1ZDr4WJk6C/0elwsaBHlvg6oQ
         HJHC59BhXeXOxzJI2bFY25gngbeZSVqYCpsQFCJsS4AlrkTxWMLrsrGv2k0fw5yYg0
         dzz5bV0LhI29g==
Date:   Mon, 2 Oct 2023 23:35:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: qcom-cci: Document SC7280
 compatible
Message-ID: <ZRs3rlbPAfYJtHJ0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231002-sc7280-cci-v2-0-9333fda4612a@fairphone.com>
 <20231002-sc7280-cci-v2-1-9333fda4612a@fairphone.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KUY/m73HFlcH/V/c"
Content-Disposition: inline
In-Reply-To: <20231002-sc7280-cci-v2-1-9333fda4612a@fairphone.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KUY/m73HFlcH/V/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 08:55:30AM +0200, Luca Weiss wrote:
> Document the compatible for the CCI block found on SC7280 SoC.
>=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied to for-next, thanks!


--KUY/m73HFlcH/V/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUbN6oACgkQFA3kzBSg
KbbccRAAnY69h6ee7uMb2v5YFdYnPQWU+bEimrwo3FXAphFPDwoPoenF6H2hsZ3j
R6GnkgpK6cJekEOZNV5lGtT7EuX8qqea15ap0KKyZ7h6ueX9ZvNVfkD0gUcCDE2L
sgYkNS0ekYs4mwr2LnnaFD3jDaMWwQMZXcZiMubYGjX5Qhzwik428eNjeug5w5/G
/dzwmJBVYV27XL8JOePFgkc013qcs4a1E7G7esmKuLVphiUj2M8/qeoBkbaAqPx0
SsbpMpvCzwWBymeXZTU/8LEkpTGfF8wJoqKV3+KUl4CcdTp05NGlwj3MI66PfZa1
kb/KxyKBHkjH5G5l4R+PnGh6T4+NnQ6vzb6p4rviOxtq1J3us5Vlf5YCHrs73KTT
d7fuo1p7AUQRp3say4pGBKHB0cKhZMMMGIZLvMng1uXHYx+j0lVa+rOsyjMzN1Q3
qiu4hixoqdIbZIgWkSzkNbDWdC7DU7SUpEfZcJbUEx+kczDb3pA4UZXK96ERLez4
Yw9l8Gy5ZRPP0SfVl5/GRVC/OQtgYG8y4MBNle6ZIPDSKJGI+z5jPiksv7lW7ekS
MalQ/bNfiAGlvzjeTT+yP4dj0lghU4kCRg2uuf9D5AcPZzBIsGtZJRPr4U4MFaR0
gkmU7G7J3mS//puQm1tAdhnqArIUX/UMUqA6Crn3Re7EettcXX8=
=RDHQ
-----END PGP SIGNATURE-----

--KUY/m73HFlcH/V/c--
