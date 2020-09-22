Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153D72746AA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 18:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVQ3m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 12:29:42 -0400
Received: from sauhun.de ([88.99.104.3]:40002 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbgIVQ3m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 12:29:42 -0400
Received: from localhost (p54b332c9.dip0.t-ipconnect.de [84.179.50.201])
        by pokefinder.org (Postfix) with ESMTPSA id 78A3C2C0537;
        Tue, 22 Sep 2020 18:29:39 +0200 (CEST)
Date:   Tue, 22 Sep 2020 18:29:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3] i2c: sh_mobile: implement atomic transfers
Message-ID: <20200922162935.GA1029@ninjato>
References: <20200922154943.29574-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20200922154943.29574-1-uli+renesas@fpond.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This is a rebased version of v2 with a minor issue fixed. It does not
> resolve the runtime PM issue that may arise (see "watchdog: da9063: wake up
> parent ahead of reboot", https://patchwork.kernel.org/patch/11749121/ ), but
> in practice it works, and our understanding so far is that this will have to
> be resolved outside this driver and should IMO not block this patch.

I totally agree. Other opinions?


--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9qJmsACgkQFA3kzBSg
KbZFbw/+J0hTaP1PrHO0xkaahTj0XK6bscNWaWZqV0m7eT89NOBF4y+DhXhnuJTn
VnIxo91rUIL020ISOIK6whABIvpWD7gc9v34k9tWllGifVXgxSqc3k8+JNPKgWyD
DwVe2bsPRPy2LgPxoEJ9LsIcOKRxi2lF3eybxe83DFE7qWiofzkY5LxKFyz25rH3
ZVfnHW/Qp1EdOK/pL0rimSAZ9NZ01Bcoib8Gghei3U74FIK8VUd00R+EpbIanNya
vLBCysuhVe+pZUZl5wZkrhll1ylKKUge0g+dld54DplDkxC0A33QyoiyjSb3ISLT
Vgo2vZ0sn+cLCpXCkzaG4dkt0OIi70gR5sqeLivOXf+Sps19CsA1Mhp2TMQD1kK8
9bOtABD/x91Se4pQrzv7PXx78GzkiLRPGRUMxTvAHB1uOyG+v7VUfQUWPTmrgApg
bLPqoyeSXhy0hV1NPAJwEn816rW9Huxy/eas0DY7Pazy9N2O4yINTPIW4OavgKWx
wHynaQX5TcCEXpu+LurMfQKyqzaWpBhjroylOiuEQ4bpmbojFsCLZX3ItEaOpXzr
e5mhlrtJlVudwX3kdCfygGkvafDYS0Jsbt5UJ/mUMeXE958jGj7nRcETfY98u9f3
Zy+XWtfUkc6Fy946ks77pyyPRIhCcV370dIM/JeJAypu8Cq3G/Y=
=dSX8
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
