Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568181E0778
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 09:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388932AbgEYHGE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 03:06:04 -0400
Received: from mail-dm6nam10on2070.outbound.protection.outlook.com ([40.107.93.70]:31514
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388385AbgEYHGE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 May 2020 03:06:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3vmwPBEEAOpO61DYGW4UWI6OxorbyS9VH0vgKTR3kJpyO+vyN3HO3WJZY2ZP4P9m01IltaVjN1fVeIkK58g9vVl/dTbpSLyJ3DsYphdNCCgw72fwJmCZvB6n05Kj1VluobZUgRs5kFsIlmA5A9YZnN0xcalcuWOEgs8SSNYt98LhRANv+OWP3uGStwjebfzjLaFsLL3P66vUi2kes0MltWVohx6J3u+W88W9aKm3sHdMQufUoLdhQWyejiyseYRNt5UuZm5LpufGGyRdTOY/DK5KuYc80Se/lYqSTdRH4Y2ZzBgIojXcHROZOeHzXPHAR6ZztJi+zTZAWozmFxVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXdo8ctrYhcGYAMJXvPk/EHyvdz5MtQCV3Uoe/dsjpU=;
 b=atF+xgsj0GfZRkr552Hg7kZ6q2Njfxt1diPFpefWPNidggCF8wRKbcd8RjLLUpTW3xqfFIfHwkCEjV8QMUW64efS+pjaGHEXkSozOUb5IonDVcbdzuheY0QB83adHzS3VGjIK5ju2i9aSPJmOYNWXeLQ35v1CVWBxmPkWhNgh01zxmHHwKMr7PWlrmDfNLeTvPZCZ9iW/U8wUVe0wsrqIkFJueTBDzFUvS5DahFjbxjSxtnNG6SAosGk9f7DbvhEfuKy+a7PyMUuFkYI7Suy8hQ3IKmur+1aUeF2iYOkpXzJFwSty7wcUZ4m2/2nLPpZmcZGCF2ybizXlur982KpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXdo8ctrYhcGYAMJXvPk/EHyvdz5MtQCV3Uoe/dsjpU=;
 b=CR0sQBLGQh/X8xGD7Yz/gU9QnG4GK53KRdmBQf1cgrwRUPNjBx+Go6yVyedRTY+X+p09isRV086wL6Y7Muj3hNxRf2W7cmT498Xw0ZqKdv2bYmWfnVsx1KAOnfafEC3qnnUVkVO6ZBLkmFXa4UEkE7JLX3lcZbUOmw9o4siYLKM=
Received: from SA9PR10CA0006.namprd10.prod.outlook.com (2603:10b6:806:a7::11)
 by BY5PR02MB6643.namprd02.prod.outlook.com (2603:10b6:a03:213::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 07:06:00 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::a9) by SA9PR10CA0006.outlook.office365.com
 (2603:10b6:806:a7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Mon, 25 May 2020 07:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server id 15.20.3021.23 via Frontend Transport; Mon, 25 May 2020 07:06:00
 +0000
Received: from [149.199.38.66] (port=51354 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jd7At-00046f-4s; Mon, 25 May 2020 00:05:27 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jd7BQ-00035S-Ax; Mon, 25 May 2020 00:06:00 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jd7BL-00034i-Pc; Mon, 25 May 2020 00:05:55 -0700
Subject: Re: [PATCH v2 0/2] drivers: provide devm_platform_request_irq()
To:     Dejin Zheng <zhengdejin5@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, festevam@gmail.com,
        vz@mleia.com, heiko@sntech.de, linus.walleij@linaro.org,
        baohua@kernel.org, ardb@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
 <20200523160828.GE3459@ninjato> <20200523170933.GA16771@nuc8i5>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <ad90d9b5-5906-fef3-85b8-00c7eff70e61@xilinx.com>
Date:   Mon, 25 May 2020 09:05:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200523170933.GA16771@nuc8i5>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(376002)(346002)(46966005)(70206006)(70586007)(8676002)(9786002)(31686004)(36756003)(7416002)(356005)(82310400002)(81166007)(4326008)(316002)(336012)(8936002)(426003)(110136005)(5660300002)(2906002)(31696002)(966005)(6666004)(2616005)(44832011)(47076004)(478600001)(82740400003)(26005)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7407a3b9-ecc3-4013-cbc5-08d8007a14c7
X-MS-TrafficTypeDiagnostic: BY5PR02MB6643:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6643C1AAAB4632F6229AB334C6B30@BY5PR02MB6643.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0414DF926F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmIskl1+6bW7Tzk9PM8II2z3ABidVCyc77KXnKlW7FHDmRDCEy7+LVlvEzTvATa+1kNnMUvAsJTiv+tweCoSsXHkZsF511xeBbLGsJPWUJFO6jgDXWnWvlj/IOp++6ZL15u+Tkj5ZuvnR4OTkOEOW6L7W9rFwSkquC1+tJTale7YIiCrqwrgU6QA0fy4ALkgz+SRmwYdIuxiKDoa0a3snd1Lls9tXEpYRaaVjb2sZ4GMSc+uqORAIoUBOErHHjLirjD0AivF/oWgXM7M7RK67eJ9Gf02g75YIiAAgrveF/7mZTFK9CxCzk7q5oAPLyM8DO85a+UxZbgH1RcSNIlJMaYq2VTjY5vBhRCVYq4v/jdqw/aL7+g9TP5mxBAv4TX9Ru0BtdFtFN9YxX6ffZdmYNIZGuwGnHroYXG3Hvt4W2hm+zlzCjzIxCvhjHRlQo+bPyz+Yb9lTNBakoIF9rR81ia6SRaH8qRn/Z1ZnN0PhDH29qG+1yvAGFc1wM4FfCv5
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2020 07:06:00.7313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7407a3b9-ecc3-4013-cbc5-08d8007a14c7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6643
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23. 05. 20 19:09, Dejin Zheng wrote:
> On Sat, May 23, 2020 at 06:08:29PM +0200, Wolfram Sang wrote:
>> On Sat, May 23, 2020 at 10:51:55PM +0800, Dejin Zheng wrote:
>>> It will call devm_request_irq() after platform_get_irq() function
>>> in many drivers, sometimes, it is not right for the error handling
>>> of these two functions in some drivers. so provide this function
>>> to simplify the driver.
>>>
>>> the first patch will provide devm_platform_request_irq(), and the
>>> other patch will convert to devm_platform_request_irq() in some
>>> i2c bus dirver.
>>>
>>> v1 -> v2:
>>> 	- I give up this series of patches in v1 version. I resend this
>>> 	  patches v2 by that discussion:
>>> 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
>>> 	  The patch content has not changed.
>>
>> I don't understand. v1 has been nacked because of technical reasons. How
>> did the discussion above change the situation? Am I missing something?
>>
> No, you are not missing something. Maybe I did not explain clearly.
> 
> The v1 has been nacked because Grygorii told me that the
> function platform_get_irq() should be done as early as possible to avoid
> unnecessary initialization steps, and the function devm_request_irq()
> should be done late in probe when driver and HW are actually ready to
> handle IRQs. It can do the other things between the two funtions. I agree
> with him that it may be necessary in some complex drives. So abandon the
> patch v1.
> 
> Base on the discussion of you and Michal, I think maybe this patch is also
> needed for the simple driver or the driver of already use it like that:
> 	
> 	irq = platform_get_irq(pdev, 0);
> 	if (irq < 0)
> 		return irq;
> 	ret = devm_request_irq()
> 
> It provides a common error handling and reduce one function call for each
> drivers, more easier to use and simplify code. So resend it.
> 
> BR,
> Dejin
> 
>>>
>>> Dejin Zheng (2):
>>>   drivers: provide devm_platform_request_irq()
>>>   i2c: busses: convert to devm_platform_request_irq()
>>>
>>>  drivers/base/platform.c            | 33 ++++++++++++++++++++++++++++++
>>>  drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++------------
>>>  drivers/i2c/busses/i2c-cadence.c   | 10 +++------
>>>  drivers/i2c/busses/i2c-digicolor.c | 10 +++------
>>>  drivers/i2c/busses/i2c-emev2.c     |  5 ++---
>>>  drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
>>>  drivers/i2c/busses/i2c-meson.c     | 13 ++++--------
>>>  drivers/i2c/busses/i2c-mxs.c       |  9 +++-----
>>>  drivers/i2c/busses/i2c-pnx.c       |  9 ++------
>>>  drivers/i2c/busses/i2c-rcar.c      |  9 +++-----
>>>  drivers/i2c/busses/i2c-rk3x.c      | 14 +++----------
>>>  drivers/i2c/busses/i2c-sirf.c      | 10 ++-------
>>>  drivers/i2c/busses/i2c-stu300.c    |  4 ++--
>>>  drivers/i2c/busses/i2c-synquacer.c | 12 +++--------
>>>  include/linux/platform_device.h    |  4 ++++
>>>  15 files changed, 72 insertions(+), 91 deletions(-)

If you look at all driver except for cadence one it doesn't do any
change and I can't see any issue with it because sequences are the same
as were before.

Regarding Cadence and Grygorii's comments:
We are not checking that id->irq is valid that's why even if that fails
driver continues to work. Which means that this change doesn't increase
boot time or change code flow.
On Xilinx devices cadence i2c is connected to ARM GIC which is
initialized very early and IRC controller should be up and running all
the time.
That's why I can't see any issue which this change on Cadence driver too.

Thanks,
Michal




