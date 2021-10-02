Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAFC41FA14
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 08:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhJBGcZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 02:32:25 -0400
Received: from sauhun.de ([88.99.104.3]:34950 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232082AbhJBGcY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 02:32:24 -0400
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
        by pokefinder.org (Postfix) with ESMTPSA id 16A332C01E6;
        Sat,  2 Oct 2021 08:30:38 +0200 (CEST)
Date:   Sat, 2 Oct 2021 08:30:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 2/7] i2c: mediatek: Reset the handshake signal between
 i2c and dma
Message-ID: <YVf8jQPHoQtbCfth@kunai>
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
 <20210917101416.20760-3-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UvFvhvLUV2QKFT4X"
Content-Disposition: inline
In-Reply-To: <20210917101416.20760-3-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UvFvhvLUV2QKFT4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +#define I2C_CLR_DEBUGCTR		0x0000

Hmm, I don't think that a macro to clear a register helps readability...

> +		mtk_i2c_writew(i2c, I2C_CLR_DEBUGCTR, OFFSET_DEBUGCTRL);

...

 +		mtk_i2c_writew(i2c, 0, OFFSET_DEBUGCTRL);

looks good to me. Anyhow, it is not a big issue. Let me know if you want
to change it or keep it.


--UvFvhvLUV2QKFT4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/I0ACgkQFA3kzBSg
KbarWg/5AWa1p784FQB8L72nw+1vj1664TNbB4mDaDRNT748bnUy4ZrHl5XMROZi
u+L3Kb6drKfBHX1iiTN7908T6dss/s6lGfOiGx7IsTJAoTVmZNoG58OpvCptg8gc
xTlSls9twWk8S9sp/5LD/sRlsCLsbktcL8BZEP7FHWO9eNWhYNqLq/asy69kpnkO
hbKKQ2F/Ne+fLiwubzeLHsdkNb6AQBjmMnAB4Wthnxitgfnn6XgEXp3vZEBiCce4
D4+VtUrNdG2sQXuwuXogtLAnOZMankq/b4o68EE1EloCCBcus98EnXrLHYvbKj8A
1fUxBpoHg0uA5RrKtcyVrrp3e5hpE5rBLimFYdi+NQdL4W7wN1KWmdYvF6y2NWGY
i/9NazOqV0gep2cSRtH+KvpSP2jpAZyyTqFC5UGSK9BJJKl+E6hyS6+P9uj6Zos4
/yzLaW9Rk3Z13HAJQLzOmizdrCuFl3L+K+QnFDQCH2HRGhDJiOpV40SqHFWWUN+4
P9Zh2bAn71/S1+dHY1OldIHBEZaCwfY0ydfdhgn+nbrPLL8pI4AklJyJUiAUPiYC
FrvB1wc4tcq2PEn/16fiwLuhrHWqNY83qw1MdNCGGBwIB+OEp47F3kQOtWznepou
XecMzXpurwrvSS8IgUwPbY4X+XdN8FUCTbaqSaxbgr3LKMnC+gg=
=UHsi
-----END PGP SIGNATURE-----

--UvFvhvLUV2QKFT4X--
