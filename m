Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E442977BCCF
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjHNPRA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbjHNPQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:16:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E1D173E
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 08:16:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ADD226566D
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 15:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB98C433C8;
        Mon, 14 Aug 2023 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692026104;
        bh=eQAgEd41v4YI6qj01T2BetIW0nxk891N3CCGbuy1shU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CMNjNJdkNzcB8egAM7USYx7c0K+L1xS+3W1pA/jACFzRuwb7c/INS+PEB/JFOCC6k
         pdZBvssd0j1XUPfFbAcEHETqrvFyP8U7jo1pwZWeWBUA4N7hLJRvAaTM8D+ypZqjZa
         axBES4mx3wmk6atG1w/bIN2BygANYBMl38X770Qih8VE9ZB/CAK/X8Ueo0Gd4PyvTA
         PQSxL2TB0/cgGJRTAKK9dJx/fnCjWPfoggQVdFWHIPVq2sqmAjCAZUriIQKZm516dA
         mp1JoK5sEavf68+b2NTDpM0X13f1LjL7zo3YB0aH3RhRG5bSLuBbreEJyIW2TjWpIX
         1e+gueyNCiFfA==
Date:   Mon, 14 Aug 2023 17:15:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     michael.hennerich@analog.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] i2c: mux: ltc4306: Remove an unnecessary ternary
 operator
Message-ID: <ZNpE9QXZbmjvjQqu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, michael.hennerich@analog.com,
        peda@axentia.se, linux-i2c@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
References: <20230801025328.3380963-1-ruanjinjie@huawei.com>
 <169123651971.2868114.6900808236241841864.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CghA26ttsxVVKv8S"
Content-Disposition: inline
In-Reply-To: <169123651971.2868114.6900808236241841864.b4-ty@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CghA26ttsxVVKv8S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 05, 2023 at 01:55:56PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Tue, 01 Aug 2023 10:53:28 +0800, Ruan Jinjie wrote:
> > The true or false judgement of the ternary operator is unnecessary
> > in C language semantics. So remove it to clean Code.
> >=20
> >=20
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's branch), thanks!


--CghA26ttsxVVKv8S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRPUACgkQFA3kzBSg
KbZc8RAAo0psoILtQc1HE7wgHsNfnAsAOjI6pYEmtwmd9EXXAq47CPCbPVJb+QJg
m33i/riu2Vp8s9ex+bXs2Vs92FCRmbUZY/nm+8yJ8ActKB6g8c7hyM1KuS35UwXw
hCHwtXiTl9h0xwVd9QFrN5FUp2GRPFEyu3zGsDuMxW+uIb3IdjIfdxc/MO1EbNOk
MahzTXdUHURUpkQHnz1hNd8nNtxBnZOXub/k9ZqAh6dq2OEA3CQr6SO5pc+4kTWU
eddptT2+EJ/UCTYXiIN8V56f1jXxP77kJhN2tfdviHowg20CnDQ/jtT9REcOpYyR
QkeO5w9BfvScSMEXzSMhpdNyZ675SIABwNn26a+ybdXDUH0zP97iBLMagYz54We5
aCD8NoDMHJ2l45hgaI+vVncOfI9LSSZsr4bpsPmXP1q/MvnAAev+gkh1bBcXucBg
zCXBU5jBKeR64JVI3EcvNNNZLaKMvBTh7erE2ukt25v53LXfgy+PkJ9M2ubfNPKS
a4g4BMU0HWEiTUaL/hjwNBa5YAFzl6u4/AwHvepXwsRbm/tP3r/gyetdzU49JhPH
jznZ9deyMeEB48RGiBLKZaMVDvejcThxHRn4+tsQh6wSRuHKVP/3ZDulSyuUmz1D
S/0ZSaZcGh7xbKFRoLeJT0c3TaRSiXWhQeYnvcbzrV8J9Ck0U2o=
=snet
-----END PGP SIGNATURE-----

--CghA26ttsxVVKv8S--
