Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC0B14D757
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 09:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgA3IO4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 03:14:56 -0500
Received: from sauhun.de ([88.99.104.3]:46422 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726863AbgA3IO4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 03:14:56 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id 5CB0B2C0697;
        Thu, 30 Jan 2020 09:14:54 +0100 (CET)
Date:   Thu, 30 Jan 2020 09:14:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 1/4] i2c: cadence: Fix error printing in case of defer
Message-ID: <20200130081453.GC2208@ninjato>
References: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <1575888052-20447-1-git-send-email-shubhrajyoti.datta@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 04:10:49PM +0530, shubhrajyoti.datta@gmail.com wrot=
e:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> Do not print error in case of EPROBE_DEFER.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Applied to for-next, thanks!


--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4ykH0ACgkQFA3kzBSg
KbYDUQ//fQrdsBmL0LVrRcQg2si9EbiSvbSWxrZY2OMFmCzZuRTKUS4rQFqiiK7l
6x1S95EnWv7/Yk5NlCWxy/4wxQPlDiQ7sarZamQQU9UerdNlYyJwfge5Z+HSjitE
cWmB1M9ZhcuzFw1kdzEjOPTRN9KUTa/F625joffJ76fEsuw42RPStkC9GcSUlSs5
RaXXlsZoHFWE9ZXw7HnYteXf2qo4PIhTyk6knMGJJAVYevvJQN2IqenO/S/MKN++
NTJujW2ajYGXRrRcv+dTKNQqVf5hU20IRRlUJxmgseej7BobYyelJVXUTg6CMiLV
OBIYAupxf6FEwpxUq00i7XSArI5Z+wl1LMLJNcDEM1dFaQ3qTlbXz87w367/n/ZJ
1jtSwoF4yNAwmB4rG/dpo4rwU/B8oeoED7TljERShaBX3A3ICpRKPwghGwfbkqkY
ee1u54+EeabELVH53+lfuBtATNSQhpZFYGVuH0rclhIqhnBWfdn6iRoPN3jVeeNd
bG+p8Oe1aTiEmuKEK5D2ZXBQBMQ5wlmIapHgK82ULk/3TeUca89x0uwupe2zYN8t
2haMbmKMeA9KVIy/gE/q33XQfuwpKM5Lbo2wtKlWvkg852XP2e2MLvQv/YF1IA2O
Zn8lH3k+Uhea6MUhlMGlzDpKsk6J6jeb9k9UOaY5bNhytLRuEG0=
=wwDA
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
