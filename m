Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4604D697F
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbiCKUfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiCKUfG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:35:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7A11CABDC
        for <linux-i2c@vger.kernel.org>; Fri, 11 Mar 2022 12:34:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CCC060FC1
        for <linux-i2c@vger.kernel.org>; Fri, 11 Mar 2022 20:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1835C340E9;
        Fri, 11 Mar 2022 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647030841;
        bh=uww9Nhv9VKyrSClYeMpPYyGd6Ws2Cbm/cJ6C2oxshMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IQfIY56YWyuYSSqM42BkoIWxgplsVs2Q45E+x+wsCnzDm4q64YZzWXkposGo2PpkK
         mzDd7T032DAE7LUgikvnDlPYWBgxw+Qma7tmz3q7dvNP4TgcyeoDhDxHt476TzzUTP
         2e8BtxkBOE71IHToe9CE+V4/Q/SIkWmrxNVnWFruW5o4j/ZdPwjWEkvPzZ7NU2dfqv
         8KJ15EdPhLnZXI+/HTMvA3lcVwM0UX/AI9/BqTQ1DojDL3tT7EBqoY1PWlSmQr8XqQ
         WM/6AVbhS9o0DbthEincH21SiFiQJaNQCYpmwu3AFL1vPAC+HSvvLd4+eYGQjW6Xdj
         UY/5czIZgoAiQ==
Date:   Fri, 11 Mar 2022 21:33:57 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Drop two outdated comments
Message-ID: <YiuyNSay807lf5fk@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20220303174256.61067165@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l4345nmBgghtUJM7"
Content-Disposition: inline
In-Reply-To: <20220303174256.61067165@endymion.delvare>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l4345nmBgghtUJM7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 05:42:56PM +0100, Jean Delvare wrote:
> * Timeouts are reported even in interrupt mode since commit
>   b3b8df97723d ("i2c: i801: Use wait_event_timeout to wait for
>   interrupts") so drop the comment which claims this only happens in
>   polled mode.
> * xact does not include the PEC bit, as the driver does not support
>   software PEC.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--l4345nmBgghtUJM7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrsjAACgkQFA3kzBSg
Kba1GQ/+P4Gw64aZVQ5ItclxcoEYcsuSGD9FuyHdReGhxny7SLNGi81UKZvpGdnx
ZB/XDOF62hpSVmHHT6JMc77oFZL1skmNTTj7KYQh7yIke92uabfeHwY9IgdsaJvn
NAgGxEgFEe7VQipXva+y8WgN8B+hG+XVGWckEapOh7d6bSiy4S82wtyivQUon+wM
H3Ew2I9o5ni2Ev3QrHZEDCVuDNrQlRIGjHBTs8qkfBctoPiBXiAPhPqv5D2wRxpA
nHB3jI197uvFA3/o8zBJNYA6DilrtApg6xRpNV8svsKpZRJxqoq2P4FhTgW04wzY
fs94rPnpJtbTxSsyT73P5LPkhyG16+XWuW10e3GnfWhaiL7WhpMQ+ubyHkrkf2fW
M8cqGEuhSF0bcz0+KtYwTCYnt2gIBeEnOZuNe10RDufHZGy7QaMm6/5acJ1YJE7O
QLFYXOzC1qdBkWlj9xdhaDiqxNxiFGbICB1VYRqrQFFz0OlKAC17E2//hc+VFaMY
6Rtzy7jXU6ki/T8eKZeeAD1H70Aa0DzMsx6+ThtXyxIFRPPaPkRrToEkwh8Noa4e
m0M/9vH91EDryNXjEZvj5XfEdGG+rFUnzDDqpswguw4ApKE61C/KVNLnhVjlsqfT
s1WRxdBAf1SLo0q/NdGXrSa5gTdl0bfCsZA7BcijV7BrD4DGAUg=
=2b6K
-----END PGP SIGNATURE-----

--l4345nmBgghtUJM7--
