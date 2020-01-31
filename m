Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D8C14E8FB
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2020 07:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgAaG46 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jan 2020 01:56:58 -0500
Received: from sauhun.de ([88.99.104.3]:56920 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgAaG46 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jan 2020 01:56:58 -0500
Received: from localhost (p54B333AF.dip0.t-ipconnect.de [84.179.51.175])
        by pokefinder.org (Postfix) with ESMTPSA id 721C42C0830;
        Fri, 31 Jan 2020 07:56:55 +0100 (CET)
Date:   Fri, 31 Jan 2020 07:56:55 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 5/6] i2c: i2c-stm32f7: allow controller to be
 wakeup-source
Message-ID: <20200131065654.GB1028@ninjato>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
 <1578317314-17197-6-git-send-email-alain.volmat@st.com>
 <20200130083927.GH2208@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <20200130083927.GH2208@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 09:39:27AM +0100, Wolfram Sang wrote:
> On Mon, Jan 06, 2020 at 02:28:33PM +0100, Alain Volmat wrote:
> > Allow the i2c-stm32f7 controller to become a wakeup-source
> > of the system. In such case, when a slave is registered to the
> > I2C controller, receiving a I2C message targeting that registered
> > slave address wakes up the suspended system.
> >=20
> > In order to be able to wake-up, the I2C controller DT node
> > must have the property wakeup-source defined and a slave
> > must be registered.
> >=20
> > Signed-off-by: Alain Volmat <alain.volmat@st.com>
>=20
> Applied to for-next, thanks!

And I will drop it again because buildbot rightfully complains:


> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/i2c/busses/i2c-stm32f7.c: In function 'stm32f7_i2c_suspend':
> >> drivers/i2c/busses/i2c-stm32f7.c:2199:44: error: 'struct dev_pm_info' =
has no member named 'wakeup_path'
>      if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
>                                                ^
>    drivers/i2c/busses/i2c-stm32f7.c: In function 'stm32f7_i2c_resume':
>    drivers/i2c/busses/i2c-stm32f7.c:2218:44: error: 'struct dev_pm_info' =
has no member named 'wakeup_path'
>      if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
>                                                ^

wakeup_path is only there if CONFIG_PM. Please fix and send a new
version.


--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4zz7YACgkQFA3kzBSg
KbaWShAAsD5Gaj6lEFcuVH415Va4PzT6S2H3CUZIfq7iTBdNKWV8nvABcAaS18FA
WY9qmpili5WRVugYU+1X4rxzEnSPiO6Sx5s9HGZHPefRlr2B99BknwPRCRkwWb6g
vGNROAZh+qQuTayJ2UH33dSGtjXQ09KH4uDrIeRBoxWRuOlhxOe1FBmwudzEC4UM
g3nCUq94rccym19fNkWxATy1RCwd2LZF4RRjj2CQLW+o41hUa/Vtb953oxjKPZHo
p6lNncLSls4myb0yyqLEfnyFgOaopM7kOaTsgZAElto7WptLPtrcv0M6pCuZGeQx
jFEqtZqSGNQsnlv4kZIei/Cnwp/zP1wgsHblLH20w1AuKAwq0G91kysEIH6OYak/
HUL09BSJ25ZVEKDOonq/bIVPlxSvO5C0SYkq+YjgY5ojSCWWLF8ThkUCayynCEu1
qsLn6oY7bB/8qqpiqPb+rx6M5ZuLLz3RKQmv28WuV2Oyl/KPgjtBXQ4KDG8l5fxI
bUGHLyMdiyGFoK64lppvjAWp3WSsN8IvcVfRrl7HfTgZ+iGONbCs+ZYVQ9Y3i1gw
APQl4R/vack7OumxG6wFjRvEpPDfwDvaR6A4yxpi62mp+YwP9NZ93pduvhqrF/DB
XMvJqyy4aMLZFDC1ioWldHX8FuFEXLqc2BULX/o0S92ZKSRYVc4=
=wM4/
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
