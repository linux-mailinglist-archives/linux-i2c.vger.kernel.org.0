Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA96B43A58
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2019 17:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732107AbfFMPUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Jun 2019 11:20:31 -0400
Received: from mail-eopbgr710082.outbound.protection.outlook.com ([40.107.71.82]:56832
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732106AbfFMMyf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Jun 2019 08:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX5Zc3+vpoWmW2/5ieAIvVwG55pZ8hRfh3pIkvx+fok=;
 b=k8CJxBNIVG64Zdunw5uvjCwSsgHBUiXw2R1exTbc5BDH4BHkLr35V07WAR48/cATBkp6t3QKAJTrwceQq6B+020b1QD4o7zOvATCWFqBHSiqvvrQP9jR6YukMF/U5LoJipOhTSERdj4jGSWTQ6zDlUXcSzghZ31hPPBNQ+zOf1s=
Received: from DM6PR02CA0068.namprd02.prod.outlook.com (2603:10b6:5:177::45)
 by SN6PR02MB4941.namprd02.prod.outlook.com (2603:10b6:805:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.11; Thu, 13 Jun
 2019 12:54:32 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by DM6PR02CA0068.outlook.office365.com
 (2603:10b6:5:177::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17 via Frontend
 Transport; Thu, 13 Jun 2019 12:54:31 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; sang-engineering.com; dkim=none (message not
 signed) header.d=none;sang-engineering.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
 via Frontend Transport; Thu, 13 Jun 2019 12:54:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hbPFO-0006Cn-OS; Thu, 13 Jun 2019 05:54:30 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hbPFJ-0003Ox-LZ; Thu, 13 Jun 2019 05:54:25 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x5DCsO4J016642;
        Thu, 13 Jun 2019 05:54:24 -0700
Received: from [172.30.17.116]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hbPFI-0003Og-Ei; Thu, 13 Jun 2019 05:54:24 -0700
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-i2c@vger.kernel.org
From:   Michal Simek <michal.simek@xilinx.com>
Subject: I2c multi master with i2c muxes
Message-ID: <03214cb7-291a-d1d5-7d5e-90e991100b08@xilinx.com>
Date:   Thu, 13 Jun 2019 14:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(396003)(39860400002)(2980300002)(199004)(189003)(2486003)(52146003)(23676004)(26005)(186003)(4326008)(426003)(77096007)(65806001)(36756003)(110136005)(8936002)(336012)(2906002)(316002)(230700001)(106002)(47776003)(356004)(65956001)(64126003)(8676002)(50466002)(81166006)(126002)(478600001)(486006)(81156014)(31696002)(5660300002)(6306002)(70586007)(70206006)(9786002)(65826007)(58126008)(305945005)(2616005)(44832011)(476003)(966005)(63266004)(31686004)(42866002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB4941;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313b4da7-317b-4025-481c-08d6effe4722
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:SN6PR02MB4941;
X-MS-TrafficTypeDiagnostic: SN6PR02MB4941:
X-MS-Exchange-PUrlCount: 1
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB494173A3558DC453578EC551C6EF0@SN6PR02MB4941.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0067A8BA2A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: stIop/Ov3tpffNsi/2kxjCzAYPMvxOAiSzXGk/SfALSDvf19FXeEzEjQ9jZPx33UyXbMPHDP/xy+Y5OadGdrf0wqXHPjOQ1tEBlBXrFqGCi5OvQyUbBSSd3BAo1uSJ8AfnWN5skcpgfwqTnQKM8r2/+vdAwVg+4QCEU1tUTGINPcyiIGDcPJI/L2LCXEhY5yu6mgGS1TYLiePqWGSvMpG873YFtYLHCrld+ZJoKP627Q7HUXpFIsnsBl14WVBJ94FA5I77x5uuifQM4funn036ZoSNl7x2qrcChVpAy6jQd5YYBsplqqpxISkyfYCarJdaTrfpH+BXD0qaBkKIWHtWVLOvd72RXfIBTZIjFUsCRVyTAmLrGxGgs5QdsFLgXZGWoh7kR/CKXNoJK9cqRXQOFRnJu8VHU4RXml1ezm+OQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2019 12:54:31.1482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 313b4da7-317b-4025-481c-08d6effe4722
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4941
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I started to look at i2c multi master mode and I wanted to ask question
how HW/PCB should be design to support multi master mode with i2c muxes
properly.

I found at
https://i2c.info/i2c-bus-specification
PCA9541 usage as HW solution for multi master coming from two different
HW. I have also seen driver in the kernel for it based i2c mux
infrastructure.

There is also GPIO based arbirtrator driver in the kernel maintain by
Peter.

I expect that this HW chip of gpio based solution works properly for two
external masters.

And I have a question if you are aware about any solution done purely
based on SW. The reason why I am asking is that on Xilinx boards there
are 2 ways how to get the the same I2C bus without any PCA9541 hw based
solution and expectation from HW guys is to synchronize master via SW.
It means one master can be Linux running on a53 and second RTOS running
on R5 inside the same chip.
Is there any SW synchronization in place which could be use?

Is there any i2c based hw/sw mutex/spinlock chip which should be used
instead of HW PCA9541 solution? (on zcu102 there could be even 3 masters).

Thanks,
Michal
