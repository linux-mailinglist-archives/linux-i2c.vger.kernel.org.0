Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFAF4A031F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245161AbiA1Vqn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:46:43 -0500
Received: from sauhun.de ([88.99.104.3]:33224 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232469AbiA1Vql (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 16:46:41 -0500
Received: from localhost (dslb-188-106-017-011.188.106.pools.vodafone-ip.de [188.106.17.11])
        by pokefinder.org (Postfix) with ESMTPSA id 02A3D2C018B;
        Fri, 28 Jan 2022 22:46:39 +0100 (CET)
Date:   Fri, 28 Jan 2022 22:46:39 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
        housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
        ryan-jh.yu@mediatek.com
Subject: Re: [v2 1/2] dt-bindings: i2c: update bindings for MT8186 SoC
Message-ID: <YfRkP7Wf7lzarVrf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        qii.wang@mediatek.com, liguo.zhang@mediatek.com,
        caiyu.chen@mediatek.com, housong.zhang@mediatek.com,
        yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com
References: <20220125110413.18988-1-kewei.xu@mediatek.com>
 <20220125110413.18988-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bRbgB+/I78l0U94u"
Content-Disposition: inline
In-Reply-To: <20220125110413.18988-2-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bRbgB+/I78l0U94u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 07:04:12PM +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8186 soc.
>=20
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Applied to for-next, thanks! But you forgot to add the ack from Rob
which he gave when you sent v1.


--bRbgB+/I78l0U94u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0ZD8ACgkQFA3kzBSg
KbY1YBAAtltEu6XU36xxoNs4hqAVteJnSR1z0QXyM7W1u+/+rv/por6ymVrzQ78i
qUm/aJfjnu2ecCgWOkm0/YaMXjJHXzqQzhw4OIm8YYAv7r1YfGTua+drP2ROExdu
jz+xBR1y2jNGE05CGFMAY5+rtS+x+SQVm2jcJEWcQgacpEfskyee388vdkW1F14H
9Udsls5I3E0j3+tiV0OiafKnVJcFGgVoNq3DoI/dDPdolec4OhthkrpO+m9IULU2
LDpJFvIZpyVjnAIxYcfWWGWXF5wf84crE5NTk5lWh7y+xbFLkmiLA6LJEea5ZKIi
aYQznyUzv8lMspe0mQTnU2+fCbY3pbqRBqDBPI46ZfsNmaw6OUsBrhnpFnVW0xvB
PsuLxokbNCFkhnfvspJtFUmm48GIynp/Nzriew5nnYOulB7z0ZEk9bLDXyj1Y7sF
+peii3fxxJVqSuljWX+GhhlSTpj2QMOip2JUVIN634UJzPn4prvbZGmHZyYEL/+Q
i/j0HweKMVUSAyjQKYMy3YZdqkFGiR2+IQPIf1xkT0FEpWmhw26KfkMTK6AUeCbc
bwdvtzWetjIhz8LYqSdtHb3QQrZwb4L387SQ7zEGRKFNbqoythx3jdrWXEA9McRU
t9N6HZTiFgm9oR49a6v3rg9PaL0Q5iZMUea/LuL2XBUODt0Fc5A=
=AbhB
-----END PGP SIGNATURE-----

--bRbgB+/I78l0U94u--
