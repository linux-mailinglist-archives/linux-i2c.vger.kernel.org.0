Return-Path: <linux-i2c+bounces-8817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D09FE2F2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 07:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C0CF7A1138
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 06:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4C719E96A;
	Mon, 30 Dec 2024 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsvjOIAd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5C4D8CB;
	Mon, 30 Dec 2024 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735540337; cv=none; b=SbNxUMTs9IXE15GpgZLXgKzELyBgEomzZ1Y/ltHVvZWXJfxv6mohloFdGLegBaXbQ7xdKtQDlCp08dLOndsJ0q/qbGVd/2s8LjJQdqQfG4OEuSCwmEvQxgRRwTs2aCL6QkHz8aBvgZDAiIpkCbKbmmJ32cpeHz0uxxyX3EB+jcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735540337; c=relaxed/simple;
	bh=RitX9Nh9cfMwLdPyo4LCNYZqOQZ83WQxwZa6SPQA9TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGvTwQ3JePupu1h2vWzrU7SN7pdgL0Jfaq2FJ1nj0CoZcEDdU//r6yk3VDWZwt3OuaTUbBjpDWKayvXJuWS3yW7oigIbwSQaBmY1Dzdjj4mWx6eLZm3EbOpn72tvuBpve8quPPD2KVRaR3HgOxhdo3VYYOnZ5DKp5IISAIJc5p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsvjOIAd; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5447fae695so255683276.2;
        Sun, 29 Dec 2024 22:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735540334; x=1736145134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QRcSBQg8I7BtmckHoS9eb9xyFyWsim5IRUmO0mC3I4=;
        b=FsvjOIAd28ZWzePNe0RJ9uerKLR8slkIxCPYemA4cu2cLQVU2pnsBeGW3y0K74dil+
         M5MOHs91aYuPZMX3kG8Z5voohBmHbZiWIXL+hpufcIlBF0eLEk8pmKWJQ21upzf9MU/5
         PP1mbCV/JrSiPM508MOsEO0Eg7f+GNr/fAKitHfY8oY/CZG/vAdjw3cxiZQCHgyZoagp
         eENdYMieE4opQDOjogNcujJfT8h7VeKDRb4cRWDQ7wDXkL+UsIeBZboy/dGJ93Y4YGXe
         Azfi000CSab0hNW6pfFI0GeqHi6rFlMxsDq0xy2898/CSy/4UMnUoxeAgdQUFadnn228
         oxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735540334; x=1736145134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QRcSBQg8I7BtmckHoS9eb9xyFyWsim5IRUmO0mC3I4=;
        b=jE9CT46jicLvcEp2N4ADAcWRhJYpDvn8g8RVb4eOX/v/64a3h7bGC3l/6sSGR5f/ot
         lYYKfrTgHxckUIL5/NZrQsZZbkqujdbd0Q2brxD5ZNmfqOQdxLYivxrQ3jkccMf5CXZo
         Xtlx301HNOZDNAmUXWKl/tZ+CegdWAa9R7C6iWaFIKLQORmdgbI9ezn+IAfpwagCea0C
         LYh9dZxPqU7rIHZKwfSUEjl1KU67QcfS3tLhfY6bS7ZxZOuapqy+cJrCjIS1DNuzNsjg
         xjWmG9QNRhFvj84MCfYWKKjKgw1Nbd6fgeIj2kjXaWYv3haKgG8B7WKkETNs8ncL0Hye
         fJXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqsaTkzEJab4S1ONCXY7JJQ7x9zVH/wGiNvSKxN+lnYlAFp7ieC2q90n3MAPTj6MmxsjdgJKG3oSk=@vger.kernel.org, AJvYcCVZI7Yu0WMYqVo6AS5c4RUCnF/HeG4zLd4h5TXmJoGvSFWdjNbDbLijh78coUZaToo6G0c+P7lhhxgn3g==@vger.kernel.org, AJvYcCVmIDQjCUMjvFpeKhDR0ay5p9ih7OoiTLQNBAZMb+rm5NdEKhpT89wc/zF1Rmblv9QKpGR6VCGdMB4A@vger.kernel.org, AJvYcCWQfrwGgUbBZSmoTw9JDJN5etPLIQjiC7Nf0AGj0UMP99r5RbFsRITdjDu+YCmfTI7viV+yHYRKgCYX7FFbe/c=@vger.kernel.org, AJvYcCWXc3ILwa6z4qZyx7AoFjmZC9Ka6ZbFjbx1BbfPGWyEwqiSWi/ul0PV6arCtTslGXK308F5mzoY44Pm@vger.kernel.org, AJvYcCWa98RBzaiDt236Iq+8uCbNGa2ctGZmkKGcbHclAQglMrsGTDMy+QgIX24ktJiP6d4dCTSIscEFjbc8hEE=@vger.kernel.org, AJvYcCXKaD5tu+4YnkuJeUMQW4EgS3PPJZB4iLIh+iN6gL0xnomAs/6TIvIzApgK/u8GlqdXxcYUfI4v@vger.kernel.org, AJvYcCXuhWHCmK/lmg+mV0L8xqsN75xcuBN3P6tdM3Dc2mIwjl8dzRWYTVRTPmRW1cYrR3BkV4ouImrxgjTm@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZAnFbI3ITLRY3yT776hlZArA8N7gc8biZcjOok2gTRHtr9uO
	5Qifj8SWMpwdto6MNDLeQHxc3p6HhucAhjeeHdhsyCzgwS1dvICkeO3svnQbNMkBG6qJTQf60hl
	KPE+kvj5hIGZOEOn4dpiRH0zzqmU=
X-Gm-Gg: ASbGncshjvEdN4jS2jvhRDA9yzx1DsRrCsMTj0v8A4nv695EbPS3cp7t7aW5+hziV7T
	thGkqS6294KNJwzDLISFJBV1iu4KJrioaQWw=
X-Google-Smtp-Source: AGHT+IEQr0iE2o2BtzwtT1CY+Li/Yxy+Vc1CUh+F3a+bYgLb2KxN1xwqJeB4XvvbjpHOpB+hKyQE1NBbedh0J4XpNh4=
X-Received: by 2002:a05:690c:6a02:b0:6ef:7ac0:1aaf with SMTP id
 00721157ae682-6f3f822e5aamr257379467b3.40.1735540334143; Sun, 29 Dec 2024
 22:32:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-2-a0282524688@gmail.com> <b1c5b18d-efe1-41f8-9825-2a3e090c47f5@wanadoo.fr>
In-Reply-To: <b1c5b18d-efe1-41f8-9825-2a3e090c47f5@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 30 Dec 2024 14:32:03 +0800
Message-ID: <CAOoeyxU5nM4BZhgqcRxVHVVDxzLFzVS0+z7Yi_YGpvWc87mAbQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your comments,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B412=E6=
=9C=8827=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> +cc: linux-usb@vger.kernel.org
>
...
> > +config MFD_NCT6694
> > +     tristate "Nuvoton NCT6694 support"
> > +     select MFD_CORE
> > +     depends on USB
> > +     help
> > +       This adds support for Nuvoton USB device NCT6694 sharing periph=
erals
> > +       This includes the USB devcie driver and core APIs.
>                                 ^^^^^^
> device
>

Fix it in v5.

> > +       Additional drivers must be enabled in order to use the function=
ality
> > +       of the device.
> > +
> >  config MFD_HI6421_PMIC
> >       tristate "HiSilicon Hi6421 PMU/Codec IC"
> >       depends on OF
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index e057d6d6faef..9d0365ba6a26 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -117,6 +117,8 @@ obj-$(CONFIG_TWL6040_CORE)        +=3D twl6040.o
> >
> >  obj-$(CONFIG_MFD_MX25_TSADC) +=3D fsl-imx25-tsadc.o
> >
> > +obj-$(CONFIG_MFD_NCT6694)    +=3D nct6694.o
>
> Keep the alphabetic order. MFD_NCT6694 is after MFD_MC13XXX in the alphab=
et.
>

Fix it in v5.

> >  obj-$(CONFIG_MFD_MC13XXX)    +=3D mc13xxx-core.o
> >  obj-$(CONFIG_MFD_MC13XXX_SPI)        +=3D mc13xxx-spi.o
> >  obj-$(CONFIG_MFD_MC13XXX_I2C)        +=3D mc13xxx-i2c.o
> > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > new file mode 100644
> > index 000000000000..0f31489ef9fa
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694.c
>
> If I understand correctly, your device is an USB device, so shouldn't it
> be under
>
>   drivers/usb/mfd/nct6694.c
>
> ?

I understand, but there is no drivers/usb/mfd/ directory, I believe my
device is similar to dln2.c and viperboard.c, which is why I placed it
under drivers/mfd/

>
> At the moment, I see no USB maintainers in CC (this is why I added
> linux-usb myself). By putting it in the correct folder, the
> get_maintainers.pl will give you the correct list of persons to put in co=
py.
>

Okay, I will add CC to linux-usb from now on.

> The same comment applies to the other modules. For example, I would
> expect to see the CAN module under:
>
>   drivers/net/can/usb/nct6694_canfd.c
>

Understood! I will move the can driver to drivers/net/can/usb/ in v5.

...
> > +static int nct6694_response_err_handling(struct nct6694 *nct6694,
> > +                                      unsigned char err_status)
> > +{
> > +     struct device *dev =3D &nct6694->udev->dev;
> > +
> > +     switch (err_status) {
> > +     case NCT6694_NO_ERROR:
> > +             return err_status;
> > +     case NCT6694_NOT_SUPPORT_ERROR:
> > +             dev_dbg(dev, "%s: Command is not support!\n", __func__);
>
> Grammar: Command is not supported
>

Fix it in v5.

> > +             break;
> > +     case NCT6694_NO_RESPONSE_ERROR:
> > +             dev_dbg(dev, "%s: Command is no response!\n", __func__);
>
> Not sure what you meant here. Maybe: command didn't get a response? But
> then, I do not see the nuance with the timeout.
>

The firmware engine returns an error response.
If it returns NO_RESPONSE_ERROR, it means the target device did not
respond(e.g., I2C slave NACK).
If it returns TIMEOUT_ERROR, it means the engine process the command timed =
out.
I will add the comments to describe these error status in v5.

> > +             break;
> > +     case NCT6694_TIMEOUT_ERROR:
> > +             dev_dbg(dev, "%s: Command is timeout!\n", __func__);
>
> Grammar: Command timed out

Fix it in v5.

> > +             break;
> > +     case NCT6694_PENDING:
> > +             dev_dbg(dev, "%s: Command is pending!\n", __func__);
> > +             break;> +       default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return -EIO;
> > +}
> > +
> > +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> > +                  u16 length, void *buf)
> > +{
> > +     union nct6694_usb_msg *msg =3D nct6694->usb_msg;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
> > +
> > +     memset(msg, 0, sizeof(*msg));
> > +
> > +     /* Send command packet to USB device */
> > +     msg->cmd_header.mod =3D mod;
> > +     msg->cmd_header.cmd =3D offset & 0xFF;
> > +     msg->cmd_header.sel =3D (offset >> 8) & 0xFF;
>
> In the other modules, you have some macros to combine together the cmd
> and the sel (selector, I guess?). For example from nct6694_canfd.c:
>
>   #define NCT6694_CAN_DELIVER(buf_cnt)  \
>         ((((buf_cnt) & 0xFF) << 8) | 0x10)      /* CMD|SEL */
>
> And here, you split them again. So what was the point to combine those
> together in the first place?
>

Due to these two bytes may used to OFFSET in report channel for other
modules(gpio, hwmon), I will modify them below...

> Can't you just pass both the cmd and the sel as two separate argument?
> Those cmd and sel concatenation macros are too confusing.
>
> Also, if you are worried of having too many arguments in
> nct6694_read_msg(), you may just directly pass a pointer to a struct
> nct6694_cmd_header instead of all the arguments separately.
>

...
in mfd/nct6694.c
inline struct nct6694_cmd_header nct6694_init_cmd(u8 mod, u8 cmd, u8 sel,
                                                  u16 offset, u16 length)
{
        struct nct6694_cmd_header header;

        header.mod =3D mod;
        header.cmd =3D cmd;
        header.sel =3D sel;
        header.offset =3D cpu_to_le16(offset);
        header.len =3D cpu_to_le16(length);

        return header;
}
EXPORT_SYMBOL(nct6694_init_cmd);

int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *he=
ader,
                     void *buf)
{
        union nct6694_usb_msg *msg =3D nct6694->usb_msg;
        ...
        msg->cmd_header.mod =3D header->mod;
        msg->cmd_header.hctrl =3D NCT6694_HCTRL_GET;
        msg->cmd_header.len =3D header->len;
        if (msg->cmd_header.mod =3D=3D 0xFF) {
                msg->cmd_header.offset =3D header->offset;
        } else {
                msg->cmd_header.cmd =3D header->cmd;
                msg->cmd_header.sel =3D header->sel;
        }
        ...
}
(also apply to nct6694_write_msg)

in other drivers, for example: gpio-nct6694.c
        struct nct6694_cmd_header cmd;
        int ret;

        guard(mutex)(&data->lock);

        cmd =3D nct6694_init_cmd(NCT6694_GPIO_MOD, 0, 0,
                               NCT6694_GPO_DIR + data->group,
                               sizeof(data->reg_val));

        ret =3D nct6694_read_msg(data->nct6694, &cmd, &data->reg_val);
        if (ret < 0)
                return ret;

Do you think this approach would be better?

> > +     msg->cmd_header.hctrl =3D NCT6694_HCTRL_GET;
> > +     msg->cmd_header.len =3D cpu_to_le16(length);
> > +
...
> > +int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> > +                   u16 length, void *buf)
> > +{
> > +     union nct6694_usb_msg *msg =3D nct6694->usb_msg;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
> > +
> > +     memset(msg, 0, sizeof(*msg));
> > +
> > +     /* Send command packet to USB device */
> > +     msg->cmd_header.mod =3D mod;
> > +     msg->cmd_header.cmd =3D offset & 0xFF;
> > +     msg->cmd_header.sel =3D (offset >> 8) & 0xFF;
> > +     msg->cmd_header.hctrl =3D NCT6694_HCTRL_SET;
> > +     msg->cmd_header.len =3D cpu_to_le16(length);
> > +
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        &msg->cmd_header, sizeof(*msg), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Send data packet to USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        buf, length, &tx_len, nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        &msg->response_header, sizeof(*msg), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive data packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->=
timeout);
>
> What if the object size of buf is smaller than NCT6694_MAX_PACKET_SZ?
>

I will fix it to le16_to_cpu(header->len) in the v5.

> > +     if (ret)
> > +             return ret;
> > +
> > +     if (rx_len !=3D length) {
> > +             dev_dbg(&nct6694->udev->dev, "%s: Sent length is not matc=
h!\n",
> > +                     __func__);
> > +             return -EIO;
> > +     }
> > +
> > +     return nct6694_response_err_handling(nct6694, msg->response_heade=
r.sts);
> > +}
> > +EXPORT_SYMBOL(nct6694_write_msg);
> > +
> > +static void usb_int_callback(struct urb *urb)
> > +{
> > +     struct nct6694 *nct6694 =3D urb->context;
> > +     struct device *dev =3D &nct6694->udev->dev;
> > +     unsigned int *int_status =3D urb->transfer_buffer;
> > +     int ret;
> > +
> > +     switch (urb->status) {
> > +     case 0:
> > +             break;
> > +     case -ECONNRESET:
> > +     case -ENOENT:
> > +     case -ESHUTDOWN:
> > +             return;
> > +     default:
> > +             goto resubmit;
> > +     }
> > +
> > +     while (*int_status) {
> > +             int irq =3D __ffs(*int_status);
> > +
> > +             generic_handle_irq_safe(irq_find_mapping(nct6694->domain,=
 irq));
> > +             *int_status &=3D ~BIT(irq);
> > +     }
> > +
> > +resubmit:
> > +     ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> > +     if (ret)
> > +             dev_dbg(dev, "%s: Failed to resubmit urb, status %d",
> > +                     __func__, ret);
>
> Print the error mnemotecnic instead of the error code:
>
>         dev_dbg(dev, "%s: Failed to resubmit urb, status %pe",
>                 __func__, ERR_PTR(ret));
>
> (apply to other location where you print error).
>

Understood. Fix these in v5.

> > +}
> > +
...
> > + * nct6694_read_msg - Receive data from NCT6694 USB device
> > + *
> > + * @nct6694 - Nuvoton NCT6694 structure
> > + * @mod - Module byte
> > + * @offset - Offset byte or (Select byte | Command byte)
> > + * @length - Length byte
> > + * @buf - Read data from rx buffer
> > + *
> > + * USB Transaction format:
> > + *
> > + *   OUT     |RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
> > + *   OUT     |SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
> > + *   IN      |-------D------A------D------A-------|
> > + *   IN                      ......
> > + *   IN      |-------D------A------D------A-------|
>
> The structure already discribes this information pretty well. No need
> for this table.
>

Drop it in v5.

> > + */

Best regards,
Ming

