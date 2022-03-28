Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13B24E9676
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 14:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242407AbiC1MYP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 08:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242404AbiC1MYO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 08:24:14 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B80AC46662;
        Mon, 28 Mar 2022 05:22:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 27FC0CE1383;
        Mon, 28 Mar 2022 12:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD99FC340EC;
        Mon, 28 Mar 2022 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648470151;
        bh=72w8gFU20HUJcrXCKSGMEwgl8fBRS/AFBvxNwk6JnGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MuHU6fhCEu6TnTm3yMMB26mWFsQpD3elQJSLpaCN8yrHmzPHe6LuWl6FpGKAtXRSu
         FoETax8PGlj5wCNZ0lZsfd82J8BsNWVz4kkmZwjVESif15DGVTvDcjnASyfzetcKcv
         1rsH7SzRvH8/exP6wV2Lb8HnroN5ZazvXCwmrJtfRMkUeUN23Lt7pCfgnV2AGX/niy
         hEkTV3cmyuy6vg1TsmD94q7soPC3JK1Dje5oI66PmiJorEGUrMfDeQtlK1XI09jNwm
         TNo2Idza993fNsadx2RMtYfS+h69z9siDvOKgi2JNIa6/qjocvYAi7HZxBRXlODbhZ
         WQvenSnnU3D+g==
Date:   Mon, 28 Mar 2022 14:22:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <YkGogxobUcRddA4L@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>, Sean Nyekjaer <sean@geanix.com>,
        devicetree@vger.kernel.org, Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
 <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
 <YRwi62E4xYcMyyFi@kunai>
 <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
 <YkF99t+NlO+IKMXg@ninjato>
 <YkGIJ5MQoZ7RN6Y5@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c3o15I8VGHFt1Z5T"
Content-Disposition: inline
In-Reply-To: <YkGIJ5MQoZ7RN6Y5@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c3o15I8VGHFt1Z5T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I think the proper fix would be naming the I2C client after the actually
> > matched compatible property, and not after the first one? I am a bit
> > afraid of regressions when we change that, however...
>=20
> That would be the right way indeed. I have the same concern regarding
> regressions though. Is it worth a try to see what could break ?

Sure! Only problem: Patches welcome(tm) or I put it on my to-do-list(tm)
;)


--c3o15I8VGHFt1Z5T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJBqIMACgkQFA3kzBSg
KbbRSw/7B0u6ZB8xyjOWdTiD/uuAitT8hTeEHi0STDG13Vbq6Y0iD5zZD2eIcM/5
cp4QQKtQw+43dTBYm29gQrNdoSUAKgW/d+vbBgbW0xnSdU3l0XOb8hgBdeOqqR4C
ExSuVtSM1w9HI/L7/b6ULqzXdiSDumHp5hn0i5OE8PfW5RKp+YqNnkMUPb+0rA7I
jrcctmix8a66rnfIufdnIjKdxbLEJxzlIGkhXYg5j7ahJhLduzgOC7trSmSCRFBk
rCTivmzVZoobB6SuClI6+xJJaN1rJh+fjgoc98DhoT/sWzD0bsWkEx3xdIHtP+Ps
kknVhHUAevGhfLrFRZkt1vS06a+/pVzMMbL/7tAW7X+AcmileGGXHem/P2c48LPB
IcyXIJ7jlESMQh16ojOK4vcVMObC8+dkFxQsIt32YeZQ7/PmTQVp1L57cmcjC1y8
H78zgLo/MfqjSA25CFR2d07YhJNgkrFLwJrfi9mLtpHxQpDVf51GPpCrtjknX98E
reVblE9iFxf2vZggW4/LXtOVYx/5uc4lXeyRwQqnW4259/1I+x31+3S03v09jEZr
X8cs2g/pyuzTGCrY6LOUgqjkSVdZIJFnLSCbvnICYrjWfLFhkjUFb2fNM+P7FEL9
/mu82bgiFKC+IRisdjVyMGDUvylG0hh2+LuW24SpjLKi3MkW144=
=yVca
-----END PGP SIGNATURE-----

--c3o15I8VGHFt1Z5T--
