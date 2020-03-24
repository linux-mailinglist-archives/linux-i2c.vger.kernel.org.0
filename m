Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B261191B92
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 21:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgCXU5e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 16:57:34 -0400
Received: from sauhun.de ([88.99.104.3]:54988 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgCXU5e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 16:57:34 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 4AF8B2C08EF;
        Tue, 24 Mar 2020 21:57:32 +0100 (CET)
Date:   Tue, 24 Mar 2020 21:57:31 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     ajayg@nvidia.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Message-ID: <20200324205731.GA7641@ninjato>
References: <20200324152812.20231-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20200324152812.20231-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 11:28:11PM +0800, Kai-Heng Feng wrote:
> Nvidia card may come with a "phantom" UCSI device, and its driver gets
> stuck in probe routine, prevents any system PM operations like suspend.
>=20
> There's an unaccounted case that the target time can equal to jiffies in
> gpu_i2c_check_status(), let's solve that by using readl_poll_timeout()
> instead of jiffies comparison functions.=20
>=20
> Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Looks good to me, thanks Andy for the suggestion!

Waiting for the Rev-by from Ajay (driver maintainer).


--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56dDcACgkQFA3kzBSg
Kbb8uBAAr4Rj+iNo4B83HNFlyS8aXWxRCoZFedr5/tcsGUWZpn/P9QnqEUwZytqA
Duz4QoJc/qKZh1T9xW2f1LLDNC91v5SUVfDaVSDtvgnoq883ZwywMoX5XSwXBxKR
zY7kRu9VI69omQS9HpeA0mXMMiaTTdj5FTJQWalhX23YwTevJ7uMyzaQzDb6Th55
pFYL1uAqAT/5s5qhrr18wZAR0IH2MtxVSQRs+Z3a5ZdmOXMNPpqt9Bdol7Xd9o+P
3W/nsAyybejOEgFU1ylMCmyIioCpEgrebjKc2szjzx8dmA94V1LBYPMhRJPJS5T+
DksosmGvkmJySlwZdltCbte3Q0Kj57PQVZ5KSCI6JQUnsGPnpC4+JgvixW2c/UWr
TZIeF22qxBiHf2y3RQFK1QxHr+y03n0jLFSZ/NIWo4iS0YMK11nft0/8SVzlFWep
fLjwx6DCR9rrhjV703eyaXxJQVsvhbz7QfpO97V6Mr9nQbTDr5qsnXa192HwCDlj
JxFbpmeFG3tUXTTFLCv0+29/WIa8fQaAJZfBFpw1Ym//p3hhq/mT9jHvFm6uTVV3
53dUeJ5CqW/NNk/JPucQZA0nOLtrIflV0/E1BEfce2ew8EWF2v8IHv0menDqRV+O
Ks0yGLDYcgmdAN0FOrZEp14YRTPS00riZLtkYu5oQZzoiIOi9O4=
=2692
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
