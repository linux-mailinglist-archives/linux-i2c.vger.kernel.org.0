Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA334B66FC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbiBOJIa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:08:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbiBOJI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:08:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8DD13DC0;
        Tue, 15 Feb 2022 01:08:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90FA4B8180B;
        Tue, 15 Feb 2022 09:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E460CC340F1;
        Tue, 15 Feb 2022 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916097;
        bh=SN/qSQtkakFq6Ja+CzRhX0c8ANkK1fS9EGs16P93Xzk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bx1fLh9SZuj11Rjs8/TbyfQL90VRc0W9KdVnpspz6a1vk8J7ReI88p7payglehVgx
         oWs8J7h7FZmhNoh+KHspELb4C4KjmgKijGEk3IvRUYYp0oFrBxqDDticjis7lRAN22
         vn/D0/Em2Pk3KMxFVN3wyLMzTj9prtP0oPiYq6Jjj7hqfCo/GP+KAbOUPDlEA6Mju6
         KGZmw8DV1PiErDZCVnAeBX2bXwsrbBhrjNhxAxpU/8YimzecnT1ZwJ/gnjoLIWFm8I
         ufM5xPjbI0Oq81Te8r2kO6+cCfR5xON0trV1AfO8rOD2eCaa0bSUUsGgRnGZHHZDWy
         baf+c4RQTjEYA==
Date:   Tue, 15 Feb 2022 10:08:12 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3 3/5] i2c: nvidia-gpu: Use temporary variable for
 struct device
Message-ID: <YgttfOE+xpUdcqls@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <20220105141935.24109-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UF6i/WrmjEYXAod6"
Content-Disposition: inline
In-Reply-To: <20220105141935.24109-3-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UF6i/WrmjEYXAod6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:19:33PM +0200, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--UF6i/WrmjEYXAod6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbXwACgkQFA3kzBSg
KbaDbw/+L/h6+BYJRWNjiwd1P7jujhXN+F3mzpliTmn5qbegounjLD9KKfxJTrZa
gtIVVNH2glCrflr+NWMTMhjjV7AMj8iNIThVQm+wFpVsUOpgJ+LqrahNrW5Rkfnc
3JfQX5BO5uRCc8aKy2DZ/joDv1yGSPOURnc7+twhEUoGZJ2p/U/zMjYjJqENe581
jCqvEO8h2KmbSqJGpXClCjNrSgCQ2ZhDwsfRqZZvBPzohkri6e2E5rpYLXDO13Ix
FEjIHfVYLoOmTZXp8++s2CcIVdXMlkj5NvnYV5WpNmDvxsh42Iaha0hr5rfuLpE5
5npKVUQ5YVM088CpkmUX7bRjvYXkbksg2ZVY/EjYAi52LVmCKCjKOsmAytUSIMOP
SCwe5viBwktZoGHCKb3GiB856foxtijXLQ7KZhRyXYKIntwFXPerhyFPFmaX+8Ga
lP5GXkW7N0Rs5BX98QGZeuAmt4fmEfNOAZJ0kpUaCxRYu8H7zVJ3dC3qrwa2Nme2
LrPTtyhPQfPSt/97t9G6wVCR97IVIX8fdy7C0shi4AmjmDsF91D5G9Veo3ENI9vJ
uZLdipy1ujm1cgcePYsdojxWj2GOgYG1PMD5yOrlpBqQ+kj073uU/QkWx5s2WOYo
lx1Zhcf/AgtfdRPEqA39ZLOw3fhxGhE5b0BfkFpNLNLWCL00Pmg=
=Lxe4
-----END PGP SIGNATURE-----

--UF6i/WrmjEYXAod6--
