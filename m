Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7775F4CC1B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 12:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfFTKlq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 06:41:46 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:16233 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfFTKlq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 06:41:46 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190620104139epoutp04a024c00b2554ec7861419ac59607a02a~p4g7igQAM0357203572epoutp04I;
        Thu, 20 Jun 2019 10:41:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190620104139epoutp04a024c00b2554ec7861419ac59607a02a~p4g7igQAM0357203572epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561027299;
        bh=qY/ZKDg0Sp75oy4wVIGmsK/65KCFAf1hv6HCEHlBQ74=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=oOPemc4DY4zzysgZNJ40b2Qq2FplxkDc5qO4tebXAticd35zjHqkf84VWC37UYzPt
         WWtYoR2Wv9D5hd99PfBmGrhEkFsMO+sPFF7lbQwYHoXNhASzgRNl0Jo3fr4hHfzk57
         jV2idgk66/cQQf2DgC9vCpN2FtpKOwh4PMaaHldI=
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190620104136epcas1p1e9d0e992a904143a216884330bb576da~p4g4d9eVw1961819618epcas1p1_;
        Thu, 20 Jun 2019 10:41:36 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        C7.33.04257.FD26B0D5; Thu, 20 Jun 2019 19:41:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190620104135epcas1p20ade775f36a96941fb9c7653fefc7cbf~p4g387wYl0216002160epcas1p24;
        Thu, 20 Jun 2019 10:41:35 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190620104135epsmtrp1ac5e0e550af21bc1023424e961415ab3~p4g37FjJY2323523235epsmtrp1y;
        Thu, 20 Jun 2019 10:41:35 +0000 (GMT)
X-AuditID: b6c32a38-5e3ff700000010a1-7f-5d0b62df9950
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        AF.31.03692.FD26B0D5; Thu, 20 Jun 2019 19:41:35 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190620104134epsmtip225a18559ddfa8fded4400a11261116a3~p4g2-Jgwk0094800948epsmtip2Y;
        Thu, 20 Jun 2019 10:41:34 +0000 (GMT)
Subject: Re: [PATCH v2 02/10] mfd / platform: cros_ec: Move cros-ec core
 driver out from MFD
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org
Cc:     gwendal@chromium.org, Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, kernel@collabora.com,
        dtor@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
        Patrick Lai <plai@codeaurora.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Jean Delvare <jdelvare@suse.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Stefan Agner <stefan@agner.ch>, Vignesh R <vigneshr@ti.com>,
        Sebastian Reichel <sre@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Elie Morisse <syniurge@gmail.com>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-iio@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jiri Kosina <jikos@kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <51ee068e-f1c8-9d57-2ea2-5adfb34ca270@samsung.com>
Date:   Thu, 20 Jun 2019 19:44:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614163635.22413-3-enric.balletbo@collabora.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xbVRzHc+69vS2w6rUbckZMVu40ZhgeHTDPzCC6EXeTMcWo0YnQ3cEd
        EOgjbVmc06Qwx6OhbEIGUhiO8ZhjCITHhAJp7KA8pkPk4SgUUVhETKCyjSkMsO1lkf8+v9/5
        /s739zsnPxEuMYn8RalKHadRsuk06U3cur0vJGjmlE986MYChqqHx4QoZ7FWiEaHrRgyZpVg
        aL3QJkSZk9cEqGRuhECXf5sj0e1r8wCVZn0nQCtlxRiqn7QCtLrYI0SDC7U4KqvqJVCNY5lE
        OfpRIZrJqsOQve8CQC138wXo10e9AK2M5mIod/0hQBU9iwSaWF4RoBFzOYnym9oE6IGxByCH
        ow4g281REjnNYzhyfJEnQLXNTzA0mfkNiawFccgx3U+g3CuXAFozu3p0/PUWMt+MRnc6dail
        IUeImuqdBPrXXEGgzR+dQnSj34S/HsxUPZ7GmaYHWSSztloImKV7F4RMRf05pkw/TDAjBUaM
        aXdUA6bD5BAyzXV5JDM13kUyFQPvMBfXQ5mh8z2AKWitA0zf73oQ6/tR2qEUjk3iNFJOmahK
        SlUmR9LH3pUfkUccCJUFyQ6iV2mpklVwkXR0TGzQm6nprqenpWfY9AxXKpbVaumQqEMaVYaO
        k6aotLpImlMnpasPqoO1rEKboUwOTlQpXpOFhu6PcAlPpqVcbugm1MsnPtFnlpN6UHnUALxE
        kAqHfxTZCAPwFkmodgAn6hcxPlgGMGvoFskHKwCuVRrA05KpWuNWSTeA9u4FnA+WALRaLIRb
        tZNKgMarC6Sbd1EnYGHO38AtwinnDjg4aBe6D0gqEFrm73lEz1IBcOyfWY+FmIqCDZurnosI
        6iVomd7A3exLfQgfdjRvaZ6DA6VzHo0XdRg6R6c8jFN+0D73NcbzHni+rQzn2+70gkPV4TxH
        wye2GSHPO+FCX+sW+8M/L2Zv8Tl4Y6DHMz+kcgFstfwk4A/CoKWmyGUgchnsg43mED4dADvW
        rgDe9xm4+Chf4JZASgxzsyW8ZC8cmXFgPO+GVTl55CVAm7ZNY9o2gWnbBKb/za4Cog48z6m1
        imROK1OHb//uZuDZy0DUDrruxlgBJQL0DnF/oHe8RMCe0Z5VWAEU4fQu8X3gEy8RJ7FnP+U0
        KrkmI53TWkGE67G/xP19E1WuLVfq5LKI/WFhYShcdiBCJqP9xHKfiY8lVDKr49I4Ts1pntZh
        Ii9/PZBLP9sIss4m2E8HxI1M6M/bfcqvd9l19w2943celxhnk8Zt2RWxJT/EBC35h13frfvq
        W9kHnY1RPx/1MxW3fv+L80jxScyATR8+bbQ2plbmS9tAi1Lz4uds72p0jWy4JOSNOMXLx4tf
        2PN2wtB7p4pCBLbS+drNjvePHxv0XrK/YpikCW0KKwvENVr2P6DGoletBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SXUxTZxiA853znR+q1UPB+OkuzBoXY1UGiRfvxULIovG7WIjeTNEw6fQE
        jbSwHvxhS5ZSwAJa/BswW62VP2chiKAbFg1bCxW3uKVSjLOcqoib8QcRkE0EnbRZwt2TvM/z
        ve/FJ7K6Mn6puNtcKFvMxjw9r8E/BvTL1tz7cl526s+lydAQGhDAPtIkQDjkZ8Bhq2Vg5nhQ
        gOJIHQe1w/0Yqh8M8xCoe4zgpO0nDiZdNQy0RPwIpkZ6BPj1SRMLrvpeDI3qGA92a1iA+zYv
        A3evlyHo+P0wB/de9SKYDJczUD4zgcDdM4Lhz7FJDvp9p3g43HaZg3FHDwJV9SIINod5GPUN
        sKCWVnDQ1D7NQKT4Bx78VdtAjfZhKD99FMEb3/sb1aeZ4GteB791FUJHq12AtpZRDK99bgzv
        bo4KcL7PyWak0Pp/oixtG7fx9M3UcURf3CkTqLvlG+qyhjDtr3IwtFNtQPSKUxVou7eCp4O3
        r/LUfWMTPTKTSv8o6UG06pIX0etDVrRx0VbNJzvlvN37ZMvH6TmaXdWt13DBWNYBa/Ep3orO
        bqhECSKR1pLBJgeuRBpRJ3UhMnTBheODJaQm1MtWIvE9J5FAQIk7zxG59bYazTpJ0hfE4XnC
        z3KylEWCHR5hVmKlifnE7nzIxYubiNT9/YqdtXjJQLof34kVC6UPycC/D2MvaaV00vpuKrYZ
        Sx+R7ujbmL9I2kJcPiuOO4nkxsnhGCdIn5LR8GCMWWkFmXbfYuO8mNwdPsPEeRkpuexij6Ik
        55zcOSdxzkmccxIPwl60RC5QTLkmJa0gzSzvT1GMJmWvOTdlR76pHcU+p2FlJ+pv2O5Hkoj0
        87V9Bk22jjPuU4pMfkREVp+sfYTmZeu0O41FX8uW/O2WvXmy4kcfiFi/WPvIHMzSSbnGQnmP
        LBfIlv+njJiw1IoW0IzXXaTFEzw0cTHUWHHCsa155q+NL2vOZ0QhJzO1s/gz16Zf0oNF6Ht6
        KHDVN+1qHFofMa/A5Y3OB0+hzP/t+OrNuZ8nmjYvzKq/GGRxrafCXnXs4J7lAzkvPIxDTcuI
        tHIvbc/I/cSVtpJVpfSrI/nnur/Tns4sZA3RlEk9VnYZ0wysRTH+B20jyyWYAwAA
X-CMS-MailID: 20190620104135epcas1p20ade775f36a96941fb9c7653fefc7cbf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190614163658epcas4p3082dc3b9e4ca48e4a9215bb7bfd48c2d
References: <20190614163635.22413-1-enric.balletbo@collabora.com>
        <CGME20190614163658epcas4p3082dc3b9e4ca48e4a9215bb7bfd48c2d@epcas4p3.samsung.com>
        <20190614163635.22413-3-enric.balletbo@collabora.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Enric,

For extcon parth,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi

On 19. 6. 15. 오전 1:36, Enric Balletbo i Serra wrote:
> Now, the ChromeOS EC core driver has nothing related to an MFD device, so
> move that driver from the MFD subsystem to the platform/chrome subsystem.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Thierry Reding <thierry.reding@gmail.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Wolfram Sang <wsa@the-dreams.de>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/extcon/Kconfig                     |  2 +-
>  drivers/hid/Kconfig                        |  2 +-
>  drivers/i2c/busses/Kconfig                 |  2 +-
>  drivers/iio/common/cros_ec_sensors/Kconfig |  2 +-
>  drivers/input/keyboard/Kconfig             |  2 +-
>  drivers/media/platform/Kconfig             |  3 +--
>  drivers/mfd/Kconfig                        | 14 +-------------
>  drivers/mfd/Makefile                       |  2 --
>  drivers/platform/chrome/Kconfig            | 21 +++++++++++++++++----
>  drivers/platform/chrome/Makefile           |  1 +
>  drivers/{mfd => platform/chrome}/cros_ec.c |  0
>  drivers/power/supply/Kconfig               |  2 +-
>  drivers/pwm/Kconfig                        |  2 +-
>  drivers/rtc/Kconfig                        |  2 +-
>  sound/soc/qcom/Kconfig                     |  2 +-
>  15 files changed, 29 insertions(+), 30 deletions(-)
>  rename drivers/{mfd => platform/chrome}/cros_ec.c (100%)
> 
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index de06fafb52ff..5b0996b10d40 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -168,7 +168,7 @@ config EXTCON_USB_GPIO
>  
>  config EXTCON_USBC_CROS_EC
>  	tristate "ChromeOS Embedded Controller EXTCON support"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  Say Y here to enable USB Type C cable detection extcon support when
>  	  using Chrome OS EC based USB Type-C ports.
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index c3c390ca3690..b8022c158cb7 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -375,7 +375,7 @@ config HOLTEK_FF
>  
>  config HID_GOOGLE_HAMMER
>  	tristate "Google Hammer Keyboard"
> -	depends on USB_HID && LEDS_CLASS && MFD_CROS_EC
> +	depends on USB_HID && LEDS_CLASS && CROS_EC
>  	---help---
>  	Say Y here if you have a Google Hammer device.
>  
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 26186439db6b..f2c2ab7eeffa 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1335,7 +1335,7 @@ config I2C_SIBYTE
>  
>  config I2C_CROS_EC_TUNNEL
>  	tristate "ChromeOS EC tunnel I2C bus"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  If you say yes here you get an I2C bus that will tunnel i2c commands
>  	  through to the other side of the ChromeOS EC to the i2c bus
> diff --git a/drivers/iio/common/cros_ec_sensors/Kconfig b/drivers/iio/common/cros_ec_sensors/Kconfig
> index 135f6825903f..c7d5b140491f 100644
> --- a/drivers/iio/common/cros_ec_sensors/Kconfig
> +++ b/drivers/iio/common/cros_ec_sensors/Kconfig
> @@ -3,7 +3,7 @@
>  #
>  config IIO_CROS_EC_SENSORS_CORE
>  	tristate "ChromeOS EC Sensors Core"
> -	depends on SYSFS && MFD_CROS_EC
> +	depends on SYSFS && CROS_EC
>  	select IIO_BUFFER
>  	select IIO_TRIGGERED_BUFFER
>  	help
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 82398827b64f..fb843b56d439 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -728,7 +728,7 @@ config KEYBOARD_W90P910
>  config KEYBOARD_CROS_EC
>  	tristate "ChromeOS EC keyboard"
>  	select INPUT_MATRIXKMAP
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  Say Y here to enable the matrix keyboard used by ChromeOS devices
>  	  and implemented on the ChromeOS EC. You must enable one bus option
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 011c1c2fcf19..9883526c5ff0 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -557,10 +557,9 @@ if CEC_PLATFORM_DRIVERS
>  
>  config VIDEO_CROS_EC_CEC
>  	tristate "ChromeOS EC CEC driver"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	select CEC_CORE
>  	select CEC_NOTIFIER
> -	select CHROME_PLATFORMS
>  	select CROS_EC_PROTO
>  	help
>  	  If you say yes here you will get support for the
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 294d9567cc71..5bcf0af6471d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -210,21 +210,9 @@ config MFD_AXP20X_RSB
>  	  components like regulators or the PEK (Power Enable Key) under the
>  	  corresponding menus.
>  
> -config MFD_CROS_EC
> -	tristate "ChromeOS Embedded Controller"
> -	select MFD_CORE
> -	select CHROME_PLATFORMS
> -	select CROS_EC_PROTO
> -	depends on X86 || ARM || ARM64 || COMPILE_TEST
> -	help
> -	  If you say Y here you get support for the ChromeOS Embedded
> -	  Controller (EC) providing keyboard, battery and power services.
> -	  You also need to enable the driver for the bus you are using. The
> -	  protocol for talking to the EC is defined by the bus driver.
> -
>  config MFD_CROS_EC_CHARDEV
>  	tristate "Chrome OS Embedded Controller userspace device interface"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	---help---
>  	  This driver adds support to talk with the ChromeOS EC from userspace.
>  
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 52b1a90ff515..32327dc6bb45 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -13,8 +13,6 @@ obj-$(CONFIG_MFD_ASIC3)		+= asic3.o tmio_core.o
>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
>  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
>  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
> -cros_ec_core-objs		:= cros_ec.o
> -obj-$(CONFIG_MFD_CROS_EC)	+= cros_ec_core.o
>  obj-$(CONFIG_MFD_CROS_EC_CHARDEV) += cros_ec_dev.o
>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 997317d2f2b9..1e7a10500b3f 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -49,9 +49,22 @@ config CHROMEOS_TBMC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called chromeos_tbmc.
>  
> +config CROS_EC
> +	tristate "ChromeOS Embedded Controller"
> +	select CROS_EC_PROTO
> +	depends on X86 || ARM || ARM64 || COMPILE_TEST
> +	help
> +	  If you say Y here you get support for the ChromeOS Embedded
> +	  Controller (EC) providing keyboard, battery and power services.
> +	  You also need to enable the driver for the bus you are using. The
> +	  protocol for talking to the EC is defined by the bus driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cros_ec.
> +
>  config CROS_EC_I2C
>  	tristate "ChromeOS Embedded Controller (I2C)"
> -	depends on MFD_CROS_EC && I2C
> +	depends on CROS_EC && I2C
>  
>  	help
>  	  If you say Y here, you get support for talking to the ChromeOS
> @@ -61,7 +74,7 @@ config CROS_EC_I2C
>  
>  config CROS_EC_RPMSG
>  	tristate "ChromeOS Embedded Controller (rpmsg)"
> -	depends on MFD_CROS_EC && RPMSG && OF
> +	depends on CROS_EC && RPMSG && OF
>  	help
>  	  If you say Y here, you get support for talking to the ChromeOS EC
>  	  through rpmsg. This uses a simple byte-level protocol with a
> @@ -73,7 +86,7 @@ config CROS_EC_RPMSG
>  
>  config CROS_EC_SPI
>  	tristate "ChromeOS Embedded Controller (SPI)"
> -	depends on MFD_CROS_EC && SPI
> +	depends on CROS_EC && SPI
>  
>  	---help---
>  	  If you say Y here, you get support for talking to the ChromeOS EC
> @@ -83,7 +96,7 @@ config CROS_EC_SPI
>  
>  config CROS_EC_LPC
>          tristate "ChromeOS Embedded Controller (LPC)"
> -        depends on MFD_CROS_EC && ACPI && (X86 || COMPILE_TEST)
> +        depends on CROS_EC && ACPI && (X86 || COMPILE_TEST)
>          help
>            If you say Y here, you get support for talking to the ChromeOS EC
>            over an LPC bus. This uses a simple byte-level protocol with a
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index 1b2f1dcfcd5c..f69e0be98bd6 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -6,6 +6,7 @@ CFLAGS_cros_ec_trace.o:=		-I$(src)
>  obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
>  obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
>  obj-$(CONFIG_CHROMEOS_TBMC)		+= chromeos_tbmc.o
> +obj-$(CONFIG_CROS_EC)			+= cros_ec.o
>  obj-$(CONFIG_CROS_EC_I2C)		+= cros_ec_i2c.o
>  obj-$(CONFIG_CROS_EC_RPMSG)		+= cros_ec_rpmsg.o
>  obj-$(CONFIG_CROS_EC_SPI)		+= cros_ec_spi.o
> diff --git a/drivers/mfd/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> similarity index 100%
> rename from drivers/mfd/cros_ec.c
> rename to drivers/platform/chrome/cros_ec.c
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 26dacdab03cc..4c60cf22dbd7 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -655,7 +655,7 @@ config CHARGER_RT9455
>  
>  config CHARGER_CROS_USBPD
>  	tristate "ChromeOS EC based USBPD charger"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	default n
>  	help
>  	  Say Y here to enable ChromeOS EC based USBPD charger
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 1311b54089be..a7edd9cc35eb 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -144,7 +144,7 @@ config PWM_CRC
>  
>  config PWM_CROS_EC
>  	tristate "ChromeOS EC PWM driver"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  PWM driver for exposing a PWM attached to the ChromeOS Embedded
>  	  Controller.
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 7b8e156dbf38..a4ed24b6ecdf 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1264,7 +1264,7 @@ config RTC_DRV_ZYNQMP
>  
>  config RTC_DRV_CROS_EC
>  	tristate "Chrome OS EC RTC driver"
> -	depends on MFD_CROS_EC
> +	depends on CROS_EC
>  	help
>  	  If you say yes here you will get support for the
>  	  Chrome OS Embedded Controller's RTC.
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index b1764af858ba..34636f5b2cd5 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -98,7 +98,7 @@ config SND_SOC_MSM8996
>  
>  config SND_SOC_SDM845
>  	tristate "SoC Machine driver for SDM845 boards"
> -	depends on QCOM_APR && MFD_CROS_EC && I2C
> +	depends on QCOM_APR && CROS_EC && I2C
>  	select SND_SOC_QDSP6
>  	select SND_SOC_QCOM_COMMON
>  	select SND_SOC_RT5663
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
