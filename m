Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E5E36BE09
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Apr 2021 05:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhD0Dwq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Apr 2021 23:52:46 -0400
Received: from regular1.263xmail.com ([211.150.70.198]:58494 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhD0Dwq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Apr 2021 23:52:46 -0400
X-Greylist: delayed 386 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Apr 2021 23:52:44 EDT
Received: from localhost (unknown [192.168.167.172])
        by regular1.263xmail.com (Postfix) with ESMTP id C28E3821;
        Tue, 27 Apr 2021 11:45:06 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P18449T140669945366272S1619495102882982_;
        Tue, 27 Apr 2021 11:45:04 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <22259d9076cbe0cb39d4db175022df51>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-watchdog@vger.kernel.org
X-RCPT-COUNT: 29
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH v2 6/7] arm64: dts: rockchip: add core dtsi for RK3568 SoC
To:     Johan Jonker <jbx6244@gmail.com>, cl@rock-chips.com,
        heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org
References: <20210425094216.25724-1-cl@rock-chips.com>
 <20210425094439.25895-1-cl@rock-chips.com>
 <3d584cdc-020e-5aae-cae3-59ef45e64a9f@gmail.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <c2e96d99-3af5-3f22-78de-f6eff18b9c24@rock-chips.com>
Date:   Tue, 27 Apr 2021 11:45:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3d584cdc-020e-5aae-cae3-59ef45e64a9f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Johan, Heiko,

On 2021/4/26 下午8:16, Johan Jonker wrote:
> ===
>
> compatible = "rockchip,rk3568";
> Maybe add this together with other rkXXXX SoCs to rockchip.yaml on top
> of board list ???
> Please advise.
This rockchip.yaml is now describe boards without any sort, it would be 
better to refactor and sort in two level:
- soc level
- board level base on the same soc.

This will need a separate patch to do the clean up, maybe goes after the 
rk3568.dtsi?


Thanks,
- Kever


