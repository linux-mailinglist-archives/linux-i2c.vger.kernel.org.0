Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D454BB4E1
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 10:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbiBRJDY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 04:03:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbiBRJDM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 04:03:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512285A5AF;
        Fri, 18 Feb 2022 01:02:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DEFE4B825AE;
        Fri, 18 Feb 2022 09:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2627FC340E9;
        Fri, 18 Feb 2022 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645174956;
        bh=aIkKsEl2GbDXqPXbKKzQuLv48/u0NcCWEnw8Mk9m3hc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LMUIl/xn37op7CmJ+rWRWA9sv5FrDIVO4XsaAgFm/+MUn0zvMbeSj+pXW3hG8bmJU
         cX+NFi+4KH6OGZRNHGYhl1aN7vYQanetKmAYtwb/hNNTFSxT/iF8qxXUDL0eLyMh0r
         mVvyEUCzXQ/0sOb4Mo0oIB8gXPWaaWQLVudv501UZIjegG++BNxjTD9jEDXL1QzOgB
         MO3Zlv0iHnPL1zUYCBwDxUE0JOaSOTfTyvxJHGTTY0woLukJFhvpvIZ0q5OVknoID0
         q01nYZEVUZj/8+KsqZZ3EWUOSuKfXIManz37HqU/7Ft7L+Olpjm/vBWsMzS2IYacNu
         sJpsMjKcphofw==
Date:   Fri, 18 Feb 2022 10:02:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: i2c: qcom-cci: add QCOM SM8450
 compatible
Message-ID: <Yg9gppmj0bCs9T8f@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bqcqhxpEu4BvQHAN"
Content-Disposition: inline
In-Reply-To: <20220203164629.1711958-2-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bqcqhxpEu4BvQHAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 06:46:28PM +0200, Vladimir Zapolskiy wrote:
> The change adds QCOM SM8450 compatible value to the list of QCOM CCI
> controller compatibles, the controller found on the SoC is equal to
> the ones found on previous SoC generations.
>=20
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Applied to for-next, thanks!


--bqcqhxpEu4BvQHAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIPYKIACgkQFA3kzBSg
KbaCaxAAqa5Xs+mgYuMWfNXtObaIOuOb3dB5Mz8aDsekMuw9Qq35Y/LP8V2dmxHP
ajcMswddYxg47v/Ol3hzX2Jpl+8GVYjmq5ueMuBmiqBrt3roFGYXZK/2i/9w7jJV
DV6rxzcrBmqE4VSn0cc92soTUnxm0ZJfPQig9yA/tTa0LgFoB1rISR9cJa/+l6IE
IntiSx/fst384ooPz+EJdN+nppffpqG+3c8wzTcOE8b0+JUiNUupt6DJb9sDkZjD
WZqUKwbjLweT6jeBnHHa/pG0s+trYn4g7KES7PgmuXB5UeC2FlqcRVX9F6Jm55bm
zVe1PDivHmBeUr7P9jUh+86ptpmiCGGSCbBAJ55SyzXYKNCUNlnwEbbUejDjOsi5
WetuHE4eexU40JvAAoGWSOI6Xb1V7wMQo+corEcaEFoxFuAq9mIlj44l9b1Fb7JN
78bOSrWbKnGuQ24D8r5XzRjUzA03IgUfvaBizgbiOAIp7Q0UnsYSKvbkZIuvRQKm
0tjSjXOn8Fmx0u9rW5hok8CPH3K2ZZn3gjh/AoMBBHam9L0cd6MSszEQJjwkcitb
pX8Ns1EEI+/j42wvFF12x/ssTZvMs1AUv4RWtUlpXK5n2JWLuOW+PWlnfk6TSbv8
v7UgO3pms6ff6lzWMY7w58NF2xsTnf+HLnJKudODSy2Afhn1Xw4=
=IK/b
-----END PGP SIGNATURE-----

--bqcqhxpEu4BvQHAN--
