Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160254B17D7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 22:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344767AbiBJVt3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 16:49:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245076AbiBJVt2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 16:49:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF60EF23;
        Thu, 10 Feb 2022 13:49:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6E99EB8277F;
        Thu, 10 Feb 2022 21:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F8EC004E1;
        Thu, 10 Feb 2022 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644529766;
        bh=mBlKdnmPcBD68cbrky1GB/7GaWbt94JXLwJNBU+phTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gvbduKbG0nKZnFZQ+hIbDlz07R7ivreBGWdiXmAsg28jJcMb65VybnHnqMKVUY08K
         T7JPqc6iM3Yx8eyHBvJHu4I2mc5CA1BNCbH2rd7nOc+mXixwGb+5b+l1YDK0smB1e4
         Ji0aPsazN9utsUjvMQ9qroRhaV9C0olxwX8VGJrS+SAqToINYIT/osZHysbbpuQ+d1
         9+Z4sLcZpkrKcd+JT9ncJ9lxC/74Gx2WQ3eyf5ovZ6ENc8QULLpkp3nM4LPkhTYISX
         fSgX/is9XdXapCfI5pxitNyJs9sP0+XvubokAcCwh5HhwCqqsoOb2oahfYD6EUwWBR
         UAG2Z7C9/M3WQ==
Date:   Thu, 10 Feb 2022 22:49:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        jdelvare@suse.com, linux-i2c@vger.kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v5 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Message-ID: <YgWIYiQG8NPmcrbl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, andy.shevchenko@gmail.com,
        rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
        wim@linux-watchdog.org, rrichter@amd.com, thomas.lendacky@amd.com,
        sudheesh.mavila@amd.com, Nehal-bakulchandra.Shah@amd.com,
        Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
        Mario.Limonciello@amd.com
References: <20220209172717.178813-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/ksDgt2nnkFtgRNi"
Content-Disposition: inline
In-Reply-To: <20220209172717.178813-1-terry.bowman@amd.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/ksDgt2nnkFtgRNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 11:27:08AM -0600, Terry Bowman wrote:
> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
> disabled on later AMD processors.
>=20
> This series includes patches with MMIO accesses to register
> FCH::PM::DECODEEN. The same register is also accessed by the sp5100_tco
> driver.[1] Synchronization to the MMIO register is required in both
> drivers.
>=20
> The first patch creates a macro to request MMIO region using the 'muxed'
> retry logic. This is used in patch 6 to synchronize accesses to EFCH MMIO.
>=20
> The second patch replaces a hardcoded region size with a #define. This is
> to improve maintainability and was requested from v2 review.
>=20
> The third patch moves duplicated region request/release code into
> functions. This locates related code into functions and reduces code line
> count. This will also make adding MMIO support in patch 6 easier.
>=20
> The fourth patch moves SMBus controller address detection into a function=
=2E=20
> This is in preparation for adding MMIO region support.
>=20
> The fifth patch moves EFCH port selection into a function. This is in
> preparation for adding MMIO region support.
>=20
> The sixth patch adds MMIO support for region requesting/releasing and
> mapping. This is necessary for using MMIO to detect SMBus controller
> address, enable SMBbus controller region, and control the port select.
>=20
> The seventh patch updates the SMBus controller address detection to suppo=
rt
> using MMIO. This is necessary because the driver accesses register
> FCH::PM::DECODEEN during initialization and only available using MMIO on
> later AMD processors.
>=20
> The eighth patch updates the SMBus port selection to support MMIO. This is
> required because port selection control resides in the
> FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later A=
MD
> processors.
>=20
> The ninth patch enables the EFCH MMIO functionality added earlier in this
> series. The SMBus controller's PCI revision ID is used to check if EFCH
> MMIO is supported by HW and should be enabled in the driver.
>=20
> Based on v5.17-rc2.
>=20
> Testing:
>   Tested on family 19h using:
>     i2cdetect -y 0
>     i2cdetect -y 2
>=20
>   - Results using v5.16 and this pachset applied. Below
>     shows the devices detected on the busses:
>    =20
>     # i2cdetect -y 0=20
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         -- -- -- -- -- -- -- --=20
>     10: 10 11 -- -- -- -- -- -- 18 -- -- -- -- -- -- --=20
>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --=20
>     30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- --=20
>     40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- --=20
>     50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --=20
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --=20
>     70: -- -- -- 73 -- -- -- --                        =20
>     # i2cdetect -y 2
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         -- -- -- -- -- -- -- --=20
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --=20
>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --=20
>     30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --=20
>     40: -- -- -- -- -- -- -- -- -- -- -- -- 4c -- -- --=20
>     50: -- 51 -- -- 54 -- -- -- -- -- -- -- -- -- -- --=20
>     60: 60 -- -- 63 -- -- 66 -- -- -- -- 6b -- -- 6e --=20
>     70: 70 71 72 73 74 75 -- 77
>=20
>   Also tested using sp5100_tco submitted series listed below.[1]
>   I applied the sp5100_tco v4 series and ran:
>     cat  >> /dev/watchdog
>=20
> [1] sp5100_tco v4 patchset can be found here:
> Link: https://lore.kernel.org/linux-watchdog/20220130191225.303115-1-terr=
y.bowman@amd.com/
>=20
> Changes in v5:
>  - Use request/release helper function for sb800 device in
>    piix4_setup_sb800(). Patch 3. (Jean Delvare)    =20
>  - Revert 'piix4_smba' variable definition ordering back as it was in
>    piix4_setup_sb800(). Patch 4. (Jean Delvare)
>  - Add newline after piix4_sb800_port_sel(). Patch 5. (Jean Delvare)
>  - Remove unnecessary initialization in piix4_add_adapter(). Patch 6.
>    (Jean Delvare)
>  - Remove unnecessary #define AMD_PCI_SMBUS_REVISION_MMIO. Patch 9.
>    (Jean Delvare)
>  - Add description for 0x51 constant moved in the above item. This is
>    in piix4_sb800_use_mmio(). Patch 9. (Andy Shevchenko)
>  - Rebase to v5.17-rc2. (Andy Shevchenko)
>  - Update patch 9 description. (Terry Bowman)
> =20
> Changes in v4:
>  - Changed request_muxed_mem_region() macro to request_mem_region_muxed()
>    in patch 1. (Andy Shevchenko)
>  - Removed unnecessary newline where possible in calls to
>    request_muxed_region() in patch 2. (Terry Bowman)
>  - Changed piix4_sb800_region_setup() to piix4_sb800_region_request().
>    Patch 3. (Jean Delvare)
>  - Reordered piix4_setup_sb800() local variables from longest name length
>    to shortest name length. Patch 4. (Terry Bowman)
>  - Changed piix4_sb800_region_request() and piix4_sb800_region_release() =
by
>    adding early return() to remove 'else' improving readability. Patch 6.
>    (Terry Bowman)
>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
>    already enabled. (Terry Bowman)
>  - Refactored piix4_sb800_port_sel() to simplify the 'if' statement using
>    temp variable. Patch 8. (Terry Bowman)
>  - Added mmio_cfg.use_mmio assignment in piix4_add_adapter(). This is
>    needed for calls to piix4_sb800_port_sel() after initialization during
>    normal operation. Patch 9. (Terry Bowman)
> =20
> Changes in v3:
>  - Added request_muxed_mem_region() patch (Wolfram, Guenter)
>  - Reduced To/Cc list length. (Andy)
> =20
> Changes in v2:
>  - Split single patch. (Jean Delvare)
>  - Replace constant 2 with SB800_PIIX4_SMB_MAP_SIZE where appropriate.
>    (Jean Delvare)
>  - Shorten SB800_PIIX4_FCH_PM_DECODEEN_MMIO_EN name length to
>    SB800_PIIX4_FCH_PM_DECODEEN_MMIO. (Jean Delvare)
>  - Change AMD_PCI_SMBUS_REVISION_MMIO from 0x59 to 0x51. (Terry Bowman)
>  - Change piix4_sb800_region_setup() to piix4_sb800_region_request().
>    (Jean Delvare)
>  - Change 'SMB' text in  logging to 'SMBus' (Jean Delvare)
>  - Remove unnecessary NULL assignment in piix4_sb800_region_release().
>    (Jean Delvare)
>  - Move 'u8' variable definitions to single line. (Jean Delvare)
>  - Hardcode piix4_setup_sb800_smba() return value to 0 since it is always
>    0. (Jean Delvare)
>=20
> Terry Bowman (9):
>   kernel/resource: Introduce request_mem_region_muxed()
>   i2c: piix4: Replace hardcoded memory map size with a #define
>   i2c: piix4: Move port I/O region request/release code into functions
>   i2c: piix4: Move SMBus controller base address detect into function
>   i2c: piix4: Move SMBus port selection into function
>   i2c: piix4: Add EFCH MMIO support to region request and release
>   i2c: piix4: Add EFCH MMIO support to SMBus base address detect
>   i2c: piix4: Add EFCH MMIO support for SMBus port select
>   i2c: piix4: Enable EFCH MMIO for Family 17h+
>=20

Applied the series to for-next, thank you Terry for keeping at it and
Jean and Andy for the review. I'll send the pull request containing the
ioport update to the WDT maintainers now. All further changes should be
based on top of this now.


--/ksDgt2nnkFtgRNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFiF0ACgkQFA3kzBSg
KbY8ORAAiR2qPdf3doez6yl+qy2erLsx5HiDXkQHEl8VwsuNji4Npr07bSsUgF64
c5rM0czyZWPoGfwST6YBzjLsHliG+IniKhFIC5/wC0BsnyuTuw3xCK8iXSDlXW5g
J6NrPK5RUuZZF/kVmhp5TfY/8oe3vMRwNhG2Cy1jj8OGD/m/TSOfNSEww8f+wtvn
Dw0xFGm3lWIpXbd8Qpg6dvNX5lIsRtbvguly0bG+qK107mObwNjnYNCjrEggoDo6
+0HiY/yPpceVrgrGUFCOq6ArRJyIIsSFvFVm1QnYuFOJaWDQW74NJRvLRK7JsLPX
nKLgFq5BC6o6JZu+LxTrdDLwWpzr1x7FSR+e6NM1gancW4qTW/Amx4VEVALxds7k
hEf4LsrrM75qC1x2WUj+5WzhDLPffVe6sayJNjhk//Jk0iHmo7ZMruNoL78o+NWA
5EjHFLTVZmmrNtc/jvu/9IWEMqiLNC+8+H84kaVPTPnSgWUPTMWfSem9V31tL5EV
MCOmcg/7akbkMyYA0zl+OV6qFn9T7qHOn8uLqQ57wux/TF9RX/slkCWLyLltGa8v
811xn9yAYuGf0iufUCEIovajONaZsaHZV0w2/5L8hFv6rng40iDJSWzKm//Nol2f
shTZjpK/6FGss9uSMFqw+WLLuB9Pv02ygc2lCNJgDGyiBLLiizo=
=cYnD
-----END PGP SIGNATURE-----

--/ksDgt2nnkFtgRNi--
