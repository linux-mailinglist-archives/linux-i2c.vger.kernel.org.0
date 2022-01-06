Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B34486509
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239425AbiAFNOa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:14:30 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47118 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238990AbiAFNO3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 08:14:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D50AB8211F;
        Thu,  6 Jan 2022 13:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F64C36AED;
        Thu,  6 Jan 2022 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641474867;
        bh=L3tHhN99WdYnI54VdTfT5qS89LBNk2dcS0QUxqv7Noo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AB/upQzN4QENiVzQ+Pog8BGuVnoYo7CWJ22nx6JVBvoNQYB6UPCWCsTeTUsyYmkUl
         KoQkSpH+Q7TaE+5PKDTeZjNLZY8tH7u1wQFxFDMbjm2HJEXNhoW7NfOXqs60XZwUcR
         eQG4EGTHUBREN7rdtl9qKKkcvwXmCy4O35DFewNdsA36K6gIlyyqRysFnMK9hy85z6
         38+G3hbmqukSbL3S/UeBjDEC73zdLqJUga5YtGfUnJ5IZM0y7dMD8UY16z5UZxBWrc
         uM1nMVNKLBaDLDsRePDnd3KeF6IId00l4G8+s4EtqTgqlU9FA82jpOtdHO8MI1WjUP
         hZ7TIkiuORcmQ==
Date:   Thu, 6 Jan 2022 14:14:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andrea Ippolito <andrea.ippo@gmail.com>, dmitry.torokhov@gmail.com,
        Alex Hung <alex.hung@canonical.com>, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: Touchpad stickiness on Dell Inspiron/XPS
Message-ID: <YdbrLz3tU4ohANDk@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>, dmitry.torokhov@gmail.com,
        Alex Hung <alex.hung@canonical.com>, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hja5uk5JcqUG5UBg"
Content-Disposition: inline
In-Reply-To: <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hja5uk5JcqUG5UBg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

bumping this old thread because there might be some progress and it
still affects quite some people.

> But I must be honest here, I don't see much progress being made
> on this until someone with a significant amount of kernel / hw-enablement
> experience gets it hands on one of these models. Either because some

So, I am quite optimistic that Andrea's issue is the same one which
Miroslav Bendik dived into [1]. I will surely try to help with part of
the PIIX I2C driver, but I lack the experience with the RMI4 driver. I
wonder if you could have a look and maybe share your thoughts?

Thanks and all the best,

   Wolfram

[1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com


--hja5uk5JcqUG5UBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW6y8ACgkQFA3kzBSg
KbZDxQ/9H1aSnRaT4BfYspnGtuGm4ZRcoYNF0WBs87UOzPQX4iTm0oBsJ6HLXNg/
IvhhHbfIrMKivxB5jhw8a6ZAAppdZJlHgH3e/fcgQXI3wUH4yDeL3+jX02tZTVXR
grLTtg07oajqro/IC9VF4LWZ1dYiRhsmdQHXu7DTEBVbYqL51PuSWy4VdOMv6AcG
PxldjNFDWshjXWkVCKEJbPsGFPIezN36LxqVBf1glY+5zFPGeN8uTbclUGxRhe5F
2wIJJMRkbuQeEigXVtnh7yab5fbb0pPXY5HI/T2aVFhHdSa4lSPsxd3xtiX5jkiV
8fuyYzflipecKnS1wpMJGKkj9NEB13FjXKRp5RaoVnPI7MIyR124Adivkmzgn7hE
hCibCjRGRnP+Xj/WUZuxeBU85M/e36XC7a/A4TrtVRMmk8SOnsb/WDVp3rGGGUHA
jxHfbVkfarq7qDZalBtXYwKGR5/RmObPvBLiSv+oHJ+xlx7uE8kEDfJD0ZS2mv4v
MwkW3xohgK/IvNcSZaMmVWBnw0Roc4Evka0GdJkSbhgAApTwlNDorvN9RtiTP35p
yLmFc4RjPAT7QfNc0xKrhkGlEmPqusQaocMM03/7+MwwuOyPw9b+Eknapl1Fz8qC
W2nrxpmIuhnKshpCm8yqwmXA68NUxHwqlmdLUfH10WzZcKLrx3E=
=vOfh
-----END PGP SIGNATURE-----

--hja5uk5JcqUG5UBg--
