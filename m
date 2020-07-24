Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7085622CE8F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 21:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgGXTRF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 15:17:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:48552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgGXTRF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 15:17:05 -0400
Received: from localhost (p54b3305c.dip0.t-ipconnect.de [84.179.48.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F8A7206F0;
        Fri, 24 Jul 2020 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595618224;
        bh=1Jq8jNeuEsHc+9ZAVYpD7ZWZg9rx9073ZC4wxzAB224=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UeOx/uowcd9aNoRjyHJQMB9q9YsrBnUBIEVkjOifuQpzolBXY0eKwDzWDuSb3XSc2
         qEbc8ShfHWjbic9ICW80v38dIpl2qLsZZrlay7lJX3hse3Ug6bDK0GaSEq5L6pbXAX
         hqAAJJmiL1E3YzlJWfc84AAkhEI4aoEjpa+dj4r0=
Date:   Fri, 24 Jul 2020 21:16:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v4 00/14] Support for Tegra video capture from
 external sensor
Message-ID: <20200724191654.GA1227@ninjato>
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <cb080da3-5ae5-bb83-8f5c-65d1fe17cb67@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <cb080da3-5ae5-bb83-8f5c-65d1fe17cb67@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I can also take the i2c-tegra patches if preferred, but there too I need Acks.
> Dmitry, can you either take these i2c patches, or reply with Acks if you want
> me to take it?

There are some more patches for i2c-tegra pending, so I'd rather pick
them into my I2C tree once the Tegra maintainers acked them. I can
provide a immutable branch, though, if there is interest.


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8bM6IACgkQFA3kzBSg
KbYTCxAAotZrtFWCm4x17AWbkHShGvcc2z5M10agF+meIHjiSj9loeN4X928M+Hi
bjAdLaRtKsDtpOQMvx+LUrooR8yO1+IP609BYETjzocL+jStyg4kfspuo+FSeRb2
4MGI9FYsNLnbMz4ZEvyXvNRIK9MuM+tpRjVn0IQD+AEYOVaX86Yg37tU3pCJH+xH
PhodfARWlVc3nQ6W/xd0/wotbDT2ZxoAB4Oaz0XVdnHbWb92imEt14IVLEtYPpz8
dDc/K8AfqhgGHl2G74Qyg38AeDiomiRrSAEYUMurmq4sMXyQzmEBP5TPVrA5ApUL
e9RLLRslny8bBru71qafKiWeZm8ZG2C594rtrxbmdkSwXROIekweIM/sm1/B1A30
AxeNIaNr0JRa6f6gOAaBwOrl8p6vmfd+LzMWj/unZuF8nvucW5xoRJw6thlyy7K9
ZfsMm3KNUXK4L2AsqgPnCMC8HDgL38i9ZguRmsmJQkhblwTTK1GQCrgP1czu2pBX
L2P34eKIFzuPqGmnNO6KlEu+SbUwx3ihHwZxrcC8zD9WuaNT09PGWMxLYCzA7t7J
UKcB6Prr0gToQ7aS0J8q66inAqRlQOHLzHx4uY3iJI3y17Wx39pHLIlXfbyKNp09
42tnbRlT/ZoRdxXVfJjHhBCopnX2VnFsYJmdWvHJohTXtcZCdqs=
=ykZo
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
