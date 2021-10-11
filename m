Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60F0428B96
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 12:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbhJKK6y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 06:58:54 -0400
Received: from sauhun.de ([88.99.104.3]:53570 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236190AbhJKK6t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 06:58:49 -0400
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
        by pokefinder.org (Postfix) with ESMTPSA id 45CB42C00A6;
        Mon, 11 Oct 2021 12:56:46 +0200 (CEST)
Date:   Mon, 11 Oct 2021 12:56:45 +0200
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
Message-ID: <YWQYbaTIhud2QHNP@kunai>
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
 <YVf+83LdUEPjoLdI@kunai>
 <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VEgwt+bxKre9p0ta"
Content-Disposition: inline
In-Reply-To: <1891acec7f5c417f62081a8b10249b265df7ea62.camel@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VEgwt+bxKre9p0ta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> stretching. But if the slave device stretch the SCL line for too long
> time, our design still cannot make tSU,STA/tHD,STA/tSU,STO meet spec.

Isn't the new algorithm broken if it cannot support clock stretching?
What was the problem of the old algorithm not meeting the spec?

> However in the old (default) timing algorithm before the commit
> be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
> tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
> setting "default-adjust-timing" for using the old (default) timing
> algorithm."

What I still do not get: the old algorithm was able to handle clock
stretching. Why can't you update the new one to handle clock stretching
as well. I might be missing something, but what is it?

Happy hacking,

   Wolfram


--VEgwt+bxKre9p0ta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkGG0ACgkQFA3kzBSg
KbZD3g//RihGqp/HqgzrerO26mwuF/kpOwfbJAoegQU0RTv+6k2GV/0x7lvxfxmj
hTRoxrNH+wQYSQLiAwwqPwJ+nXTzoob2WVFXd0+KPeVXm7C84+PIWEg5xth9kpfX
Kd+ReQezeCfSEthKN43pE0roJmobGBVK43PX2kxRjluZqN4NbmnaaWoV3xY6YJs0
RWM5gOESUyfAUr1s23uPXPI/+VwA27jpEXhabP5CxciQpJizJ4Agdtx9dkOZuCMF
TsgXrFj3ZD6EETIQXoNkTkjZyiSVVC5XyAdKVsGxHA966Vi+s9MCbqPZj9Hq1STO
v03VnlbCyQzL2cy/09XYDS8Mu0Xph1MQg8nbQEsD8SgsrR6BM7Lv6gRbXd//TaSH
xMz/+kU6B90pBnc+H+wjpwwjMxGTTcwLzRqYB0HsSJ7/kO3vHrXIVe9KyUrRmyHm
fHwKAkO0SNKjWyrLdhixR9pmgYTKpVKt4zwmEZiqTvbb923yZ9fU1qpnts7rtXZi
P8g5CaqtG2piS/5VLfRjinMbPH6Tl4KPT4OBMZAuoZ10EL16XjdODrrG6jA1oA5h
QzWdk8sbQiidCpZG/WGTz9yMQUlZeJZOefsfNyQwOJ5E0kxff+tWFLmF32fusrhm
Yoyg00b+KULq1E8zb7X9PCn0o0K8bwE3bhrlGdsHcpCR76p2r6E=
=1ToD
-----END PGP SIGNATURE-----

--VEgwt+bxKre9p0ta--
