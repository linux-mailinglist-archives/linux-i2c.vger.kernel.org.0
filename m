Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859701A1FD7
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 13:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgDHL37 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 07:29:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:2066 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728395AbgDHL37 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 07:29:59 -0400
IronPort-SDR: YyTWlAq7NwprhHHTFcskxBcjPO9YZks0sLASSbvAJCdDcMVRPXcM9Bn1CPgmL0237MU0/782At
 DXLeAp8H/lJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 04:29:57 -0700
IronPort-SDR: ifOjrUMVFqW8dexOx0p2lsiqDRjrzWeonqWhKft9FCuq7EOBE+3PYQKqQo2GjV6vSWtaJy9xZg
 ELlRWVCcgpDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; 
   d="scan'208";a="297212508"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2020 04:29:47 -0700
Subject: Re: [PATCH v1 00/28] convert to devm_platform_ioremap_resource
To:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>, nsekhar@ti.com,
        bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kgene@kernel.org, krzk@kernel.org, paul@crapouillou.net,
        vz@mleia.com, khilman@baylibre.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        allison@lohutok.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, bigeasy@linutronix.de,
        info@metux.net, hslester96@gmail.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        martin.blumenstingl@googlemail.com,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Fabien Parent <fparent@baylibre.com>, opensource@jilayne.com,
        swinslow@gmail.com, linux-i2c@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
 <CAJMQK-g-Q20fDzy-0DQxoy+dS_USXkZ9DNSqeLmpUJS1OEzbCA@mail.gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <6db77bf6-e1b1-b3fd-8539-7b083b38e7b2@linux.intel.com>
Date:   Wed, 8 Apr 2020 14:29:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJMQK-g-Q20fDzy-0DQxoy+dS_USXkZ9DNSqeLmpUJS1OEzbCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/8/20 6:54 AM, Hsin-Yi Wang wrote:
> On Wed, Apr 8, 2020 at 12:37 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>>
>> this patch sets use devm_platform_ioremap_resource() to simplify code,
>> which contains platform_get_resource() and devm_ioremap_resource(). so
>> use it to replace the platform_get_resource() and
>> devm_ioremap_resource().
>>
>> Dejin Zheng (28):
>>    i2c: img-scb: convert to devm_platform_ioremap_resource
>>    i2c: mv64xxx: convert to devm_platform_ioremap_resource
>>    i2c: owl: convert to devm_platform_ioremap_resource
>>    i2c: exynos5: convert to devm_platform_ioremap_resource
>>    i2c: mt65xx: convert to devm_platform_ioremap_resource
> 
> mt65xx seems not in the series.
> 
Looks like patches 5, 6, 9 and 19 are missing.

-- 
Jarkko
