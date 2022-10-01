Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4945F2057
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 00:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJAWfi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Oct 2022 18:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiJAWfe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Oct 2022 18:35:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4723207D;
        Sat,  1 Oct 2022 15:35:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9BC18B80B04;
        Sat,  1 Oct 2022 22:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE036C433D6;
        Sat,  1 Oct 2022 22:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664663729;
        bh=QHtjGxNukiJwu0oawJAgooFJlE+Y/aXLBK7nhSgrAhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JrFFFETGpEjfi651l/O+52K4N71srdJkg3W87uHSKVpIAO8YlPXYTiPqVpSwOZZB/
         k2bBF1P7h2P0458f8QlXWx8ibA6SZOC8IPoOq9POlpv+ArhLOeqPsagTkw29SmePAv
         ezdJHgyqHYhTTR3OcCNr1pN66fqhE70E3p1cRtgJQjyy1atzvQ39FBpXsMGspQz4wk
         /WqoVqF/Fnjmocsk44RBOs5WOgQMiQjK8GinhvLP4D8wCq8jVOp3aY3FnViNi5/fOU
         ZS1wxRmBbEY9RoqkygPjCMlHktTV5K++t03l80PSxve+rUkk3R5+htsD+9B9cUK1LT
         MJUo7mc2wW5qA==
Date:   Sun, 2 Oct 2022 00:35:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: i2c: st,stm32-i2c: Document interrupt-names
 property
Message-ID: <YzjArfungqpuNbql@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220926204631.381702-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V2jIUGGddksmaOjh"
Content-Disposition: inline
In-Reply-To: <20220926204631.381702-1-marex@denx.de>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V2jIUGGddksmaOjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 10:46:31PM +0200, Marek Vasut wrote:
> Document interrupt-names property with "event" and "error" interrupt name=
s.
> This fixes dtbs_check warnings when building current Linux DTs:
>=20
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated =
properties are not allowed ('interrupt-names' was unexpected)
> "
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied to for-current, thanks!


--V2jIUGGddksmaOjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4wKIACgkQFA3kzBSg
KbaZUQ/4k86xDRdWmc1OlDKuttQO7RLR4At8fzMJFEQ9eFEzDRJJRr+JhkuFMyf0
i5g/447EPZid0rJrUXCebtPRuWtUYNcqevggTjbsDYvR/o1EvT1lk/0wz8TXEuOm
NkslIGgzFXVeuFu0MN8/Y2XLLiPCOfk4cDa7ahHeEGyhnLtXIl8up0i0EUyOsBKN
ou5982rQ/91o5rSGJlFDarRiGjGtwR9fS0PghJwPQy2xmeBgMGyPYI3WjTVX6tuV
D9htCs0r+/mo0dbyp2JZqApWIiUwuOYpO2js8t1tEAnr0WcDpous8AM4Z1J5C6Y9
KODyqqbdhWlunvs99nVSAQmuGPdmph+ysV7UhqYoFFlglZMHipDzJBAMa+bLXs7m
UNf07D6//7cT4fFeT/Cyf2q7pjMbj6DXSbBQ+E1rO4tf1T8DnsJ+uhxWp7eqSLi4
/+4u0/iRNfl6xj8PiGJpdV/LKTzS4H11KN0m18VLf6F+w9jU2haIyF0X7GW38sUb
4uzm6TA5YY9sO5YGba1aE81U70ozs+O7RW1SjvDHREfsZKtOG5kNyNGZbFghJdXC
g+Sq4Ce98OXD7kLJQPsXjruE4FFGlySMac/4OabNtPyLbcK4KzYP/bvLUiqNpT7k
0dJVOW7tTnnLxa05YyJ2qbpxRD1cE1l6kgs3rYb8LG1lKqQzCg==
=hhIn
-----END PGP SIGNATURE-----

--V2jIUGGddksmaOjh--
