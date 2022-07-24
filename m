Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9133357F681
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Jul 2022 20:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbiGXShh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 Jul 2022 14:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiGXShh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 Jul 2022 14:37:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE02E1182E;
        Sun, 24 Jul 2022 11:37:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71DD3B80D89;
        Sun, 24 Jul 2022 18:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612C3C3411E;
        Sun, 24 Jul 2022 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658687854;
        bh=ARaM/AY8orrk5E15IHGk3fYmL7GN5hA/qgtwzo6nQZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O1Pt6N80/hzePO86rJpe9HBUAqB6ZyD3y51q8inAq1r4VqGSPEQ65qls3qXsyjz1W
         8dprLcWq8Y2Ilb5SjkdhlRR825Nzqyxke4WCkP909l8hr3yR0JlgsfXZYaEjSKyxSU
         1cZ0E4vUpR6s2uZKCcUKnTxOihE1Tnx7pB5GK+li8qwIqjm4hidJu9FW9L0pAJQuji
         7vp3mzF7krjmSd2yVqc7oRfIW4c23kRMe+FV3X7Nqggvdl+fbp5neiaGJFBBnvfmRa
         ZOTfQVojjx44BJYLZNOvqqIbWbNfteFKrFxBQsIh7+OqCK5RGr/Tji979B6W7l4K81
         kDH5DZvVHaf0w==
Date:   Sun, 24 Jul 2022 20:37:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <Yt2RaUJyrOI/LCWN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
 <YtzSzKmakEWe1usg@shikoro>
 <Ytz1LUSwyZ/8LiN6@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="D+gX6qYtAy7sz9S9"
Content-Disposition: inline
In-Reply-To: <Ytz1LUSwyZ/8LiN6@hovoldconsulting.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--D+gX6qYtAy7sz9S9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Note that ret above is assigned based on the return value from two
> helper functions that return either a negative errno or the number
> messages executed.

Ah, cool. I see now. Thanks for the heads up!


--D+gX6qYtAy7sz9S9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLdkWUACgkQFA3kzBSg
KbasqA/7Bl4CQU42JGVr34XBKomZOBaXYOAX8PcqdwACrXjD2u7G/rRVhukdWtUW
IsPNH9TUHpzKBXbAQcu8cNd1MENtldBRXirG6QmcHgwn2hir31gqz/zn/dVwqmxv
ucVRSE8lzb0tpqoIbIex3f6mqAQfWXwfupXuIJDGmZ7XMyYXHRu2YAdunVX9xdPz
vmJak5TwvG9peh40ubvGuDqGAatTfkQZjokJKhzUt+sbVCcledLQkfEap1h/v1TL
2Mk3JNTP6wHIGze2xRHCsQZZ5C3562Nzb+hR5Z9eCncfjWkSfSnBqhOZy6mNfisu
zWm4R2mIlYc7y4jpVEYfBvJ5zLigsbH8z1JP1vNpt2xx7Z5zAtHWAUVBzYKYaBzd
gMoW65wY/4+vAOr1pnw8ERDXjrwKI0M+zxbGqWFY5km/w8UhsxJDrK53gy9jV7+r
fSsmpP+s9qmFKcoojbMFRxZYKMlGKth6UnmPxwcPcbIiIhousQGm/YNqVCG+WrvB
MCwfchIUQkDtFPwJYBp+B4/1Y0oH5WUozm9JQXctix3IGde63ADCikqEEqUq4cHK
w/TLnNR+jQTWrxKiYbrmJUp59BRSHvVJPuDJnxsx30U+n1AgORLQ1Myf0rJ55dH0
ENfBoJuBz3vx5bsU8xvsxmjQaNG9PZxOLzmC8/rpOiHxLeIVUlc=
=sQ9c
-----END PGP SIGNATURE-----

--D+gX6qYtAy7sz9S9--
