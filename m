Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720A077BC8B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 17:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbjHNPLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 11:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbjHNPLM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 11:11:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C5710FB
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 08:11:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3607D62C37
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 15:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499EAC433C7;
        Mon, 14 Aug 2023 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692025869;
        bh=Dt5BVAQdSjIe1Gomkpd3GvHSDeu1QXbEtdk1UuLfTmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hco40UkJ/LJ974yCNovaxYm5+FuXkpGJqf9VEAvMiChsrSVDkG6SkRQdmzGJEGnfJ
         5PHxFW7NZq+3NPOr+Fl2MgdWimMpeZY2ODf902I5upRxdjvbZ3i0fWNFUFKVwz5376
         sarKa7OOOmqN/wrbVDCJTG4jon4CbwwBw/fMEWtj0gdyFevO8l3EYhABnul7TmpeJ3
         J2Qh+B4nHNwZBd77uPfXF8ft5fZDD0mgmRia2eYof5ixddUxV6IVllEdVeGowEEDqe
         3iVa1mENjSpEmJXHud3qJCJuECpkAklEwqWqCHBi0S6l7LgijA24hx7OeAXNACAARy
         myO+UMm8U9FWw==
Date:   Mon, 14 Aug 2023 17:11:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     brgl@bgdev.pl, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next v2] i2c: remove redundant dev_err_probe()
Message-ID: <ZNpECrxK2/4yliDG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, brgl@bgdev.pl,
        conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-riscv@lists.infradead.org, Zhu Wang <wangzhu9@huawei.com>
References: <20230801134814.247782-1-wangzhu9@huawei.com>
 <169100562785.1919254.291391952713888023.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rWooky9arVmQwvma"
Content-Disposition: inline
In-Reply-To: <169100562785.1919254.291391952713888023.b4-ty@kernel.org>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rWooky9arVmQwvma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:36PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Tue, 01 Aug 2023 21:48:14 +0800, Zhu Wang wrote:
> > When platform_get_irq() is called, the error message has been printed,
> > so it need not to call dev_err_probe() to print error.
> >=20
> > As the comment of platform_get_irq() says, it returned non-zero value
> > when it succeeded, and it returned negative value when it failed.
> >=20
> >=20
> > [...]
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's branch), thanks!


--rWooky9arVmQwvma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRAoACgkQFA3kzBSg
KbZtWA//aMSewd2WeHjx8tMHiurdNOLPVmSF4FrIGKH2SKdG3UEmEspSi0kcT5O0
KPyR3ka1bjNg1EMfdsc36SHeg5kb+DWt6VPpU0ndxhVttQC2ws2W+94pIOWwifGZ
NrTwlxslSkYj08ymo8E/LY0dz8oviEvLNtfs7YPJ/T91VkgCaT0YPQ7fsjph4AHt
rYz7INAMdq9grT60mxTXnJ2M25GFCChi9bPm1/6h210fo8ZNJ/7Z4nfakoQAxI/6
W12VskqhzNn5rt0cv6YIiFHD26UBPFcjT3XuJnKUonGcRdPDzYFcNyzjefyTyTPR
8gzFJVZuE14yjVUT0BAlo8rp3QHyet87Y7/6xtM9wKa8nu0Iw5zaOhSjK9LAuY0N
gKVnxtPS9wuUjA8M/tGA+bnxYXHHne8bIIHBl/td3k/hCYlnOLYY0rfCVzjI1P8y
ZhX2ngVwwEe3Gel5CTdvC0Es2urTNrfTQNRwewV8dv33Z2l5qnB3lzKRTfc8tahI
UCylYP2oy0ecJuCv+FjuSGo30u5tsSsbg9aus2T/2T0FuLTW+fgk7/1P3Tzr8k6D
SzORsNKEaBBnmPHvZ8KO43rvATgXPU/4Qt68qQ4ZbIZweAkabwaZrtFNZTBYAXAY
p0rDCA3UBd34e8BB6509bDTWR2d6BkSWzPDNh3a5tAAJCvn7jLU=
=ID1a
-----END PGP SIGNATURE-----

--rWooky9arVmQwvma--
