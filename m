Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C5DA53E9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730644AbfIBKWy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:22:54 -0400
Received: from sauhun.de ([88.99.104.3]:37008 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729489AbfIBKWy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 06:22:54 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id 3328A2C0165;
        Mon,  2 Sep 2019 12:22:52 +0200 (CEST)
Date:   Mon, 2 Sep 2019 12:22:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190902102251.GB1024@kunai>
References: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
 <20190831132256.GG1032@ninjato>
 <6b5554ce-1d43-5f03-d030-adc234ffc56d@axis.com>
 <20190902095649.GA1024@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <20190902095649.GA1024@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> various files has been tested and works fine. One new thing which could
> happen now is that for a 16 bit address pointer, only 8 bit get sent
> before a repeated start switches to reading data. This can be easily
> simulated with the 'i2ctransfer' tool from i2c-utils.  TBH, I have no
> idea how real EEPROMs react to this situation. Our driver currently uses
> the pointer with only 8 bits fed and the upper 8 bits being 0. This
> could be valid. Do you have a real EEPROM to check against?

Thinking more about it, I wouldn't bet all EERPOMs out there handle this
case the same way. So likely, our current handling might be good enough.


--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1s7XsACgkQFA3kzBSg
Kbaazw//UW3lF6n3LN2OX4EP1tQB1eniUeKUTA+ph2UCMqc54G8FAhQAEqWOFXQp
a5eP516fIsLmEd6Frmihjz7PvytMQzlx62vCXHKTkOG28kNI6PVj67qPGTY0i06c
6ylNam/b4ogMgzhDGyl39UCJFN+rSUmnGTNxZ6CbepBmpknpvpCm6yF5ZCWjMxWw
2DRi8ZHSqpP2MfY53BrAqmq3Pt9OE8lXcABl5EBSyb39AXfKUYX/vVFYIB05h4W/
ECT7BR8EHD+ff5ETkKokejEfEexKn9HTjxjowthF1Uh/tZ8lLtUkC4syc5z81glo
fSm67t03YguEzSnjx8Sa3tc5heqXK20wT1egJGZbfGwwibs1o2jt5OS0Mdusb0VR
fAiHuOGfGbRJrSuIMtbFvY5jcMJ5FZwUTNlS93KvilgQXAZkYwvfhJIhPLTMQxy8
5h9TK7+/xza6+CnSPmGMy178iNGaT1Vw149i2eWsMKxk0x1AUToweKRbYHOPo3WQ
lbA/DISoIa350HJDs+C3uPMiQnSGxRTuA93kAKJSLHfuUKB/cTerbB5bLnY6YKAj
5b8xdp+ZJtrfme5z6upoboj6osWtLczBNoyQNmmJ5fGspNG8kxpmGm0so/FNUVzt
NZ0tUsu47Yzxv4o6lWkbtbPbaadD06C90rMb5kt+sH5HfbLJOfo=
=VE1j
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
