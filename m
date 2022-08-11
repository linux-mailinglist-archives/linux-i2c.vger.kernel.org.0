Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33F75907AF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236217AbiHKVDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbiHKVDx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:03:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558A585AB2;
        Thu, 11 Aug 2022 14:03:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D61661387;
        Thu, 11 Aug 2022 21:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5B4C433C1;
        Thu, 11 Aug 2022 21:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660251827;
        bh=Hsjt89sNQ7GT6CvwIdO7n9B2eYysYbi45avieRmPzL8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=It85k03fS2C8yhnDGJ+ZqqaLor+ETa7NSAjlJ4iOHZgy2O6rBhGPDMYFsOZhKkZ6Y
         NEzB+rSSXdkXwSlxYfDNycIYQCOfPmwVYyavE20bV5Opwu/vgmzr/HJNcPdVcIS8ty
         6e7KFQcsuUyZUcIbmoW6G9A9BmG2V0m0N4EgUGc9uCTcOyQCvUl6rkHldfCpjZ0Vi1
         5wcsy2rea0ZB++k+FkH7dW7dn21zCG5UG7sgb4l412wgW9AbPgjiXddEoIfTjXCC48
         V4RtYf50juhWWxDOanL/rrmeG29doObBRG1jnbmcI4aGXsBgvTqeDG455Q44M0qQcF
         DTofQ1sE6UKwQ==
Date:   Thu, 11 Aug 2022 23:03:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] docs: i2c: i2c-protocol,smbus-protocol: remove
 nonsense words
Message-ID: <YvVur/FAlLejcUPG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-3-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Bws3kkdI+cN4ry6k"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-3-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Bws3kkdI+cN4ry6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 04:17:01PM +0200, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> "as usual" does not mean much here, especially as these are introductory
> sections and 10-bit addressing hasn't been introduced yet.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to for-current, thanks!


--Bws3kkdI+cN4ry6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1bq8ACgkQFA3kzBSg
KbbUyA//f8/3kSCrChkgR9iPRNDGVHU87zZUq+cnTATo0Bv9MZeTnhtU5BZ7R0N+
vaspEW0uZKBh4mcq+IBFWsO+pOd4AbxJqQ1LmAq+X7q4piqRql4SBruTwqmtK0vk
P3yd0NHfuj4kB8jR7uz5ibW3Xlcw0sJ0tRiIAGGpcQPjWQMibHwi2xUi4g7+B0HU
3BR7fyBvWs2kw4Sb9LBcuZPoTQ+5yVBLM9846lOhvCAuevuceeAA9fb1fbQTcpUY
aA1GfC0Vwef/cmq0fXnMHjoB6DcfqahDO9LskUZADM0ls/H1niSjLSOU4mPusmuY
g/5ThgA/BHJSNBvJPNX8JV+G/JvYhNf2b29ICQJkxJsCivjbEgVYKQWXg52U3MIM
1/YRiOXGKo7DcF3Uj8zCmfGPygCrmpq9Ds1ti6l0/LQIIYu/Jf0Bsk/R52O414gO
TFn4KRb/gzKe6FzGOK8rrfs/P7FrLy/fJKIwNUE6fao2k89sjfbm0PTrRz/isd5l
fA+xGo1TzyrDiFMtIty3sxs995U1teJJbFyLa/TKRaavEpKXq6xxPmZT3xgeQQTS
BYVwRuvZnz5QwBspE4SKWzh4/NvNoJSbiJfq12zjZtQbIzrryov4k2xWqdWTm9mG
/A3PEPDpQtMqnIwfODlNdl6tvoVg6lUKLcAVllwbvw8tOXYd2Eo=
=/DDw
-----END PGP SIGNATURE-----

--Bws3kkdI+cN4ry6k--
