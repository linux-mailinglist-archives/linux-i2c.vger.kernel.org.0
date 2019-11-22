Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBC8106767
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 08:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKVH6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 02:58:21 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38706 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVH6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 02:58:21 -0500
Received: by mail-wr1-f66.google.com with SMTP id i12so7438695wro.5
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2019 23:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=w67p8xtPdt4/A9arfHNMFL65WBSDvCsMKuFi+DGBUsw=;
        b=GnqUaOqhAGPj1mSB54UkQHX4DC7zQbAMKGlzXTenoyFS7SJHIG7SkYKpS3E591jesy
         icCdTroOZhl3lQG0MC4noVz3GcrSdZ3Q0UiheNxmIgcCRphi4DzocgH6+akJKPMp54rE
         Zs9Tj8Bf38qwZUAhUiOtHylkX7OAbM9jDrZB5FWjgT724BNcW6t+rVhc+VS8nys/Yq+k
         X83hu5TH1/dV5m34mQ8wWV4jNtwESzBy6NBTfIFEUeVfVZCMG1ar96ADpDaRKm2evh/s
         wU/EBeaQJwE6HVdRYf8a3cY4MJpP0lZ+WrIwOTf4uiILzOSMn/yTgbEWMC2AfBJNxcrp
         x3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=w67p8xtPdt4/A9arfHNMFL65WBSDvCsMKuFi+DGBUsw=;
        b=B05Gc68cP+4S8M0gtt5USw1BJw/uwftMUGG+p9HMFPe+pbeHFvQUauxfqsx3isn1A0
         DqF5/JYz4PJdwEAiVnPzQeCv38UxzhSN+GLW7SsVDggYWnCCAvkbFrQUr1cri/4hv4NF
         nxM8x4nhC7xqKElND0J4nKdeJLb7L8z0V/3tfqVUVfKwX9mtCx87B3DM20t1p0QHu8B0
         D4VRulwzj+LTSKeOCkd/xPDCayNMXUECVqU7wtnqR8T29ZMuQJUCID/J8Q4MFvyNIfay
         on+EapZyLp8VJzFMp8wtSIykyw8fkpdwvcaPVkfJEipr9ljRYAQA5kZQZxibMViOuiiq
         5GBg==
X-Gm-Message-State: APjAAAWdhmMpUIPIJSZhSFuIBe2VmCWv6bADWP3KtrVCk4w1CZ9Myihz
        qrS1cZGNq9PHkCOxuus+kX9R3A==
X-Google-Smtp-Source: APXvYqzcaOQ0bWkk1yg8dpRwylAawt7qFh0J8UP4pvucZ/KaMyU92DHdCC4aa6RA4P2POZCfKVRT4Q==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr16206077wro.343.1574409498689;
        Thu, 21 Nov 2019 23:58:18 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id j67sm2673521wmb.43.2019.11.21.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 23:58:18 -0800 (PST)
Date:   Fri, 22 Nov 2019 07:58:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     enric.balletbo@collabora.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-iio@vger.kernel.org,
        Fabien Lahoudere <fabien.lahoudere@collabora.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Enrico Granata <egranata@chromium.org>,
        linux-rtc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Sebastian Reichel <sre@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Alexandru M Stan <amstan@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] platform/chrome: cros_ec: Rename cros_ec_dev to
 cros_ec_mfd_dev
Message-ID: <20191122075804.GB3296@dell>
References: <20191121164458.1.Ie5c276b95210779fc2ca5651e46552236795b6b9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191121164458.1.Ie5c276b95210779fc2ca5651e46552236795b6b9@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 21 Nov 2019, Raul E Rangel wrote:

> It's very confusing having cros_ec_dev and cros_ec_device. This makes it
> clear you are dealing with the mfd device.

An MFD isn't really a thing. It's a Linuxisum that doesn't really
describe anything meaningful. IMHO it would make more sense to follow
the same hierarchical structure that platform devices use:

  s/cros_ec_mfd_dev/cros_ec_parent/

> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> This is based on top of the i2c acpi tunnel patches:
> https://lore.kernel.org/patchwork/project/lkml/list/?series=419791
> 
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c       |  2 +-
>  drivers/iio/accel/cros_ec_accel_legacy.c      |  2 +-
>  .../common/cros_ec_sensors/cros_ec_sensors.c  |  2 +-
>  .../cros_ec_sensors/cros_ec_sensors_core.c    |  2 +-
>  .../cros_ec_sensors/cros_ec_sensors_ring.c    |  2 +-
>  drivers/iio/light/cros_ec_light_prox.c        |  2 +-
>  drivers/iio/pressure/cros_ec_baro.c           |  2 +-
>  .../media/platform/cros-ec-cec/cros-ec-cec.c  |  2 +-
>  drivers/mfd/cros_ec_dev.c                     | 14 ++++-----
>  drivers/platform/chrome/cros_ec_chardev.c     | 21 +++++++-------
>  drivers/platform/chrome/cros_ec_debugfs.c     | 16 +++++-----
>  drivers/platform/chrome/cros_ec_lightbar.c    | 29 ++++++++++---------
>  drivers/platform/chrome/cros_ec_pd_sysfs.c    |  6 ++--
>  drivers/platform/chrome/cros_ec_pd_update.c   | 20 ++++++-------
>  drivers/platform/chrome/cros_ec_sysfs.c       | 16 +++++-----
>  drivers/platform/chrome/cros_ec_vbc.c         |  8 ++---
>  drivers/platform/chrome/cros_usbpd_logger.c   |  6 ++--
>  drivers/power/supply/cros_usbpd-charger.c     |  6 ++--
>  drivers/rtc/rtc-cros-ec.c                     |  2 +-
>  include/linux/mfd/cros_ec.h                   |  8 ++---
>  .../linux/platform_data/cros_ec_pd_update.h   |  4 +--
>  21 files changed, 87 insertions(+), 85 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
