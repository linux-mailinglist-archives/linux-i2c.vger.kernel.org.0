Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF91C210CFA
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 16:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731209AbgGAOAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 10:00:36 -0400
Received: from www.zeus03.de ([194.117.254.33]:56106 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731204AbgGAOAf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 10:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=YgUmNPrMkp9agn4QuBukguP9galc
        nSgnWwatqhUkJMw=; b=wHZgWrH6Bs0tIVlqnwrkgimn/6eStKxBS1E4RfTjx379
        BPcKdf+kxSJkKYHJZKNfwPBuYwy2ft2fFza3EB5ecEN9vHZvCTPSNTTXF6dNLLdT
        TEGt70pU1l0lO7VQW9qXIYwC+SJr5NBYtYJ+lJf+wIuXg6jzfwJWfWkYQgYj87Y=
Received: (qmail 570929 invoked from network); 1 Jul 2020 16:00:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 16:00:33 +0200
X-UD-Smtp-Session: l3s3148p1@c1Yxt2GpoN4gAwDPXwRGALjtBlSZf+V/
Date:   Wed, 1 Jul 2020 16:00:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Message-ID: <20200701140033.GK2261@ninjato>
References: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
 <20200701092731.GD2261@ninjato>
 <20200701121633.GI2261@ninjato>
 <20200701123207.GC3457@gnbcxd0016.gnb.st.com>
 <20200701132145.GJ2261@ninjato>
 <20200701134619.GD3457@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Content-Disposition: inline
In-Reply-To: <20200701134619.GD3457@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Well yes and no (for my case). I am NOT relying on GPIO for the SMBus Alert,
> this is handled by the I2C controller itself via a dedicated input into the
> controller. However, the pin itself can still be shared with other IPs,

I see.

> depending on how the DT is configured. Just usual pinmux stuff. So I was
> just mentioning that the pinctrl should also be correct to properly configure
> the pinmuxing for that SMBus Alert input signal as well.

Well, yes, the DT needs to be correct :) Same for pinmuxing SCL and SDA,
right?

> Sorry, this is just making the story more confusing for something which in
> fact wasn't important in the first place probably. There is no real issue
> here.

No worries. It is better than to miss something.


--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78lv0ACgkQFA3kzBSg
KbbJkhAAiMVINtDlJgJxI1LbvPVcivOFVB9QX5+OY4hC9HK7ddOt/xoCjnRoqCEm
XCnGgLhoCxK/xsWxjmAYmZXvh85y3+j+WmcAVe6wNkqTLn67AegDHC8BqWijF4ud
kg8vda3+TZo0GK1ESliysNmptZKyH93vcA/YxS2WKqZtJRGexAgdoPaTai8LW1MS
kHDx/ZXQQ1qcu9Ft3rQLSG9smD6t6IlQEDTuI1FkDybOx0LL/hTIuyP0OrlYHXRL
5JuOU2e5TJqJXnzwd8hyCqFI+zQPis4b+tlGlCbr9QScUcYC4eetZGnHZcaS+Hir
VpClo08XqxmIm26Qf/e5w/upfibv6qaZhfLDaIzepbAQhSgle/OvKGUkmxGXE4Mo
Le3CAZIiBGhx9MS8FLPItDDpzHXoblv2HJoZVqKRqQYMb1+485f0Q0HyGX9R28j+
7GOk6ZdfM95kgup0+bG38h31o6WaZ4Fwx8B0MIOCQxNZ7hCb1KfEhPyqKR2BBf5m
ayAcld9Thh4lzeRXtX9xMCDR1Xju1MUBZettScsuik5M2+CE1vQt1WD2uf2Tqenv
AF6/Rxyix26nwOPElm2W+XgFTbVHO98mN2hrKrpsT5zbLhgs7plYjyGMju7BCKOd
EbtK3aQBf2WqBN9WP+FJaGBhP2jLmrFg3bxV3C2kR4ZbfN2narM=
=7No1
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--
