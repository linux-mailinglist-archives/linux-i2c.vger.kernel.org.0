Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7580F808C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 20:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfKKTvn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 14:51:43 -0500
Received: from sauhun.de ([88.99.104.3]:49536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbfKKTvh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 14:51:37 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id 569DA2C0428;
        Mon, 11 Nov 2019 20:51:35 +0100 (CET)
Date:   Mon, 11 Nov 2019 20:51:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH] i2c: i2c-stm32f7: report dma error during probe
Message-ID: <20191111195134.GG1608@kunai>
References: <1571921521-8502-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HB4mHL4PVvkpZAgW"
Content-Disposition: inline
In-Reply-To: <1571921521-8502-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HB4mHL4PVvkpZAgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 02:52:00PM +0200, Alain Volmat wrote:
> Distinguish between the case where dma information is not provided
> within the DT and the case of an error during the dma init.
> Exit the probe with error in case of an error during dma init.
>=20
> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--HB4mHL4PVvkpZAgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Ju8YACgkQFA3kzBSg
KbZO1g/9Ejg7dTPbsECJT9cFjP1yXrbGjFWabztNPI9cB407mc32FMMHolmR+e7t
Qar4sss2ieh/Rf+AG13KAk5y8VQ+0ioVReojH968fYVPPOxrx2G58rhOYiZnvz8p
BWZ6/wJGn66eJtSP7OfdyXKdDuewHrlE0GWx0hHxhEf6clN4bSbKyvcUIEUu3Z0R
91vC3pIxRY+6uEGSeFSnl+2m+zClqdP8kdAHW0vpNzPjjkJyhLWZTi/So0CN4Ymc
mL2MEAI6Epl4MADbMqXvSFViGbDeTMfK0WVnxnWIKCivOviWwbvzb7RGf+uF8wzG
mOX3rWgyHWe6laUDpvsVJ8gqJ7kQbEXAKitU9ERmFAmUSHGwjx69zWM8S4aF7J7m
sBkXaU7tp1L56wtoiy/v3UoDVMAkYkcTj6pXwsINgvNE44GslOdbHQwdd0p6Elgb
ivH0H7Sv+mRZU9ZPYot8rG4jKg2hQKS0dpKWo7d5nCmWf0unpRCmKxBSjdi8Kddr
8Qp4BXyjPm3GhsELW+Cpwz2n7VBcxRfHXW9v8BAng1pqgBkShfpB4zT4sLcltRjj
3+TfkDPjpqPGjmQRozWvSP5E34HXR7luMWr2TrD/2wxOsBZr6+q0TDOj3Uii6cxx
ZeKVrXSY1Xgg5tboDZSEYfY1WrsIfUF5NKduYnc21SsUbsQ+z9w=
=XSn5
-----END PGP SIGNATURE-----

--HB4mHL4PVvkpZAgW--
