Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA3A96629DA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 16:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjAIP1I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 10:27:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbjAIP1F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 10:27:05 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EB932D
        for <linux-i2c@vger.kernel.org>; Mon,  9 Jan 2023 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=y30hCrWJX/oLNJZtDcnWQWajhGtR
        v2SOA7VzbolnySk=; b=VhJpGH9FTS/gPUGb+Ipg8d6ZDVfvqnjBCS4NlUI7Y6Aj
        DaY5Mk3EIkud5fFBQFjHkrYva2ue/gvDQ1bUm16N/MA6RY2egqVezsxILPa9KO9b
        opIUqXIKM4kkKd9Tl10tgMplBB3xpI4x4U3KI1ch6prrVI7re3aA6Eo+G69JBnw=
Received: (qmail 3393296 invoked from network); 9 Jan 2023 16:27:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2023 16:27:00 +0100
X-UD-Smtp-Session: l3s3148p1@z3UEZtbxEtBehh9g
Date:   Mon, 9 Jan 2023 16:27:00 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: mxs: suppress probe-deferral error message
Message-ID: <Y7wyRKQfGWxns9HJ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230107123229.4218-1-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wv6oN2G57agwYHSP"
Content-Disposition: inline
In-Reply-To: <20230107123229.4218-1-stefan.wahren@i2se.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wv6oN2G57agwYHSP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:32:29PM +0100, Stefan Wahren wrote:
> During boot of I2SE Duckbill the kernel log contains a
> confusing error:
>=20
>   Failed to request dma
>=20
> This is caused by i2c-mxs tries to request a not yet available DMA
> channel (-EPROBE_DEFER). So suppress this message by using
> dev_err_probe().
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied to for-current, thanks!


--wv6oN2G57agwYHSP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmO8MkMACgkQFA3kzBSg
KbYm6w//Useplh1kyZK0JqtFABvBHbSWxQzRU4nC5NPOQHwB4F5fVR/6h/2NPTOb
6JR2cNuti4QHVaDdbw5C/aMo1dWwkpJnv0c0fuj45DAX+vDtRqDpFiuHcN3prOIS
S5R8bN4cf8plcbVnXM+XeOKe9Y2xhn+wWC5iKhbjFu4qM8CwaCh8zpqdWYSTlGbN
DwQPtWxCqz396KxcwPZcQWOHEKbxLvOZbDmSwIGFX4K0UOQwtnxKOX4WdWMOMJ6U
zkSVJbI0SDgbk/Osp/rXM+HZUbM4j2A7853ugIPzwhCIPB2FmwhVPs1oM/umWd8C
fqlp5lE7UunE2P723gttLJs7brQy+ZXYSDbOKznYj8GPkk2qLrdDIFQwvve8IvJI
Cf1c/jeWTG979dES/XMjAaJTI1Pwz0a35j9I9uH1Evrkle5w5Eb1KPftfm+pAxOc
j1P/sNsoQP2I3Oa+7dMENBLcs+RFMGAj63EKE4pwJrE0cMhQROw/IvH086TIVyfC
o9lOZNC1lnTtxu4v/+QGgedvHR4WLxn3xZtKcA5uzukxpgoTqhpuTeDwKjuCyOuV
Rzl5z/j4IuvNukSFiR3P4TqAaLu1WACmLzbKXvgK1UlSQjTo9+nis+vOlW3Wb80p
le9oYc50W+Bwl3YQN5t+vcEh1cAhlYyrEC/LNSWvKlits7jru9s=
=oCpu
-----END PGP SIGNATURE-----

--wv6oN2G57agwYHSP--
