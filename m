Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFCD355CC6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 22:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhDFUQb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 16:16:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241590AbhDFUQb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 16:16:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BB3D61242;
        Tue,  6 Apr 2021 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617740183;
        bh=Q+bsfrSpQMad2Oj6IlmFmbe1qijNOago3pvCd7BWU3Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GkcddUvLXSbzGodBCdqWpB+FwyGzTS/hnYOu/+GL3ttEPuqLhmEniu8go7EqBcCx6
         q00AZ7bGxTkE2OnHNj28u3TDvbPq8AVmTGXIFK+XE22mWQgVHxQEswItRl7iZiyjGd
         wKeHTJW+iT0bWCHOgW7efe5fqxzNPF1TiNEKyalsQU6Hb4SL63cUU80qztPgx6RvFp
         GV/badnawRn9I9VdLXZl9aKiEdxJQgF16ZTV9zLYhHEtMJfcetsr9cOzTJFz4cKhXn
         nVjwL2NoBvTGhNbdHL/7bj+cTaHYHyycq3+ykVeRBapQSMUTNEuqPeCVt3Xp8ihQDw
         fYEs//8AFamgQ==
Date:   Tue, 6 Apr 2021 22:16:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 1/5] i2c: core: add managed function for adding i2c
 adapters
Message-ID: <20210406201616.GI3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-2-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="81JctsDUVPekGcy+"
Content-Disposition: inline
In-Reply-To: <1617197790-30627-2-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--81JctsDUVPekGcy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:36:26PM +0800, Yicong Yang wrote:
> Some I2C controller drivers will only unregister the I2C
> adapter in their .remove() callback, which can be done
> by simply using a managed variant to add the I2C adapter.
>=20
> So add the managed functions for adding the I2C adapter.

Yes, I think we can do this. We just need to pay attention that people
make sure interrupts are disabled and/or freed when the adapter gets
removed. But this is also true for the current situation. I.e. removing
the adapter manually in remove() and then relying on devm_ to free the
interrupt is a bit dangerous.

> +	return devm_add_action_or_reset(dev, devm_i2c_del_adapter, adapter);

Cool, I didn't know this function.


--81JctsDUVPekGcy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBswYwACgkQFA3kzBSg
KbZAThAAjudLvS6fgjLwvEb7tOv/mrV3nRRLxgPY/d33iJD5FJJylNcXlL6eX3Pt
cSDZFLFOtbJkQZ8Sp9myn2TcXFnLotD5Xs4flz/vP5q0ExDqa74ekZKp9mJrCuJU
L271j9Mfp01WV+C6YNcuxgwvJtL6tSw01Y6kEUddxLyCajS6atRbspqR/nLBE2/T
00BaL3CTuTsAoPGWbffrr7nJ5TS3tmUVJG7+6nsukmQ0R6oXK3nze4YhRnVOmCWD
r3JUQ4W9syZGnyEx+nTRMo+0j9v5GTJH9W2yBYzpWMaB1UOJmvrPv/OrA33i6wrd
Cr8ZjlnFlklRQBslvKEU4ZBxiZeqhW2HmK6v/L1AuUqdniUqTTARLL9s/eq0OCDu
FgviwNVlQd5PUa+BcGAfAY+Ia6Uh8pyTiJOr9csc4be7oIsZIFzYepLalU1ZmCgc
p4W+AGKawAQP6czZXFhZ7heWKLLxAyB1xHXsSotfW32Lq/9WhtiCJqYAy+Ns0kYo
r/XotLsS+zymzvBKTC0+0s6/ppGj3U4kOZP5GLmTgWVNiem7RRfhaCM9RcC0j2oH
drkFqu6UKm+nDdec1v4nI5xoi2EFwcweiZIx1aYQHW2RBZL9y+BzPjA7TFKGrtHx
Fb1+8tdlM12yrXdkiQQOUt0E0tWUFaJM0IXF78iAtGgD1ql4eEE=
=ufDL
-----END PGP SIGNATURE-----

--81JctsDUVPekGcy+--
