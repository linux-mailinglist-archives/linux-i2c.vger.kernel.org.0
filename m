Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABDB48B88D
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 21:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiAKUVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 15:21:36 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48482 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiAKUVf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 15:21:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EF4761138
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jan 2022 20:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBED6C36AE9;
        Tue, 11 Jan 2022 20:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641932494;
        bh=BpaPFV0jwgJLhg3ZugYVOeJPkuUvDidnLJihUZF+5to=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oovDSn2iib91kdmuESbxWh6yykhLqB0v65jU46vlOkd6ZXs2SIgzdhynB+wAbId2o
         odhAvZqKA/HOOHt2uAYXA2Sq3Ta8pzGrThl53Vp+vf3Pks9eaJ6e2df1YteoRqGL5P
         0v+x8SyK74Rdlc2Q7WG4q0Yo1P9pe6OGxjqq3o2TykdquKms9/o14ph28QbEkk0jMC
         wrvY1sdLz8UbYukHPP1ZjPIf3QBhocQ2CEbceoX04YFZX5nIv22W0pkHaN0gEAX+vD
         bZn2tvkPLNTkx7RRj/x6zuKHQ965Pb+4u+aSPT3lCCt+wAbvbk+NjEO0FgNYSsi5Vo
         rW8jjg4mmN9cw==
Date:   Tue, 11 Jan 2022 21:21:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bruce Duncan <bwduncan@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        trivial@kernel.org
Subject: Re: [PATCH] Fix typo, add markup, fix URL in i2c-piix4 docs
Message-ID: <Yd3mypbrlKk/nc0e@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bruce Duncan <bwduncan@gmail.com>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, trivial@kernel.org
References: <20211215113356.62982-1-bwduncan@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4GRRaepTJn/oOrY"
Content-Disposition: inline
In-Reply-To: <20211215113356.62982-1-bwduncan@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T4GRRaepTJn/oOrY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>  For additional information, read:
> -http://www.lm-sensors.org/browser/lm-sensors/trunk/README
> +https://hwmon.wiki.kernel.org

I think the proper replacement is:

https://github.com/lm-sensors/lm-sensors/blob/master/README

?


--T4GRRaepTJn/oOrY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHd5soACgkQFA3kzBSg
KbasSg//fsowqir3VAuFlhR6fwiiDLQtMhCsSbfjy7rrFWZifb2s1ZITqGnAQAJg
WvMcenyB87eB7KUv6sSgHdsR3OsGhEzbKSgHQKzDgFg1pIvdnF2QAlrlGGbASqAA
k1SPhahPtYDAnvguJYdlus2f3mQO9pfYsbycODUKRh5jkPEkOTmwsExpyVTVtFLM
8pr4xQD2Ur2y96MfFYaqtTU72+QitA/cS4NXGwEOl0P5vxJJOonp4eqwZz3Efa8L
f1sJKaGKHMV1xL3P2TDL4IjK8CX5bNqvDkLXEJYqdIGfVW9Dzmc53tv1NO+WBy5A
nt1q9wZeWWp1tfI1r/7vZ4eg9W7Qr6SD3a7YjlYg93WbgKT1YqFT187f7d4FpCqv
7NqHjacbk0LFajHgcxMtJi2SsI+qxU/yGVwegAyXTkmD/3ToTKbZaq2n4HgquDur
RUPt3r2opx8mtMIFrYp9qvLEzCmBTngwkqKo/kRFoGNHyFTLRvUB67dqXynM7inF
90pHONpuIvZGn+Nwkf8Nu9JW/qlSSMSfTThH6vkFS8jYrmZAfKn/tMh+i49eYaiU
MjCThwZLAZijfgsAqtigybm50e8pj7TPE8wyEc+0Kvl7woKtC88xDTrDXq/DLmTw
WiTnm0xuBU/vKVpE7SPz34EwxZkjIv2qIUmBT+TJXkRyzE4IkkA=
=uP/t
-----END PGP SIGNATURE-----

--T4GRRaepTJn/oOrY--
