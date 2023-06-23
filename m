Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7E973B55A
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 12:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjFWKdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 06:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjFWKdj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 06:33:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCCEE6E;
        Fri, 23 Jun 2023 03:33:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9FF361A11;
        Fri, 23 Jun 2023 10:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7137C433C0;
        Fri, 23 Jun 2023 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687516417;
        bh=sfFnaH25gpS9v0cJjOQk7EIROwbjYpko9ASJcwzrEhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=boBrJZWqR4cqNFXYKB2+LifLXTAABU48JqZrimo5aUe/KEwbyVHQnSQXUP7jjTern
         u29kc/41kLgjFEy588K6k+AZT5Ax0wr5Sgx78rKzankDx2K9Nm8c4WUMZtuFhPIHS3
         FJb9oq4/syOf70YWA45zzw0ywf/tL+rdaKpSfhkyJWj5Chr2JnGHlZLQGJX9g6Yc/7
         JrQLLTKx5xmSMNPHX54v4aGT/U1WlBUwaqP71+Ip7IJnYCRirjR77jJEIp1nLQRUyv
         QENo56jbyb5xqRbmIZkCFUw01WnipGREXGrtEi4m/8UNtx1bcV6KFaNeC/FzziA2vK
         9gZTnMygAkVhw==
Date:   Fri, 23 Jun 2023 12:33:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sean Nyekjaer <sean@geanix.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32f7: Add atomic_xfer method to driver
Message-ID: <ZJV0/cbjn1Qa62u+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230509132159.4160984-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uknG7jZmb7sNlYPD"
Content-Disposition: inline
In-Reply-To: <20230509132159.4160984-1-sean@geanix.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uknG7jZmb7sNlYPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 03:21:59PM +0200, Sean Nyekjaer wrote:
> Add an atomic_xfer method to the driver so that it behaves correctly
> when controlling a PMIC that is responsible for device shutdown.
>=20
> The atomic_xfer method added is similar to the one from the i2c-mv64xxx
> driver. When running an atomic_xfer a bool flag in the driver data is
> set, the interrupt is not unmasked on transfer start, and the IRQ
> handler is manually invoked while waiting for pending transfers to
> complete.
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>

Pierre-Yves, Alain, any further comments to this patch?

> Is it okay to keep the DMA transfer in atomic?

Will DMA actually run in atomic mode?


--uknG7jZmb7sNlYPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVdPkACgkQFA3kzBSg
KbbxjQ/+K79nV1aTGPrTZkz9DkQ84yocXtzQ/Qw8yJMmWIe7Ld2ELs8iW0iVABTR
lhD9nUCcVe4pT8h+lXoxJPEg8AsDD3dM6nLWTd95SIXk+wK2k68QMYCnH9Ej/lDW
syrfeqqV3pW3rfCAdPQHPB/BDeAwqkOZ6KU8d8Ulkc6za4KFBB6UueOO0WOvcm4a
wTwEM0jJuEijsOPcv3xR0YtDQ1wG6hlEo8xQoRv2dF8mSVvhLFBOZVjVmdCXP20K
70ctiTHnht1Eqbxue8XvgGhJ07WPxmIG840vEpEcEkdfjYtE/v/4Ivo2T1fd6bLy
mJheZ0gAJxZ6Ze0D93JHCDawP7i1DsOcxld4+KgnTBKRiMtpAlbsa+AbHTkX2tM/
DM0zcoprB3V0BPOx3cgfa9Yf87BsMvFxhG5OIPEiJJNEtReiA0rG6iopE1PMB9xY
smdddrd0KvMYS60Xql14vje2AbgP7SzDwxrMLOLemFqhs85pydtwRMFFl8sW9Lm0
1XHMKyE6OkmS+hR+rK8NVRPuZ8kSTvzVXxa5pcGNvlyfY0LtbWaIln24HOfKeo2Q
wfOEDSKPFxJuroFXm8Dzt2w919cw+GipDEhxVteUDkauuc2yveqjmKOJOJJ4K9h0
EmdrZbmNefnsLyLaReTG46cViZ+4OwVL5yutM/ow8m+FYitRS4o=
=JfaG
-----END PGP SIGNATURE-----

--uknG7jZmb7sNlYPD--
