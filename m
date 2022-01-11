Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDE448ADB9
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jan 2022 13:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238370AbiAKMjU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jan 2022 07:39:20 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:41902 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239392AbiAKMjU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jan 2022 07:39:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6C2C614B1;
        Tue, 11 Jan 2022 12:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71962C36AEB;
        Tue, 11 Jan 2022 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641904759;
        bh=uimpmS7EpG9U7VOVIAPAv29+NVT2dj0HCG1jYmILb5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WThR+Ypr228/WkCU2V3LRlXln3yvPe7VXfVUgYBSFzJghl7sRgZpLXJIIasWH/Rc3
         hg95/mWGhePEnDSecuR/Uv9f4sQZT+xNRuHwHkvoCiYuDK7bopROAV2MZ29+3eAjxK
         XFwawOgYz9ezsDMWwewGxS6h0XrUtk33azefL3Wh9OFfrbgT966yIMs3Uaj99QDqwV
         HTPENWjPAgnFoqLSI8rgeV2YmLj2A3h2B2jQfeKsxmphhQHBjVgAOlRehsgUVwTvob
         Pyip8XkHvmJdl59Ey8YMC7DAsa6pQ5TXkW4QTamhVN4biC7Wzdd2/9dtXN3t5QDGO6
         1kUDJtEqNsBkA==
Date:   Tue, 11 Jan 2022 13:39:15 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Terry.Bowman@amd.com,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <Yd16cw0AaYcf7eSf@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Terry.Bowman@amd.com,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion>
 <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
 <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
 <YdoG+en5Z/MaS/wu@ninjato>
 <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pgNChH66zJmaFl9u"
Content-Disposition: inline
In-Reply-To: <CAHp75VfC2XsF2j=obXu7RLNZkKSsZ20eOH2-UMA9AoMAemKa9Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--pgNChH66zJmaFl9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I have briefly read the discussion by the link you provided above in
> this thread. I'm not sure I understand the issue and if Intel hardware
> is affected. Is there any summary of the problem?

I guess the original patch description should explain it. You can find
it here:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20210715221828.244536-1-Terry.Bowman@amd.com/

If this is not sufficient, hopefully Terry can provide more information?


--pgNChH66zJmaFl9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHdenMACgkQFA3kzBSg
KbZgvBAAkJhhT0pH8RdKpq/Kd4K8hMAOp3dIq+iW1R7KhstRHMvBtGBrSdKqg81t
XVRSHjBhvN+2cOI5RmQ29S9KzmhXEQ4wqGvg4dUejlYQfTk5T3ecNfjsHBpqppNN
t9x1qlxaseL5iKhjcHUoJQ39k0VtuvdH6t2pscdlZwLANLGHFzFTd2Zzx2GK7Bdd
9YpO+1OOv3wGSJWoCl1Ujt2IADhjiR//sHYnN+Uto5ty8HY2oSNVHnek9NdUiK7G
5QGbDh2sdeGiFHqjCUWkJt6uMtjc0aB3ZYKSQrUoStvJxzFbwEs0ivvSrNsfIsph
mFqjE9paRbXa/tJfXvPxFiCp4JdCp4PGXjpzchb1yGp/7/2e+kjMpIGgkKjToP+k
77bilj8JvGJr+Le6qK7pwdS3DTGBGyCBrF8KVt2zoJAZtWtpsRUh8MDpGM53P0Ek
i0yrbAtCfthUQ8KJ7WVWt0oXcBrmCejIqmW/Qlf+JttGPenQ/FDB32k7TswcBsEe
8mInlL6EW10seQ2mTgd2F7O63uBsoXu0BgXV6vDZu6SN9Y65AudlpyzHeNO1h08U
WfDA0Tf58VmEcw2mFUOg+rgHJnIwOgujqD123bym0ax1BuEMXb07gKwC7WDlQS6k
IIEzW8FKvXiUF5ld6SftAwGdN+BI3PcJK034bnOXYAFI0zi6lp0=
=Jb4b
-----END PGP SIGNATURE-----

--pgNChH66zJmaFl9u--
