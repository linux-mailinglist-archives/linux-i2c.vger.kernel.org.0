Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68085271F19
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgIUJmt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:42:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:60522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726413AbgIUJmp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:42:45 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48BBA2193E;
        Mon, 21 Sep 2020 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600681365;
        bh=bSPpM6v2oN0kCS5RhMq8MpHzKLfiO04u52Zf2F2Y+JY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IJHKbO1LM2l9G5UC5q1wKV5LXHp2nOI28VOazyCsX6gQfn2RgPNfOpIFV15NBOMdy
         YklM+e4Bqd2BbgFBhDgccimNNE83V/PDnsmk7s6E2Rb3fyrF883DhMiZnQJxT/wBdG
         YVp+YXRat8Z7al/il/rVzmFo3WSmz/ShWmCtxg4c=
Date:   Mon, 21 Sep 2020 11:42:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] i2c: jz4780: Remove of_match_ptr()
Message-ID: <20200921094241.GK1840@ninjato>
References: <20200904131152.17390-1-paul@crapouillou.net>
 <20200904131152.17390-3-paul@crapouillou.net>
 <20200914221230.GA349829@bogus>
 <CS2PGQ.I4UMQBYTB15I2@crapouillou.net>
 <CAL_JsqLUSZFf_3zgFrapc7vJETG9+XDTZPtD_yEBvi4GO3xPSA@mail.gmail.com>
 <EGJPGQ.QVHGTYQDQR872@crapouillou.net>
 <CAL_Jsq+O7YD+WuABOMvWT-uyuDvt6L9wQmeFunR-z4RpXLFo2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VJJoKLVEFXdmHQwR"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+O7YD+WuABOMvWT-uyuDvt6L9wQmeFunR-z4RpXLFo2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VJJoKLVEFXdmHQwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Indeed, because jz4780_i2c_of_matches isn't within a CONFIG_OF ifdef
> as is sometimes done and is when you need of_match_ptr(). IMO, the
> commit msg should have something like "The driver is only used with
> CONFIG_OF enabled, so of_match_ptr() is not necessary.
> jz4780_i2c_of_matches is always defined."

I think the commit message says that good enough.


--VJJoKLVEFXdmHQwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9odZEACgkQFA3kzBSg
KbY3nA/+I7oBIIp7rxs13IUmzsF9rFSmIEr2J6LSEr5m0yaCyHAzeVUifeQk2xmQ
NOuORcACFMQOdikgL0IVYZSPKFdyirDOF5y+dm0BZq7IwwTp1d7Ig8fGuGiseQR3
tle02JPxk7+toyN//CKJ/QIR8AWbRVEeOQKSgu3BqpUnJW2vno5Kfukzr/f2kxXa
QqICZDsMjjTZdG1vwMj8OiqQLfonxpMKUKt46Q61ShwyrhrnnIEF77d2PBnXvr9r
sV6HVhzHK2NBa/z2vgyZrQFYagoCrVV+xvjfKEXggOPm5e0Hg+MYo5srIWRq+OcL
tgiLcq03ikq7+c33NMNbmXQzG7TECvIwNjMECmTKElK0OyfCq+60Ds7c1fPOJZMr
yhVnDVXbJDx0khAHK76bBQaxpVx4vvsHkYkwFQL5rr+NRDvHfGmOv2HCkcE8uW+v
c7BpbpYBM7KYlk1bPH07U8ORbvehMRst/gOwvtLtv0k7SRRPNasyft+Ec7hpwxya
RdKDbB3V+Iu8Ro7c18mUiJ5N0Pr49TVWSA42tTqUhRK63RasC/d9IOsB6sUyIc+C
4FUP0rQHoCPyF0UXTd56y7+Kdrth4oM+8ZF9W0NEqIVSFEGEGRBwd6hNGZfPiIKD
AoiOkdJu4oOlAeV2PfNMSia3AulKmhy7S1/0eeM+8Xe7M1qvdcY=
=8xKt
-----END PGP SIGNATURE-----

--VJJoKLVEFXdmHQwR--
