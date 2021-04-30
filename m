Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB36336F339
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 02:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhD3Asl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 20:48:41 -0400
Received: from regular1.263xmail.com ([211.150.70.205]:55754 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhD3Asl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 20:48:41 -0400
Received: from localhost (unknown [192.168.167.32])
        by regular1.263xmail.com (Postfix) with ESMTP id D75C7842;
        Fri, 30 Apr 2021 08:47:20 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.151] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P18569T140528335173376S1619743638185091_;
        Fri, 30 Apr 2021 08:47:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <901d6e6f973585aaf2c3c4ed15f8fbda>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: maz@kernel.org
X-RCPT-COUNT: 30
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Cc:     cl@rock-chips.com, heiko@sntech.de, jagan@amarulasolutions.com,
        wens@csie.org, uwe@kleine-koenig.org, mail@david-bauer.net,
        jbx6244@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v4_07/10=5d_dt-bindings=3a_soc=3a_rockchip?=
 =?UTF-8?B?OiBDb252ZXJ0IGdyZi50eHQgdG8gWUFNTOOAkOivt+azqOaEj++8jOmCruS7tg==?=
 =?UTF-8?B?55Sxcm9iaGVycmluZzJAZ21haWwuY29t5Luj5Y+R44CR?=
To:     Rob Herring <robh@kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081321.17855-1-cl@rock-chips.com>
 <20210429212413.GA1794356@robh.at.kernel.org>
From:   =?UTF-8?B?6ZmI5Lqu?= <cl@rock-chips.com>
Message-ID: <24118cb2-dc11-eef1-b0e3-26318c2615ab@rock-chips.com>
Date:   Fri, 30 Apr 2021 08:47:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210429212413.GA1794356@robh.at.kernel.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


ÔÚ 2021/4/30 ÉÏÎç5:24, Rob Herring Ð´µÀ:
> On Thu, Apr 29, 2021 at 04:13:21PM +0800, cl@rock-chips.com wrote:
>> From: Liang Chen <cl@rock-chips.com>
>>
>> Current dts files with 'grf' nodes are manually verified. In order to
>> automate this process grf.txt has to be converted to YAML.
>>
>> Add new descriptions for:
>> "rockchip,rk3568-grf", "syscon", "simple-mfd"
>> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
>>
>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>> ---
>>   .../devicetree/bindings/soc/rockchip/grf.txt  | 61 -------------------
>>   .../devicetree/bindings/soc/rockchip/grf.yaml | 60 ++++++++++++++++++
>>   2 files changed, 60 insertions(+), 61 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
>>   create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
>> deleted file mode 100644
>> index f96511aa3897..000000000000
>> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -* Rockchip General Register Files (GRF)
>> -
>> -The general register file will be used to do static set by software, which
>> -is composed of many registers for system control.
>> -
>> -From RK3368 SoCs, the GRF is divided into two sections,
>> -- GRF, used for general non-secure system,
>> -- SGRF, used for general secure system,
>> -- PMUGRF, used for always on system
>> -
>> -On RK3328 SoCs, the GRF adds a section for USB2PHYGRF,
>> -
>> -ON RK3308 SoC, the GRF is divided into four sections:
>> -- GRF, used for general non-secure system,
>> -- SGRF, used for general secure system,
>> -- DETECTGRF, used for audio codec system,
>> -- COREGRF, used for pvtm,
>> -
>> -Required Properties:
>> -
>> -- compatible: GRF should be one of the following:
>> -   - "rockchip,px30-grf", "syscon": for px30
>> -   - "rockchip,rk3036-grf", "syscon": for rk3036
>> -   - "rockchip,rk3066-grf", "syscon": for rk3066
>> -   - "rockchip,rk3188-grf", "syscon": for rk3188
>> -   - "rockchip,rk3228-grf", "syscon": for rk3228
>> -   - "rockchip,rk3288-grf", "syscon": for rk3288
>> -   - "rockchip,rk3308-grf", "syscon": for rk3308
>> -   - "rockchip,rk3328-grf", "syscon": for rk3328
>> -   - "rockchip,rk3368-grf", "syscon": for rk3368
>> -   - "rockchip,rk3399-grf", "syscon": for rk3399
>> -   - "rockchip,rv1108-grf", "syscon": for rv1108
>> -- compatible: DETECTGRF should be one of the following:
>> -   - "rockchip,rk3308-detect-grf", "syscon": for rk3308
>> -- compatilbe: COREGRF should be one of the following:
>> -   - "rockchip,rk3308-core-grf", "syscon": for rk3308
>> -- compatible: PMUGRF should be one of the following:
>> -   - "rockchip,px30-pmugrf", "syscon": for px30
>> -   - "rockchip,rk3368-pmugrf", "syscon": for rk3368
>> -   - "rockchip,rk3399-pmugrf", "syscon": for rk3399
>> -- compatible: SGRF should be one of the following:
>> -   - "rockchip,rk3288-sgrf", "syscon": for rk3288
>> -- compatible: USB2PHYGRF should be one of the following:
>> -   - "rockchip,px30-usb2phy-grf", "syscon": for px30
>> -   - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
>> -- compatible: USBGRF should be one of the following:
>> -   - "rockchip,rv1108-usbgrf", "syscon": for rv1108
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -
>> -Example: GRF and PMUGRF of RK3399 SoCs
>> -
>> -	pmugrf: syscon@ff320000 {
>> -		compatible = "rockchip,rk3399-pmugrf", "syscon";
>> -		reg = <0x0 0xff320000 0x0 0x1000>;
>> -	};
>> -
>> -	grf: syscon@ff770000 {
>> -		compatible = "rockchip,rk3399-grf", "syscon";
>> -		reg = <0x0 0xff770000 0x0 0x10000>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
>> new file mode 100644
>> index 000000000000..93231b95554b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip General Register Files
>> +
>> +maintainers:
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +properties:
>> +  compatible:
>> +    - items:
> The '-' is the source of your error.
Thanks.
>
>> +        - enum:
>> +            - rockchip,px30-grf
>> +            - rockchip,px30-pmugrf
>> +            - rockchip,px30-usb2phy-grf
>> +            - rockchip,rk3036-grf
>> +            - rockchip,rk3066-grf
>> +            - rockchip,rk3188-grf
>> +            - rockchip,rk3228-grf
>> +            - rockchip,rk3288-grf
>> +            - rockchip,rk3288-sgrf
>> +            - rockchip,rk3308-core-grf
>> +            - rockchip,rk3308-detect-grf
>> +            - rockchip,rk3308-grf
>> +            - rockchip,rk3328-grf
>> +            - rockchip,rk3328-usb2phy-grf
>> +            - rockchip,rk3368-grf
>> +            - rockchip,rk3368-pmugrf
>> +            - rockchip,rk3399-grf
>> +            - rockchip,rk3399-pmugrf
>> +            - rockchip,rk3568-grf
>> +            - rockchip,rk3568-pmugrf
>> +            - rockchip,rv1108-grf
>> +            - rockchip,rv1108-usbgrf
>> +        - const: syscon
>> +        - const: simple-mfd
> 'simple-mfd' was not in the old binding. That implies you have child
> nodes, and if so, they need to be documented. I imagine that will mean
> splitting this into multiple schemas if that's the case.
Maybe add the child nodes and document in a new submit.
>> documented
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pmugrf: syscon@ff320000 {
>> +       compatible = "rockchip,rk3399-pmugrf", "syscon", "simple-mfd";
>> +       reg = <0xff320000 0x1000>;
>> +    };
>> +
>> +    grf: syscon@ff770000 {
>> +       compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
>> +       reg = <0xff770000 0x10000>;
>> +    };
>> -- 
>> 2.17.1
>>
>>
>>
>
>


