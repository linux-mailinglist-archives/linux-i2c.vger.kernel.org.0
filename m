Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094AF14D7D0
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgA3IiM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:38:12 -0500
Received: from sauhun.de ([88.99.104.3]:46586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgA3IiM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 03:38:12 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id 0929F2C0697;
        Thu, 30 Jan 2020 09:38:11 +0100 (CET)
Date:   Thu, 30 Jan 2020 09:38:10 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH 4/6] i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support
Message-ID: <20200130083810.GG2208@ninjato>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
 <1578317314-17197-5-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <1578317314-17197-5-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2020 at 02:28:32PM +0100, Alain Volmat wrote:
> Backup/restore I2C registers as part of the suspend/resume
> handlers. The device is marked as suspended to ensure that
> transfers are rejected during the suspended period.
>=20
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4yle4ACgkQFA3kzBSg
KbY32g/+MsJU/Mz6bHmAAS9cTmzSotAvgy/o+WUUunotmJ7EHIyl25iZjMCFrs2z
Xi3Gk59qbPt4oMVu1wQNhT7NDbvjyyfltJPFyRjevxMfBKwcMGdd6lI4W+jsogCk
JtzOEIkiDrSXFqrC58/zjxbTV6vxpR0gtvbhnvVUvhtcAaVEWtrKm+f3NE7XoDt3
E4IhMehFrxlHxaBtzJUzlEyUrv0rRav4knChHnpAgtCHIh5wOVdj2PAMTibteAJ2
56Mt6MvU+W+vs6enYkDcFCtEu9sgOZF1RM3ozUurkI98Efqn/21M2fP7WtxZMDih
Ai/bVREnuAeJWI8LA65h9diLll6Wfi+QKlgh8Lq1XQmIfsPtv9kZGD3jCLZ9AEcJ
Gv//iQpUstLg728O+atN0pTYLyQ0Tuync+LxYnqyFHclpqFb4nwe37zF2gzVMkY8
H5Xaz+I7jqzG+I42img+kcLYIYbmT7Wjq/LJdivpAA8EzETeLzxX0QVroIDXzcOs
vGrk26aCR8xAfST/6KAb7AC8G5HSIDYFzsfbGhYMYm6jVvXw2pZYBXGsxtxTOXJ8
S8GsbiiY+3sND5foLLbEAtqpNgDNnJsPxS3R8MwES/2MiuPp+yEk1oinnS8cY6li
lom0Vqb3JaX8OQjZDu6uYyPAvhm2ED4jCCSMSvdMJNZtojtASKo=
=yyQ3
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
