Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE787A2FC2
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 13:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbjIPLl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 07:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238123AbjIPLl1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 07:41:27 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86089CCE
        for <linux-i2c@vger.kernel.org>; Sat, 16 Sep 2023 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=rV3M
        QAfEUvaD3vTox7p3VRNL07FnlYNAnCdJs33T7MY=; b=dcMlp5EX5pyzz5BopNyp
        Ki9jl6lG2mp83bX7e2aPUT5syV6blf52C8T2LNkswqdcveAT3lAJZhvXItdccVrl
        UZDlJJbmW5z2zJ3Y4RD+hhLAqwBrTlLKe/HHiLFWHaUnsoFD1M3vgd68Zij/gXPn
        6IBlExn4fniM6X0DkWnwKxzXXRfQdJnw1V22DWfMlUOUHGNLnO7vsqD7brDNMNQZ
        WwJnoRHRa2LNcmr14Y7z9Yc4jF77naS1Iz88uCcSk9LHouBBih/4QNrAIiE3VGYu
        QSVR/GixCd/NqdBlo2jeNuvBFo6sv9yPZcq9ge6+e/0Z1tEryGSwCKNO4xEemaw0
        8Q==
Received: (qmail 1629540 invoked from network); 16 Sep 2023 13:41:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2023 13:41:16 +0200
X-UD-Smtp-Session: l3s3148p1@JXgLY3gFXyYuciVa
Date:   Sat, 16 Sep 2023 13:41:15 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Message-ID: <ZQWUWwi7pR7/negW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
 <TYBPR01MB5341A56291AFCB54E4918167D8F7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w7ODO1pQBBvDsUPV"
Content-Disposition: inline
In-Reply-To: <TYBPR01MB5341A56291AFCB54E4918167D8F7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w7ODO1pQBBvDsUPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

I had a look now with Kieran's Spider and could reproduce your findings.
It is not a problem, though, because the system behaves the same with
plain v6.6-rc1. The only difference with my branch is that DEBUG is
enabled for the I2C driver, so we see all the messages regarding
EPROBE_DEFER with DMA. If you add DEBUG to plain v6.6-rc1, then you see
the same messages. But still, the busses get probed and they also get
DMA channels after some time when the DMA driver is finally loaded. So,
this really has nothing to do with the patches themselves, only with the
additions for debugging. Phew!

Thank you for reporting and testing, still!

   Wolfram


--w7ODO1pQBBvDsUPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUFlFQACgkQFA3kzBSg
KbaryQ//TNv5sPXPBuqcTYF0NYlB1kBySuo/YIsEoakO5k+6yYg8H5zG7eFsuj5f
0NoWzVfzV1eDYnHRl1H0QPhhxHYghl68LRPy/0OFvG0+mPvuqrMjczA2fD8S/uAX
AkIcyTstRrLDb9iYgy4ZB+fR1Byz0UnDvnzk8cDVy97moyu2tU5vn23qLi6b8l+M
0G4u3L+13q2SgbwwCZCkWlaqrTCa9vbztUjnQD3k9HS3RZYQltwgLktusrcAXqRL
409KDk5CxCvIBDbEGmxPxfx8C5NUlNBabDWDz8JXhiNnAAsjhPfACWOXo6xYdEgD
7i+E1XYszGKU7VZw2DUY2bncUqMpIkmQMdcVByZpB/Sffxl1+HvHfBaELxXeb/rN
XqTEsr/ptK3aCBZApQUUFUGTu2flUGmLEpnyrlar8oQ6+KzVhJ6AY03kEJg+ab7Y
wqggs270XUFTv9t8zVInqAm2ouYiHXDLDp+/uvZVrsLBCO887aKmvT4kfl3n14hd
RlqiZwwmHJELZGjSuHCwMhdYf3QA62Ur2KlDgMw40tkhL+UPxWKGpLJrGGkZK22U
Sl2nEkpB1WykXK5zSo+W4a9PVqYQOwMaAk8rktl4SJbtBV8xivxoGonI7eKSr1/R
sg+r6tIYTD/G9D0WQM2JyYK4A/ip5rQ4fx5UpV4w9kOGBD+lObs=
=KHK6
-----END PGP SIGNATURE-----

--w7ODO1pQBBvDsUPV--
