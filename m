Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F6E42E017
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 19:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbhJNRdS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 14 Oct 2021 13:33:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231667AbhJNRdS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Oct 2021 13:33:18 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 818FA60C4D;
        Thu, 14 Oct 2021 17:31:10 +0000 (UTC)
Date:   Thu, 14 Oct 2021 18:35:22 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Alexandru Ardelean <ardeleanalex@gmail.com>
Cc:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Dan Robertson <dan@dlrobertson.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 00/15] iio: let spi drivers return 0 in .remove()
Message-ID: <20211014183522.326ebab9@jic23-huawei>
In-Reply-To: <CA+U=DspB=++La907hoL8Uzf89uZzoC1rz=vXPX6FQ-voDPBROQ@mail.gmail.com>
References: <20211013203223.2694577-1-u.kleine-koenig@pengutronix.de>
        <CA+U=DspB=++La907hoL8Uzf89uZzoC1rz=vXPX6FQ-voDPBROQ@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 14 Oct 2021 10:45:36 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> On Wed, Oct 13, 2021 at 11:33 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > this series is part of my quest to change the return type of the spi
> > driver .remove() callback to void. In this first stage I fix all drivers
> > to return 0 to be able to mechanically change all drivers in the final
> > step.
> >
> > Returning an error code (which actually very few drivers do) doesn't
> > make much sense, because the only effect is that the spi core emits an
> > error message.
> >
> > The same holds try for i2c drivers, some of them are fixed en passant.
> >
> > There are no interdependencies in this series, and there is some more
> > work to do for the final conversion, so apply the patches from this
> > series at will :-)
> >  
> 
> Series looks good.
> However this set also makes a case for doing more conversions to devm_
> usage in probe.
Indeed. 2 of these were already done :)

Rest of the series applied to the togreg branch of iio.git and pushed out
as testing for 0-day to poke at it and see if we missed anything.

Thanks,

Jonathan

> 
> With devm_ , we get slightly less code, with some mirrored unwinding
> in error and remove paths.
> There are currently ~170 places (not necessarily the same amount of
> drivers), where devm_ can be used.
> 
> What I typically do is run this command in a kernel tree:  "git grep
> -w iio_device_unregister | wc -l"
> When I run it without "wc -l", I will pick a file and take a look
> inside it and check it's convertibility to using
> devm_iio_device_unregister()
> The rationale is, that for IIO drivers, if you get
> devm_iio_device_unregister() (properly) called last, then it's fully
> converted to devm_ functions.
> 
> For this series particularly:
> 
> Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> 
> > Best regards
> > Uwe
> >
> > Uwe Kleine-König (15):
> >   iio: accel: bma400: Make bma400_remove() return void
> >   iio: accel: bmc150: Make bmc150_accel_core_remove() return void
> >   iio: accel: bmi088: Make bmi088_accel_core_remove() return void
> >   iio: accel: kxsd9: Make kxsd9_common_remove() return void
> >   iio: accel: mma7455: Make mma7455_core_remove() return void
> >   iio: accel: ad5064: Make ad5064_core_remove() return void
> >   iio: dac: ad5380: Make ad5380_remove() return void
> >   iio: dac: ad5446: Make ad5446_remove() return void
> >   iio: dac: ad5592r: Make ad5592r_remove() return void
> >   iio: dac: ad5686: Make ad5686_remove() return void
> >   iio: health: afe4403: Don't return an error in .remove()
> >   iio: imu: st_lsm9ds0: Make st_lsm9ds0_remove() return void
> >   iio: magn: hmc5843: Make hmc5843_common_remove() return void
> >   iio: potentiometer: max5487: Don't return an error in .remove()
> >   iio: pressure: ms5611: Make ms5611_remove() return void
> >
> >  drivers/iio/accel/bma400.h                   |  2 +-
> >  drivers/iio/accel/bma400_core.c              |  7 ++++---
> >  drivers/iio/accel/bma400_i2c.c               |  4 +++-
> >  drivers/iio/accel/bma400_spi.c               |  4 +++-
> >  drivers/iio/accel/bmc150-accel-core.c        |  4 +---
> >  drivers/iio/accel/bmc150-accel-i2c.c         |  4 +++-
> >  drivers/iio/accel/bmc150-accel-spi.c         |  4 +++-
> >  drivers/iio/accel/bmc150-accel.h             |  2 +-
> >  drivers/iio/accel/bmi088-accel-core.c        |  4 +---
> >  drivers/iio/accel/bmi088-accel-spi.c         |  4 +++-
> >  drivers/iio/accel/bmi088-accel.h             |  2 +-
> >  drivers/iio/accel/kxsd9-i2c.c                |  4 +++-
> >  drivers/iio/accel/kxsd9-spi.c                |  4 +++-
> >  drivers/iio/accel/kxsd9.c                    |  4 +---
> >  drivers/iio/accel/kxsd9.h                    |  2 +-
> >  drivers/iio/accel/mma7455.h                  |  2 +-
> >  drivers/iio/accel/mma7455_core.c             |  4 +---
> >  drivers/iio/accel/mma7455_i2c.c              |  4 +++-
> >  drivers/iio/accel/mma7455_spi.c              |  4 +++-
> >  drivers/iio/dac/ad5064.c                     | 12 +++++++-----
> >  drivers/iio/dac/ad5380.c                     | 15 ++++++++-------
> >  drivers/iio/dac/ad5446.c                     | 12 +++++++-----
> >  drivers/iio/dac/ad5592r-base.c               |  4 +---
> >  drivers/iio/dac/ad5592r-base.h               |  2 +-
> >  drivers/iio/dac/ad5592r.c                    |  4 +++-
> >  drivers/iio/dac/ad5593r.c                    |  4 +++-
> >  drivers/iio/dac/ad5686-spi.c                 |  4 +++-
> >  drivers/iio/dac/ad5686.c                     |  4 +---
> >  drivers/iio/dac/ad5686.h                     |  2 +-
> >  drivers/iio/dac/ad5696-i2c.c                 |  4 +++-
> >  drivers/iio/health/afe4403.c                 |  6 ++----
> >  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0.h      |  2 +-
> >  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c |  4 +---
> >  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c  |  4 +++-
> >  drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c  |  4 +++-
> >  drivers/iio/magnetometer/hmc5843.h           |  2 +-
> >  drivers/iio/magnetometer/hmc5843_core.c      |  4 +---
> >  drivers/iio/magnetometer/hmc5843_i2c.c       |  4 +++-
> >  drivers/iio/magnetometer/hmc5843_spi.c       |  4 +++-
> >  drivers/iio/potentiometer/max5487.c          |  7 ++++++-
> >  drivers/iio/pressure/ms5611.h                |  2 +-
> >  drivers/iio/pressure/ms5611_core.c           |  4 +---
> >  drivers/iio/pressure/ms5611_i2c.c            |  4 +++-
> >  drivers/iio/pressure/ms5611_spi.c            |  4 +++-
> >  44 files changed, 110 insertions(+), 81 deletions(-)
> >
> >
> > base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
> > --
> > 2.30.2
> >  

