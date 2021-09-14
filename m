Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E455640ACD8
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Sep 2021 13:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhINL4D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Sep 2021 07:56:03 -0400
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com ([40.107.93.88]:20838
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232065AbhINL4D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Sep 2021 07:56:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKf4Jcu6rEcex3OUgaT69CblSFsC+dnGvMuoEt5Ei2ZS56KpMWKoBIFOX5DzBn8oc1rl4A/4U3Lj6meMq1YuQQ9hCzECDOn6mPCnCHZp8XL+rh/40DRvTWL9wvIhNnVzcEJwH6bLaaRrNMmIJ3mjd9Aav9E0x2/XC1qv/jNijQC9L5QTmUNt/pv7gehNoe/7YDxHNbK0lgda5Pp/hJ0wT4lfcrG+kBpaFSvtoslJvh4fYK00D6JnjQDDG1Td7qKUro67wnbnGWf9qWAzd23Fn4lnDeIx6W3K1hTGjUOVT0R2z0UQhrhn/lb7a800JlhfM/qhrwVcZCc4J8dKLfRZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HS6wBB9xi8mdyhSkzfz3pFlq0xBCIFUCoGTfJFI9qzM=;
 b=E8bM1VC1bGYki3Np6eOfgIKYDj4Gws83QXPNUaj2UcNUqwrLtijR5JNFFOGdb78TKFxugxX3NuC0ph5m7uXpCDuETXxpsIqHYTpAdcUMhW60Y+J4mnwio1tKQPMFTxGpZjz6olkGCngRJfdllJQaNrCC0abettJ7TkIlVPx0RfYVfXtzJQ/QRhENRoXSB10I2rzDjxsdPaGSO78Bw3GIyKF43yGFoL9XsctYHID5ZderDSzhOVXSnXc1MJ/5lAEep2ts1V/TWm4NgSrjJ8tvbjJiMVtrjGRA58+0phlLvuzGPfnnZIZGO1/dGQziI0ar6T5/acv6XV6c3o0egBF1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS6wBB9xi8mdyhSkzfz3pFlq0xBCIFUCoGTfJFI9qzM=;
 b=FU55VD5B74tcq22cvy8Uy6zKtaCLDutJnEZsXI+6+q01hp2G8JZReDgNUGE1R3OM0SiIE96+Nn0hPNrUNRY2PauwQKC0HHtqIJYVz7N+8F1dtxMlUFrf7Cy94pFlApuiLAJZtj+mEGOHLZLsm/79MircnacCBe0JbhIpMLwTHBs=
Received: from DM5PR20CA0042.namprd20.prod.outlook.com (2603:10b6:3:13d::28)
 by BYAPR02MB4038.namprd02.prod.outlook.com (2603:10b6:a02:fc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 11:54:44 +0000
Received: from DM3NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::4a) by DM5PR20CA0042.outlook.office365.com
 (2603:10b6:3:13d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 14 Sep 2021 11:54:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT033.mail.protection.outlook.com (10.13.4.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 11:54:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Sep 2021 04:54:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Sep 2021 04:54:43 -0700
Envelope-to: linux-i2c@vger.kernel.org,
 marex@denx.de,
 wsa@kernel.org
Received: from [172.30.17.109] (port=39526)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mQ71P-0009lP-6S; Tue, 14 Sep 2021 04:54:43 -0700
Subject: Re: [PATCH v2 0/6] i2c: xiic: Fix broken locking
To:     Wolfram Sang <wsa@kernel.org>, Marek Vasut <marex@denx.de>,
        <linux-i2c@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <20210823214145.295104-1-marex@denx.de> <YUB5kIM3CtuOIPeq@ninjato>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <3fd720fa-b875-e327-cd15-b26aeadad2a0@xilinx.com>
Date:   Tue, 14 Sep 2021 13:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUB5kIM3CtuOIPeq@ninjato>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e1727bc-bb82-4a1b-996c-08d977767186
X-MS-TrafficTypeDiagnostic: BYAPR02MB4038:
X-Microsoft-Antispam-PRVS: <BYAPR02MB40381B494E68D570506250B7C6DA9@BYAPR02MB4038.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uyeQIE0YLL578PamJtyMFa4RT2n+CcdY9kvTLvl+Ey5FBHIhIuD2psO6g1gxjZVKX8x60PuVudECW7VeiyCeJ5q2FH1NDN6I2JVRPUuK15Pqb0MFBshv35SfwArkV25jeigZGkmyPUhglawg0XsjKvtacBD/iUyZk4sA4rvZvEGISe7Hb9p5rwyB7cR90mLM8I23b2VSQliKIkUDE0kX1fn0Sk0bsHx2qaVBrtngKV2SRV4gGQN3FACstY+/VXS1PX+smjOmGLEoOwmaKOGi8ndIao7Yot2ifuB5HXuYoawaEN/yhs2kOba37ru0/9KM8SV0wEkTpeC2R0LW9cDrXjeZ9cu1bg6GA+LJ5g2p/Jz+mZ3MXmYk9/omvfFEJyoZ2ZxzkrNmgwc/mh+zBFEorFu5andCRg9Q3qWCOulzj8AMk+cUXXVg9Lfb8pPwArYlRBtQgnt/rEl2lx4ZXTrMn9/IiBMF2x1F7X3Mueaseblq6zzRM1+59521Son4oBubrlvfkNDHE5zC6/dOlBqgPCTuvJ3oFPCfm3Suw4DrUOc6+WiqQUA2rj2AD0mAxM7tVxtUP+jK1FHPiLRoX9IfKxYrK9KODJHrNa6Kq70wwAgJ75nr530YOyDeiF+ABCsP4Th+k6EW/xHiki1jfgWvVKQeJVau2D7AtxBTxk1xvgSqOXNsixLSKfEE0k8jVff5KyowpVf3IfH7hUsoZiHJcYljHmaAhWI1ubNjg+FQRwBfFMcGjDHVAyOxCPvrJMAD2Q1rEEitVMqnzMDXMhLDpw==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(7636003)(26005)(186003)(36906005)(6636002)(70586007)(356005)(82310400003)(110136005)(8936002)(8676002)(82740400003)(53546011)(316002)(2616005)(36860700001)(44832011)(47076005)(70206006)(36756003)(9786002)(2906002)(31686004)(83380400001)(5660300002)(336012)(31696002)(426003)(478600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 11:54:44.2489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1727bc-bb82-4a1b-996c-08d977767186
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4038
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/14/21 12:29 PM, Wolfram Sang wrote:
> On Mon, Aug 23, 2021 at 11:41:39PM +0200, Marek Vasut wrote:
>> Booting ZynqMP with XIIC I2C driver shows multitude of race conditions
>> in the XIIC driver. This is because locking is completely missing from
>> the driver, and there are odd corner cases where the hardware behaves
>> strangely.
>>
>> Most of these races could be triggered easily when booting on SMP
>> machines, like the ZynqMP which has up to 4 cores. It is sufficient
>> for the interrupt handler to run on another core than xiic_start_xfer
>> and the driver fails completely.
>>
>> This does not add support for long transfers, this only fixes the
>> driver to be usable at all instead of being completely broken.
>>
>> The V2 fixes a few remaining details which cropped up in deployment
>> over the last year or so, so I believe the result should be reasonably
>> well tested.
>>
>> Marek Vasut (6):
>>   i2c: xiic: Fix broken locking on tx_msg
>>   i2c: xiic: Drop broken interrupt handler
>>   i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in
>>     xiic_process()
>>   i2c: xiic: Switch from waitqueue to completion
>>   i2c: xiic: Only ever transfer single message
>>   i2c: xiic: Fix RX IRQ busy check
>>
> 
> Applied to for-next, thanks everyone!
> 

Thx.
FYI: Ravi will be sending his series on the top of this one.

Thanks,
Michal
