Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493AC4CB176
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbiCBViv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242559AbiCBViv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:38:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C597D31932;
        Wed,  2 Mar 2022 13:38:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B20CB8225E;
        Wed,  2 Mar 2022 21:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2F5C004E1;
        Wed,  2 Mar 2022 21:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646257083;
        bh=u3CiApm/HAA54PdzVzkQa0SMTvOR974KdivaMD9drI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tZYrzcGxX7uFzIDR32pl5B/rTE0/WsMB1BWvGgu442qpQ74f11LAQKckgT97lFPwG
         HgXefWfUqNuA//PZU7OaDdbSYq6fSRWAfKDm2DHdYaGfQeV7EZQCa/98sp/U731dxB
         ose0XODYq3HUb9C5/FeaGYGyjpO/qgju1gXpC30CNKNEImQiMRX728nMscXoTdcNUM
         bfC20sjgcimXwUCFfigaveVy3hftkPdaXUiBzoPYKSe8aH7SYgDQdPXXthEdiWHTDQ
         a22Le4EGgnOtBLYINH+JEJ62n6GEEt+U8H/4zV5/kx5uzr4HWkNI/KDBVYqWtgaCLB
         aUPpD1LjQlKvw==
Date:   Wed, 2 Mar 2022 22:38:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <Yh/juKe395aNHajb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0hUHtEcZp+Fkfqii"
Content-Disposition: inline
In-Reply-To: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0hUHtEcZp+Fkfqii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 02:33:58PM +0100, AngeloGioacchino Del Regno wrote:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Hmm, it doesn't apply to my for-mergewindow branch because of other
mediatek patches. Would you be so kind and rebase this patch on top of
it and add Qii Wang's tag, too?


--0hUHtEcZp+Fkfqii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf47gACgkQFA3kzBSg
KbanuhAAmqYnaoy6/gsLbutpo9FX8hs9F1lvxqeyg6zRxqY0Hc63iN8VZXioZXOK
MdvYwd25pL5u1+TAB7Ds+18sYd+qO+2t8v7KsM1g6f72ycT5v8cmaNfekJ0RqQ2G
gAXwOCbqhL8+N2P0Y4xqd2CLwc0SUWXv3nabFE6wMkW7U45ptNHLzctwF7EBzZnx
sNu0Tt3ke2oaOjvH27m/XCnJyWWCqlWqNfh4ntKYFqIO6GB9H6/kmpfOo9U7RSVR
6PM/56kLpVrfTbCqDgllQ0C06zUwvj80n66dBlvEQdQDXGewyJcK6herIYOoGRz3
bg1dSZQ2qunMfuf8QgVsZFv3xyFxHkXCfOv8G0ybc5pkr1SDjiemKp38zrtl93AV
2vQPyI/KySnLa+LpFseVHR2a8efOtBWGLVWl763GAKBQyp3rEMARXAn58iRonrBc
kmXMii7nbxGepw23ec4tTbyux14edXxIdNQ9atfuFi1fQ+qeOe8aM5PCu9DRtETY
p5I6E2WhD/21GfYAEQJhW6V9lRYv/I/VlMgjHQf5Zt/NazUpiQoMvemEqGc8lo23
hStP2HSI0ZAtBRf7V6HlM7io47nPmYAe3AKXNJ9KWYooQXh/PpcbGS8M9kCZ3qKR
SWdoU5fv93J7sZXgT3huWxvjVT293uUiRbc8FA3ZQ4LWwlR3jS8=
=78JX
-----END PGP SIGNATURE-----

--0hUHtEcZp+Fkfqii--
