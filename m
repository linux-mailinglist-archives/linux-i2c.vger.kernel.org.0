Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62ADD4AD8AC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 14:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242185AbiBHNPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 08:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbiBHM4J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 07:56:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38750C03FEC0;
        Tue,  8 Feb 2022 04:56:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E4BA0B8199A;
        Tue,  8 Feb 2022 12:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3C8C340EF;
        Tue,  8 Feb 2022 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644324964;
        bh=Iz6QDWYe8a6FBB91FHO8w5d3p4KkbAejk3eFgH4kqWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XCZhmtIv9rvQgmEv7vh4q2IVsFpx8eJK2yo5486AXmuBRltLvBFKpaQ26fZJfNsSP
         NdweG327MQjDKhunx44GQHKn0aAeu+9keqMgrwDxm9cTpBbhOZYsYA8Ref6/o0r720
         V+k7xA1XvwAM8gFUS3FFMnOq3dWuhCyQGolYqji9uNNSBf+H5oNj5x8NP8eyA5QTn4
         jjHMzv2SbKSpb/GrVRIxstjVkpVR2BXLdWYae0N9euemoVqbDKihc4Iw3GIE/nzXbE
         kl1kXcvu59nrgla8WItdKnxAcG5Z551aB6RwiOSj6EB2mTSdPfJv83RB9G56BgXp5h
         PtX8tYhORLl7w==
Date:   Tue, 8 Feb 2022 12:55:59 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
Message-ID: <YgJoX+Ajgt4dweQJ@sirena.org.uk>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper>
 <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper>
 <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk>
 <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MNHkY84JL65Tm1Wd"
Content-Disposition: inline
In-Reply-To: <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
X-Cookie: This is your fortune.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MNHkY84JL65Tm1Wd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 08:31:30PM +0200, Vladimir Zapolskiy wrote:
> On 2/7/22 4:39 PM, Mark Brown wrote:

> > The bindings are ABI, it doesn't seem like a good idea to add new ABI as
> > a temporary bodge.

> The bindings are supposed to describe hardware, thus it's natural to extend
> them, I believe there is a trilemma in this particular case:
> 1) add optional vbus-supply property to all I2C master controllers or I2C
>    busses in case of multiple I2C busses managed by a single controller,
> 2) add optional vbus-supply property to all I2C slave devices,

If you add a named supply to all I2C controllers or devices then if any
of them have an actual vbus supply there will be a namespace collision.

> 3) ignore peculiarities of particular (multiple in fact) PCB designs and
>    a necessity of adding a regulator finely described as a pull-up for I2C
>    bus lines.

There's also the option of representing this as a separate thing on or
part of the bus.

--MNHkY84JL65Tm1Wd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmICaF4ACgkQJNaLcl1U
h9AnBgf9HIMMDL6iR3/JslfiIXW5kstK7gnFRptY/bM55vmUXKuO/LfTrUSS7S6e
zwfAXhBnHMl53aosIq9E/Bra3H0906AOR0S/nmiEb9q/bLDZqkngRY3qQoS0uwbr
gyv9Hpm8qPn2tqAwjQvcUOUDsj2wKqLvrYzxA0HqksvVtN3t5ApTdOp6Ujoy7rmD
7s6DPclKi3JdD6vn1Q7jDhYOXmLr9xSnX6VUorZe2tNniABlcRNB+LYKo9iqWUGP
jSsmyDlwT2WDXKXTLM25cvIUVSaZBI8q5GIkb/1dfwZwIes/DyN5hxldTjYOpf0N
wPfnM0qxGK5Zm8jy5GJo4hWWq3y4pg==
=3YVL
-----END PGP SIGNATURE-----

--MNHkY84JL65Tm1Wd--
