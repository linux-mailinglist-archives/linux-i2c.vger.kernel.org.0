Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF1C14D76C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgA3IVE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:21:04 -0500
Received: from sauhun.de ([88.99.104.3]:46490 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbgA3IVE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 03:21:04 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id 381C12C0697;
        Thu, 30 Jan 2020 09:21:02 +0100 (CET)
Date:   Thu, 30 Jan 2020 09:21:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: Re: [PATCH 3/4] i2c: cadence: Implement save restore
Message-ID: <20200130082101.GE2208@ninjato>
References: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <1575888052-20447-3-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lteA1dqeVaWQ9QQl"
Content-Disposition: inline
In-Reply-To: <1575888052-20447-3-git-send-email-shubhrajyoti.datta@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lteA1dqeVaWQ9QQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 04:10:51PM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> Implement save restore for i2c module.
> Since we have only a couple of registers
> an unconditional restore is done.

The patch description misses an explanation *why* this is needed. From a
distance looks like a bugfix, so a Fixes tag may be needed, too.

>=20
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhraj@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

This is messy. Ack + SoB from Michal. Two xilinx-SoBs from you. Please
fix.


--lteA1dqeVaWQ9QQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4yke0ACgkQFA3kzBSg
Kbah0BAAkHn88Scg/zpt+EU72A4cw0obkraMJPGCmKv0DE9Usx42GUtPKjeocOMS
6n0HxZVbf0aQwmlrMQwX3cac/16ExLzvTrni9V1G6MqMbNvggZzPTcujRZVyMu2E
AngmDAr1gOuC5P6pYAXzp1kY/JCxapFx/dLq8BTFOF1X5LZT8JePHLjfS1sJlb5c
PHk+uHmgPC2EbatAIhWZUSR4FdkQX1GkDOE8DaWE2Ahuvqx27aljZbclvqekJfVn
IPOYf/z63HHopLNA9py2iR9s/wUVPlYGYO2+FwfEJAaxY+oC4OWOGo5z3ZQ896ka
/bZNFgRm2ySA3E5mdQsf9RCa+OXoBKy/idNBFjbjHI8B59Im0F/fGiLbzeK/ppun
WwQGdzRf3kJbM384cKtmtjCbI+A0GhIMRleHddQ7Yr5D6POUsbKTOyC4K+Ryjd4i
yq1ZTen2rzJ68iLUecuI6huSTtigPTog3txSeGpexeOJ4nnvGLco0/RzghMIVKm3
HGVbKSlqqmxdpYX6xEPmePFCJwkahvzm7V56IdDyMo7x23MQ96JGpdNGrJ7RLW8M
bZa232eg8j3gJHLl+02iwYOZ0hmuJB/NhvcvSIKFcxgF60et3AJXGL6vc3LKlqIs
P25Nb90Ntn7ZisHUpMEfCNBuWSpAfwSGUIFDuzPh2XAcRWRBjIQ=
=w7E3
-----END PGP SIGNATURE-----

--lteA1dqeVaWQ9QQl--
