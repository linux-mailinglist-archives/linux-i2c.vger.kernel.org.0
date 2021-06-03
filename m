Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015E439ABC8
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 22:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFCU3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 16:29:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:42306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFCU3b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 16:29:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5702610A8;
        Thu,  3 Jun 2021 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622752066;
        bh=uzIHSYZZh+2ti4Lyjcok+mHiOfMoe3mD9iwI5XtKAuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aF8ob6aVb4RfLvM1ko4AVvdAdTmg6jHgW4VEynmsDDU028yaTTmG44fpYFa90EOqk
         LxKz2fFeVBdoKoK7JXJFqqlNKgakt6CaLkX9rHnOMWCjnUAR4cWF167SMb8qKdkmop
         gdduU7JMAnpSlzhC45X4V7kIqCT9ZUnYpohwlOXW2G60k+xtOkDfwUTCsF/PZNsSNe
         muEDIUYSRAxYPfu2AC5EJZo41v4FZscqn3Nr1EyinYKEQOkPucLrs4J8r1+hVHO107
         lGvjcGDxeVBWpuAbyzbdMzo3ASU6lUMQHeTMuvoFmyPnCmCWXp1GHrTI0bLBzjbW2t
         27rvw55/W2rtA==
Date:   Thu, 3 Jun 2021 22:27:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Anders Berg <anders.berg@lsi.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/16] i2c: busses: i2c-axxia: Fix formatting issue in
 struct and demote unworthy kernel-doc headers
Message-ID: <YLk7P3+vcR1hNpBO@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Anders Berg <anders.berg@lsi.com>, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4MRf3DTOTLiqoFO5"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-6-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4MRf3DTOTLiqoFO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -/**
> - * axxia_i2c_dev - I2C device context
> +/*
> + * struct axxia_i2c_dev - I2C device context
>   * @base: pointer to register struct
>   * @msg: pointer to current message
>   * @msg_r: pointer to current read message (sequence transfer)

Shouldn't we keep the kernel-doc header here?


--4MRf3DTOTLiqoFO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC5OzsACgkQFA3kzBSg
KbZl/RAAna55CJmrpcyYIHFZcE8iZzRlpr/W422av7PS0D4R03ijhO/w+cTbUNIc
igm/rei31Oe/+GwmwNEaXjLEDVUPiykzdfnahOTE/ZZX44N9nTPJzaXRNcn4vLJG
zp0TtE68rXaFzf6CLPuAfMGe1dcYdSrwOZOjHqbmqV683QdgzMcl2Q2lsAWN3ik3
JcZUeJIhMFJOqA9kMORUUbIjuVDrCZpo9KA0llbBymZjmiLl8iIryLoNaLget1Uv
QzEuDmmzebFwQtEwj++WoS07J2gmtldIdRivx8wNPRbpUkYC8Xi5q6+dEMe3c29I
iyrm/qt0ExqybFT5ir2eEJ4pzpPyneh9YmNWe0QJKWNjxcKKku3IST6LJW0b2Eaa
DbQFFDyMUTgVPJURyZHFPvTkRkLgI7NDXkU/Y8kxFVwh+JficwMUN6wN/AyBRf5a
oX+MgrV/Kuq04Uviwirh9Uw6K3etKGGusWxxhYsclB9foYwZ+Ti81uwtm3Xtg/ZT
YQbJczfP2TSI9xUnENhRXugEsb/bRdyZhdlFj8zaDaFPpVEPVKzD2+4iAWzdPIpJ
2O8GG3cFKuHIGHoIDOPp8IYwMTn/gNiQ3pYFD12GtPLK/CNV/N9PzOpJ0GR7W0fB
w5BTSMDa/N2Z5jlBoDLrNeyG8PnX3yU9BRSCua4u8fGzS8knluM=
=5uji
-----END PGP SIGNATURE-----

--4MRf3DTOTLiqoFO5--
