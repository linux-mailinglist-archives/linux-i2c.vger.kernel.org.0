Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF67A5AC0
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 17:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfIBPrP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 11:47:15 -0400
Received: from sauhun.de ([88.99.104.3]:40816 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfIBPrO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 11:47:14 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id 983A52C0165;
        Mon,  2 Sep 2019 17:47:12 +0200 (CEST)
Date:   Mon, 2 Sep 2019 17:47:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: i2c: add bindings for i2c analog and
 digital filter
Message-ID: <20190902154712.GA5213@kunai>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
 <1567418773-2427-3-git-send-email-eugen.hristev@microchip.com>
 <9a9c209c-2fb8-0a4c-4e0a-b04fefda3360@axentia.se>
 <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <b6528812-65d3-6561-38e7-c0545af900d8@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eugen,

> Wolfram, what do you think ?

Yes, the bindings should be generic. Peter's reasoning makes much sense
to me. I am quite sure if the two of you can work things out, I'll have
nothing to add.

Thanks,

   Wolfram

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1tOXsACgkQFA3kzBSg
KbZ7WA/8CbJ1UkV+wsS6wze/wZkPVWdaE81SHoM/BY0/LIXC1uApajeR60OQDs8U
nrX2j4+7BJyqB9UxW+qfYe5XDbhKeb7a2iL3JNx1hBZgTZ6Gi1O58teEdkWyooD6
Jxze/jkMdt4GB8862rK7Qg4L6yzOSBVYwenv5zKgyKjcq2T4IciumJ0yY3XkmFQ+
/q+kYiEPdGdKH8Mt/YQI6emeVSwcBo+ngHSt+6GeIu8P+2RUd5tvWKfx8E3lKIaN
P5ISf+KG3IEInS09yI5Dzn5mh55VFHIvU3Vg/BDomAJyU5eszjT4ECwplkWRRX64
eTxFhJfpxhmY+MHDiFsOG16TCS7yQAXFTHiVddvJY4/POL6zfEEHT8Kix8BRDZoR
z5Q6CBmMXDgHPlMLSs6yJ7vo1A1vguT/kjO1sTeGlmZXQYp0fJt1E5+UtCp3dMvH
KE5Pj8++x6W3KhUG9oESkckfwFXB1w32uM4uUCcHQV0Z/t/HA289cWxoHuVtG2H6
PyiR9zuCYU9s4iG72JrlzZmEmo8pxz4df9sy37Xph1ssF9vuBcRDbwoqU+NiuWea
EDWvL4HeJTUQh6O6rICgDMg8WZXpKDuFzXqHDY3hB31L0TT4qc8kIwRAOoxIKp3/
EFCJL/jKr+Sr4HiHvP1QN9luY7W/eHKjvZtGEfaby2QO+YeIfEA=
=4puT
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
