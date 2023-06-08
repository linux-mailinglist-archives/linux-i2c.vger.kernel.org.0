Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3B772817B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 15:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbjFHNhj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 09:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbjFHNhi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 09:37:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9F31BE4;
        Thu,  8 Jun 2023 06:37:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0ED09615C6;
        Thu,  8 Jun 2023 13:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6F5C433D2;
        Thu,  8 Jun 2023 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686231456;
        bh=BeLMMho+JfetaCMdYYeJ2Zi2h2QiwQ+avqQ10upaJqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tbafOJJxR4llsIUC08BCwYRiiq0+pP91D6rRU9M91q+n452llEDcBFT71vfYmGJ2W
         FRNSRVAyzZTf/Q/t6jSDa6afTvG2uaP/VJ58W5en5YudF8Ld0zJ9mTbsGfosqSE84z
         7zKlpUwlrnKFml6YiDhBUJvckqVVpQqUI+p1ssJG/3BV37Q31Htd6DoRbNilZa6h+R
         ysdNZaujHWpyTPAASG0+9aaKLkS2+V3jho/LS/jC4pi6ypAdMxWA8RzsGdp/Kt3gAo
         qlcqPgkAAS88VuWS8VfSlvXzb4RzhxhO0Goi71a8oJS/7oDy3n2e7qONeq28M8zMgg
         P5a0oXoGz3Ifg==
Date:   Thu, 8 Jun 2023 15:37:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Andrew Davis <afd@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [v2 2/2] i2c: davinci: Use struct name not type with
 devm_kzalloc()
Message-ID: <ZIHZnMQHDyTsZx7O@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>, Andrew Davis <afd@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20230515175042.495377-2-afd@ti.com>
 <61846ef5-26fb-52bf-11a3-b1c0b3b53b94@web.de>
 <ZIG6UzLMb7cj4bbj@shikoro>
 <d210abe3-7a9d-61fd-c358-dd4b2c8f2f60@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BJ2b1EWvZ6YUgOz7"
Content-Disposition: inline
In-Reply-To: <d210abe3-7a9d-61fd-c358-dd4b2c8f2f60@web.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BJ2b1EWvZ6YUgOz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Will the patch review attention grow anyhow for affected aspects?

What are "affected aspects" in this case?


--BJ2b1EWvZ6YUgOz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSB2ZgACgkQFA3kzBSg
KbZLUA//XVeJsfoZ7nyhcgxnlXcILtoW/H/nFPHCUSW3FunV8jaaoHxO5kTmKDdK
zWnt3KY9+bWoZng+mFhbizebUQ0JEynKibE/PwGksXn+LETcahB+NBGw2qG71hZI
G6dVkO3dObbf7XtybPqDPTFtTQ5S9xmlJYqbJKuTTwRjbeqTil+I2kGb1VUlRrj1
FB9Kv60keGAQrdGvW/Vb3dfSZPLBdxSqjWb7xzwkjX6RLyAUpSJfRL+qkE3jQJeL
WnDikMr+73NO2vQ9yZ/wSioMmza+OMt2aVH/3OzAl3UObkDbqDr31ZSStKcJaJRV
Q1fDcldRnRMbhVAk0yg/tqEL1nHyV8KRyt53nFjL8RBmmSrYhnksqVBRGAfPBoU4
NmkpejppA/Or+LVhP9C76xupc1hFtj/PfuB9UUDqneTCpSMhsF/B2Uqf71HW5evV
VxWlneqoha18FZ8dGXNNYLlxpPkTfPv2xyM9RUGb8tUz0oP+dTot2IT0tFDNlz1S
lnleqhUt5tPCAAdfAt5Nwaa25iiCMJ/YZ8KS2ry50L3XII223pSv1Egi7lbNd+Pq
W7orj9VjdW7fOXJI+UTlIjy80qky/+8UTwQi8hj7JqKFVW0KfJK/CtzS9tToG5gb
gIlLNcoBEDRwPSnww99THOIx7q7Xm/xU4RxQBfbTYWvSFnYvkJk=
=iK2M
-----END PGP SIGNATURE-----

--BJ2b1EWvZ6YUgOz7--
