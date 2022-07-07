Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A2D56AD32
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 23:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiGGVIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 17:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiGGVIE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 17:08:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B8D2CE3E;
        Thu,  7 Jul 2022 14:08:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4113BB823D3;
        Thu,  7 Jul 2022 21:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19976C3411E;
        Thu,  7 Jul 2022 21:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657228080;
        bh=IHYd3/+BAYO09zmG6R4QzH1Cte/DJJmuroXS4ZzEAY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BnFdqOEI+YmchZbHvoz5icO8LTH87zKJpyNi6Q2tKnpDVEYMGo44KH4sAgoIZsUUE
         8R7lHYrZYyKKWCwr0RRG8khpcveIOmJkU2q7sUHpiP+4Qw6P16p2Uvqp+8sVBhaM7+
         1YleIDNOmVo70j1Th4Du2jgvDGoT9f42Ud3dLNhL9u8KciQ1Yh+b8MivP3oBGbuFll
         c1niHVeW/lb1pPylkDg1YBRIIsDF0zoa/SGt7Q/WOCvTpi/ZUjJ/9jytlM3CTEMA6K
         4BReTKV+Yc3GjMluwKgVjK/DhQ8lWBpcCKc8C7oOJVxA4qiHkqdkIqKX8qRJM1YWOZ
         /Gpz1XfTOrN0Q==
Date:   Thu, 7 Jul 2022 23:07:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Satish Nagireddy <satish.nagireddy@getcruise.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, lars@metafoo.de
Subject: Re: [PATCH] i2c: cadence: Unregister the clk notifier in error path
Message-ID: <YsdLLKh8K0UDsJMu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        michal.simek@xilinx.com, lars@metafoo.de
References: <20220628191216.39459-1-satish.nagireddy@getcruise.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p4xrYuFtbIAeIRIg"
Content-Disposition: inline
In-Reply-To: <20220628191216.39459-1-satish.nagireddy@getcruise.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--p4xrYuFtbIAeIRIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 12:12:16PM -0700, Satish Nagireddy wrote:
> This patch ensures that the clock notifier is unregistered
> when driver probe is returning error.
>=20
> Signed-off-by: Satish Nagireddy <satish.nagireddy@getcruise.com>

Applied to for-current, thanks! I added a Fixes: tag. It would be great
if you had the time to provide it next time with the patch.

Happy hacking!


--p4xrYuFtbIAeIRIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLHSywACgkQFA3kzBSg
Kba94Q//WTgLnz0z7JaTqqoTwfTrHgEet3+D3TSf+9lrrkcp7//I0jpB/xiqd2aL
eisKE6lKbK2pfxIGYxxzr2SVdfk8/vfM0RCDULD/ZjySGkEENEO+rpcluxwdzmFS
qAL8H1hYVikKXA7vOgfoPTJDC5W/4dy94NyRXaCKTR51NKmbQQ48Whc9YoHg34rp
TfaQUQlUfjNWzlaPZD5+l3QlmIjfPnuKSjrcRlsMtzi/O6UzKKNH8xMoyt287yf8
xmWcSa7jQ4BQvefQpxvEX7wB6fvMMehoPvk1jpT9NTC7O/Ntab5KI7tTvD6zAJgi
c3O18N4GqJSpluCVbikVySSirXjlCTsV6fDtLWz2hT7ipffN5brCo1TJNV/ssv1x
iMjglQKvklruclBGoU5B9GVktwERLwnRsia00SdXhHAlInyv7CpN/GfEqcIXepA6
FUQ1Sv0ICatLqyTGn19AOk9Kp8er2xGnRah0IFhTMkQ8JBCL1q7bkCe7sVfY1dO0
Sra6GSTqkY3/sVp8EAPNKfd+kfilwt3Vl+k1Mkwi5ZEuIqtsPjz56vpUKB1Rb7ms
ozSNz02NGpi6fJTGNwBU/nwJI8w85yhZWM1vXk1wkyJOElQdEoHSVJna9jBlZZ5Z
7eDtV2FG7KE98sB42WCgwvFhnMtK5IGeWcIy9fXh1zU6C7T0zeI=
=FF/v
-----END PGP SIGNATURE-----

--p4xrYuFtbIAeIRIg--
