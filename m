Return-Path: <linux-i2c+bounces-8453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 749619ECFA3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 16:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2047B286789
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 15:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841F71AC88A;
	Wed, 11 Dec 2024 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="KyR6r6mr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB0246356;
	Wed, 11 Dec 2024 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733930735; cv=none; b=hAvOvXK6/IX+iYGUV7bL5tqs2mmyfFI+SEttzU3zN8fTkVJKR90bVIMP0u6g9ev+OcYvA8wCO5D3brIkF3lQhMf/9Frm16cyDVsuK8X9GgMCbpUQdAvwo+2VRiEVGsmsWcQPrEWPgqYG/mda81+6TvNmRZO+zrXfE1mpsGFagbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733930735; c=relaxed/simple;
	bh=2fhif3FIz+qRtrvExt8HLRxbrtTPw9qBcr4maCGOSrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uarbYCOkb3YWp3dMPyFgxIG+LHB3vSY6qF8uNqLj5XZZWY6flnAQv6CMtJFBjnGeG4mtynVAAx9aT1wUr1cRDikYWZUMW0tULEaUodXEBZ1WOUcWPhqoDlqs/sw7xWhmH2h3LO+4Dwtqt9mwQzq1AzLaeEB1uXVmd/nJrQFLna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=KyR6r6mr; arc=none smtp.client-ip=193.252.22.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by smtp.orange.fr with ESMTPSA
	id LOaXtm5WEe9OfLOaXtSbNa; Wed, 11 Dec 2024 16:25:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733930721;
	bh=34uvRkMEZvLXV3kVHcZ5VogbHEs268OvNDy3kdOjUt0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=KyR6r6mrsx5aOSIxSfGtMIqVwLLQM/GMBQOZuazx8Wh7e24SGHlu9HAj1JMMPs6TJ
	 xIdELSI+xIopM6tTZn5KkMjHbQdK47p27bV927zsv/RoGivm3+kZ9alXs5Z2aI0ZZm
	 TkmOZ9tnXSaj1iSn56nldHhpp46G55tisWiiSk9aQxbDrR3OlCESJj30olymVMIM6Q
	 L8gq0/cbU5xCPBYjBdWd5pJYjcXDbIJi0kETYgIYl1bhiY12H+fXCOQNqX1JsTPXAs
	 0Wdn0Q8qMy/LcKCMZTE62f2EKDhRrjMd8zbLY1jHRyiHJ5j3pcEnn1uqr96IDXXjO9
	 fDWpWf/naVr2Q==
X-ME-Helo: mail-ej1-f49.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 11 Dec 2024 16:25:21 +0100
X-ME-IP: 209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa6aad76beeso263746466b.2;
        Wed, 11 Dec 2024 07:25:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL1qL4tiSVCW0Y+sHAMNCsTSquotNN6ilGqZBMwCOjKYsAoZV1ZuVMvJeM4L9pVbMaoHxbqYBq@vger.kernel.org, AJvYcCUakFxjbgHKs4zuTqIO1natAneOS3d9X+Ir9IcGdNnKc/P+jDB7YBKSWlA6zc0MQh2zMpI7+zidlvbF@vger.kernel.org, AJvYcCV7PzDe3eGGTHE0C2M7+W0EnEzR7Hb18XgwC36Fv0VYWbNN9m65sZK+ARjc7uCqVS+b1VdR/aCHw4zN@vger.kernel.org, AJvYcCVv3Tl3KiU1x1YpAwgLqqpbNAm/DZTtpDu4KWZgDt1ttRR6ERCJYSY0j8ZxJSrHiiOo6+l9Xgh7sdfGpZrg@vger.kernel.org, AJvYcCXTvwm5tsTxtrf2ZHBhCpi8EJxuulDlpmMeQ/7iNloRF5i6xn4Ygax3BNpoBKdgIRI9K71QA1epv5QKo/Th7Y4=@vger.kernel.org, AJvYcCXa1HyFNAyeAHKQ2apYRiQBJnkj+LRWVbibNeTOZPIUFRlfPbc8FZOcPckowMeM7md5bnT3yU1PSlc=@vger.kernel.org, AJvYcCXinjkE+CZIiTWb9LcuLwAKINXYClgEbL220Zq2frmHyfhEiufC0kEBvQtk2bV7i5LyySkrwfYvZzlt2w==@vger.kernel.org, AJvYcCXsY0jz8qZhsjjFwmhBJDl/qAIfRWvCGhub9BuCNpgzWm3QY284PyqQLZg0/IYxnkybCzhq8h/5nbe2HUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypof/JUp/eZW5ZNaosETpBLkLTFbqdzBQ2WN03B+BJQO/+z7Ar
	5gM+TZn/Q5OkRk4qli3eR/JdmfrznTmmd0vRIotcLLbNbJ8qxIGaOFRuxIajxsR2IXs9bbQpWf7
	8+oE0kJce+qEFBpBI1luByoYCjKY=
X-Google-Smtp-Source: AGHT+IG/OgtCNsAOpF0EdoGHxe1QCF1jcOUazyUtC9UIXOlZV3V792AUlwBETZEMuPPdqrJ41lk18DQ3qily1SoquX4=
X-Received: by 2002:a17:906:18a1:b0:aa5:391e:cadf with SMTP id
 a640c23a62f3a-aa6b1394631mr265392866b.42.1733930720566; Wed, 11 Dec 2024
 07:25:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-5-tmyu0@nuvoton.com>
 <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de>
In-Reply-To: <20241211-taupe-leech-of-respect-4c325a-mkl@pengutronix.de>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Thu, 12 Dec 2024 00:25:09 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLMyW6HfTGEOHm7B8rr6=hvuxMEWfEEhxv5Nw7fgpM=WA@mail.gmail.com>
Message-ID: <CAMZ6RqLMyW6HfTGEOHm7B8rr6=hvuxMEWfEEhxv5Nw7fgpM=WA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] can: Add Nuvoton NCT6694 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed. 11 Dec. 2024 at 18:59, Marc Kleine-Budde <mkl@pengutronix.de> wrote=
:
> On 10.12.2024 18:45:21, Ming Yu wrote:
> > This driver supports Socket CANfd functionality for NCT6694 MFD
> > device based on USB interface.
>
> Please use the rx-offload helper, otherwise the CAN frames might be
> revived out of order.
>
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >  MAINTAINERS                     |   1 +
> >  drivers/net/can/Kconfig         |  10 +
> >  drivers/net/can/Makefile        |   1 +
> >  drivers/net/can/nct6694_canfd.c | 920 ++++++++++++++++++++++++++++++++
> >  4 files changed, 932 insertions(+)
> >  create mode 100644 drivers/net/can/nct6694_canfd.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a190f2b08fa3..eb5d46825e71 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16548,6 +16548,7 @@ S:    Supported
> >  F:   drivers/gpio/gpio-nct6694.c
> >  F:   drivers/i2c/busses/i2c-nct6694.c
> >  F:   drivers/mfd/nct6694.c
> > +F:   drivers/net/can/nct6694_canfd.c
> >  F:   include/linux/mfd/nct6694.h
> >
> >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> > diff --git a/drivers/net/can/Kconfig b/drivers/net/can/Kconfig
> > index cf989bea9aa3..130e98ec28a5 100644
> > --- a/drivers/net/can/Kconfig
> > +++ b/drivers/net/can/Kconfig
> > @@ -200,6 +200,16 @@ config CAN_SUN4I
> >         To compile this driver as a module, choose M here: the module w=
ill
> >         be called sun4i_can.
> >
> > +config CAN_NCT6694
> > +     tristate "Nuvoton NCT6694 Socket CANfd support"
> > +     depends on MFD_NCT6694
> > +     help
> > +       If you say yes to this option, support will be included for Nuv=
oton
> > +       NCT6694, a USB device to socket CANfd controller.
> > +
> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called nct6694_canfd.
> > +
> >  config CAN_TI_HECC
> >       depends on ARM
> >       tristate "TI High End CAN Controller"
> > diff --git a/drivers/net/can/Makefile b/drivers/net/can/Makefile
> > index a71db2cfe990..4a6b5b9d6c2b 100644
> > --- a/drivers/net/can/Makefile
> > +++ b/drivers/net/can/Makefile
> > @@ -28,6 +28,7 @@ obj-$(CONFIG_CAN_JANZ_ICAN3)        +=3D janz-ican3.o
> >  obj-$(CONFIG_CAN_KVASER_PCIEFD)      +=3D kvaser_pciefd.o
> >  obj-$(CONFIG_CAN_MSCAN)              +=3D mscan/
> >  obj-$(CONFIG_CAN_M_CAN)              +=3D m_can/
> > +obj-$(CONFIG_CAN_NCT6694)    +=3D nct6694_canfd.o
> >  obj-$(CONFIG_CAN_PEAK_PCIEFD)        +=3D peak_canfd/
> >  obj-$(CONFIG_CAN_SJA1000)    +=3D sja1000/
> >  obj-$(CONFIG_CAN_SUN4I)              +=3D sun4i_can.o
> > diff --git a/drivers/net/can/nct6694_canfd.c b/drivers/net/can/nct6694_=
canfd.c
> > new file mode 100644
> > index 000000000000..54f20f0681e2
> > --- /dev/null
> > +++ b/drivers/net/can/nct6694_canfd.c
> > @@ -0,0 +1,920 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 Socket CANfd driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/can/dev.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/netdevice.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DRVNAME "nct6694-can"
> > +
> > +/* Host interface */
> > +#define NCT6694_CAN_MOD                      0x05
> > +
> > +/* Message Channel*/
> > +/* Command 00h */

Instead of this comment, explain what the command 00h does.

Also better to give a memorable name instead of CMD0. For example:
CMD_TX, CMD_RX=E2=80=A6

If possible, make it match the structure names.

> > +#define NCT6694_CAN_CMD0_OFFSET(idx) (idx ? 0x0100 : 0x0000)
> > +#define NCT6694_CAN_CTRL1_MON                BIT(0)
> > +#define NCT6694_CAN_CTRL1_NISO               BIT(1)
> > +#define NCT6694_CAN_CTRL1_LBCK               BIT(2)
> > +
> > +/* Command 01h */
> > +#define NCT6694_CAN_CMD1_OFFSET              0x0001
> > +
> > +/* Command 02h */
> > +#define NCT6694_CAN_CMD2_OFFSET(idx, mask)                   \
> > +     ({ typeof(mask) mask_ =3D (mask);                         \
> > +        idx ? ((0x80 | (mask_ & 0xFF)) << 8 | 0x02) :        \
> > +              ((0x00 | (mask_ & 0xFF)) << 8 | 0x02); })
> > +
> > +#define NCT6694_CAN_EVENT_ERR                BIT(0)
> > +#define NCT6694_CAN_EVENT_STATUS     BIT(1)
> > +#define NCT6694_CAN_EVENT_TX_EVT     BIT(2)
> > +#define NCT6694_CAN_EVENT_RX_EVT     BIT(3)
> > +#define NCT6694_CAN_EVENT_REC                BIT(4)
> > +#define NCT6694_CAN_EVENT_TEC                BIT(5)
> > +#define NCT6694_CAN_EVT_TX_FIFO_EMPTY        BIT(7)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_DATA_LOST BIT(5)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_HALF_FULL BIT(6)  /* Read-clear */
> > +#define NCT6694_CAN_EVT_RX_DATA_IN   BIT(7)
> > +
> > +/* Command 10h */
> > +#define NCT6694_CAN_CMD10_OFFSET(buf_cnt)    \
> > +     (((buf_cnt) & 0xFF) << 8 | 0x10)
> > +#define NCT6694_CAN_TAG_CAN0         0xC0
> > +#define NCT6694_CAN_TAG_CAN1         0xC1
> > +#define NCT6694_CAN_FLAG_EFF         BIT(0)
> > +#define NCT6694_CAN_FLAG_RTR         BIT(1)
> > +#define NCT6694_CAN_FLAG_FD          BIT(2)
> > +#define NCT6694_CAN_FLAG_BRS         BIT(3)
> > +#define NCT6694_CAN_FLAG_ERR         BIT(4)
> > +
> > +/* Command 11h */
> > +#define NCT6694_CAN_CMD11_OFFSET(idx, buf_cnt)                       \
> > +     ({ typeof(buf_cnt) buf_cnt_ =3D (buf_cnt);                \
> > +        idx ? ((0x80 | (buf_cnt_ & 0xFF)) << 8 | 0x11) :     \
> > +              ((0x00 | (buf_cnt_ & 0xFF)) << 8 | 0x11); })

Simplify this. Do something like:

  #define NCT6694_CAN_CMD11_OFFSET(idx, buf_cnt) \
          (idx ? 0x80 : 0x00) | \
          (buf_cnt & 0xFF)) << 8 | 0x11) \

(apply this also to NCT6694_CAN_CMD2_OFFSET())

> > +#define NCT6694_CAN_RX_QUOTA         64
> > +
> > +enum nct6694_event_err {
> > +     NCT6694_CAN_EVT_NO_ERROR,
>                       ^^^ add _ERR_
> > +     NCT6694_CAN_EVT_CRC_ERROR,
> > +     NCT6694_CAN_EVT_STUFF_ERROR,
> > +     NCT6694_CAN_EVT_ACK_ERROR,
> > +     NCT6694_CAN_EVT_FORM_ERROR,
> > +     NCT6694_CAN_EVT_BIT_ERROR,
> > +     NCT6694_CAN_EVT_TIMEOUT_ERROR,
> > +     NCT6694_CAN_EVT_UNKNOWN_ERROR,
> > +};
> > +
> > +enum nct6694_event_status {
> > +     NCT6694_CAN_EVT_ERROR_ACTIVE,
>                       ^^^ add _STATUS_
> > +     NCT6694_CAN_EVT_ERROR_PASSIVE,
> > +     NCT6694_CAN_EVT_BUS_OFF,
> > +     NCT6694_CAN_EVT_WARNING,
> > +};
> > +
> > +struct __packed nct6694_can_setting {
> > +     __le32 nbr;
> > +     __le32 dbr;
> > +     u8 active;
> > +     u8 reserved[3];
> > +     __le16 ctrl1;
> > +     __le16 ctrl2;
> > +     __le32 nbtp;
> > +     __le32 dbtp;
> > +};
> > +
> > +struct __packed nct6694_can_information {
> > +     u8 tx_fifo_cnt;
> > +     u8 rx_fifo_cnt;
> > +     __le16 reserved;
> u8 reserved[2];
> > +     __le32 can_clk;
> > +};
> > +
> > +struct __packed nct6694_can_event {
> > +     u8 err1;
> > +     u8 status1;
> > +     u8 tx_evt1;
> > +     u8 rx_evt1;
> > +     u8 rec1;
> > +     u8 tec1;
> > +     u8 reserved1[2];
> > +     u8 err2;
> > +     u8 status2;
> > +     u8 tx_evt2;
> > +     u8 rx_evt2;
> > +     u8 rec2;
> > +     u8 tec2;
> > +     u8 reserved2[2];
> > +};
>
> Create an extra struct that only describes a channel
>
> struct __packed nct6694_can_event_channel {
>         u8 err;
>         u8 status;
>         u8 tx_evt;
>         u8 rx_evt;
>         u8 rec;
>         u8 tec;
>         u8 reserved[2];
> }
>
> and put an array of 2 into struct __packed nct6694_can_event.
>
> > +
> > +struct __packed nct6694_can_xmit {

Is this struct for both TX and RX? If so, name it something like

  struct nct6694_can_frame

The term xmit is only used for transmission, not for reception.

> > +     u8 tag;
> > +     u8 flag;
> > +     u8 reserved;
> > +     u8 dlc;
> > +     __le32 id;
> > +     u8 data[64];
> > +     u8 msg_buf[72];
>
> Why is the message so long? What's in the msg_buf?
>
> > +};
> > +
> > +struct nct6694_can_priv {
> > +     struct can_priv can;    /* must be the first member */
> > +     struct net_device *ndev;
> > +     struct nct6694 *nct6694;
> > +     struct mutex lock;
>
> What does lock protect?

+1

mutexes are good if you want to keep the lock for a long time.

For short period, spinlock are more performant:

          spinlock_t lock;

> > +     struct sk_buff *tx_skb;
> > +     struct workqueue_struct *wq;
> > +     struct work_struct tx_work;
> > +     unsigned char *tx_buf;
> void *
> > +     unsigned char *rx_buf;
> void *

Rather than void*, tx_buf and rx_buf can be replaced by an union:

  union nct6694_can_rx {
          struct nct6694_can_event event;
          struct nct6694_can_xmit xmit;
          struct nct6694_can_information info;
  };

(same for nct6694_can_tx)

Then in struct nct6694_can_priv, you will just have:

  union nct6694_can_tx tx;
  union nct6694_can_rx rx;

With this,

  NCT6694_MAX_PACKET_SZ

can most likely be replaced by sizeof(union nct6694_can_rx) or
sizeof(union nct6694_can_tx).

> > +     unsigned char can_idx;
> > +     bool tx_busy;
>
> IMHO it makes no sense to have tx_skb and tx_busy
>
> > +};
> > +
> > +static const struct can_bittiming_const nct6694_can_bittiming_nominal_=
const =3D {
> > +     .name =3D DRVNAME,
> > +     .tseg1_min =3D 2,
> > +     .tseg1_max =3D 256,
> > +     .tseg2_min =3D 2,
> > +     .tseg2_max =3D 128,
> > +     .sjw_max =3D 128,
> > +     .brp_min =3D 1,
> > +     .brp_max =3D 511,
> > +     .brp_inc =3D 1,
> > +};
> > +
> > +static const struct can_bittiming_const nct6694_can_bittiming_data_con=
st =3D {
> > +     .name =3D DRVNAME,
> > +     .tseg1_min =3D 1,
> > +     .tseg1_max =3D 32,
> > +     .tseg2_min =3D 1,
> > +     .tseg2_max =3D 16,
> > +     .sjw_max =3D 16,
> > +     .brp_min =3D 1,
> > +     .brp_max =3D 31,
> > +     .brp_inc =3D 1,
> > +};
> > +
> > +static void nct6694_can_clean(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     if (priv->tx_skb || priv->tx_busy)
> > +             ndev->stats.tx_errors++;
> > +     dev_kfree_skb(priv->tx_skb);
> > +     if (priv->tx_busy)
> > +             can_free_echo_skb(priv->ndev, 0, NULL);
> > +     priv->tx_skb =3D NULL;
> > +     priv->tx_busy =3D false;
> > +}
> > +
> > +static int nct6694_can_get_berr_counter(const struct net_device *ndev,
> > +                                     struct can_berr_counter *bec)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D (struct nct6694_can_event *)pri=
v->rx_buf;
> > +     u8 mask =3D NCT6694_CAN_EVENT_REC | NCT6694_CAN_EVENT_TEC;
> > +     int ret;
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                            NCT6694_CAN_CMD2_OFFSET(priv->can_idx, mas=
k),
> > +                            sizeof(struct nct6694_can_event),
> > +                            evt);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     bec->rxerr =3D priv->can_idx ? evt->rec2 : evt->rec1;
> > +     bec->txerr =3D priv->can_idx ? evt->tec2 : evt->tec1;
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_handle_lost_msg(struct net_device *ndev)
> > +{
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct sk_buff *skb;
> > +     struct can_frame *frame;
> > +
> > +     netdev_err(ndev, "RX FIFO overflow, message(s) lost.\n");
> > +
> > +     stats->rx_errors++;
> > +     stats->rx_over_errors++;
> > +
> > +     skb =3D alloc_can_err_skb(ndev, &frame);
> > +     if (unlikely(!skb))
> > +             return 0;
> > +
> > +     frame->can_id |=3D CAN_ERR_CRTL;
> > +     frame->data[1] =3D CAN_ERR_CRTL_RX_OVERFLOW;
> > +
> > +     netif_receive_skb(skb);
> > +
> > +     return 1;
> > +}
> > +
> > +static void nct6694_can_read_fifo(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)priv=
->rx_buf;
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct canfd_frame *cf;
> > +     struct sk_buff *skb;
> > +     int can_idx =3D priv->can_idx;
> > +     u32 id;
> > +     int ret;
> > +     u8 fd_format =3D 0;
> bool - no need to init
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                            NCT6694_CAN_CMD11_OFFSET(can_idx, 1),
> > +                            sizeof(struct nct6694_can_xmit), xmit);
> > +     if (ret < 0)
> > +             return;
> > +
> > +     /* Check type of frame and create skb */
> > +     fd_format =3D xmit->flag & NCT6694_CAN_FLAG_FD;
> > +     if (fd_format)
> > +             skb =3D alloc_canfd_skb(ndev, &cf);
> > +     else
> > +             skb =3D alloc_can_skb(ndev, (struct can_frame **)&cf);
> > +
> > +     if (!skb) {
> > +             stats->rx_dropped++;
> > +             return;
> > +     }
> > +
> > +     cf->len =3D xmit->dlc;
>
> what does xmit->dlc contain? The DLC or the length?

+1

Also, do not trust the device data. Even if SPI attacks are less
common, make sure to sanitize this length.

  cf->len =3D canfd_sanitize_len(xmit->dlc);

Or

  cf->len =3D canfd_sanitize_len(xmit->dlc);

if xmit->dlc is in fact a DLC.

> > +
> > +     /* Get ID and set flag by its type(Standard ID format or Ext ID f=
ormat) */
> > +     id =3D le32_to_cpu(xmit->id);
> > +     if (xmit->flag & NCT6694_CAN_FLAG_EFF) {
> > +             /*
> > +              * In case the Extended ID frame is received, the standar=
d
> > +              * and extended part of the ID are swapped in the registe=
r,
> > +              * so swap them back to obtain the correct ID.
> > +              */
>
> You comment doesn't match the code.
>
> > +             id |=3D CAN_EFF_FLAG;
> > +     }
> > +
> > +     cf->can_id =3D id;
> > +
> > +     /* Set ESI flag */
> > +     if (xmit->flag & NCT6694_CAN_FLAG_ERR) {
> > +             cf->flags |=3D CANFD_ESI;
> > +             netdev_dbg(ndev, "ESI Error\n");
> > +     }
> > +
> > +     /* Set RTR and BRS */
> > +     if (!fd_format && (xmit->flag & NCT6694_CAN_FLAG_RTR)) {
> > +             cf->can_id |=3D CAN_RTR_FLAG;
> > +     } else {
> > +             if (xmit->flag & NCT6694_CAN_FLAG_BRS)
> > +                     cf->flags |=3D CANFD_BRS;
> > +
> > +             memcpy(cf->data, xmit->data, cf->len);
> > +
> > +             stats->rx_bytes +=3D cf->len;
> > +     }
> > +
> > +     stats->rx_packets++;
> > +
> > +     netif_receive_skb(skb);
> > +}
> > +
> > +static int nct6694_can_do_rx_poll(struct net_device *ndev, int quota)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D (struct nct6694_can_event *)pri=
v->rx_buf;
> > +     int can_idx =3D priv->can_idx;
> > +     u32 pkts =3D 0;
> > +     u8 mask_rx =3D NCT6694_CAN_EVENT_RX_EVT;
> > +     u8 rx_evt;
> > +
> > +     for (;;) {
> > +             scoped_guard(mutex, &priv->lock) {
> > +                     nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                                      NCT6694_CAN_CMD2_OFFSET(can_idx,=
 mask_rx),
> > +                                      sizeof(struct nct6694_can_event)=
, evt);
> > +
> > +                     rx_evt =3D can_idx ? evt->rx_evt2 : evt->rx_evt1;
> > +             }
> > +
> > +             if (rx_evt & NCT6694_CAN_EVT_RX_DATA_LOST)
> > +                     nct6694_can_handle_lost_msg(ndev);
> > +
> > +             /* No data */
> > +             if ((rx_evt & NCT6694_CAN_EVT_RX_DATA_IN) =3D=3D 0)
> > +                     break;
> > +
> > +             if (quota <=3D 0)
> > +                     break;
> > +
> > +             nct6694_can_read_fifo(ndev);
> > +             quota--;
> > +             pkts++;
> > +     }
> > +
> > +     return pkts;
> > +}
> > +
> > +static int nct6694_can_handle_lec_err(struct net_device *ndev, u8 bus_=
err)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +
> > +     if (bus_err =3D=3D NCT6694_CAN_EVT_NO_ERROR)
> > +             return 0;
> > +
> > +     priv->can.can_stats.bus_error++;
> > +     stats->rx_errors++;
> > +
> > +     /* Propagate the error condition to the CAN stack. */
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +
> > +     if (unlikely(!skb))
> > +             return 0;

Do not exit if the memory allocation fails. Instead, do the error
handling to increase the statistics.

Look at what other CAN drivers are doing.

> > +     /* Read the error counter register and check for new errors. */
> > +     cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
> > +
> > +     switch (bus_err) {
> > +     case NCT6694_CAN_EVT_CRC_ERROR:
> > +             cf->data[3] =3D CAN_ERR_PROT_LOC_CRC_SEQ;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_STUFF_ERROR:
> > +             cf->data[2] |=3D CAN_ERR_PROT_STUFF;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_ACK_ERROR:
> > +             cf->data[3] =3D CAN_ERR_PROT_LOC_ACK;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_FORM_ERROR:
> > +             cf->data[2] |=3D CAN_ERR_PROT_FORM;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_BIT_ERROR:
> > +             cf->data[2] |=3D CAN_ERR_PROT_BIT |
> > +                            CAN_ERR_PROT_BIT0 |
> > +                            CAN_ERR_PROT_BIT1;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_TIMEOUT_ERROR:
> > +             cf->data[2] |=3D CAN_ERR_PROT_UNSPEC;
> > +             break;
> > +
> > +     case NCT6694_CAN_EVT_UNKNOWN_ERROR:
> > +             cf->data[2] |=3D CAN_ERR_PROT_UNSPEC;
> > +             /*
> > +              * It means 'unspecified'(the value is '0').
> > +              * But it is not sure if it's ok to send an error package
> > +              * without specific error bit.
> > +              */
> > +             break;
> > +
> > +     default:
> > +             break;
> > +     }
> > +
> > +     /* Reset the error counter, ack the IRQ and re-enable the counter=
. */
> > +     stats->rx_packets++;
> > +     stats->rx_bytes +=3D cf->can_dlc;

The CAN error frames are not regular packets. Do not increase the RX
stats. Instead, increase the error stats.

> > +     netif_receive_skb(skb);
> > +
> > +     return 1;
> > +}
> > +
> > +static int nct6694_can_handle_state_change(struct net_device *ndev,
> > +                                        enum can_state new_state)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +     struct can_frame *cf;
> > +     struct sk_buff *skb;
> > +     struct can_berr_counter bec;
> > +
> > +     switch (new_state) {
> > +     case CAN_STATE_ERROR_ACTIVE:
> > +             priv->can.can_stats.error_warning++;
> > +             priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +             break;
> > +     case CAN_STATE_ERROR_WARNING:
> > +             priv->can.can_stats.error_warning++;
> > +             priv->can.state =3D CAN_STATE_ERROR_WARNING;
> > +             break;
> > +     case CAN_STATE_ERROR_PASSIVE:
> > +             priv->can.can_stats.error_passive++;
> > +             priv->can.state =3D CAN_STATE_ERROR_PASSIVE;
> > +             break;
> > +     case CAN_STATE_BUS_OFF:
> > +             priv->can.state =3D CAN_STATE_BUS_OFF;
> > +             priv->can.can_stats.bus_off++;
> > +             can_bus_off(ndev);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     /* propagate the error condition to the CAN stack */
> > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > +     if (unlikely(!skb))
> > +             return 0;

Same as above: handle the statistics even if the allocation fails.

> > +     nct6694_can_get_berr_counter(ndev, &bec);
> > +
> > +     switch (new_state) {
> > +     case CAN_STATE_ERROR_WARNING:
> > +             /* error warning state */
> > +             cf->can_id |=3D CAN_ERR_CRTL;
> > +             cf->data[1] =3D (bec.txerr > bec.rxerr) ? CAN_ERR_CRTL_TX=
_WARNING :
> > +                                                     CAN_ERR_CRTL_RX_W=
ARNING;

Prefer an if/else here instead of the ternary operator. It is more readable=
.

> > +             cf->data[6] =3D bec.txerr;
> > +             cf->data[7] =3D bec.rxerr;
> > +             break;
> > +     case CAN_STATE_ERROR_PASSIVE:
> > +             /* error passive state */
> > +             cf->can_id |=3D CAN_ERR_CRTL;
> > +             cf->data[1] |=3D CAN_ERR_CRTL_RX_PASSIVE;
> > +             if (bec.txerr > 127)
> > +                     cf->data[1] |=3D CAN_ERR_CRTL_TX_PASSIVE;
> > +             cf->data[6] =3D bec.txerr;
> > +             cf->data[7] =3D bec.rxerr;
> > +             break;
> > +     case CAN_STATE_BUS_OFF:
> > +             /* bus-off state */
> > +             cf->can_id |=3D CAN_ERR_BUSOFF;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     stats->rx_packets++;
> > +     stats->rx_bytes +=3D cf->can_dlc;

Do not increase the RX stats when you receive a CAN event.

> > +     netif_receive_skb(skb);
> > +
> > +     return 1;
> > +}
> > +
> > +static int nct6694_can_handle_state_errors(struct net_device *ndev,
> > +                                        unsigned char can_status)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     int work_done =3D 0;
> > +
> > +     if (can_status =3D=3D NCT6694_CAN_EVT_ERROR_ACTIVE &&
> > +         priv->can.state !=3D CAN_STATE_ERROR_ACTIVE) {
> > +             netdev_dbg(ndev, "Error, entered active state\n");
> > +             work_done +=3D nct6694_can_handle_state_change(ndev,
> > +                                                          CAN_STATE_ER=
ROR_ACTIVE);
> > +     }
> > +
> > +     if (can_status =3D=3D NCT6694_CAN_EVT_WARNING &&
> > +         priv->can.state !=3D CAN_STATE_ERROR_WARNING) {
> > +             netdev_dbg(ndev, "Error, entered warning state\n");
> > +             work_done +=3D nct6694_can_handle_state_change(ndev,
> > +                                                          CAN_STATE_ER=
ROR_WARNING);
> > +     }
> > +
> > +     if (can_status =3D=3D NCT6694_CAN_EVT_ERROR_PASSIVE &&
> > +         priv->can.state !=3D CAN_STATE_ERROR_PASSIVE) {
> > +             netdev_dbg(ndev, "Error, entered passive state\n");
> > +             work_done +=3D nct6694_can_handle_state_change(ndev,
> > +                                                          CAN_STATE_ER=
ROR_PASSIVE);
> > +     }
> > +
> > +     if (can_status =3D=3D NCT6694_CAN_EVT_BUS_OFF &&
> > +         priv->can.state !=3D CAN_STATE_BUS_OFF) {
> > +             netdev_dbg(ndev, "Error, entered bus-off state\n");
> > +             work_done +=3D nct6694_can_handle_state_change(ndev,
> > +                                                          CAN_STATE_BU=
S_OFF);
> > +     }
> > +
> > +     return work_done;
> > +}
> > +
> > +static int nct6694_can_poll(struct net_device *ndev, int quota)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D (struct nct6694_can_event *)pri=
v->rx_buf;
> > +     int can_idx =3D priv->can_idx;
> > +     int work_done =3D 0, ret;
> > +     u8 evt_mask =3D NCT6694_CAN_EVENT_ERR | NCT6694_CAN_EVENT_STATUS;
> > +     u8 bus_err, can_status;
> > +
> > +     scoped_guard(mutex, &priv->lock) {
> > +             ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                                    NCT6694_CAN_CMD2_OFFSET(can_idx, e=
vt_mask),
> > +                                    sizeof(struct nct6694_can_event), =
evt);
> > +             if (ret < 0)
> > +                     return IRQ_NONE;
>
> propagate the error
>
> > +
> > +             if (can_idx) {
> > +                     bus_err =3D evt->err2;
> > +                     can_status =3D evt->status2;
> > +             } else {
> > +                     bus_err =3D evt->err1;
> > +                     can_status =3D evt->status1;
> > +             }
> > +     }
> > +
> > +     /* Handle bus state changes */
> > +     work_done +=3D nct6694_can_handle_state_errors(ndev, can_status);
> > +
> > +     /* Handle lec errors on the bus */
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
> > +             work_done +=3D nct6694_can_handle_lec_err(ndev, bus_err);
> > +
> > +     /* Handle RX events */
> > +     work_done +=3D nct6694_can_do_rx_poll(ndev, quota - work_done);
> > +     return work_done;
> > +}
> > +
> > +static void nct6694_can_tx_irq(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct net_device_stats *stats =3D &ndev->stats;
> > +
> > +     guard(mutex)(&priv->lock);
> > +     stats->tx_bytes +=3D can_get_echo_skb(ndev, 0, NULL);
> > +     stats->tx_packets++;
> > +     priv->tx_busy =3D false;
> > +     netif_wake_queue(ndev);
> > +}
> > +
> > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > +{
> > +     struct net_device *ndev =3D data;
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_event *evt =3D (struct nct6694_can_event *)pri=
v->rx_buf;
> > +     int can_idx =3D priv->can_idx;
> > +     int ret;
> > +     u8 mask_sts =3D NCT6694_CAN_EVENT_TX_EVT;
> > +     u8 tx_evt;
> > +
> > +     scoped_guard(mutex, &priv->lock) {
> > +             ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                                    NCT6694_CAN_CMD2_OFFSET(can_idx, m=
ask_sts),
> > +                                    sizeof(struct nct6694_can_event), =
evt);
> > +             if (ret < 0)
> > +                     return IRQ_NONE;
> > +
> > +             tx_evt =3D can_idx ? evt->tx_evt2 : evt->tx_evt1;
> > +     }
> > +
> > +     if (tx_evt) {
> > +             nct6694_can_tx_irq(ndev);
> > +     } else {
> > +             ret =3D nct6694_can_poll(ndev, NCT6694_CAN_RX_QUOTA);
> > +             if (!ret)
> > +                     return IRQ_NONE;
> > +     }
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int nct6694_can_start(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_setting *setting =3D (struct nct6694_can_setti=
ng *)priv->tx_buf;
> > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > +     int ret;
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     memset(priv->tx_buf, 0, sizeof(struct nct6694_can_setting));

When you memset(), use this pattern:

          memset(setting, 0, sizeof(*setting));

Apply this throughout your driver.

> > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_CTRL1_MON);
> > +
> > +     if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
> > +         priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_CTRL1_NISO);
> > +
> > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CAN_CTRL1_LBCK);
> > +
> > +     ret =3D nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                             NCT6694_CAN_CMD0_OFFSET(priv->can_idx),
> > +                             sizeof(struct nct6694_can_setting), setti=
ng);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     priv->can.state =3D CAN_STATE_ERROR_ACTIVE;
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_stop(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     netif_stop_queue(ndev);
> > +     free_irq(ndev->irq, ndev);
> > +     destroy_workqueue(priv->wq);
> > +     priv->wq =3D NULL;
> > +     nct6694_can_clean(ndev);
> > +     priv->can.state =3D CAN_STATE_STOPPED;
> > +     close_candev(ndev);
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_set_mode(struct net_device *ndev, enum can_mode=
 mode)
> > +{
> > +     switch (mode) {
> > +     case CAN_MODE_START:
> > +             nct6694_can_clean(ndev);
> > +             nct6694_can_start(ndev);
> > +             netif_wake_queue(ndev);
> > +             break;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct6694_can_open(struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     int ret;
> > +
> > +     ret =3D open_candev(ndev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D request_threaded_irq(ndev->irq, NULL,
> > +                                nct6694_can_irq, IRQF_ONESHOT,
> > +                                "nct6694_can", ndev);
> > +     if (ret) {
> > +             netdev_err(ndev, "Failed to request IRQ\n");
> > +             goto close_candev;
> > +     }
> > +
> > +     priv->wq =3D alloc_ordered_workqueue("%s-nct6694_wq",
> > +                                        WQ_FREEZABLE | WQ_MEM_RECLAIM,
> > +                                        ndev->name);
> > +     if (!priv->wq) {
> > +             ret =3D -ENOMEM;
> > +             goto free_irq;
> > +     }
> > +
> > +     priv->tx_skb =3D NULL;
> > +     priv->tx_busy =3D false;
> > +
> > +     ret =3D nct6694_can_start(ndev);
> > +     if (ret)
> > +             goto destroy_wq;
> > +
> > +     netif_start_queue(ndev);
> > +
> > +     return 0;
> > +
> > +destroy_wq:
> > +     destroy_workqueue(priv->wq);
> > +free_irq:
> > +     free_irq(ndev->irq, ndev);
> > +close_candev:
> > +     close_candev(ndev);
> > +     return ret;
> > +}
> > +
> > +static netdev_tx_t nct6694_can_start_xmit(struct sk_buff *skb,
> > +                                       struct net_device *ndev)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +     if (priv->tx_skb || priv->tx_busy) {
> > +             netdev_err(ndev, "hard_xmit called while tx busy\n");
> > +             return NETDEV_TX_BUSY;
> > +     }
> > +
> > +     if (can_dev_dropped_skb(ndev, skb))
> > +             return NETDEV_TX_OK;
>
> please drop first
>
> > +
> > +     netif_stop_queue(ndev);
> > +     priv->tx_skb =3D skb;
> > +     queue_work(priv->wq, &priv->tx_work);
> > +
> > +     return NETDEV_TX_OK;
> > +}
> > +
> > +static void nct6694_can_tx(struct net_device *ndev, struct canfd_frame=
 *cf)
> > +{
> > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +     struct nct6694_can_xmit *xmit =3D (struct nct6694_can_xmit *)priv=
->tx_buf;
> > +     u32 txid =3D 0;
> > +
> > +     memset(xmit, 0, sizeof(struct nct6694_can_xmit));
> > +
> > +     if (priv->can_idx =3D=3D 0)
> > +             xmit->tag =3D NCT6694_CAN_TAG_CAN0<;
> > +     else
> > +             xmit->tag =3D NCT6694_CAN_TAG_CAN1;
> > +
> > +     if (cf->can_id & CAN_EFF_FLAG) {
> > +             txid =3D cf->can_id & CAN_EFF_MASK;
> > +             /*
> > +              * In case the Extended ID frame is transmitted, the
> > +              * standard and extended part of the ID are swapped
> > +              * in the register, so swap them back to send the
> > +              * correct ID.
>
> You comment doesn't match the code.
>
> > +              */
> > +             xmit->flag |=3D NCT6694_CAN_FLAG_EFF;
> > +     } else {
> > +             txid =3D cf->can_id & CAN_SFF_MASK;
> > +     }
> > +
> > +     xmit->id =3D cpu_to_le32(txid);
> > +     xmit->dlc =3D cf->len;
> > +
> > +     if ((priv->can.ctrlmode & CAN_CTRLMODE_FD) &&
>
> No need to check ctrlmode
>
> > +         can_is_canfd_skb(priv->tx_skb)) {
> > +             xmit->flag |=3D NCT6694_CAN_FLAG_FD;
> > +             if (cf->flags & CANFD_BRS)
> > +                     xmit->flag |=3D NCT6694_CAN_FLAG_BRS;
> > +     }
> > +
> > +     if (cf->can_id & CAN_RTR_FLAG)
> > +             xmit->flag |=3D NCT6694_CAN_FLAG_RTR;
>
> you can move this into the !can_is_canfd_skb branch of the if
>
> > +
> > +     memcpy(xmit->data, cf->data, cf->len);
> > +
> > +     nct6694_write_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                       NCT6694_CAN_CMD10_OFFSET(1),
> > +                       sizeof(struct nct6694_can_xmit),
> > +                       xmit);
> > +}
> > +
> > +static void nct6694_can_tx_work(struct work_struct *work)
> > +{
> > +     struct nct6694_can_priv *priv =3D container_of(work,
> > +                                                  struct nct6694_can_p=
riv,
> > +                                                  tx_work);
> > +     struct net_device *ndev =3D priv->ndev;
> > +     struct canfd_frame *cf;
> > +
> > +     guard(mutex)(&priv->lock);
> > +
> > +     if (priv->tx_skb) {
> > +             if (priv->can.state =3D=3D CAN_STATE_BUS_OFF) {
> > +                     nct6694_can_clean(ndev);
> > +             } else {
> > +                     cf =3D (struct canfd_frame *)priv->tx_skb->data;
> > +                     nct6694_can_tx(ndev, cf);
> > +                     priv->tx_busy =3D true;
> > +                     can_put_echo_skb(priv->tx_skb, ndev, 0, 0);
> > +                     priv->tx_skb =3D NULL;
> > +             }
> > +     }
> > +}
> > +
> > +static const struct net_device_ops nct6694_can_netdev_ops =3D {
> > +     .ndo_open =3D nct6694_can_open,
> > +     .ndo_stop =3D nct6694_can_stop,
> > +     .ndo_start_xmit =3D nct6694_can_start_xmit,
> > +     .ndo_change_mtu =3D can_change_mtu,
> > +};
> > +
> > +static const struct ethtool_ops nct6694_can_ethtool_ops =3D {
> > +     .get_ts_info =3D ethtool_op_get_ts_info,
> > +};
> > +
> > +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> > +{
> > +     struct nct6694_can_information *info =3D (struct nct6694_can_info=
rmation *)priv->rx_buf;
> > +     int ret;
> > +
> > +     ret =3D nct6694_read_msg(priv->nct6694, NCT6694_CAN_MOD,
> > +                            NCT6694_CAN_CMD1_OFFSET,
> > +                            sizeof(struct nct6694_can_information),
> > +                            info);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return le32_to_cpu(info->can_clk);
> > +}
> > +
> > +static int nct6694_can_probe(struct platform_device *pdev)
> > +{
> > +     const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_can_priv *priv;
> > +     struct net_device *ndev;
> > +     int ret, irq, can_clk;
> > +
> > +     irq =3D irq_create_mapping(nct6694->domain,
> > +                              NCT6694_IRQ_CAN1 + cell->id);
> > +     if (!irq)
> > +             return -EINVAL;
>
> propagate error value
>
> > +
> > +     ndev =3D alloc_candev(sizeof(struct nct6694_can_priv), 1);
> > +     if (!ndev)
> > +             return -ENOMEM;
> > +
> > +     ndev->irq =3D irq;
> > +     ndev->flags |=3D IFF_ECHO;
> > +     ndev->netdev_ops =3D &nct6694_can_netdev_ops;
> > +     ndev->ethtool_ops =3D &nct6694_can_ethtool_ops;
> > +
> > +     priv =3D netdev_priv(ndev);
> > +     priv->nct6694 =3D nct6694;
> > +     priv->ndev =3D ndev;
> > +
> > +     priv->tx_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> > +                                 sizeof(unsigned char), GFP_KERNEL);
>
> devm_kzalloc()
> > +     if (!priv->tx_buf) {
> > +             ret =3D -ENOMEM;
> > +             goto free_candev;
> > +     }
> > +
> > +     priv->rx_buf =3D devm_kcalloc(&pdev->dev, NCT6694_MAX_PACKET_SZ,
> > +                                 sizeof(unsigned char), GFP_KERNEL);
> devm_kzalloc()
>
> > +     if (!priv->rx_buf) {
> > +             ret =3D -ENOMEM;
> > +             goto free_candev;
> > +     }
> > +
> > +     can_clk =3D nct6694_can_get_clock(priv);
> > +     if (can_clk < 0) {
> > +             ret =3D -EIO;
>
> propagate the error value, don't overwrite it
>
> move the dev_err_probe() here.
>
> > +             goto free_candev;
> > +     }
> > +
> > +     mutex_init(&priv->lock);
> > +     INIT_WORK(&priv->tx_work, nct6694_can_tx_work);
> > +
> > +     priv->can_idx =3D cell->id;
> > +     priv->can.state =3D CAN_STATE_STOPPED;
> > +     priv->can.clock.freq =3D can_clk;
> > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_cons=
t;
> > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming_data_co=
nst;
> > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counter;
> > +
> > +     priv->can.ctrlmode =3D CAN_CTRLMODE_FD;
> > +
> > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK           =
 |
> > +                                    CAN_CTRLMODE_LISTENONLY          |
> > +                                    CAN_CTRLMODE_FD                  |
> > +                                    CAN_CTRLMODE_FD_NON_ISO          |
> > +                                    CAN_CTRLMODE_BERR_REPORTING;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +     SET_NETDEV_DEV(priv->ndev, &pdev->dev);
> > +
> > +     ret =3D register_candev(priv->ndev);
> > +     if (ret)
> > +             goto free_candev;
> > +
> > +     return 0;
> > +
> > +free_candev:
> > +     free_candev(ndev);
> > +     return dev_err_probe(&pdev->dev, ret, "Probe failed\n");
>
> Move the dev_err_probe() with an appropriate error message to where the
> error occurs. If malloc fails, the kernel already prints for you, so
> here it's only nct6694_can_get_clock() only.
>
> > +}
> > +
> > +static void nct6694_can_remove(struct platform_device *pdev)
> > +{
> > +     struct nct6694_can_priv *priv =3D platform_get_drvdata(pdev);
> > +
> > +     cancel_work_sync(&priv->tx_work);
> > +     unregister_candev(priv->ndev);
> > +     free_candev(priv->ndev);
> > +}
> > +
> > +static struct platform_driver nct6694_can_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D DRVNAME,
> > +     },
> > +     .probe          =3D nct6694_can_probe,
> > +     .remove         =3D nct6694_can_remove,
> > +};
> > +
> > +module_platform_driver(nct6694_can_driver);
> > +
> > +MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("platform:nct6694-can");


Yours sincerely,
Vincent Mailhol

