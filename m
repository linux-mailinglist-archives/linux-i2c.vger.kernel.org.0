Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51F0D4ACEBB
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 03:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344729AbiBHCQG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 21:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345677AbiBHCPs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 21:15:48 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184CBC043181;
        Mon,  7 Feb 2022 18:15:46 -0800 (PST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Jt63Q2n6GzdZTk;
        Tue,  8 Feb 2022 10:12:34 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Feb 2022 10:15:44 +0800
CC:     <jarkko.nikula@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <prime.zeng@hisilicon.com>,
        <linuxarm@huawei.com>, <irina.tirdea@intel.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: hisi: Add generic GPIO bus recovery support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>
References: <20220125124930.50369-1-yangyicong@hisilicon.com>
 <20220125124930.50369-2-yangyicong@hisilicon.com>
 <YgD/3Xi0yLPHCu+L@smile.fi.intel.com> <YgEAeOmobDhqRMGx@smile.fi.intel.com>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <5de8e304-05b7-48ec-6b8f-e1f856e86697@huawei.com>
Date:   Tue, 8 Feb 2022 10:15:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <YgEAeOmobDhqRMGx@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

[ +cc pinctrl list for visible ]

Hi Andy,

Thanks for the reply.

On 2022/2/7 19:20, Andy Shevchenko wrote:
> On Mon, Feb 07, 2022 at 01:17:49PM +0200, Andy Shevchenko wrote:
>> On Tue, Jan 25, 2022 at 08:49:29PM +0800, Yicong Yang wrote:
>>> Add generic GPIO bus recovery support for i2c-hisi driver
>>> by registering the recovery information with core provided
>>> i2c_generic_scl_recovery() method.
>>>
>>> As the SCL/SDA pins are multiplexed with GPIO, we need to
>>> switch the pins mux to GPIO before recovery and switch back
>>> after recovery. It's implemented by the ACPI method in
>>> the i2c_bus_recovery_info->{prepare,unprepare}_recovery()
>>> method.
>>
>> NAK.
>>
>> ACPI has its own resources for that. What is missed is the layer between ACPI
>> and pin control.
> 

I think that's where the problem is and why we use this approach. When I looked into
devm_pinctrl_get(), it stops when fails to retrieve the pin info from device tree.
So I cannot use it on our ACPI server for the pinmux.

I looked into the history that Irina raised an RFC for adding the ACPI support in pinctrl[1],
but at that time seems it lacks some standard support. But maybe now we can support it?

But based on the current situation maybe the implementation of this patch suits best.
And currently we don't have a pinctrl driver for doing the multiplexing (though I think it's
easy to add one but maybe only configures 2 pins for now).

[1] https://lore.kernel.org/all/CACRpkdbj==q5wp2Z5-ZXkbfeXa4y+beLF_3YN-vS3CtyAKGwkg@mail.gmail.com/

Thanks,
Yicong

> To be more precise,
> 
> https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pinconfig-pin-configuration-descriptor-macro
> 
> https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pinfunction-pin-function-descriptor-macro
> 
> https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pingroup-pin-group-descriptor-macro
> 
> https://uefi.org/specs/ACPI/6.4/19_ASL_Reference/ACPI_Source_Language_Reference.html?highlight=pinfunction#pingroupconfig-pin-group-configuration-descriptor-macro
> 
