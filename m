Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3D22BA4F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 20:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfE0Srr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 14:47:47 -0400
Received: from sauhun.de ([88.99.104.3]:35778 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbfE0Srq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 14:47:46 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 5876B2C04C2;
        Mon, 27 May 2019 20:47:44 +0200 (CEST)
Date:   Mon, 27 May 2019 20:47:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ruslan Babayev <ruslan@babayev.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        xe-linux-external@cisco.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] i2c: acpi: export
 i2c_acpi_find_adapter_by_handle
Message-ID: <20190527184743.GA8808@kunai>
References: <20190505193435.3248-1-ruslan@babayev.com>
 <20190525005302.27164-1-ruslan@babayev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20190525005302.27164-1-ruslan@babayev.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2019 at 05:53:01PM -0700, Ruslan Babayev wrote:
> This allows drivers to lookup i2c adapters on ACPI based systems similar =
to
> of_get_i2c_adapter_by_node() with DT based systems.
>=20
> Signed-off-by: Ruslan Babayev <ruslan@babayev.com>
> Cc: xe-linux-external@cisco.com

Please have a look how your patches look in my inbox:

May 05 Ruslan Babayev  ( 129) [PATCH] net: phy: sfp: enable i2c-bus detecti=
on on ACPI based systems
May 05 Ruslan Babayev  (  65) =E2=94=9C=E2=94=80>[PATCH 1/2] i2c: acpi: exp=
ort i2c_acpi_find_adapter_by_handle
May 24 Ruslan Babayev  (  65) =E2=94=94=E2=94=80>[PATCH net-next v2 1/2] i2=
c: acpi: export i2c_acpi_find_adapter_by_handle
May 05 Ruslan Babayev  (  65) [PATCH net-next 1/2] i2c: acpi: export i2c_ac=
pi_find_adapter_by_handle
May 06 Ruslan Babayev  (   3) =E2=94=9C=E2=94=80>[PATCH RFC v2 net-next] En=
able SFP support on ACPI
May 06 Ruslan Babayev  (  65) =E2=94=9C=E2=94=80>[PATCH RFC v2 net-next 1/2=
] i2c: acpi: export i2c_acpi_find_adapter_by_handle
May 06 Ruslan Babayev  ( 120) =E2=94=94=E2=94=80>[PATCH RFC v2 net-next 2/2=
] net: phy: sfp: enable i2c-bus detection on ACPI based systems
May 07 Ruslan Babayev  ( 154)   =E2=94=94=E2=94=80&=E2=94=80>
May 07 Ruslan Babayev  (  10)     =E2=94=94=E2=94=80>
May 22 Ruslan Babayev  (  29)       =E2=94=94=E2=94=80>
May 05 Ruslan Babayev  (  93) [PATCH net-next 2/2] net: phy: sfp: enable i2=
c-bus detection on ACPI based systems
May 06 Ruslan Babayev  (  25) =E2=94=9C=E2=94=80&=E2=94=80>
May 06 Ruslan Babayev  (  99) =E2=94=94=E2=94=80&=E2=94=80>

This is highly confusing, and super hard to find out which patches belong
together. v2 2/2 seems even missing. Please resend this as a new series wit=
hout
any in-reply-to, and a fresh cover-letter, so I know which one to apply to =
my
tree.

Thanks,

   Wolfram


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsMMsACgkQFA3kzBSg
KbbJUw//ZjfgfbIi9s/dvsxSUH0zdiFzpTrxw/kK6vz8DoMVEvB7gZTQn+AGU9SX
7rDxALpNLwpC6k6IYkDT1SW7FBxMHw3yMBVahyXTlZaTAIOW/iS2yctgCBLlVs+1
zbGPIoEXobAY5kPgeb5ibpesN1UxmTBQOubp31RmOp87PInFCpo3czzvPhRxyCOs
nWXSaTVGvkoLzBmLXcz1awje7FimsUHUPI3GITobxGXVl+6l2whN/a69hbgHRhpL
5HbxaXt11oMTYI0QVBJ03Aqlu22nxZbW/YZV7P5cwrn7KaST04/8HTVxLhegPhog
pQH3M9Gp/ANChZ3+EqFe3IVWakj6tkZRUluL3kp1qNagVJ+aGeOurJgtoubXRXVc
hxOPPSrtHB90dWV+H/AieEIPwc7NFgbn6fOs4JLNGCvtc6ylEk/Yu6rFFIj9OuWN
ndtK5RZLKXfjvuYptxnTX8hK1o74YAnrJ0YwmYiWi7gq14fSxQjcL6OHHJM8rVks
zKHg2nA/2ikX9N6a+6TX3VkJkf9yPZb88S41onQuCfysW+tlmDYW9r4Nxp0U91bw
vKs/uwsnzIY/ezGr3v8u82vqzyejMi3/ABqFiO+tlC4TNQj5wqZhiE/FXBZi30J5
p/xcN6Pj8cNtAYWcPSd2kzBuLdqT9SF1XHRdMbtItkHYMJ3WIAo=
=rpQu
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
