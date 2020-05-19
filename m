Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171891D9C01
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 18:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgESQHk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 12:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729161AbgESQHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 12:07:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B509C08C5C0;
        Tue, 19 May 2020 09:07:39 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id n18so4247726wmj.5;
        Tue, 19 May 2020 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RBRjiq6KLS9Mg8CxqtLssaKrmXCzDF8FHv8nToO7ntw=;
        b=mRj+51QLBVfe8ccrbgtPiYi1X92XvWF5nwVyeQv8TA8sarSCWQc+zLanHD9IgOUK89
         Lk0xNKMUX29Ne+jBru5/JfNPoj0VUHE/9P+tD+dsCiaOmQGqYaky13yDca4HOfiUClw5
         0ub9bi5dt8OrcbacPWwXFAGt8fq0bhPJCuN1se/zPfNTDSdUGMFkIP8hWhjYWJpYjvkX
         WaTGTfAMeXOH4qhkrnRluvfay+4sD8qPphihyvfCl/I+9M107+kj2HtSL4/aHjDoQwKH
         WUnRlfvqEYQuNKXcYKmTIBzKZQK+uj/Bj6acq7JmhUW+QOEgBDa+Py9OU11mNfUxXP9g
         uWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RBRjiq6KLS9Mg8CxqtLssaKrmXCzDF8FHv8nToO7ntw=;
        b=s2jPePMr0wDfMAkVQWPvvQ0Ag0WBMNYW5TqVoUSsv6YiLGe+UJuxEHk9iGv63Mq6/R
         Jx0m0JLMJLXvogmGTl1MjqpWH3ZQHzjlWLFoxmptn9D3Bs2XhlXF/Zry7YUiZWMUfGwY
         ZB3XTQO4eQYVEt1dKO5C+P3vA72CVXgj5OjCRvNv0cl2lULQqjp5bj52sA5XwAhgOmxX
         d3Ug7ca3RMaAaoeN57GmofP89yxtgKX4F2dOou3tREJTfgdFcb+Wzt3+vqHP0PChfN5C
         3la8LwLtUc1ZZowVpShPEpskdxwyzPDLv9pt9MsGrckHhU5aeEhUq9cKQjSBN6UuVHmy
         350w==
X-Gm-Message-State: AOAM533zC7bBnh1Zte90pXuAjr6vwntbG/Duz7YOUz/u6QXFxYE1qUom
        46ALfUTTKjzJKAQ5A7IpIibn0pZk
X-Google-Smtp-Source: ABdhPJyuteRMGEUHW+aIcxIfQsF5XHMmcuskJeduuk8CmpGjQOCJAI2M9Cituc5vzsKZRwtWDIMs1A==
X-Received: by 2002:a1c:7d43:: with SMTP id y64mr150525wmc.46.1589904457987;
        Tue, 19 May 2020 09:07:37 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id v24sm131886wmh.45.2020.05.19.09.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 09:07:36 -0700 (PDT)
Date:   Tue, 19 May 2020 18:07:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200519160735.GB2113674@ulmo>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
 <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
 <86fee5a3-fe2f-05ab-bc05-1c441d2845e9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <86fee5a3-fe2f-05ab-bc05-1c441d2845e9@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2020 at 06:35:41PM +0300, Dmitry Osipenko wrote:
> > 2. Could you please explain why I2C driver has to care about restoring
> > the pinmux state? Why pinctrl driver isn't doing that for I2C and
> > everything else?
>=20
> Although, now I see what you meant in the commit's message.
>=20
> Perhaps the "their I2C controllers may have lost the pinmux state in
> hardware" paragraph should be removed from the commit's message because
> it's irrelevant to this patch. The pinctrl state is changed once
> tegra_i2c_runtime_resume() is invoked and it is not about the change
> made by this patch.

The pinctrl state is changed in tegra_i2c_runtime_resume() *only if*
tegra_i2c_runtime_resume() has previously been called. So this patch
does indeed cause the pinmux to be restored, even though it does so
indirectly.

I think that paragraph is necessary to explain that. It's the pinctrl
that doesn't "notice" that the actual pinctrl state has changed from
"I2C" to "idle", so on resume it still thinks we're at "I2C" and won't
try to reapply the same state. Calling tegra_i2c_runtime_suspend() is
making sure that pinctrl explicitly switches to "idle", so that during
resume it will apply the "I2C" state since it is different from "idle".

Thierry

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7EBEUACgkQ3SOs138+
s6GXww/8C5zoI1u4Lh6LK6fp1jeHnAkYeC+2cxleVMjjcxcuXuAmBVpWXuKemeDy
XdSeO3FqXAQgfa+vY9FwkqFGbEHXIFfHSVQkQdHR8AtrAc4pGx81YIFiBTPxudFW
hikeUdd72nvtVVDJvB5UjNTXtm9Rgn46bKAB6tg8DZ+DeZ5C2YFeiPH2isquWhgn
OaUwU7Ycwovq2g6J4Na8RYdY5CbRdaS1O0jQ1RILYidbpVREQ67IaYDY+FVAamDZ
GCgR+jJdiDERSQHnZ1mTkVa0dMBEkpS0+cGAFcfrScJWHYUPf4+C8bQJWOBUV1P4
CfhIbAmyyObBLDpO6Jc9eWX7UIe2YHR1Ej9gM652I7NZHZBmJGMYyclLSoTj3acW
9hFarojsGlg3s2Ibz4i8qL5dX+DWer8kvzBE/yv0N9k/79xWraKTtsr4QY+znuR8
RUaSP1/sJUiDYjJ4P5Bs0lebNggu33+b0KjkXf2iotpnxQZSn90mT7FYHyi9O/oY
jlBonjGOx5svBj9IEkoIsGUdC4G0dn6CaRq8t2gT3sNfTpa5U/By7MdLyVj+roK9
rUg1aTogGrr2zahmMKgkwjtKnZy9DiSguj+hZ63i0BzNzuCQh/O46PLHAJjdokTh
XoG9q8cVfbVFLWhP+ZbF9F4yHAL6NbnTpgX8UqM5D3mEqJy/EWg=
=Knpt
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
