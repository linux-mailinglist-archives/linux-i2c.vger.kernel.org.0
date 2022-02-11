Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6099D4B2828
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 15:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240344AbiBKOmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 09:42:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350970AbiBKOml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 09:42:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD038FE;
        Fri, 11 Feb 2022 06:42:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72C8DB82A7D;
        Fri, 11 Feb 2022 14:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E30C340E9;
        Fri, 11 Feb 2022 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644590558;
        bh=s/pTecxpwPSj1JZATHAN1IBVXRCtptKD60t3I7oSlqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=snJW3VzLM7MRYLPyHK6bOjNsF0pJgsZEYVeL2SDXyz0nEq0E2BpVKxFf9iKU05R84
         CIKst0p0ORyWeHofL0055LQWu6oKhXesdl1+DARzMqkMqXcMHmKasrYIcmaoyoe2MB
         Y4M5OXbbgVoxzw7pOiEPuoguicEWGR9EMpEkd5lsFH2a1AaGL5C3Z5JJMA0hqF8qG/
         y3B0dxmg4gR/OhMaDLVC6fJVD2SsV1jKrkroGHNZpEqxfnsTfRKJ68WW90hrPtHZpL
         KlaOejDBFBjGE7zYqwdAeuAdQ9IqguJ4A/s/eKzNdBZ1rMIwLPhg1+yDeRIhvF3L+1
         jq37C/BFH6YuA==
Date:   Fri, 11 Feb 2022 15:42:34 +0100
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
Message-ID: <YgZ12hCMUlqtLKD3@kunai>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PkwvlxkbgJDsTi5p"
Content-Disposition: inline
In-Reply-To: <20220211105322.180ad89d@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PkwvlxkbgJDsTi5p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +		if (retval)
>=20
> Missing curly brace here, breaks the build.

Bummer, need to check why this wasn't found by my build-testing.

I fixed it up and also rebased patch 6 to my change. Terry, please have
a look that I did everything correctly once I push out later today.

Thanks everyone!


--PkwvlxkbgJDsTi5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGddUACgkQFA3kzBSg
KbYvmRAAhUdcWN2s+goYkycnoB8cDn3Ged/czC8TVpwttDTjs+hdb2sMrw+WZE9R
Tl1mW7AOUZ3HYfLVLOoZr5BAwyrFcBDTgSEk5SZG++Av1ne7swb5T8fvzwz6X/Kg
L4MK4H7wHNK0lGP+fsn/sGuNbVzmO8bW5LajApo9azHGQQhoSPdmnWsEmNJnodLt
Hz8BPkmXtw9jxW1enPtztPUR7xJXJyf+KrIivFo57c6SzNGQJZ+5l7QN/lqWoJ1d
Jz8eNlH6bJCgBNSWPij9VyagyzPc+3wgD163HoYVtAEnOX8HEWt2aLVMcia0tV24
q2cmK1lc1Tqc5UF8sevvz1ArFopUoaAPALrQmm7ehvtYbfOS7uUSVIZmOH8HosvZ
giMNF2EKPi/i/t4mfAtJez6359AhpMup20sYZMajS0GfhzmQF4oZh8Fe0czu1qaV
2v93Uzifvcy1tFtWKquzNHyBBH3jd2qwHyGkKbFmwj7Br279aqg0S1knB+x44e/O
6Zy7wkoflBDBvoRiSKwMjovE5GFPdWZ2/DWwkcjee6aIvLYnvKTch+PXmDDP2/ul
aMBQW9o74Wqfvcbn76/W27RRFjoEbTFidWpm2cxpcyQDukjlM7gpl8pB6ij/7K1H
HdgOIjCB7yx8QE5srVZC++8lj+Ff1PZ2/sEAMj9YCJC3OP7S7rY=
=5oBw
-----END PGP SIGNATURE-----

--PkwvlxkbgJDsTi5p--
