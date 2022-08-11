Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8375907F8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbiHKVWE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235996AbiHKVWD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:22:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48619C203;
        Thu, 11 Aug 2022 14:22:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E12D61342;
        Thu, 11 Aug 2022 21:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D7EC433C1;
        Thu, 11 Aug 2022 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660252921;
        bh=aJjokjmK2HI84IvKk7206UZk1QgtfaZQVhLk4USKICk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hhse4SHCqlH1aWsCb2EJtbgeyOWmEJwV0DRN1IqI6LrqmDuI0ATH9jJiSkEfbf56B
         0cvEX6MwqnAI61+8mtqcaznu/yICnXvhMqJ48LrDeFr7rB3WVD85cKxGCmXpxHgWwh
         74XMLYQxE5aJeouiIx8zOo004N8MTpQsRFnpwaOUIa44eAiPghYLVN4rauW2vcI53K
         f9tcx12+VKrTWo221rjL0x4lDg5hVniGe09MnBaRrc9iWo6vnRCNWIIsE98+2LxWOx
         CsO/iV9+nkJ9UBYWmL4wN23psNW0q2X1299iGiLvscwO94b2ZFC3aVt1HmFs4uWhNN
         G5NFGibP+LeNw==
Date:   Thu, 11 Aug 2022 23:21:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] docs: i2c: i2c-sysfs: fix hyperlinks
Message-ID: <YvVy9XH2YP+TFmTs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-10-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Enlf8bu3nHYGfRfC"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-10-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Enlf8bu3nHYGfRfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:08PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> dts files cannot be linked conveniently, thus replace them with literal
> formatting.
>=20
> The links to other rst pages are broken, fix them using the proper syntax.
>=20
> Fixes: 31df7195b100 ("Documentation: i2c: Add doc for I2C sysfs")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to for-current, thanks!


--Enlf8bu3nHYGfRfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1cvAACgkQFA3kzBSg
KbbJ8A//YYd7ClypmCNbF6Sjb3rvAigPw+xZZbwTDQSvSTF3tdNhoM3jZ4tSHytV
i8UuIYwsNm2VUvMOS3CTrPCeYco7lsgh1bZEosZKJOSHkGhvhHyXZhLPW6/GmewV
TAH2HU3AzfgAcGGtDHRQyHn/R/Q4LU4NHE9AzRbWuL42yI5ZL7foXYpQ9sVWqPwb
2omZRKVOKUP1YbQpV1uL0zyO6g0GiNO5QfeZ2JFJm/MMJ6jQdQsQ9QfIAt2nA9Gy
fMGONtaAR4SWTHFC3clU5rSOgPvRlg31LMkw5Ch5edGVQ16t1kHkST5XQTbuAFra
AUHdeedI+nMEQdfk9mo3tvx3TJ8liCXb5lVQgx42qko56s2mBGstliNc4h4jLKXm
yzkH3jnB56M8T2I160MftdHfFbBUHiORPGqh1e8LLErPojIPFmpikTKlWmYDAj7x
kr90JLMdLT2JUlNNS62a7QNewrXjOqqRYafzd87sms40maTSgieoRzmsRHwC55VU
v9agzZl5rKD85YoL241bKQswJa4t3BWw26EdW1L/Z3DTsyX5G0gKIXCL3l3WUcHW
IrYBeIPttExN8osfADCixxSgAoLqxUuIPKi9H3UKSLk/0ubRyvfZwd7uPU8gfG5v
mubkb4znksxX0TODvClxDjaTM69J4YBqScyKjj8tQC4O4Tqgolw=
=9CJS
-----END PGP SIGNATURE-----

--Enlf8bu3nHYGfRfC--
