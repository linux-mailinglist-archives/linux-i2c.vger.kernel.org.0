Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10177168EE8
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 13:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgBVMkJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 07:40:09 -0500
Received: from sauhun.de ([88.99.104.3]:53676 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgBVMkI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 22 Feb 2020 07:40:08 -0500
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
        by pokefinder.org (Postfix) with ESMTPSA id 291152C07F9;
        Sat, 22 Feb 2020 13:40:02 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:40:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 3/5] i2c: i2c-stm32f7: add a new st,stm32mp15-i2c
 compatible
Message-ID: <20200222124001.GH1716@kunai>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-4-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KscVNZbUup0vZz0f"
Content-Disposition: inline
In-Reply-To: <1579795970-22319-4-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KscVNZbUup0vZz0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 05:12:48PM +0100, Alain Volmat wrote:
> Add a new stm32mp15 specific compatible to handle FastMode+
> registers handling which is different on the stm32mp15 compared
> to the stm32f7 or stm32h7.
> Indeed, on the stm32mp15, the FastMode+ set and clear registers
> are separated while on the other platforms (F7 or H7) the control
> is done in a unique register.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Looks good (patch 2 as well). You'd only need to adapt the naming if you
change the naming in patch 1, obviously.


--KscVNZbUup0vZz0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RISEACgkQFA3kzBSg
KbaaDw//TvaXXxfk/UfcOGsDNuLxbiqLPHG3i6DtQPijfEd93ekH6LKIwE5kpDV2
pbsCUtpHku3mQvQyPScHSdgyMyqbd31mwDSB8waFOfG4SuNDDJXxqo5GltD62/8w
HSBfAAvF4TM58QMDIaDYokrUhVZm5BJ/Cofv2z4+jBx4uRBWC829pmxvuf/sHWbo
gti4PZZLQRMbBs6i9/7ShPsLmn4NffZ6+U2GDyVl11EmYdhOP0fMVFPgnbS/0Z7C
/xfuMFs5Cu3wyq1oHNF0//SurRD4b1YfENh87h+cjYElICT5EUZ+Yv65TPTE4Xpf
lWUGKKVcJ6nGoYOLCJOz1YoG/cRUtxSG+RCQXVAkwyHuoswOl8UrWyPUuuOh51xf
AvrobB4WbHE3Z0KtGryxl3q2XEnoA5XHQTl8vOKiPfJTQYsRTb300Oh1Ym25E2H1
Oj3iUlI2EL2VC+hleMywRQgXZLtGyNL2C2xphOmASWRBC2zVVGcrfr8eaA5V+5AU
LvFKZPIjVaLa8suLgoxqatPo7d52ZskkXpzOtKOLp5joFYxjaNxjJDRLmlGCaa4g
EcErYOqMz3SJQuV8jyG+zNrmzZh8/1oQx6u7hkKzU2c0XaPCJhtjv8dXpMYS0Eqf
eP6JDxzkRYh4GT2xc2GwLpEL9Ysy31G1yw2RhKurA6rRGHJpkMo=
=epcM
-----END PGP SIGNATURE-----

--KscVNZbUup0vZz0f--
