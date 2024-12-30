Return-Path: <linux-i2c+bounces-8818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1D9FE351
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 08:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6B1188238B
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 07:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB86619F49F;
	Mon, 30 Dec 2024 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tXsxrocw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-72.smtpout.orange.fr [193.252.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EC15B99E;
	Mon, 30 Dec 2024 07:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735544115; cv=none; b=n9QuJNM8AQkn6yHKFH3vjyt7qcViHd7eYHis3YoIsA1WT1zN209FB0PazVrMydXLoWLES0arYKLpM4Y05he3hn80YKQ88kPuWb21Kknx25jr0/y8SwY9oWQ40sHAyIy2LwqyckIXE1YEz2i0ivZr/FNrBH9G59p3pdbVP6cqisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735544115; c=relaxed/simple;
	bh=EsPHsJlnM9Dp3TxVYK/FBB3CX1RQjJ+GuiS8X2Tsi2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/qk+M6e4Tidlw4SPiONEFBlFMgkNbCoQKgMGxIx4VrbQy3x6E9uvImBt4c0s6Wm56nsQQQm7SYTcBQ/yY1UXrkxf2KGICsLp5llAba1rVSqoxPqVLLIYuQW9VgZzO+rsokJ02IR6A1YfGcgDKAsHifKTEAnSjbqeG/bosjRHp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=tXsxrocw; arc=none smtp.client-ip=193.252.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id SAHYtYPoNXLq1SAHdtcmQ8; Mon, 30 Dec 2024 08:34:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735544042;
	bh=VEyfH/JEAYVF3BrV81XXT2vuoUN9T4Udc6Ff5Lo1nJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=tXsxrocwc/006lfFpghXxEiUsXPJ6W7R8U5B86iw+UXRFvk2Q7hMC6yafHJwNlkIl
	 ZO81l98+Cbrg8k3C3f6YTqWS8A0+HL+8blAiEMK1bKyM8UEnMHCe4VYr0xk6IdBFds
	 QxwNImIqUaS+M9vmgDUcvOpokLE4W4rvc6glyQrBShx0fhHadJwXjiNR+JxPnpEKM3
	 MK6v9lpaVEJDo1Iy2ReBe3ywK56fzkpoiB/YkTidIuy4Z3WNXiXDVyoYhQhRU7blpw
	 TuCSijLPhmVvfkwSBi8bc9xSWKy3EZu99zeQsZH6iSHpGRG6NQ9CkFxQK04hWRCpVw
	 7ggJPwK/zWXkA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Dec 2024 08:34:02 +0100
X-ME-IP: 124.33.176.97
Message-ID: <d52fbacd-cd07-4ccd-9a46-9e8ca650fc26@wanadoo.fr>
Date: Mon, 30 Dec 2024 16:33:43 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, tmyu0@nuvoton.com,
 lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net,
 jdelvare@suse.com, alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-2-a0282524688@gmail.com>
 <b1c5b18d-efe1-41f8-9825-2a3e090c47f5@wanadoo.fr>
 <CAOoeyxU5nM4BZhgqcRxVHVVDxzLFzVS0+z7Yi_YGpvWc87mAbQ@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
In-Reply-To: <CAOoeyxU5nM4BZhgqcRxVHVVDxzLFzVS0+z7Yi_YGpvWc87mAbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/12/2024 at 15:32, Ming Yu wrote:
> Dear Vincent,
> 
> Thank you for your comments,
> 
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2024年12月27日 週五 下午11:34寫道：

(...)

>>>  obj-$(CONFIG_MFD_MC13XXX)    += mc13xxx-core.o
>>>  obj-$(CONFIG_MFD_MC13XXX_SPI)        += mc13xxx-spi.o
>>>  obj-$(CONFIG_MFD_MC13XXX_I2C)        += mc13xxx-i2c.o
>>> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
>>> new file mode 100644
>>> index 000000000000..0f31489ef9fa
>>> --- /dev/null
>>> +++ b/drivers/mfd/nct6694.c
>>
>> If I understand correctly, your device is an USB device, so shouldn't it
>> be under
>>
>>   drivers/usb/mfd/nct6694.c
>>
>> ?
> 
> I understand, but there is no drivers/usb/mfd/ directory, I believe my
> device is similar to dln2.c and viperboard.c, which is why I placed it
> under drivers/mfd/

Well, at the end, this is not my tree. Maybe I am saying something silly
here? I am fine to defer this problem to the more relevant people. If
the maintainers from the linux-usb mailing list are happy like you did,
then so am I.

>> At the moment, I see no USB maintainers in CC (this is why I added
>> linux-usb myself). By putting it in the correct folder, the
>> get_maintainers.pl will give you the correct list of persons to put in copy.
>>
> 
> Okay, I will add CC to linux-usb from now on.

Ack.

>> The same comment applies to the other modules. For example, I would
>> expect to see the CAN module under:
>>
>>   drivers/net/can/usb/nct6694_canfd.c
>>
> 
> Understood! I will move the can driver to drivers/net/can/usb/ in v5.

Ack.

(...)

>>> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
>>> +                  u16 length, void *buf)
>>> +{
>>> +     union nct6694_usb_msg *msg = nct6694->usb_msg;
>>> +     int tx_len, rx_len, ret;
>>> +
>>> +     guard(mutex)(&nct6694->access_lock);
>>> +
>>> +     memset(msg, 0, sizeof(*msg));
>>> +
>>> +     /* Send command packet to USB device */
>>> +     msg->cmd_header.mod = mod;
>>> +     msg->cmd_header.cmd = offset & 0xFF;
>>> +     msg->cmd_header.sel = (offset >> 8) & 0xFF;
>>
>> In the other modules, you have some macros to combine together the cmd
>> and the sel (selector, I guess?). For example from nct6694_canfd.c:
>>
>>   #define NCT6694_CAN_DELIVER(buf_cnt)  \
>>         ((((buf_cnt) & 0xFF) << 8) | 0x10)      /* CMD|SEL */
>>
>> And here, you split them again. So what was the point to combine those
>> together in the first place?
>>
> 
> Due to these two bytes may used to OFFSET in report channel for other
> modules(gpio, hwmon), I will modify them below...
> 
>> Can't you just pass both the cmd and the sel as two separate argument?
>> Those cmd and sel concatenation macros are too confusing.
>>
>> Also, if you are worried of having too many arguments in
>> nct6694_read_msg(), you may just directly pass a pointer to a struct
>> nct6694_cmd_header instead of all the arguments separately.
>>
> 
> ...
> in mfd/nct6694.c
> inline struct nct6694_cmd_header nct6694_init_cmd(u8 mod, u8 cmd, u8 sel,
>                                                   u16 offset, u16 length)
> {
>         struct nct6694_cmd_header header;
> 
>         header.mod = mod;
>         header.cmd = cmd;
>         header.sel = sel;
>         header.offset = cpu_to_le16(offset);

I am not sure how this is supposed to work. If the both the offset and
the cmd/sel pair occupies the same slot in memory, then the offset would
just overwrite what you just put in the cmd and sel fields.

>         header.len = cpu_to_le16(length);
> 
>         return header;
> }
> EXPORT_SYMBOL(nct6694_init_cmd);
> 
> int nct6694_read_msg(struct nct6694 *nct6694, struct nct6694_cmd_header *header,
>                      void *buf)
> {
>         union nct6694_usb_msg *msg = nct6694->usb_msg;
>         ...
>         msg->cmd_header.mod = header->mod;
>         msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
>         msg->cmd_header.len = header->len;
>         if (msg->cmd_header.mod == 0xFF) {
>                 msg->cmd_header.offset = header->offset;
>         } else {
>                 msg->cmd_header.cmd = header->cmd;
>                 msg->cmd_header.sel = header->sel;
>         }
>         ...
> }
> (also apply to nct6694_write_msg)
> 
> in other drivers, for example: gpio-nct6694.c
>         struct nct6694_cmd_header cmd;
>         int ret;
> 
>         guard(mutex)(&data->lock);
> 
>         cmd = nct6694_init_cmd(NCT6694_GPIO_MOD, 0, 0,
>                                NCT6694_GPO_DIR + data->group,
>                                sizeof(data->reg_val));
> 
>         ret = nct6694_read_msg(data->nct6694, &cmd, &data->reg_val);
>         if (ret < 0)
>                 return ret;
> 
> Do you think this approach would be better?

If the two bytes may be used separately or in combination, then I think
it is better to describe this in your structure. Something like this:

  struct nct6694_cmd_header {
  	u8 rsv1;
  	u8 mod;
  	union {
  		__le16 offset;
  		struct {
  			u8 cmd;
  			u8 sel;
  		}; __packed
  	} __packed;
  	u8 hctrl;
  	u8 rsv2;
  	__le16 len;
  } __packed;

Then, your prototype becomes:

  int nct6694_read_msg(struct nct6694 *nct6694,
  		       struct nct6694_cmd_header *cmd_hd,
  		       void *buf)

If the caller needs to pass an offset:

  void foo(struct nct6694 *nct6694, u8 mod, u16 offset, u16 length)
  {
  	struct nct6694_cmd_header cmd_hd = { 0 };

  	cmd_hd.mod = mod;
  	cmd_hd.offset = cpu_to_le16(offset);
  	cmd_hd.len = cpu_to_le16(length);

  	nct6694_read_msg(nct6694, &cmd_hd, NULL);
  }

If the caller needs to pass a cmd and sel pair:

  void foo(struct nct6694 *nct6694, u8 mod, u8 cmd, u8 sel, u16 length)
  {
  	struct nct6694_cmd_header cmd_hd = { 0 };

  	cmd_hd.mod = mod;
  	cmd_hd.cmd = cmd;
  	cmd_hd.sel = sel;
  	cmd_hd.len = cpu_to_le16(length);

  	nct6694_read_msg(nct6694, &cmd_hd, NULL);
  }

This way, no more cmd and sel concatenation/deconcatenation and no
conditional if/else logic.

cmd_hd.hctrl (and other similar fields which are common to everyone) may
be set in nct6694_read_msg().

(...)


Yours sincerely,
Vincent Mailhol


