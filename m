Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2D77D1EFC
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 20:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjJUStJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 14:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjJUStI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 14:49:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75426F7
        for <linux-i2c@vger.kernel.org>; Sat, 21 Oct 2023 11:49:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629E6C433C8;
        Sat, 21 Oct 2023 18:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697914147;
        bh=fMfHXPImar36k+jb9Y4wWT2Y0hcY3ugNeNmCmLNH1eo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MrbBQd+vTBfnrwhPwHYtLUFEEqqE7EHzCF9DdlQphO7xTPu0vJAls2XwFCjxsytKV
         S7TlDfonYkTbsSFB7nFTW8UaqzZA7NK57jD2kYux7jM3Rv7O+XX4byu8sri7/PxWab
         +vmLXclWi8P4GT0393qqRqsszBHdxw3lUj/fVPeBJ3Y/tLeAiB4mylHeH8IVMeaPP+
         FNZ6rW1EdfmghmgIpISmBLVN0kcTmAn0FYvW1GzNQqhmtcew35yQ+NMmAWa4uVutQg
         hPtPGtabvCfrrqPcpOZiyB9oDDPqoXGO7mzZT8p60Eoy5d8Hm6qFIgI+QC+Cz1RWja
         fUIoCk/V0zNoA==
Date:   Sat, 21 Oct 2023 20:49:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Simplify class-based client device
 instantiation
Message-ID: <ZTQdHw8nmy5mx5qW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qJgJe456IidEUJE6"
Content-Disposition: inline
In-Reply-To: <2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qJgJe456IidEUJE6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 09:27:44PM +0200, Heiner Kallweit wrote:
> Now that the legacy eeprom driver was removed, the only remaining i2c
> client driver with class SPD autodetection is jc42, and this driver
> supports also class HWMON. Therefore we can remove class SPD from the
> supported classes of the i801 adapter driver.
> Legacy class-based instantiation shouldn't be used in new code, so I
> think we can remove also the generic logic that ensures that supported
> classes of parent and muxed adapters don't overlap.
>=20
> Note: i801 parent supports just class HWMON now, and muxed childs
> class SPD, so the supported classes don't overlap.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--qJgJe456IidEUJE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0HR8ACgkQFA3kzBSg
Kba5QQ/+LHZtUaTVWtbVqdrnyx5sk2hZzAaZVmHad8llxXh2tpfXbepgzFdeaOvC
Qitf6rs2aO1QHMvxMLFhHtexIRHwIiW14eKWQjPtpP2X09YdZYHYb3PVBkvSBwXn
NxetQ1iSIcICIzk9J+BN/++rwPJPwQSJAkc+3a0lHUw17ML000zqDp/7R8Vu1m1S
uXR7p7KOv8LRbdLCkPUSXTmf5eKscrywToALgKx6vXr1T3oSah8znZHcmU3X9FiV
9c38t7gp1vRr4l9DSANZF4yDJXSVdnLqUZdZ7o5Qpbm8x7pb1u00Ugs1OfMaaRJd
gXZDqUJG7B1DXDl0BdSbp2ztmPKhVx/ntM3muoHlr7GLTuKJAZEHbXH1npsyEH/Q
8zsc/fcPC4Xen8VacwXFkAvqU6ea1NOcTnkh30vi/fcVmx3Q3oiYFANf74mLg6Gv
tgGeB1aLE3bD+UfkTg1YSdS5qkn5P5nwNrs1WY/+azi8ldCYsZoWm1MO3FtqVqW+
EmQHr7ZJbjFEQ3DY5WmUBR4zjH/aDvE27bl/WTGTsbRM7MH5Ni6lUTv3oLYSQJxp
kT+y4TvEfRRneRPPnyweoIzL7dudddA4pci1xO64j4EZvJNMv8TQfQf7jfDRSvrJ
E5N0YXjKN4GPfkhUfpS/cGUYwAebDSteKVa9D/h56Hvq94d6TUI=
=Kpwi
-----END PGP SIGNATURE-----

--qJgJe456IidEUJE6--
