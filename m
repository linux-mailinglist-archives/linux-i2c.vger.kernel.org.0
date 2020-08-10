Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37BC924041C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHJJgZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:36:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgHJJgY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:36:24 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D560A206C3;
        Mon, 10 Aug 2020 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597052184;
        bh=Vw+Rj/rtZ0j1+KEfAc3glhp58FKitPQp/lGLqr3Wulg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmqoCBs8iQxnjVk5/oAp0r4eT7/PGqY6gkhr5rmIqktzxT2V2EFBKqczRWum+UfN9
         6YWHkdAL1GlSYmk4d/R1F1mmqLDkDZViozqxN07M6+nmg2v9ZUtbRjJRkP0H4lyH6D
         nnC7BEs7cPPgV0smgxdfqzZAitwmnM+eOrtgfFiI=
Date:   Mon, 10 Aug 2020 11:36:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc: use simple i2c probe function
Message-ID: <20200810093619.GB1290@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200807152713.381588-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20200807152713.381588-1-steve@sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 05:27:13PM +0200, Stephen Kitt wrote:
> The i2c probe functions here don't use the id information provided in
> their second argument, so the single-parameter i2c probe function
> ("probe_new") can be used instead.
>=20
> This avoids scanning the identifier tables during probes.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

This is useful, helps deprecating the old probe method:

Acked-by: Wolfram Sang <wsa@kernel.org>


--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xFRMACgkQFA3kzBSg
KbZjrg/6A8HNLY0mqI61E0vXIx6q74Ls1JWWIlt+BNwoqOr2d5DWiprvBzgktbFA
JHmPFgFWaWrSdn6oFz4sOIPRPbchcupAQ6HVJI9n3QxvkycCl0tAWx9hvd0/j72A
lVQRvxOwid02Rtmsud4IKqGppm+FpyOh626IocTBbZZFn5+dZQLzt9L78/RND68S
6lFvK1ybFmnIZMx0N886RTZBeuXDHI+SmfaP0R8za+0AUtNigUM0W6Uh+mQfc+LC
7c7/4xSuf+7p6/kfWxTb1nclWBRcfNo22S0oODQCui/4AYUNOJohtS00Pr9eMH5N
0Ov2NlE/wFjntSbyR1y02n6FgXT3hDSmR9Er61orn0EfFRBHztY/mrCE++4QTSvg
XQsEJIxzzIXvKSonT9EO+0W/iYA1QJnjGG6LBKHKP8jVlaWCbryFPMILTJGEeJ3A
BFA/5fdcdGmPoJJWLoWLXxDOamtl/DcvF4TNH3cxRvx6ZV6LYVBbYlAz+12+082u
AQeXjT+oYLAB8ElSgRDHrbc622tw1AAQHDyJfchj8Mz71+P/mpKXJkYFwuk6GetU
XKw8ZUIJZmao30jZ3a5e2VmrQTDCQ363q3H380EMfAMx+6m985jdcygbPRSni/aR
X7YJpsdoBRcVRX+lPlE/Om97sdjd4NkXvSPpZdGzpwRnsDFoFBE=
=nnuq
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
