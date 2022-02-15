Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38AF4B6C96
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 13:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237882AbiBOMqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 07:46:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237883AbiBOMqi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 07:46:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5AC33E;
        Tue, 15 Feb 2022 04:46:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8E06B818F1;
        Tue, 15 Feb 2022 12:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA8EC340EB;
        Tue, 15 Feb 2022 12:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644929183;
        bh=3fLrGDk3Xw3Jm5QbJ6pynEJiF8xk4Fr8Cy2/Hh31CYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OOKbJRsRE5R/vyBy0Q+iZEeSmhF42FRVs6UhTZNUruBwjO8FUj3rDolCjOgRTQpLT
         mMrx19HLKEYCaIgXjS2xEV2L55N7gJ2ooFG8waLCeO0MX/uETGjIoWnDudbOqC2IJH
         yAPHtiBXYB7QvT3v+9pgVjMK/RhlBazmZncqTejn9yHLYSh9gVdCi5cqtGSllTwYpT
         yvnLEN59QI1ysIDuKmmoJ9u7ZbU7iMDg2HZ84jCURjJQ3Kiymb9kTPP9atqWWzmDQI
         GgP+2+d7XH1FdBNSyeyt8bd9F8P9GlS+D4wbalZEbSZzc09dI8XI+m9HTv/zKHFzuX
         KquatsVRTciiA==
Date:   Tue, 15 Feb 2022 13:46:16 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <YgugmDb7h1mhEqm0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
 <YgEa/blO2UMzztCq@smile.fi.intel.com>
 <YgEpYE2VNc05XhpG@shikoro>
 <YgEvEQ7BRc4KhOcF@smile.fi.intel.com>
 <Ygtt8c+s7LiAuI6C@kunai>
 <Ygt2L/WkJ9rCe3XF@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9YhSN8RjZQw+69V6"
Content-Disposition: inline
In-Reply-To: <Ygt2L/WkJ9rCe3XF@smile.fi.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9YhSN8RjZQw+69V6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe we should orphan the driver if no-one response in meaningful time
> (let's say till the next merge window)?

Yes, I had a similar idea.


--9YhSN8RjZQw+69V6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILoJQACgkQFA3kzBSg
KbaVJw//VUerUGgcK+sPuSvcKdk99SBRIHVpv58EWGdN9KLD5VxvJuhB6Os1N5Sh
CxvU1t/ravSAqjRVi3bnp8KicYXgh85WOcJtd06xP7QU/Jy/dM+8OeQzpaa0ejJV
CPdGnMXCfRjtaU5ZiPZm94ZtsAfXwXkFll1KRaPBvnQ/XLXE/jkefRUHV5hztMDD
4Ij9lzujI+iQDauy3lmPT0oGrVM+6S/bqrMkYthAjAoHgegP2oK1638y6oZDT3rq
wyZJzO0tODXvvKrZP54+9GXBbCdSeBbqkmighMRFmhz4eMwWsMkMNI0+sFqirt9W
yw+esnhH83fwTRQKFpgcTK6NUUnO1FZwjhzPCWWn36xfiu8WuK54m/DkSLDvPsXu
pHNirVtBqbb+xoA71D9neRlrMjTNH0eQerKHtWpS7yP4uCWIQCYTXbVj2N9dRTcB
USHh0gZBZHSdY6lj/CnxsFGmRzYgQMvR3LyuAPJK5P4iDEKQCEg+f7DszloiZsAq
RwsUH1y0p4yjXN5dZaDh6Twz23dGtqK6jRlPzJvkaXNlmQyRWT+5vor1SxB3nIsg
ZZ5xtXZ/0orN3ScoSJnvujAqeOqon+w9gnli1W08TcjtRWn8jGqFmp/RTHUBG6Lt
5Jp56qUk46PB2/fH5jVpcpp54732OisAOgaZENfZ73oc+evTh9o=
=7xqj
-----END PGP SIGNATURE-----

--9YhSN8RjZQw+69V6--
