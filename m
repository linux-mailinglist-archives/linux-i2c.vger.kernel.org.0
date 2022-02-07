Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A961D4ABF27
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386957AbiBGNTl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447408AbiBGM4x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 07:56:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF93C043181;
        Mon,  7 Feb 2022 04:56:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4793661123;
        Mon,  7 Feb 2022 12:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD66C004E1;
        Mon,  7 Feb 2022 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644238611;
        bh=8xgMJsl6httlwP/0dJYgn5BHyLzJK1hTK6WwcDbk8gM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ln6QFa642uBptjmCoJaPrIwBhwHzjksqi/8ZYGtnGXPJ5RbaOeX2CgXt5M6YLGv/3
         PjMvEwILR41IQWSXddMktTcSgPZvUy3J9g8qavzWpobqsit9w69wc+eLjfRGXXt1s2
         RSp+If0YZuQZ1qCsDz5jjhnHgSn0UCzh0n0DTk48XghpcYynq1yDZ2LKEjXAXM2pCQ
         aj2thhyUGKdjZpaOl/V5T+D/Vww8tAY8ijq399ywdZ5kCQtVmIB7MyZs/2XPQRyENw
         WPt3P1gdfuDY0qs8eRPElT0Drl+gd/loo69MvrX8BSNlaUuB+VyHEvPv96apC+lyBG
         TiyGhVqb4kS1w==
Date:   Mon, 7 Feb 2022 12:56:47 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v4 3/3] i2c: muxes: pca954x: Add regulator support
Message-ID: <YgEXD4eTK3gB1EzM@sirena.org.uk>
References: <20220207092827.104978-1-patrick.rudolph@9elements.com>
 <20220207092827.104978-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UyFMJwItiuRhtm5G"
Content-Disposition: inline
In-Reply-To: <20220207092827.104978-4-patrick.rudolph@9elements.com>
X-Cookie: Never give an inch!
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UyFMJwItiuRhtm5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 10:28:26AM +0100, Patrick Rudolph wrote:

> Add an optional vdd regulator and enable it when found for devices
> that are powered off by default.

Unless this device can work without power this regulator usage should
not be optional.  This is just removing error handling.

--UyFMJwItiuRhtm5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIBFw4ACgkQJNaLcl1U
h9A1egf9FMFSaHWLZsE3ryRLlLWyRHTjN4R2PxElpm1jq3pj0VHsVvILflBYg3TU
GVL/43pbgQ1rlKCc7gI79Wsnqodp8io8QbKVd8h+8HgE29sUQ/5V9MdsT1vfNDhS
stkN5asRMsh8+qn3JatbyNSoxT9MMRAcwYrkjjTxlG5em9Bg71UeDgUV7mhzsPP9
3c3+vSDnsRxnwqUdJX0wnurECFsPEN9sgXkwXVRpnBvnpqf8ClIbyO4ersSPDkAA
ZoPQl64D3cOwXqEhr+qoI8v/I8k5Lg63qSZ22Ij9OxaRNrex6ivNMmUA1uocinsF
gZzmWmXIgy6rUy3+o7e/pc89GaP4ng==
=BYgj
-----END PGP SIGNATURE-----

--UyFMJwItiuRhtm5G--
