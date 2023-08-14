Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C61577BDAA
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 18:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjHNQKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 12:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjHNQKj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 12:10:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6063F1;
        Mon, 14 Aug 2023 09:10:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4409761DE8;
        Mon, 14 Aug 2023 16:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492E2C433C7;
        Mon, 14 Aug 2023 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692029437;
        bh=Bh7TmAhKmRh7QbFt8obpKRo8wLtKqi8DZLVy8PH/rJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b3v3muJRQcNtWZ/qxAU0JMaARKJ7IKOSXbHSDSo/yx+h6uOnmgBO/RzDIFd/i9OEI
         yzD8nusIrJhrgQS2rdqB2AbvXWRVrYsNglQB11kDMDAgh5sPXcWretcRZ1IIlVDVIp
         ucAy7ui1Tfokn7OqiqNzFv+jGrrCFyipswxjsihZ52QDKbF3wXAFgoUqbLadkAaSME
         okx4VZFq346j1/sh8yfkQ/AEIrKh/DJYgqzruv607RZ9q3uYuYZT7rdnmc9lEE/EB6
         i/qgz+bwQqEIucDPnlYt6NpAUtCRdzvzIQ2Bz8nvqE5z1gsHSGEy5Gy0Sty0jaVgqG
         MSVE2Tibd/8HQ==
Date:   Mon, 14 Aug 2023 18:10:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] i2c: at91: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZNpR+qRhL/O1uFOx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yangtao Li <frank.li@vivo.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230710063351.17490-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="I6Jq9Snyhnu/zpCa"
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-1-frank.li@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--I6Jq9Snyhnu/zpCa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 02:33:40PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to for-next as the rest of this series, thanks!


--I6Jq9Snyhnu/zpCa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaUfoACgkQFA3kzBSg
KbZPoBAAr2ALepMwfc7ssk8JXIBNf007sil68V6i6+KxXi/soJVe3b6Kub7PbV8I
OkdqTsVkeY9DA34JZp6yD/DfVspQvgWAKdYR6blRPmbmhepBr/WxIvPFbx8XM5nO
NGLBekzearcD9n8sptTVxD+bTg8SATLwQM6tv8p2UsK3rKbAIhJfKb1LpOkBOtbB
cOY5jlmvNSwQgbQ79OHL53/61XtgXTI6apr5l297JACjM3km0vBTswT8yqGAygmw
ensfOTy8SY03ZGqf6eeRE5BtQDmJuEg2aCxgNVBTSdNuBlatle26FLEakOzFlq2W
UlR4MHiTJoIhKKdMNd+fvavB8MYph2g/86SMrNALelb9nMOQcs+7K857qEhpCjai
9EdrI5XL0EAQ0dzT3jrcFN1C43jjHExkJJVgf2J5GKt7Nan2wjhK6MP6KWrW8f3o
GCwjxW9C36sK8gUFr92itzs7tD/Gduc1DW19o6AmX3kAL6v7jIrx1XLEWHwytaCN
S5jCisRMy4OeQ47b0mNtauWGCGS6MzeoAFLk48MYTXSEAKyaJ6z7kHauU83rY/W/
078uDZhCrAA8qGjs9WyWQk/Ri4gMuy+7fN9/GnjzU0sQwgYaIeShQFjq6T+3TZSf
F5kax1FtHCEMY7Xd4JpGoiicD/zr13lrfnK3NK/3mznAqFEuzT8=
=lECm
-----END PGP SIGNATURE-----

--I6Jq9Snyhnu/zpCa--
