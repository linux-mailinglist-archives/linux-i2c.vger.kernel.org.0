Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C89885F205E
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiJAWfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiJAWfl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:35:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B44E00F;
        Sat,  1 Oct 2022 15:35:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C82CB60CEC;
        Sat,  1 Oct 2022 22:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C7CC433D6;
        Sat,  1 Oct 2022 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664663738;
        bh=swneQQXOQAQ0Wdj3JPZ6GWV3p1eHW3tC1dAEqKMmuaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FN/w/UsqTzHQtetSNGrpk0tLzpOf9UiAqYXiiR4dlVu+HdPvOUEbPXos9PGL1bZrq
         OutAiAOS2TOpjU5kkOqjlEtJgAz/oEOyO33vrfYYezkqy6IKEoaBn6cCkHllhyY1Cn
         5mEpI5G4Cjs2BEY1ZFatmbEwgUDV0Z3Qbkn+RuLk3InW/y3Ou3sqAgFcoQOXTQaK3d
         J6x/GYkm3iZxbXBqDfO8Jk1DxUQ6BlE6QK6iHA/YXN5tgRhDq3oe57SOQQD++I+Uvv
         JV4mxkxUZWIdgJhVC7em4JMNIJqHyEaL8GZKefL83VxHEoaOB126Jq/VZap4Yi5k+9
         O8rha9OCDcQzg==
Date:   Sun, 2 Oct 2022 00:35:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: i2c: st,stm32-i2c: Document wakeup-source
 property
Message-ID: <YzjAtpv+DEuN0cn3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220926204653.381722-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ix0A9gtV74R/Odxm"
Content-Disposition: inline
In-Reply-To: <20220926204653.381722-1-marex@denx.de>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ix0A9gtV74R/Odxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 10:46:53PM +0200, Marek Vasut wrote:
> Document wakeup-source property. This fixes dtbs_check warnings
> when building current Linux DTs:
>=20
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated =
properties are not allowed ('wakeup-source' was unexpected)
> "
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied to for-current, thanks!


--Ix0A9gtV74R/Odxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4wLYACgkQFA3kzBSg
KbZL1BAAjZo6/BDX8hm/eD9r6tlV4/e5VpfdUTfSK6gQtW1EXGzyfXzWjrh160S/
+VIejBWXHeB/XPuvSVfrbnJ+a5hV8HkjPKXMit49CoEYjtik1N9RPppxlzSoLofP
b1WAoGkO9g2oViNroZZMLSZnr6LJ+z0XZd8+SVpr0ocpyJFa+wzVxTFNUYfT/59b
iXyuiO6ze+HaAsYNq9UeWeXwyi7fmZaDGCRuMuUqUcxG2M8zCPTMzSdboAVwGLj7
wKfHRp+oYbJO4eSSg7lQ6pj9psSxgO4GBY9tUXQb2WaZr0P4hgk4HEjiaXo1FAyy
JKXOx7C5kGWEiFCSa+2moH8DzcWzbHhhRo7IEGHoFqFGWeeTGQNlJwASSQ9tdrYm
zt0t1fMbd/VZr7wsGLkDZ83cdqiZD0t4bPoZOhqJvhEvhwzWJ++V9H+ctjoX9F3h
US2YPc2B6ERQ/kFWPOcXiV4JXhXAjc9l0ryHfES/rtTfnIwPx9+4Nu4ETwaRbiWa
MIzRCrAapWn9qEyhO8EAQP3djyR5bt+AQipZk1ugr0pWERiRLzbOpQfWxDgZFpFP
6VzhcdJxrO9AyecojWhHnlkOtqbVchU8pUBtZKPobMCSFcU8OFzP5BryvLt6X2Pi
Lf2p38U5K4fhQ0S7ECX5hEKMUN5mfvXCnplTKGCGB0xAebJMc0o=
=YoX9
-----END PGP SIGNATURE-----

--Ix0A9gtV74R/Odxm--
