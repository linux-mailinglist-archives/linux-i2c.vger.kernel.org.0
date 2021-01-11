Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E91AA2F2151
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 22:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbhAKVBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 16:01:55 -0500
Received: from sauhun.de ([88.99.104.3]:47562 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbhAKVBy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 16:01:54 -0500
Received: from localhost (p54b331ec.dip0.t-ipconnect.de [84.179.49.236])
        by pokefinder.org (Postfix) with ESMTPSA id A622C2C0270;
        Mon, 11 Jan 2021 22:01:11 +0100 (CET)
Date:   Mon, 11 Jan 2021 22:01:08 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Use void pointers instead of char in I2C transfer
 APIs
Message-ID: <20210111210108.GA17475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.orgi, Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 12:31:29PM -0800, Dmitry Torokhov wrote:
> While we indeed often deal with a stream of bytes when executing a
> transfer, at the higher layers we usually work with more structured
> data, and there is not really a reason to require casts to u8 * form the
> callers. These series change I2C APIs to accept [const] void pointers,
> and also adjust SMBUS implementation to use get/put_unaligned_16() and
> memcpy() for moving data around.

I just started to work on something SMBus, so I rediscovered this series
and will comment now.


--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/8vJAACgkQFA3kzBSg
KbZcTQ/9EP5YX9jTW2VqNS45hjnYxgTyEI3DWFpRLlLMp6Zqt8sz6YzxgcZHZGr+
4gwW3yAxoGIbPLAYo2MOVu03hi4NVkhgTcBmTaUzPFBXFpHy/O8C9PBgp3oLVt3f
EHqWosZXKbuQzYGQP3/U/kxyixsGUA6kJ4rAr2FJZ3V0rrG/g8dqKfq3iuOWv0GW
SgMM3+3XmoNGiLJ430qD/nf6yfw1n6cGlKmaGrS28ej03qYImfNbMkBrsuCW1xRW
ijJ5M6tYf5yjxbgyXBC1+U30isQuTSH+ekSMHqBwr784RS/cMUCyC5F/0Ivjlbuj
rrlwBGF5HB4t/7YhV37fidgVONJuFJHFzzp3yc3Cl3aBYFTrzJw5a9VWadPOAcbW
/Fov4bUSTHLquB+Wsf+QPXtnavC+Nkx1xzHgNs/j1QFSDo+5G5anMRjAtYbNuteh
XHrqnmn/U/+2SJfI+geQ+d/YkQ80ULfY61SJmx123IGCvskh7634+EJhdJXrFZEZ
2nnsER6DHpx2ZDfXN6mNUAqTGSEvlNn3OzVqikrWdcAChbZeRTORT132xjmqkvdD
YHwMob+iwMG6XOk71MtlvOKURV7KjFN9UVzlrpDtKiGt6dM5JiC9DNzFi9XYwGIt
Pnq1BcwbydJ032LWw0NpiOtMbcNGEwjwpm2v+hPhakrfnprbN9A=
=X9Tz
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
