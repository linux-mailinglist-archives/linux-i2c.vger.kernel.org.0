Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF4D54ACB4
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 11:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241913AbiFNJBZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 05:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242393AbiFNJBY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 05:01:24 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D222E9E1
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 02:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJW7RL5WWicaOJdprIB7tvDGN1DlgggI96TjcD5hyZmSm/ZgF6da3rqUUIkLlNai7DAbRP07n/S4UPzpXsvi4hsNDRxWJGFbNMUzftkRMgDHjwvUIm3NTlYESVvEoQG5GTv4Heg6VwTPPdXJfcQ3nRF/9b85DpqEEfcHCh7PVEunlAg+LT80uYa5faLIh4Y1WzTacZBhIby7SW6KdXVUtvtHuyTQZvaWYLKdAFVrPjEwo0S7o8ZnXshvVpCqBMwOEe1Z+euG6/gg7VVDbP/HbL+CB87a4XyzUClQnmIYaU29DbenhoX7vH+0s84+dJbSgs9LKqU0mn0dZO5IBryAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNTY+zvyy1z9cAFdJJc+XBXTtcq0QgI0QYBKShcu5RY=;
 b=ieLZySksU/ZTeqUzxAl0hCEqULCu6rM9JCsC/1SHjnvVLsBr++1IW5Noa8TonU7q20Ft2sj9ppHUF+W2LYstLZbRO3yMhVUZKUkkO8ZwjG/hX2evlO2mQRZ4TxB69bJdyR7h+ukUVz+Nzv2xpZ4gBEzEjat1GBqJuU6LXIw30e68SU9ZeUpurKE1y6nrRktZloxReE9ekVBoYkCF551ZaQ0BJWzpLtwsjegPwmOSHTlOm2TaursRijwW5w8hN8B7pXCoqKUKvj9+K+ZS80S+DJvsJFXPn07lLA9fxWrDCX0XpzdGCyB5FtDQTY+TM4Fyl4N3wEdvFzjN4tdioSWfcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNTY+zvyy1z9cAFdJJc+XBXTtcq0QgI0QYBKShcu5RY=;
 b=SUrItWgumzZNvjPEdu0dHm25crKAquQzoOtf3QH6C/iNhZdm9pskwcIwaZ5tphMZBuJkBqkxA9be6vg9I/Wsm2YUGWeJ4AX86zn65+MBnLQ0iDZCfEAOmr55Jh8e5HYn1injjdX6x9NH0AXAt7q05X+xQ0mWv9gsrQEvZjw42qs=
Received: from BN9PR03CA0358.namprd03.prod.outlook.com (2603:10b6:408:f6::33)
 by DM6PR02MB4443.namprd02.prod.outlook.com (2603:10b6:5:22::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 09:01:20 +0000
Received: from BN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::c9) by BN9PR03CA0358.outlook.office365.com
 (2603:10b6:408:f6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Tue, 14 Jun 2022 09:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT035.mail.protection.outlook.com (10.13.2.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Tue, 14 Jun 2022 09:01:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Jun 2022 02:01:15 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Jun 2022 02:01:15 -0700
Envelope-to: git@xilinx.com,
 wsa@kernel.org,
 linux-i2c@vger.kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.254.241.52] (port=60016)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1o12QF-0000hY-AE; Tue, 14 Jun 2022 02:01:15 -0700
Message-ID: <13495a35-ab34-df19-d0e4-686b1745a1fa@xilinx.com>
Date:   Tue, 14 Jun 2022 11:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] i2c-xiic: Fix the type check for xiic_wakeup
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-i2c@vger.kernel.org>, <git@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220613043002.28152-1-shubhrajyoti.datta@xilinx.com>
 <YqdPtexPiukMlUcG@shikoro> <36da7a53-9bb4-26ae-0ac5-1ebcdf0ac695@xilinx.com>
 <YqhCvJdWw+g9ZZFL@shikoro>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <YqhCvJdWw+g9ZZFL@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd52dd7c-7861-43a4-4b8c-08da4de472d4
X-MS-TrafficTypeDiagnostic: DM6PR02MB4443:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4443CB531AB87E7FB50E4B2DC6AA9@DM6PR02MB4443.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0S5rVoUBF5ynJ708JnPVDJSTKc5MhDjKh7LcdIutcI4BWaguezio2YB0sJU8zUmgzgbkd7JXOWBfYdgmqe9zA5WZQArJ6mK9+6vyfbxvx4rWyzBGRyDR8sAeSIlQulfCGv6ntMYqjC/nUnH0bqpjc9mvQjV9TWQqtp4Wi4DssOfXogFM4+x51uoWlSTDCYb519Y3vt8YFGyq7ypJcKiUZEB50z0DKcU2EKPYezc39gJ/rh2WofP+xUS0J3Cl2sgqr9Ew5R4AMKhYCFxsOkvYX/DZXvTfhhrSdilQ0IhA5pYKhjIESsGRP8pfhM5QHtTfproVf2wLKak9N65afRJWJel8WpvdvjlkdHM6gEN3qOXwX1Wp6RSYwSaW3PzJb/3APpD1B2bfnBBp3cO3Scf7Mnk42AJwbznDXpmfEBd8ZvVnDiCoCQfm66tfcHPhmkP9fN8lG5KQItiraY4Z3O/ul2Ut6FNEBBtzWKzUapjP38E8GfTsA0KOv0PlCB/9yorIC7GTPez+GC1HHDHj6JzVB6+JtKiHA1vVyHBKPQU9TLk6blpy8r9myHepwJL85cCI6V57+4/JS3Htli3iSsJDmQTo5WsWJ9Eo13CMLiuEq42RBaO0a3hogCCKRLoEbEoEcrQFb5SEbiFZfnyN3q0O46wabegB6CKPzZcw9hHjpBcH5YnaKPB8rPTbTNvGySdkty4Pj6QuTVWoZMLsOdt1cj71uOtbsMgCtXsG8ZokL+E97izIpwjcv0llKUNEp/XASwC9B6DEO1xkINtfuS2R2WZOdbS7BqkFeF+Tz0Y6EGwVpOZX0XMtsReKgD/TPtR
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(4744005)(44832011)(9786002)(508600001)(8936002)(5660300002)(31686004)(356005)(966005)(110136005)(40460700003)(316002)(31696002)(7636003)(70206006)(8676002)(70586007)(336012)(47076005)(83380400001)(53546011)(426003)(186003)(2616005)(26005)(2906002)(82310400005)(36860700001)(36756003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 09:01:19.9338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd52dd7c-7861-43a4-4b8c-08da4de472d4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4443
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/14/22 10:11, Wolfram Sang wrote:
> 
>> Actually this was recommended by Greg in one of our thread here.
>> https://lore.kernel.org/all/20200318125003.GA2727094@kroah.com/
> 
> It is in the C standard, so any compiler not adhering to it has a bug.
> It is especially not important here because we use the enums only
> locally and do not export.
> 
>> That's why we started to initialize all values in enums in our code.
>> It shouldn't be really any problem to do so.
> 
> It may be more readable if you have dozens of them, but it also adds the
> possibility of copy&paste errors.
> 
> I think I'll take V3 here.

Ok. Go for it.

Thanks,
Michal

