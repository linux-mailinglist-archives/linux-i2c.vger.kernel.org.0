Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C51F394075
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 11:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbhE1J7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 05:59:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhE1J7U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 05:59:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEB3060724;
        Fri, 28 May 2021 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622195866;
        bh=Fx99DmxEAF7hNDImFdGCB1DPbS8bJ5GgHFpTWTBns+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jEfwMV7mCCwIGNHEdT8IC2GaAxPyoaInDxizBxZbXPQtCE8UU9LJKk0OVeOah4Fyh
         FVPgM41ETyhl22wVd4QqpNxmJkAsYWtU81S1JWDiLvAp74ii+iRz4FgXeb8Jd3NYnV
         QHIW8aU4Cv01aEBlMDh1WGwOeieQAyYE4+WY8eDnNuI1NwndCEMCVS3sP1l8VeqDCi
         12iHuUJY3LIUQYYJRY5M60xs2sVF24E17vYCnxtpGuNcf1QKGrwdUrVdAphXIQpCIU
         SuLnz9mxvFzHcG87cvinP0XzH9ywjEV/hTT0celL+0pAXXpX97D/4wL3YuNm1ykQG+
         3xGyYXh61LDNw==
Date:   Fri, 28 May 2021 11:57:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     Rob Herring <robh@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH] dt-bindings: i2c: brcm,iproc-i2c: convert to the
 json-schema
Message-ID: <YLC+l1kvyyjrYRdK@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>
References: <20210512160750.15183-1-zajec5@gmail.com>
 <1620844516.523024.204087.nullmailer@robh.at.kernel.org>
 <YLC2en7Mj7kurlCd@kunai>
 <80afe993-68f2-01f1-a13e-319a6ec32169@milecki.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kxVno7VibQqANw4G"
Content-Disposition: inline
In-Reply-To: <80afe993-68f2-01f1-a13e-319a6ec32169@milecki.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kxVno7VibQqANw4G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've already got wm8750 YAML binding queued for the 5.14, see linux-next:
> ASoC: wm8750: convert to the json-schema
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=11480dbfe1d59eaa6382864acc476e7621b1da4c

My take is that we can surely accept this binding if there is no build
failure in -next. However, I usually wait for Rob's ack because I don't
know YAML well enough to review patches from other people.


--kxVno7VibQqANw4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwvpMACgkQFA3kzBSg
KbaC6g/+KdvFy3ptz/L3Iyw9j7oV/pPEvZU/Xqjg6807I/ZVg18kATLNF4X6z1l2
xI7tqHSf+hRaQZm7UIZ9xuQzwzA9kRFTgJmBsyC+CTDAwhUOZR9rnJqjKgB5/UYH
Vv0HSD1qPRGI9V/Go53nZ92A8Z93b8Q5TRgwRLfD9qOUanuU6gNiLegT39/GBL0Y
xITxOHqFjU3leHwKpwFjUgvbDNXjeGNdkTvwmVGmUSz970HEu2ngmR225jH3kxL0
lv/HLL4xGGzJcuuzXA3xC56Y3ZU+WwOVkv77kuQKeDxONm2JX9Y6Do0JMAsQBvbj
0RBFigohLNRR14DkWHi5O9U9KYbKNCCRk2knwEtcQpnBEN05au2gptvlosy+Dmzw
am9GkQjUzEKfvNaamlI4644xWCjkMUU8irj1TFOJbdNzMXkcGYgTBdjRYt089u8w
9h3Ot2LGyIdpUUySnGA1SijAdQq3uNSvAJo/LUGyLtB9FZPvezSZCvThJtCAmij6
Hg6zxqdgl+nluXEZrhSljsuFg6DWRFiON9toUPG3TG5kjb8P3GjBbu1jpprFLQGD
j5M2ovoBu0tuZh7RJnM4gEWqACk3L+hU9SXvp4r7ojHOfYdgmvRAsCTRNkSvJl5t
AvLgBR8CgVS0RxaeiWl08FmustVdc3FXtpLPkJIgW8quxlXD+z8=
=OO7S
-----END PGP SIGNATURE-----

--kxVno7VibQqANw4G--
