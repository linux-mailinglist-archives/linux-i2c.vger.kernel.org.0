Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9994D5BB262
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 20:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIPSqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 14:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiIPSqj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 14:46:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A47B81F6
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 11:46:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BD0A62CAB
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 18:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621DAC433C1;
        Fri, 16 Sep 2022 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663353997;
        bh=s8H0mbCOoxWJxlX2PHemiIQiWrgd61D1tG/eIoN8YR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z5FlntAT4bQSIfhiVts6TL6AUEmXFSlBkWwDrLq9ZnZf4y8gxWOhmOsanutWLgQOD
         XjV1KPyCatrcVdZ7ADg2cXR49SlHgCPqnzwXs9cMBYX9pev0BqrIkmzERnlDObdTCH
         f5UYqgNANj0VlymLbVKzS/XoJbj7+5gzqmX/UovafJW5ER+14vOYAJBR15oJipraUM
         C7sIT2YdtW25zxyjrwCa2TqrQMIoIP3ZDK921vcKaUhJ8aGYxpbmMx8IpqF1PVRLa4
         /zcnq32VeHiXd1u05CRwXE4hAcrQ1woG+JMIEQoSmcXIQP/u5/QggyZSJH2Ick2FMn
         RvRfBFEeyXCDg==
Date:   Fri, 16 Sep 2022 19:46:35 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] macintosh/ams: Adapt declaration of ams_i2c_remove() to
 earlier change
Message-ID: <YyTEi++70eURjXpQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de, kernel test robot <lkp@intel.com>
References: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HMFOUFa8uBGlWQEH"
Content-Disposition: inline
In-Reply-To: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HMFOUFa8uBGlWQEH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I don't know how to proceed with this fix. Squashing into the broken
> commit is out of the game as the commit is on a stable branch that is
> already merged in a few trees. Maybe let it go in via the i2c tree?

I think it would be simplest if I put it on top of my for-next branch.
The other option is that PPC pulls the immutable branch

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/make_remove_callback_void-immutable

and then applies this patch on top. I don't mind.


--HMFOUFa8uBGlWQEH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMkxIsACgkQFA3kzBSg
KbZlvxAAhZqN3GOBpS7hgdIQxyAJByYhb2PxVRswFqOF3n8dea9B0ozujTY6Bd3l
5AJYWlBSIwPvte8bzVfQXXnhSu8otXkUwUViNZ9d4/xO9dSQLoc1PrWVE61Uz192
/5g5+CMKgZful3LIt7WuclHFVt3Zd/jdYtKaqIC5dSLh57xFARekHp2PXWhRgDnS
OI+2xWBsR5spjlKgo8zQWwUpmBMjrXrfwT54RHpl8QNux7oh6snVdEjB5qBZVnN8
1OMWFpAWxbR0YhYLRm+5vaJDYn7xaZqcX0Pg1WHnS3v7wTBnS79uRGS0pEcKEiHT
b9f4Lm0++zZiXo1nwFNacZL6nkmC49TreRv14y4me4ZbGiT+zUlqMkDgmVzI/f+k
BnHlhzLk2ZMIJZoxLHl/lite01y58kIsED3ZzRtCrr17ATQpPxx8KP9Ru83Cl9aD
q/PjW0P6fRdew4WvlbXF5rWSsoUyxklMYw5Aq5Rlp/374gKdl2uBBodZnAqQNX3s
UBwAkWoBJBOuHtwRq4nwBisHkSx+USRoPprg/MDwdL25mMsGHDbWd46aN/XhHPH5
f3jo2wmCt19ctmtZ7MiBN2xnIjSViPLpPJB9M1xhW2oKq+Rsw/bpyhENeGNwWDPP
Q2UKNiLZtxuWbnRNpi6VIlHCpJcTz/hsWBRg3BAogCGinRYHBrk=
=VQUK
-----END PGP SIGNATURE-----

--HMFOUFa8uBGlWQEH--
