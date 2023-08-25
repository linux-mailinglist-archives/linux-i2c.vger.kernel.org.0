Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A50788F81
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 22:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjHYUEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 16:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjHYUEX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 16:04:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382492689
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 13:04:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9D7962AD0
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 20:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AAFC433C7;
        Fri, 25 Aug 2023 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692993860;
        bh=5mVM01iITxxlAs4ukrQegFEkqZ/IJI7Z882Wwqb+fBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FF3fUlX0hJuxjOa/UAE/Rpj/utycUixRbvvax7K0OYF+dxIiWglQh3kfDLhude7wB
         0CzDQvCdflj892k50vsokfGkrFrw9WL3JC6jnasNksTDuDUOeSzxJno2txgJYWEmNq
         cDW2rSGKl8f/btMPtOAt++qHOKceg3OVEhlqWHDCKjke0jsTy5i3JEhD7crxSUrmuK
         odTPM3QJylouwsIwaxYAs+g/Pm5gkc4asDJZRMUjkAwox9gz+uBtJgN2ihJxAci4fb
         A+/0Zyb+8YGMgpox+E14yCrRi/d/hdXaxwWN7GNtUfY5auolfmz3Gqt31AVJylz8pb
         wx80XL5dLK2oQ==
Date:   Fri, 25 Aug 2023 22:04:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Hu <hanshu-oc@zhaoxin.com>
Cc:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
Subject: Re: [PATCH v2 2/2] i2c: add support for Zhaoxin I2C controller
Message-ID: <ZOkJQe4QVeCctbFL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
References: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
 <4b85bcdfb1d04ccba7988ed7931c33b7531a0a4c.1691999569.git.hanshu-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4/i6599i+BiB4VfE"
Content-Disposition: inline
In-Reply-To: <4b85bcdfb1d04ccba7988ed7931c33b7531a0a4c.1691999569.git.hanshu-oc@zhaoxin.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4/i6599i+BiB4VfE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +I2C/SMBUS ZHAOXIN DRIVER
> +M:	Hans Hu <hanshu@zhaoxin.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +W:	https://www.zhaoxin.com
> +F:	drivers/i2c/busses/i2c-zhaoxin.c

Are you open to maintain the viai2c core as well? If so, then I'd think
adding another "F:"-entry here will do.


--4/i6599i+BiB4VfE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTpCUEACgkQFA3kzBSg
KbZ7Nw/9GwszpBjH+0zYQcnTygPRjGhjNm0eA5zwIflKDeE8+ojpfZFd2gjr7dOw
k2g88DnC9I/Gg3FTEdJGQuNpu85ubMZHHGBFT0pzafq6hyFXPSAyhSwXf5GKin9i
IaC7uUQ6yHr/hC5ZcMHrB5tClVZFcU7Mub7Vae8NZHCm9dhieO3vM/8zf5j8bNml
IcE+HXUWn4h+yZ4Z+i9/17tgwkx/zTuPWXNLIBgzs03XjBsI1tqTas5Pdj2yDePv
U3JSIyJF1xqxsyq/t7cPA3RT8jrF6Q4RbFluVEhr1A1jaV0O2eZRuoL3DXMUzUYa
xSxuHBvRPddSlLSeHIoyBnRNrHkAZRt8EmpOl49yh8pgYB9KAjb/1Z0L7u2npiUS
74Eq1dl8uRV0Uz3lXKn+2Yg3/hAE6Ni2dV6/ZNKtjrSxc6RJud+iQUHD7kEEj16Q
tTcWPfcABQMPxn7nHrnnRToEQS8biFCBAJuyJFeJ9zF8hiiI+0W5fY0FsmUWn+33
FRYWuNUsXxn/EhS0gWsHUC/qsXS6iUJrLPhk6Kvz3H032rUyxvVHeLrDvR9mXSsb
B5MveY4SI4efSUuC6YiRc63WqNWhwWmQvObOC7p0f4qzRVO/ANkKdGJ9PvX6JOfT
wPidHI+O0NmA7/9QN7Y4dEBzfrSuU9im8a9/pGVLIJ8sD+WGe0g=
=4pAM
-----END PGP SIGNATURE-----

--4/i6599i+BiB4VfE--
