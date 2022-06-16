Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D21C154EA2B
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 21:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377403AbiFPTdG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 15:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbiFPTdG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 15:33:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDEB2935F;
        Thu, 16 Jun 2022 12:33:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7702B825AB;
        Thu, 16 Jun 2022 19:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0ABC34114;
        Thu, 16 Jun 2022 19:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655407982;
        bh=eG8CVe/IgYT7/YEH84OgJj81/Y8HH9wzHZYp7KUete8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G967x/l4vWZZJUF4E5uTQJktWgodU8Kb5bEo+oQUr3HdQFDDR03A/La5YOnuqlxfh
         9a0wdhxsYXeKFBeic/1sBXJ6ssGJ0QczHdYhaU2UO2Ifyiw0TrD949wByLgPGdlQh6
         voFZcdvt3IMZf50r3ECTVMz/n/LWXhebolnzPvFaX28dKx7JgFLYcnvqrcLjeK4qDo
         TsvjtNy2i5Ibt7JWiA7VJTOsjh87sXX7lzVIgy1HQWHUgnGzEypE3pqssPtRV7kv7m
         ZkS7Je5sAkL9+cskSlYWyvMyMzFT0rONSTbAu5QZg9BXadah9r25MjM7W/P3oS0pHk
         E4khgXw8/NTpw==
Date:   Thu, 16 Jun 2022 21:32:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix potential use-after-free on adapter
 removal
Message-ID: <YquFY50LfsezqrVn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a9dc272e4e06db661125b7b4c330821b532afc4d.1642209079.git.mirq-linux@rere.qmqm.pl>
 <YqjlZuFGl0dAUZyd@shikoro>
 <YqoehVjd5qgEYSen@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S2FIYZZN/lYn5+1m"
Content-Disposition: inline
In-Reply-To: <YqoehVjd5qgEYSen@qmqm.qmqm.pl>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--S2FIYZZN/lYn5+1m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82,

> I looked briefly at the kobject machinery and it seems to ignore module
> dependencies. So while both approaches might work, I'd usually reverse

Thanks for checking!

> the order the init code is using: in this case module_get+device_get,
> so on release: device_put+module_put. I don't know what keeps the kernel

I agree this is good style. I'll add a comment why we reverse the order.
This will be also good to avoid regressions.

> from unloading the module after module_put() and before the function
> returns, but I assume that would blow up for both patches.

Yes. There are other users in the kernel doing it like this (RTC and
regmap IIRC), so I think problems would have become visible by then.

Thank you for your help!

   Wolfram


--S2FIYZZN/lYn5+1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKrhVsACgkQFA3kzBSg
KbYEMBAAjjdr/oTw44e/h8NHL8xpV+uGXDahirps/+FNqv+YfyLeTM8RA8MnjtJt
3NblrlNafxOIhsFSPm0WU2ixoPbD7LAPFabLUFaPaauxTR+d99svkQNpCSvQxK/V
sE78j7oI8u2wpThfReh1uc4E19rUUAX8AdRVjWW3GOyQXtz5PaVvNUHtoXEt4fc7
WWX2tSq48j6JYkPELGmF5FtXre/lYGb65KHa6LmJkHTrcLVi30+mtQdmMJm5u3CL
MXg9HkPiUGhAP1Uo/GzO+6p0MHeDRv+99UOT8Ke8vh3krljsIDEPdXGp2od/r0PV
l5Of1RBadvIUKs7Ecwf+guYWV+5vOa56lihFP+DmuENhDUyan8X5EDiyP1tU7Y+V
r0Y8uudCbzPNEUczNfyeNjTUP127uhp6NyuwHRzsnqCpO0fBu9bX1NYlpZWlBZeo
rc9+pGALzsAT2Pyyqvd8uqn/PyYYNEQN2JyYChAvPz5v1CweWyplxv5bFRuZ6cFa
BBu26xbD57HIL94s2QaGEtTZ3bBCVUd9LGtobV8T9r3LyI3YOoCR1HzO+5gKDtqB
NEvMTXYVJW1iBCrqhhfNRRTLZZvP+kOCfOIGA8V3zKal9J7IivNazwt+lHJsNc8X
9UJ2hEXgr86Z8KXfAN08Iwav0gs/r8rOWJ3WGF/dH49Dmckuoac=
=0yDV
-----END PGP SIGNATURE-----

--S2FIYZZN/lYn5+1m--
