Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8185E36C066
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Apr 2021 09:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbhD0HuA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 27 Apr 2021 03:50:00 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51040 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhD0Ht7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Apr 2021 03:49:59 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lbISa-0002Fw-Pi; Tue, 27 Apr 2021 09:48:44 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>, cl@rock-chips.com,
        Kever Yang <kever.yang@rock-chips.com>
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
Subject: Re: [PATCH v2 6/7] arm64: dts: rockchip: add core dtsi for RK3568 SoC
Date:   Tue, 27 Apr 2021 09:48:41 +0200
Message-ID: <2088315.NnIJQXNAa5@diego>
In-Reply-To: <c2e96d99-3af5-3f22-78de-f6eff18b9c24@rock-chips.com>
References: <20210425094216.25724-1-cl@rock-chips.com> <3d584cdc-020e-5aae-cae3-59ef45e64a9f@gmail.com> <c2e96d99-3af5-3f22-78de-f6eff18b9c24@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Am Dienstag, 27. April 2021, 05:45:03 CEST schrieb Kever Yang:
> Hi Johan, Heiko,
> 
> On 2021/4/26 下午8:16, Johan Jonker wrote:
> > ===
> >
> > compatible = "rockchip,rk3568";
> > Maybe add this together with other rkXXXX SoCs to rockchip.yaml on top
> > of board list ???
> > Please advise.

I don't think so. I.e. the rockchip,rk3568 compatible is not supposed be
standing alone somewhere, but should always be combined with a board-
compatible. Same as the rk3568.dtsi should not be used alone but included
into a board dts.

And patch7 does this by adding the necessary entry to the board list.

> This rockchip.yaml is now describe boards without any sort, it would be 
> better to refactor and sort in two level:
> - soc level
> - board level base on the same soc.

The sorting in rockchip.yaml is supposed to be alphabetically by description.
(vendor + boardname)

My intention for this was to allow readers to find their board to get
the matching compatible - and I like that ordering somehow ;-) .

So I don't think there are bigger changes necessary to rockchip.yaml


Heiko


