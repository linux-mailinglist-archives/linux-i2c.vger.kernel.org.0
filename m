Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7053793D69
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 15:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241077AbjIFNHr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 09:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241069AbjIFNHr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 09:07:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E28A10E2
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=5Rc5
        1KKYM2VQU/ABIQd7vOULDm4mUTaH1o7bkoDnXBc=; b=l0zluQVNwKvgiSUva04y
        ZUWEIAQi1H6F3iD6fEQ9rQNZYMd5AwChG+OTiSu/M9O94Qdas/SDlyGqtNJNjAjR
        Jp1rpq/cZ6AKXe4x2UAX9SzbRMFXn61uu8twHd5tdNIXLSVdIMd9t4VsY6+HAbv6
        xpIypQzGdv5NHiDVZxn5qtfdNlfbeMYRBnJf9x0rE8PGEUx+FT5WmMXoxj6ufOdL
        jtr5MnYwYq0UygTdQpPqEd3ZOYaY3EWyl0xOzddPHj+Y2TeRfcGGVBx01j31z/BW
        i666rxvw9zZVr8tyAWfwkU7+acM70U0D/oawnO3AmTHMdVtxu5AZ6IOZKF/Ropta
        DA==
Received: (qmail 2830462 invoked from network); 6 Sep 2023 15:07:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 15:07:40 +0200
X-UD-Smtp-Session: l3s3148p1@suycbbAEiDUucrGD
Date:   Wed, 6 Sep 2023 15:07:39 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
Message-ID: <ZPh5m2PUMlmhtOyQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdW3nGaCHU2GeO3=MHDvZskmXd17GJwj=xBp_ZVawAtniA@mail.gmail.com>
 <ZPhsVLiGck+XF5T7@shikoro>
 <CAMuHMdUE3BVZzsBGSZRPyZRK46zZJ_1jtNMV_Lv-Tp5YXPOY8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FVdGaMsPA8WdSF2P"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUE3BVZzsBGSZRPyZRK46zZJ_1jtNMV_Lv-Tp5YXPOY8A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FVdGaMsPA8WdSF2P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> OK do you need rounding for the division of ick and t.bus_freq_hz,
> or is the adjustment bij "- (round + 8)" already taking care of that?

Unless I overlooked something, it is the latter. The new formula
produces the same values for 100 and 400kHz as the old one.

> I guess I just don't understand the intended formula here...

Ok, needs more documentation then.


--FVdGaMsPA8WdSF2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT4eZcACgkQFA3kzBSg
KbbJag/+Ks6KCNO+/9qRQcsH51FT9+h/K3iXvDNNgLqKpoda6RaU0Roe9ffXUszQ
fu84LLpI8AUImsGUP3NuicW58Vhv4RdiAfREIiJ8TRUIq05BXno30l/AE1fAs1C3
W8UgtiIkHibSfz30ItE8yAa8MUCnaK4XoxHlvAphoTzkx3ufQyjFDP9LmdJno+Ly
Tkb9yg8PteY+MVvUskMKf/wJ420OSBFXQL6y0V/4Z07Qb9o9WXXZynvMFeIlfmEK
SvSUhfOjm96W2aviVgj2pTuPad3X4F2Ddz5PVvOkPgq2Cy7vSBhNODgY/gkB7+jL
OjPJYPugVUsq0GKCx4TZSgZe0kWNpsatuBOznQ50WE3nZS2KHlNopuSrWntl2xt5
MQQMPl6yKmmuE3yYciyEh/w/Q9lmv3uBuMdyFGKX9NVEmR7wVw4X6GcTsvjY2lmo
qUA5fhJUkkXagLAD2drG3rKwYqlFSqEYqDQnEnIvRY4bEL/blTmCFibXW6kvnCps
a3o0vytmhFq2JIqWPp2pLgtXX7acrzEK+Qf8ATqgya3tiSIbVeMhr4eC3f6KUwgn
q103Mv7kpNEhquy90ah3dUC4yxnsQen2TZf+kp/Bmayhu0jcaURhjeARMMEiQY8H
QsMo6hmPbjRlCwKFDdz2n/+Hr8rIQUrzNubd2SZn5BAjR54OxYs=
=f0CV
-----END PGP SIGNATURE-----

--FVdGaMsPA8WdSF2P--
