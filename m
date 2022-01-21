Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E4749671B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 22:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiAUVIF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 16:08:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiAUVIE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 16:08:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C5AC06173B;
        Fri, 21 Jan 2022 13:08:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D4B1961826;
        Fri, 21 Jan 2022 21:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DFDC340E1;
        Fri, 21 Jan 2022 21:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642799283;
        bh=JSwH3CoHMuKOzdCQyjvnOjnv4VABo5eagECSCEv0DFw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fJuYhIeYpjKrwmAzP4/A9YtY4ww1sryOnsjA/6uCgv5NiMtF11yg8csgxrwXWPc7k
         B/iRmNT59ZZBJdyTO0mluPlfdLqnKM+WjJ7mEtX0ord2T0tcrL+24c/b+vO1fws0Ac
         DRXl9wrwddOX5Co5erLeNGEYJ2hgLnVncIbnOPF3hAK28vvlLklFk+CI4CA2GvmUvB
         3o2I77adCfuKd4Cdk8Z4ddy5Pj5fli6H1DfJmm65JjhIn+Mb31iAGQltDW1grKNyUk
         KHw3NemoVGlgBn5dCxzP8S0+oiKVEBcDjguEvJPHsba7Es9I9gskaAqyxpgNA0au9Q
         VRfizSnCTrv9w==
Date:   Fri, 21 Jan 2022 22:07:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port
 select
Message-ID: <YesgrUY/ekQmYsRz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <Terry.Bowman@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
 <20220119230626.31560-9-terry.bowman@amd.com>
 <CAHp75VcGmmRpRD99tFHd7WOPs6uyz3uWuTEoc=G+VmbPYAUvuA@mail.gmail.com>
 <846b8323-2ebb-90c1-d1df-b12a303206f3@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0gVTsJWDm3b+VhTS"
Content-Disposition: inline
In-Reply-To: <846b8323-2ebb-90c1-d1df-b12a303206f3@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0gVTsJWDm3b+VhTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Looking at this closer I find the added line separates the closing=20
> function brace from the next function's comment header. Are you sure I=20
> need to remove this line?

I agree you can leave it.


--0gVTsJWDm3b+VhTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHrIKgACgkQFA3kzBSg
Kbavyg/9GCUk1Sz4iZ8bX5qy7JmmVaD1+ofGFrA6gundM0dInlWRh5MeLpGY2uhF
pEqGFvkm/5D3WlQgmqoUl47pBRXAAHppQ/EMCcNfnCvUjB2g0DD7ObrNlQhGMv1q
MQyuzyVX1+v1m8yIFp4xSgeyVy3K6WRca3/9XBQmbCSugsRdp/fd+2A9GImKy37u
KhFDfYWP/uxU5gGOie0XLy/3s2PB/1un6cxPCdUiZnG7cfkIwaqBOeUmt9PoLG5I
BKQAGS2QRa6d6s2eaii5NEf+P4S5GVrAeqbo0DhmEWO906lWXnn2DEw2Enrq3tfB
T6GPB9UbOjBLM8ejx7rgvs5ha2UQPMHQuZIIAgSnt7QzB6WQ5Tu9HsjVYZozdQST
l5PGgJ2BT6uhIdC8fXW1yf8NUwP7icu6lvSje6D4itNegMluzVv/NrJ5Umzr1/Js
HwjqZkpBoGIBtUPL3Tx7Q4JtfOmFSpjcZxB0ZcM3hXzoXBkKia1V9B6JAnVY70dk
nL5zGYLtMqMqnsxBPn1d3j5n5u0qXgljMNr42+wXT3GxbaW1W3SmhnMD6pdzTgdr
/QhnpCzB09VN8lNYlnRd87VuM1naTwHPBgp5B982ujeqZII7p+9XDWPPilDXZaSc
fbCaYj765fNnyldY0Er8sFI/KTj1nhJ6EFZ2pp2PUBBEx1Df9fg=
=Yp5P
-----END PGP SIGNATURE-----

--0gVTsJWDm3b+VhTS--
