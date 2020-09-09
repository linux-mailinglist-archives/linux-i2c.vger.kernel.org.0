Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0BB262A90
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgIIIkB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725864AbgIIIkA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:40:00 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B617B207DE;
        Wed,  9 Sep 2020 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599640799;
        bh=BbnDVHB8A3xGCPsPhdOsOXW5HCi8ljWrh90xTXF0bG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lm6hFqTbTg7XG5FwExZc+8SS+2F4VxeNefAxyj38zMMcDUrf16thfT2z5N1BoWUcZ
         NkmTTNhjIxYA7OvakAlhp4B6LXbI6kHDsx3b6qLyixiwgA8o7cPcB6eIFkEPz9UyzG
         c7UkZA46xf49/6S7o+uWOz/a3MnsN3ZKsqshDTxM=
Date:   Wed, 9 Sep 2020 10:39:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v3 2/2] i2c: stm32f7: Add SMBus Host-Notify protocol
 support
Message-ID: <20200909083956.GG2272@ninjato>
References: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
 <1596431876-24115-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline
In-Reply-To: <1596431876-24115-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 07:17:56AM +0200, Alain Volmat wrote:
> Rely on the core functions to implement the host-notify
> protocol via the a I2C slave device.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YlNwACgkQFA3kzBSg
KbYZxg/9H/2L3ghZ/LP17brMo/1wYK2lflEHShTBQHcbVNg82QaXJn8CVoh9lfwe
npimgd5SZXQWD6gXfMbS+ddR2YkVw5VM4RG8w72Ga6fmY0xoqWlf5Ynew2opCRC/
HaDTDuOKrSbMvTCTIm+9QnUyjBPNABXqteamcT9Tk4j7XfmBNt9f0e8o1kEvCxSg
gsbYnXWDDe7XSj65uY0NLcYsmyuRWiP0yWZmKmecitPS1UITrrJ02XSZ1Wd0hDTM
0ymGLf2UhNgLI0rc4odRb03aFzDxBt6NpgqfW7Y9jPXq3cA7IOc5Vh76aruJ+hnT
gr+7bY1wDmbbp/uWN23z/XC+tPFEvO+DC9pecuBUEBKAsn43HxR4zRB3to1Sa392
VpqBlT7gT0Mk7iYQvry8pqc5WO4eSzZNUUl+kNJE2FVjZj9Fvt9M4khglacz+sKi
eCI+fmKlsY0IhUvaGksjztRES+aZXWSzfYfv+IvnQCDipUrua9r4cjKa8z2Q9Qzu
WIEAarMjZoSAKNpyX7ObWTZ1pJCNFx5NBxrSMzJxrntzGqBK0MSUxRnEMRTBVeb3
1M95a8yxD/qT7WC25jxRQZoEa/Jy8r5G5NKmB8wD5dWNANxzRpc2Y1/vpqJySp+R
fcKixlnlm1Dwd+AfL+5WCkMz8ZZuZqhZuGv2+NH0VvHab+xhCVM=
=uIIc
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
