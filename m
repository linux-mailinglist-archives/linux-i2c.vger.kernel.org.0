Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3910659BE10
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 13:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbiHVLCp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 07:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234284AbiHVLCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 07:02:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3439332071;
        Mon, 22 Aug 2022 04:02:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1FFB60FF9;
        Mon, 22 Aug 2022 11:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A4FC433C1;
        Mon, 22 Aug 2022 11:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661166163;
        bh=m+ZMpxsNeNvW9siwBQLP54G38rMpvfF7BKiiR4KlvbY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qPcTJ25n6UY55oo5evrEd5jcIFPrxseEuuweRZxznTg1KY/zRYW+B1+u2W2Z+zxmR
         nW6weTaGAqXI43lsLnPXxTmuiZN/tKd/dE4EL+ovoKSthU2nUznxnbsHTKdHCIWPJl
         HlAivGwMDubsfClGlZZWJzoS8gi/xa/9CVqzMgozQeZ6LpXkrYMKnmSlhGD0mR3KXf
         kHD/DMgcrPJXAMVKDIAKMrQJQY+0ccRED/YS3x/b5XJuPDIMdfVIEVumWhBguo7lpj
         Og8fNgioPqZ59jI7Ik9Hp8uPBNL8Uf9vgjwhqPywR2fGHG/Pdo2ht1MFtU5QCevzrg
         FDB09qIXOhFKg==
Date:   Mon, 22 Aug 2022 13:02:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rrangel@chromium.org,
        mw@semihalf.com, upstream@semihalf.com
Subject: Re: [PATCH v2] i2c: designware: Introduce semaphore reservation
 timer to AMDPSP driver
Message-ID: <YwNiUILH+mou1Ao5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rrangel@chromium.org,
        mw@semihalf.com, upstream@semihalf.com
References: <20220812071526.414285-1-jsd@semihalf.com>
 <YwB/aWRxyemPay58@shikoro>
 <CAOtMz3Ptx-xoGUUtAbssJsggmKrD+rX3nv6KMo3LJOE3ip0RYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MfQrOj6WdXou/nPB"
Content-Disposition: inline
In-Reply-To: <CAOtMz3Ptx-xoGUUtAbssJsggmKrD+rX3nv6KMo3LJOE3ip0RYw@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MfQrOj6WdXou/nPB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Are you using the default checkpatch.pl script available on the top of
> tree kernel baseline?

Well, the one from what I base my branches on. Currently, this is
v6.0-rc1.


--MfQrOj6WdXou/nPB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMDYkwACgkQFA3kzBSg
KbbkwQ/+KE+NGIVWHo4erKISEA/TuOhY5xkrPhmBCx7ZCpg1UxpyP3MZh9jHYmLO
K0SfsFk8MQJIzr6d2V7PUnzTZmTTbPES/1W+p+mxg9OpYNjIFklXiC8jxNFzDv2d
MXMaQbB3o8VN0Er/yShyAtLOrLun6ZTBq2V1mLV1djcShyXs7ZyiLP7vP+7wFRmv
aA90p0NIhKI0+tJJT5GHpMqSAe6tbPSJh9MS3J3mMaQQrtYT32enf4P7kIVbnEZa
l09Ffp+5cfL7MvGm3wGh8zBp8FWdFL6t8xI/F8p9aBfveRURMUiqIdJxc7OayDS6
abCqTzvXYEXFUwkn5V+3kmuq2Gv19gRtUSgWAM2rITby5oOlyGzZ635CVhgDsenn
SPTlNb0G1+H1wXmHObFDjVcjjFi0jqiRB2Ytxw2i4j99sgizCPju3XS54aLLL9we
S9AJVRyZtAa89NXYMfMOXLCk/kvd1Z9HWFVW5yT359qmXeLyIFttvEznhDXxK59V
nm4A6eTR1SJqf5XSJEI5U+cp7W7DPuTN7KpOrdWGjqq2IO2SlCv3FcXpA4DZrBgv
0SfUsLr1/AsJcduguhwHu7wZ+wElsC/tZjNKJF+gEPNVfJ/wUMM5Vk/gkuLAzBEf
2lsY8uMEelc9xu+4cSBodWvIMBP9Q3qNzdBBOYS4a05DII1BZD0=
=aT4r
-----END PGP SIGNATURE-----

--MfQrOj6WdXou/nPB--
