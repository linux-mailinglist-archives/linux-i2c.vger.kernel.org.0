Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7AB527163
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 15:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbiENNoT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 09:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbiENNoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 09:44:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDBB2315E
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 06:44:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A838060F00
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 13:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8179EC340EE;
        Sat, 14 May 2022 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652535857;
        bh=eZWI+Szkgq5NZXPq7AfLNcFKcxshUglUYk3iist48n0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arjOBfYHlUcwui4tG2nGfj3MnH4J92VHDGZ/NaxWZPSx3oRpRWccQSjKJHNwlB3WO
         xISSF10J5mN4B/eUee4ecS5wpww8kEG+jOAj27phnE0L5J/EYcsFrwPNfI2fhL1NDp
         U3WxXgvZ1DtzMA/n4P2jSeDwjd4K86yiaUX3OpYjXhKV0FNKYPXySreQTLLYJcyBER
         hWCFt2woBz0upcNW1m52ST7VxP7ms5ZbagEA8nm6djs0oMf0sIbgKOfC12ahIeHQmQ
         mFKd7EcrkBsF8VPvIF43oSiO8CLUa3yqu1qHq+5UcwDJkn+B7t0czas3HoR/mNc0NT
         08yuM9HXcg5Vg==
Date:   Sat, 14 May 2022 15:44:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH] i2c: designware: Sort timing parameter ACPI method calls
 by the speed
Message-ID: <Yn+yLKBRB6Fl++sx@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
References: <20220420125802.352306-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2uqtVc+wmPa8RV8k"
Content-Disposition: inline
In-Reply-To: <20220420125802.352306-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2uqtVc+wmPa8RV8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 03:58:02PM +0300, Jarkko Nikula wrote:
> It's more logical to read these get timing parameters ACPI method calls
> sorted by speed categories in increasing order: Standard-mode,
> Fast-mode, Fast-mode Plus and High-speed mode.
>=20
> Originally these were in order after commit a92ec1746f10
> ("i2c: designware: get fast plus and high speed *CNT configuration") but
> got mixed up over the years.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--2uqtVc+wmPa8RV8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/siwACgkQFA3kzBSg
KbacMg/9Hc/PSfa0/SqqOQIhOwUx6jFjafp2NfKbPnTm8GmiW644BJZPEPzG/kVz
QGPZChVzxxAWPFe5IXiZjammtGkptt8Xlcjg3iwHzJ+p7+bql5D42qevvllzc83H
rzO9e2UVa4fN5I4/cGhsSwOqoKSI6vSbFjOthf7lnuOTScmCqn4Q8qsDR9MQutWV
5p6RM59A71vrfnAU5L097JPyqi6L5plogl9FRw7k1zzU/adtSIR0guUwiOSAnDzy
kEne4/TUk2rl/PlkBx+fqSS8xApyFe9cd7GyPvoLaijmXWb5ZHTM0O6lm+uOoJd0
+RoHl/2fEaUtaRYExHKZQvmkcfyjoB4BXQ5hd4EY2u/zvaMU8kLOst66vJMKG5Dl
VMAVcWvdiiRelrG1yBdAIqKHVb1NOI72XfysXl3zgPaQu0E1iLkV+flMU7fE2Sgs
FB+HLfqmtrDyRpbao8D6/a30xAQAmOr06VUNnGELVo0K7tefgMCP+8WRAVj+MQEN
l8unvfaEVrW1rrwpDg5KfbZQbBdd4YvjMzvJzh9YZt8m2BgeCnr+MDQh5lQAGIFQ
UyVdSA1fb+8Gdi3ezue8hQeurRp3jT1LzBDLLwuP6tjS6RHWszGFzTa0Rr9BIqDk
2vtKV1zDbmh3Or8cseWQlQwT/kOeXtTu2b+KAAEeTEACPp8ThXE=
=bMPk
-----END PGP SIGNATURE-----

--2uqtVc+wmPa8RV8k--
