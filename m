Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0358662504
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 13:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbjAIMGy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 07:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236710AbjAIMGw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 07:06:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FDF63E9;
        Mon,  9 Jan 2023 04:06:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 437C461007;
        Mon,  9 Jan 2023 12:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2449CC433EF;
        Mon,  9 Jan 2023 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673266010;
        bh=AqbSYbl/o5DPCPMgMIcTvuLGgaWS0z8lzyGvmFXnwfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bEwoQd3kbCwwy0sQwoWD5DTtLsCDnBOWHHOlkVnVLIW8SvGly+6Ckm/qiHO2gJf11
         w+ABijf66ehFil3sYsQD8/1BnyPa6SsQX7i7lWido4PCcgXPU4nePVcxPkoO/42DoS
         pm1UoxN2ak+cxVhgOICu70FfM0P/X6ai2y83yhJyoLWKMZb9yMOTeq/VVJgzP5kI/E
         Dxfxx4fwggHBmZtQmWLZXMVnACV13nVzL6FpaaSoAUEaRBslpqqWR71owc6IU8BWIM
         e0AV31dZyazVihw7hvq1TYij6Y6WQRFbmqt16PGjrKF/DeUvURIscbCzcGPJMvZldh
         Q4mab6iyKLWKg==
Date:   Mon, 9 Jan 2023 13:06:47 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom,i2c-cci: Fall back to
 common compatibles
Message-ID: <Y7wDVymp2vh3PjfV@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iyBT8AW2OobccRSU"
Content-Disposition: inline
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iyBT8AW2OobccRSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 07:33:00PM +0100, Konrad Dybcio wrote:
> Almost every compatible string in the CCI driver is a duplicate. Adjust
> the bindings to include a common (first-soc-implementing-vX) compatible
> to remove the need to keep adding superfluous compatible strings.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Applied to for-next, thanks!


--iyBT8AW2OobccRSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8A1cACgkQFA3kzBSg
KbZHaBAAigjdmS+cqW7RZSQyVkeDV7V4ONv2zi0FLCRbn2XCMrjT87h7jNicqtlf
g/Tiq69mpI2NRZhcj7480u1kz1Ua6ouxQ8+7KkzVXiZZsMNnSkYTQvx6VpUSxLsY
LVj7bvQT/5UD0U1g/hAfyOVNRmNIcWk6YhQuZHzaCyAP8HuVPEx4kCBo31yGEhF1
Ss1bXqPzMN1tptMS9DtXi65waBkgaRLxL0xWtKBWIdmPT1+/xI39MidBWw76q1ed
ykPtm3O+CGMCsq3PR9dHv6/rs/NDPIBYN7D0cKVBAUzlgka6ABWdT4Am2YflRaLx
/RUHFjXKKx/zYAjw0c+3x+ZW7vJKeI+CIeVod4mVdiYDQEtMf7bbN/FXCZZDJiv+
95ulmDc+4L9sQ90JbEh4rgRu7cR6i/jfE2f3HBQogbIh0g1Xcb2swopmMf94IgN8
IHrRZ+ViM4H80ARHbtIkwEHdzbdWB21HoRfCU5YgkATIh7DZb9v2wmXaLqFFgyl5
QYyZiMIgHEAXDFhO55R875VhLTMku2kONwid879k8EVPlKP5KmWYv83IIzEwklrX
btWJa3tTTHS0+WeyzbAyBwLbTN5v/hlrGEdZJ9M1JM1711Vl6uxOd57iGmhr4Ttn
lRMQa0jqLmTxfn+DEACzZB5FgJo+ALFUmTB9pNUgbto8hSIlYL4=
=aYrz
-----END PGP SIGNATURE-----

--iyBT8AW2OobccRSU--
