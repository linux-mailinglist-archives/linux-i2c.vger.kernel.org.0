Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D7573B42D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 11:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjFWJy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 05:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjFWJyw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 05:54:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C446C6
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 02:54:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08C90619B3
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 09:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04F4C433C0;
        Fri, 23 Jun 2023 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687514090;
        bh=vkCw3hnM9wp2A15JoTT1qdh6+6QJqKcTf/F1I2eMugs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G2LXvLdohW18MFhuZaDLsNmj4DAcU1TGU5cBAukDiqUH1ln9InhmmawGe89y+zQS/
         /+errENgVPL+gC4SG1tehDJk6FtNFzLr9i8ACM94sngLljEFi0IB5/OdGmhYt3ed7J
         W+1N2LH6BVF0u7IgXGdn3lvdd/b0+j0cccRL9sRvG9P8GyMmwoho/rKiy8/8kV65uK
         0jnizaOSb4NUdz0FPZ71qr4hxnD4OXgL9E98HlsZhj9ZRlQ+K1SC5CuX1Wmkyyppn7
         30r32Gca4FWb4gCWu3oJ/cM/+abZFylpTlwJU9kyg6rWmKviTQdYH1Tl8armkO/Jd2
         pnkvJsXVsyX0g==
Date:   Fri, 23 Jun 2023 11:54:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/15] i2c: busses: xiic: Use devm_clk_get_enabled()
Message-ID: <ZJVr5mWRovyx4cNl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Michal Simek <michal.simek@amd.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-3-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BrtsEuFqClrAyG7C"
Content-Disposition: inline
In-Reply-To: <20230611225702.891856-3-andi.shyti@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BrtsEuFqClrAyG7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:56:49AM +0200, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
>=20
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks! No need for 'busses' in $subject, tough. I
removed it while applying.


--BrtsEuFqClrAyG7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVa+IACgkQFA3kzBSg
KbaeIQ/+KW/dPcyCK9qoZ+DqhDeMqEmRjNiS5OaJ8lVA59I3v6Jotn+LVAXgQVvN
S4lKPCZCiQD2ZTiZZfSKpUbiRqVmPIThGoJ+5W/q27Rnw/PoAd5dWRPjo1dEyUMl
+oQzOSAtxjaMG/i/Vd34NJztRIHKBosMD8pYcCOEJj+BD9+dMK6lbasQ1qn0IRIP
9PCpl3rgbGPFHzomrR9ueAE2TkADki+FA/OTzrOuvieSHGjBWw5SmCGhtMq1qmmJ
BGLiQV5j7Pn0TqSwuDh+oINPXLYYlh30ltjs4/vjRJT8BqjrVb2fIDr0HaO/O72Y
R2M86d1WrKfAxacWhJtpZTal9ReIiimysAus2z+mwcok7JgTILN9xdikkXvHfBxK
noxX3jesOTPDlLl2UySHIjK5ayu1qEBC/Scz7mS4SZ18u7NG3YfHQHstgAgsPV3+
5hjZKLMH3h5PPSkvh/XoJYyYl3CPSMAbSDnZcCkHMnlAqjdjyy5LC340sHx08gst
tVDoB6CuWtX161fOMuj/33quCanSzx3pEFPLZ4P1RYEFdT811XMpF9/5E+ewz3gp
lAoTTHOSHvdu/187OWyeR6bRp4fVmPZVQ3xf2bWWiy70+IHoohoz5LaSKYRJdwKh
IAmYN7FXn7bTD5n1xNV/7Bf+AuwHnJP+gTV+y0wAG1dSEyjupf4=
=XVb1
-----END PGP SIGNATURE-----

--BrtsEuFqClrAyG7C--
