Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5989E527178
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 15:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiENN7N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 09:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiENN7M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 09:59:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EC5261A;
        Sat, 14 May 2022 06:59:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01FE660ECF;
        Sat, 14 May 2022 13:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B69C340EE;
        Sat, 14 May 2022 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652536750;
        bh=g+xjDubdqC9It71MMxt/VZzJGHiKLgv6x+YoVNGg3n0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=USR88H7UqHbgW+re1jM9ZnMIlX5HMoA8oH2x5KXiZ3jk42mv9gL+pU/PESPmyScez
         3JZJ13mOtgD2lkr/y8h4CgVyhPYXGmY7VeMt7yew0QSf4NVnS8L4b1irIBK4ZXKkag
         y1+sIDmNJTz5oilzmrpj9CMJGA4N73YXMowq5BNZrMD5D5XJ3YwMTu5TH9md8lWobJ
         DY0VUs+fsuxjXDUpH6ssDYt0fhem0ZBUEKOTIcNQpxpFBVaUN3WEO3YeY4kZTEc5yY
         YydCFCxyHHA74o21wMBvoMDFWY5sw96niigUjgX65y2Z2JRQK8sGeuN/gxUG6VTQKi
         IAO7TiTEunwdg==
Date:   Sat, 14 May 2022 15:59:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lucas Tanure <tanureal@opensource.cirrus.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 RESEND] i2c: cadence: Increase timeout per message if
 necessary
Message-ID: <Yn+1qhStF9TiyJVj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20220413091410.17970-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="asp/WgYZG/X+qijA"
Content-Disposition: inline
In-Reply-To: <20220413091410.17970-1-tanureal@opensource.cirrus.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--asp/WgYZG/X+qijA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2022 at 10:14:10AM +0100, Lucas Tanure wrote:
> Timeout as 1 second sets an upper limit on the length
> of the transfer executed, but there is no maximum length
> of a write or read message set in i2c_adapter_quirks for
> this controller.
>=20
> This upper limit affects devices that require sending
> large firmware blobs over I2C.
>=20
> To remove that limitation, calculate the minimal time
> necessary, plus some wiggle room, for every message and
> use it instead of the default one second, if more than
> one second.
>=20
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>

Applied to for-next, thanks!


--asp/WgYZG/X+qijA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJ/taoACgkQFA3kzBSg
KbZOqg/9GYVmCAvpY/zjcuSmkQpOq1nTg1U2ZrPxu7uFmRWK9Jx8Rd8dh+9hHvBb
YcmmCRIlVqhwuK3aAzEd3I50Rkup7aHgoJUgireISL7XFi7+33KxodiHzMJLg+Z1
uvpsZKKRvohTiBfdvtcD2S26LB6vIYiQxmCYLapT7+pqvnsfqMBx/kLJDArB3m17
w6AQTSHsMYWifMFR9zdl/bq/f/SQCISJWEW51yZEk+4lhLQfyJYyv1GS5LoeXhmH
DQo/f6KJ1791bhdy6GqK3J3TJ4lQ6G1rMYwCuM2pJj+Ldo7A6DC/dtEsQ0uJGPog
TaLwyHSYVQZMvLM/fgCoKND0DFlAvucyehzrR8L0pWacSe3yvIK9dA2MKvM5tk7l
95sQ1yVl5RCVDKsGQYLDXKKihGH+K1p6TjqwVFsDCRepP3dYEciwkRAzaVbuvlY7
e1EjkwYa8yvjfNtlayIPLzDyBdyRMpHbedT5h075/2qq+umWezdRKkhdWuQ45c/s
5zQlLNwCw8KOUTO8DZuYvTHJPDU4pdLBmtljD7FjF77MKR7SZYV29dzwvFUGXhG2
VTcLtR75scJaA9cU1C5k2roh3f2hWk05c5DCyoV3PdHrfUriCguXCq2WzzXniF93
pnNjLt6qZeJdwYVEns2DdpBLcrYCm2qwOOEDXOptdarZv4HO1P0=
=O6TJ
-----END PGP SIGNATURE-----

--asp/WgYZG/X+qijA--
