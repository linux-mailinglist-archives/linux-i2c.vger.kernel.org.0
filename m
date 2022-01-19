Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1592D493F49
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 18:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350551AbiASRrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 12:47:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55954 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbiASRrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 12:47:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4BCAFB8198D;
        Wed, 19 Jan 2022 17:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D94C004E1;
        Wed, 19 Jan 2022 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642614433;
        bh=tC/6ZKe3YvJDAJ1UvqdPOgvbwNb/l94AtpaoPQkpWOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WmK/eyceOAsQowVGoCD5/UhMBzfIairTuVU99VFFU/1WkoI7SDbZtOXmMrbRz9moI
         bHAKBO1SSrcE9De+FViDWve1xtVx0sHJrR0Szsbk8e00Hi5Lypv+TGxC2uhfrIsf1C
         HfuHQfMXhKJye6j/6/xG6qoZdBQ4RG7EdQhxWx56M3h2kyb3nyXMDtgJI3y8/o4cNT
         Il0sbNCuqUpZHJH/xx9N/AZcE3Zc/1wBcOldwg87DW1tjWsObG6J9r9riFdejLfo+q
         VX20M/z/YyeQXqNunECxDMLl2+4wpFP611YENT+x2hZWN9TY9OVPNAqLqmZVrBYKlk
         sAv+HQ7Cv5Ikw==
Date:   Wed, 19 Jan 2022 18:47:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <YehOmuqA008XuBHI@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <Terry.Bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220119163012.4274665d@endymion>
 <dda39f1f-b683-35ac-d810-d4759c4f8448@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UVnt/mNVFlP1bmJ/"
Content-Disposition: inline
In-Reply-To: <dda39f1f-b683-35ac-d810-d4759c4f8448@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UVnt/mNVFlP1bmJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I considered sending the request_muxed_mem_region() patch series first bu=
t=20
> was concerned the patch might not be accepted without a need or usage. I=
=20
> didn't see an obvious path forward for the order of submissions because o=
f=20
> the dependencies.=20

My suggestion: make the request_muxed_mem_region() patch the new patch 1
of the piix4 series. Then, the user will directly come in the following
patches. From this series, I will create an immutable branch which can
be pulled in by the watchdog tree. It will then have the dependency for
your watchdog series. During next merge window, we (the maintainers)
will make sure that I2C will hit Linus' tree before the watchdog tree.

This works the other way around as well, if needed. Make
request_muxed_mem_region() the first patch of the watchdog series and
let me pull an immutable branch from watchdog into I2C.


--UVnt/mNVFlP1bmJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHoTpYACgkQFA3kzBSg
KbYHhg//SrzTpB0Ic8R2KsEAehSGbEd1m2zpvHYothmTU/oitfQW6H8cO9nbZ6kU
gnLvTyW24x+cs5j1YvBh+jWOrX+IekGbFbz8amxsFIpwH0VTaNuuYbkgkMDFDiuW
HDGsQ75IBgMh0DE/ce1b3NAd4ZR4v8EyKoLYzR9EO6yeHBDzdCrwkP1ApOaVZH2v
Afds7lso+45bQDnOnjGS/VNwY2YYJwK4YM+njJok9RVNtqeDAfpkQEXVwyvwitIY
RzinrFRcCZd3rHFqvftUMkR/Jr2E7o+UZbX8vT6LlZnQI/EFNpfjEof33/Zw5Sy+
vbvPqhYQNMBhY8WFkoFr3orZBs6CzgZjUYX9k4mH+/Bc/GyOW2lcSaS13o1fftg2
xlKgEvytntDr21U3lnmuAxeSyCf1AKlw1SWT+0mgII6DPWR5gwDE5eNfO+s+0WL0
5jf3PEIzWJISdzCZsdR1D8Lat7taXvVh6INnSqqvzVH/xup8tI8ZSc5yFTdilzwU
SrwX/t6pmnsCM6OxRGdBeez4WT71XoGPjPhfJtulPfh08LAjXXwdNtYHBsYSLqml
dPsom+hs4d/eIBzc2JVlpesV4IRYJqqN1DYUQWa91AKgBfQEC4ymnEircrvYLAkQ
MLExeleuTVPDuZcsf9vWd5NdMq2euBexU5bw5WGRL/wHdxrGoYE=
=1ffX
-----END PGP SIGNATURE-----

--UVnt/mNVFlP1bmJ/--
