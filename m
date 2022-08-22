Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1F459CB5F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 00:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbiHVWTB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 18:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiHVWS7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 18:18:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D4A30F5F;
        Mon, 22 Aug 2022 15:18:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E133DB81979;
        Mon, 22 Aug 2022 22:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B4EC433C1;
        Mon, 22 Aug 2022 22:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661206736;
        bh=lbcG/7heY9/JOFnDhcj6xbKcHok+D8FUqe/aKxOcKf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z8C/OSIeggQ9gE6xHp8ktHYev5VYLgZE3JSSG+pulWkB+NxV7bArGgYloECSKaTEe
         za+YaqntbyDojm+TQRjxYduMRpzVqfTz1XkUo+hAdLzfK5dWEXGDKALrjeHUlYGkN0
         Sqa5amT13mAZdb2V31RpXkKqOFYFys/iumTa1CgJ+iFUFuvYr7tWMd0g2IcPG6J4i2
         Ugt4Uhdk4TIyfF9dI9/YoFxkpdeOqBwzOcHMWadPYhNc+y+DzLwxrTabG2gE5sXS8N
         uI7Gn8QnO4bxofXXwBtuiWDU5vwHlr2L0Bh59sP+m2O4/HN8KdNxGTG65W0aGaUFhw
         rBjH3EYZnGsNA==
Date:   Tue, 23 Aug 2022 00:18:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 7/7] i2c: imx-lpi2c: use bulk clk API
Message-ID: <YwQAzBUuFvGUlrmX@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, aisheng.dong@nxp.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xiaoning.wang@nxp.com,
        Peng Fan <peng.fan@nxp.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
 <20220816125526.2978895-8-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SNO4dW2CIYUSOHuv"
Content-Disposition: inline
In-Reply-To: <20220816125526.2978895-8-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SNO4dW2CIYUSOHuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	clk_disable_unprepare(lpi2c_imx->clk);
> +	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);

Why is there no 'unprepare' with bulk?


--SNO4dW2CIYUSOHuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMEAMwACgkQFA3kzBSg
Kba5EQ//VXnGL1C4B0a//cAO8UEoVGlawafffYMhWe3JEjtI7E2hZKSdu9lDyFdQ
0HYdjMlZLyJZjfAYPs+GT6vKHN0vYTzuxDbZRk7r9aWVa0AG6xxgH2/qLLAk2CAK
ZzBlASlKfv2mZpJ73ZG0Iz9T5WY5VkSngm16Ycr/6sRC4rkmzZ794PvPhKD2xjWr
a8npBv1FPDjr96z1Bg1GrjbAUqChUTTCc2YsDkHgWnOEhZbRyMl1oaGKTpMPgLIT
4HnbL1WG7TL2FPcU3VDruVDm2R9ZCoJOAkqNbCIjVnYLd3ePKPOvmBnbyfAoxKnp
LZAj5a6xDYZGief0mIemgv4lGKPxt9tjgJndX/xk97axUO1pB8YVpcZ5XEDvTUSq
KiMeNFFqMaOkOKtTBhLDxDlGTTclF/DtuCzZEW4qYCjnBZOa9XqAsX9GbGAD3GAX
VoeSS9XaoN7Bkq4nGzxXg4uHGXiW26TH4ByqcQtlHo1TagMLA946bL9U1z96Mqvd
BX1ILO3D8rFW5WwAyoJrWMC6AbdBhzatVy3yOaAEt0nKsBp0Wu/qSwSKd2yAllm4
CRkWlm5Jf9DnvWgCCJewH6nS+qtU10ujzca1SYzsDAPg6csLnE40c6CsfzvWTHbu
eHqIkKPtCCkMAT82sN1SYLt25qYdAZzD1wXAR9QYjdlBIVcpRTQ=
=Iftg
-----END PGP SIGNATURE-----

--SNO4dW2CIYUSOHuv--
