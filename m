Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E873F461187
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 10:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhK2KCx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 05:02:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbhK2KAw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 05:00:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0065C0613E1;
        Mon, 29 Nov 2021 01:40:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C92B6123E;
        Mon, 29 Nov 2021 09:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292D3C004E1;
        Mon, 29 Nov 2021 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638178805;
        bh=ZhrZMdR4hI+luzbo+GzPORQaaCnJyhm/SoWTXwO5h1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BMHoA94rKV5psCRpZ21WtLB5m8KQbFk8E3zmj5YSx8u0eorGyWG0wJTTRW+nFEZXT
         5h9O4h5ifkeg/FL4Nfy/hov+Vcis8MW4/48F8rPCSE5jBCvm7wlxTd+064RUhZaE0F
         q+ePf5i9fErYg4Bj8H9J2fbJC0xJ46LGyBPTReicugSGbGCnNrkji0Ve0qJMWvixTs
         ZraIgsoWWf2xJq5MqnqxiwGP6/u41+4CX41yiwM7g3W623DnNWaNCxMdOvNhRr3eFW
         JuI6844RWf4HvSivxn+PA7184vAbVJL/l8NYyaL7iEwIekIP5Q7n8b/ktmVuIN3+V4
         K314tUybE8rZQ==
Date:   Mon, 29 Nov 2021 10:40:02 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     John Keeping <john@metanate.com>
Cc:     linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: enable clock before getting rate
Message-ID: <YaSf8uDjGCBHcHyZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        John Keeping <john@metanate.com>, linux-i2c@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211004131539.1253195-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m5TcwiphfSOva+uT"
Content-Disposition: inline
In-Reply-To: <20211004131539.1253195-1-john@metanate.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--m5TcwiphfSOva+uT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 02:15:39PM +0100, John Keeping wrote:
> clk_get_rate() is documented as requiring the clock to be enabled.
> Ensure that the bus clock is enabled before calling clk_get_rate() in
> rk3x_i2c_probe() to satisfy this requirement.
>=20
> Signed-off-by: John Keeping <john@metanate.com>

Doesn't look like an urgent bugfix, so applied to for-next, thanks! Let
me know if it should go to for-current instead.


--m5TcwiphfSOva+uT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkn/IACgkQFA3kzBSg
KbZCAA//edcBmoIXEz3MVD3TsEFx5qCOw0SxbZj6aq1kjReXgv81FZWzRs2JzzNp
h+pO0Yxm26BZ681UJtqr8NzvlUSDmZLiI//jv4xRdkXmOSHY4OCZuK1LdIYFU63Z
sKLg09YMWpXe9HxPO0ziowG+LGDQDfjS56OJxJEpbjYnSDcWPKV8Jzcw1x5LEg76
h62m58mZHSX61FL72ay3pHhUuLbBiRaQfP7w4xSibZEsHSrYAiOLI/WvqGkEmHvL
LGrpLNCemr+5/aQ5+wFVOuide2uKFOlBJWNcNUH5MEFtlMFf+gRaTb4BUNdbXWI9
hkHqysMMDmyy5mGwDDgm3lil2KV0aAk7bNX1gO5ZZhYU0WCO6lj9e13hJZgdWu4j
s6L0xEQQ/1wYhNg0qTE+R+8wXQSCOquLFznqnJ2T7+9kpZDQGnM5E6IUUZk1kJYl
CfDbboUoRYs6wwhZ9jiIXFn2EN5KqBGwC+u8UkOIwPZAH5P96RgmEp2mdPQHH5aL
LufL2AvruEMRP0e/uFA6aRCQVmX6iUEqDGcrtIcEWLTnJUjMvkaKvY+bhpvgt/eu
VK0c3nQPYNm5RuLyTRQ7/QeNQ7XjWnDuZARnOuws1EzRf76Zs9Sc08aY1H4MVzpW
62hFBkeidXaf1cTeAiRPj8c4+twr9Nmg2oaG6YwehlF6pjzmXUI=
=zvfT
-----END PGP SIGNATURE-----

--m5TcwiphfSOva+uT--
