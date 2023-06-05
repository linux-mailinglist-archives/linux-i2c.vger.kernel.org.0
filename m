Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8DE72221B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjFEJZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjFEJZI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:25:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27335DF;
        Mon,  5 Jun 2023 02:25:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A9C1B621BE;
        Mon,  5 Jun 2023 09:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A829C433D2;
        Mon,  5 Jun 2023 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685957106;
        bh=2vmmK+h5PPIQLJpVOoUh89ZNQLOuPRABXJRcoZvm1MI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V7X/5cmJkUW0wqW++Tft1ozAEGUwqdyFzyv/PZrmfUK+4xcV8I+he1y6mwZMbteXo
         TXvSr62lOvqBPePVzeIMf3YYDJ7cngTfPlt3f/z7Qkd3s/1m+R/KAK1Wte9Njr++0k
         0GHqtzGRassZ084k0kOWE1d06i1ciqiA9PDUztEtiXtnY6dZ56C3ZR7BrJxo53+FjR
         cEvBlimgenvyC2FVJMVUENPEIOi5op4v+YbwoC1goc87k7VZOJBFLV7HBE1LjVeV4t
         jZxS+h5j1RZZKTgi9r65sy1jeffJ2Xqvr2d8I711bNYOntgHNYbegjOm+WmeivF3pT
         3kuIvd5Iskobw==
Date:   Mon, 5 Jun 2023 11:25:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Add i2c_get_match_data()
Message-ID: <ZH2p7iWYizLsxZ1g@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yCBX5AlPw0rYAlLc"
Content-Disposition: inline
In-Reply-To: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yCBX5AlPw0rYAlLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +       if (client->dev.of_node)
>                 config = of_device_get_match_data(&client->dev);

Has it been considered adding this check to the new helper function as
well? Saves even more boilerplate code, I'd think.


--yCBX5AlPw0rYAlLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9qe4ACgkQFA3kzBSg
KbbXcRAAiqqWhEzO2IUNv5glBXaA9C0Ad0/rf6jrOOsMuiR4ajw/+AJ7yQDBw7MC
SWJ0gYjMOgv/pJupdP0lii5M1hUDMljKyfLwjnAbhtXeOM3QQRZ+cqWfoDDfbE3r
EKIEa37vKjF99+D4uK/godfXrJf7hzTTgLMDBIMUW1SRao7vQIjC66xhGOi4iqs8
7EBLBm59HxSchUIBw0IpiZa+Dy/DwV+sjU66vLPln93aujsOkOt81I+WaasB4BX7
ysh0Jzk9Oeuk5wjs0HwRMeI5RS6BayE9chL4UGFwpkySSt2e16Q5YxLm9MUlE2+k
3wGkQ/qyUPVDoYcwBOMew9piBoID9qOXFdx+8fkaYEkbaqO7ZZuL9jVmuOjvpC0o
9LvY5uOooIymg1Dkwr37wctWZ3pBCNhC6BXpEjNsz5EQDcOmg+l08YmSRgty/aW4
hsDQ4lK6fiD4MJI5C5baiMStEN+1tMU9oltmCRjWKmFCtXhRtjjiZJcJKCAyXWYb
QeWkk/UnCpUga1oyl2k1lo4+RkeR8Kc0Tm3IqOrFinMx8XTDSxplsDJT0fPAFqvN
wYJVRa7oBhZ6slObMIyvW6j/vDIy8mqekbvx90g4tzCRw0UPVSuB3xqtCtPm4kE9
SPLnssoFyxD2QIM73wrYhwFZZibLhw/8qpsiQdr6OzdAXQBnEvU=
=8N9i
-----END PGP SIGNATURE-----

--yCBX5AlPw0rYAlLc--
