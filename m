Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C91368A28
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 03:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240002AbhDWBD3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Apr 2021 21:03:29 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:49234 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240007AbhDWBD3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Apr 2021 21:03:29 -0400
Received: from localhost (unknown [192.168.167.223])
        by lucky1.263xmail.com (Postfix) with ESMTP id 4DBABD1973;
        Fri, 23 Apr 2021 09:02:41 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from [172.16.12.120] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P22004T139994620753664S1619139755396305_;
        Fri, 23 Apr 2021 09:02:40 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a423a9ca8790f90aefedb609e5c1ae5d>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-RCPT-COUNT: 26
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v1 4/5] arm64: dts: rockchip: add core dtsi for RK3568 SoC
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        cl@rock-chips.com
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com
References: <20210421065921.23917-1-cl@rock-chips.com>
 <20210421065921.23917-5-cl@rock-chips.com> <11131098.F0gNSz5aLb@diego>
 <7d1f197d868ae84a8bc475f1f48178d2737518c1.camel@collabora.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <1e0cb95e-e040-d34b-6443-ae93668962ec@rock-chips.com>
Date:   Fri, 23 Apr 2021 09:02:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d1f197d868ae84a8bc475f1f48178d2737518c1.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiko, Ezequiel,

On 2021/4/23 上午1:23, Ezequiel Garcia wrote:
> Hi Liang,
>
> I'm very impressed Rockchip is pushing patches so early, thanks a lot!
>
> See below.
>
> On Wed, 2021-04-21 at 11:13 +0200, Heiko Stübner wrote:
>> Hi Liang,
>>
>> Am Mittwoch, 21. April 2021, 08:59:20 CEST schrieb cl@rock-chips.com:
>>> From: Liang Chen <cl@rock-chips.com>
>>>
>>> RK3568 is a high-performance and low power quad-core application processor
>>> designed for personal mobile internet device and AIoT equipments.
>>>
>>> This patch add basic core dtsi file for it.
>>>
>>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>> this is a first round of basic stuff :-) .
>>
>> First of all, I really like the move of moving the pretty standardized
>> pinconfig entries to the rockchip-pinconf.dtsi .
>>
>> (1) But please move this into a separate patch to make that more visible
>> and maybe even convert _some_ or all arm64 Rockchip socs to use that
>> as well
>>
>> "arm64: dts: rockchip: add generic pinconfig settings used by most Rockchip socs
>>
>> The pinconfig settings for Rockchip SoCs are pretty similar on all socs,
>> so move them to a shared dtsi to be included, instead of redefining them
>> for each soc"
>>
>> (2) I also like the external rk3568-pinctrl approach with the dtsi getting
>> auto-generated. This will probably help us in keeping pinctrl settings
>> synchronous between mainline and the vendor kernel.
>>
>> (3) From my basic understanding the rk3568 is basically a rk3566 + more
>> peripherals, so ideally they would share the basic ones in a rk3566.dtsi
>> which the rk3568.dtsi then could include and extend with its additional
>> peripherals.
>>
>> With at least the pine64 boards being based on the rk3566, there probably
>> will be quite a mainline use of it as well.
>>
>> Or is there something that would prevent this?
>>
> I agree with having a rk3566.dtsi, and rk3568.dtsi on top, instead of the
> other way around. We have some RK3566 boards here, so we can surely test
> the RK3566.dtsi patches very quickly.
We consider rk3568 as a full implementation and rk3566 is a subset, all 
the dts compatible string for
driver should go with string 'rk3568', and rk3568 will be the long term 
version and definitely have more
boards  in next few years. So we would like to upstream rk3568 first and 
follow the implement mode
of PX30+RK3326, which can also cover the need by RK3566.

We can have a rk3566.dtsi like rk3326.dtsi.


Thanks,
- Kever
>
> Also, it's fine if you want to send v2 with just these minimal peripherals.
> However, I think you could include GMAC and TS-ADC:
>
> https://lore.kernel.org/linux-rockchip/31c2e531-96d0-a1c1-644c-28c60eb40cf4@gmail.com/T/#t
> https://lore.kernel.org/linux-rockchip/20210421203409.40717-1-ezequiel@collabora.com/T/#t
>
> These should work right out of the box!
>
> Thanks!
> Ezequiel
>
>
>


