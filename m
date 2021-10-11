Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4A2428936
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 10:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235241AbhJKI4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 04:56:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:58322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235163AbhJKI4t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 04:56:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A0A860C4D;
        Mon, 11 Oct 2021 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633942489;
        bh=bj2txf9AE4jjelz1ZJ8/dxmmJOUi0mHFy5SCoK6LbZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K7Zcgkcevx5U9RHY7xDKV8LyI2JNE6kZjPu3fS08b8EU1T2Ddc2h1G93KPI98+fUa
         SGIRQtAPyjja/+rSmTvQcIaNcbaiBl+zDIsiZWzg6U6Kkca2Ks2nw8MSc7q1ei3/J5
         FdBmvPrOtHqngVYHZFcCNFahjVPa7TN0IjzndCXghU2My5EPkX1WPyMJs7JuoLpwZ0
         7v5cIQdJSUhnlIwmHrBVBU9EcHrx57kNI3gQT/EKKdKcy1SIU4VmqCIj835pfXA2YT
         dTqt4/J1UGIcIFazr+LpsuMQW7c5skrjaQC/UG9evrzw8GnoyYiTc7QApj8tIeD77/
         axFUWVA+Oimng==
Date:   Mon, 11 Oct 2021 10:54:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Christian Zigotzky <chzigotzky@xenosoft.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "R.T.Dickinson" <rtd@a-eon.com>,
        Matthew Leaman <matthew@a-eon.biz>,
        Darren Stevens <darren@stevens-zone.net>
Subject: Re: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Message-ID: <YWP71c8cXlE3PcIo@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>,
        Darren Stevens <darren@stevens-zone.net>
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <YWFqr4uQGlNgnT1z@ninjato>
 <8a8afc73-3756-a305-ce5f-70b4bce6999f@xenosoft.de>
 <11d8f784-c90a-4e6c-9abd-564cb5241cb7@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HXVZJbBqVEpobDP8"
Content-Disposition: inline
In-Reply-To: <11d8f784-c90a-4e6c-9abd-564cb5241cb7@www.fastmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HXVZJbBqVEpobDP8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> MAINTAINERS. It'll probably apply cleanly to 5.15-rc5 but if that happens again

It doesn't because Linus' git doesn't have:

Documentation/devicetree/bindings/pci/apple,pcie.yaml

Because MAINTAINER dependencies can be a bit nasty, I suggest I drop the
MAINTAINER additions for now and we add them later. Then, you can add
the pasemi-core as well. D'accord?


--HXVZJbBqVEpobDP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFj+9EACgkQFA3kzBSg
Kbat0w//fw5VdmsRtV8ijZlTatoIS3foufsa+aQgccAyrnGA1gT1pQBIWtqFpZdk
VKts/zB8J1JhUQvEL2CC1wxKhuuppahrsbQ3TqpraCWVom3EW7NduuwpZQIRTi3W
JW8XHZGx8dfLgKb2NMMnPq8NlOMhDIpS7yvqTw+nlOyAePjZGuS6eR+LBARHsmZm
IXwm/btIsWJlJGSETYdfDlwv7vqYPhx1tjKx+hvvbTjyNlpfntTrnUC8L6ZpY8Yi
sfAjVIdaSa22sTbcpD/HdhBB2YAoVdW6IRwfYOBA9oxt5j4BQ4PEow+5evUzFcpz
v3HyxBsateLXIUb92T9T7u8i9+45Ewow3XHJ3+7+tpVC8nh+/LoTt7dOKR746r+e
Q2EkG5O3gqtstFONNEmZ+431Jdk8om4ZpmcivcNFGJMlddAWE612AFOA38SVKPWq
Syirz+FfLYbOFSNcHGUqPKO/9kcbzsKI6b+sQq4OaLtjImeEBjMBJ0qzDrh6188u
Etk/KKrtlI3aJXIrSnYpwXPfvJQsir0J0caB8CRp05U49xOkI91ktlMHz6R26fh+
hGjwCStbslmzitohw7brY2M1huPu6n8DcWt5SwqyJywaMk7DTuWSMhEs4QTdcuCS
im2loqk9hIpMmK49c0RbVz+WS2hGRUTA/Ab0enOebV30+Xkp3m4=
=vgd9
-----END PGP SIGNATURE-----

--HXVZJbBqVEpobDP8--
