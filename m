Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE65D4CC506
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 19:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiCCSXR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 13:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbiCCSXQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 13:23:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593E93E0C5
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 10:22:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92A53B8267E
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 18:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42D1C004E1;
        Thu,  3 Mar 2022 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646331746;
        bh=1KDeC/0MYOFrzyXMi3JIAEPmigjk9JfS3fSTM8v9wuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BEuHIxPDe85j8VcsUXJ0MTKALkDNWKm4MURhbTzajf7VrJScgKJxW5EGSZUngQOwu
         FXMncy5IRHHLQueLIP3VlUBVdh3KzFc1Msp2lI6EDw9QWI2nXdFwA5pDF4j37MBWX3
         83IFFohkmbigpG5sbHQwqZaaN4YIosUkoVMhWVQgsqkteVlOfonWYwgQnbFa2fdnze
         V3bmDtnqH/0GGXRyzZuYKL155pXoTRgsaUsWjbbGzm8l2UzlSgAI1bXpnHZO8hxD1d
         RWKOw4a7PGrE3a+2LPigNBfylrZ/AZki9BS/XzEaTDBIeEQT1pKZ/Azf6nziJlRPJH
         8N2YCKWicdBUw==
Date:   Thu, 3 Mar 2022 19:22:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: i801: Drop useless masking in i801_access
Message-ID: <YiEHXYofAsFkQSSu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20220301172859.5593309a@endymion.delvare>
 <Yh/d92DazP4LUp7H@ninjato>
 <20220303174102.4e6f7f30@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KH9MWA/VFhb3y7Bu"
Content-Disposition: inline
In-Reply-To: <20220303174102.4e6f7f30@endymion.delvare>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KH9MWA/VFhb3y7Bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Yes, they are on my to-do list and not forgotten. Just I had a fairly
> busy January and February. Plus I am currently investigating 2 i2c-i801
> issues that have been reported to me privately, and I'd rather get them
> fixed first before we continue with driver cleanups.

OK, thanks for the heads up!


--KH9MWA/VFhb3y7Bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIhB1oACgkQFA3kzBSg
Kbb8dQ/+I3fSBOPrwKxBgfmfWb0UnHg+LUo5jp0mB1DWYa7XcFlSsiHgQmrmvfAj
o/7UFgb8+4yWrxEzs1D/DPXHy9GxzkqLlxuyUykhavzDeYjWG9SVetwz0IjA2/9U
Zi14ldFVGz1OJ5/yA/JtLHdP/ox5yruoXjkrf737sX4gXR81dV/l+MuIgqnpIG/c
459sCcqYtrbMGfqdyYiOw9Pd0X2q0t5fOjRDE/c4+joMub0VDK5q4Y7NyIE4vYnt
d6FVJaqrzifq1bVH71A8LGwmEtoFxwf7ixkx7M237HzoRAjtOLHjLRcfNCJQUrEA
kxCoo3XX/VVdAudvDPv4aSeUJXTO12WEmp05YaZ76S5ylZun0nmfo/68Jp8ONiB5
0gCyFS5eO9FmxExlGNuyyUjVKV/fYtb6bvxDhpSZUJubWkISENZLWq5oONssjoR6
+qDaZ3Euftt+DwDyYuMH7JSLYtKSsay0F/YeeSF7OMc4vxXNRK0uc7Sd89r1umIr
o0/thbqb4GZEMep5mcXz+I0XZ6WJa+pLfmjSDTreLJqQ8fFJi4sLkyWLTWqCC0s4
/GyLXhqkp/XXpDT0UwGE9AnX6pyX3XKrsPcnbX4x7hhciKjPp1Jolfe+98S9XYFR
v19/3YA2fn01XQ1ScdYFf0PbzhhShi171yvh1vkff5cYNHJq3nI=
=Nb/9
-----END PGP SIGNATURE-----

--KH9MWA/VFhb3y7Bu--
