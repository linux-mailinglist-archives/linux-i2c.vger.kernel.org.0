Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9ECF61DEA0
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKEVe5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKEVe5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:34:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDE512AD6
        for <linux-i2c@vger.kernel.org>; Sat,  5 Nov 2022 14:34:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 03F42CE069C
        for <linux-i2c@vger.kernel.org>; Sat,  5 Nov 2022 21:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B67BC433C1;
        Sat,  5 Nov 2022 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667684091;
        bh=PhJ2Z+2481qDm/IulA3p4xG7qykuPuJuxom0/lIcVhw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HPWhuX1eJGA7yY3VJT0pUuU5sLEfKMzpJI24Uxczla6K9F2xDs+sXnrtgnLPlXSHv
         gv6a3/9gcxr032aJAUjXHW+Y6IyI9mGHyWBY5nynY7/uoYNBB+1gp6ZADwnhXmjgt4
         GPIblPsN6WLl0wdKnHOmMiHuHuXks+buTsutmUaRcUMLLCMeve3PCf4+QQpKT5qFJK
         0Zwrp6rsf2J9dSsT3JdKoyqD2emUsip/RAATie8eBskDG7+n9EvjQZP2FOIl1L4f4X
         MWnu5XM19TN3CXdQt7Cqg5QUl04WopVJuPDaidzd+Th1z0hltLdDy+IG2dw7BWqTs+
         qSE29tOGqHZJA==
Date:   Sat, 5 Nov 2022 22:34:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        sumit.semwal@linaro.org, linux-i2c@vger.kernel.org
Subject: Re: IMX I2C driver and DMA mapping errors
Message-ID: <Y2bW8+FVc9SaXhUI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        sumit.semwal@linaro.org, linux-i2c@vger.kernel.org
References: <Y2bC2WrixK8EwivW@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AG35fyBHiWXrJVA1"
Content-Disposition: inline
In-Reply-To: <Y2bC2WrixK8EwivW@lunn.ch>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AG35fyBHiWXrJVA1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think the I2C client API
> does not force you to use DMA friendly memory? It is up to the master

Correct, it does not. A lot of drivers do not support DMA still.

> driver to use a bounce buffer if needed?

Exactly.

> https://docs.kernel.org/i2c/dma-considerations.html

This doc mentions I2C core helpers for simple bounce buffers.


--AG35fyBHiWXrJVA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNm1vMACgkQFA3kzBSg
KbbTdw/+MMoAilYRRBYBpKuqOeCFPNH9Dh9nv/otb1Olv/zNir0HUHSM9ws2Z3gl
wuMSR3HqPWap6UQJ6ncpU7K98cvzE58xIUmFBwojN9eHh9S+kL3jnuQQbTn87+8J
6Zt7fQJW1azrPZMP8oltqP1IRP0DPsqYPCrQzLPdpAA85NT3TX8imcNKHD4Wfmb4
ItJzZ1jLhpbLtEt8jahvYOe4iVs8fW8vhoHgRdPVgx1yPExKLGakYSm1Qp2L9uSI
bNaKtKvhOWWKHA6WDDEZ3EDaM2DB+PQmakYb3ARta+U4o2r8obUKufye2lxwwwE4
SGzzhGuHEXwtfITsxAGm4c+M7jnNMYZJfWdvlwxEpLCYBTmt566nhMld9o0xr1ce
A35apagQeBi14MNiNzMTbHXT3nqn+sxFitqQ8Cu5Xb02wLHKdMoLdhD9EfKT9azp
590LVMR/9W+fZGEMlzlsndiNYkqlBWeBKf8tBo4SfH+GXVyNMEzkG+aKXkN3df2X
6fb4II7Hc2UPi6QFlkRSDhK2M97OAk6eaFqz0zTv1yZsigHwEEsQCSDuFQoBzAQf
ZMZpW9LPGqQreYH/DR6D+LXrnZ0S6ILuFhB68DVFfLEn4Tg+ROkTl5zUKF6xbaBs
uAvqj3ZWHHBMTTwp3apK8S6v3+9uI5YUpEFsODXZ1RDw3qqIn1g=
=elJl
-----END PGP SIGNATURE-----

--AG35fyBHiWXrJVA1--
