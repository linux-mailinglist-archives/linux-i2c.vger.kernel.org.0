Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6422F571894
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 13:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbiGLLcg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 07:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiGLLc3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 07:32:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F9BAC061
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 04:32:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 07057B81818
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 11:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3026C3411C;
        Tue, 12 Jul 2022 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657625543;
        bh=GHAm+j5Y07u6pJDEuCNgpzC1OGh6fvPUkchPQ8iDirI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pOPthHhmQuRxSgY9/4rOz7sSLlUKnR1eTDlXTkCYkhV2XwENwf2IwYc4JJCFKWTUW
         ZwrELsWzmuALt9uvkC+eUyVy3QAo3dNzuXASGIo76zpjKAX7skpTLlPB4698yNYUu/
         tRRb7FtV9zcno3iiODxcwaw4s76j24tszGYAjTJYR8b+S0CKwLVFkXHBNI2OG1gPVA
         xwGOsaTBX507I06nbIYURG9eEbfpGJNjtywqKbx6nuCodnULXOZB6hdMnDZnYaKZ67
         CbwvUVeh3traywWxjM8QfzCQtglkGi553Q3nMk/hEaSZfB0l1tAix2lvIo4g7koJ6a
         NcckOkYZr/tVA==
Date:   Tue, 12 Jul 2022 13:32:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <Ys1bw9zuIwWS+bqw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712084716.bw626gt7cwcjt3wq@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fnKsbM3qvd+SFm6d"
Content-Disposition: inline
In-Reply-To: <20220712084716.bw626gt7cwcjt3wq@pengutronix.de>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fnKsbM3qvd+SFm6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +#define I2C_IMX_MAX_RETRIES 3     /* Retries on arbitration loss */
>=20
> Just one question: Why 3 and should we document this within the commit
> message?

Note that you can always change this from userspace via i2c-dev and the
I2C_RETRIES ioctl. So, it is really about a default value here.


--fnKsbM3qvd+SFm6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLNW78ACgkQFA3kzBSg
KbbUdQ/8CAU//JNvPDVQt7O7ZYGlgZmg7jGsegx2SuDKzc9myrBUnznSvyjgV+Lj
ulgpD1gXN+FykSx+O4Fi5KukmSGgSRAheG/RsJDEKJWKSkWRIfnQI7RhARFAh/4a
eOFLzCJC1kUrcG98n6QBFU2NKLtijPrPPAj9Tj9VCUuUT7QYTQBULeYLNo8+tVO6
wS43/D+Ofz4rxG2j/t7IK7pQC68FoFfYJJ3TjY0srLeP3CzPv7NfJR5JfFAWauhg
nYomYj1vSW+mSED+T0WRyi4dfmu1u0VANmXwm6GEsq/qgASjyxLpbMfX6m84bwwx
4Gde1TasFFxzKvrKtS2GN/xMeNt45df7Td91/cd9I8n1deHDneSX9Rsr6oyG9Bmq
sMyWoY5UvOihoxmAorhG2SoSH8WKgmTn86xFImm7WTi0icpCCIzoGoaLtOPMKCiJ
ZSNKzE2FuIoEA0+qRWJkQCJkMzzdeLoegx5AFmtEyCc6uvCKPaN459it84z5/KJ4
ajmj52VOay/+ACoiFSAB3mE2B8Y1uqJv4nk0tu3aWSqBhDjzE9thNgfezZnfMxlE
Nuy04GIHFoQ/kSMhSmeii06Cg0Oajyp7VS7PINXJNvwogXAw18T5f4TmPlyYpMai
JS6/pWKW+OE7pto0+kDEF9IERj4CxS2KgObMl2VzDWR7hPZQtC8=
=JVD0
-----END PGP SIGNATURE-----

--fnKsbM3qvd+SFm6d--
