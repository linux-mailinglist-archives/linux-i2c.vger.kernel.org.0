Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E481530609
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 23:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348694AbiEVVBZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 17:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242846AbiEVVBY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 17:01:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9358BE0DC;
        Sun, 22 May 2022 14:01:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4B2B5B80DE8;
        Sun, 22 May 2022 21:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C580C385AA;
        Sun, 22 May 2022 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653253280;
        bh=/iO/G51ICpP7nAV1aua3N/ufHh2RdulJqh3DRDEyHpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f7N/wjHJsDi9d1uabOvzQvS8CsrzRvmcsqMf+fsWLsWyqZN4mHy6aJJcOnbJ60XBx
         kAIdUVxqLTlADrEfJqeFCp6UzgNFcd6nKzg4OvkubSBbMDzs7ugVSQmn23jAj8Y/8G
         RQhSqtaco44yAveLwy72SuNw46sl5hKp0SRS6/+0Yg/4Y2+z235l6Tbmy6K+AJt4kM
         ZICefZuVVDqBI3fZfUjmSoYkFJ7Aam951Nzxmvf7QXP5L/2aisGHOA1Mt/l3E4SwLP
         cAVNd3GBG6THxIK4IUQhIocruOh71R2ooytCwtE1Undaw/oi9W6XshwVRjXrdoly6X
         z1GBqS6nJ2nPw==
Date:   Sun, 22 May 2022 23:01:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Miaoqian Lin <linmq006@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: bcm2835: Fix error handling in bcm2835_i2c_probe
Message-ID: <YoqknF3026XOYjbT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Miaoqian Lin <linmq006@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220403063310.7525-1-linmq006@gmail.com>
 <YojRB2043uYeV0XH@shikoro>
 <dd299256-2266-4736-e50f-17b417529699@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f++9MMOOnQgxRNCo"
Content-Disposition: inline
In-Reply-To: <dd299256-2266-4736-e50f-17b417529699@wanadoo.fr>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f++9MMOOnQgxRNCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> on which tree are you working?

Thanks for the heads up!


--f++9MMOOnQgxRNCo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKKpJgACgkQFA3kzBSg
KbYxPg//VOh/1fBdA1LJr9u5cZUz1KEFUunMFuT114ocdoeDVAZRsT4FpMUFpT4g
ijVWw4hBea435chIp3ApluXzYxdNaDoRUvuuAu6rhTJ9K1+4EwbPjklkw2fJTITs
KUg/XwiV53Ssal4DNmqOcWO9U0iuxmBS3RpuPQWTYnw6jihNZCI/PJ1TdVlrbZuC
ngv/3M7z+gF7E16siHJfbwT/Nqr9IGFcOONuzYCZn1r74M7bUo1wGsSU5StLoRGh
GMBO0fElkexFGYhJ+wuy9ifN8HEnrm1/NzSXJt180wmkQ3on+pb8NCvYPbGT/3hT
YqTzf9KJY0B9MN8+OQ+Zt4+C/1YEKhMk/1Kpvsb7lEvgpRHX7n24OuRjOOxzmpbZ
GBwqMXl+3zENcaZcXJFOekBtzvFFtx0B750MHWqtMAtGjzR8QSB2Gpg1fHWoOEXH
EXwie/W+kWmpBMLQX1r46BieDrF0TA0P7WYqGJfbM+jg/Sco+KOe9etTI5TBxjzR
tQ6AFzW9e6Bw/0pyRhgcNbiQQSYMcFBFWIKZkdgvGwergMnJoqcKgu1uU5Jd19FO
/eqa0fow69Gk62mfNu/Jdi/PwQ3Tk9xqBZPjR/+QV778DnOJflIOn1RlTaqWP4ax
TSTCH3VxsGGDZf+zo8EywOmRWcppZRXM4WpuUyLYweH7R/LkAS8=
=tIF6
-----END PGP SIGNATURE-----

--f++9MMOOnQgxRNCo--
