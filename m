Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA42D527186
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbiENOEA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbiENODy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:03:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EED1645F
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 07:03:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B3EE60ECF
        for <linux-i2c@vger.kernel.org>; Sat, 14 May 2022 14:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098D7C340EE;
        Sat, 14 May 2022 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652537032;
        bh=dUehTpQsDzTfMXA9wEM+I+M/s8TMqQv8Feft56j5xms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XP/m4GiiXzYttkYDJ77wA+ngMEqv57ICG7IMNKgAmyEqwr2HLn7gg/vmismv80ajx
         rnse01YFl+MFUYyVA4ELp2EO+0m31A/RoRAaQTO2eB5onjHgFMyv/CTRb/oAhJ/lqb
         uDHgTtcH8KcsW70n/NUVD+kARn4TjnZUTAFxtUuZ+ermZSpIeEWQXtBKgplwdag6A5
         95hjAK+NmNGnStCV42wonL3DwmNpmH/UxSTb7BeIo4A6T93i57vx6gb9X4ZtjNVEEy
         udvM1TfPJKZCtj79VuQVvLiRfnVlvHlgRpGcB0+zqCy31v49xhXDJPKGgDT/nU224p
         fhFmi/CVERABw==
Date:   Sat, 14 May 2022 16:03:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
Subject: Re: [PATCH 2/4] i2c: xiic: Fix coding style issues
Message-ID: <Yn+2xF0/h+bwRC8p@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com, git@xilinx.com
References: <20220420075924.14546-1-shubhrajyoti.datta@xilinx.com>
 <20220420075924.14546-3-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5cAGBK0bcrr9MLi2"
Content-Disposition: inline
In-Reply-To: <20220420075924.14546-3-shubhrajyoti.datta@xilinx.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5cAGBK0bcrr9MLi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 01:29:22PM +0530, Shubhrajyoti Datta wrote:
> From: Michal Simek <michal.simek@xilinx.com>
>=20
> Most of these stuff are reported by checkpatch.
> But fixes are:
> - Incorrect indetation
> - Missing blank line after variable declaration
> - Additional ()
> - Missing spaces around +
> - Missing parenthesis when if has them
> - Newlines
> - Remove MODULE_ALIAS - none is really using it
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--5cAGBK0bcrr9MLi2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/tsQACgkQFA3kzBSg
KbZPjg/+PPCQfww3cSSvuHcGf75cGO+NNZKVmPhq+hCwKDaWVpueA5CNe6B3fm2f
w6k3Lqjy2TyUoFiLGcI1aCnBrCIUG36EHTHDR04Xhmx2tq6uathpDxZWF4GoNKHe
RO9NDNN1nuwhfZ+5hL/qWQB3DbM0wSu6XczqAmVC7LL5S1HA1IYD0U1oukR5b8m7
r5hKV/lIGCPVGrwe9/4CmhoSK2d1vn3vdXcBdKj3LC9DwE3RhXeypvdkwgJJpH+b
1AD9sRypieXm7pFvZwerCewXBo/mlSrGHIi7UjkyK3DeA36C1NHvof1SeU5CyQc+
5StsFdG5pPxNoLcOOGi6vRVbhbgMpSTnAtMQraStFCxRy/tkgrpRIsWSpNeexoXi
TFgCS2VN658gs8EwJImVa1XrFzxoRka5LpxKXovwlB9LRhzWNy4s6aibNl74ltQX
1JaKvgpdNZ9ZwdgKeMTbZG2Jhw9fNiBHQZBRMo5AQLw7XIPm08ibhB87dOMybBI5
RwRzp3o+EcSoHqE/7Uoz864VC8UZfBwYbvDRV3db22o5cygn4jvNkryx9jiJABlC
sxsC+PQMtwrS1FTDm+LpSOqirA42AZdDc8cXsMD7hVDBA8mx/EdDDWblTlfpw6aU
ovNPqK2KmEFkIw1z20K6+DO6h6jdsQq09nJi9M4Gt+3Fgv1fx1M=
=n6rI
-----END PGP SIGNATURE-----

--5cAGBK0bcrr9MLi2--
