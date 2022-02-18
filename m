Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C36014BB504
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 10:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiBRJFl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 04:05:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233122AbiBRJFk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 04:05:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984BF2B3AF4;
        Fri, 18 Feb 2022 01:05:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DED356164C;
        Fri, 18 Feb 2022 09:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFFEC340E9;
        Fri, 18 Feb 2022 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645175122;
        bh=nyo3dl7uWvkPYIIURpV8TOwhBt3YscYngOUcSSfxcaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PFW2c4zwS8hdkniWw010dfPL6MhyVstfD7Laggiz30JnwNn72Kw6j6VY7bFQt1UmU
         0Ezidu02W74D9+wrZJwfBZVYp9k4SHApO5GJV2t6Y9VdSbWI6C1N3aZnkHqan2cJ40
         KKfb9UcVHvxnQthquxSoaWS65JVjZQ3+guiy/kYe2ZyVCzNNVxBt5//geG+ujKMOKW
         2lWB3UGmLbvAwIL0RqvIo74IJdIpIlRwcN9cKxzqymwiiV98Y65PZuYryuM5e+E1I4
         6PEDMaY4KzTdhLkEZTqEYhQKE6XLw1iHi0jl1qxPvLlt9bIT4AwggQkttTwtKqRRpr
         9UiTsxWnl1SvA==
Date:   Fri, 18 Feb 2022 10:05:18 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/9] i2c: qcom-cci: fixes and updates
Message-ID: <Yg9hTgEFJ481AoWO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <Yg6oxrlQZIsJCkUY@kunai>
 <303a2bfd-b3d2-97a8-2438-fefe13a49962@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Si3TYDo8mKYMppq"
Content-Disposition: inline
In-Reply-To: <303a2bfd-b3d2-97a8-2438-fefe13a49962@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Si3TYDo8mKYMppq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> thank you for applying the fixes, 1/9 and 9/9 are also good to be applied
> for-next, there is no dependency on vbus-supply, so I would appreciate, if
> you take two more changes.

Done now.

> As you suggested I'd start working on a generic support of such an optional
> bus supplier property, I believe at the moment everything is quite clear,
> I'll start from testing the previous solution, however my preference is
> to connect regulator on/off to master controller pm ops rather than slave
> pm ops. Additionally I am not quite satisfied with 'vbus-supply' name,

Did I get this right? You want to reimplement bus regulator handling in
the bus driver when we already have pending patches to add it to the I2C
core?


--6Si3TYDo8mKYMppq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIPYU4ACgkQFA3kzBSg
KbbuVhAAjo14JDbmMiGeblhRNcJoLwEz5TZVFKEBJ5TyvdY4WeEuANV4OTPa3/Nb
oVlfMToE8+tQl9JRVLiBm3W8wAU4ta13lNtE2a7FgYEGZQ2kIFI3vaYWGoxKgOoT
g4NuHwyn1yY0xtJbZHu+iuBfZJsmdDd/GhgQga26/u+Ubwb0KskDv3takhKldpVs
4LXm+uvr++alLSs+lHODGTB+5X3OGCE/MbQ7mQXJlbEPVncf1ovpTMzvoPzhG25o
ETkUf52IJiCON9HTeX59DT/1I/52ajTXES60rd43pNjl6bIwi8+9u88pAuYd0DCL
2FKfFH88g0at4lMFqcwmjvTX3XcfmJJ+OWM9TWkEBLBi2l8wra39Ks9bLUYfBG2+
mBOgIRS8FEMMtTKpfdvydeorHGfwc9v+4zjQNP+ZVIjl7qm+NZu+I3h8uH79Dcr5
+CCNg7BHCojsHzF4pzxUj5D7iz2TOlgHH6YHm39TORKNmD+F8hye1OhG6q/BTfQV
T0jn/92RSAA2cukIl0uO/k1+e3GKWZa/pp2MNtpUzHMmH6x5dRiiTw7g6C/QUSKC
kEmyXwIai5/emba51HLTtKjmM/lnYiBwHfdpQ+BgIXCeCAIxOqDUbUsmUOXEzICY
95R/1HQ/7zlt5AQoeRLgpD2SRIFIPeijAF9ZRQHN/YW/hXscaJM=
=v/eQ
-----END PGP SIGNATURE-----

--6Si3TYDo8mKYMppq--
