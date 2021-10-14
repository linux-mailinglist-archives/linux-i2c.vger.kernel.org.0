Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B2842D400
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 09:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhJNHrx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 03:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhJNHrw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 03:47:52 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85ADFC061570;
        Thu, 14 Oct 2021 00:45:48 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q19so4729484pfl.4;
        Thu, 14 Oct 2021 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DcXKeOiPK/TqCrywwCmtfnGhLeBfTnMPdENutpzgrTg=;
        b=EiayJxizZENFuIX9UCjMw238QCpSIM6k0bapXOhvKk7ePwbV646PgPB7jefgzBaYlj
         oENJ3B1nDxXa6CFv1atAjKaZo3PBklBNJpQOwFTYfPjKJfOfxXPIhedzwJ1magnNp87p
         ES+aKh+er2qdVU5wZo2RNNVJSbzVM1iKDgTHLcQWe3XOwRmTBe8aHgLxNywpX6D76Ri8
         B2bQyAoEGK+uh9hTOiY0CCvMYi7jGuT1Rq6whB5MOu17cdMnYe/GbBnhxikdHgd51Ggo
         a3Jw2H0VDD1TES9v/is2naHIIH0Voqbyq+igMMjMO6Q6dymG8ibqex+wdwAJeW7qydOn
         xfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DcXKeOiPK/TqCrywwCmtfnGhLeBfTnMPdENutpzgrTg=;
        b=xVGAQc9is3YZkNevUK4Y6ZLPMwthAgzC5CVNhHufC2ZswlDylADxJ0mpw37Kf596QL
         fKm25ZwyXEzZCzmBXodGXExQapi2y3rExTv9olbi7hW7M3TPq6TUizAdu2CTbtAODoJm
         fbfp3+T07BIDLGdtGK+/F85pXZR8r4tZ4s3VmK9pb4AAEJfrsc+80Ca91kcY8yKhIXsc
         iVQwKFisyIatD30lSq0lmqLwaAukB/xHkry46ZZ6R28sEqBr/Eio1is/S4NoX3Vxs3d9
         q74zUo6L3LLE9C6vjrL0KOjUURbeXUsUD+HvUqSlLQqOqaV+vkUaSYlEeUSccOkY5l3N
         7ABg==
X-Gm-Message-State: AOAM532dtEjwovDDXHcHt4mTZdqP4hJTSydmL28L5tMVw6TFGpKkYZ6O
        lMQAsGY3PuHJjCBEVXmK0BHgc7uc3zOqvbQ+Q7U=
X-Google-Smtp-Source: ABdhPJwpjRD8gYfgE5UvB+QLImJJii/oMq2pkY+9IXVGa5nzgvvV87KC7SuczSUPD1YMfrvP03R65ZnWS2kzqvVBUuM=
X-Received: by 2002:a62:148f:0:b0:44c:dfb5:4b82 with SMTP id
 137-20020a62148f000000b0044cdfb54b82mr3949049pfu.55.1634197547887; Thu, 14
 Oct 2021 00:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
From:   Alexandru Ardelean <ardeleanalex@gmail.com>
Date:   Thu, 14 Oct 2021 10:45:36 +0300
Message-ID: <CA+U=DspB=++La907hoL8Uzf89uZzoC1rz=vXPX6FQ-voDPBROQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] iio: let spi drivers return 0 in .remove()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Dan Robertson <dan@dlrobertson.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 13, 2021 at 11:33 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> this series is part of my quest to change the return type of the spi
> driver .remove() callback to void. In this first stage I fix all drivers
> to return 0 to be able to mechanically change all drivers in the final
> step.
>
> Returning an error code (which actually very few drivers do) doesn't
> make much sense, because the only effect is that the spi core emits an
> error message.
>
> The same holds try for i2c drivers, some of them are fixed en passant.
>
> There are no interdependencies in this series, and there is some more
> work to do for the final conversion, so apply the patches from this
> series at will :-)
>

Series looks good.
However this set also makes a case for doing more conversions to devm_
usage in probe.

With devm_ , we get slightly less code, with some mirrored unwinding
in error and remove paths.
There are currently ~170 places (not necessarily the same amount of
drivers), where devm_ can be used.

What I typically do is run this command in a kernel tree:  "git grep
-w iio_device_unregister | wc -l"
When I run it without "wc -l", I will pick a file and take a look
inside it and check it's convertibility to using
devm_iio_device_unregister()
The rationale is, that for IIO drivers, if you get
devm_iio_device_unregister() (properly) called last, then it's fully
converted to devm_ functions.

For this series particularly:

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>

> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (15):
>   iio: accel: bma400: Make bma400_remove() return void
>   iio: accel: bmc150: Make bmc150_accel_core_remove() return void
>   iio: accel: bmi088: Make bmi088_accel_core_remove() return void
>   iio: accel: kxsd9: Make kxsd9_common_remove() return void
>   iio: accel: mma7455: Make mma7455_core_remove() return void
>   iio: accel: ad5064: Make ad5064_core_remove() return void
>   iio: dac: ad5380: Make ad5380_remove() return void
>   iio: dac: ad5446: Make ad5446_remove() return void
>   iio: dac: ad5592r: Make ad5592r_remove() return void
>   iio: dac: ad5686: Make ad5686_remove() return void
>   iio: health: afe4403: Don't return an error in .remove()
>   iio: imu: st_lsm9ds0: Make st_lsm9ds0_remove() return void
>   iio: magn: hmc5843: Make hmc5843_common_remove() return void
>   iio: potentiometer: max5487: Don't return an error in .remove()
>   iio: pressure: ms5611: Make ms5611_remove() return void
>
>  drivers/iio/accel/bma400.h                   |  2 +-
>  drivers/iio/accel/bma400_core.c              |  7 ++++---
>  drivers/iio/accel/bma400_i2c.c               |  4 +++-
>  drivers/iio/accel/bma400_spi.c               |  4 +++-
>  drivers/iio/accel/bmc150-accel-core.c        |  4 +---
>  drivers/iio/accel/bmc150-accel-i2c.c         |  4 +++-
>  drivers/iio/accel/bmc150-accel-spi.c         |  4 +++-
>  drivers/iio/accel/bmc150-accel.h             |  2 +-
>  drivers/iio/accel/bmi088-accel-core.c        |  4 +---
>  drivers/iio/accel/bmi088-accel-spi.c         |  4 +++-
>  drivers/iio/accel/bmi088-accel.h             |  2 +-
>  drivers/iio/accel/kxsd9-i2c.c                |  4 +++-
>  drivers/iio/accel/kxsd9-spi.c                |  4 +++-
>  drivers/iio/accel/kxsd9.c                    |  4 +---
>  drivers/iio/accel/kxsd9.h                    |  2 +-
>  drivers/iio/accel/mma7455.h                  |  2 +-
>  drivers/iio/accel/mma7455_core.c             |  4 +---
>  drivers/iio/accel/mma7455_i2c.c              |  4 +++-
>  drivers/iio/accel/mma7455_spi.c              |  4 +++-
>  drivers/iio/dac/ad5064.c                     | 12 +++++++-----
>  drivers/iio/dac/ad5380.c                     | 15 ++++++++-------
>  drivers/iio/dac/ad5446.c                     | 12 +++++++-----
>  drivers/iio/dac/ad5592r-base.c               |  4 +---
>  drivers/iio/dac/ad5592r-base.h               |  2 +-
>  drivers/iio/dac/ad5592r.c                    |  4 +++-
>  drivers/iio/dac/ad5593r.c                    |  4 +++-
>  drivers/iio/dac/ad5686-spi.c                 |  4 +++-
>  drivers/iio/dac/ad5686.c                     |  4 +---
>  drivers/iio/dac/ad5686.h                     |  2 +-
>  drivers/iio/dac/ad5696-i2c.c                 |  4 +++-
>  drivers/iio/health/afe4403.c                 |  6 ++----
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h      |  2 +-
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c |  4 +---
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c  |  4 +++-
>  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c  |  4 +++-
>  drivers/iio/magnetometer/hmc5843.h           |  2 +-
>  drivers/iio/magnetometer/hmc5843_core.c      |  4 +---
>  drivers/iio/magnetometer/hmc5843_i2c.c       |  4 +++-
>  drivers/iio/magnetometer/hmc5843_spi.c       |  4 +++-
>  drivers/iio/potentiometer/max5487.c          |  7 ++++++-
>  drivers/iio/pressure/ms5611.h                |  2 +-
>  drivers/iio/pressure/ms5611_core.c           |  4 +---
>  drivers/iio/pressure/ms5611_i2c.c            |  4 +++-
>  drivers/iio/pressure/ms5611_spi.c            |  4 +++-
>  44 files changed, 110 insertions(+), 81 deletions(-)
>
>
> base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
> --
> 2.30.2
>
