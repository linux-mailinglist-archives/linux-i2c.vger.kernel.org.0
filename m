Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8E559592B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbiHPLBh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbiHPLBO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:01:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521B2B4EBF
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:27:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6532601BF
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EFBC433C1;
        Tue, 16 Aug 2022 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660645650;
        bh=4Kb3EFpqcdj26uu4PQBcAvMjO4JInPNv4wna2e1jrrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ntc9aZ0WLZ0G4JXFyDROy7JRvqR/gh6LQ4PruxMEreEYtBLRJ+6xJPU909zeiO/sc
         kE1nk6TfE6Gj9aUR7l6tu6/5hPrBqF4WXPUeW5/k7DfhLgeygpD/g8iW06SojkaH11
         VwKVppOsL6DAmrsMKlaM6T80GE7oyY3bgehqcNpg4aiMXlKbqVPK8nEuzkeWQMn13F
         hAqRp/XFIsjG1bD5iXDu93uKjNZK8rAyySaeyyzxV+I+xOf+Csi66tX7ihxXs9UOt0
         mjWbQO8dHHjs6lRzFRKX6O05sjOobPeHBsBQNtkLnSPLXXxBGotyvzTqbmuO3kGCLe
         2qaueFgabLXqw==
Date:   Tue, 16 Aug 2022 12:27:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Josef Johansson <josef@oderland.se>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <YvtxDQ5svDFqUaxN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Josef Johansson <josef@oderland.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se>
 <Yvtu29D/LkoMzubP@shikoro>
 <3877967c-5bea-d930-be36-23cc42613e34@oderland.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OWqYqnucUYswJ7A1"
Content-Disposition: inline
In-Reply-To: <3877967c-5bea-d930-be36-23cc42613e34@oderland.se>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OWqYqnucUYswJ7A1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Not verified by anyone but me so it could be me just having odd kernel
> config.

I also love odd kernel configs to find bugs :)


--OWqYqnucUYswJ7A1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7cQ0ACgkQFA3kzBSg
KbYlLxAAmkM/jro+wwSllbx0Zliex6KrFEUUyXuk4KrpYmcObeyn+r+VCbVJRbak
od4Hnyfxu+c0x0P9jfb60ZFFtV6sVXtRyk93PyBec7ZfsFyr8S4GqFW3jmUFMv7K
gvq0aOL29XFEQ+lrhI/bGqIv3bpklDC/3K3Aej6fG8R+dVCDK7jzzLqqN1IRHcE9
4Z3t3AgTdgxWm2lmNFbEDnB3ToBGlf3x7KuLubs9v9ag0kmQX+vAjRVBpbB8Su2v
ZaoWx2w53EGv3oX0BrniuHcy+EEuoOKLgDJxCqhsTaiKk+3RzhC60dSLr7knqw7c
K/x/3VcZRnoQRZfGGCVUpdCnID5tUUVMw22FunSuaW+KqjEQPD1nGTTXKrEi7zNG
vhCOHzQPw+UubPXi6KkwPfysoP2RjzsrZNTSz/0aHURgTwN3MD4doa4I7740/Bl6
SVOaTtjBbO1hF4h0n6MYLj1/tRlPIrlxQCJDxRj777pA6VmjhvTRbfo/5SVONgNE
9ev7ePGY3jNAxpDMSEqmFI8lVrQmOA4BRkh74IMWEBc6npxeRFZbhk83rel0LUx1
CQZtW6C1JP7/43tqRUBx2Y450dMP+d5/2EHjZVuFpjvhgP4hJGsbJI8KJ4KklF+A
kMLv3NDXj547TF2hQIlazZz0mGq8Oi8VXXBKboqcFciWVDj3LVE=
=iYfi
-----END PGP SIGNATURE-----

--OWqYqnucUYswJ7A1--
