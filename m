Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB3E4BB4E3
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 10:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbiBRJDZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 04:03:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiBRJDV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 04:03:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F24C75D1B0;
        Fri, 18 Feb 2022 01:02:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67AE7618F6;
        Fri, 18 Feb 2022 09:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479D2C340EB;
        Fri, 18 Feb 2022 09:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645174966;
        bh=LzYQNSXX7yVxVFjO2YyT7eWRXyx6FxkjYcaZykUxw6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S/Jla8Soyh5iypMN12taGNeLP8SaY6nrkRvlmLIUReDaFalsVirQhl7/MxE73Xp33
         MBsG8n0ra3NTCFV41BupdlA4YaaeHVdwhakb2JZV5Klx0nerw3qhTianlUeTX50OI8
         wEmF2WXuD7GpoT/XmxRF08Kt28jblEe4DvVLkUcuEjIKSE6yF2nQZQ1pJ1feAo+xmh
         kRxsIr36+F3QJH46HC6223DxT5177/HynpTm1r5CZ58akIHy/gHoN7eCCW6EDB4an8
         v5bk/rh6ShC6PIv7ReITd0ACALU63EjGtH+eUT2QPcdxK+7ABpsn0O61JDEURSh9mY
         I7QLUZwZcP50A==
Date:   Fri, 18 Feb 2022 10:02:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 9/9] i2c: qcom-cci: add sm8450 compatible
Message-ID: <Yg9gtM0dT0kiU26n@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164713.1712111-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="354H5FDJe6biw5bX"
Content-Disposition: inline
In-Reply-To: <20220203164713.1712111-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--354H5FDJe6biw5bX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 06:47:13PM +0200, Vladimir Zapolskiy wrote:
> Add QCOM SM8450 specific compatible for CCI controller, which is
> equal to CCI controllers found on QCOM SDM845 and QCOM SM8250 SoCs.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Applied to for-next, thanks!


--354H5FDJe6biw5bX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIPYLMACgkQFA3kzBSg
KbYydA/+Jr94Cdj1PgLH3W4wI0OWirK66gB1JSOwCRBQKfrb43kv8ZrWiboDx9Vk
hb9dB9z8CwNb8mXznfDBZ0lqvrSkOFBK8zJWZ4A63TjsFLyY5dIwjwgRAZ+OZDVk
dySJVvCW0AE92muxXSnoz40YKtj+ThkV52BQjeCi7To8jRvvoHmoCKSkqvaUCXF+
FZv+6NoKNqseN4DwDHJTKnFkOHtGA6lJsO4wdLFL/AS0T9yvH7D0CFFrAQ6aA+v+
GZDZn1/T3q+PwMFtJdcvWI8J4qEC26wES6ELMwOx4kcTHZl2lEfI9MGDniMP420C
KTzWKYzXjZZWLVJSyyTIoCAGjQCT4HUbhg1eJnZue5MT0IboCzQQVwlrk3x0KbUH
dYLBxPVuSXn+xmQaYXLiAPTW7xc5fVT6UxiUBUV1uXJrX39J8K7c7OU5nX/94hWQ
Br5xGNUfs0eJBBLs/5G3osBdke7gVrBNx9gzXH9CsFIN0GHgNhQf4y88TFesWVYa
DdOLla071U7FaUSSff9vkaDlWdOLyraZNo1R+yYssAg5BztuhcxFmY3Aa3yjEMLc
CbmbId7FY0uMCCPDG12RWakIB4rAXw1L8VwDbv/I+pq7w0Y6tdH5Ebv1NQJAI9f/
QPWa69E7FZDneshuufMaNao3zXbynuGa96qn+lB1wP00/Fkq378=
=gQ95
-----END PGP SIGNATURE-----

--354H5FDJe6biw5bX--
