Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA7A6050C2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 21:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJSTv7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 15:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiJSTv5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 15:51:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7806A1D5E0B;
        Wed, 19 Oct 2022 12:51:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56A39B825C0;
        Wed, 19 Oct 2022 19:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C3DC433C1;
        Wed, 19 Oct 2022 19:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666209109;
        bh=9MMnJZ8RVykqDN4Q9olrkhBbfU73G37kA+f3xinyUm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NmVtvRWW2kjjIOeS7v7ov8xqJWMC2U2RuTMlsSrA8LR2iuRQ3iD77Dyf+jM5HaxAz
         1DYJo6L/2Qg4p37RfvkovpCq8tLiztf1Jumq6KEO79adngURCw2nuXdMdXNgj+MIeM
         OHcVl13WXrfCHZyQ/dGGDSVgqQLPqBlROj2aKELmg0PGjjRFyG/DtihuC+CGKBE9/i
         dMMC6Tj/NpeXB8RPbBuBM4Y09jehl3wYQLrNG6ZuY12rhwof/OR2hU/q2glz035rte
         SUlsAX+elwCW0e2lszXJ1nXoxNWXgynU0S/iNZ0UMIzTixs/EnZoyxO4nDgPfd4AM0
         /nibkhREU/DkA==
Date:   Wed, 19 Oct 2022 21:51:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jiangshan Yi <13667453960@163.com>
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>,
        k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] i2c: sis630: fix spelling typo in comment
Message-ID: <Y1BVUSIoz7yEhIzp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jiangshan Yi <13667453960@163.com>, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
References: <20221009072802.2638945-1-13667453960@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g4Vulk95lpdhDVTk"
Content-Disposition: inline
In-Reply-To: <20221009072802.2638945-1-13667453960@163.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g4Vulk95lpdhDVTk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 03:28:02PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
>=20
> Fix spelling typo in comment.
>=20
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>

Squashed with previous patch and also applied to for-current, thanks!


--g4Vulk95lpdhDVTk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQVVEACgkQFA3kzBSg
KbZa+A//Xasn2NUdkAJrbd/lD0NAE/B/HMDxLvw/uLz4ZlyFfXSZIIwS+7v5DjBB
PoCg25qDlF8tkiU5D6w+XuehJObLeQHUagbo42gHWjw5xRHQB9F73A8BIidQHiJD
zQoqFC7jhAG8NQy0J2zpDcXoNLaFTojGUTbjX/OZ++hGqgGyPvdyNfdSJpZwxGhR
0TnZRHgCLiT6304r5uEyK9/1uLx7YopX6LPAw8wwM+Ioqw/vrhYrXxAMj4zcEPu7
B2CtTsLRzhyJVniMPTxBIKTTvxhxTmdPd3pxitZdxH3Thil0zyjhFSwCR7IdElQj
nQiIY4nFVUXkqv6yvYSVZ9kUhpxUW1Y1GMbbjQvhiTgJly058dQafAWgqzi+TX4c
j85+fE4gw1z/WqsYvgsALARnpMy7glVYRSEzCfiYyPrHeZDf6fD4dJ8UXwb63rtl
F2CxGNXFBjKH9NvAzp9m6IMh6Lf4D0KaVIwtHqnFk43Mk3rIXQIB2h19xh7kreD+
ctx+97r4RlafRSq4Q+nCV8TknRPTri2WON3kPwx2DqTQg/uQZfzs/z3qBHwA3OTH
Jgdkdz42KLdNWhUSnwsPF+rnCEos0mnujFRNn5mjZYZxuUjoZSKOA6gdJzJ+kdCl
vmzQMa9BSYZQ4nMDN24lOSda8WNNfLcAYs4G0M783QV1wFjZDv4=
=k7ri
-----END PGP SIGNATURE-----

--g4Vulk95lpdhDVTk--
