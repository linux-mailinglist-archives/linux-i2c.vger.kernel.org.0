Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8314CBD49
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 13:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiCCMDj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 07:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbiCCMDi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 07:03:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FC43BFB2;
        Thu,  3 Mar 2022 04:02:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB31561867;
        Thu,  3 Mar 2022 12:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C15EC004E1;
        Thu,  3 Mar 2022 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646308972;
        bh=joVFOZmms9HBOXgoZuJ9RkqFVCdj5U89jr7ZSVH6EQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TZZSF6TfMAQvdtUbORxyyZ1laxtoEDK+breNkO3og95FYG+sCa+lfCi20qQth4/yt
         CED3FwKQEixoFfzJDy1Px5awEACzAjHNWNtPw7YhoX20sBuRmdZ0gN1plPHNcwN1zu
         QsBhk0dinEYAp4Hc/tMYSHYOJ+8VGk5lg6NtzCh1PlXdy21Rx36AVYCH66UEmG2G1D
         ObRTKStZHJ5iZw4A87eI5bTzqTzkKAedEzmkUzzKEV6+/ZarqU7pxVlKrbDq/5VjlB
         cx4nyHUS4axCPej7NQkRqcft0KhM9ywXE3A8nbgJRN9TfgAmZa5ZQVbrW1yYPRU+E8
         kyjdwCJC5gaZg==
Date:   Thu, 3 Mar 2022 13:02:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
Subject: Re: [PATCH v2] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <YiCuZZs8T6AKtpbe@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
References: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
 <22eccb9e-45fa-683e-640d-6f34fa63ca52@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j0lwsQweqcGwCt7j"
Content-Disposition: inline
In-Reply-To: <22eccb9e-45fa-683e-640d-6f34fa63ca52@collabora.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--j0lwsQweqcGwCt7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please, can you fix that while applying, or should I send a v3?

I'll fix it. Thank you for the rebase!


--j0lwsQweqcGwCt7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIgrmEACgkQFA3kzBSg
KbZ7Vw/+P4t6jxxU+NlXS44NM14j/3DF6/rUS+26gLGmUiUUHI9Ggr63ImC/481K
QeHlVA+WluBuP8OWKvFWReTCOM1t1KnapFDGWESqanG6W0vSN5Br3cNq2nLmD2+P
JHdQ5m6Ssn12KkTm1i3+EpFpTlU4kx5TyvAvvQ1iM/W8jNRwmKIx93pcL1pYU9Z9
xsNbJ6isE2ZdicxaaHuHnSy0XCIkl6YXtDwDNo3vMmmAvLvMwxGjcLO3PW+j9PWm
YvMC+CuiyJ3l9OCA3vAEDuJdneW9sBz25mNpzE2esUuQrPyHjTTAHThbE075q40y
5SkdcJL9G1gdPAHiJeFkW+P0j22o1JVFm7T6SZJdnvmilslBqtn7ay1QMuqDuBEr
KuR2h9kB4wUs9bklY1coegtkNpk75O6wQ1CA5e8Ec5l6kq8S0OFxXXFa1jv9Q3a3
kZ8si8YEH2+NWYESsbgtIQXoohFHC85x9T3PpvEewlNPpyCP6eRwfcUdkMHQuvcT
oBkXd4OWlNZC9PLotz5NPp5xHPrKptRxoPcIfbdR9tYaSnN+vhq9VEU2qPS40iiB
Ae1O6W82yVeTXZEQ5VUUnYdYvfBP3hUxFT+GHqBx+sV4hQrc70YDr10dVPf0IMPP
loOnoSm7D5eXmeMecI6jxmEfd4SEApZ0E4faYO1pMMJ9SBaOtvA=
=vPdX
-----END PGP SIGNATURE-----

--j0lwsQweqcGwCt7j--
