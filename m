Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F18795BB2F2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 21:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiIPTnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 15:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiIPTnm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 15:43:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297BDB3B18;
        Fri, 16 Sep 2022 12:43:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C82FCB828DE;
        Fri, 16 Sep 2022 19:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B3BC433C1;
        Fri, 16 Sep 2022 19:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663357419;
        bh=oAadqbAlspzk85K4mBPCdBFr+j5F/tmHHXVk2Ke47kU=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=V7g+v/vYWeHPLW+P8OxK8BBJ8TDhC48S7q1yYvCwS7NNULlUuJVtZXmSoqzBOW3nS
         tVLP65d2xss1n1rJXe2GQiz0KbnQIkJb9suCKeaisPTEN9aWLzhlOpw3A6+t36I4Ko
         UjcajKIZ04mYc3QQ6oQlv/V3B3BKslYsk7TPIPZUfQv1BZsZgGeKiOUC5aSFaB4xvo
         D0ppUd8+BfoUepz+FR0eJT2ldtGK67FawDKkvDVQajSlXlBAQnB5fYAq3fMGzcnJHa
         H68UOmEPDeS2z3dGNrbc9NV4eHt/Q81PHbV/XstkdmpAJp3CExBdW85s/EBw6WBeXc
         yMZF0kqrPhzbQ==
Date:   Fri, 16 Sep 2022 20:43:35 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Message-ID: <YyTR56LL6VvRU2Rf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Josef Johansson <josef@oderland.se>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
 <YyTP555S2/irq/U0@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KCIuZviv5sP7BZND"
Content-Disposition: inline
In-Reply-To: <YyTP555S2/irq/U0@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KCIuZviv5sP7BZND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Doesn't apply anymore after the revert. Could you respin this?

Sorry, my fault. It was the other way around. I missed the revert in
the for-mergewindow branch.



--KCIuZviv5sP7BZND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMk0ecACgkQFA3kzBSg
KbYXGg/7B1bP144AQASaSU1yPowl0ojkjiBqVG58mQQS7Ooh5N2U7EMZq8o8SJ+W
CA4K+krhN5uAeQtv5b/luW6oBpdcCJBUUhgIyPmsIrW3UgcWk4CD8Vd4hPUIDDm1
b9zXEQ/pdLl4slZ2hit71qKKIwAWgJm5fZUgrIUIwg1rdomdbMBBxJtd5vUs0R1W
kYmSdCEZOQ4YsvaRQyN1Y8117z4xvHbspaWb8SDYcWmIC8kHeRkKiSJV7kK/bqVD
A6YXUeNN+dDzo+I091OF2U2D/HUkcUdknbesnuQRojAETSgFWuBlE2h+l9Vk1s5L
m/vctAfd2bDVSK5wYAxonA8uZhFhvqLYsDxbV8YyH9qBZwm+AAgdmEk0lRSON3Mm
hjQHOnrT63MuInMm+zM81vfWq69Fb2ZSQvLM0dgAH9eK1a3eoObM+w9mWUpgoovf
E14HPm0oPjsOzVDhB1JEe1gf0CHXmUN0Wor4N6UrC0/k2Pt3FaX2zdvLDgoVv6/T
Mr0oblCK5QBWKForq+XYCWcE1JGsn0YOl5IV4SrUbTjzDn+0qTx9ezGstB7i57Tj
sS/DkmZziEnwk0SS3vyxz97YbB57LLFlDXTW0XVX7o+v6C7BK6dx/QM8hAahKWbO
oDkxt6ZklX0f/uFv7jfFJXUXfWzkACMxoouXVBgXEnh/080JIM4=
=LTRX
-----END PGP SIGNATURE-----

--KCIuZviv5sP7BZND--
