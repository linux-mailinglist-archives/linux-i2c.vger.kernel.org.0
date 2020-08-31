Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035602576D4
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 11:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgHaJtB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 05:49:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgHaJtB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 05:49:01 -0400
Received: from localhost (p5486cebe.dip0.t-ipconnect.de [84.134.206.190])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B059206EB;
        Mon, 31 Aug 2020 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598867340;
        bh=6rP3IjHXOqtpGPUO9No6eJC9W5LLgqWNQYurF3xuWg0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RjJJ4sykAakhgFcBGhUdj83P81qngPz3S8cvOZbE+gRzTzTnUf02zbHcrdOKMxC2l
         VyyruZ2wHNUfIdwXWJq6N0KBBQLua8C13xaiWMm3mG47ymy3IwsPRO6NpT0+9mnGE+
         dg2ocdiAtp/a10Xt2s58NceFhOdHfyIfZ/NNZmCU=
Date:   Mon, 31 Aug 2020 11:48:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] decode-vaio: Scan more i2c buses
Message-ID: <20200831094855.GA1070@ninjato>
References: <20200831100256.077ce253@endymion>
 <20200831100919.519f66a6@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20200831100919.519f66a6@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -for (my $i = 0, $found=0; $i <= 4 && !$found; $i++)
> +for (my $i = 0, $found=0; $i <= 31 && !$found; $i++)

To get rid of the problem entirely, can't we do something like this
with shell globs? Pseudo code:

	foreach (/sys/bus/i2c/devices/*-0057/eeprom)
		$found += <found device>

	if (!$found)
		foreach (/proc/sys/dev/sensors/eeprom-i2c-*-57)
		check_old_interface
		$found += <found device>



--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Mx4MACgkQFA3kzBSg
KbZ6ABAAj/d2I+B9BX3tZmvZPWTwv3GZOSn5rRTM+pX6wBIkqSrzwZqxBluhcNRQ
Dd6r3NsMO2LFUuOuW1V1r7YIFhNltyFH1adLtUJBTNygrlTo1nSNtBQW7JJxX7YP
r1tpdNY7ChmWBiM99fVkWxhGxkTW6ILwQU/nSjpx30v37e+234YzLyOaMLvggsNi
oJ/NduOled3dzRsS1OFxz4AX2RzeXt4TMMH1920FFal6s3MQZzJZjim6XJyxBDqH
2rtXCiLFAyOFEPGgKOI3cdgnE9B3ChFzAmHOX4pvtLdvTBwUsFuvxFpWySRJcVid
9Sm+bAco/s3SROd1UFG0/r8WxLyFMtN4+JP4LUJoztZtoenpS3/3qg1RChHWgkPb
5HhvDpCwyc403ktRd+nIjYtekuzVZ+iXwsDeTLgg6ugPKFNE9Bp0vu9G9RSpbDnS
+wmsQCkzR7ykZ9uMsmi6ILdTxVG6VuXiIt+qxKSoHBGBl9115WdWL18WM+/C0oFO
yCuH8VpE4IAYqU8Ctcb4JpcBJWit5Jqt6nRbuFIA61Wsj2qH1roAH1veTNvrp5yX
E+GjZgj8mNCF/nue64QY8R7lQbhAKhzTDEkqvrwqOVtxp7MhtN+zPQPnRESIyVAO
0CT7ltk7/WfddZVHgA0slO7qIYgRNKJLkvQHagxXoZM4dbSukK8=
=4Uoc
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
