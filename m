Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91AED689F72
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Feb 2023 17:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbjBCQiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Feb 2023 11:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233184AbjBCQiP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Feb 2023 11:38:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA879FF25;
        Fri,  3 Feb 2023 08:38:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2DC6B82B5B;
        Fri,  3 Feb 2023 16:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0578C433EF;
        Fri,  3 Feb 2023 16:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675442281;
        bh=Lqgox4v/VMs326ZId2+JDDTRKV0sKRpXB4mOeX/kCg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=khaTyNVnQ0eiwHqfHOjx1YYcFzUi5QiX/pUi9So9oWd4U6LVVcqEV8SAm3JPbK1VQ
         wUmN+sj0RoJ2hEAzjy0ZLqgdjXvBkm/BdHM8dN2XEODc/oBs/GAMDc06byCbBb+HWd
         B09fQ6y4EQtlyP3J3PXYrrq5mUKqTSwXJFJnS/z1AlXPGIJpj/kp/fsU0hOh3nDNSx
         40IvsdNgZnw+gLryKFXXOGr2gtnE6TcYuFDZrQIouDRdokwROfX5Bc5jgHZnuzW9CV
         cNpTmb88JRo9dBwEYRGeEdf0ZHdYY+y1yIIUOKc77LTjOEtmOOhQ4GIYufcWsZcbUy
         Fooqk4beW1GWg==
Date:   Fri, 3 Feb 2023 17:37:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc:     michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH V4 6/9] i2c: xiic: Remove interrupt enable/disable in Rx
 path
Message-ID: <Y904ZrqCXBjY75sA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com, srinivas.goud@amd.com,
        shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675330898-563-7-git-send-email-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sw54ZbL/ereHNorW"
Content-Disposition: inline
In-Reply-To: <1675330898-563-7-git-send-email-manikanta.guntupalli@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sw54ZbL/ereHNorW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:11:35PM +0530, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>=20
> 'DYNAMIC_MODE_READ_BROKEN_BIT' quirk added in the driver,
> effected IP versions no longer enter dynamic mode.
> So, remove local_irq_save/local_irq_restore APIs from driver.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>

Applied to for-next, thanks!


--sw54ZbL/ereHNorW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPdOGYACgkQFA3kzBSg
KbbYtw//eGvZf6MuWEbrxHeEeU1yPDVRAJw4I6FIaowYfplhFhVmAFLD5aqaQCia
2JOq1IEVMi/GfMS0ibXXfysvsRBLhdjAhg0tQtlU9OYJ3Lj01zYESWPerxpVdz45
hrQUe4+LmVXacy9i3iKxLgHuypcr6Fz6zFwgRuOp33fU/5YYjNLmh3ty+KuO79bj
vPdNR04VAcZOaKl19I4S7d2exqJ/qq4unLyxlQ5PvUa9OAKBzAXiMg3xe2CFqKnv
S++gJyEGU/HZ8sA2oO4gnvVfqJxtz/2uY0eZcS56D2NeqITUBnrtiigpfSvk0C2x
wc8LemkcfsOYI5gmzuqZsyL+hVj7xAD/IHbOnx78Plne6Dn7XznhAzMsgiDygyB2
2i+O1F6RVXMWG/l3v6fx9191t3Q3/cMZ3ur1AArFBUizCpDp6/CKPr0f50BIfvGz
gzZIMsQRxlVxSp2K+JU7AgsWZueXqNQQsMd22mRgtYXweISer9VfsVaHtmBg12Pp
H/i1hFg69Y+vybRKzqVgmQVJ5DFA5r3ZSOheYONWj1diKqJx6NXWdsXbgQ5SG8Kf
AjBWHjjJHzH45Rd1eA5Wic72hCZ8kKPoOzNVaiFoHNfJBWHAKd0FCRbov4pirkFQ
n2jRwdX9MEoeHCKY7oYIdIH8L5z9mvlX6+5H8AMnf8XKv/YVV9Y=
=SHOg
-----END PGP SIGNATURE-----

--sw54ZbL/ereHNorW--
