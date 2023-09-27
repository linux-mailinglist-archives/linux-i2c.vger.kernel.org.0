Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8123B7AF93B
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 06:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjI0EXh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 00:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjI0EWm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 00:22:42 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9940876B8;
        Tue, 26 Sep 2023 19:11:24 -0700 (PDT)
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RwKjx1bScztSyl;
        Wed, 27 Sep 2023 10:07:01 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm000004.china.huawei.com
 (7.193.23.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 27 Sep
 2023 10:11:22 +0800
Message-ID: <9497cf31-09b9-b083-bbe8-84307178b20a@huawei.com>
Date:   Wed, 27 Sep 2023 10:11:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] ACPI: PCC: Define and use the common PCC shared
 memory regions related macros
To:     Sudeep Holla <sudeep.holla@arm.com>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>
CC:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, <lihuisong@huawei.com>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
From:   "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000004.china.huawei.com (7.193.23.18)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sudeep,

Could you please use these new common macros for kunpeng_hccs?

在 2023/9/26 20:27, Sudeep Holla 写道:
> This set of 3 small patches intend to consolidate and replace the existing
> locally defined macros within couple of PCC client drivers when accessing
> the command and status bitfields.
>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
> Sudeep Holla (3):
>        ACPI: PCC: Add PCC shared memory region command and status bitfields
>        i2c: xgene-slimpro: Migrate to use generic PCC shmem related macros
>        hwmon: (xgene) Migrate to use generic PCC shmem related macros
>
>   drivers/hwmon/xgene-hwmon.c            | 16 +++++-----------
>   drivers/i2c/busses/i2c-xgene-slimpro.c | 16 ++++------------
>   include/acpi/pcc.h                     | 11 +++++++++++
>   3 files changed, 20 insertions(+), 23 deletions(-)
> ---
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> change-id: 20230926-pcc_defines-24be5e33b6f3
>
> Best regards,
