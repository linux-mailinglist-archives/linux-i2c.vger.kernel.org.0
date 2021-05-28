Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A134E39408C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 12:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236316AbhE1KCs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 06:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhE1KCr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 06:02:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 129FB60724;
        Fri, 28 May 2021 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622196072;
        bh=EZzjk3iulqzSSED+BNkVWiloNQE5u+lSnwPrvuKNx9I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FcTfV7zqNMlfqVnVPxOJLfgylEJfyCBhYwsdZW1zN0dlRZYhHv6B8gxZpTu9RjKdw
         rEHqh4cneLD+bQvlZTVPY/moLmjvciaj7vLpt/HHfBC+JeGV31sp1u5WPDnb22tadT
         mfXXilBfD8NPWLIwQNwrQcY6Swea+Do5LUBff0df5WTKzgSFBl2kJzk6JB/KOsROgs
         Kv03o+NWVcaY9t9F6LkFBjfy0Z+/T3J01/hH4/hbfWKeWfgUBp7ggfQbzLCrggLgC+
         4CPJLbof5PapM90zo1MEVSlv/4QOEiSN2vTu3DDau3CDzkyEZWjKq55Q+qjHPIylWy
         WVALPfOlKPrRA==
Date:   Fri, 28 May 2021 12:01:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v1 1/6] i2c: acpi: Export i2c_acpi_find_client_by_adev()
 for users
Message-ID: <YLC/ZUj6vKH8tIMD@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
 <YLAAedlB6UaJQh0X@kunai>
 <YLC3HzCUhEYmfckj@kroah.com>
 <YLC5IstyPFQA6mBp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wx74LGToWoGSUiea"
Content-Disposition: inline
In-Reply-To: <YLC5IstyPFQA6mBp@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wx74LGToWoGSUiea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > staging drivers should be self-contained, do not accept code in the core
> > kernel that only is used by staging drivers.
> >=20
> > So I would not recommend this be accepted at this point in time.
>=20
> Fair enough.

You could add a comment, though, so we won't forget to remove the open
coding then.


--wx74LGToWoGSUiea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwv2UACgkQFA3kzBSg
KbabXg/+Pcr9bHpuaYh939J17dwyJYjgd9fcbBHurNxqwgcC64efyNdJs8ygxSTn
zqas6udT+JPcO5MpAkXvw5teCHX3ftaj8FSjfh9NwC6Ja611vBnwmuoritRQUH3/
3xtjNJ1XtqT1VawVam0jK8JZ+Rg7Je1Uyfjj9Lzq/UGC1wH/An/wRzKzDFa61/bl
CJzc8DLSHuh+UkOwl8OsKoBRJmvk9RRvJ8W6ek6zzb4EgRqLFeFUelCotlhWtgb4
gthDPpXyXAcVjYZBafwFRD3Jt6CALRtRWMfQDS+r3hYcViHb+SpsYrkl1tix7O7c
elODahVHy8PN9AkABsUYzmb4PJclF0cCCl8u75wMaOMUKDB9/1u9kKX52ABDIE1q
4VmLQFuiLgrAcyLX9WWpmHksnCWLCkM/FskuOao6dQd6r3Ii450Fl0uIe4bnQaqj
Xc47CaHbNCCiqRaSFn186hvw/rDjWo9bcR1ezq/Oob2Pp+uQcw5uEr+MS5LBPKkE
R9GzmcmeHbyjNAVeuGR4ZiTMbMP1Qb/cjT+5Op9BSewYdINXHAA4UZm7BXY6GdQd
gj/1WJKWpz7wZGlc53eb6GFSPeoBJvZxOt7H5zFs0zn7GVWkNETKP8qQLbaWgezU
sCc/5MJAGhWIlJONMPteT270mbN6tZdeTz2o4vkcrRrYyiqzn8U=
=naL0
-----END PGP SIGNATURE-----

--wx74LGToWoGSUiea--
