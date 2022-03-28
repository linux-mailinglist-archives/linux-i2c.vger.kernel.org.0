Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940724E911B
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Mar 2022 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236052AbiC1JWp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Mar 2022 05:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239309AbiC1JWp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Mar 2022 05:22:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE4852E64;
        Mon, 28 Mar 2022 02:21:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9664160F13;
        Mon, 28 Mar 2022 09:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516D8C004DD;
        Mon, 28 Mar 2022 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648459262;
        bh=6SgxrCPrmqS0tktODFqvuMzjgndQAgUhrj/xmpvHh4k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VOqKlrcw5n5fCrnDcLKWsYpG6wGsSoxUgOS87TDM9r+W/KYbLPZEBEBooUo+DgKJu
         lI+A2yNHm920ovcgPwJsdfkGhAsvhaXDPeiUD/7KOm51ks+/0zEmpbsPdLWjMgCsiU
         MeZIIiXPktWsZxP2I0icg792niK9/mG990iOvp1CIwA08YAW/OMwtAYRLTSSsmqJwO
         maBvgXSdbaCfG8a22ubXh+iPIw8xdu2evEBOm7ikH5lQiO7xrKhXbeD/Xt/A69z1lO
         kL2kfHTIfXY7DSnqzAZGj/Rui9HJd98TCV0A4hYcXgKeteKQK57YKJNHOThD+i1bm0
         SNUThOgB6DKzg==
Date:   Mon, 28 Mar 2022 11:20:54 +0200
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
Message-ID: <YkF99t+NlO+IKMXg@ninjato>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BRjA1LaRrkxytoX4"
Content-Disposition: inline
In-Reply-To: <YRwoAgie/mDDunn9@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BRjA1LaRrkxytoX4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> My point is that this patch shouldn't be needed. I'd like if the I2C
> core could get the driver data from the i2c_device_id table instead of
> duplicating it in the of_device_id. This isn't possible today as
> i2c_match_id() doesn't have the fallback mechanism that OF matching has.

I think the proper fix would be naming the I2C client after the actually
matched compatible property, and not after the first one? I am a bit
afraid of regressions when we change that, however...


--BRjA1LaRrkxytoX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJBffIACgkQFA3kzBSg
KbZJKhAAnUun/HdH5HuXalooyalsLghEfjzj6Xog6EUBuPB2Mlg2NTp7kE1LWAso
VZn0NLtq6NFDqDtF37qEN6rLdS6uLLA026Ao3MCPpJfEEnE4dzp7fXDct0pgwy8S
R6jUZnTZbZ1l8KO1X5T9Uf1KBE4q4zHNM4K+fcfdAqMKlBNt62xG3jJPeYLpjNKr
1bOQBXZGFUenmaTjFIwrIW81hMllw7n295cnxtdxNvdb2NZyzBEdE0Q/9CWWbypK
wa1+DGCJYOx59GhhqSo2OweaergtNAGpEIkk1ve+ZEIgrgHIFWmI6o8QWUbVt0HY
5JAbe+15387oc8mXoTBMc+2jET35ujMhjgrhBxjEx1UYwjkPpcRjk465Uq5GS8gS
8AshMCZKNWDRbAG0MF/0DfKJKoMHbkpZ3tZ4FVG6z+Tr1uF6UGCtOTyMT619dq90
BGEcD2L05S1mSiUqXhAUPDkOKr+SBFBbE/z6VF5HVdGa76byBF7zKGBKqtotLlR8
Yz2EaxaxL4MbjElrURTSfpwaspLFgrInk7P0c2O2OgSC0W1dbKMT7ssqKq7Iu+7j
VXLDaDnzuUSo+052NSJ7vlqX0HNGbsMET585C9S+4yiFWbLvamIowIbShpRKPgry
AQYAFAZOEOrgXMfo8Qs2j2GUpaANfJgGKr76XkLxdgQR/18Ac1k=
=rhft
-----END PGP SIGNATURE-----

--BRjA1LaRrkxytoX4--
