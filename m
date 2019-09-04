Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFD2A94B6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 23:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730101AbfIDVMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 17:12:41 -0400
Received: from sauhun.de ([88.99.104.3]:46200 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730022AbfIDVMl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 17:12:41 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id BF8B72C4F2F;
        Wed,  4 Sep 2019 23:12:39 +0200 (CEST)
Date:   Wed, 4 Sep 2019 23:12:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32f7: Make structure stm32f7_i2c_algo constant
Message-ID: <20190904211239.GC23608@ninjato>
References: <20190815055857.1944-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline
In-Reply-To: <20190815055857.1944-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 11:28:57AM +0530, Nishka Dasgupta wrote:
> Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
> when it is assigned to constant field algo of a variable having type
> i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
> const as well to protect it from unintended modification.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied to for-next, thanks!


--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wKMcACgkQFA3kzBSg
KbZtHRAAhUQXfvaGpBOwnt6QQ5sO9+U8ZeiPYL2IqsqOwOBGhLpWReFjilAKXk2o
8x/xXEaituqT7t2Z/ECReg5oTMQESJBVj3hnbknunZX7etJGj9pbQGDsV9Ou0lPn
gm4JjLPiC12KM9xv1si8lTrYQJp5K14stjXHSE4YW8Xu1W4SQ9lJSHpm+SvtfFIv
6Ddi2F4XIRhx7JYyN/XDW0ABXpJMd4FayJ6G/N+vtd5N2KT9Ee8FdEcjFKD/7Vec
J050E9XXNBYHBfjtvksGwEYxBHdltnsZlmmTOB4fKvmA7L1PqqoTKi4prhGL3Hum
BnitzpIhFP1hjIyIHiOCQWGW0CvN7mmlu13vUaGJnvpKkb3vk+HSxGgxVu3kf8Hp
MXmysO8ZUUOXe8ZLWSCTiqniNtQjlrFujnmYC5CR9q4KLBKZc18ef1GaGoLmHRom
rYo5B4nMZdWntuyVsPK0UzTDJpt3KEFSHqBqJqmBRJGGiIFV8XdyHSmjt0MWLMqz
If4rX7JmgShYUnpoCTM10Y/vwDBAEQ2tXqfhH+AfzU/n+bA9f0Hr+Tqy3V+LASxl
Gp8jQqL34fs7yXc7gswe0t+PSaXM/SVelCTI3M6YIT1IZ2vVLzaowYdIMoTyFLZr
/g0zgz7p8BHKMxnNxi2bhFXKPo6Ary+Do+H+Lx1xOsgIn/UIiR0=
=Tqt8
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
