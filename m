Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D96864624C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 21:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiLGUWD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 15:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiLGUWC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 15:22:02 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0E07B546
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 12:22:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 629DDCE20A9
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 20:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CD8C433D6;
        Wed,  7 Dec 2022 20:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670444517;
        bh=gZrT5kC3Txf6mx1o+1iIHX7SqM1VXTugYK//vBbmk1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FkR3GGf7kr61HquYO18YUGoeLHdGuX/qGPrHxQfBKDwoaVB6uagn/NPZ4hg70rzIG
         2aAbd3T0wWzbT2TagZOFrOVO3gjNORRKXSXRwsuYHXATxptpzEz0tTf5wA+EnKhvcL
         W1nU5iYQ2oOSAoMTmh453mJo6kTXetoMy7hdCwOHAcHDSOyVB9BksXqNWrdHDC9nGO
         k6XIsiJIhA5IWtB0lMmYDFuIvtfXLMg/vceeZUkEd5SWrKu1OpTv2XsUYrdmhTWsYZ
         /YeVNyGOtRw4y/o4QqzhylTC1nrDrSOjWHqpOYZ31NHtBClcdb57sPb56lJw/cCO3n
         LcySQbKzKkQAw==
Date:   Wed, 7 Dec 2022 21:21:54 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, peda@axentia.se, yorksun@freescale.com,
        alexander.sverdlin@nokia.com
Subject: Re: [PATCH RESEND] i2c: mux: reg: check return value after calling
 platform_get_resource()
Message-ID: <Y5D14g9Ggaz9keBX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org, peda@axentia.se, yorksun@freescale.com,
        alexander.sverdlin@nokia.com
References: <20221029093825.3425857-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EcfFC200PgbSq0Mw"
Content-Disposition: inline
In-Reply-To: <20221029093825.3425857-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EcfFC200PgbSq0Mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2022 at 05:38:25PM +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref in resource_size(), if platform_get_resource=
()
> returns NULL, move calling resource_size() after devm_ioremap_resource() =
that
> will check 'res' to avoid null-ptr-deref.
> And use devm_platform_get_and_ioremap_resource() to simplify code.
>=20
> Fixes: b3fdd32799d8 ("i2c: mux: Add register-based mux i2c-mux-reg")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to for-next, thanks!

Peter, as other people are sending similar patches, I applied this one
now right away. Hope you don't mind.


--EcfFC200PgbSq0Mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOQ9eIACgkQFA3kzBSg
KbYivw//ct0P6n8w3F5x2z4nxhTu3OnA0AxIUgEubkMHztJrAz5NjIlKPVm8zdiy
ixdlOsJs8RHF6CJLlx7J3m07K0fwg/Zj/2rLXiUvkMyyGGKRrEGg3357TwNG+c5E
5sC5Nrlup0qoBiYNs3LKdRiVbfuSzsIoO9kc8SyXzHOO7+zijwE7B5TQ0ZGGogWi
043G+Pcy5USAhqWZ+7n1j50kP4XQatztwiE5ZCV1WzEYse19M6Z4niyrK36ky0Bl
3jVFfOSWn2pb6fHMqqSUgjfCujHzR/ht+OnCWBHKS2o8NVYPnaSnSi80VwWuqXiJ
PKb8KDTbVn1i8t2wc9lIBAnYz0xpgLo16k9N2zPHn+klFLlzHwH1LhmC8TOT9/h8
wwmd/RJUj5+rPH98HJlJgaeTjvWc6Sqv7LrmTtVlWGP3oVsJ7b9OedQSDnLg4b4b
tN2lqlmQKPuP3HqofVUedZid8Z7fWAsqbKifvtz3NOm5Q9MnI0HpJFeiqmHNjuHD
unVY6H6SjIxIeMtEYjXmz9s4Xa9MTnK97wuxj9InwEBxYe0Bh0x7a2o/+9CW+vkZ
KxS+haReJ0FvaA6CtimBX3LHlSgkDOtmJs/u098H2y9wUwh3p7/v7W2PAqQAtbFQ
ImAMqt03l3jr6Y0jwW+osB/ntZOMP8f62XURn5AYZbT9r9t9/Ys=
=MIkx
-----END PGP SIGNATURE-----

--EcfFC200PgbSq0Mw--
