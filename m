Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9935F1DEBC4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgEVP04 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 11:26:56 -0400
Received: from mail-eopbgr760059.outbound.protection.outlook.com ([40.107.76.59]:61262
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729929AbgEVP0z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 11:26:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGSm/1i5r7yHTLtnVl7umnYRipEl1qI5GGVb+doPC/x+14XKK9zm8JHWDwqKlli0+V7sYyG2y1CA/jUEtQ4DPvfEmfgrBp6KCE+LnDiQuRhsOWPAeKGs3ScZyECV9WMD0cl/zz3lJCOO+QZGAB6e5FeK8YvbulbHy1RJB6MXJqUF5lLBkOoArYv3kqRv7qOGDv7FEpEibXW8TXcl/WVGo2tBx9d+tdmw/42iaBBj2F9K0Ba0rWyjfOw4coiRjqeRkzmcMD3JVroaXIjYgz1NqH6GJL/tkAuVnpeKoHCO3Y6GklSZTnI5y2kcD9Exy0dWhXN9NTWwbIuhTh/9EGbPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY/YVVI+cvmvAy2NzIrGqCGLuJFLj56binIFiW/GK74=;
 b=Eg3MbjHavTVK+IH0PT/8LJ161hLx39vOz63zKL4yVq3hoOmnpoIZBs3IndZGG1udBJvKKTBvVu8rDSIkTwm3FGk7hfybRcgBjaCeV+SDps6bL14U2PTcPKVadLFmWsQeVL7QwgaqckhAAbc7AvnHS7DIU+roWVbyXHRrHfqiKB3O8omNpVky0HocLOzjk4vlQqRsHr1lqBa5qshla9DUKNKed0rH/jpyvmNEP03rEcQhFT2ZvtQIAZhSTX970oQpOAOLLzatfrfp7VLkIGgaG0Px3101kWNOkKYfsTwgVgvRyLhjx3FCX4Ar0AebK56wCCYk5/Yzfn6rycY6j4nRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY/YVVI+cvmvAy2NzIrGqCGLuJFLj56binIFiW/GK74=;
 b=RWcaDjP7ytgkLr8k3eNylu7076lkcQHwP+Al54qdcJKMaL5scABvoggXnFODYCbks2gJC8TNALTOFVTI6c2BNBxB1OFfmF9SM5LSxzdce8lzbH93gISTU1ml3oy1xk3IfaqjSCKAHSyET5rfcodvLHcHRFr8DVMAVXSonxEcmLk=
Received: from BL0PR02CA0120.namprd02.prod.outlook.com (2603:10b6:208:35::25)
 by DM6PR02MB6731.namprd02.prod.outlook.com (2603:10b6:5:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 15:26:53 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:35:cafe::3c) by BL0PR02CA0120.outlook.office365.com
 (2603:10b6:208:35::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Fri, 22 May 2020 15:26:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with Microsoft SMTP
 Server id 15.20.3021.23 via Frontend Transport; Fri, 22 May 2020 15:26:52
 +0000
Received: from [149.199.38.66] (port=59868 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jc9Z0-0000sR-LN; Fri, 22 May 2020 08:26:22 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jc9ZU-0005l3-Cd; Fri, 22 May 2020 08:26:52 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04MFQgSS010609;
        Fri, 22 May 2020 08:26:42 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jc9ZK-0005Wv-G4; Fri, 22 May 2020 08:26:42 -0700
Subject: Re: [PATCH v2] i2c: cadence: Add an error handling for
 platform_get_irq()
To:     Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, harinik@xilinx.com,
        soren.brinkmann@xilinx.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200520144821.8069-1-zhengdejin5@gmail.com>
 <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
 <20200522151459.GK5670@ninjato>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <7763d79e-3a44-2dbe-a4d3-45d40a3a1e02@xilinx.com>
Date:   Fri, 22 May 2020 17:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522151459.GK5670@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(346002)(136003)(39860400002)(396003)(376002)(46966005)(47076004)(4326008)(8676002)(316002)(110136005)(36756003)(9786002)(82740400003)(478600001)(81166007)(8936002)(70206006)(70586007)(82310400002)(186003)(31686004)(5660300002)(2616005)(426003)(31696002)(356005)(4744005)(2906002)(336012)(44832011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ac8933c-37bb-4a77-030a-08d7fe648ded
X-MS-TrafficTypeDiagnostic: DM6PR02MB6731:
X-Microsoft-Antispam-PRVS: <DM6PR02MB673156169B3426B51AC27FFDC6B40@DM6PR02MB6731.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04111BAC64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +E0WtiPIhtvVXpxdDAAhYYflHvSQTqclXp0dqer4ZbRBr05wVjYnaSzIy5YqxMjUvCgk/i+lliTavJx+1JMsjJwnEwSV9pfuuEnaeLdWlc6TpRMFBmkrCLywCAcs0mvKM27dmwxqDcKckuLXLZXn3u8kAUpacuu/QyXn4qpen4bFuV0VlPbtE7wjM69Sc3E7Iz2RIy4BFs3OF406Z6DKT38SBxOl2QJX39Na6Q1P9DTYokbES0lMixiSncbqUsquAIMmYQD8vfqNbWkE9tMjWO/9GKFqWjzF2FH7DQ70GoD0pnjO5gHAZqIljtlrk/I8dUNqDsSnj+KQUAKkF7csEi2wiCEpn8a2t813Ed80pw2fVV+oP06LEGZIvkpnvRwY4BttZ1VDb/VIwn+gc93UimYWujmRe3ORIyajPWYSqCVwrTxFYNFkz+ioxJzI7h/P
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2020 15:26:52.7459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac8933c-37bb-4a77-030a-08d7fe648ded
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6731
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22. 05. 20 17:14, Wolfram Sang wrote:
> 
>> The change is valid but the question is if make sense to do it in this
>> way. Some drivers are using devm_request_irq to do do job.
>>
>> For example:
>>  	id->irq = platform_get_irq(pdev, 0);
>>         ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
>>                                   DRIVER_NAME, id);
>>         if (ret)
>> 		return ret;
> 
> I like this version better. Maybe we should simply move the
> platform_get_irq() line to the devm_request_irq() call?

You know about
devm_platform_get_and_ioremap_resource()
usage.
 Maybe that's the way to go. Because as of today there is no way to pass
position of irq resource.

But I expect it will come in near future.

Thanks,
Michal

