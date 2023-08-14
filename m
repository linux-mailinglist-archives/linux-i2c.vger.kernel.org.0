Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B4D77BC49
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjHNPCc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbjHNPCO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:02:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDCB18F;
        Mon, 14 Aug 2023 08:02:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C810162B00;
        Mon, 14 Aug 2023 15:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C5BC433C8;
        Mon, 14 Aug 2023 15:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025332;
        bh=CLst8JcIxRWJRs96SWu43o7JLfLImPUU1vROlmY+7V0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gtbYFW/YIqdj8Sia7jg+XIhP2UJW05KXxzz/dVFPvj6/61CI51fZruZlNUaHhd2Q4
         qhvbaMxNW1/SaEBpebU7emYByq3yXPzvG6zD7UYLAIir9TBsWlSVtGUH3H7p3HcF4k
         U8MXKe1whDqs5oAvt6IS4njkMm4RoOhZrUvYYMFS90TevvNRmeRSqasg4znPQECkVh
         C/CbK5oolhiYUOMbWtpC5+pGytQS7zZjXSheMMKpjYTOEdmUJCwfWlujPCfrvqjTlo
         RiwkLcjvwJhe7NiyckE8fJsbYJbvBFx+wYHShlkr0ItRtwRs7fShLwHYTs7Fm/NwfP
         tWJeXuQCwGFjg==
Date:   Mon, 14 Aug 2023 17:02:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com,
        xiaoning.wang@nxp.com, haibo.chen@nxp.com, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: imx-lpi2c: directly return ISR when detect a NACK
Message-ID: <ZNpB8fWnOcH8997V@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, carlos.song@nxp.com, xiaoning.wang@nxp.com,
        haibo.chen@nxp.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230727030347.3552992-1-carlos.song@nxp.com>
 <169100562766.1919254.12222013232053766298.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w3K+5rbsIPadrzlO"
Content-Disposition: inline
In-Reply-To: <169100562766.1919254.12222013232053766298.b4-ty@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w3K+5rbsIPadrzlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:31PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Thu, 27 Jul 2023 11:03:47 +0800, carlos.song@nxp.com wrote:
> > A NACK flag in ISR means i2c bus error. In such condition,
> > there is no need to do read/write operation.
> >=20
> > In this patch, i2c will check MSR_NDF, MSR_RDF and MSR_TDF
> > flag in turn, it's making mutually exclusive NACK/read/write.
> > So when a NACK is received(MSR_NDF), i2c will return ISR
> > directly and then stop i2c transfer.
> >=20
> > [...]
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's tree), thanks!


--w3K+5rbsIPadrzlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaQewACgkQFA3kzBSg
KbbjoBAArY/BhYhzQhmZR3cld8jSC7zTM/UcLi9YgnSUMdJ4rrLV9Lzf5dGk58WF
tfdUGhPDDY7CgYwVurUENvqtU5g5O+b4LQJ9Fyj2F/10U5lAFv7Bn6A5W6w98yFH
28EgSPb5YEuKuDwhIsRmuII5AZf/A6mb7ivrT7e7gS1dn5Ur7GkHhsd9f4megZeq
WOKZ4Psva/JW0SZW3LlyayV/ZJQsZcapt/puXIPt2IupefKoUxduu4Dbw3sVhf1U
zA5p4Kw+q0NBqXN7P9D3ZlyWGmYsNURrp4I2EEWkFnQj9yZExVugaEx5TabK9C3q
z/xBBE504UKgME5n5b7F7IT9wiFRjwwsjtLFlnIrk+h8MnqJ9H2GnVr0UW3Z7tnN
vMixefzx211lTy9CGWz2zIe6ar4bohkH33u3EEufb0OjBo42s7PXNQ4AudHoCnCO
TupY9SpVElJmpSocg4i2Q4xBbE/55Gw9q1uOe1dtBz0PP9n1SX+95iZdr/WiZ4zU
0ZuH2tdaoF+13ngwcih1s6McMwCb4/A6t/AkZcytpk/HzK14rLOAnOorFuaMjfFm
JUnMigzyLzgiTCVqa0erVtI5/CHIOUkIPJJ74R/Li0upA8HnK23ePRk1F6aB+qRB
p5JXeKlR1gxjwOAcUI4OAuFT9jWMaS906RzHXjpA/hoDv5YqdFs=
=yuB9
-----END PGP SIGNATURE-----

--w3K+5rbsIPadrzlO--
