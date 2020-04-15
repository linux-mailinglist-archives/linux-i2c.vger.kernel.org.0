Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909681AA9C9
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 16:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733050AbgDOOUz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 10:20:55 -0400
Received: from mail-eopbgr750041.outbound.protection.outlook.com ([40.107.75.41]:46340
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732547AbgDOOUw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 10:20:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/aDA3TNUudg7b1hiIgupytxTV1iDjIaBHZEV72SWeq+9V0DL/aB/W/ggMgwkKTNWQ93scf3cY2uVskSGlkwd8sAKPq7jHBRpKc4e9JgKnKe/ovl8pi1X7TPbWXAzBS9Vx4gtzEC9T1vl6Ziw7ES+VovWpUb/aW+GyON3ZETb4WHCRuWL4ROMuY8z91afH6jqYyE8PN1LTI1NKm/BCgvy2V/Tq/CdHo9zV5WzabgbnOL9y6vTcsAMa0fch8yYsVYCR9YCnHn954RnmcoWKIzqL99me3cOqDYiZwBmKHwB04i0GDFIr22Neyvd3pmOkB4gEjdpg6aEikTh4jsejk/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL+jzdl8rTh5LL7dq+s4TeX25tRK+uLwfWGt38KkSJg=;
 b=L+RH63z7bbQh2d66Zu1PTXD129HFOFn8z4VeubigzeNzrfbiaDVg6lBgG5Hs1hJGBUpR5gEhBMV2+DJVdd4j+eZ5dnE3ffW8SueOis8N1if1fTFZARd8WQYUDwMSzOnjpWtvf0/QWNnwBDFzTSc+y6CXigFve8TEy9L3CtZkMZsqMLpILLtwi/oxFgmPvBYIwGhYPNinkDYG8TgOn0z1DQnpvemtsP1fU1BaUULMRpqjrr4nFpBT+Opc06JduU90Q29YCu+boa1qwvrpjgaQLodHKbSPMTo0NNrV1NaoMlb2qMU5SM/BqTfho1TTwfA6w1FQv+frTd17MUdXbDUf/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL+jzdl8rTh5LL7dq+s4TeX25tRK+uLwfWGt38KkSJg=;
 b=T/IbR7gKiQW0qVZEPUX+Z/4nXvI1hwZRVuQ9lmj91Ov7tBCWRXxDa4ghxQgWqZwOhsmsc8FaFidr+vWmAeik7erldPvaWFMSFEDBKwRs+s0xAricDLakDlBkG/1LYxMvyy3NARt3vGPKE7E/2lHBXvnkuKUMgWc96BFYUrMtPRk=
Received: from CY4PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:910:16::33) by BL0PR02MB4804.namprd02.prod.outlook.com
 (2603:10b6:208:5f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Wed, 15 Apr
 2020 14:20:49 +0000
Received: from CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:16:cafe::2a) by CY4PR1201CA0023.outlook.office365.com
 (2603:10b6:910:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 15 Apr 2020 14:20:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT009.mail.protection.outlook.com (10.152.75.12) with Microsoft SMTP
 Server id 15.20.2921.25 via Frontend Transport; Wed, 15 Apr 2020 14:20:48
 +0000
Received: from [149.199.38.66] (port=51885 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jOitZ-0007H5-7J; Wed, 15 Apr 2020 07:20:05 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jOiuG-0004bP-Fr; Wed, 15 Apr 2020 07:20:48 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jOiuB-0004ZC-3K; Wed, 15 Apr 2020 07:20:43 -0700
Subject: Re: [PATCH v2] i2c: cadence: Added slave support
To:     Wolfram Sang <wsa@the-dreams.de>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com,
        Chirag Parekh <chirag.parekh@xilinx.com>
References: <20200106104336.101987-1-radu_nicolae.pirea@upb.ro>
 <20200415125850.GD910@ninjato>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d7bbb013-aba1-6623-f656-46b3f5689834@xilinx.com>
Date:   Wed, 15 Apr 2020 16:20:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200415125850.GD910@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966005)(2616005)(44832011)(356005)(47076004)(81156014)(336012)(31696002)(426003)(8936002)(81166007)(8676002)(4744005)(70206006)(478600001)(186003)(9786002)(82740400003)(70586007)(36756003)(316002)(26005)(5660300002)(107886003)(110136005)(31686004)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ecc3fe-ddc2-4294-8560-08d7e14831ee
X-MS-TrafficTypeDiagnostic: BL0PR02MB4804:
X-Microsoft-Antispam-PRVS: <BL0PR02MB48046042AC69EBE82D6DC979C6DB0@BL0PR02MB4804.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0374433C81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slt19jyWq6lm1eKpxfml/o371VMS1QpJgRxOsceFAyPFROwkbRoCs/HY9snkPNO3BG+veoEGFXrJlhqUT0JJYpwL1CJ+mKsdKZ+BNz85bivUSxh0nmnUD2zQ/x3hzzcY3dnHivbUlmrICwdpSyquD9saP41bElwZuJOQsb3bsJPecbwI87WwX7Q0fsEJRG8MAnPA2Gr3EazTFUEJHjL7qAlaHOsXF+Ibo9z4MbPq2Tb5zHo+6H0BbNdyZb+vwdIr034XwQg4q9TwSKQts4MbilTY9jNuK/rcjDjWL38ovZrTAvNIJukwoSFqfkpziCe/BxJXTcfZ5tTq/oU9Eq8Ka0ZXHLgTgPGubjuQIuch8kEBUmWhVJJV79yURV1s6RgCZlEmA7R8M4/bVDUT+YiMkfVpz3seSYuSXqrSdMAVRcErnOMXmU/+RT2biCkTCXNKO5JPEUNnkD21fkVFNDnsMEC6wIqOoI+jkZFYkgkyVrWh7nqBDt2EzPzfJW/lOttxmXRO3OkufG/J+j1Tkq2+4g==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 14:20:48.7724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ecc3fe-ddc2-4294-8560-08d7e14831ee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4804
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15. 04. 20 14:58, Wolfram Sang wrote:
> On Mon, Jan 06, 2020 at 12:43:36PM +0200, Radu Pirea wrote:
>> Added support for I2C slave functionality
>>
>> Signed-off-by: Chirag Parekh <chirag.parekh@xilinx.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> Signed-off-by: Radu Pirea <radu_nicolae.pirea@upb.ro>
> 
> Michal, do you want a second look or is your SoB good as-is?

It should be good to go.

Thanks,
Michal
