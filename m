Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E4916C460
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgBYOtr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:49:47 -0500
Received: from mail-bn8nam11on2068.outbound.protection.outlook.com ([40.107.236.68]:4031
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727983AbgBYOtq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:49:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP4YzS/aW9h4YiH52pVw+qY/wkEUVhRjFMmpb3CizzkySWTiZMzzRd1NvKzc9htSPiWzZtxqdcoxrXMHFyLFznlvgD3gXJ1QLt1QDrNGxJbZpIbjNbHJRtMJFrba45OUPr0UDo7EkOdsB/0ot7I4tOYUVwIp5eDNBfDSR6GyIbYGkooysgHEHt6vMhF0JV5UmeVzDXo0y9/KFcDVupQVPfVflIDo+F/0N9WEAe8EZBWphv07Hjy8IMEw0GQe9mhwKIg/PKiDdqjYAgFxc0cytK1KkgUYa2TykJPrjhs17jdXdj47Ov1G0Hu3OxAgfQoGNkiQaurTkU/8Nxp+ctl/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47gh7gX90B0r3/4QKZ3eFV5qkGoS5wd33p3gg67Sy5s=;
 b=dtXgvwieKiQRyG32kJcQBXruM0onR3kOkpD7Ni5T85qRWYhmfNkVqh3tYzmB1GWLpl7npTTN/8ZhyJdE1W83ngfLvqBAaCFyEh7sMcgVHwwdw+MEfoC1qPm3+mJWLhHQEU0vPnsxKMysEXRjDkaCyL/32CDDStob34qZMNvgLds/dUq+awAJ84LfhO5gG0ZIshNl7AyREkeaIjB6Ssa63ZRFf9Vy4wsg4uhQp2CfyhJoUASPQUdGO3oz6ELFRxubf7c6UROXB6AsEYAkc9+mQY3zlaMIWUxhtmtHRWfCqDsUXsBk2wsRO3eWbal9pPkjSeai8eifr/EbnI5yq7e0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47gh7gX90B0r3/4QKZ3eFV5qkGoS5wd33p3gg67Sy5s=;
 b=svLaUdLwp+h5hwIGFQkR2S/r2Xf87zCVVwtuL+FJb1ZqKAFLFs5GkPnrkNJu9/30vTXnOirkQAKtp8cJPGrjoE15AEfRZqwZHNZN2qNndAt/m7q9GusaunRsOJwgQiTssROqaqX7YubPSWahBdrWeVIC+kbz18PqOrab1ICnibg=
Received: from DM6PR11CA0004.namprd11.prod.outlook.com (2603:10b6:5:190::17)
 by BYAPR02MB5925.namprd02.prod.outlook.com (2603:10b6:a03:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.22; Tue, 25 Feb
 2020 14:49:43 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::95) by DM6PR11CA0004.outlook.office365.com
 (2603:10b6:5:190::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Tue, 25 Feb 2020 14:49:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Tue, 25 Feb 2020 14:49:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6bWo-0004Ht-0l; Tue, 25 Feb 2020 06:49:42 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6bWi-00076S-Tq; Tue, 25 Feb 2020 06:49:36 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01PEnZIL027396;
        Tue, 25 Feb 2020 06:49:35 -0800
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1j6bWh-000761-AN; Tue, 25 Feb 2020 06:49:35 -0800
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
To:     Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <481fe028-0ec6-eca3-7436-ebbb8527f3d8@xilinx.com>
 <AM0PR06MB518514EE9C057CB129079825D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225141357.GE3677@ninjato>
 <AM0PR06MB5185341478B6919A9CC22271D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225143245.GF3677@ninjato>
 <431d520b-24a1-687c-1f4b-4ebe95181a2b@xilinx.com>
 <20200225144146.GG3677@ninjato>
 <4557a127-833d-d829-1490-e76912f099dd@xilinx.com>
 <20200225144821.GH3677@ninjato>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <9b5969b8-6415-ff72-07b3-6c0ee67e48d3@xilinx.com>
Date:   Tue, 25 Feb 2020 15:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225144821.GH3677@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(199004)(189003)(186003)(2906002)(26005)(31696002)(9786002)(107886003)(5660300002)(2616005)(44832011)(336012)(70206006)(70586007)(426003)(8936002)(8676002)(110136005)(54906003)(356004)(316002)(478600001)(36756003)(81166006)(81156014)(4326008)(558084003)(31686004);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5925;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b653f74-bc3d-458e-a843-08d7ba01f2b2
X-MS-TrafficTypeDiagnostic: BYAPR02MB5925:
X-Microsoft-Antispam-PRVS: <BYAPR02MB592537846CDFE6E1D509C328C6ED0@BYAPR02MB5925.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0324C2C0E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+tQ/CuZgMsEajWN9j1sI+OlSP4Zm6i9shPfCvoHA7t/ZN8PtVwuaLMQCE+1/s0x/RAgX8DXgk6WY9Fg7lUWpFm+43iAlKsle1caa7IqORQvYPWEAZmk0cGLomTz2zDxFNtm5NpFkfhTy/0b96G1jSLhvkZwQSUA1ZlZlJUab8ClBehp75HHBBp2A9TSbAwk0vy3oCk1p8nxURobsEG6PgakwPH/Xrp9IDSadR/0T5y6bPU6IOgAll+jK8J5GKiGIrMwNwo6lfNFq5SpSb3JRAiToAJO8ofqObPMTl+19IUAwTtNs4J5imKsahIKE3eU6hcUZgmatuX5hQYPQTHrAFpj4+z5f1eWuxhgRv74V4fFEF9EhPUbEDg9WCLfx8cJ2pdyh9e7XObir7hI9QYFYTsXl8CN4R8b5cQIzswLxcUrM6AqoKJW33+5N1oX02Mj
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 14:49:42.4469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b653f74-bc3d-458e-a843-08d7ba01f2b2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5925
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25. 02. 20 15:48, Wolfram Sang wrote:
> 
>>>> Wolfram: Any option about that multi-master property?
>>>
>>> Not yet.
>>
>> What does that mean? Do you need time to dig into it or you don't mind?
> 
> Need more time.
> 

ok. Thx.

Thanks,
Michal
