Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42B4BF1FD9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 21:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfKFU1B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 15:27:01 -0500
Received: from sauhun.de ([88.99.104.3]:58314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727516AbfKFU1B (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 15:27:01 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 8C2D62C053B;
        Wed,  6 Nov 2019 21:26:59 +0100 (CET)
Date:   Wed, 6 Nov 2019 21:26:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Max Staudt <max@enpas.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: icy: no need to populate address for scanned device
Message-ID: <20191106202655.GA1110@ninjato>
References: <20191106150231.26605-1-wsa+renesas@sang-engineering.com>
 <c21c064d-4e81-4d66-4df8-1536e2c65beb@enpas.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <c21c064d-4e81-4d66-4df8-1536e2c65beb@enpas.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Looking at the I2C probe/scan code as well as i2c-icy, I see no reason
> for this to go wrong, so have an ACK from me.

Thanks! Please add a formal ack, so the patchwork tool can pick it up
for me.

> I can test this tomorrow or on Friday if you insist, just not today.
> I've just set up my Amiga again.

Friday is way early enough, so if it is not a problem for you, it would
be nice to have.

Thanks again!


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3DLIsACgkQFA3kzBSg
KbarIw//Zd/QJM1aoXU2jXccuMyJbssnw1yOHVsea6z/06x3Ka/IRaG10YGgdqcw
Ax+KRvPeiI0emLQBwa+LLK3PqqLVYqfqvI1rn6UondVKeNX7iRHwcUT/NYQQ2/0O
TzuyHg4Hu1nRENp5vk9GgTNN43dLItNu+XqtRGTBvrjbh5Qx8LaLzRFf8YiqeOXl
c3voTlJpjZ/u7Uh5Ckqk0gaivKHeDl+/HHTbXBbS/ngz2WlV4DTwIM3GNpufZpLU
TH+gb6D7P0TK++Fg/S766NHlI3o9LTSHRuzmcZ/0D7sogi+8V8I5AvB9zswJMn0j
iCzpro8EoD3xk0YFGoOPeucsXYR72LBvh43EghxBnSoS3Zm1FCLeCRNWaIeDmN2S
i8X1+ALlPvc/4pXzlu/58C+eBpLvuAFr8An/JYnF9Ptfh6d+seHXAmdxtfpDhwng
m3lc1M+owacbubHJ9CmH0EDYFzGk+qkgRBfy+eL37BDsuW8P7QxYS03lyIOk/Cm7
Rwz4eDosPxfz2GW9MyM84OIUPX1cjGEKPHvfaL1MyL1aLb0RLQifIzUCDoDnPfgF
qpogqb518JgoPnyqXSdnazYqmm7WGM3EaDD1teyYZ0TIRsLGbg6ro8VcFW8TBF1y
I9rVqh0/2kRLARvTbQD4GVyyFZwxAiV9ky9BHi+i+b41cObziqY=
=SIIG
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
