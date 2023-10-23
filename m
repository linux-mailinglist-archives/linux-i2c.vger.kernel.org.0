Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534D67D3AC2
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjJWPac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbjJWPaa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:30:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001C6FD
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 08:30:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8D7C433C7;
        Mon, 23 Oct 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698075028;
        bh=aqXzYQosKRjr8QvX1x0Q8/UAN/bTNGIZD6XHZG1jIOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UeGINMARJkWsOiCBY1StCcDSEx2UK5Kss9F8rODwOLK5IhESyDg01kVJMPxT8b4WJ
         f+1aeo0S5BRGB4OPt0qhmfVoVha2gvS2J3weSHSK7XKHaqg4yF3OU2F8E5Ph9YgsIB
         KRSFGyvH7N6ajj8ByR+U7iM8DgfkT1Nqznd8bdzeRc5lnyskfECeTe+loAmUyzqpEb
         nUrGUqsODyARhLVehnbO4X7r/nZT599kK8kh9Zm9CrFYXB1Vykctw2CnCTRsaBQMvP
         U96OnFrnTeYIfb0bqdsl/jotPVZXxGoa03OFI65B1Jxasaax9gRa4vRG4BTW16r+Wx
         h2xJZQ/kroeIQ==
Date:   Mon, 23 Oct 2023 17:30:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 11/15] i2c: busses: stm32f4: Use devm_clk_get_enabled()
Message-ID: <ZTaRkbY4g//yZeu/@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-12-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Swcq6buLAzguNevV"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-12-andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Swcq6buLAzguNevV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:58AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

Applied to for-next, thanks!


--Swcq6buLAzguNevV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2kZEACgkQFA3kzBSg
KbaQFQ/+KriAJMu8HP12Xte+8TLCTTFicN6Lpay8IOerNx4x23vnTyJff3nXmkZF
8bNN20/Feqyn5UBSDEMCceAVMs3HJUMsv9YcNth2VsjCybJ1Bx7o9bDrqZUJbENW
w5g/uEXze2XWBgWHeVh89uXq02Dq+z5cx2f7surv4YCZSw5Np2SJanxqh61/Ikmy
KuvOpDXx5dzcJzg8VLsD6GGLAnsYvFQkDzemR6RH48NBXUewMOFsSUrUoXSfxNgl
0x6zcCX0I7PWwJyKUo3zlTCcFFaChhko5PMTKIfZPVkSco+yOK0OLUjsTVWKHl6N
ZPi0/vixNSORU1lyVuKAiVKffgG0SnISyepVKQlh3lF5QWS8zUz4SRQA5S+J2I+g
xXNqnYMYp/3uJWWGvAEAe3PLW8siDOL5M/fhXcg4m8TXCW+gn0ZHudnbe4uNYrkP
Hisf683+wXRBQvmefnhU49BzoqbqhwFdEdnQbmct7fUX4NTe5bwsgC6WSb1JQJCX
l5w9r1UPIIdqbJVfRiJhphapMqYPHUzcHhh3k6hd/xvaM4SWEPx2527On/V3bRtV
oMIITYapRtmgynalIRzvPvC5A8u7dC+/9EjvCly1EHEOkjsjVMVCHNqRLSk3CSR/
vRTM19bhFLUE8evYG3hyWMoyC+MVyZBBbwmTniFBLJm6OtxfFkc=
=ClI8
-----END PGP SIGNATURE-----

--Swcq6buLAzguNevV--
