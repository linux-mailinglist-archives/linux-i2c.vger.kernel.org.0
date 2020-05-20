Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13141DB094
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 12:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgETKvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 06:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgETKvI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 May 2020 06:51:08 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C844EC061A0E;
        Wed, 20 May 2020 03:51:07 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bs4so2596671edb.6;
        Wed, 20 May 2020 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tPO8YN9vJ3FxRD46uPwtcRbCF843S30HyqjJqU58loo=;
        b=Vv9J8gm5zEP1LhU/cTm1ttZYPLWaOZfsVPCzOlSWX0H39jHWJCiNTsY0hvZ+RZGJWv
         EZvRgNahGRL1iSxHXDsOxNo3/SUZsdQ9Po6lgcOrBFswXNBlcsS1f3LVHDLogWN9HWtW
         lkYiaafRnFZMDKn2gKn9M7TC130C3DhRV1Vg+4kzvVpR+0cgYbDSp5VnyJzUio29AANG
         g7r9udUd/Vaalo1BvX4iJqSiWyMB0zh3zTTj8ZoS3o7rFJOvq56ZYF1d2vsf8vvTC378
         DvomuWeX6Bn4cVzYssoJq6mIZ3mg1R3WAOYfArdOkwxYiAlcVzOfI1foIgG3Gdyd9aZ0
         MLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tPO8YN9vJ3FxRD46uPwtcRbCF843S30HyqjJqU58loo=;
        b=jQyMcnqZvzPH954WJGTIrYPVXlRpG/KIhPim7gJm6pSwYctPk2rSpzCLMlduHwTZkw
         Wl/yqfzu7rNSRMHtn8NDRNWFdcr5pTyw41ILqkEUKq5Ve8VRAmCYxji0E2F55M40cKII
         GtNmNYnx0mkwb6VeMFmnUKd51yrbViHJFNdJ9ndjrJXfUznUlWDce70lXc3Ps8Z/msyz
         AsEExIJIpn930uumMtc88Bt+NUBmjh56LaE2Jr/PY0AtOaIkabYhFxPQB0ubDA0XwECG
         0YKtcHBrkTYVnHE7p1Oa8W6MT8nR67kPTNts+Z9E1AvNnIWAJ0wuU9w4t7FPyoWjPeRi
         /+cQ==
X-Gm-Message-State: AOAM5329kwwWhtNXqWbyjY2bjU+oy2GLAw7RlaS8XbUYfkVBi7jvTY3/
        eBn7RIv8x+jPeAJRRQlirNJYMtkw
X-Google-Smtp-Source: ABdhPJxDD4NeHVoCo/FIZFd405i2t94LoeBRfqQWwFHiXZZMhOslUVd76hvQriiR8Qp/Y8waG+5f4w==
X-Received: by 2002:a50:afa3:: with SMTP id h32mr2873484edd.63.1589971866498;
        Wed, 20 May 2020 03:51:06 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id fi9sm1588895ejb.5.2020.05.20.03.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 03:51:02 -0700 (PDT)
Date:   Wed, 20 May 2020 12:51:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Message-ID: <20200520105100.GA2141681@ulmo>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
 <20200519160835.GC2113674@ulmo>
 <6b081a10-b150-b07f-2852-743e41ed053c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <6b081a10-b150-b07f-2852-743e41ed053c@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 05:19:27AM +0300, Dmitry Osipenko wrote:
> 19.05.2020 19:08, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
> >> 15.05.2020 17:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> Hi,
> >>>
> >>> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c28=
8314fd:
> >>>
> >>>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
for-5.8-i2c
> >>>
> >>> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f=
0e:
> >>>
> >>>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:4=
7:52 +0200)
> >>>
> >>> Thanks,
> >>> Thierry
> >>>
> >>> ----------------------------------------------------------------
> >>> i2c: tegra: Changes for v5.8-rc1
> >>>
> >>> This includes a few improvements to make the Tegra I2C controller beh=
ave
> >>> properly on suspend/resume, does a bit of cleanup and adds support for
> >>> the VI-variant of the I2C controller that is used primarily for video
> >>> capture purposes.
> >>>
> >>> ----------------------------------------------------------------
> >>> Dmitry Osipenko (2):
> >>>       i2c: tegra: Better handle case where CPU0 is busy for a long ti=
me
> >>>       i2c: tegra: Synchronize DMA before termination
> >>>
> >>> Thierry Reding (5):
> >>>       Revert "i2c: tegra: Fix suspending in active runtime PM state"
> >>
> >>>       i2c: tegra: Restore pinmux on system resume
> >>
> >> In general this series is good to me, although I have some concerns
> >> about this patch. Could you please answer the review comments?
> >=20
> > Sorry, those had been burried under too much email. I've answered your
> > questions now.
>=20
> Hello Thierry,
>=20
> Thank you for the answers, I'd also want to see the answer to the
> question about how RPM works, i.e. why I2C is RPM-resumed during
> system's suspend in some cases and not the others.

I don't think I've seen a question regarding that, so let me answer
here: the way I understand how this works is that for each device the PM
core will grab a runtime PM reference during the suspend/resume
transition, which is done as a way of preventing any of the resumed
devices from unexpectedly going to runtime suspend.

This code is in drivers/base/power/main.c, device_prepare(). Note that
this will only increment the runtime PM usage counter (and therefore
block the device from entering runtime suspend) but it won't resume the
device if it is already suspended.

So far any devices that are already runtime suspended, there isn't
really anything we have to do during suspend. For those who are not yet
suspended, we need to force them into suspend so that their clocks are
disabled and the pinmux state set properly (to "idle").

On resume we first need to runtime resume the device undconditionally so
that context can be restored. Runtime resume will take care of enabling
the clock and setting the pinmux state to "default". Then we restore the
context and if the device had been runtime suspended, we manually call
the runtime suspend callback again so that the state matches what the PM
core thinks it is. However, if the device had not been runtime suspended
during system suspend, then we must not manually put it back into
suspend because it would no longer match the PM core's state.

Does that answer your question?

Thierry

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7FC44ACgkQ3SOs138+
s6F8DA//eonrmZfHbmEv8IsrjDFpzhvujvZc6eqNnmIUOKhevzn6xxiqED+sTvA7
fKE6z8QwLQkyS3BQOmrCQ54EpcnMm/Dtle/cccX5FXG7xTkk0YgJuLCIrFI6SGOg
46MPcHDPVozuNwqJ6tEppdRAJ82ZKBKmb+MM5ot+LtVw5pl9NZnzI0symk53gy3l
EoDzMYkiZZqwSqzsTH0rnwObx29XoirUIUdF+uXU3SSJio/9tteW2my3KY+q70ui
QjDYuokWPgUrwe84yj+DPrzV7joOZIoUWBfd2T+8RchkYQUBwW/+A9L97Fa5JbXE
GiptXWj2UdlFKDQH2s+t4+LrLsp2FJ1CdeasOHgCHff8owSSl8HEKJfFRweK7hqK
FiM1U/jIke2/uYu7v7/jqra9gyLJ3m2qVXIdgHYqjA6dEGlvONT1eh1Br3lgkMBA
ETGfLY8RsrOOvuP/Z52bUvLPNJxA8EPWdY85wzVCxbn6FZJhc8ZgkbU9OcNiMd4X
ztLzIXe9E0guqVtELfE697Gcq0fdFkL4Vcd5sDwBGo8k+4IrOeglIB0JKypT5iFF
IeSoncXh6o92lEIpX2smi8RdvFqCUhi/4EK1h2ltzOJXgu2XIgwFH+oTVvz9+S5L
7YhOQweabQ22PgxOAcsJri8ncfUjxdDVK2WGCdi6FKivCkCWgF0=
=OLhw
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
