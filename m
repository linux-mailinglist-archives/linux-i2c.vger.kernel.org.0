Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEC31E93CB
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 23:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgE3VGP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 17:06:15 -0400
Received: from sauhun.de ([88.99.104.3]:37044 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728741AbgE3VGO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 17:06:14 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id 36B252C2099;
        Sat, 30 May 2020 23:06:11 +0200 (CEST)
Date:   Sat, 30 May 2020 23:06:09 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/11] i2c: designeware: Add Baikal-T1 System I2C
 support
Message-ID: <20200530210609.GB15682@ninjato>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 12:33:10PM +0300, Serge Semin wrote:
> Jarkko, Wolfram, the merge window is upon us, please review/merge in/what=
ever
> the patchset.
>=20
> Initially this has been a small patchset which embedded the Baikal-T1
> System I2C support into the DW APB I2C driver as is by using a simplest
> way. After a short discussion with Andy we decided to implement what he
> suggested (introduce regmap-based accessors and create a glue driver) and
> even more than that to provide some cleanups of the code. So here is what
> this patchset consists of.
>=20
> First of all we've found out that current implementation of scripts/dtc
> didn't support i2c dt nodes with 10bit and slave flags set in the
> reg property. You'll see an error if you try to dt_binding_check it.
> So the very first patch fixes the problem by adding these flags support
> into the check_i2c_bus_reg() method.
>=20
> Traditionally we converted the plain text-based DT binding to the DT sche=
ma
> and added Baikal-T1 System I2C device support there. This required to mark
> the reg property redundant for Baikal-T1 I2C since its reg-space is
> indirectly accessed by means of the System Controller cmd/read/write
> registers.
>=20
> Then as Andy suggested we replaced the Synopsys DW APB I2C common driver
> registers IO accessors into the regmap API methods. This doesn't change
> the code logic much, though in two places we managed to replace some bulky
> peaces of code with a ready-to-use regmap methods.
>=20
> Additionally before adding the glue layer API we initiated a set of clean=
ups:
> - Define components of the multi-object drivers (like i2c-designware-core=
=2Eo
>   and i2c-designware-paltform.o) with using `-y` suffixed makefile
>   variables instead of `-objs` suffixed one. This is encouraged by
>   Documentation/kbuild/makefiles.rst text since `-objs` is supposed to be=
 used
>   to build host programs.
> - Make DW I2C slave driver depended on the DW I2C core code instead of the
>   platform one, which it really is.
> - Move Intel Baytrail semaphore feature to the platform if-clause of the
>   kernel config.
>=20
> After this we finally can introduce the glue layer API for the DW APB I2C
> platform driver. So there are three methods exported from the driver:
> i2c_dw_plat_setup(), i2c_dw_plat_clear(), &i2c_dw_plat_dev_pm_ops to
> setup, cleanup and add PM operations to the glue driven I2C device. Before
> setting the platform DW I2C device up the glue probe code is supposed to
> create an instance of DW I2C device generic object and pre-initialize
> its `struct device` pointer together with optional platform-specific
> flags. In addition to that we converted the MSCC Ocelot SoC I2C specific
> code into the glue layer seeing it's really too specific and, which is mo=
re
> important, isn't that complicated so we could unpin it without much of
> worrying to break something.
>=20
> Meanwhile we discovered that MODEL_CHERRYTRAIL and MODEL_MASK actually
> were no longer used in the code. MODEL_MSCC flag has been discarded since
> the MSCC Ocelot I2C code conversion to the glue driver. So now we can get
> rid of all the MODEL-specific flags.
>=20
> Finally we introduced a glue driver with Baikal-T1 System I2C device
> support. The driver probe tries to find a syscon regmap, creates the DW
> APB I2C regmap based on it and passes it further to the DW I2C device
> descriptor. Then it does normal DW APB I2C platform setup by calling a
> generic setup method. Cleanup is straightforward. It's just calling a
> generic DW APB I2C clean method.
>=20
> This patchset is rebased and tested on the i2c/for-next (5.7-rc4):
> base-commit: 2a41d0f91443 Merge branch 'i2c/for-5.8' into i2c/for-next
>=20
> Note new vendor prefix for Baikal-T1 System I2C device is added in the
> framework of the next patchset:
> https://lkml.org/lkml/2020/5/6/1047
>=20
> Changelog v2:
> - Fix the SoB tags.
> - Use a shorter summary describing the bindings convertion patch.
> - Patch "i2c: designware: Detect the FIFO size in the common code" has
>   been acked by Jarkko and applied by Wolfram to for-next so drop it from
>   the set.
> - Patch "i2c: designware: Discard i2c_dw_read_comp_param() function" has
>   been acked by Jarkko and applied by Wolfram to for-next so drop it from
>   the set.
> - Make sure that "mscc,ocelot-i2c" compatible node may have up to two
>   registers space defined in the DT node, while normal DW I2C controller
>   will have only one registers space.
> - Add "mscc,ocelot-i2c" DT schema example to test the previous fix.
> - Declare "unevaluatedProperties" property instead of
>   "additionalProperties" one in the DT schema.
> - Due to the previous fix we can now discard the dummy boolean properties
>   declaration, since the proper type evaluation will be performed by the
>   generic i2c-controller.yaml schema.
> - Refactor the DW I2C APB driver related series to address the Andies
>   notes.
> - Convert DW APB I2C driver to using regmap instead of handwritten
>   accessors.
> - Use `-y` to build multi-object DW APB drivers.
> - Fix DW APB I2C slave code dependency. It should depend on
>   I2C_DESIGNWARE_CORE instead I2C_DESIGNWARE_PLATFORM.
> - Move Baytrail semaphore config to the platform if-clause.
> - Introduce a glue-layer platform driver API.
> - Unpin Microsemi Ocelot I2C code into a glue driver.
> - Remove MODEL_CHERRYTRAIL and MODEL_MASK as no longer needed.
> - Add support for custom regmap passed from glue driver.
> - Add Baikal-T1 System I2C support in a dedicated glue layer driver.
>=20
> Link: https://lore.kernel.org/linux-i2c/20200510095019.20981-1-Sergey.Sem=
in@baikalelectronics.ru/
> Changelog v3:
> - Move fixes and less invasive patches to the head of the series.
> - Add patch "dt-bindings: i2c: Discard i2c-slave flag from the DW I2C
>   example" since Rob says the flag can be discarded until dtc is fixed.
> - Add patch "i2c: designware: Retrieve quirk flags as early as possible"
>   as a first preparation before adding Baikal-T1 System I2C support.
> - Add patch "i2c: designware: Move reg-space remapping into a dedicated
>   function" as a second preparation before adding Baikal-T1 System I2C
>   support.
> - Add patch "i2c: designware: Add Baikal-T1 System I2C support", which
>   integrates the Baikal-T1 I2C support into the DW I2C platform driver.
> - Get back the reg property being mandatory even if it's Baikal-T1 System
>   I2C DT node. Rob says it has to be in the DT node if there is a
>   dedicated registers range in the System Controller registers space.
> - Replace if-endif clause around the I2C_DESIGNWARE_BAYTRAIL config
>   with "depends on" operator.
>=20
> Link: https://lore.kernel.org/linux-i2c/20200526215528.16417-1-Sergey.Sem=
in@baikalelectronics.ru/
> Changelog v4:
> - Rebase on top of the i2c/for-next branch.
> - Use PTR_ERR_OR_ZERO() helper in the bt1_i2c_request_regs() and
>   in the dw_i2c_plat_request_regs() methods.
> - Discard devm_platform_get_and_ioremap_resource() utilization.
> - Discard patch "scripts/dtc: check: Add 10bit/slave i2c reg flags
>   support" since it must be merged in to the dtc upstream repository.
>=20
> Link: https://lore.kernel.org/linux-i2c/20200527120111.5781-1-Sergey.Semi=
n@baikalelectronics.ru
> Changelog v5:
> - Replace or-assignment with just assignment operator when getting
>   the quirk flags.
> - Keep alphabetical order of the include statements.
> - Discard explicit u16-type cast in the dw_reg_write_word() method.
>=20
> Link: https://lore.kernel.org/linux-i2c/20200527153046.6172-1-Sergey.Semi=
n@baikalelectronics.ru
> Changelog v6:
> - Add commas after the last member of the regmap_config instances
>   initializers.
> - Replace the "linux,slave-24c02" compatible string with "atmel,24c02" one
>   so the DT example would be perceived as a normal DW I2C master mode.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>=20
> Serge Semin (11):
>   dt-bindings: i2c: Convert DW I2C binding to DT schema
>   dt-bindings: i2c: Convert DW I2C slave to the DW I2C master example
>   dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
>   i2c: designware: Use `-y` to build multi-object modules
>   i2c: designware: slave: Set DW I2C core module dependency
>   i2c: designware: Add Baytrail sem config DW I2C platform dependency
>   i2c: designware: Discard Cherry Trail model flag
>   i2c: designware: Convert driver to using regmap API
>   i2c: designware: Retrieve quirk flags as early as possible
>   i2c: designware: Move reg-space remapping into a dedicated function
>   i2c: designware: Add Baikal-T1 System I2C support
>=20

Applied to for-next, thanks!


--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SysEACgkQFA3kzBSg
KbbgfA/+Mw/43WA0Ac+dBmEMMmCpp/w8mfZ5UHwCvZGEFqp5sGaXwCC9YW1KH9Ep
EBDs0c1qC4NZDYzCQpuijTjzMNh31mQRQ4NZeDNAIL9OjuymOKNtz+ZggDNCbrzB
U+ADLInUIzmqnmeLMmEtHZrgDUFOIUop3ixnsBizCiofXZ9run7wUJyyw975EAJ3
RC0LuYGGLV7WVEMTGUg4rUNk8fngzrmlEqu1WQzByWoIkMw0c05kRyGfR76XZPQw
JPNlp5Tp8ZLERD6AB6lI19iIGBPzZx1cXDI7Qh0A56t//OlN8ailolI8J5pyUxT8
HlwFnea+vDG8AI6w/dWHPmchJBOQxaZWzBQ/cIOCxGrvmC96ufvJdAyel4vzRVw5
wEPltlwZR1fxS/e/imJyGrVw+3w66jXo6Fj/cgcx7pTwP76ATn3Wv77qySNSl9j/
lUex5SY+5FXRu8ZFYT4JtZglkQdo0e11KeCQ6frrUD6B32Cw1qPoY9V45syzBnFZ
Dl1e8JCHk0pzcx1c1C1F2bkZ+tc5bYEDY4JqhnRv36HD2PBzujX5XIZq8rQRAbRt
JnDfLUM1oN1ZUOxkFKM4AjpnQoqPF8qygVpuIL09mXS/sNi21intMzJVA/rBV6/9
fQcOIhfyxazgCDy1zzqbzOG6Rae9pM4PPiAxUYTJY/x4UJANopw=
=+7Jd
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
