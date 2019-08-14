Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982A28D44D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 15:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfHNNNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 09:13:38 -0400
Received: from sauhun.de ([88.99.104.3]:48888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727819AbfHNNNh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 09:13:37 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 3D5452C311C;
        Wed, 14 Aug 2019 15:13:36 +0200 (CEST)
Date:   Wed, 14 Aug 2019 15:13:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2] i2c: axxia: support slave mode
Message-ID: <20190814131335.GF9716@ninjato>
References: <20190809091709.GA24838@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ExXT7PjY8AI4Hyfa"
Content-Disposition: inline
In-Reply-To: <20190809091709.GA24838@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ExXT7PjY8AI4Hyfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> - Reduced the number of dev_dbg messages.

Yes, that looks good. Just some curly braces left over...

> +		if (fifo_status & SLV_FIFO_STRC) {
> +			i2c_slave_event(idev->slave,
> +					I2C_SLAVE_WRITE_REQUESTED, &val);
> +		}

...

> +	if (fifo_status & SLV_FIFO_RSC) {
> +		readl(idev->base + SLV_DATA); /* dummy read */
> +	}

..

> +	if (status & SLV_STATUS_SRC1) {
> +		i2c_slave_event(idev->slave, I2C_SLAVE_STOP, &val);
> +	}

If you add '--strict' to checkpatch, it warns about two of them.

Kind regards,

   Wolfram


--ExXT7PjY8AI4Hyfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UCPwACgkQFA3kzBSg
KbaoMA//dE7z+rJCoGb69AGRmxmByWbLQyAaC2V5mZOKoXyQHZSQQYqMrhlTX1IN
k5j2vXU4VQaAGVeSCRynDEdGzJgj9U8BsIF8pKJW5YdkAv/7rHmud03UaUGMM8bj
zP5CzOksv9i/jY1pSBgbT8t23G/nCZkBsK5MyxSnWNQMqYlaO0N77esrqncOyrHM
qOwv4pa1PjvHuCuh3CMfUie5ylPzMo5BMw0og7S0WIBnmgcIa2GVVDOtmg2yMnBF
hFUgdZ2LzgGhJNBOxUeM6J7nYkxCVhsdiPZpDxo8oU8iinTyoyZT7fsBfHdkfeWz
LvjUciYGnmeiuPTrVSC3My0no7humDW7LwECBzUXKxLE7geY/9yv/bX1LApa9nR9
I8xIIThMVVGwhqNqN391HCJ96MAIb1VkgAQzoxRfshkd/z5hD4DwN+7hhUFLn0Fu
go8NP1kPwf7kMKfvSDR3yuXKI11z+sybpzLcluJ6gCZBJ7YDMgCIjdOuxA+naH4a
SFCXBoKcFQV7jlOU3EqKP9f5LBVO+dkGJ5365uxVEucjQ/H4maraizBB47C3G8us
tn2SDULqPH82OQbrrcJnudFaaCItRJkJwbYGOze3jAVJnowB6VK/fgwsiMf803tq
I/HZVAjMPIt/fAt1M/rgulL9JH2xJLeWVMAURF49B6olopxM3SY=
=S//p
-----END PGP SIGNATURE-----

--ExXT7PjY8AI4Hyfa--
