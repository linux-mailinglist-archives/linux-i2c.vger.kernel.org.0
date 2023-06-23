Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404D973B2A4
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 10:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjFWIWc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 04:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjFWIWa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 04:22:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1DEB7;
        Fri, 23 Jun 2023 01:22:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70249619B0;
        Fri, 23 Jun 2023 08:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B95C433C9;
        Fri, 23 Jun 2023 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687508548;
        bh=H6HaMxscb+DMf+rtZiZOox5KX3cpPP5JUY2w0qUYU8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GaY0Aiwjo3Z287Lbk5IrwA9vYB8bxhO4/GPzL5d3KwVFtgMC8qey2zEzyNPVqQ/Ug
         NiatktX7n6KPz9waFjUeySZbDdbpb3KlJdZeg08N2KfoPLyPQnHFvYWzyxfxifivU8
         PDoEhJaXOyXeROcpN6fSVuVDrp0W3J9y1+FI5jm8j7Av8a+eIKM+m9v/+Ej0Q446ZX
         9tqQdWrVn9WbjdUjAC3PR5XmHlhKDE+y2dELhY9cFHDZfUyskQHWgIjkU2glFRAyob
         K8PdulSu1IYisYcC5cpRw6bsMylFWsTVcuODExYl65Qu3KjjvrA75HGA5/8s6Ohkha
         hsprPurjTW1iQ==
Date:   Fri, 23 Jun 2023 10:22:24 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andreas Larsson <andreas@gaisler.com>,
        hust-os-kernel-patches@googlegroups.com,
        Peter Korsgaard <jacmet@sunsite.dk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: ocores: use devm_ managed clks
Message-ID: <ZJVWQIZRb49mhofo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
        Andreas Larsson <andreas@gaisler.com>,
        hust-os-kernel-patches@googlegroups.com,
        Peter Korsgaard <jacmet@sunsite.dk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b5c00122-0fe0-4020-9036-e4cc37d1b51a@lunn.ch>
 <20230526070534.76112-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w5OhO3QWIyoet40D"
Content-Disposition: inline
In-Reply-To: <20230526070534.76112-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w5OhO3QWIyoet40D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 03:05:33PM +0800, Wang Zhang wrote:
> Smatch complains that:
> drivers/i2c/busses/i2c-ocores.c:704 ocores_i2c_probe()
> warn: missing unwind goto?
>=20
> If any wrong occurs in ocores_i2c_of_probe, the i2c->clk needs to be
> released. But the function returns directly without freeing the clock.
>=20
> Fix this by updating the code to use devm_clk_get_optional_enabled()
> instead. Use dev_err_probe() where appropriate as well since we are
> changing those statements.
>=20
> Fixes: f5f35a92e44a ("i2c: ocores: Add irq support for sparc")
> Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>

Applied to for-next with Andrew's Rev-by from v3 added, thanks!

Please send new versions of a patch as a new mail thread. This makes
handling easier for maintainers.


--w5OhO3QWIyoet40D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVVkAACgkQFA3kzBSg
KbbC+w/9F+9+pQmW2yguaFIUfTdzAJfOEQHEIHl+qsoI+GCu8AQ0ikoYk1ynUd5X
YjuEuQfymtEGCfhfGj4iOuxZUtU7Mbw/khJKqWrOKlHHZqnqUBdC5JsP9glEQeAN
H+9KOQGQFjx+0JFvErIEJ1iUjbhb8ONatiDmkmzjL59ZiCJijYF5x75yySlrzW+r
n6yeUVucb/h96P6NYkXeJtgz47gHHXmIWkPHmZAPLezWD6+pkWvZVHsk0kjEsNA4
EIjmX0w+wVuE+4ROctSDPH+TKq4dB66YmAO/xkrl7DsREd55DgDJ1I9PDE+ZAHh6
FbsbIM6Qygwu5Ogy1Z+pSYefe/2IR1P++uLM36r+gXtc/s9VunfzM+dwLChv8Deh
KfbDdgnPuIS0sCvBmHOBQgP4qS0lmq5JCVxqp0SlaQMrVXDc2LEEItVUfLKbt0SO
/t6Kjget1ieel6WT4IqBGruSYqjEwXLY2bxPl2cfi5t65IPtJCAvF08YRr7IcfoF
gVxrcH5t9mFBPiTCmtw/zkXGS1AHFf5dCaxLY6Kx4Lc2g87NGIlwwuuCt1PXdjkk
YwwvJGpy63LLF8H20Fov/g0jSI/FP4knbw3LYUM05A+SDVvTPVMMSP/kLE7gkX3Q
BSUfh7ExD/D3/M9+CMySRVapC+8NlzCkpmaZMd77RM1kQs4UwYo=
=G43Q
-----END PGP SIGNATURE-----

--w5OhO3QWIyoet40D--
