Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898C77B22C4
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 18:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjI1QtL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 12:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbjI1QtK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 12:49:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53481A8
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 09:49:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EF1C433C8;
        Thu, 28 Sep 2023 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695919747;
        bh=uJXaUh2KCR8gGy5ASxqV5OhxlRiGL94ha0XGpHKebAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u0y6/rjIoCEhWCRIL1rKAYrRrF9VxnT8UKJHxfAuZpJ6nsb7eBcZUhTXfqOU16RMn
         BwP/wLPjjDCxI35BDBurPOgYl/Tq30NZ/mdmhezigcw2Xl1viGrftFYRaCsNbwiN3C
         jGhCbkk9TJCUTOKFh5EmTmyIUJI6y40d3WcUENcOCDmIulwL2Why/NQ1g0cp33y98P
         V70MQAGGzBq2T7FZHMLcO6JRM8sfWXdQChCR817JPqxksimfUE5jIbkYefzFJFuUAN
         eVzM2sCNdcEWHSW1UMPRiQ4p8XeyG3AUgozS/Buuw71Ziw1SelwM76sta0DgUC0Y4Y
         cVHC4lD4O2eLw==
Date:   Thu, 28 Sep 2023 18:49:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <ZRWufynzIX8EYOpA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
References: <20230928101655.47d3dd2a@endymion.delvare>
 <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
 <CAKwvOdkw-13grHe6NXrPpyxtH1VxHshVo3rY31iY=V8kk93fMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FEpBHGj1W/REG3Nd"
Content-Disposition: inline
In-Reply-To: <CAKwvOdkw-13grHe6NXrPpyxtH1VxHshVo3rY31iY=V8kk93fMg@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FEpBHGj1W/REG3Nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We can always resurrect the driver if someone complains, which I

Or write a new and better one as Jean offered.

> I think Wolfram wrote the drivers.  If he's the sole author and stuck
> with maintaining these, I can totally see a maintainer saying "it's
> time to put this old dog down."

It is Jean who wrote the drivers. But your reasoning still holds true
for me.


--FEpBHGj1W/REG3Nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUVrn8ACgkQFA3kzBSg
KbYtzw/+IZSHeM0xKzdOxplTP1bDhVTR1dyUGIKyJvpBvbKDaqZKhC+ucDehsZtP
OkbfrFZ4seh98VLg8g/HWCrnlxR0T0l0wQGlOm2q1YDenLx8U9aRZtpCr1GtvNY8
hhVpqvdQ446Y2zNG36Exf/vA6KFdhW5+rFbt3XTHUORrbl2JdOQytvOxI69XEtmM
CZ7kynZu7am2r7O0Jcb4/smE+Qpk6bwnEaOvieGhT0nCrRJv5Wf7r6MBXwx9njhJ
ZfANP2M7hPzXFsdLGwkUFJRSE6D9k6Lz+0+Zd3o81IKOw2MD1eb9fp6Qv0SMT7Hn
ZCMM+EKdqiFq0HEm+R0MZ2zizjItVVl3LgaHhJr3wgNQNNTbvc2lCjzGE41QLL2L
b78p/lrQRB4T73RBM0XCoFoyP4uCanglk8YLog8YRC8IdmY2qMRaXXAe+Swi7H7H
8g9MfW8SHvnyG2OX5LeWN8+QX/kXyYYcsLOQS3yICeC6zzlrzakbm6ihV6zAZRlq
7lxxBYssvMZ6238WxbwgGGtx+KuNb3jq+uUjnwL0/SQT/fTh95iPvKn4yR7dFXrL
+yYBS9KRP+hLej98d3419Z9U1DTcDkvFLDKYEAMh+QSfMfL2Z8DUIU/jy9DEylL8
lOGqtBBQunuf9cfvzy9QbuyVCRgxQELjOu+E32kUhZfYBOgBO0U=
=8stt
-----END PGP SIGNATURE-----

--FEpBHGj1W/REG3Nd--
