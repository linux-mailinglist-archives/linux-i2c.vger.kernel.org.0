Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E62A869B54B
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 23:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjBQWJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 17:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBQWJ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 17:09:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0836D63BEC;
        Fri, 17 Feb 2023 14:09:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 943EE61F16;
        Fri, 17 Feb 2023 22:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A53C433D2;
        Fri, 17 Feb 2023 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676671766;
        bh=dohttyIu2Bl/pSJu7ZcRis3drhqvSiIATad3K6P7nD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JESuvLAQEnqEPF+zw9tWnCJgonovlmjSXmDYYxH2Tcv22pZ4aoxOMx29W0sw9y62s
         V0XJFaWTV4Q+4S7jritA874UJz6+C0ubdrBxiT3kj5SvrK53MfM8RqAmndsrw897XR
         OGB++BEAf0y/A4h5ejiKfqvdPnmAi9bev0iP17i6oL7qxIdE3bzq4G6nh/QB0/Qnu1
         XuBPCZ5M+k6lt9afOl94cZHQDl9hijZE8W2GpvgjIZermehvhvAAeEvUoxYuIsHmN+
         rQnCCKsl2wuO9JCuZlMe6LbO1qZ8on61B8mxvcEDesBseWVwFVIVrtU/k5LsgV5plC
         MYz1olJrfNvrg==
Date:   Fri, 17 Feb 2023 23:09:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add HPE GXP I2C Support
Message-ID: <Y+/7Epi667Kd22Ro@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, nick.hawkins@hpe.com,
        verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
 <20230217155054.99757-6-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kwZfFsG/0xbvXpT5"
Content-Disposition: inline
In-Reply-To: <20230217155054.99757-6-nick.hawkins@hpe.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kwZfFsG/0xbvXpT5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 09:50:54AM -0600, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
>=20
> Add the I2C controller source and bindings.
>=20
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
>=20

Applied to for-next, thanks!


--kwZfFsG/0xbvXpT5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv+xIACgkQFA3kzBSg
KbbKKw//X/yFv2vG58NRX8V/lYMSp8qJfQTvbP+3DEVuOG7CkzSjCWjXURxeVeAj
8lWMgT3wKrsBZm39Z+eN+OeGydVnMzCO8hs7lqNFng1T2zFh0fOeJo/EZKjMQ+yN
QXAu077ea4zVD3c5qmWGJR7dgcMEwtrAT04DtBehkJ0550KHxp6LihkSx96RrPrD
faxpAVkz1RbFH1Z5Fqn+MkvQhxwLnVehnqxykA+ZgiT4LGheNt0r94lJ5a2imR/J
BWYh5RtsWldgKlig2uJzM34yMWXrDsfmhHdEawxAwVdegjK2iNniwHcJ05xIspo/
P4S7F+KU/m5f4AIyraUIUBtxjSKJsk42JVSBOfMvw2RVuRqyPL9dhC+ObssttFzW
j4xZUcHo+Quq+SS6lXf4xCVw0hKHfrXIBBZl8T354kri+3dDkNeZbly2wbbwGoT6
ksj/I5Vwtarrr8B6Sb21cByiisgOi67rwBjRFApHYF7dIYyj3MjAW2BKJxpwugYz
46iB+I+nMXW49205lDWjIVyd3gpVPkOP/4bILc0L8gndRc7K63U7eVXoaV69bhwQ
su0hrDPMSR5POsIYMFVbPYd27MCzJpnSdmistMAIfBMEnXMMaM0j9M3Rcwa1Bo6c
opqHXRbj70It5zmbY/mXPimBJkvLsX9A6X74FUeWvQwbi10kG+M=
=TfSf
-----END PGP SIGNATURE-----

--kwZfFsG/0xbvXpT5--
