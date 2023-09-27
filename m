Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F037F7B0C81
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 21:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjI0T3J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 15:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjI0T3I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 15:29:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E368F;
        Wed, 27 Sep 2023 12:29:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A422EC433C8;
        Wed, 27 Sep 2023 19:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695842947;
        bh=DLORLISSbfGpz9Qo1iPESXCR3M3Z5Vppn33Xzt8GFRI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fFG0cNEr4hv+GhzWDjkFh6JcZlrkUkMHEgzsp3fGMTV6HITO1Hze2DnLhEat6Haa8
         qgr2ypxus07qKxPU5fAQdDGer99gHaMupaNG54STNuskq+JeCvdhMll4FQdLZtmAx1
         BEQJ4UX6sHh5mAyuvYi6eSxR8V7Z04tGNlW9tEKKPe0RD0n6a+SIe0pABKV2sCVvMt
         bGRsR6cgOFjLydR68hBII3Q3B7IqlxZHgEB4iI/YUlyfww4TyxGfxVX8Fvnhqs/8Ei
         dZSeVAgjfgfBIGGPVPuOOgHq8KO/OsoT594gpem3XP7nysZSiyCoKe/jE2bRfkWX/8
         bXAmtNPTfrXww==
Date:   Wed, 27 Sep 2023 21:29:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sean Nyekjaer <sean@geanix.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: stm32f7: Add atomic_xfer method to driver
Message-ID: <ZRSCfMn7CX09z6/e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230816080552.3045491-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q4e6LjJ1370WBudV"
Content-Disposition: inline
In-Reply-To: <20230816080552.3045491-1-sean@geanix.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--q4e6LjJ1370WBudV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 10:05:52AM +0200, Sean Nyekjaer wrote:
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

Applied to for-next, thanks!


--q4e6LjJ1370WBudV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUUgngACgkQFA3kzBSg
KbY5mg//fnSEAw0ncLAp7FAiL+6CXF3XRI8wmDILe+fjXyIWU4xpZDYT0y1wrQ+9
qm/eghJr9ieoJXLA4U9oEIJha0P8ZucXJxYgD2pmEmUA5f0Dfg90jQePAlsM2wxX
2e4u1+ztpFiJnc8P25bM5oHLggZMMsbHZHzyxgRDCq4IL4vdMEammHS8pCe3zPtr
vaPj7iu5gQuGe8e+A6nlSF3aPeki48M1kFcwiUIfLU57ltY7YwR7jUPcvgamrHKK
1HX80XHaAecj4Dlmjd2upaKSiEgV4TFz8Ior0pmWCvBBlkMq59Ml2eoWS5AWkF6J
hD8caDVPApH263Apd0KcpOYwhSkTIQY3Pmld8mdGIeRX70IKm2QkMZdsAoR7AQv3
iMmoLN6ChyXiE931D3rAvd1cRemP1O86FSZwqBEMCtIr06xSB+ps/fo2q1oWpn6S
A1DZ4PYcO0APtRqigbMbe7SSLtwT4zvZ938dd2oCNGf4lxOfclGT+3rUCCYQL8XD
4xd+2511orDi0ebV5OF8CMvCDd+Cu9KVW+3HmQ3GPwzSPJONG37WXu7OVMhdltNk
wyZhBj/Oen05Bv7qdTx8eh1XlVnfPiMyojSUQ0+k38xvkpw6xvgM5jo1Xngz29LF
dNmB9zRmj6tGp2PL3MtcQACrBNzeQfXC541XIfntLsNKCPOlevo=
=f9RA
-----END PGP SIGNATURE-----

--q4e6LjJ1370WBudV--
