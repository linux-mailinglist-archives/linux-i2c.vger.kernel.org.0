Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3857F5907B5
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbiHKVFl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbiHKVFk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:05:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FE35721C;
        Thu, 11 Aug 2022 14:05:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61764B8226D;
        Thu, 11 Aug 2022 21:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB6AC433C1;
        Thu, 11 Aug 2022 21:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660251933;
        bh=ryzp+3K2CUu8/3UdaXiygsjRA6+Xah3MWCX5/0DkdiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h7AjK+W9yL/lbbbCzbCUqtuPfuRxeZ46kLQ9CxSRrMr63mNkBLFP4x8P/+ZisJUv5
         DtCsh+yRPr/rVp1mLTLib/Y4v1ShIkcHYweLc+B+7X5OWGSwscSmWlGDqHUV0jLUWK
         YpKydMlUVxDL/K3OjTmo6bdPo5sNn9E25UHoPCTNCtB3yyMT30PqlPKlDe8ooBkEeV
         O56uf/bF/bnroRlOsvLxbJDGwxtcCu/KLb1ZiMs8bWRPj0tEOzgp55QIH/+tNCCU0j
         ss/XhWOuXTN6rYj1khvSpXTDM0xIyYm3R6bsCQwQlRxwpQzPDPSsfKlxew5s8RKl5n
         Wf04s68t03jiQ==
Date:   Thu, 11 Aug 2022 23:05:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] docs: i2c: i2c-protocol: remove unused legend items
Message-ID: <YvVvGInrV//5EIAz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-4-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aLZ6vOtOLtcuXvZ6"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-4-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aLZ6vOtOLtcuXvZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:02PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> "Comm", "Count", "DataLow", "DataHigh" are not used in this section.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to for-current, thanks!


--aLZ6vOtOLtcuXvZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1bxgACgkQFA3kzBSg
KbZf2hAAnHgMVP6jf1TiYsPlHXVDZMYWS8V3PuEbImJ/g6yg9s3eG8sYbdXSEz8A
R0wg3ilzhoVW/vKmURIRfEvsg8n2sugW+cRL9NH8QNg9y8iAZOnfD6fpaHx7CMMg
/EA5usJRypiPZTC94C2oWCzPChy6cpY9QiZKY1vJtY5LVHIvshKjQuW/oXbMHdVD
RMajZlPczjVNqdfdkxv11WZpZhHgZDvHWOafhwvHMDC9/WnAfBsDNoZtcJIurtbc
5v6AAvke1KiteZyny1XVf6yYdSpT4C7kHCOWCUduP6jTsEel5u1C1nZ/dwIfhKLD
YlL+ej5LXXKhieQ+xVoHrdxJ16C07V4XccYI4f5k7VppB8ddHwmrzlWjWMBlmuUS
RK8fAQhvINAfQ0G5dTag7G/7iTK6dLYtxecjVmeFGzR+bR/qL4iXkfj2so9lB4sc
eugs7ip0OX8PzighdbDvl+hGz7DCv6gvFbzjaMA0JBwN7jFbSft1LnEQ3x9yrY4b
ACoUOOXHCOx0lKau7sqqkPdHOzjQAZiiweO5TjcTdiS+t4fSIcpYc78F8PW2KvnU
JBr4YiKyCzO1Wxh9MQHO/ie4nglTOQSC2ifVca9TfMBNqmykjRuS38RQVraevs/E
eygyH4eSZVF2A8onjycOASK8OuUcI8vfSf3XYkD+vTmSb0AWBos=
=PHLK
-----END PGP SIGNATURE-----

--aLZ6vOtOLtcuXvZ6--
