Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E408F4D6985
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbiCKUgy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiCKUgy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:36:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4201CD7E5;
        Fri, 11 Mar 2022 12:35:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB165B80E97;
        Fri, 11 Mar 2022 20:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CABC340E9;
        Fri, 11 Mar 2022 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647030947;
        bh=YP9SzrgQyjOQZskM7I0k1hU6CTv2m60VmTGJYg+FQNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MTmQn9kYhV2vDgtP9ZbrZTDgz3ww0WANjipJ9cNFF+MoGIsJ1leq1/4UrDwYkuREx
         qCZrxi4PVxz1rixel+Jjq7JGSbPQbsE8tHy15vcPUxtEz99jK9/dmEnIK/uFeajruM
         tAPiHKtePtmTOYdsglDRt5UQsiEbqsMYpgb3ABqvD0fZQHfvbKPG1BkSwp1sXsR8YY
         FM8eaQlREpHiH523xHHItfNaJRznXQSSdL9gRO/D1+rSCjnzQwWPixXHMQQCvOpgbe
         1pkQMrZv36CCVtGXE6SiSndrgnAP+G1s0dxMFTsPI/sTDNadAJ5zGOFZTegsuSOmXP
         mVz4RYoNDlH3Q==
Date:   Fri, 11 Mar 2022 21:35:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
Subject: Re: [PATCH v2] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <Yiuyn4269G/hXunT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
References: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iM51bsSenGYDG0Ia"
Content-Disposition: inline
In-Reply-To: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iM51bsSenGYDG0Ia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 10:15:47AM +0100, AngeloGioacchino Del Regno wrote:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Qii Wang <wii.wang@mediatek.com>

Applied to for-next with the typo fixed, thanks!


--iM51bsSenGYDG0Ia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrsp8ACgkQFA3kzBSg
KbYVhA/9Fdk1lLIyW+tXH7zNHFJt6bDQCScxVKi/bTuMFCDG4CXIDWa7vy2KZbkK
6jDhklB8Okkyd8O15z1Sm4Qi6xUNpS8tTDtctbYo34ydjl2TcCGZu88HZguCtI21
yXOvW4Yi0J4F0/+w/ENfwX2i8g7esPcP967YWsIpAhWv+VI7CYhigrIspCJ/DahW
IaI3m3l9XP1+QLoFHF2QFqpHhcUlrFty6cs1YTaK3iQgzqBhyxMlkwSvBlldpxsV
pHkK8BfIEPf3kshDbRma1N0nwZEdkaZwjX7XPzUGgvBrY1YaFIXLUzTwy+/kI2lJ
lcJs4ypUkJaQMXjt3s+hYWRHuTqpBDiVEvubpn2uxiEE1w6T2OHkpnvYLdIP5sxZ
1G09p348JoaC4zFlezEpORn6WV/O+E7qjebKyJ9sGX6/iDEjPH5941+sBp7sQ69A
deUJ0s/1l8nSscTw5YcsRmdhuPfbDE/GfkKCkqV32syiojZXHKtogdlOstpjc9My
D532FqE+L/hwOiUzmZ1C9AHoqluTU+SeVq97iHk2KZAftkr3NsarhQsZyiImrEOr
jFbS8SaTZNBbv+9paHK2TZQUqrKS4X4V5VNRFFOp+WmgRV/PoPXa655mTNWMNAUf
DtA1j/GIjSNBE1Vlo3t4Zaiu3YqFmGA+MISD5N+k9oyH65K24q8=
=+Dxs
-----END PGP SIGNATURE-----

--iM51bsSenGYDG0Ia--
