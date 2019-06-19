Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C3B4B2F2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2019 09:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbfFSHQ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jun 2019 03:16:56 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45799 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfFSHQ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jun 2019 03:16:56 -0400
Received: from [192.168.178.24] ([109.104.35.35]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDhpZ-1hndqq3XeB-00Aqff; Wed, 19 Jun 2019 09:16:39 +0200
Subject: Re: [PATCH v4] i2c: bcm2835: Model Divider in CCF
To:     Annaliese McDermond <nh6z@nh6z.net>, eric@anholt.net,
        f.fainelli@gmail.com, wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
References: <20190529042912.12956-1-nh6z@nh6z.net>
 <20190608171443.14484-1-nh6z@nh6z.net>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <cd25e228-c3e1-2a01-14e3-fe9a5198c78d@i2se.com>
Date:   Wed, 19 Jun 2019 09:16:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608171443.14484-1-nh6z@nh6z.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:t5ZOohhSSX0jU+TsmVmjcDsOLs7rTGgiDvh/JevsxG5BOISztkr
 WT9BabKNkNIua4M1kjmmSwUyNOhJZlnBqD1lyOAnc10Kropsm0BNTme1oE6WzguvifWfqcX
 5dmFbaW4Qkk5q3aUFeE4Uufdekw7jwl/o+tzvqw38wx7a0XZHm6hQLfcGeQtNc/c+iyEUtJ
 ZWGvLnP61Aqf/J3cuGFdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vk5iRPIkUNM=:K4GWXYq0TIVs6/NoSsCMdR
 I6dXjRNcHmMstU8CXaV/T9Ao6+zA3dAKirttW4ToGAXfqM87quua5OXD1kdNMa0pPYu7FcMLG
 5uqgS6N2yLMh1bkw0D06ZiyHmfmVBHc/1lhG5mRN5zDkaadAPmO2u6yo6OJv5ISXXDht5cZvt
 r9FZPek/PlTwZgXCEIlXLPWSS8/uteWUZq29wHAo9VkR+VMFpuc7PCjPogxd/7tXeKszuQ3mV
 RrU9omXAoQoqHr7D83R6/1Yjyzd0S0W18G/yaaegv+zbxCgOJgmGiJs5gRInXLgaCfVt0Hr62
 uTq9QawJYPar2fdkrSROtFdV++HBtHnhfY+l9flRcQeaQj7FYGfxjwHEECyavsYX9HnvDwbAo
 E3Oy9WE2c/xYsTf7Kohsp00DQW/q5WYYenYOg57DDB11UfN1Kwh6PJ7Pfx20wrlRlfe6BhkHo
 Xt45rtEZ7rlkdg6WJ+SUkPiVWZGfR6h4bhqIYHVLZHH56CVZsHKJ7y+zk5x1BWwZ1GcTDw/o4
 xV7L7ZSVcCe87ldCNq+5DbKD9xXY4NzRjc9n//j/uZhOmqLQ50u3m7YQKz3srpQCpLSAXjDVK
 yEFP6cbWPtf1o1lB5NmyivUFlOH8LFnSyvTRaH7/jk2JGB0UeZwlUMaZwst1lf99FxxoN8UvI
 SJOJtIOzgEq65drtUJaWUo9PLUYYjq9FS8hi7+DLh7BSC9JCELsgVe47wUiqMyvL7homvzdjw
 8fj+C2sBLSqtRDA2ka7EQ99yYXup5OSEJ3UY9MFWxIM6Mqi1gTMShTPRs6g=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Annaliese,

On 08.06.19 19:14, Annaliese McDermond wrote:
> Model the I2C bus clock divider as a part of the Core Clock Framework.
> Primarily this removes the clk_get_rate() call from each transfer.
> This call causes problems for slave drivers that themselves have
> internal clock components that are controlled by an I2C interface.
> When the slave's internal clock component is prepared, the prepare
> lock is obtained, and it makes calls to the I2C subsystem to
> command the hardware to activate the clock.  In order to perform
> the I2C transfer, this driver sets the divider, which requires
> it to get the parent clock rate, which it does with clk_get_rate().
> Unfortunately, this function will try to take the clock prepare
> lock, which is already held by the slave's internal clock calls
> creating a deadlock.
>
> Modeling the divider in the CCF natively removes this dependency
> and the divider value is only set upon changing the bus clock
> frequency or changes in the parent clock that cascade down to this
> divisor.  This obviates the need to set the divider with every
> transfer and avoids the deadlock described above.  It also should
> provide better clock debugging and save a few cycles on each
> transfer due to not having to recalcuate the divider value.
>
i've seen reports [1], [2] that this commit causes trouble.

Could you please look into them?

Thanks

[1] - https://www.raspberrypi.org/forums/viewtopic.php?f=44&t=242856
[2] - https://archlinuxarm.org/forum/viewtopic.php?f=23&t=13719

