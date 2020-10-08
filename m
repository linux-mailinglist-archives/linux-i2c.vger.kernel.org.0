Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953AB287402
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 14:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgJHMZi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 08:25:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:56310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgJHMZi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 08:25:38 -0400
Received: from localhost (p54b3300d.dip0.t-ipconnect.de [84.179.48.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E8BF20659;
        Thu,  8 Oct 2020 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602159937;
        bh=o6Z7jwkeLNAsDIH82eEahJv02dncnJeyM1PAeQ4qU0s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EOImO9W7FH1ja9D9ewSi/tG3cnIM8pXNfFNMk/1fjoQDEeph1pIrzAxaShvMpoKjY
         N7BGQqqlhmMU2NbG5mWR83nIATjshAwycNJyEd8j3SBISAd2rjnK82ps15BGP2jFs+
         knlD4ibU9sF9ivSXfwc23Ae2vPHRVoV7c0HNmjHk=
Date:   Thu, 8 Oct 2020 14:25:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: mv64xxx: Add bus error recovery
Message-ID: <20201008122534.GB897@ninjato>
References: <20200826223516.29737-1-mark.tomlinson@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <20200826223516.29737-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

oN tHU, aug 27, 2020 at 10:35:16AM +1200, Mark Tomlinson wrote:
> This adds i2c bus recovery to the mv64xxx driver.
>=20
> Implement bus recovery to recover from SCL/SDA stuck low.
>=20
> This uses the generic recovery function, setting the clock/data lines as
> GPIO pins, and sending 9 clocks to try and recover the bus.
>=20
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>

The timing of the i2c_recover_bus() should still be improved, but I got
the idea to add a helper for that to the core because other drivers
would benefit, too. And the we unify it for the whole subsystem.

So, applied to for-next, thanks!


--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9/BT4ACgkQFA3kzBSg
Kbae6A/8DdmYTAWbuNom1QmLqpZwIPQXmNYpU08/FhVd6sUArs1dW9OEGZGEIUPn
YYnUqSaVkUHZTpcQtdkpZYUw1QBlXotxAeanjcoOO6w82vDFQseGlcIhCewwVm3p
8RxRfuTi+jLTcdYVq2tkhG08BNFSso2T28eLhPRgR6nHCBGaMJ92zUCKJS0EpTgU
ruzgGspEuKdw+7PDRmdkrFZrZRTV2D6AlfmlmVXfd9TC0QdUbooUa/AHSH+adxvD
YYGoEcAhJ3wSNBPHykByEkpITo+hhMiPIi7I5VK9CFWakmZHMlyyGCWfZmOdEwi+
JVHyMGtAD5QDNuAHz72nvC5gL6Jr/mQXbRJ85cXWeaPl94tBaMRuaqSQ+gXL+wkI
eBqpAeyxLSpu2hH6dbyJ2L/oNeNMKDx6agF8WtIKTmxERyFHzrUi/l40oGnVWW5d
2myqeNChPSbTqDrO93MjTYK3RY4JmWEl1+Q90DmY5KRhodD/rqBJeA0I4gKa9G7F
ABIhr8n4X9LWAFj1WhnL9WLtH7JSgBtKBm2/v+ipjfoa6boSXS7rR4BipJ+kW/K5
xd3g/XJ68BZHvpQ7r+K8ycYXBG7a1S4zjxdgLYYxWgIJZzpcvyW/6JOWv86lFVnT
myfIC60vqSrbvxQwdzNC/n1xS/HOyoV82J5qHuveNwB8gcZ0AAY=
=GOef
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
