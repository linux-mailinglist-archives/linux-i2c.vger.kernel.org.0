Return-Path: <linux-i2c+bounces-684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09F80A2F8
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 13:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72FF1F213F0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 12:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220321C29C;
	Fri,  8 Dec 2023 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QMXTiAbp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9794A1986;
	Fri,  8 Dec 2023 04:17:33 -0800 (PST)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AD4F66073AA;
	Fri,  8 Dec 2023 12:17:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702037851;
	bh=jBMziga07aVp3bL6kAN2tx7XMOjaakjxVjC5JZZa2zs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QMXTiAbpKT36vzwizHSRDGx7XNQyAPt6w/AA54Xy/B00HQ5lEyJbi3oH5WbFENwAj
	 mp6E7V8KUVcD0k2oHA/jQHloJevjOuQsr/6h1+Ma45vVsQuaPnFXxgMFRpPDu9ZM4L
	 uv161qtyHHpYhG8xchf9YJv3Ea0nB4hulWGCxvgEVc4vriK+nq+5PBz3dXQK2k5Alp
	 T+cwyt1jmFv8D7LMUs2IQDB9B8L6WCziGQBlInTyFOHzNCIQyKv2JVOcP53SLYaCGT
	 JLERN18XqzjGChfGr26wqhIa9FvUmpXDr6AqV8OD7F7Y0FCzyA5yFjIxgSZZ/BxwCM
	 6c+S71rVWf+3g==
Message-ID: <94bf6180-8abf-777d-2dce-498efafb57c1@collabora.com>
Date: Fri, 8 Dec 2023 15:17:25 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] i2c: rk3x: fix potential spinlock recursion on poll
Content-Language: en-US
To: Jensen Huang <jensenhuang@friendlyarm.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Bara <bbara93@gmail.com>
References: <20231207082200.16388-1-jensenhuang@friendlyarm.com>
 <ebf6cf8ec3b5befd673d295061fa2738@manjaro.org>
 <CAMpZ1qHUnTDQ78gdrQF9Sx_-XfLM-B+H-0bL1-+twKsno+JOvg@mail.gmail.com>
 <5e11553952c02ad20591992be4284bbd@manjaro.org>
 <95cc7716-ba01-e239-e7c0-eba0b7da7955@collabora.com>
 <CAMpZ1qENxWsDnvke4jMvK9tYpta3dThHUHxjDWO-u2JV+8dZdQ@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMpZ1qENxWsDnvke4jMvK9tYpta3dThHUHxjDWO-u2JV+8dZdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/8/23 11:53, Jensen Huang wrote:
> On Fri, Dec 8, 2023 at 12:00 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 12/7/23 17:10, Dragan Simic wrote:
>>> On 2023-12-07 10:25, Jensen Huang wrote:
>>>> On Thu, Dec 7, 2023 at 4:37 PM Dragan Simic <dsimic@manjaro.org> wrote:
>>>>>
>>>>> On 2023-12-07 09:21, Jensen Huang wrote:
>>>>>> Possible deadlock scenario (on reboot):
>>>>>> rk3x_i2c_xfer_common(polling)
>>>>>>     -> rk3x_i2c_wait_xfer_poll()
>>>>>>         -> rk3x_i2c_irq(0, i2c);
>>>>>>             --> spin_lock(&i2c->lock);
>>>>>>             ...
>>>>>>         <rk3x i2c interrupt>
>>>>>>         -> rk3x_i2c_irq(0, i2c);
>>>>>>             --> spin_lock(&i2c->lock); (deadlock here)
>>>>>>
>>>>>> Store the IRQ number and disable/enable it around the polling
>>>>> transfer.
>>>>>> This patch has been tested on NanoPC-T4.
>>>>>
>>>>> In case you haven't already seen the related discussion linked below,
>>>>> please have a look.  I also added more people to the list of recipients,
>>>>> in an attempt to make everyone aware of the different approaches to
>>>>> solving this issue.
>>>>>
>>>>> https://lore.kernel.org/all/655177f4.050a0220.d85c9.3ba0@mx.google.com/T/#m6fc9c214452fec6681843e7f455978c35c6f6c8b
>>>>
>>>> Thank you for providing the information. I hadn't seen this link before.
>>>> After carefully looking into the related discussion, it appears that
>>>> Dmitry Osipenko is already working on a suitable patch. To avoid
>>>> duplication
>>>> or conflicts, my patch can be discarded.
>>>
>>> Thank you for responding so quickly.  Perhaps it would be best to hear
>>> from Dmitry as well, before discarding anything.  It's been a while
>>> since Dmitry wrote about working on the patch, so he might have
>>> abandoned it.
>>
>> This patch is okay. In general, will be better to have IRQ disabled by
>> default like I did in my variant, it should allow to remove the spinlock
>> entirely. Of course this also can be done later on in a follow up
>> patches. Jensen, feel free to use my variant of the patch, add my
>> s-o-b+co-developed tags to the commit msg if you'll do. Otherwise I'll
>> be able to send my patch next week.
> 
> Thank you for the suggestion. I've updated the patch to your variant, and
> as confirmed by others, reboots are functioning correctly. I measured the
> overhead of enable_irq/disable_irq() by calculating ktime in the
> updated version,
> and on rk3399, the minimum delta I observed was 291/875 ns. This extra
> cost may impact most interrupt-based transfers. Therefore, I personally lean
> towards the current v2 patch and handle the spinlock and irqsave/restore in
> a follow up patch. I'd like to hear everyone's thoughts on this.

Please don't use ktime for perf measurements, ktime itself is a slow API
and it should be 200us that ktime takes itself. Also, the 0.2us is
practically nothing, especially compared to I2C transfers measured in ms.

I'm fine with keeping your v2 variant for the bug fix if you prefer
that. Thanks for addressing the issue :)

-- 
Best regards,
Dmitry


