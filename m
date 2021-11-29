Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1E346157C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 13:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbhK2My0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 07:54:26 -0500
Received: from sauhun.de ([88.99.104.3]:41764 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235038AbhK2Mw0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Nov 2021 07:52:26 -0500
Received: from localhost (p54b33788.dip0.t-ipconnect.de [84.179.55.136])
        by pokefinder.org (Postfix) with ESMTPSA id 177802C00AC;
        Mon, 29 Nov 2021 13:49:06 +0100 (CET)
Date:   Mon, 29 Nov 2021 13:49:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
        yuhan.wei@mediatek.com
Subject: Re: [PATCH v7 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
Message-ID: <YaTMQQhENmJAIUk4@kunai>
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
 <YWQYbaTIhud2QHNP@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jENikAxoMoLFIwSJ"
Content-Disposition: inline
In-Reply-To: <YWQYbaTIhud2QHNP@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jENikAxoMoLFIwSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > stretching. But if the slave device stretch the SCL line for too long
> > time, our design still cannot make tSU,STA/tHD,STA/tSU,STO meet spec.
>=20
> Isn't the new algorithm broken if it cannot support clock stretching?
> What was the problem of the old algorithm not meeting the spec?
>=20
> > However in the old (default) timing algorithm before the commit
> > be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support"),
> > tSU,STA/tHD,STA/tSU,STO can meet spec. So we want to define a new
> > setting "default-adjust-timing" for using the old (default) timing
> > algorithm."
>=20
> What I still do not get: the old algorithm was able to handle clock
> stretching. Why can't you update the new one to handle clock stretching
> as well. I might be missing something, but what is it?

I am still interested. Especially in the last question. Is the last
question clear to you? I can explain some more otherwise.


--jENikAxoMoLFIwSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkzD0ACgkQFA3kzBSg
KbZJ4w/+KijOL+ZUEZ6LpgcHKAXFLv5FFa7WMHqAT6VluNHAVbrHkqyv1Ezlk8fh
fNYgiB80C3VNLIyuBDiarW4yqIgw3v9HVOSqdpkTnF9uo4QFEmh6k1cmMcsjoVb2
biNx5LnauS95Prup1NPApFsCX4X/pSyN28AZF9VwCZTkHOGHcXzqZs9sEX3+ztyd
PnhQZvsn89nBBdwTNY+SqmsIWapYVBeQ+Cii1y88ZTfWCH6PJMBIineUCmRDAYZc
8uLMnxh1y+RjLIda3KrtfScv/YhpsaXZ6LZjgNBIO5OTsGTrLodgoTLa+AKuZuyw
fAg55T+gQEtPYW3bFB+Ereu6sA4Nk99QL9588VSowT/A2aiHWCJN0eyNhSBVgFDO
bgzRgZIaB/bXAC+WdEtNBoH78j4gX+REtgWESTRA1MZdAxFZ7j1m3N19s9TTin78
CD1ESqS6WkUVUnvrT49uJJtPqE859IPd64N9egpYBASbMniJMImHVdkbpeZVXD4O
ffYV40aL/frsHqTZGPmoqrVfgUa90OnMExdwfeR1Ei45ptUhxHWiSlw2rUj5/QmA
fIyXoOBWLaKSfRZDRvQK6mnCWfEipYIZPd3GB1bXGl8OgO09xfELzgVjM4+EQgZy
qEnZyfpSHw0CeqEOupM7gstslBxmMaw8Ryx88BMfbDQmPcnpQOY=
=PbfA
-----END PGP SIGNATURE-----

--jENikAxoMoLFIwSJ--
