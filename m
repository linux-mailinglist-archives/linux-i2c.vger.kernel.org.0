Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835DF49401C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 19:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356895AbiASSoL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 13:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356889AbiASSoI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 13:44:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B17C061574;
        Wed, 19 Jan 2022 10:44:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 87ECBB81A88;
        Wed, 19 Jan 2022 18:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC6DC004E1;
        Wed, 19 Jan 2022 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642617845;
        bh=BbszLFpC1Ue/+uWQOvLvyNU0J3sb2Vs5LQa3Gu5zVvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AYfjYRVA2ucIr0QDG6Pk90jFJAwY043Y2mCZvyUUegt3Un6th8GM6a4unw9a4bC3Y
         SacoLtxxHvlprXtJxkWaeIXjylPeyZNLdZv4Lk0Pw8xKzVimAQCHQ0H8ZLWdT6ysqz
         0HyrHho/qpFSfciSPHseL76yeYTnzDOwTapJU2fKB6Sc0ih4sKstFafC3Reg5C47nT
         L0EVFiSW13nRyFhI062VHAw9fS3UBKyETQ6mqXC5/YjZmQeiNMOT6pI/jfCnRA8SFt
         ei+NBphDb17Zf+UYXnKEWyXcmwXYf97LZ4kZ5yyvYCC24frSzPC0dV776ttHOOGJ9R
         tN0B0FjEbJs+g==
Date:   Wed, 19 Jan 2022 19:44:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Terry Bowman <Terry.Bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v3 0/4] Watchdog: sp5100_tco: Replace cd6h/cd7h port I/O
 accesses with MMIO accesses
Message-ID: <Yehb8h+C4A9/c1Z5@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Terry Bowman <Terry.Bowman@amd.com>,
        Jean Delvare <jdelvare@suse.de>, linux-watchdog@vger.kernel.org,
        jdelvare@suse.com, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220119163012.4274665d@endymion>
 <dda39f1f-b683-35ac-d810-d4759c4f8448@amd.com>
 <YehOmuqA008XuBHI@kunai>
 <160d12ca-8493-7536-036c-9dd5af7b4ce0@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hVnjJj2sOhpzsCBJ"
Content-Disposition: inline
In-Reply-To: <160d12ca-8493-7536-036c-9dd5af7b4ce0@roeck-us.net>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hVnjJj2sOhpzsCBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Also, if the immutable branch only includes the patch introducing
> request_muxed_mem_region(), the pull order should not really matter.

Right, good point!


--hVnjJj2sOhpzsCBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHoW/IACgkQFA3kzBSg
Kba/HA//aVEDzV0cURi59julvcPSNd+S4bo255St0hZj9zUJEiScLukQYnlmY41L
qMJDQG+XePJpSEJJRrhoSxYslyyoV1udifmHdMar2CJyky5e7htLd3yL+XeHgy+b
l6G8JDFV2LdOlv+UPH6GCB+bt6bxhuloxslkMrKaUxwARWZvn9eIsV53pZMrRdXw
MtXJaa/m5PCu2rYBXqR0bK6JF334p7utNumngeECn/Z7gSHD2p5fI1MruaAnQzXq
LeBFDIZ9fU8vHi2v+slR/Cskcv5PijRaq/d2vnCaFZ00BUGWA6vEMdvg01q6fBm0
WdoUXsEOP+BS8v48kU64Rjgw4WG5rHYsNzadKhsuzSokkGOM6NNJ4Xwr5i3tML/J
2syLjil7ebjD6X5rwdMABydE+2T+MYapwod7PCZcaSaPQxQ/qRKPnW/L7C5mhtrT
GNO1MKO7Ov3vvJz1z26nhS6w8w3IG3IAk+83rGhDDnDJ4iqv16mA/V5n2kJXn4o+
uhobKjs3aHwj6coTBNy2FACt5Cu3+9PW7VT+nuLu+2FNld+3wMclM3satZ2HWucK
CQ1YM0o5DR9uO+0bNpRfsxNjTRgVQrGXsSqrxUqvgcHRVAFxqckmcrJ7sToK1LUE
LpfbeYvr1c5UY6MwmcDMaM+E1zwVHClou2fByOLBUuskroc7WE0=
=CW1X
-----END PGP SIGNATURE-----

--hVnjJj2sOhpzsCBJ--
