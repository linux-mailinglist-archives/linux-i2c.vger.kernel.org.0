Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9941B4AB63C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 09:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbiBGIGL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 03:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244862AbiBGH4I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 02:56:08 -0500
X-Greylist: delayed 1120 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Feb 2022 23:56:05 PST
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71154C043185;
        Sun,  6 Feb 2022 23:56:05 -0800 (PST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JsdHX3TJBzbjwM;
        Mon,  7 Feb 2022 15:36:24 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Feb 2022 15:37:18 +0800
CC:     <prime.zeng@hisilicon.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH 0/2] Add I2C bus recovery support on Kunpeng 920/930
To:     Yicong Yang <yangyicong@hisilicon.com>,
        <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <0db7b7ab-a640-b8c3-33cc-29731a65227b@huawei.com>
Date:   Mon, 7 Feb 2022 15:37:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220125124930.50369-1-yangyicong@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

a friendly ping ...

Hi Designware maintainers and Wolfram, any comments for this?

thanks.

On 2022/1/25 20:49, Yicong Yang wrote:
> This series adds the I2C bus recovery support on Kunpeng 920/930.
> We're using HiSilicon I2C controller on Kunpeng 930 and Designware
> I2C controller on Kunpeng 920. For both platform, the SCL/SDA pins
> are multiplexed with GPIOs. Both driver use generic GPIO recovery
> method and we need to switch the pin mutiplexing before/after the
> recovery process. We use ACPI method to help on the pin mux switching
> which is also introduced in this series.
> 
> Yicong Yang (2):
>   i2c: hisi: Add generic GPIO bus recovery support
>   i2c: designware: Add ACPI assisted recovery support
> 
>  drivers/i2c/busses/i2c-designware-core.h    |  2 +
>  drivers/i2c/busses/i2c-designware-master.c  | 84 ++++++++++++++++++++-
>  drivers/i2c/busses/i2c-designware-platdrv.c |  6 +-
>  drivers/i2c/busses/i2c-hisi.c               | 78 +++++++++++++++++++
>  4 files changed, 164 insertions(+), 6 deletions(-)
> 
