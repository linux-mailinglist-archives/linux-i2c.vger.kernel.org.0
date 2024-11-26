Return-Path: <linux-i2c+bounces-8222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CC9D9363
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 09:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18FB2843A3
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 08:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE4517C219;
	Tue, 26 Nov 2024 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R08/ZDeh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58C14A85;
	Tue, 26 Nov 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732610154; cv=none; b=o9Bv5/KmjdT60YOdui4qrSFCiRbBcZgIYQQCySTswdMgRVA+2zVv5Q4oYwWW5vgWZgKXkmrSk2DoZ5ZoKjVFmqesPxcVRvM0zpjOkq+B75cFbHW620a96K1Dwh1p7YxjWcT04f5ckTE3qjqMB69AT7eBo+4sVY4jzWMlbcUBBbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732610154; c=relaxed/simple;
	bh=7S1plKA0YLYu7rVD7bUxMnxmQ4Vs5n++Nr2aDQN/FMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2ABWSqtKEJD6c9oIhbPWli9tkTmedG84OKSesLONl/S/f7716Dh2ApyhNX6NBIjjbmZVDsZAewmdkXRXSJd1DAYP/ZVpTWBGfzsPTi2j27CBFtO6SKF7oyx+TdhWrPbIHyKJOnOJO/LNXrCupYhxRqPwDPJIPJ5lR+XZqM1kDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R08/ZDeh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77F946BE;
	Tue, 26 Nov 2024 09:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732610128;
	bh=7S1plKA0YLYu7rVD7bUxMnxmQ4Vs5n++Nr2aDQN/FMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R08/ZDehn/hG72Pvm3vGVfg/HBY/rhqU8eVXg/zZ549RcqwHp4teQ7LXKOmnTjIdf
	 F6tqTQXjTmm7koaezCcl8TvcD1Hf0/BRQ+KrsWvKRwJ0SEWh/E6S+KF0RydPWSirW+
	 eFZsQxaeusGwLieqL2SEH8vVWT3e5nGUtTKdtMZc=
Message-ID: <b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
Date: Tue, 26 Nov 2024 10:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
 <20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
 <20241126091610.05e2d7c7@booty>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241126091610.05e2d7c7@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 26/11/2024 10:16, Luca Ceresoli wrote:
> Hello Tomi,
> 
> On Fri, 22 Nov 2024 14:26:19 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> From: Cosmin Tanislav <demonsingur@gmail.com>
>>
>> i2c-atr translates the i2c transactions and forwards them to its parent
>> i2c bus. Any transaction to an i2c address that has not been mapped on
>> the i2c-atr will be rejected with an error.
>>
>> However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
>> gets a transaction to an i2c address that is not mapped in the parent
>> i2c-atr, and thus fails.
> 
> Nested ATRs are "interesting", to say the least! :-)
> 
> I must say I don't understand the problem here. If this is the picture:
> 
>    adapter ---->     ATR1     ---->     ATR2     ----> leaf device
>                      map:               map:              addr:
>                   alias addr         alias addr           0x10
>                   0x30  0x20         0x20  0x10
> 
> Then I'd expect this:
> 
>   1. the leaf device asks ATR2 for a transaction to 0x10
>   2. 0x10 is in ATR2 map, ATR2 translates address 0x10 to 0x20
>   3. ATR2 asks ATR1 for a transaction to 0x20
>   4. 0x20 is in ATR1 map, ATR1 translates address 0x20 to 0x30
>   5. ATR1 asks adapter for transaction on 0x30
> 
> So ATR1 is never asked for 0x10.

Yes, that case would work. But in your example the ATR1 somehow has 
created a mapping for ATR2's alias.

Generally speaking, ATR1 has aliases only for devices in its master bus 
(i.e. the i2c bus where the ATR1 is the master, not slave), and 
similarly for ATR2. Thus I think a more realistic example is:

     adapter ---->     ATR1     ---->     ATR2     ----> leaf device
                    addr: 0x50         addr: 0x30
                       map:               map:              addr:
                    alias addr         alias addr           0x10
                    0x40  0x30         0x20  0x10

So, both ATRs create the alias mapping based on the i2c-aliases given to 
them in the DT, for the slave devices in their i2c bus. Assumption is, 
of course, that the aliases are not otherwise used, and not overlapping.

Thus the aliases on ATR2 are not present in the alias table of ATR1.

  Tomi


