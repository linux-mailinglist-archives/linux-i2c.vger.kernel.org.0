Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065D46BD05
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jul 2019 15:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfGQN30 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jul 2019 09:29:26 -0400
Received: from sauhun.de ([88.99.104.3]:52118 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfGQN30 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Jul 2019 09:29:26 -0400
Received: from localhost (p54B3309B.dip0.t-ipconnect.de [84.179.48.155])
        by pokefinder.org (Postfix) with ESMTPSA id BAEC23E4757;
        Wed, 17 Jul 2019 15:29:23 +0200 (CEST)
Date:   Wed, 17 Jul 2019 15:29:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add MediaTek i2c AC timing binding
Message-ID: <20190717132923.GC1458@kunai>
References: <1560240715-22595-1-git-send-email-qii.wang@mediatek.com>
 <1560240715-22595-2-git-send-email-qii.wang@mediatek.com>
 <20190626133941.GL801@ninjato>
 <1563368121.16970.7.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline
In-Reply-To: <1563368121.16970.7.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Can't you use those to derive your values from that? Which ones are you=
 missing
> > if not?
>=20
> I have take a little time to develop a new patch which based on your
> suggestions, and it tested OK. Thanks for your suggestions, I will
> update the patch after I test it fully.

Great news, thanks!


--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0vIrMACgkQFA3kzBSg
KbZc3A/+MaKqaXoxfLhF7cf/4W3pivQuZ1XwN1uUj0ywybWz2dxrakkTsTS5kCSF
D2GRUcGvTLGKod/BaV/wIfdFVeyYPGoh38C2LSEcc2zTWl3CO+CyiJ35rAUvVhKe
DoxAxfkR4LSUpzTJUi26asAWZggVjEBZkWQQxhyJma8txPhAtuOg2Dp9J6w8oZtO
Ufj5c1FbF8r3q82ah5dmHqs924Q6WHUhBQXQf3eGNRJgqY/np4XHB5TZkOVj1uCW
qQhUIx4xBooJa1cSXGr7kA6nSay+zIX++F5R9hbxkGSCFcGZXei0owslreNQsyDf
rHMEc9JoZ5wXIMVjzPoxRwWrxDVIGdqfkqrmSDBjmYq4CDOAWvBZUIjgsy1E9d9R
YPX5zj3Fvinui4/dxqADBLuAoinkw3NAYg14KCAzIzXbOLwetnGXxoIaiLE2v8PT
qaTbtnIIhG9n/gaSQIQ3lDwTsa6dxv7FS3++6h+RFhAQ8XsaNKvYTgvmVrV4jKvs
Rr3Kg+m/MdEiWHceoa6tPM96kiWlQAQLq1yN1B06DMoFBkr4S7pjOe6LCYFG7AfP
Cu8nEykpDz6DT6KVwjefQpH14gTGH4TSjvpuXQLfjKB5k5sfi+NIif3+v3tJUBoE
8KH9/iRcWMwVKm36gyugDLIa4xfsb5fj0v2Lk1ZL4dvw75Z2JiU=
=K/nF
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--
