Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9AE5F5A6C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 21:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJETMw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Oct 2022 15:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiJETMv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Oct 2022 15:12:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73D678BE6;
        Wed,  5 Oct 2022 12:12:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D6856179A;
        Wed,  5 Oct 2022 19:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E32C433C1;
        Wed,  5 Oct 2022 19:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664997169;
        bh=PR3DOCGAQmH7Ik2IIOwQtDvkXHJGl2WZRuUIJDm2OHQ=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=HFgkJMR2u3TgfZMphtRp6z20zGUdeI/gaETbIno7eQ9tOBdZsu/kS488YIFaXriui
         0OP+vh/FC2qRIRrbIwJvNDNBtcn8z2rhjV964cxCXUn97qv+B3Uj+LSFFEO6Doil6A
         /fIwEIbOUBEnV0Uhyo6wcKdtMnxcgANt5dXNpO8jHnrjByOiRGGKDbUq+5iaHxalIN
         KYIxbQns1wzL0ialpoc6+vLlWFmLLn2OiX+eCoA8avZGTu2wZwM9TnmgjYGOkw16SH
         VLViweszybTzwhgbb+s4fy/sMPXLruuQhLCZuVTrpgffW5OOKfMpUw8kEc7z0VI+t8
         TlAcGfQhhJgSw==
Date:   Wed, 5 Oct 2022 21:12:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v4] i2c: hisi: Add support to get clock frequency
 from clock property
Message-ID: <Yz3XLfHGzrPcOEpn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Weilong Chen <chenweilong@huawei.com>, yangyicong@hisilicon.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220929071547.135913-1-chenweilong@huawei.com>
 <Yz3WgHgv/O/0o5fZ@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jlIGoITplnZaBt7y"
Content-Disposition: inline
In-Reply-To: <Yz3WgHgv/O/0o5fZ@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jlIGoITplnZaBt7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 09:09:52PM +0200, Wolfram Sang wrote:
> On Thu, Sep 29, 2022 at 03:15:47PM +0800, Weilong Chen wrote:
> > The clk_rate attribute is not generic device tree bindings for I2C
> > busses described in Documentation/devicetree/bindings/i2c/i2c.txt.
> > It can be managed by clock binding.
> >=20
> > Support the driver to obtain clock information by clk_rate or
> > clock property. Find clock first, if not, fall back to clk_rate.
> >=20
> > Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> > Acked-by: Yicong Yang <yangyicong@hisilicon.com>
>=20
> Applied to for-current, thanks!

Ah, sorry, wrong branch. Not applied because the dependency "i2c: hisi:
Add initial device tree support" is not applied yet (needs changes)


--jlIGoITplnZaBt7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM91y0ACgkQFA3kzBSg
KbaNChAAq2Doxkn2/Qjc3rk3EDUtk3xNaaSPVFERjOpO7CIEQbZa3n+yg7QNnJZV
YSxp259sqjvKapV7HTbviMT5wh6WsdfIWLLbe6q8T0Tutst/GfHyR56gTGuQ8wiC
lcKnAH/b3bZ9mPid15Yh5cTpB8Iqb24xHsNZu7iStLQrhcr4oiSmhOFQfuKx4+ce
cMZrYaNWszex89z3+HFD+qvUG37SI4lHwZfN4bVrOTWsKl9lzSJYUHA6NpcAwV0U
AuK8iEdtJT1AHZ9NlMohNKbrTpGTmrVITAf7BWW6IYUu0Kb0BAhMr1gkcOgE+lcC
FfLBsKP/UdUyXbnvuWh22aIVSFlvdKgNLm13UX+2QSvRhFlGXhDu82L6KBrClJtJ
AlOQlea0ksuOVjv+BYo8Kl9kBh594FQAZUc+xKvYbMdzYjAiM2cVfn3Wgrh/qSIM
PUVGpthXyvzwaIPapxpUbpe/vHXjiAHT23dlO7d/yUcvNqPTXWPVsZSixgL4M3hL
KQgopSk9Azqi+HEKhJAC/hiRuhfcRLuqNh1LvooRFicgZx1YLzh6b26r0aZINwzA
27YHe0tpKAHy9jESo/DOanKGr38FmP7ftI7JYrbBXe3uSr5zghWFccZei2MTq91Q
lAhAMxEpYpIDpEGLpwzrguFAcWadhjDsWxsrIV34CvwY1S6qvw0=
=yHjt
-----END PGP SIGNATURE-----

--jlIGoITplnZaBt7y--
