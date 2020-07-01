Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD6521160A
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 00:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgGAW3k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 18:29:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725771AbgGAW3h (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 18:29:37 -0400
Received: from localhost (p54b334c2.dip0.t-ipconnect.de [84.179.52.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFB9820780;
        Wed,  1 Jul 2020 22:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593642576;
        bh=KZ2oyRFyPGujITJfUc6nzDtoVuwWqXJ+rT2W7EPBeJE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jtNBtd3O1ER/wl3tYdOUCirx8lwRwJg2zKP8iBCqTkKP0WAOdXnVne/U0+uvHLj08
         GaeDnO6n8smL9n5UB0IbuoRsWnFzQ6c0GYMUEO+tOGWqgr0C4MPKZNlWO0hI97PdQN
         9V8QV/U+p81MfxGhVTYnu3eGhbezmO1aZEUkBXYI=
Date:   Thu, 2 Jul 2020 00:29:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: algo-pca: Add 0x78 as SCL stuck low status
Message-ID: <20200701222934.GB3147@kunai>
References: <20200621225705.21666-1-chris.packham@alliedtelesis.co.nz>
 <20200623193413.GB1203@ninjato>
 <c5bd59ec-aa1f-dd8e-fdbf-5cc2aad0b5a7@alliedtelesis.co.nz>
 <62bb6093-5f8b-8b81-805b-41624cfd83b5@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <62bb6093-5f8b-8b81-805b-41624cfd83b5@alliedtelesis.co.nz>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Any conclusion on this? I'm still suggesting that just treating 0x78
> and 0x90 as SCL stuck for either chip is the cleanest solution. I
> think I could do something with a fall-through that repeats the check
> with an if which wouldn't be too ugly.

I tried as well and also came up with code which was not very readable
while trying to be clever.

So, I agree. Let's keep things simple and take your original approach.
Can you resend the patch and update the comments to reflect which code
is for which version? And include the other paragraph in your commit
message?

Thanks!


--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl79Dk4ACgkQFA3kzBSg
KbaPKQ/9EsYYcCCv2oiBwU9Yj15v3XfOEeZ4In5tRu3Y9BgOTmuU0cwTqV5V2ZiJ
B4GroT7gNKSQUPzRAjImsDxwjezWfH0jaoeFC2dl4BFAgVY/hfhZlMsEaJ0xEdwL
31ijzNVbeOoJ3x49BE2eAGqgjy5S3C6Xj2lD1oQQxoKp+ACrpZnL9RpisP2pCSlJ
Bbc8DDjkW6XM+oZ+yr6roO8/0z4K3mjieqEHXUHZF8nYYOoKKu5SfW9TsNH6hRWY
Z45NF7D0CoYh0dEHqRLRjjiU5tO4CV+lEl1svpEo7F0J7fyKLVFaM3vzeQU4iEkW
jh0nflL7NimEyQDYCzUyAz9EB7k24mOAfNRTbIQpPp+oD5ZORKGsKAm/yVDXi2hL
IzgH9wG8HUJHfEEWzh2c9GuALBFVdyp6K9QkyvH+vz5DY4cyQhRYlW+3KYuq1LVW
2WVRLcYN3F3w4xvvWokinqxf/g+Iq2Ap6hH7B0Lmj/Z+6JC5hqTxg0Yo8Srfplqb
lxYQN4L9FV6o6eVfop4pzgmCLVYd75QTVMULXQAiCsEOwN+FEp6pcN1AzF6/Sw/I
CMC27qpxS0yjbCRuczCWkyEDyG/wCMdAEshU/spCe77XMLrSq+Tvabgk0hN0rDjO
D2l+oJDroeLAxvdl9RO6YGoo+mS+cgcA6oxUf+fcwF0jF5cwp6I=
=fRnc
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
