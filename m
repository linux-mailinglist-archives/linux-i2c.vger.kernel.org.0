Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047525BB9ED
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiIQSf6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIQSf5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:35:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3232CC94;
        Sat, 17 Sep 2022 11:35:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E64361157;
        Sat, 17 Sep 2022 18:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0A3C433C1;
        Sat, 17 Sep 2022 18:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663439752;
        bh=A48DVQ03g2edUc3BsKyEachP44aV138b9BeCR2ZribU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jpQ6Y5k+fHhjq/j9Vs1DwqrcyWKkO6P7WwM4YnkPFY9MzOpLEm7nq/qkv5aci1gE/
         ytMxTYvXX54W0q8mdfi/82jI5WMrPMhRld73e+DDOMChEIKxCZ2hLLm5nzf4a4cNtr
         d4uGFXX81P1W9+VmwLj/lpnxoIjW+n+R8fK47ZWymiPia9l7mBMsPGJF58NBZ0mDzU
         f1/DwaLI/k6nK0wR3vuOVrkrcbbG+FfwakyyrTR7ByPB5dIxPdLCIx6DsvaIn5i1sB
         uZgJShSmF0dcFBYPJIwSa7X+nYOC6+CcSlgcCO06NYuyXyB0wBoY7iJCM748hG+lQF
         bOcavOg3Kmvdg==
Date:   Sat, 17 Sep 2022 20:35:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] i2c: riic: Use devm_platform_ioremap_resource()
Message-ID: <YyYThPs2s2s1eGsA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220913170121.24246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OA6H8TQYlFQXjaZV"
Content-Disposition: inline
In-Reply-To: <20220913170121.24246-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OA6H8TQYlFQXjaZV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 06:01:21PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use the devm_platform_ioremap_resource() helper instead of calling
> platform_get_resource() and devm_ioremap_resource() separately.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to for-next, thanks!


--OA6H8TQYlFQXjaZV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmE4QACgkQFA3kzBSg
KbY+RQ//cKY28S5MBG3HeMH6RvvfY1B/PmnROlNqigDZQbVWXlp+E8UETDfTqzwT
UKg5ZYL5fSAum3lgbIpAFkAPUpTdTrpE3jsnXbeQ6g+wykqblL9SDU9QxIZ7060C
NNoO87Qw1ZtM+k7l9fVU2Kvo4T1GwBo2ZlO2Zs/ZWJgVhEbTwHQerw+ESBbKNBG+
evTD/0vdFTNbQ5E63b+rBKbrjS9LYZ/GZJQKiwJWNDPb9GRzA4UirW8EvU764K+g
ID2SHylodDt37GaWSAPkmXpUI6tbT1b1ofCCscxQ9QFAeFNWnPUZ4Fmbib4Z84y/
HbkvuJX+6y6XDbruEhqoKjhRhmsOTfMNh+jUWGV6byIWk36s+rFYHQgBisRMe5BC
7RwZVrQMVyDXelyCKltMBU1kpYMlgTrJTms2rj55LvKTcMXarMHHV0ZjrBWYjGbU
NGhZ4YRKQ9ERCwHMqOD99GFID+RhY87zJMcBUYw04mBwuc/XQBhvkLeGs7B7Lz0f
rcyDRIFJ6M7h1jfGw2GGsfimvDvzabafoHGxIf3VFdt5DOS8Sc0XiG0UsQ/Gv9NJ
1WZG5ib8s7kZJ8bTXw8k1e/bE8z9+KQZ9UlMS56AysuT5nfa22OKp2h44ONh0KQF
rZCPutVWyLymBTIReAZThC6VvPl5WqGdv1XMwXiivn/aSvqN3l4=
=HdKD
-----END PGP SIGNATURE-----

--OA6H8TQYlFQXjaZV--
