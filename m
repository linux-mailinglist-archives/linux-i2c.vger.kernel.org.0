Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E170D7D3A6A
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjJWPME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjJWPMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:12:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD3CE5;
        Mon, 23 Oct 2023 08:12:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CBFC433C7;
        Mon, 23 Oct 2023 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698073921;
        bh=rFj5do6RzQguF8usM7Au5LaaGBEkJED4U5SqJmsKV7w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EP3/GgMSP1WWjNKb58T0FDyP6uXU2cq5G8ixxO7ph9A2QHXPpywOQ5GjzgNp7oMBR
         +gPlytwu88J3vzu55GjHA0UGMJOx+9qoTliQv6GvmFR4sPNIf+Ydu5npF6DmD5rMFX
         6fwMh51lkQu9E5S3wlMZ9Yg9VoMP7ohf5BpqW/nXgKzNc8Z/ydlRiN5rlIWbjYFR8i
         P3DZdCx39lHDsLgWr/ekWCah80FDKaQmEAo6wPb/RdIHMxvL1qTIys3TNIhvs0Og10
         2IWeotFAgLWFkw4CyRMsqFXljnkLj9qsb/AvQExEnXhSYWpIUBOPX1BTfPHFkiPwse
         ZYpW9x1T3zchA==
Date:   Mon, 23 Oct 2023 17:11:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jesper Nilsson <jesper.nilsson@axis.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Camel Guo <camel.guo@axis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com, linux-i2c@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: exynos5: Calculate t_scl_l, t_scl_h according to
 i2c spec
Message-ID: <ZTaNPdfuRKMiTcfe@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Camel Guo <camel.guo@axis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com, linux-i2c@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220912085943.1098651-1-camel.guo@axis.com>
 <CGME20231023103421eucas1p2f1415d69dd979036ef8bcb1a2dc88978@eucas1p2.samsung.com>
 <55812f75-3053-4970-bbbe-8ca563f33721@samsung.com>
 <20231023140627.GE11306@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HpdzcbM2QytZ+jW"
Content-Disposition: inline
In-Reply-To: <20231023140627.GE11306@axis.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HpdzcbM2QytZ+jW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:06:27PM +0200, Jesper Nilsson wrote:
> Thanks Marek for testing. We have been running with this patch for more
> than a year now.
>=20
> The patch has been orphaned for 6 months as Camel no longer works here,
> but since I was involved in the creation of it I can resend it.

No need. It still applies :)


--+HpdzcbM2QytZ+jW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2jTkACgkQFA3kzBSg
KbbwaRAAqA1LDb9Dbu+VitDyYswIk8kCtjv7DVt7+cTXwqlKAhCF3mF0l51vk9W7
nnqmz1K6mYdPyb1oGqACra8PvaPSGNuOJxeqTYurO+9BeP9okjeHDkBNX15C6tPn
m+1Pr7VU2JLVgVXc/PqOZEp24mVG9LQEXPqEDeF/HAMrYIR9rkcZrQvuaLHKBgM4
jIcTI4FvDGKDNo+/n5LXIUCGExESHQvCC4pYEnDtE7bZoXJeM/aVOdC6FRzF8EzK
l850fFzRmejO9ldyQT8Nh3loNZyfoEAm8yaOXjYq4AdbNm7yZdpZ79r/rLGxd366
DC1LwGjNyOb3KTl0AkYaQItwbskapNqti2ocQa7/Yx2e+sXLHQTPHCDH/cJZvw2j
83Eo/ppaxyGMHuuix3l5CSBRRokSUJhneOTmHMG/DBHbELGWOMHJo0E9ttyfRBzZ
P9nRUObwcCcEsD43qmgMAn2C4QRg++o31hS2Mebli9eb9QVgid1u/3uJ+y10hJR/
4R8wxUZJsywzGsVCVhMzd9WY0c47dEn9WcCwNo8UPy9NAxrdDtK5Ir2Hfcy/QM4f
bPUJS/R3BMMt6y214pQcKhjAmKf49trVd4q6hYihb/LZ8q9u2j1aDzKq2asYaN4b
BlfVZAniNeZnQ6Ol52bkf95RUt8FaOArvFzP/8jFNUNyT3lr904=
=RYkt
-----END PGP SIGNATURE-----

--+HpdzcbM2QytZ+jW--
