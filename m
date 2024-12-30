Return-Path: <linux-i2c+bounces-8820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7579D9FE4EE
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 10:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18A351882A14
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 09:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B8A1A2C27;
	Mon, 30 Dec 2024 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="n+u5XGI1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-72.smtpout.orange.fr [193.252.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A645B1A08A4;
	Mon, 30 Dec 2024 09:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735551582; cv=none; b=usCcNp8PZgK+l+4nouymgMrcirzCdpAz7dtrPp/ZPVRpXjejatNDAd4mtc1l9PMd8JHqEFEM3ciW2UJX/IXLcTkZArACzW+1dffBWHEFaWpVo2Upzu+u9vwX51Po540nomuVpLnvVdlihgXApDDhwKe49Lu5jO2xGwo8RUbF89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735551582; c=relaxed/simple;
	bh=qFLzivAgo+gv5KhYxSbQTxD1GJWG3Jz2bPq+FffWXSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OU449J6/mMIzvU23uSI1QIhvCxKuprZB3gJ82NlSvGIzGnJXtDsb1zI9ixg+BgivC5e8p2Ixtmi7nnBPr8vBy1RTh+fIATEEtsOCiUbupH/czwzLnl2yhcTgFhf98vTUC6f5PoASEhmASlYBdizDAKgah2YthoESzGGvpjbGkZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=n+u5XGI1; arc=none smtp.client-ip=193.252.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id SCDxtg4BsC9fHSCE1tX54Z; Mon, 30 Dec 2024 10:38:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735551506;
	bh=E5G7KokFX82282RicoYhoIWj26f913hNI71JtzbbktQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=n+u5XGI1uI5xs+f6C50AVQMEdfGtSjuUgMWY6t2lj8Osx327J9WxOlOAzu4QWQCPZ
	 ovpezTaTEjfXlaldwcrmGiG6EP2T/fEQ2KHRoFr8abxMfMXEzVQSn4+RJDiVVydYRV
	 vkdNbYzR4r/mLvQ36MvwdU1EPkjsFWUOCTsH9nL6++OxZuIWwTbh4ehpRYHOEARuQb
	 NChdEvk1cs6EMcG0A9sldAEZIkwo49dHyNeXovdF0wqZW0hMA9qLrCCrYtZM6Tn34l
	 RS3Rr9DjAQ13P4QXkRVUNYtt8h0fHcD07m7ehRa5yJOQpQVOoGEQma6PVBgA+zPTY+
	 fYrEpQylNtpnA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Dec 2024 10:38:26 +0100
X-ME-IP: 124.33.176.97
Message-ID: <994bc47c-7d9e-4519-be30-cab5be4f7bb4@wanadoo.fr>
Date: Mon, 30 Dec 2024 18:38:08 +0900
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
 <d52fbacd-cd07-4ccd-9a46-9e8ca650fc26@wanadoo.fr>
 <CAOoeyxXOa-JK1-wRn0hsD1nuTOLs-5NBv5-YswOSS1JJbGmU_A@mail.gmail.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
In-Reply-To: <CAOoeyxXOa-JK1-wRn0hsD1nuTOLs-5NBv5-YswOSS1JJbGmU_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/12/2024 at 17:47, Ming Yu wrote:
> Vincent Mailhol <mailhol.vincent@wanadoo.fr> 於 2024年12月30日 週一 下午3:34寫道：

(...)

>> If the two bytes may be used separately or in combination, then I think
>> it is better to describe this in your structure. Something like this:
>>
>>   struct nct6694_cmd_header {
>>         u8 rsv1;
>>         u8 mod;
>>         union {
>>                 __le16 offset;
>>                 struct {
>>                         u8 cmd;
>>                         u8 sel;
>>                 }; __packed
>>         } __packed;
>>         u8 hctrl;
>>         u8 rsv2;
>>         __le16 len;
>>   } __packed;
>>
> 
> Sorry for forgetting to list the structure in last mail, but the
> revised structure is same as yours.
> 
>> Then, your prototype becomes:
>>
>>   int nct6694_read_msg(struct nct6694 *nct6694,
>>                        struct nct6694_cmd_header *cmd_hd,
>>                        void *buf)
>>
>> If the caller needs to pass an offset:
>>
>>   void foo(struct nct6694 *nct6694, u8 mod, u16 offset, u16 length)
>>   {
>>         struct nct6694_cmd_header cmd_hd = { 0 };
>>
>>         cmd_hd.mod = mod;
>>         cmd_hd.offset = cpu_to_le16(offset);
>>         cmd_hd.len = cpu_to_le16(length);
>>
>>         nct6694_read_msg(nct6694, &cmd_hd, NULL);
>>   }
>>
>> If the caller needs to pass a cmd and sel pair:
>>
>>   void foo(struct nct6694 *nct6694, u8 mod, u8 cmd, u8 sel, u16 length)
>>   {
>>         struct nct6694_cmd_header cmd_hd = { 0 };
>>
>>         cmd_hd.mod = mod;
>>         cmd_hd.cmd = cmd;
>>         cmd_hd.sel = sel;
>>         cmd_hd.len = cpu_to_le16(length);
>>
>>         nct6694_read_msg(nct6694, &cmd_hd, NULL);
>>   }
>>
>> This way, no more cmd and sel concatenation/deconcatenation and no
>> conditional if/else logic.
>>
>> cmd_hd.hctrl (and other similar fields which are common to everyone) may
>> be set in nct6694_read_msg().
>>
> 
> Understood, that means I need to export these four function, right?
>   - int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u8 cmd,
>                          u8 sel, u16 length, void *buf);
>   - int nct6694_read_rpt(struct nct6694 *nct6694, u8 mod, u16 offset,
>                          u16 length, void *buf);
>   - int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u8 cmd,
>                           u8 sel, u16 length, void *buf);
>   - int nct6694_write_rpt(struct nct6694 *nct6694, u8 mod, u16 offset,
>                           u16 length, void *buf);
> 
> Both nct6694_read_msg() and nct6694_read_rpt() call
> nct6694_read(struct nct6694 *nct6694, struct nct6694_cmd_header
> cmd_hd, void *buf),
> then nct6694_write_msg() and nct6694_write_rpt() call
> nct6694_write(struct nct6694 *nct6694, struct nct6694_cmd_header
> cmd_hd, void *buf).
> (nct6694_read/nct6694_write is origin nct6694_read_msg/nct6694_write_msg)

I was more thinking of exposing:

  int nct6694_read_msg(struct nct6694 *nct6694,
  		       struct nct6694_cmd_header *cmd_hd,
  		       void *buf);

and:

  int nct6694_write_msg(struct nct6694 *nct6694,
  			struct nct6694_cmd_header *cmd_hd,
  			void *buf);

and then the different modules fill the cmd_hd argument themselves and
directly call one of those two functions with no intermediaries.

But your solution is also acceptable. The core issue is the artificial
packing and depacking of the cmd and sel pair. As long as this core
issue is resolved and as long as the ugly concatenation macro can be
removed, I think it is OK. Choose the approach you prefer :)


Yours sincerely,
Vincent Mailhol

