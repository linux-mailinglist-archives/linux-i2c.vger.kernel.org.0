Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433112707B8
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Sep 2020 23:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIRVFN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Sep 2020 17:05:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:58516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgIRVFN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 18 Sep 2020 17:05:13 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B07A0221EC;
        Fri, 18 Sep 2020 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600463112;
        bh=dpb08hE09jBPRdkn15IWRt/QrmOknQ1HRkHqyf20KXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tDDXBpQzyl6dhlcVGfrJs5FtPIpaGC8OyLjEOW2PkjH5gKJxC4KVxLaLYYsMpjf7p
         lxAbg05GWJHOQTB9yN7p0U4y/Mmz9X9l7g6DitcQUwxLbw3ulynsoi12c3Shjd42jQ
         +YyXrj6BE7Tjpu/CUD/AOdFSRra2k1641bk7olxU=
Date:   Fri, 18 Sep 2020 23:05:09 +0200
From:   <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/2] i2c: stm32: fix slot id after introduction of
 host-notify support
Message-ID: <20200918210509.GD52206@kunai>
Mail-Followup-To: <wsa@kernel.org>, Alain Volmat <alain.volmat@st.com>,
        <pierre-yves.mordret@st.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1600161090-9899-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline
In-Reply-To: <1600161090-9899-1-git-send-email-alain.volmat@st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 11:11:30AM +0200, Alain Volmat wrote:
> Commit 68302245720a ("i2c: stm32f7: Add SMBus Host-Notify protocol suppor=
t")
> added a new slot specific for handling host-notify however failed
> to update the previous slot ID leading to having the 7bit address
> only slot with the wrong number.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Folded this into 68302245720a in for-next, thanks!


--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9lIQUACgkQFA3kzBSg
KbafphAAoa0nTp4b2b7E1ufAY1N8ww4hjlo/M2D4JzKGWVW3NXIs9vaEX0/+b4IU
Bo5jLOVMRFsQZEU/HyHmlWRmEQpDNPsYR4JVJbnpUV0WOVwbVA0zXjt5XYCM8Lin
EVJeBWsPLJhALmwpo0AUAc8UKE+wczTUMq8YLPBLZtBTVQN/9tHoslzYXNUZvTpZ
9O5v3yn2MRvz2Aynl7djlY23DyGbzEOL8a5DYWGxYRoIlMVc2jfZYT1A5fZVEcrE
KI/R6ZDrzhecvz/wu6HNvVp0DZpA7PPLujYkIPFiMimnpe77UyP8QNMnsYhwyiBH
z5NG1+vl37wxHL6u3uQEKB9Tzmf617l5M1YOO49EeJjsHMz9fIiM4je7Zx7g+M+n
FmhKq4S/LiKsLKJ0z3ZCExx7k+rNIDS4hyR3NUiOdVyWCMU2s44Sa/moZzB49N66
I8S4JPiIcDZQM25Wyueg5VRwdrVxrebck4y+3vhwaMAVER0sUYWpwjEltttAzlnh
Wp/hujBOD7Btbabk52yPQ05h+7sQwKpPv6Zx8hIBUXbfukzj9bxMoK3/W2KLvaZx
lA6HJdFRh96mMWiIbcyqoHI+WSvQAAjNBevcP6dj3sxhg0t61Ic2VTwcw77Rn2HZ
76Eq/sPkRQFXNKGXncSPqjEYorjj2StZQEIFlGsYPXne+B87GhA=
=XHoh
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
