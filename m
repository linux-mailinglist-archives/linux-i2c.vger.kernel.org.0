Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C96E1429FB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 16:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406449AbfFLOyr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 10:54:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45075 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405540AbfFLOyr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 10:54:47 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so15343557lje.12;
        Wed, 12 Jun 2019 07:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bT+gRjhnUHcITZVyDjTy7yxpytcU0MLxWkLAIPqteWw=;
        b=HTuiJKO5ZoBsu2PZtBSv62ZIUrhuFF4o2XCet8jmtkfafKF07y0+rUoAHNOTF01t76
         0PN4Mn9b5QgwtjpEFzr6YIcMpH3shhQQBVZHnY4QKfg4wQcTXX6DQMl5TPkP+PJfMlTD
         qXXB7/Sf3cpGGX2fos9gwnEccSGpZkgpb1Aa/5h7AhbkTqMf7wCI2Wezz7eNZh1sDhUj
         nkLjTotBhCLf0uhXna+dYE3iZRrbTbyqABsU+UcJBo3j7m/kmAa2ttVjUSdV+O/vAHrp
         RnKpZX2ykFZh33fmAvm/3xIrvDundd5D12xwbr7lQ8abrctHodJecgk9lw01UGzuw1sN
         RxkA==
X-Gm-Message-State: APjAAAUmxV0otKZGVbCquh9pmcQl1h3GXi0BKyCr4FdjlDYUcLSb0hCj
        VE4+Xs3QLC8sgdRatcmCThk=
X-Google-Smtp-Source: APXvYqzZog9g6xCnR4zHYUJ0suI+/068Gy7cJkGIYif1HT7VnDSyju5wVbF7g0t6qiL48hJmlT6Q0Q==
X-Received: by 2002:a2e:3008:: with SMTP id w8mr7377643ljw.13.1560351284397;
        Wed, 12 Jun 2019 07:54:44 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id f30sm16287lfa.48.2019.06.12.07.54.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:54:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hb4eD-0004oo-So; Wed, 12 Jun 2019 16:54:45 +0200
Date:   Wed, 12 Jun 2019 16:54:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190612145445.GB18153@localhost>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
 <20190605075656.GC29637@localhost>
 <20190605082047.GM4797@dell>
 <20190605083353.GD29637@localhost>
 <20190605084921.GQ4797@dell>
 <20190605085527.GE29637@localhost>
 <20190605141812.GA962@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20190605141812.GA962@kunai>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 04:18:12PM +0200, Wolfram Sang wrote:
>=20
> > To enable dynamic debugging in driver core you could use something like
> >=20
> > 	CONFIG_CMDLINE=3D"dyndbg=3D\"func really_probe =3Dp\""
> >=20
> > That gives you two printouts per successful probe, for example:
> >=20
> > 	bus: 'usb-serial': really_probe: probing driver edgeport_ti_1 with dev=
ice ttyUSB0
> > 	bus: 'usb-serial': really_probe: bound device ttyUSB0 to driver edgepo=
rt_ti_1
>=20
> I agree that this scales much better than adding strings to every
> driver. Also, the driver core will report failed probes other than
> -ENODEV, or?

Right, errors other than -EPROBE_DEFER, -ENODEV and -ENXIO are always
logged, and the previous three would also be logged with debugging
enabled.

Johan

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCXQESJgAKCRALxc3C7H1l
CP3ZAQCXRPAnR1biCp42ucqiyFiqTwNI2ivpwkFZxtse1SooNgD/f+BDGNZpuRH0
tiQ1iXCC4VjcExWVqH6isBuTFoPS2wU=
=yyFo
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
