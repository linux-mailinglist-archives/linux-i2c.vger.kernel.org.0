Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2322D272255
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgIULYa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgIULY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:24:29 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F732C061755;
        Mon, 21 Sep 2020 04:24:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t10so12338052wrv.1;
        Mon, 21 Sep 2020 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+u5hQWiNVKvkjQGatfiPY92Ma7aljeWObRsv13HrFek=;
        b=LqjQ2Krptm6rzvHADrpeAB4WlFjCdeHvfPjq6j9/r6Zh9GZ0ZGBA3YVL6VviuLmsYL
         paxBse03Yk8qUuaPvF/psPIIDTz7Q/OF7yaAOwIlk/Z661ZtBhIcn1FWmq9AGhPqPCIB
         dwRbsBYmLMJRoxh2OaDw/pcYkHRnfEjBfayH43ZyJ/8Anjetix7LGyMMGqCkPytXRW66
         e68lJmAgw9XpgMYKoqBaqVbYu9w5Y9egmHtiqwuIfkADJHBJTKymzbx6FTgdwcGrDzQ+
         cg+Wtzax2sprYBcNMyiRc80NPUj7qVWPTA71xx4sOujBuHvQFKs9ze40PiLMkRH8TpOp
         cQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+u5hQWiNVKvkjQGatfiPY92Ma7aljeWObRsv13HrFek=;
        b=Pdh3hGdDhq/++iTl8ER2/kQwXaa07IsqchFsXaOUxlsnpY8TJpP2xwCx3hf+vV3Mf5
         AeJKrStclkxS++aDf6efzhsAJKe9Bz66gNYnzMalJZBdTq4b97yoglaXRI6GurUcw13f
         43pAQl3Vr875KwbgM7CpakEixbBfDbS78FQeZpOiDwYawv8SJ1crV2qXH2elMq2nP0OR
         FaJdfREnlZQi+fVxC41/3kQAbZcZ4xBwqGLP5VrmkLrHQdOsqxerfg+XB5dbaGZLFfHI
         WxGXOl1cp2bJeetRXjDz96wqnBckJuY/+Pd/ZqGTBa72LuYW8fnQPg71fOLId2ugYyq0
         Xo+A==
X-Gm-Message-State: AOAM530zNEawz338KhGx2wOUqlCtg43XgnIQbtr2/8GFYRrA+QNFKUNZ
        2n8jOd3vFkt/dBAoQ/bWm/g=
X-Google-Smtp-Source: ABdhPJxfp92rRPIN91rV3fck9fVzgPSfCAUeNDu0IHaiVk/QPMQoqEXswdU9jhzIsj0704jSl+jubw==
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr56413648wrr.149.1600687467814;
        Mon, 21 Sep 2020 04:24:27 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b84sm20898905wmd.0.2020.09.21.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:24:26 -0700 (PDT)
Date:   Mon, 21 Sep 2020 13:24:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 27/34] i2c: tegra: Check errors for both positive and
 negative values
Message-ID: <20200921112425.GK3950626@ulmo>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-28-digetx@gmail.com>
 <20200917120955.GF3515672@ulmo>
 <CAHp75VdEoLAMvQWb1_p8ydROmY9p7KCqFGarRsgM8p8nDhyY7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Ah40dssYA/cDqAW1"
Content-Disposition: inline
In-Reply-To: <CAHp75VdEoLAMvQWb1_p8ydROmY9p7KCqFGarRsgM8p8nDhyY7g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ah40dssYA/cDqAW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 04:50:06PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Wed, Sep 09, 2020 at 01:39:59AM +0300, Dmitry Osipenko wrote:
>=20
> > Why? All of these functions "return 0 on success or a negative error
> > code on failure", don't they?
>=20
> And what is the point of having ' < 0' in all those cases?

It's explicitly checking for the documented error cases. And you'll
occasionally have a function that can return non-zero on success.
Testing for < 0 is the safest way to check for failure in the majority
of cases.

Thierry

--Ah40dssYA/cDqAW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9ojWgACgkQ3SOs138+
s6EbSA/+LyGCZemHCgGDckD896YW3heC7aDccGSwYaD25YP90HHv5ybGNWZDj68z
QzulPldIEps5uus0hDe/dOxWw5U7K8dOXUQvP/EUi88JkZGJRl/F9ulN9Rfr+26L
OwlFFwjI/1dy5L4356F6xK2qYezxs+9FbOyP3vqvOYSjxpG2QSS+B80Cuunm/yye
3oRIUqWvzgYnF/+8nFImVL9kru+7k3FcxaqUEHRYc1lzkUXw+BV3NEWeJl/GVQSH
z/z2fVpCiHlRMZAac0kVYa7OHxv6+/v1c97ZrVh7fR+mKNdHufZ7rVZkOI8F31G/
47vO8WN1F19oQlSLkhmzzxi+upMdytswWn7ycWLDjW6wfrXcA+JiD36ANNaAha3m
krO9I6KzbX1OE92K3RH+VpQRnrE3wfI/6TMGtbZRc/v6dZv9UmVmMhRSDyyvQUeP
F8B1zc0VA+DBo+HBQg4MnEkZRqe4VjLaKvAUj1pToVHhr3OZN/T8q8fan+J0W00O
at5IPlWPMSwLmVKlmbSjWMf5hK9aL8sBJcAWgsxiDR8SSTyrzEz1TCUzp5XC6P99
In666KnrG76MBGA0qa3Q7u+mHLOkDaoyjYrgEGfypy6nOwM/ry9KQsEdXe+6KTTq
Jgl7+TU+zIzS4/UagCCoUJaHsWX1eVAv+3IPH0Yetbk2hl0oGVY=
=6Lv1
-----END PGP SIGNATURE-----

--Ah40dssYA/cDqAW1--
