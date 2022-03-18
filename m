Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1FA14DD856
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 11:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiCRKn1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 06:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbiCRKmf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 06:42:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486A92D1055;
        Fri, 18 Mar 2022 03:40:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6BA960C72;
        Fri, 18 Mar 2022 10:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79C9C340E8;
        Fri, 18 Mar 2022 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647600023;
        bh=9EigRmgfboGp4xvX7jkm2Ur4+GANDeuu2vr6378NbcY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bJIdFtHx13okaJZuZEMmaAX5PPGVklMzIjBxf7+lyvQvU2hOgKDHAsOVvwMpB4w8G
         /YxGkj9VQwigKkJ743CuSw+zJ8HsNuzu6nGjkghJyQHgnPSFDFQoIU8qPn6odOUx6l
         uYMvmsschSqIL4XN5LF66JhujhiPLB6Ma4aiMqIPlAR7DpmQxD6zF5ALxXlpGT6x3p
         ilRHYydm88ktR7IKw6GSMC8qQ4qkliUtMdYa4hjUf/gqqM+e1UdW0M416PZX3NJN90
         mpKPzrCSrxvqgehXhBuRcSrmCv3Vgmd6JI3Jq9LQ+cyYNJgP9fLyBgiTIobxexgK/k
         ZsW69m3goCtBA==
Date:   Fri, 18 Mar 2022 11:40:19 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        upstream@semihalf.com
Subject: Re: [PATCH v3 -next] i2c: designware: Remove code duplication
Message-ID: <YjRhk652VUTziesf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, upstream@semihalf.com
References: <20220314090323.272071-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LBTn3Zyl7uO9TW9q"
Content-Disposition: inline
In-Reply-To: <20220314090323.272071-1-jsd@semihalf.com>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LBTn3Zyl7uO9TW9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 10:03:23AM +0100, Jan Dabros wrote:
> Simplify code by moving common part to one function.
>=20
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--LBTn3Zyl7uO9TW9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI0YY8ACgkQFA3kzBSg
Kbb3Qw/9EVSCFZyWpjwt32l/cvjSESmE+rottfwYM8ANHVEx2fAG+u6n0nrqoItD
GGIcHCcWYIbbpd/cn2xFJN9KCHCpy1UQPf9hEgh6E8YwiomPBnQ5XZ1dT9GB0Lsr
3+cG4m8j5qQbCINVnnhjTG/h4gj9t5O5LOABSjyoD8MAIahkUgF0QF9nSxvxPyYR
Xqj4Gln8p5p9ovJxNR8AAz4q31Jz3skcXwx9VlzDsavz/BBXgk9+r6y8SmBd2weF
Rc8T+aA6Xl2uQmyVQxcROnDVXOnkzbpzmnrF2DIxr+bclYx0V5vwOqsh0eRLiQt7
m4+XLm6IQ2za/+9LuEhPfPdan5EVllT9/DHEfn8rsXJQGfKcgmr5A+YjKLwi/iYG
w9TGz+UkLK3TqeIDWxMDQ+iSvKKAtxcDcWg11Fi75RBG/TXQwNDHEt2fd8ZG+s3W
dNSel/bfINv+/2mseqDZqhEWzpmw6xEo9p7JdgS11e5N+rVZE8PFhV9VnVxjHjE6
ScsF1LSfrK+abLuJU5kWYFdfPBxrvBNXPVSQuzFvKtxpxR10cShcRt1PWLQZSOsQ
tCmxAmnnymh3saKM1Gwld9fII9DvgW5SJb/glkUjeuyVJjk/Mv0eGUFF547QmlAb
f2iD+nvjGpnlcXweBCE6Ko0NMsGnKOi5NoStkjlU9ilzJdf4spY=
=Pqpr
-----END PGP SIGNATURE-----

--LBTn3Zyl7uO9TW9q--
