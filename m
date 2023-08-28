Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A76F78A578
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 08:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjH1GAk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 02:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjH1GAg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 02:00:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CB8122
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 23:00:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B45106009F
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 06:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DFBC433C8;
        Mon, 28 Aug 2023 06:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693202433;
        bh=GMo+p4UBjT0TPNZNg+gW6mF/Yd6QBYKiBGNZI4mchow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OPshPlzDHlnczkQ1ZkxtHrka3HpSn/FxOcSXznkQU7FSY7Jp/Yyrrj3ncxZYJSm1N
         NuOeLZALLW8uHQjcUVaNQm97uax+dNqw73flnbW4VHcZPlGjyZfHeNJqx2JIGEVwMU
         2Kz1V2b1d7+XbHIQmIDs6nz8hiBFQ75Wwr+Sx4iq3vCmtO5LEK/KlBZ5ReS7h9R7Vy
         f66TBAIBc3AbciB+Fcbz2/HuicP0QInlm8fnMdwdn2z/2gwer7ZtZRUul0DgAYdUDw
         EGviDGF5sfPl9sZQ1GISyn88bzEJ3tUTxg1bJvBij6/Nah7poALQSMyBBxspVoVhnS
         GMmOehyoYio6g==
Date:   Mon, 28 Aug 2023 08:00:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Hu <HansHu-oc@zhaoxin.com>
Cc:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
Subject: Re: [PATCH v2 1/2] i2c: wmt: split out i2c-viai2c-common.{c,h}
Message-ID: <ZOw3+3njP/p8Ned5@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans Hu <HansHu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
References: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
 <fdd2968e0ae028ce3d4cf389e4e2d55a4641c0d7.1691999569.git.hanshu-oc@zhaoxin.com>
 <ZOkI62MZee+3HR6n@shikoro>
 <744e7a46-066f-738f-69cc-9f2374be2fba@zhaoxin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F0f8IiZsR140bw1J"
Content-Disposition: inline
In-Reply-To: <744e7a46-066f-738f-69cc-9f2374be2fba@zhaoxin.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F0f8IiZsR140bw1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> 1. I checked the MAINTAINERS section related to ARM/VT8500,
> Found that the entire ARM/VT8500 ARCHITECTURE is currently
> unmaintained, maybe one day it will be removed from the kernel.
> So I think it might be better as a separate module.

But even if we remove the arch, we will not remove the viai2c core,
right? We just remove the Makefile entry for WMT. And your driver will
still link two object files into one kernel object.

> 2. In addition, if not separated from wmt, the driver would
> become a bit confusing and difficult to maintain.

Ah, maybe this is the misunderstanding. The seperation from WMT is very
good! It is just that the new viai2c core shouldn't be a module itself
but only a seperate object file which gets linked into your driver.
Please check the octeon or pasemi driver for an example.


--F0f8IiZsR140bw1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTsN/cACgkQFA3kzBSg
KbZjRQ//Usof/lyyrKg2j8e5LRw6z2ARIZOsXY0GMXx5c7hCsTOLSxTSd5Z9+XK1
eTt8owWLilWQ1h7tV44iELzTYaPrsVxvrEPMMgoMc4LFCZcgMA5gVXMuZKzvgjgZ
xlM+WQl9IZGqclUwh0H19Ayt2wrKcKezVDVI1rNOm0IQj1qagBVWXUadDIPyqg3k
0JEGR5GmJQ4vIMqkHxdzqq03I8WGwUN3a9XSlKJLaLyqGFQHLp0BSvHALpoCg1f/
jMhzk9I3IJXzOYRls7V2UGeCYTqGMOoq/KA0NlxE7b6kiu3xSLZ3lv7MLOo0zp2+
JOT92rnLVMkuXPh8cs+yqicDD/n8WZfSxAXNsMo5EfoMTno9m87LPYXQ/269PLje
7KYD/Z396VYz3uduAhjhIwhaONHZboWluvYKAzRCXXxJv6yt/I531F5S1+H/Zeg0
BS8kQbQHbawn3Bbk41VoecIkCokPHAZVCtUOeBuVvwYHQdPpSYHwWywQxqaWtIAh
jcvEUfUR/hLlI5mWlpATAAZaWXO0tWEvSABaT0k3KdEhEpKMx+ne6E65lNytMhFE
FVB2sVGeGGYs0TDMUju+wO2u87Sg5FyNNwVQ7RFagASmCmcZWGia5N3A8QjNHYNw
lE9O4KqdPds3PDTZdOvHfJpy6/pa0nt5OGWvJ3iqQFb+DFeMiIU=
=bJSV
-----END PGP SIGNATURE-----

--F0f8IiZsR140bw1J--
