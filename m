Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877844B66CA
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiBOJBL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:01:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbiBOJBK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:01:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E07F114FD3;
        Tue, 15 Feb 2022 01:01:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45A4A616A4;
        Tue, 15 Feb 2022 09:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E16C340EC;
        Tue, 15 Feb 2022 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644915660;
        bh=Fv0I/uevMVqVdK/YAsuOKAZFXwj51x+bB14+7XtibRQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u/mX8M0XqH3ZKtNGF+4zBIDaIv+IW/W9stVW3A7eG7vDdNjbXGFjDhvXw1x6s0DSg
         Cl1o7O8ny+2C0VeJumxwXiKjPu7t+BErcxKjeF8HgUoHVe5SmLhElqI3bBQIaPrzvO
         XkXN72+fXu/atrhwWE3w1cytEAWA3DvXEhvimB3di/P6r0uqmXlXUx0ULx02deK+hM
         H6PRVU2HndYB31gJ6ckntDGPVWgh1bu8HegUB8x7WDfOLcWSfy4H0iPpjzWr87flFc
         LigYdC/K4jXpRv8hY9UzR0gtM/F+OXH95AaC7/CLoc8Z1O5okP7A+YY3k3kGQlPL4F
         L+Qt/pcLoIlbQ==
Date:   Tue, 15 Feb 2022 10:00:52 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Message-ID: <YgtrxLc79ipRJT55@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220209172717.178813-1-terry.bowman@amd.com>
 <20220209172717.178813-4-terry.bowman@amd.com>
 <20220211105322.180ad89d@endymion.delvare>
 <YgZ12hCMUlqtLKD3@kunai>
 <20220215093742.3f3894c5@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HaDtY9g02sHaKJ/N"
Content-Disposition: inline
In-Reply-To: <20220215093742.3f3894c5@endymion.delvare>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HaDtY9g02sHaKJ/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe you build-tested the series as a whole but not individual
> patches? The series did build fine, as the missing curly brace was
> added back in a later patch.

It wasn't that, but another gory detail. Updating my build tests is in
the works. But thanks for the help!


--HaDtY9g02sHaKJ/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILa8AACgkQFA3kzBSg
Kbav0w/8CUhOO800F5iCxEQXQhrZieAMSCN57JwhmmoKvm+mtWL3URToO7OA3Aq9
K/NSm7bxUUr60UGNOF2sZvHwGy3ZY7h1L1x0YFr9khxSgGupk/B4JBSm3SGecdhe
RbbwatPphTzgRcRTynvMBgqTbTa/XWpUH3BXgY5HwLLBKuuJaMzXQ9aBL3SjqY/R
k8sV0VtnB/cD1HeC/YlJsoU3V7tCu/LKKD2+e9QFQnhDJvEmedE7jnBo3gUM7J/x
CwQ+MOXxGfFBn3f34MT8DEsLBnpop8OMlNFSoGGPgwhbwAbEcCeLhEX7pxCb5sO0
Kt99hymeiVLSrGLEnH3qOnnMIyc96PhrhhhGa4hojZfH3wqTyw7YqKs4OHTA8AKo
gOTf4IL8eOMkvSeA7AW7IvHvw/fyGMRlEHerj/v8/vQJuXgiUto14MT55OYEhX4S
NjNw6VwLXS5KjXKy3rjp8Uvq6WXm0FvWBJnvUtU+HQJ6IaAlSPc/JIjt9EuBZAU0
seIzC8g1Cfgq8qJmy5Uh5JnTqvx3OJDg+xpir26Ej1NxY8Ioc5Zg3w7QISi9vwLm
Rx/tk9rLa0lp4Y0jnPkU0kOqnJPjEc50jYgYZFDDInnqAmnh1QvRK9naLrQE+OKx
OPGZn0vlnc7QrdUhv2M+4B1DTgL40cQe0D5ef4BRsDcwDl/5Dk4=
=b8+x
-----END PGP SIGNATURE-----

--HaDtY9g02sHaKJ/N--
