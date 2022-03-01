Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A9F4C905E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 17:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbiCAQdJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 11:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbiCAQdJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 11:33:09 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514AD532E0
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 08:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=qiCg38jybDtK7ip2hwmrJLWVCfFh
        NKMCiTIU7NlaokM=; b=SocujXex9oOjxybLXmsTLM4a41zHr7eC+n/usNRb6Fzo
        yIj86Xz4+SFm4XuOD8B88U39zgwzRvF0FeQGVkRca4Pa27ixCxuhs7wocdXkx6E5
        kGGNsslnh4apc21/5bhofEDx4CfUTM07zArxtr7PeFTFXGhZD3nd1Er0CMLPSoI=
Received: (qmail 3933236 invoked from network); 1 Mar 2022 17:32:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2022 17:32:21 +0100
X-UD-Smtp-Session: l3s3148p1@CimRtSrZiNYgAQnoAGI9AP6D0HJXVmR3
Date:   Tue, 1 Mar 2022 17:32:21 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Message-ID: <Yh5KlYezX9kd4Qz0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>, linux-i2c@vger.kernel.org
References: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Yh49IbR4B0m+kh1f@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S2aq5rdaODxW07+f"
Content-Disposition: inline
In-Reply-To: <Yh49IbR4B0m+kh1f@robh.at.kernel.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S2aq5rdaODxW07+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
>=20
> Applied, thanks!

There is a V2 of this patch.


--S2aq5rdaODxW07+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeSpEACgkQFA3kzBSg
KbbcCA//faBA5KGUKnrvv81tjULSFdvi5LTps1HaEBBciowDsg3IhMgXtig/l4sI
TgQMF4616wJrWr9QJQFr7PvOUMVGfvMFSEXV+vvfI31ovP50io935TiDv3siFmds
SU8erxZVcGJIEdvoyqZHLeQ/TPSTuHh5cV2JeovW16/tTF+6Vl5HJx6kFotDGmYJ
WHgIbjiTJ2mkaRp87INnFOP4uQuEukxriDjBqJGdzYoef8vx2zlM5C/0fcVvCcx/
BOTneggPjnrzaDHjGMC8tkdMfwkOwh3oBUagm69EAdMyuR9DEs7XMeMnWpO8t9ZP
AXiJFbckIk8Wrax8WbMoHyLmsOYrwLKSJaueVVP8a9j5RjEXEeaekrKSa4nC4xNi
1gszhH72a18jASXYsfsx8mivQ/lnEaFXL5mWY+2AK18A7o2jr18KmZib0Ye27dMM
BTGuyM+1E7NBrljw2FCsgBiOdD+6lB6N9BsgBD0Xgw6rmgWbWsf4nX10OxTyEFmg
kW2dirAOVIp5U0nT++6HO1Du1oyaqULQ0mRRqY+ZtHozOM8/LcD8R1xkxn7TYcbI
I6eEFyLO8xdhxLgp5VtH1rHgJ798PG2+wMhX38LJgCEMmiR2Wi7BN9uq5dhlQAi8
CC80qSwHLXMIum6HIK8j5RMvv1XrArlRCiKL6FPYQqROCZhZi7c=
=n9X6
-----END PGP SIGNATURE-----

--S2aq5rdaODxW07+f--
