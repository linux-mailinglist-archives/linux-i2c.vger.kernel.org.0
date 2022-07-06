Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB82568A4F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 15:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbiGFN6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 09:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbiGFN6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 09:58:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CB2E30
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 06:58:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 935CB61E29
        for <linux-i2c@vger.kernel.org>; Wed,  6 Jul 2022 13:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8319AC3411C;
        Wed,  6 Jul 2022 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657115927;
        bh=MY7t5Z7LyuwjfyfdcV2nhRXfbpMha/aFx+8QP6/VXb8=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=minaHAtyYuZm6uVH6vd3EWQaPtBTmnfwq1GpBi3felhPWljW0RWPQWdnBN+sXQYJP
         Roj9yPgCKhRC8GLjNs9RYon/SG2RWcohm3P0+0SZI1GnQqIEgjREK7IT4cUJ6drHT0
         Z3kblWr5OL2PWNWecq72IoBiGsgIOsTzFpvspU0aDU9HZ16sIdU94Mvj4EHxNgSqwK
         WXtFUNTZtpc3t9tcV4zlGhTEEIjP3Iv4gfvl/ITNBho5+yS9GX9wsDUGhpyn7SAoHg
         6SXkvKV99e6f+zyqLx0trbucKWvAI5sJ5r2PSCvr9zQHZZamhF+hz9IbR9a2pcWar0
         dBSnC+LArXosg==
Date:   Wed, 6 Jul 2022 15:58:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: Drop unused voltage supply from example
Message-ID: <YsWVElCut8WMaOuM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20220701224136.808991-1-linus.walleij@linaro.org>
 <YsWUu/0mcSXUMfoJ@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JeufXuhYx/0KFAm7"
Content-Disposition: inline
In-Reply-To: <YsWUu/0mcSXUMfoJ@shikoro>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JeufXuhYx/0KFAm7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Added "nomaid" to $subject and applied to for-next, thanks!

"nomadik", of course!



--JeufXuhYx/0KFAm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFlRIACgkQFA3kzBSg
KbYANxAAlhn3laVq4c5q9H52f9ycWocUeMLyfPVB5HRdr27qQznkpu7iOs0LKyLH
jNKtsRb8xvhrOcOWfA5KDqIBgzWg/nXhxRVLzY2zS1y9yKmW/dkhY5NnRCWANygz
hFYjzBltu4NGRMelWJKhgeUwtGfZbqMxiw3xA8gjOMFS4qzrc24utEYht7cH2RjE
IVDRxQMX6IMR51tLe7YiCNnQKJbAo1jwK3AqOU+yKgorux6xVJ989fMVxJoDSu4y
J+tZyz/D2Zgwg1x+Gk6V3UU6Ctl0kTASY40Vh0+b26OEkg1qYz1P1gSdx5h01h38
D1Kda6mb3Y/qkEKAkEe1OJNyQYWZgHipnkiJuHpfVXj2PlWWIwHC7jWoR859J99G
gqfzmcMzX87+fZBooPEW8xD2/hJ1zjBYbaahnDXCVESSr6e1DiQfO70c1g/wXoN+
/wGyZ+NT3FjsbXGmXiWZPBq/1rN/txCmgam2dgmp8zV+X5aLz4lZN3iFMO0FoBDA
A+hjty/Nvk79//dFPgaCzIsIl6w3YGa7ESWMweTWIzSV39cfIxq2ELlT/Sdu81Oe
yPDht8M77z/nh2X1OMZU/6Lgz5TVT2H7MZbq9prs2Sz2s+H4CC7kt0YJhhLRUdn2
CBxTP1Tb0nxKVzI/Q1CLm+xz6ySZtzdEj8ILzUoRDgWKRlBXo3c=
=/b9E
-----END PGP SIGNATURE-----

--JeufXuhYx/0KFAm7--
