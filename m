Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066A341FA1D
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 08:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhJBGjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 02:39:16 -0400
Received: from sauhun.de ([88.99.104.3]:35022 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231941AbhJBGjP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 02:39:15 -0400
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
        by pokefinder.org (Postfix) with ESMTPSA id 0370B2C01D8;
        Sat,  2 Oct 2021 08:37:28 +0200 (CEST)
Date:   Sat, 2 Oct 2021 08:37:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 3/7] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
Message-ID: <YVf+KCztQI9XrdEq@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
        yuhan.wei@mediatek.com
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-4-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WnN6qXzV7lU+Tq+i"
Content-Disposition: inline
In-Reply-To: <20210917101416.20760-4-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WnN6qXzV7lU+Tq+i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -837,6 +839,57 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
>  	return 0;
>  }

> +static void i2c_dump_register(struct mtk_i2c *i2c)
> +{
> +	dev_err(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
> +		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
> +		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));

I think this is too verbose and should be a debugging only patch not
really suited for upstream. But if you like it this way, then keep
the verbosity. However, dev_err is too strong, this really needs to be
dev_dbg. Timeouts can happen on an I2C bus, think about an EEPROM in a
long erase cycle while you want to read it. Perfectly normal.


>  	if (ret == 0) {
> -		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs->addr);
> +		i2c_dump_register(i2c);

Needs to stay dev_dbg as well.


--WnN6qXzV7lU+Tq+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/igACgkQFA3kzBSg
Kbbp2hAAglx55ZKyMUuZ9OqPQ9uAScg0Tf3qeup5IFLV3AR2uLSpW3ONvZT7aCZv
E2rZ4gZl/mLdRmeMBRsWIOSbanA1bjG0ddCTOMnuPhYrGo9Rv5qVW7CUfBRp3cMj
rt590cr0/Jqbn3TyrM9N7/baathuJDpoTS1RlOC3t0BtivDWmaPghBR3MKUryNmp
lqCbNEpOwG3Xrd69O4oNFCo/Pox862cyaAdMEBJfoJvk8O31fHkVbtGuhnN4Vh1N
Z3NXYvISdxon71h0XvwTkzs5oX2PpV3oR1oBXUdAv+mWsk9ti9uxQorOcmyL1x7B
HWQaBYyl+gpyHFElcYlM4h3TTUw3I/WzWBHwba5mjKl5fRD4EPBKhwoBdWYccQn9
3nbmlOkEdhylMQBjI8pd0kpoAvegpHbtHfeGSo1/hyOi66UdX1kIA65emq+kaHjJ
cCsjzGQE6QCm3GJ607qA1IIJaoCkqUvwrFTMy6VW0i/A9dMPtHiaN1spbFo8JyG1
wDiWziHNaiqage6Xo2jgevrqmfp+wV7JwcxR+JJHs6nTApYCzsfB3iaqupL9adBu
7fcNnGENR6oTSiaP8P55IaC/wHhqfZHcKDky02SqnOXQVfZvf4A7U5rQgTV7dL9y
XbS16Zxl+/jIZyQi9Ys9cuj3HzoZnzVzkDwGT5M2rk45kvhUljI=
=PiQy
-----END PGP SIGNATURE-----

--WnN6qXzV7lU+Tq+i--
