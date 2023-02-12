Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D88C693A1E
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 22:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjBLVCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 16:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjBLVCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 16:02:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C51F75E;
        Sun, 12 Feb 2023 13:02:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C1FBEB80D2F;
        Sun, 12 Feb 2023 21:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6892C433D2;
        Sun, 12 Feb 2023 21:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676235762;
        bh=usYk7tvBKwSordnriT3ugmrMWJteA6rsGLzPjt/RMiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WbOyv/q/Cx7dAjwnKoNofXQ2CVEkSxJefCMS60026aP8dLIbOJ0SvPpNQ2oYnKQJf
         pK0G2A7IhOtPQT4RrvO1dHL0x2xqgnSY3OdE3W5cGpG+JgCeNsFiYzgKUaTEPjeVeL
         4atEDSw5838xoctRnXUieJSifztfusn5WqmNTIfJ99FG0pWbX2IpZB0pPo6AQg/GtH
         GtKjhzWn5CewR4hUF10800EgJHCoy9M1Fz2Az7DVPjh934IxQkuzQt2YGekuzX6zjM
         nXxYHKXOwiLlgJl220KoHfaiHyGpkjRTBIREXb/Xb72q+I/DWcQWv1Onn2ZoQ9Qvhd
         isI5EeGKPuIgA==
Date:   Sun, 12 Feb 2023 22:02:34 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: uniphier: Add resets property
Message-ID: <Y+lT6koqmmcFKwJi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230209014340.17979-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cjIa4s1PpX9tiHRV"
Content-Disposition: inline
In-Reply-To: <20230209014340.17979-1-hayashi.kunihiko@socionext.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cjIa4s1PpX9tiHRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 10:43:40AM +0900, Kunihiko Hayashi wrote:
> UniPhier I2C controller allows reset control support.
> Add resets property to the controller as optional.
>=20
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Applied to for-next, thanks!


--cjIa4s1PpX9tiHRV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpU+YACgkQFA3kzBSg
Kbb7HBAAskT9SQbvdblAJJsbIro4PwN1u1hKfLPxLvCryepDYd07qx6YpHu3lr7E
5PGHh+8pdQ7sRAqL10lTYVe2CfNp/3nsenM1/8nDCXB3HVnh+lf87Rjnjqx9kHYI
55qFR7nacqK3xT/oVra8gq4oOVKSp1HJ972+GLqxQY3nuEuxres+AQjgnZhb8VP7
ecSPNDON0XvXxnmdAFbpNJD0Fe/cEBdqW5Fyr8zGagvcHW/RxqgKDkgJYhwh3pS+
RoHopSvadYiNTaKbrKbqCxdv5I3v17iuyaGZmOBfyc2n8rzBjFzOcH+ieZlPoLz3
iyOM/6a89ZrSO1lBbSuczvD8hIovs2J8+ardJ9JwkZyaiFXM/F7gIsT+CJuVNaqS
8UqiaOOe4SoHyvvqUuFT5Dkbl+24mw/kNt5sOTgHnB+hLf4AL1hxz+qPAMOriiDa
g/Hfha2sU1n8yWPX1HV5hp0tKb5A/6aqF9/GSasYn7tszhIMmFdgvN43lGuMh60Y
fHj6IK7TToeD1ApeH3yDrOO0bHzesQK88YXkiB+SBJkmKztSwAR+NmOdqeNHwgLC
WOUUvjY79LH/BXopi+VjmnQCI/f/kgjhHeHxFU3FEP+FbfU8TlIr5oCbYf01kGw0
mLbARqyk8IHoolktilqUhJvnz1r4Ue9QHp2CSC8TQpieaYMCdl0=
=YxVO
-----END PGP SIGNATURE-----

--cjIa4s1PpX9tiHRV--
