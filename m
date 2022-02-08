Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC8D4AD619
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 12:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357409AbiBHLWj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 06:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241148AbiBHKAk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 05:00:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17419C03FEC0;
        Tue,  8 Feb 2022 02:00:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CDF5EB819AB;
        Tue,  8 Feb 2022 10:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED53EC004E1;
        Tue,  8 Feb 2022 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644314437;
        bh=/EVO0w6FQFj5asojcZ2lIA+GPq+UKvGakluFW5lT05Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2udXZF+HT0/I9loiyX8/AzqNaL1OWfK4J8EjZq6DjjdHZ2/11eLbO6frIeZIu33S
         Hy5lewdhxW8CfVHX81cWWaS3XmnC5E9nwcB8D9iuFhqFOiLsphGC+s0YhdFxEVU7Yy
         nAE1MiCSl/S/pclWcAjnwNtgNaTAaKmIJHzKxFTLpuKqFy8d8KsevLPm8Y25iUcBzx
         AtA+INFZ61O6sFk9okKBn9o68+oTQVhtg0v7fFmZCFROjzrn7qw43Hliw8syR46KRY
         8Izdh06wV1ByW8zRctXS4l1y5Zulqv4NBsBoXhwYzfegZkkTL5mew/0x27AFInq+50
         aK3xLplXx4dng==
Date:   Tue, 8 Feb 2022 11:00:31 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <YgI/P754rQyA9bpM@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130191225.303115-1-terry.bowman@amd.com>
 <20220207134416.72c22504@endymion.delvare>
 <YgEYjOwoxtbkBdfq@shikoro>
 <20220208104535.468198f0@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q0Glzg16kRZatCQk"
Content-Disposition: inline
In-Reply-To: <20220208104535.468198f0@endymion.delvare>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--q0Glzg16kRZatCQk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm still reviewing these, sorry. I only picked the first patch of the
> series so that the sp5100_tco patches would build so I could test them.

Ah, I see. I thought more than the first patch was needed for testing.

> I hope to be done by the end of the day.

Awesome, thank you!


--q0Glzg16kRZatCQk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICPzgACgkQFA3kzBSg
KbZfzRAAn/NhuAQ9XO4IKUKwhKXnjb2BJ33Cj/JiUXTCraD1/EgcFOVs64qbKCn7
hnJoxc+yNx8J/PJa9dJZdakp7OPkdFM2szDd2BlQICZmzirLJ2fecokD2XpfjGg5
Ip+eSGZ3xmgh0hDviztRwjfvqbVllfurq4OkcWXB6gmlfUp+ovaWSbdq6Z/NU5ks
KR7FHp9eQ+gDAwNwEgcHvHVE9XdUcw5MMMyBgIg40jxtFAPAjLLYw4+xFyEzdO1M
Q0q8ZZj237op6bxWS71dE1lwCwUkzy/oeIf8THycoovgopG9jr469IQhd0lbaOBB
0oFdrjXnBXgmmeif3ElNJAr6/2lwcEwfsDQibdWklPBrd6DB4Ou9GMGPoIpIQWGk
hqghie31jBSzNzvmRnDubSshQo7dUqdpSDXHIFjK/ddvh81gpT+EWSJ1++OvhcOD
+2wo4BRqHNAvqFYZtDhY6wppZLUyzck/bgvvntG6LBTk7PhIlTCdk3qJMCM5OwB8
LHqZHavUd+lmVgJ+8xFLqGn0b4swAtcXQm6j68LWiTnsoDEVYoHz4rqCeKyf3RXz
MRq1qLh7+mvBF6+3NuqF0iHw3LjBpb1n5iPGpuOMvXphEgmjKvMIXxAEejxeHfUo
tkKDDiQ96WlnLA594X0zYotQFflWlmo5CWpEryOre9IFeH1Za8w=
=wggK
-----END PGP SIGNATURE-----

--q0Glzg16kRZatCQk--
