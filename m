Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09AAF188878
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 16:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgCQPBs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 11:01:48 -0400
Received: from sauhun.de ([88.99.104.3]:35282 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQPBs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 11:01:48 -0400
Received: from localhost (p54B330FD.dip0.t-ipconnect.de [84.179.48.253])
        by pokefinder.org (Postfix) with ESMTPSA id AA6B82C1E8B;
        Tue, 17 Mar 2020 16:01:45 +0100 (CET)
Date:   Tue, 17 Mar 2020 16:01:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jean Delvare <jdelvare@suse.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: VAIO EEPROM support in at24
Message-ID: <20200317150142.GA1134@ninjato>
References: <20200317151409.7940926c@endymion>
 <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And we could introduce a new macro called AT24_CHIP_DATA_MASKED that
> would automacially set the AT24_FLAG_MASKED_RANGE flag and take
> another argument that would contain the address and size of the masked
> register range (we'd put it into the "masked" resource)?

I am all for generic solutions. One thing to consider here is that we
need a generic way to detect the various types. I guess it will
always(?) be decided on some memory locations having specific values?


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5w5lIACgkQFA3kzBSg
KbYekA/+L7CJLLps1WfhgGjOnA/K+jrFcxXmxRwf7JcXxM/1KTNdrmIKPgyGNv0Q
AjgjVmofhpu436E0cnYTJkQLP82tqbDzlIe5JEUtp+YheXfLsOVqZpi603ZDU6Iv
d8dD3JenhnJkS+1NLLY8zH4wJwYfily3GmbnF6Wnf5DczOuJHeLZBPadF/33t2wJ
6HxdcVWA/UDoqTPk0jKJCo7DNWOCh65mRRyX1Czt//r49jOGiHBbSQJrMeCzOHWI
T79PcDm8lh7+gs34Z+O7oS9rDQPwjsyGvxV8Grp2l6cJKzF5L0YW3zTcv151gw/O
PBn9MsPIvQ8XYzZKLKByCd/3rGl4btR16oqVl1vVaIxeDFas5JzuCl+3NzCFTfBY
IkqBM9M1nGXmkW6plaHPHttgQpbc+kmduIV74/FTDi+kAw6g3IH+jfTC1R8k1BPV
DqU8oiPLAMtRXjiDq/jLo0EZquA7Tck3HdgfkjjAEG7KrgZlf6QqaSETCtD/ZzMb
EP+S0FyvTW3/94/vxdCu0Df3pbMFJYPAHGZTA/XZGh5OlytzIqwYuET4VLFxpR5R
Kmaz7nABZObCeoQom2to6r8MRZwXhraP3eGK1yf8DeirIKHiwAxw5oMGxI2mfKMr
xqUEmjwYBpSxiWScFheTEM1W4qjaFcHuqeK1buPOGtnnu7omMhE=
=N89D
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
