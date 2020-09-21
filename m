Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83268272AB9
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 17:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgIUPu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 11:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbgIUPu5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 11:50:57 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08091C061755;
        Mon, 21 Sep 2020 08:50:57 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so13314069wrs.5;
        Mon, 21 Sep 2020 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xIo0Zcbmop3C+WyD6L2IFdXuaSAMvBhOXqbTn9ycQEA=;
        b=bxbn6DZbGX344wMinln8vz3S041G2qpChAoax5i6gOPAsTkMpDtMrFJnb4LhjFCPXy
         B6iE4hoWh5fUbe+0nHYoUUzQYup5IMO37VBIqWCkRfRM4ahgfzxJw7h/jKlyyUMbzXKY
         M2/B8HmSeRVNFkFfD+TMWilDz7/Y+PWNQvFvadAPtL79YDs6aSyMht4Uy0GtzzNrPL99
         N/9+oJ/6VSJ71SblbWJpOtcngqSNoR44MP04yCAiwRJL6C4cCZ9r1wwV+q75388MVsYD
         f7pafSDpwmIs6p2IALGmfDbK7jmCNB9g3Q+j++Df5dgLHmUpyLjTdjGScpouOWi0RxV1
         ZNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xIo0Zcbmop3C+WyD6L2IFdXuaSAMvBhOXqbTn9ycQEA=;
        b=cOah+pLhOJQnxbn2IJBbMOFsiC0ktXu9nCoZcEmsygxJa8DqIPlzA0vwt+YRujppra
         01JDhSjQ9xEarKS4N+aXJRHPaQUvNnbEfg2NjaDxhfGyOs+qVbWi5UFYEIjpVprvON68
         VqWVE3bGSjjcevmWRUfERSkr5mt71DRySrMdcwhduCUWqqd9O1zFSdCOJyw13ICvJYrl
         +lizTMkes8/MoQ4466zaJNjzzm9X7I/7p47QRwUDoDSC6cNODr7K5nZeWXcdkdZeXzKM
         UJM6hHvv0F4D8mYml3LEHSxgdLImq7QqknCPskG956Iks+wUvu1UEGeTbgSTztyrqHkq
         0l+g==
X-Gm-Message-State: AOAM531OO/NUD7NjNtLlypzd5r2ST/7bAJB792CbxG5IkoyzQyMpBdUb
        Z1DEMyIYnxAWmpeIBwYSmfI=
X-Google-Smtp-Source: ABdhPJwoWpFCUNnXDWkX2dkIdhCoSMixIKLCclZPGQgAwkPI24WA8gXsx1hLqFY8GG/Nj1mfnPztRA==
X-Received: by 2002:adf:e391:: with SMTP id e17mr364514wrm.289.1600703455639;
        Mon, 21 Sep 2020 08:50:55 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u186sm20658081wmu.34.2020.09.21.08.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 08:50:54 -0700 (PDT)
Date:   Mon, 21 Sep 2020 17:50:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 30/34] i2c: tegra: Clean up variable names
Message-ID: <20200921155052.GA3991813@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-31-digetx@gmail.com>
 <20200917122105.GI3515672@ulmo>
 <49498b9c-3b75-ad97-1859-5d6442b27b0c@gmail.com>
 <20200921114059.GM3950626@ulmo>
 <633d8e6e-d50c-a7cb-5cdf-f0547b94a86d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <633d8e6e-d50c-a7cb-5cdf-f0547b94a86d@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 06:18:59PM +0300, Dmitry Osipenko wrote:
> 21.09.2020 14:40, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Sep 17, 2020 at 06:43:28PM +0300, Dmitry Osipenko wrote:
> >> 17.09.2020 15:21, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Sep 09, 2020 at 01:40:02AM +0300, Dmitry Osipenko wrote:
> >>>> Rename "ret" variables to "err" in order to make code a bit more
> >>>> expressive, emphasizing that the returned value is an error code.
> >>>> Same vice versa, where appropriate.
> >>>>
> >>>> Rename variable "reg" to "val" in order to better reflect the actual
> >>>> usage of the variable in the code and to make naming consistent with
> >>>> the rest of the code.
> >>>>
> >>>> Use briefer names for a few members of the tegra_i2c_dev structure in
> >>>> order to improve readability of the code.
> >>>>
> >>>> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have u=
niform
> >>>> code style across the driver.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>> ---
> >>>>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++--------------=
---
> >>>>  1 file changed, 86 insertions(+), 87 deletions(-)
> >>>
> >>> That's indeed a nice improvement. One thing did spring out at me,
> >>> though.
> >>>
> >>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c=
-tegra.c
> >>> [...]
> >>>> @@ -1831,20 +1830,20 @@ static int __maybe_unused tegra_i2c_runtime_=
suspend(struct device *dev)
> >>>> =20
> >>>>  	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> >>>> =20
> >>>> -	return pinctrl_pm_select_idle_state(i2c_dev->dev);
> >>>> +	return pinctrl_pm_select_idle_state(dev);
> >>>>  }
> >>>> =20
> >>>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> >>>>  {
> >>>>  	struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> >>>> -	int err =3D 0;
> >>>> +	int ret =3D 0;
> >>>> =20
> >>>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> >>>> =20
> >>>>  	if (!pm_runtime_status_suspended(dev))
> >>>> -		err =3D tegra_i2c_runtime_suspend(dev);
> >>>> +		ret =3D tegra_i2c_runtime_suspend(dev);
> >>>> =20
> >>>> -	return err;
> >>>> +	return ret;
> >>>>  }
> >>>
> >>> Isn't this exactly the opposite of what the commit message says (and =
the
> >>> rest of the patch does)?
> >>
> >> This change makes it to be consistent with the rest of the code. You m=
ay
> >> notice that "Factor out hardware initialization into separate function"
> >> made a similar change.
> >>
> >> The reason I'm doing this is that the "err" suggests that code returns=
 a
> >> error failure code, while it could be a success too and you don't know
> >> for sure by looking only at the part of code. Hence it's cleaner to use
> >> "err" when error code is returned.
> >=20
> > I don't follow that reasoning. Every error code obviously also has a
> > value for success. Otherwise, what's the point of even having a function
> > if all it can do is fail. Success has to be an option for code to be any
> > useful at all, right?
> >=20
> > The "err" variable here transports the error code and if that error code
> > happens to be 0 (meaning success), why does that no longer qualify as an
> > error code?
>=20
> If you're naming variable as "err", then this implies to me that it will
> contain a error code if error variable is returned directly. Error
> shouldn't relate to a success. In practice nobody pays much attention to
> variable naming, so usually there is a need to check what code actually
> does anyways. I don't care much about this and just wanting to make a
> minor improvement while at it.

Oh... I think I get what you're trying to do here now. You're saying
that we may be storing a positive success result in this variable and
therefore it would be wrong to call it "error", right?

And I always thought I was pedantic... =3D)

The way I see it, any success value can still be considered an error
code. Typically you either propagate the value immediately for errors or
you just ignore it on success. In that case, keeping it in a variable a
bit beyond the assignment isn't a big issue. What matters is that you
don't use it. There are some exceptions where this can look weird, such
as:

	err =3D platform_get_irq(pdev, 0);
	if (err < 0)
		return err;

	chip->irq =3D err;

Although I think that's still okay and can be useful for example if
chip->irq is an unsigned int, and hence you can't do:

	chip->irq =3D platform_get_irq(pdev, 0);
	if (chip->irq < 0)
		return chip->irq;

My main gripe with variables named "ret" or "retval" is that I often see
them not used as return value at all. Or the other extreme is that every
variable is at some point a return value if it stores the result of a
function call. So I think "ret" is just fundamentally a bad choice. But
I also realize that that's very subjective.

Anyway, I would personally lean towards calling all these "err" instead
of "ret", but I think consistency trumps personal preference, so I would
not object to "ret" generally. But I think it's a bit extreme to use err
everywhere else and use "ret" only when we don't immediately return the
error code because I think that's just too subtle of a difference to
make up for the inconsistency.

On the other hand, we've spent way too much time discussing this, so
just pick whatever you want:

Acked-by: Thierry Reding <treding@nvidia.com>

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9oy9oACgkQ3SOs138+
s6GZJRAApsceGJgLNtyGwxvBJnax82BnNByAyzBOEVF1lrsh/mCoQUICqYenPTIN
nQw9wjO1oIPogo55hBJlEnm3X7fjpcwbYWRSlzGSLX/Gp4PSDbQq+Hzfngl6eyJK
gjFEQuhoHErwxlMKjpngJE9xajpVtlfxTjx1F+M9tE+QxZ04jVr8N/1hYwF88XvW
y9ytriIWZCyyfcAjHAq1hoJGAzpU0IsUmuzv9JqahBSU/qx+BqV/6mVaOEALFTar
75vFnKlD+0c65B/h0VY00/tIMXl3GT0RTNOo423+YZ2GCWaOFYwyW5QaelIAC107
WXJGgLL5kSwZeNboLZ9tje6jo/rd2wkJ3wQvGAIOyZVd2N/dfe0olXPBoWuyU3oz
I7W9ry6Anh4MROOLDQAoT0yQAlUY2pinXzbbbXtABqsWNJ0WTgptkdIuy3NEB28R
GyxSh03/t1qauZw0j4uKde/uwGLU2xRC4r9DTCs2Zu9BYVTJeq9+c+byThs/Ydqr
jozQ5jishI+CyEm3qUOxcdsYn70MdBgq1MtFJNXXL/rRPFl8HyWSbCcQsW4cyk0N
tD4XCpgviOIa3uNtTXZ7SQhOy8cH2gKSj4yoCpLkksQLhjSk8J7AWp6aMOSK7yeN
x9ru8WMH+b09RT1NI6a/vwPFq9H4s1FSpNqYV43dIJLxV55deQk=
=Ohz+
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
