Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DA83403FE
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhCRKzA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:55:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:48778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230079AbhCRKyt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:54:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 304AD64EF6;
        Thu, 18 Mar 2021 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616064888;
        bh=jKNzxVOtluBlw3sWcfi2a8h55RR1kuhcHLwoPXUuXNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DhnnIoJN0lNOxbLTPyMz8PT2FK0UyXjuPbDoNFgyPoo/bEihuxYqr/npgPYt+Eqi4
         BtjFysjtLHWPqewCE9t8v8leKgW/jDWrcQwklfPiZhk0VR9fk+Cx/KfmY7XCxgZWgP
         H1Cdpgi5X8Duts8q2od38N5pdcZNvTG8GoulyQpktFYJszJ+xVEISC0bqR7Bb3ZPZM
         x9XZbOqNVj5LMMvmHUv1+eC/2e+KhHcTokLc0ESH07W2ZkyiHkmYc5uhUctBCImXCC
         7ANbR6wK257lwVjyZVPe5y97khYwXHdBbCg3KiE2MH/G7+QpSu4mUoIBRUTjnI7MKz
         TCV53GjyE8WWw==
Date:   Thu, 18 Mar 2021 11:54:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH 3/5] i2c: stm32f7: add support for DNF i2c-digital-filter
 binding
Message-ID: <20210318105446.GE974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline
In-Reply-To: <1612515104-838-4-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:42AM +0100, Alain Volmat wrote:
> Add the support for the i2c-digital-filter binding, allowing to enable
> the digital filter via the device-tree and indicate its value in the DT.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMXYACgkQFA3kzBSg
KbZGvg//Qt/rXoaq3I2LSLApIOkG9Zqt6hluxc/ZtzNTzPpac8rf3Pgygn6mFwxK
POSs9/q1k1rwtQnmmypL4fPvZ/SBiyEUSzGURWcx/hPw28P9kGNxVD2TZgsVzCgt
TVr8Gj5CmYFxyuDTnhk2hWloPUkCGxmg30+Mv8WZG6LaxQDNBxizxl5TNh5nj5KX
DOA1rhb8UbM/mV08Ce+2w10Ey5J0rT6xSmjPfFP9yol0+bsf2O5gVddyXWfQoUnf
Zy0IgVfDrZFbm//4ORn10BuWR0pAexwiUw1wjEn5+Kg76jUHkJMLUMUtgDkhmHKt
HlenoBaDSCTV3JdWJTeyq4EMeACCK01/DmavasUM7QqFtFiaGs0MxB+A6+NA/0bk
1joVv8VruYvOeAMEp6sd3IOgU7KKHEkGuWWLHMAgs07NkO1156bbso0S6fBntC1G
NwLEvdw4QhqDZAMMI/CDOzNfdQuLIEx2O4Dg3PKF/S1iuZmOZbRUDzP1YM5KkXLx
eOfug+uTKI38fz1R7xzB/Eu+YTJozPiP+SCqn4O/Ji3BAMUO1CTuat/FBTTLCOxt
n5yeSwtYxuqcu/Q9w3NGdzlgVZPNYa7a+Osm9yuUV1fFJicuYa4iB0huIdeAloEA
w6sMnkcgop193dfRKUDaJicib7c0qUX+wRI9Tl5gyPePhm8fuiU=
=HLHK
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
