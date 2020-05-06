Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EBF1C7541
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 17:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgEFPp0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 11:45:26 -0400
Received: from sauhun.de ([88.99.104.3]:47192 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729148AbgEFPp0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 11:45:26 -0400
Received: from localhost (p54B3333E.dip0.t-ipconnect.de [84.179.51.62])
        by pokefinder.org (Postfix) with ESMTPSA id C4DB62C0885;
        Wed,  6 May 2020 17:45:23 +0200 (CEST)
Date:   Wed, 6 May 2020 17:45:17 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: mux: pca954x: Refactor pca954x_irq_handler()
Message-ID: <20200506154517.GA5664@ninjato>
References: <20200425115152.29475-1-andriy.shevchenko@linux.intel.com>
 <20200506124242.GH185537@smile.fi.intel.com>
 <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <5f4f3714-e37c-d2ec-51eb-8cc3c9dd57de@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, I think it would be better if I just quit my i2c-mux tree and I
> instead review/ack patches that you then take. Would that be ok with you?

This is totally fine with me. Let's do it like this if it is less
overhead for you.


--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6y24kACgkQFA3kzBSg
KbbBMg/8Ds/ylY/QftbEmtUTLn+0ygPUPVk99/Yx/nH8tJHYwskS3BSteBCPv1I/
8aOL2pQ+jGm++/BJN+zn9X937csCDb52BOyrHjItlyv8AqfCly+qEXQTNjfsoria
XbOv32ZHp3bkdhKnqDjHyOcbFHwCQRPollzJFYmUCbZMSk/EpqrMxywGF6m0YG7U
P25DTdIYlvQ6CNzwtV/wvGGUhoxOMt+oFInFGjlVDG0dYrsZ0EwLKVax7mH9WG7q
j68ZsfjGiTANXmmT/9gNTkZUgQGAGbKX6YTlm5bJ9L2I9GJXr32SYrnRpUAabE53
VKWzRHCSMlJDzXMtJ2MjY6TTrHYtAWzyurH7WVP3QjqN2WEYfRLlEkUQ7E48ccue
9GjaOHvSE9kqhkEFXhzZ6Yx5dYqLLFw3Jal7bN70azXm/mAVL/xr9E34EvgVa7bp
DCcXwCz0kFD8PyXca9lrzMG75ra63x642bkvwyrzLvVSRXWvta/31tFT1WAjVVCR
dVKUJnazYVLhI2/z5tBrIQw7y9zt910GP56tkYOWGJxBwJeyZpmzGlf2TIZ1swdp
8XvdvjXdtJFdDXLEP0q5XDBINYfiVHXP9L6QLzfH/02XL5d4Mb4V9u8L3apAuO0r
1Hxbj2QpkR/xHg9/QUfd/jazShoFUJdS7QWaWM0+6FmyXw7RedY=
=ehVd
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
