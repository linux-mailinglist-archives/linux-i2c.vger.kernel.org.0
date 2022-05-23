Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF6531B71
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 22:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239693AbiEWRMr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 13:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240343AbiEWRL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 13:11:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33F62F007;
        Mon, 23 May 2022 10:11:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69294614DA;
        Mon, 23 May 2022 17:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F42DC34119;
        Mon, 23 May 2022 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653325779;
        bh=49TG0H75Ya9Io/9Ra/lmXTl1jm17VfmzpHpMWj3rv+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6xEBdre8qQxI4OPS0gvtMDU6OupCLO/qTN0Vdp+kRmb/+GNJjBaHIyrlHP14WTRN
         2lN++TK4jQREtckUKH2NUto/WNrjF3u22KWjdyG5QZ3ptVF85LQqQcWR8HJyavvj9y
         jYdoQxoRXO1X2PkTLqTbuvxNVwJALvnBfwOpjXTCUtffsQYXN8Qm/cflYXjBDXkVY2
         P9FTgBolGOA95VyUeWovObgqdvfUhtAT4FD6eNdwCaUHf71zffDAih/Go/Bf6oXSvp
         hnX5DoGCEvOugX/b6oXjNfeW8ZhOGscpvroLH2D6AMZIlZYDpNPdvknFAoxPn+TH0w
         RTZdx64qsf5kg==
Date:   Mon, 23 May 2022 19:09:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 3/3] i2c: ch341: add I2C MFD cell driver for the CH341
Message-ID: <You/y4Go+7ZvXgTz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Johan Hovold <johan@kernel.org>, frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-4-frank@zago.net>
 <YojVHBofkBOFVYap@shikoro>
 <Youtgr7a3dw58KT0@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qOyTUoqo6Ka2qIM3"
Content-Disposition: inline
In-Reply-To: <Youtgr7a3dw58KT0@hovoldconsulting.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qOyTUoqo6Ka2qIM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> There's no (longer) any difference. See bf7fbeeae6db ("module: Cure the
> MODULE_LICENSE "GPL" vs. "GPL v2" bogosity").

Wow, cool. Thanks for the heads up! Sidenote: just from the title of
this commit I guessed the author correctly ;)


--qOyTUoqo6Ka2qIM3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKLv8cACgkQFA3kzBSg
KbY4RQ/+Ieko2JdoUgZRAjmlX7cy2lxd8StL9yenYst/u9weA/o82dLUA//dpudn
ym8yTzgPIA0my2AL3k4tC+WkSaWBiUTThJvOxwtaD5HrlvhAaP/zwnjWJQUnY1zu
aOWscNepDIN1yXPda3osYeuTO/jq0pfKzO7k/4A8Kn4aFWlkozx4TiPhj6s72Puu
IJGoDbwNbGcmLcoyMFCUalOYUI5mbVbR3Mle2w1uMFIuCR16wP+5TnOlW6GVqm4R
7KBHa7efxQ09DgYzk11JmO5ztGbQ96taI5TSbUjdAaEUOrU4MDCISrLo9poniAB1
ZgW4c1aWFKZvBl/MZ5IxcFK52DpwZWfk+WVNM281javS6gUvDh0tzAZmGzw1kOek
pwnNDV9IzWvfGhlcawbtKjqV0yoYFAtzK1cQzpauS8TLj35piYkdJVnuCmj/6+yc
qJYhXSM5Et8PGXPiWgxd1Umtt+YFwLgyxtas6dV2LUCDtBxRbxhdIg8L4MYBxd9n
zVWZNIpELd3rD8E1HKDDtOaiF5N0wYH8rOzFxQXq9ObgCvxHeElXrSoROg7VQMId
c8+21NWHYFJ0I024N/usdhrsPGxNpobgZhvhD15gF90R3hDQ80ySR7Y3MYRyCpWG
BdvDMl8A4rC5JEaxLYESS/9Hy2kWH+83BkIjC6PZVJSvAZGaVAQ=
=KYIA
-----END PGP SIGNATURE-----

--qOyTUoqo6Ka2qIM3--
