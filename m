Return-Path: <linux-i2c+bounces-9073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84983A101B3
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 09:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C13B43A3445
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 08:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2352500C0;
	Tue, 14 Jan 2025 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="KW1loZQk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71E24022D;
	Tue, 14 Jan 2025 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736841980; cv=none; b=lTmYiK+t0oe6sPZ3onXRZFzYOSjfJiLyJ9FttehMOJ9G63GEVNjzLQb8HKvUqZJrfLO5FYvCJNq1W7XOZ6aMGVf/H/pYm/t3FpDuIqAzpU9G+TiSJFDeifPCyguOa3LM8NYXWkvZmHCcuYLrK9irlcJOuhuX8f/2DWe1Fo6qnZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736841980; c=relaxed/simple;
	bh=a3lGKpXQv+fvmPlZ0XoabRJFZEYWQtlXZquGz0kRnmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smWaIAcegK2JoU83VyvkU1e7dMrv5Hyjlmb3gg8wcEwy390zTw7q+bdTB+0UqUTpvozc7d++Ui7sFe/NKxvkNo13gA84IIPt54jB4n23SrrcYPPnadE1GjC5LVlZH48hQBBCqk05QNPxfGQXufQOSedfecZlO36o2fHv3xM+UkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=KW1loZQk; arc=none smtp.client-ip=193.252.22.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by smtp.orange.fr with ESMTPSA
	id Xbw3tWxvEajRjXbw6tgK4v; Tue, 14 Jan 2025 09:06:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736841966;
	bh=y5FCOdeaRQdxuXhLxG5LJE5vT9UJHDzxoLRUc9hzwLM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=KW1loZQk1MnPKjKOQjs/Rgn6LJsvOeXPggZSyzakahB7UEU/NfFxVqRpHX5jNPLiH
	 MZs15+6MAXI0W9PeaVhmThfus/TE+P+tS4dVJ34jFNTn+KI2JCQ4STS07W4h1mfJHL
	 jecUfJUvOCTLsfCltZ0V7KGQXNQOWkNeSuczrX0XHnaXJh5ILbPwpE4V8lyBfZDAkE
	 M9ow2wRoutC9pE/BWK2axCqcbnr7gmFYG5TvcotfnNJV4z4NlYlsGID0yevvfgxljG
	 /EoSxyZn++KTkH+t4zmmcWXF5uMYzT2zEemprjwxI0FvbE4N6OiiyzvlRQHf/QNf8Y
	 ArHSZVdJap3Qw==
X-ME-Helo: mail-ej1-f42.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 14 Jan 2025 09:06:06 +0100
X-ME-IP: 209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so905938766b.2;
        Tue, 14 Jan 2025 00:06:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAgIVoqDpycMuhROfc3A+t6KRtdu9kHNmr09HlmS5SANVDo1h2KWQm8UYNIQKE2BrS6BM1B/uE@vger.kernel.org, AJvYcCUayR/cmyfEfgucIlUkF3jes6T0lLPKeJtdv9OFnb3IEXq5YFGGAv5gz9c3TWWeH8ArAi5SUixV/Q4NPaI=@vger.kernel.org, AJvYcCUbiRMux1IsO7QibjFxTKZDV+zk0JuK6N+N/cT2nRIViUtlKXUR9L56bprs6/RcpVZQjlFOT5YO2kJe@vger.kernel.org, AJvYcCUvunFiVT+ulffCTFcQrtSUwfhSc/3LQZ3et0gyGk3YeMCG4Flu62tHqkHyC0FV+/VdYMcHwCBQMFc1@vger.kernel.org, AJvYcCV1ElAopErxv0o8cTL/NYRLN4Ag8aC2pmf9XkpNnbKb43lqDgvNQP0hlaSI50bDD/BQWs+voyCRo0QV@vger.kernel.org, AJvYcCVmyZAk4kzhHsEWP5SzcndmMS/SlR22nn5uTZzBvhDHWc15Uua2643Tls19LR1q4uQB35FpfEzBGWDk2gQXyQY=@vger.kernel.org, AJvYcCWswFCXhHDmgQ31gvDZe9aNbz+/nyEE/iMC8cqAuXRRGTrblFTda4zgoUZvJnMy0HirbdgbfjeTnc8=@vger.kernel.org, AJvYcCX5p14Ry9gDwRZtTatO7Lt4ykMoHNK8iEM7b5XsWOMHTPMweaDBc57CWeWZ/8wgxgW98JHvIRVMjkoOBQ/N@vger.kernel.org, AJvYcCX831DrWhM3xM94pQnxtwt6PgsYoWt06NC4CCSKXOGqui+T+vIyY8EyzJU8SyKbKof4ZvIrOIkI/4HIXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZFv30DG5zPxfY8INyEaPkC6tjOTwxDtb+C7hser+YHb5k0EZ
	tj33Z9Nwuau4Jxu9vu4Yo9njDQ5IAm8xC1QjHlu16ZTtSlcWLFTMSMfRmt9zn1ynlWqkWgtRud+
	0yBV15ZTPzmqJq7BJH/9c1YBdJ7c=
X-Google-Smtp-Source: AGHT+IHkNW03go5cRJVk2nh8Fu4X1sq2apE1l/QzNXYO58QJ0NxwsSafEN3mqMJ7sw5UVvnR6qOjK6eeJ+j/D0ukXfQ=
X-Received: by 2002:a17:906:f59f:b0:aa6:8781:9909 with SMTP id
 a640c23a62f3a-ab2ab709f7bmr2179498766b.29.1736841962523; Tue, 14 Jan 2025
 00:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114033010.2445925-1-a0282524688@gmail.com> <20250114033010.2445925-5-a0282524688@gmail.com>
In-Reply-To: <20250114033010.2445925-5-a0282524688@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Tue, 14 Jan 2025 17:05:51 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
X-Gm-Features: AbW1kvaXMudxv4pa2xYb8ZPww6lxNuPVIf9VI7ezaS7Ftiqm1AZEPIZ-SGWjdRY
Message-ID: <CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] can: Add Nuvoton NCT6694 CAN support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ming,

Now the structure finally looks good! I did a deeper review than before.

Right now, I am mostly concerned of the double use of mutexes:

  - nct6694_can_priv->lock in this can driver
  - nct6694->access_lock in the core driver

checkpatch.pl actually suggests you to add comments to those mutexes:

  CHECK: struct mutex definition without comment
  #146: FILE: drivers/net/can/usb/nct6694_canfd.c:146:
  +      struct mutex lock;

On Tue. 14 Jan 2025 at 12:32, Ming Yu <a0282524688@gmail.com> wrote:
> This driver supports Socket CANfd functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>
> ---
>  MAINTAINERS                         |   1 +
>  drivers/net/can/usb/Kconfig         |  10 +
>  drivers/net/can/usb/Makefile        |   1 +
>  drivers/net/can/usb/nct6694_canfd.c | 856 ++++++++++++++++++++++++++++
>  4 files changed, 868 insertions(+)
>  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e72f749cdf2..6e9b78202d6f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16724,6 +16724,7 @@ S:      Supported
>  F:     drivers/gpio/gpio-nct6694.c
>  F:     drivers/i2c/busses/i2c-nct6694.c
>  F:     drivers/mfd/nct6694.c
> +F:     drivers/net/can/usb/nct6694_canfd.c
>  F:     include/linux/mfd/nct6694.h
>
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> diff --git a/drivers/net/can/usb/Kconfig b/drivers/net/can/usb/Kconfig
> index 9dae0c71a2e1..53254012cdc4 100644
> --- a/drivers/net/can/usb/Kconfig
> +++ b/drivers/net/can/usb/Kconfig
> @@ -133,6 +133,16 @@ config CAN_MCBA_USB
>           This driver supports the CAN BUS Analyzer interface
>           from Microchip (http://www.microchip.com/development-tools/).
>
> +config CAN_NCT6694
> +       tristate "Nuvoton NCT6694 Socket CANfd support"
> +       depends on MFD_NCT6694

Your driver uses the CAN rx offload. You need to select it here.

          select CAN_RX_OFFLOAD

> +       help
> +         If you say yes to this option, support will be included for Nuvoton
> +         NCT6694, a USB device to socket CANfd controller.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called nct6694_canfd.

Here, the name is nct6694_canfd...

>  config CAN_PEAK_USB
>         tristate "PEAK PCAN-USB/USB Pro interfaces for CAN 2.0b/CAN-FD"
>         help
> diff --git a/drivers/net/can/usb/Makefile b/drivers/net/can/usb/Makefile
> index 8b11088e9a59..fcafb1ac262e 100644
> --- a/drivers/net/can/usb/Makefile
> +++ b/drivers/net/can/usb/Makefile
> @@ -11,5 +11,6 @@ obj-$(CONFIG_CAN_F81604) += f81604.o
>  obj-$(CONFIG_CAN_GS_USB) += gs_usb.o
>  obj-$(CONFIG_CAN_KVASER_USB) += kvaser_usb/
>  obj-$(CONFIG_CAN_MCBA_USB) += mcba_usb.o
> +obj-$(CONFIG_CAN_NCT6694) += nct6694_canfd.o
>  obj-$(CONFIG_CAN_PEAK_USB) += peak_usb/
>  obj-$(CONFIG_CAN_UCAN) += ucan.o
> diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
> new file mode 100644
> index 000000000000..7a15c39021ff
> --- /dev/null
> +++ b/drivers/net/can/usb/nct6694_canfd.c
> @@ -0,0 +1,856 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 Socket CANfd driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/can/dev.h>
> +#include <linux/can/rx-offload.h>
> +#include <linux/ethtool.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/platform_device.h>
> +
> +#define DRVNAME "nct6694-can"

... but here, it is nct6694-can.

Use a consistent name between the module name and the driver name.

> +/*
> + * USB command module type for NCT6694 CANfd controller.
> + * This defines the module type used for communication with the NCT6694
> + * CANfd controller over the USB interface.
> + */
> +#define NCT6694_CAN_MOD                        0x05
> +
> +/* Command 00h - CAN Setting and Initialization */
> +#define NCT6694_CAN_SETTING            0x00
> +#define NCT6694_CAN_SETTING_SEL(idx)   (idx ? 0x01 : 0x00)

What are the possible values for idx? Isn't it only 0 or 1? If so, no
need for this NCT6694_CAN_SETTING_SEL() macro. Directly assign the
channel index to the selector field.

> +#define NCT6694_CAN_SETTING_CTRL1_MON  BIT(0)
> +#define NCT6694_CAN_SETTING_CTRL1_NISO BIT(1)
> +#define NCT6694_CAN_SETTING_CTRL1_LBCK BIT(2)
> +
> +/* Command 01h - CAN Information */
> +#define NCT6694_CAN_INFORMATION                0x01
> +#define NCT6694_CAN_INFORMATION_SEL    0x00
> +
> +/* Command 02h - CAN Event */
> +#define NCT6694_CAN_EVENT              0x02
> +#define NCT6694_CAN_EVENT_SEL(idx, mask)       \
> +       ((idx ? 0x80 : 0x00) | ((mask) & 0xFF))

Can idx and mask really overlap? Shouldn't this be:

  #define NCT6694_CAN_EVENT_SEL(idx, mask)  \
          ((idx ? 0x80 : 0x00) | ((mask) & 0x7F))

> +#define NCT6694_CAN_EVENT_ERR          BIT(0)
> +#define NCT6694_CAN_EVENT_STATUS       BIT(1)
> +#define NCT6694_CAN_EVENT_TX_EVT       BIT(2)
> +#define NCT6694_CAN_EVENT_RX_EVT       BIT(3)
> +#define NCT6694_CAN_EVENT_REC          BIT(4)
> +#define NCT6694_CAN_EVENT_TEC          BIT(5)
> +#define NCT6694_CAN_EVENT_MASK         GENMASK(3, 0)
> +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY  BIT(7)  /* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_LOST   BIT(5)  /* Read-clear */
> +#define NCT6694_CAN_EVT_RX_HALF_FULL   BIT(6)  /* Read-clear */
> +#define NCT6694_CAN_EVT_RX_DATA_IN     BIT(7)  /* Read-clear*/

Some of those macro are not used:

  drivers/net/can/usb/nct6694_canfd.c:52: warning: macro
"NCT6694_CAN_EVT_RX_HALF_FULL" is not used [-Wunused-macros]
     52 | #define NCT6694_CAN_EVT_RX_HALF_FULL BIT(6) /* Read-clear */
        |
  drivers/net/can/usb/nct6694_canfd.c:43: warning: macro
"NCT6694_CAN_EVENT_ERR" is not used [-Wunused-macros]
     43 | #define NCT6694_CAN_EVENT_ERR  BIT(0)
        |
  drivers/net/can/usb/nct6694_canfd.c:44: warning: macro
"NCT6694_CAN_EVENT_STATUS" is not used [-Wunused-macros]
     44 | #define NCT6694_CAN_EVENT_STATUS BIT(1)
        |
  drivers/net/can/usb/nct6694_canfd.c:46: warning: macro
"NCT6694_CAN_EVENT_RX_EVT" is not used [-Wunused-macros]
     46 | #define NCT6694_CAN_EVENT_RX_EVT BIT(3)
        |
  drivers/net/can/usb/nct6694_canfd.c:45: warning: macro
"NCT6694_CAN_EVENT_TX_EVT" is not used [-Wunused-macros]
     45 | #define NCT6694_CAN_EVENT_TX_EVT BIT(2)
        |

Is this OK?

> +/* Command 10h - CAN Deliver */
> +#define NCT6694_CAN_DELIVER            0x10
> +#define NCT6694_CAN_DELIVER_SEL(buf_cnt)       \
> +       ((buf_cnt) & 0xFF)
> +
> +/* Command 11h - CAN Receive */
> +#define NCT6694_CAN_RECEIVE            0x11
> +#define NCT6694_CAN_RECEIVE_SEL(idx, buf_cnt)  \
> +       ((idx ? 0x80 : 0x00) | ((buf_cnt) & 0xFF))

Can idx and buf_cnt really overlap? Shouldn't this be:

  #define NCT6694_CAN_RECEIVE_SEL(idx, buf_cnt)  \
          ((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))

> +#define NCT6694_CAN_FRAME_TAG_CAN0     0xC0
> +#define NCT6694_CAN_FRAME_TAG_CAN1     0xC1
> +#define NCT6694_CAN_FRAME_FLAG_EFF     BIT(0)
> +#define NCT6694_CAN_FRAME_FLAG_RTR     BIT(1)
> +#define NCT6694_CAN_FRAME_FLAG_FD      BIT(2)
> +#define NCT6694_CAN_FRAME_FLAG_BRS     BIT(3)
> +#define NCT6694_CAN_FRAME_FLAG_ERR     BIT(4)
> +
> +#define NCT6694_NAPI_WEIGHT            32
> +
> +enum nct6694_event_err {
> +       NCT6694_CAN_EVT_ERR_NO_ERROR = 0,
> +       NCT6694_CAN_EVT_ERR_CRC_ERROR,
> +       NCT6694_CAN_EVT_ERR_STUFF_ERROR,
> +       NCT6694_CAN_EVT_ERR_ACK_ERROR,
> +       NCT6694_CAN_EVT_ERR_FORM_ERROR,
> +       NCT6694_CAN_EVT_ERR_BIT_ERROR,
> +       NCT6694_CAN_EVT_ERR_TIMEOUT_ERROR,
> +       NCT6694_CAN_EVT_ERR_UNKNOWN_ERROR,
> +};
> +
> +enum nct6694_event_status {
> +       NCT6694_CAN_EVT_STS_ERROR_ACTIVE = 0,
> +       NCT6694_CAN_EVT_STS_ERROR_PASSIVE,
> +       NCT6694_CAN_EVT_STS_BUS_OFF,
> +       NCT6694_CAN_EVT_STS_WARNING,
> +};
> +
> +struct __packed nct6694_can_setting {
> +       __le32 nbr;
> +       __le32 dbr;
> +       u8 active;
> +       u8 reserved[3];
> +       __le16 ctrl1;
> +       __le16 ctrl2;
> +       __le32 nbtp;
> +       __le32 dbtp;
> +};
> +
> +struct __packed nct6694_can_information {
> +       u8 tx_fifo_cnt;
> +       u8 rx_fifo_cnt;
> +       u8 reserved[2];
> +       __le32 can_clk;
> +};
> +
> +struct __packed nct6694_can_event {
> +       u8 err;
> +       u8 status;
> +       u8 tx_evt;
> +       u8 rx_evt;
> +       u8 rec;
> +       u8 tec;
> +       u8 reserved[2];
> +};
> +
> +struct __packed nct6694_can_frame {
> +       u8 tag;
> +       u8 flag;
> +       u8 reserved;
> +       u8 length;
> +       __le32 id;
> +       u8 data[64];

Nitpick, use CANFD_MAX_DLEN here:

          u8 data[CANFD_MAX_DLEN];

> +};
> +
> +union __packed nct6694_can_tx {
> +       struct nct6694_can_frame frame;
> +       struct nct6694_can_setting setting;
> +};
> +
> +union __packed nct6694_can_rx {
> +       struct nct6694_can_event event[2];
> +       struct nct6694_can_frame frame;
> +       struct nct6694_can_information info;
> +};
> +
> +struct nct6694_can_priv {
> +       struct can_priv can;    /* must be the first member */
> +       struct can_rx_offload offload;
> +       struct net_device *ndev;
> +       struct nct6694 *nct6694;
> +       struct mutex lock;
> +       struct sk_buff *tx_skb;
> +       struct workqueue_struct *wq;
> +       struct work_struct tx_work;
> +       union nct6694_can_tx *tx;
> +       union nct6694_can_rx *rx;
> +       unsigned char can_idx;
> +};
> +
> +static inline struct nct6694_can_priv *rx_offload_to_priv(struct can_rx_offload *offload)
> +{
> +       return container_of(offload, struct nct6694_can_priv, offload);
> +}
> +
> +static const struct can_bittiming_const nct6694_can_bittiming_nominal_const = {
> +       .name = DRVNAME,
> +       .tseg1_min = 2,
> +       .tseg1_max = 256,
> +       .tseg2_min = 2,
> +       .tseg2_max = 128,
> +       .sjw_max = 128,
> +       .brp_min = 1,
> +       .brp_max = 511,
> +       .brp_inc = 1,
> +};
> +
> +static const struct can_bittiming_const nct6694_can_bittiming_data_const = {
> +       .name = DRVNAME,
> +       .tseg1_min = 1,
> +       .tseg1_max = 32,
> +       .tseg2_min = 1,
> +       .tseg2_max = 16,
> +       .sjw_max = 16,
> +       .brp_min = 1,
> +       .brp_max = 31,
> +       .brp_inc = 1,
> +};
> +
> +static void nct6694_can_rx_offload(struct can_rx_offload *offload,
> +                                  struct sk_buff *skb)
> +{
> +       struct nct6694_can_priv *priv = rx_offload_to_priv(offload);
> +       int ret;
> +
> +       ret = can_rx_offload_queue_tail(offload, skb);
> +       if (ret)
> +               priv->ndev->stats.rx_fifo_errors++;
> +}
> +
> +static void nct6694_can_handle_lost_msg(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct net_device_stats *stats = &ndev->stats;
> +       struct can_frame *cf;
> +       struct sk_buff *skb;
> +
> +       netdev_err(ndev, "RX FIFO overflow, message(s) lost.\n");
> +
> +       stats->rx_errors++;
> +       stats->rx_over_errors++;
> +
> +       skb = alloc_can_err_skb(ndev, &cf);
> +       if (!skb)
> +               return;
> +
> +       cf->can_id |= CAN_ERR_CRTL;
> +       cf->data[1] = CAN_ERR_CRTL_RX_OVERFLOW;
> +
> +       nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_rx(struct net_device *ndev, u8 rx_evt)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct nct6694_can_frame *frame = &priv->rx->frame;
> +       struct nct6694_cmd_header cmd_hd = {
> +               .mod = NCT6694_CAN_MOD,
> +               .cmd = NCT6694_CAN_RECEIVE,
> +               .sel = NCT6694_CAN_RECEIVE_SEL(priv->can_idx, 1),
> +               .len = cpu_to_le16(sizeof(*frame))
> +       };
> +       struct canfd_frame *cfd;
> +       struct can_frame *cf;
> +       struct sk_buff *skb;
> +       int ret;
> +
> +       ret = nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
> +       if (ret)
> +               return;
> +
> +       if (frame->flag & NCT6694_CAN_FRAME_FLAG_FD) {

Reduce scope of variable when possible: move declaration of cfd here:

                struct canfd_frame *cfd;

> +               skb = alloc_canfd_skb(priv->ndev, &cfd);
> +               if (!skb)
> +                       return;
> +
> +               cfd->can_id = le32_to_cpu(frame->id);
> +               cfd->len = frame->length;

No. I asked you to sanitize the length in this message:

  https://lore.kernel.org/linux-can/8d66cf66-5564-4272-8c3e-51b715c3d785@wanadoo.fr/

Never use the length as is.

> +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +                       cfd->can_id |= CAN_EFF_FLAG;
> +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_BRS)
> +                       cfd->flags |= CANFD_BRS;
> +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_ERR)
> +                       cfd->flags |= CANFD_ESI;
> +
> +               memcpy(cfd->data, frame->data, cfd->len);
> +       } else {

Reduce scope of variable when possible: move declaration of cf here:

                struct canfd_frame *cf;

> +               skb = alloc_can_skb(priv->ndev, &cf);
> +               if (!skb)
> +                       return;
> +
> +               cf->can_id = le32_to_cpu(frame->id);
> +               cf->len = frame->length;

Ditto, sanitize the length.

> +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_EFF)
> +                       cf->can_id |= CAN_EFF_FLAG;
> +               if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
> +                       cf->can_id |= CAN_RTR_FLAG;
> +
> +               memcpy(cf->data, frame->data, cf->len);

Only copy can data if the frame is not an RTR frame.

                  if (frame->flag & NCT6694_CAN_FRAME_FLAG_RTR)
                          cf->can_id |= CAN_RTR_FLAG;
                  else
                          memcpy(cf->data, frame->data, cf->len);

I already asked you to do this in below comment:

  https://lore.kernel.org/linux-can/a25ea362-142f-4e27-8194-787d9829f607@wanadoo.fr/

> +       }
> +
> +       nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_clean(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +       if (priv->tx_skb || netif_queue_stopped(ndev))
> +               ndev->stats.tx_errors++;
> +       dev_kfree_skb(priv->tx_skb);
> +       priv->tx_skb = NULL;
> +}
> +
> +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> +                                       struct can_berr_counter *bec)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct nct6694_can_event *evt = priv->rx->event;
> +       struct nct6694_cmd_header cmd_hd;
> +       u8 mask = NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> +       int ret;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       cmd_hd = (struct nct6694_cmd_header) {
> +               .mod = NCT6694_CAN_MOD,
> +               .cmd = NCT6694_CAN_EVENT,
> +               .sel = NCT6694_CAN_EVENT_SEL(priv->can_idx, mask),
> +               .len = cpu_to_le16(sizeof(priv->rx->event))
> +       };
> +
> +       ret = nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> +       if (ret < 0)
> +               return ret;

You are holding the priv->lock mutex before calling
nct6694_read_msg(). But nct6694_read_msg() then holds the
nct6694->access_lock mutex. Why do you need a double mutex here? What
kind of race scenario are you trying to prevent here?

> +       bec->rxerr = evt[priv->can_idx].rec;
> +       bec->txerr = evt[priv->can_idx].tec;
> +
> +       return 0;
> +}
> +
> +static void nct6694_can_handle_state_change(struct net_device *ndev,
> +                                           u8 status)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       enum can_state new_state = priv->can.state;
> +       enum can_state rx_state, tx_state;
> +       struct can_berr_counter bec;
> +       struct can_frame *cf;
> +       struct sk_buff *skb;
> +
> +       nct6694_can_get_berr_counter(ndev, &bec);
> +       can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);

Here, you set up tx_state and rx_state...

> +       switch (status) {
> +       case NCT6694_CAN_EVT_STS_ERROR_ACTIVE:
> +               new_state = CAN_STATE_ERROR_ACTIVE;
> +               break;
> +       case NCT6694_CAN_EVT_STS_ERROR_PASSIVE:
> +               new_state = CAN_STATE_ERROR_PASSIVE;
> +               break;
> +       case NCT6694_CAN_EVT_STS_BUS_OFF:
> +               new_state = CAN_STATE_BUS_OFF;
> +               break;
> +       case NCT6694_CAN_EVT_STS_WARNING:
> +               new_state = CAN_STATE_ERROR_WARNING;
> +               break;
> +       default:
> +               netdev_err(ndev, "Receive unknown CAN status event.\n");
> +               return;
> +       }
> +
> +       /* state hasn't changed */
> +       if (new_state == priv->can.state)
> +               return;
> +
> +       skb = alloc_can_err_skb(ndev, &cf);
> +
> +       tx_state = bec.txerr >= bec.rxerr ? new_state : 0;
> +       rx_state = bec.txerr <= bec.rxerr ? new_state : 0;

... but you never used the values returned by
can_state_get_by_berr_counter() and just overwrote the tx and rx
state.

What is the logic here? Why do you need to manually adjust those two
values? Isn't the logic in can_change_state() sufficient?

> +       can_change_state(ndev, cf, tx_state, rx_state);
> +
> +       if (new_state == CAN_STATE_BUS_OFF) {

Same for the new_state. The function can_change_state() calculate the
new state from tx_state and rx_state and save it under
can_priv->state. But here, you do your own calculation.

Only keep one of the two. If your device already tells you the state,
then fine! Just use the information from your device and do not use
can_change_state(). Here, you are doing double work resulting in a
weird mix.

> +               can_bus_off(ndev);
> +       } else if (skb) {
> +               cf->can_id |= CAN_ERR_CNT;
> +               cf->data[6] = bec.txerr;
> +               cf->data[7] = bec.rxerr;
> +       }
> +
> +       nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_handle_bus_err(struct net_device *ndev, u8 bus_err)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct can_frame *cf;
> +       struct sk_buff *skb;
> +
> +       if (bus_err == NCT6694_CAN_EVT_ERR_NO_ERROR)
> +               return;
> +
> +       priv->can.can_stats.bus_error++;
> +
> +       skb = alloc_can_err_skb(ndev, &cf);
> +       if (skb)
> +               cf->can_id |= CAN_ERR_PROT | CAN_ERR_BUSERROR;
> +
> +       switch (bus_err) {
> +       case NCT6694_CAN_EVT_ERR_CRC_ERROR:
> +               netdev_dbg(ndev, "CRC error\n");
> +               ndev->stats.rx_errors++;
> +               if (skb)
> +                       cf->data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
> +               break;
> +
> +       case NCT6694_CAN_EVT_ERR_STUFF_ERROR:
> +               netdev_dbg(ndev, "Stuff error\n");
> +               ndev->stats.rx_errors++;
> +               if (skb)
> +                       cf->data[2] |= CAN_ERR_PROT_STUFF;
> +               break;
> +
> +       case NCT6694_CAN_EVT_ERR_ACK_ERROR:
> +               netdev_dbg(ndev, "Ack error\n");
> +               ndev->stats.tx_errors++;
> +               if (skb) {
> +                       cf->can_id |= CAN_ERR_ACK;
> +                       cf->data[2] |= CAN_ERR_PROT_TX;
> +               }
> +               break;
> +
> +       case NCT6694_CAN_EVT_ERR_FORM_ERROR:
> +               netdev_dbg(ndev, "Form error\n");
> +               ndev->stats.rx_errors++;
> +               if (skb)
> +                       cf->data[2] |= CAN_ERR_PROT_FORM;
> +               break;
> +
> +       case NCT6694_CAN_EVT_ERR_BIT_ERROR:
> +               netdev_dbg(ndev, "Bit error\n");
> +               ndev->stats.tx_errors++;
> +               if (skb)
> +                       cf->data[2] |= CAN_ERR_PROT_TX | CAN_ERR_PROT_BIT;
> +               break;
> +
> +       default:
> +               break;
> +       }
> +
> +       nct6694_can_rx_offload(&priv->offload, skb);
> +}
> +
> +static void nct6694_can_tx_irq(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct net_device_stats *stats = &ndev->stats;
> +
> +       guard(mutex)(&priv->lock);
> +       stats->tx_bytes += can_get_echo_skb(ndev, 0, NULL);
> +       stats->tx_packets++;
> +       netif_wake_queue(ndev);
> +}
> +
> +static irqreturn_t nct6694_can_irq(int irq, void *data)
> +{
> +       struct net_device *ndev = data;
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct nct6694_can_event *evt = priv->rx->event;
> +       struct nct6694_cmd_header cmd_hd;
> +       u8 tx_evt, rx_evt, bus_err, can_status;
> +       u8 mask_sts = NCT6694_CAN_EVENT_MASK;

No need for the mask_sts variable. Directly use NCT6694_CAN_EVENT_MASK.

> +       irqreturn_t handled = IRQ_NONE;
> +       int can_idx = priv->can_idx;
> +       int ret;
> +
> +       scoped_guard(mutex, &priv->lock) {

Reduce scope of variable when possible: move the declarations of
cmd_hd and ret here.

> +               cmd_hd = (struct nct6694_cmd_header) {
> +                       .mod = NCT6694_CAN_MOD,
> +                       .cmd = NCT6694_CAN_EVENT,
> +                       .sel = NCT6694_CAN_EVENT_SEL(priv->can_idx, mask_sts),
> +                       .len = cpu_to_le16(sizeof(priv->rx->event))
> +               };
> +
> +               ret = nct6694_read_msg(priv->nct6694, &cmd_hd, evt);
> +               if (ret < 0)
> +                       return handled;
> +
> +               tx_evt = evt[can_idx].tx_evt;
> +               rx_evt = evt[can_idx].rx_evt;
> +               bus_err = evt[can_idx].err;
> +               can_status = evt[can_idx].status;
> +       }
> +
> +       if (rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) {
> +               nct6694_can_rx(ndev, rx_evt);
> +               handled = IRQ_HANDLED;
> +       }
> +
> +       if (rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST) {
> +               nct6694_can_handle_lost_msg(ndev);
> +               handled = IRQ_HANDLED;
> +       }
> +
> +       if (can_status) {
> +               nct6694_can_handle_state_change(ndev, can_status);
> +               handled = IRQ_HANDLED;
> +       }
> +
> +       if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING) {
> +               nct6694_handle_bus_err(ndev, bus_err);
> +               handled = IRQ_HANDLED;
> +       }
> +
> +       if (handled)
> +               can_rx_offload_threaded_irq_finish(&priv->offload);
> +
> +       if (tx_evt & NCT6694_CAN_EVT_TX_FIFO_EMPTY)
> +               nct6694_can_tx_irq(ndev);
> +
> +       return handled;
> +}
> +
> +static void nct6694_can_tx(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct nct6694_can_frame *frame = &priv->tx->frame;
> +       struct nct6694_cmd_header cmd_hd = {
> +               .mod = NCT6694_CAN_MOD,
> +               .cmd = NCT6694_CAN_DELIVER,
> +               .sel = NCT6694_CAN_DELIVER_SEL(1),
> +               .len = cpu_to_le16(sizeof(*frame))
> +       };
> +       struct net_device_stats *stats = &ndev->stats;
> +       struct sk_buff *skb = priv->tx_skb;
> +       struct canfd_frame *cfd;
> +       struct can_frame *cf;
> +       u32 txid;
> +       int err;
> +
> +       memset(frame, 0, sizeof(*frame));
> +
> +       if (priv->can_idx == 0)
> +               frame->tag = NCT6694_CAN_FRAME_TAG_CAN0;
> +       else
> +               frame->tag = NCT6694_CAN_FRAME_TAG_CAN1;
> +
> +       if (can_is_canfd_skb(skb)) {

Reduce scope of variable when possible: move declaration of cfd here:

                struct canfd_frame *cfd;

> +               cfd = (struct canfd_frame *)priv->tx_skb->data;
> +
> +               if (cfd->flags & CANFD_BRS)
> +                       frame->flag |= NCT6694_CAN_FRAME_FLAG_BRS;
> +
> +               if (cfd->can_id & CAN_EFF_FLAG) {
> +                       txid = cfd->can_id & CAN_EFF_MASK;
> +                       frame->flag |= NCT6694_CAN_FRAME_FLAG_EFF;
> +               } else {
> +                       txid = cfd->can_id & CAN_SFF_MASK;
> +               }
> +               frame->flag |= NCT6694_CAN_FRAME_FLAG_FD;
> +               frame->id = cpu_to_le32(txid);
> +               frame->length = cfd->len;
> +
> +               memcpy(frame->data, cfd->data, cfd->len);
> +       } else {

Reduce scope of variable when possible: move declaration of cf here:

                struct canfd_frame *cf;

> +               cf = (struct can_frame *)priv->tx_skb->data;
> +
> +               if (cf->can_id & CAN_RTR_FLAG)
> +                       frame->flag |= NCT6694_CAN_FRAME_FLAG_RTR;
> +
> +               if (cf->can_id & CAN_EFF_FLAG) {
> +                       txid = cf->can_id & CAN_EFF_MASK;
> +                       frame->flag |= NCT6694_CAN_FRAME_FLAG_EFF;
> +               } else {
> +                       txid = cf->can_id & CAN_SFF_MASK;
> +               }
> +               frame->id = cpu_to_le32(txid);
> +               frame->length = cf->len;
> +
> +               memcpy(frame->data, cf->data, cf->len);

Don't copy cf->data if the can frame is a RTR frame.

> +       }
> +
> +       err = nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
> +       if (err) {
> +               netdev_err(ndev, "%s: Tx FIFO full!\n", __func__);
> +               can_free_echo_skb(ndev, 0, NULL);
> +               stats->tx_dropped++;
> +               stats->tx_errors++;
> +               netif_wake_queue(ndev);
> +       }
> +}
> +
> +static void nct6694_can_tx_work(struct work_struct *work)
> +{
> +       struct nct6694_can_priv *priv = container_of(work,
> +                                                    struct nct6694_can_priv,
> +                                                    tx_work);
> +       struct net_device *ndev = priv->ndev;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       if (priv->tx_skb) {
> +               if (priv->can.state == CAN_STATE_BUS_OFF) {
> +                       nct6694_can_clean(ndev);
> +               } else {
> +                       nct6694_can_tx(ndev);
> +                       can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> +                       priv->tx_skb = NULL;
> +               }
> +       }
> +}
> +
> +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> +                                         struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +       if (can_dev_dropped_skb(ndev, skb))
> +               return NETDEV_TX_OK;
> +
> +       if (priv->tx_skb) {
> +               netdev_err(ndev, "hard_xmit called while tx busy\n");
> +               return NETDEV_TX_BUSY;
> +       }
> +
> +       netif_stop_queue(ndev);
> +       priv->tx_skb = skb;
> +       queue_work(priv->wq, &priv->tx_work);
> +
> +       return NETDEV_TX_OK;
> +}
> +
> +static int nct6694_can_start(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       struct nct6694_can_setting *setting = &priv->tx->setting;
> +       struct nct6694_cmd_header cmd_hd = {
> +               .mod = NCT6694_CAN_MOD,
> +               .cmd = NCT6694_CAN_SETTING,
> +               .sel = NCT6694_CAN_SETTING_SEL(priv->can_idx),
> +               .len = cpu_to_le16(sizeof(*setting))
> +       };
> +       const struct can_bittiming *n_bt = &priv->can.bittiming;
> +       const struct can_bittiming *d_bt = &priv->can.data_bittiming;
> +       int ret;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       memset(setting, 0, sizeof(*setting));
> +       setting->nbr = cpu_to_le32(n_bt->bitrate);
> +       setting->dbr = cpu_to_le32(d_bt->bitrate);
> +
> +       if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> +               setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_MON);
> +
> +       if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
> +           priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> +               setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_NISO);
> +
> +       if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> +               setting->ctrl1 |= cpu_to_le16(NCT6694_CAN_SETTING_CTRL1_LBCK);
> +
> +       ret = nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
> +       if (ret)
> +               return ret;
> +
> +       priv->can.state = CAN_STATE_ERROR_ACTIVE;
> +
> +       return ret;
> +}
> +
> +static int nct6694_can_stop(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +
> +       netif_stop_queue(ndev);
> +       free_irq(ndev->irq, ndev);
> +       destroy_workqueue(priv->wq);
> +       priv->wq = NULL;
> +       nct6694_can_clean(ndev);
> +       priv->can.state = CAN_STATE_STOPPED;
> +       can_rx_offload_disable(&priv->offload);
> +       close_candev(ndev);
> +
> +       return 0;
> +}
> +
> +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode mode)
> +{
> +       switch (mode) {
> +       case CAN_MODE_START:
> +               nct6694_can_clean(ndev);
> +               nct6694_can_start(ndev);
> +               netif_wake_queue(ndev);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int nct6694_can_open(struct net_device *ndev)
> +{
> +       struct nct6694_can_priv *priv = netdev_priv(ndev);
> +       int ret;
> +
> +       ret = open_candev(ndev);
> +       if (ret)
> +               return ret;
> +
> +       can_rx_offload_enable(&priv->offload);
> +
> +       ret = request_threaded_irq(ndev->irq, NULL,
> +                                  nct6694_can_irq, IRQF_ONESHOT,
> +                                  "nct6694_can", ndev);
> +       if (ret) {
> +               netdev_err(ndev, "Failed to request IRQ\n");
> +               goto close_candev;
> +       }
> +
> +       priv->wq = alloc_ordered_workqueue("%s-nct6694_wq",
> +                                          WQ_FREEZABLE | WQ_MEM_RECLAIM,
> +                                          ndev->name);
> +       if (!priv->wq) {
> +               ret = -ENOMEM;
> +               goto free_irq;
> +       }
> +
> +       priv->tx_skb = NULL;
> +
> +       ret = nct6694_can_start(ndev);
> +       if (ret)
> +               goto destroy_wq;
> +
> +       netif_start_queue(ndev);
> +
> +       return 0;
> +
> +destroy_wq:
> +       destroy_workqueue(priv->wq);
> +free_irq:
> +       free_irq(ndev->irq, ndev);
> +close_candev:
> +       can_rx_offload_disable(&priv->offload);
> +       close_candev(ndev);
> +       return ret;
> +}
> +
> +static const struct net_device_ops nct6694_can_netdev_ops = {
> +       .ndo_open = nct6694_can_open,
> +       .ndo_stop = nct6694_can_stop,
> +       .ndo_start_xmit = nct6694_can_start_xmit,
> +       .ndo_change_mtu = can_change_mtu,
> +};
> +
> +static const struct ethtool_ops nct6694_can_ethtool_ops = {
> +       .get_ts_info = ethtool_op_get_ts_info,
> +};
> +
> +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> +{
> +       struct nct6694_can_information *info = &priv->rx->info;
> +       struct nct6694_cmd_header cmd_hd = {
> +               .mod = NCT6694_CAN_MOD,
> +               .cmd = NCT6694_CAN_INFORMATION,
> +               .sel = NCT6694_CAN_INFORMATION_SEL,
> +               .len = cpu_to_le16(sizeof(*info))
> +       };
> +       int ret;
> +
> +       ret = nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> +       if (ret)
> +               return ret;
> +
> +       return le32_to_cpu(info->can_clk);
> +}
> +
> +static int nct6694_can_probe(struct platform_device *pdev)
> +{
> +       const struct mfd_cell *cell = mfd_get_cell(pdev);
> +       struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
> +       struct nct6694_can_priv *priv;
> +       struct net_device *ndev;
> +       int ret, irq, can_clk;
> +
> +       irq = irq_create_mapping(nct6694->domain,
> +                                NCT6694_IRQ_CAN1 + cell->id);
> +       if (!irq)
> +               return irq;
> +
> +       ndev = alloc_candev(sizeof(struct nct6694_can_priv), 1);
> +       if (!ndev)
> +               return -ENOMEM;
> +
> +       ndev->irq = irq;
> +       ndev->flags |= IFF_ECHO;
> +       ndev->netdev_ops = &nct6694_can_netdev_ops;
> +       ndev->ethtool_ops = &nct6694_can_ethtool_ops;

Your device has two CAN interfaces, right? Do not forget to populate
netdev->dev_port.

          netdev->dev_port = cell->id;

> +       priv = netdev_priv(ndev);
> +       priv->nct6694 = nct6694;
> +       priv->ndev = ndev;
> +
> +       priv->tx = devm_kzalloc(&pdev->dev, sizeof(union nct6694_can_tx),
> +                               GFP_KERNEL);
> +       if (!priv->tx) {
> +               ret = -ENOMEM;
> +               goto free_candev;
> +       }
> +
> +       priv->rx = devm_kzalloc(&pdev->dev, sizeof(union nct6694_can_rx),
> +                               GFP_KERNEL);
> +       if (!priv->rx) {
> +               ret = -ENOMEM;
> +               goto free_candev;
> +       }
> +
> +       can_clk = nct6694_can_get_clock(priv);
> +       if (can_clk < 0) {
> +               ret = dev_err_probe(&pdev->dev, can_clk,
> +                                   "Failed to get clock\n");
> +               goto free_candev;
> +       }
> +
> +       devm_mutex_init(&pdev->dev, &priv->lock);
> +       INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> +
> +       priv->can_idx = cell->id;
> +       priv->can.state = CAN_STATE_STOPPED;
> +       priv->can.clock.freq = can_clk;
> +       priv->can.bittiming_const = &nct6694_can_bittiming_nominal_const;
> +       priv->can.data_bittiming_const = &nct6694_can_bittiming_data_const;
> +       priv->can.do_set_mode = nct6694_can_set_mode;
> +       priv->can.do_get_berr_counter = nct6694_can_get_berr_counter;
> +
> +       priv->can.ctrlmode = CAN_CTRLMODE_FD;
> +
> +       priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK            |
> +                                      CAN_CTRLMODE_LISTENONLY          |
> +                                      CAN_CTRLMODE_FD                  |
> +                                      CAN_CTRLMODE_FD_NON_ISO          |
> +                                      CAN_CTRLMODE_BERR_REPORTING;
> +
> +       ret = can_rx_offload_add_manual(ndev, &priv->offload,
> +                                       NCT6694_NAPI_WEIGHT);
> +       if (ret) {
> +               dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\n");
> +               goto free_candev;
> +       }
> +
> +       platform_set_drvdata(pdev, priv);
> +       SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> +
> +       ret = register_candev(priv->ndev);
> +       if (ret)
> +               goto del_rx_offload;
> +
> +       return 0;
> +
> +del_rx_offload:
> +       can_rx_offload_del(&priv->offload);
> +free_candev:
> +       free_candev(ndev);
> +       return ret;
> +}
> +
> +static void nct6694_can_remove(struct platform_device *pdev)
> +{
> +       struct nct6694_can_priv *priv = platform_get_drvdata(pdev);
> +
> +       cancel_work_sync(&priv->tx_work);
> +       unregister_candev(priv->ndev);
> +       can_rx_offload_del(&priv->offload);
> +       free_candev(priv->ndev);
> +}
> +
> +static struct platform_driver nct6694_can_driver = {
> +       .driver = {
> +               .name   = DRVNAME,
> +       },
> +       .probe          = nct6694_can_probe,
> +       .remove         = nct6694_can_remove,
> +};
> +
> +module_platform_driver(nct6694_can_driver);
> +
> +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-can");


Yours sincerely,
Vincent Mailhol

