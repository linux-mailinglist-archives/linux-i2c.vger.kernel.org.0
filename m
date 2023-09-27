Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1595A7AF91A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 06:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjI0EOW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 00:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjI0ENK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 00:13:10 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6919910CB;
        Tue, 26 Sep 2023 19:07:20 -0700 (PDT)
Received: from kwepemm000004.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RwKgf4SGhzrSsV;
        Wed, 27 Sep 2023 10:05:02 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemm000004.china.huawei.com
 (7.193.23.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 27 Sep
 2023 10:07:16 +0800
Message-ID: <a89bdd10-9388-01f5-6a7c-894af793e1c1@huawei.com>
Date:   Wed, 27 Sep 2023 10:07:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] ACPI: PCC: Add PCC shared memory region command and
 status bitfields
To:     Sudeep Holla <sudeep.holla@arm.com>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>
CC:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, <lihuisong@huawei.com>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <20230926-pcc_defines-v1-1-0f925a1658fd@arm.com>
From:   "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20230926-pcc_defines-v1-1-0f925a1658fd@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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

在 2023/9/26 20:28, Sudeep Holla 写道:
> Define the common macros to use when referring to various bitfields in
> the PCC generic communications channel command and status fields.
Can you define the bit0 macros in the "flags" for Extended PCC Subspace 
Shared Memory Region?
>
> Currently different drivers that need to use these bitfields have defined
> these locally. This common macro is intended to consolidate and replace
> those.
>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   include/acpi/pcc.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
> index 73e806fe7ce7..66d9934c2ee4 100644
> --- a/include/acpi/pcc.h
> +++ b/include/acpi/pcc.h
> @@ -18,7 +18,18 @@ struct pcc_mbox_chan {
>   	u16 min_turnaround_time;
>   };
>   
> +/* Generic Communications Channel Shared Memory Region */
> +#define PCC_SIGNATURE			0x50424300
Why is this signature 0x50424300?
In ACPI spec, this signature is all 0x50434303.
> +/* Generic Communications Channel Command Field */
> +#define PCC_CMD_GENERATE_DB_INTR	BIT(15)
> +/* Generic Communications Channel Status Field */
> +#define PCC_STATUS_CMD_COMPLETE		BIT(0)
> +#define PCC_STATUS_SCI_DOORBELL		BIT(1)
> +#define PCC_STATUS_ERROR		BIT(2)
> +#define PCC_STATUS_PLATFORM_NOTIFY	BIT(3)
> +
>   #define MAX_PCC_SUBSPACES	256
> +
>   #ifdef CONFIG_PCC
>   extern struct pcc_mbox_chan *
>   pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);
>
