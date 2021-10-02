Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068D141FA23
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 08:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhJBGmj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 02:42:39 -0400
Received: from sauhun.de ([88.99.104.3]:35068 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232400AbhJBGmi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 02:42:38 -0400
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
        by pokefinder.org (Postfix) with ESMTPSA id 0A60A2C01D8;
        Sat,  2 Oct 2021 08:40:52 +0200 (CEST)
Date:   Sat, 2 Oct 2021 08:40:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        ot_daolong.zhu@mediatek.com, yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
Message-ID: <YVf+83LdUEPjoLdI@kunai>
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
 <20210917101416.20760-7-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+erojwrcEqBTpKxl"
Content-Disposition: inline
In-Reply-To: <20210917101416.20760-7-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+erojwrcEqBTpKxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 17, 2021 at 06:14:15PM +0800, Kewei Xu wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), the I2C timing calculation has been revised to support
> ac-timing adjustment, however that will break on some I2C components.
> As a result we want to introduce a new setting "default-adjust-timing"
> so those components can choose to use the old (default) timing algorithm.

Why can't the new calculation be updated in a way that it works for all
I2C components?


--+erojwrcEqBTpKxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX/vMACgkQFA3kzBSg
KbbgTxAAsQj8w7VTGVuNghWtRnRUYzsv+yrT8l0xbXYTWaJyoty5NtJoFgR4epKb
xvzwypsMJb/LDJ7MmM//yR6p7myQXh+mTRbP2RxBOmBqJk7WyQc+NioQ8/N857Sb
c/9USo5ie/l8KLHHWfL5cIbhyXEfIDNc9yqCr2Gnzva20D6KDAZAdcN1a8obGo4V
rH1JSpOlvQt5q0idamv96D1bswvLUcwp5VPus7/gI752fBxaUcVEFv03bA+JNgT1
C39M/KGd2CDRzSeOHOPxT71SLir1iBgvj/4ioQN4blln+gzmHSamzAAcxLREBppJ
Y3qfRUY+E/xJSj7uvuh++74LEYNOMH+LN//BuCG13jn1Rb1BZEyyMQkAqpC+ZqIM
ASSMWUPeZYOONV8XZshMybYVKrA411kmQEdg7Qz1CTms9Jl8Zwg9BW6rHR6l2mrf
csDILr6aXdW4QliPdh6NSl7QbXIDoNFyB3tQFA9PDBgITzX3JHF4bmGMh2UmmzAJ
NqkD/8fy6aO9b65KxHGOrXutHwcSv83fE35aklFYtzWtVkKWr2rgIBQ4+2sCp1hM
VvPI3w+6lr1HKNDA3qRhCRt3m/jrpkUB2Fy7lfdLp7uhoroc3ryNgjJTKiVOBZ+S
noQe7ZqE8URbQO0l5Y6cBxOi4jLqFy3cGCVcvALeMvQBolI8pM8=
=4to8
-----END PGP SIGNATURE-----

--+erojwrcEqBTpKxl--
