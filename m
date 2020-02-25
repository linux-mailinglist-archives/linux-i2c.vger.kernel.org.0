Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0999B16C414
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgBYOho (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:37:44 -0500
Received: from mail-dm6nam12on2075.outbound.protection.outlook.com ([40.107.243.75]:6212
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729436AbgBYOho (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:37:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4YVFe5D0GbgVT4ucViAlFYmjo2uotW3Fwhl8X5Z78pwM9cOSUNT7vaLX5/eCRjIV3l74OTAE7BR/MUx7MOl46gKaRz6hj0qdovyywSCJ3sN0mTBO6tcXsRdxwq1RoHWBMeaO01WEAE/egK+N4kY23QQHY/hKsxVarzrquwv0JMT4XQq8gBoV3xDjrGoEDGw7wxsfWhQ1YuHSGNyyddIkJbs7tRVey9dYjx2gtrWL33K5yJGF78EPK5jxSIslOXcnhIFOHmBioHMhmlX+iMwt5td9c+1d7zLqFoQt9YVct1PnPAjpZcEVjw68O8cycOvAUNx7g0ckHMSUENKveEMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCPvYOebrfSiXyw9aaK2dEMIknyAyZ4UBkYLMcOr1+U=;
 b=Yu683l+Q4/CvLFWF97NMHRjYYAPQshkPAMn74ks5yR3Pu8Jzv6penBvUeRxF3x/j7ZlIHTtWtQL5WcKW6kELZwzhN/UiML4X8FptCtCOX3aYcl1dDJ+xFSd0xPA8ARL7l28g3XWwku04BgTNeGwnLQkc2M0Nylwk2q8Ds0zP8O3LEQRcluv65Vw8YPi/J1t0gm4BLF1ddEN9QqTRBFbzF3Ta40WKTKgf5pU1vD5ugADEl1q9k2II4xN7MSnyoYTOGQcJJ4KgUtMtEv3IRoJgnJNihf/mgew50VLoQYXC+Sp9igzwWETDefRpcvtIXdWgHuIF3QQT6NsDYKcTRITB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCPvYOebrfSiXyw9aaK2dEMIknyAyZ4UBkYLMcOr1+U=;
 b=dN2ZO+2GtmwJopjQPgSQ/sve8riK6DsB0egK7NONeSC1eP38KbbyuAK1zZ456wnN0CYzD9oSVUQ0Sf4EzfioIcV34BWQLMzByzYKyMAaBvQQx0IenRmSxoAvMt58v3CBeCRiVCY+6SJ11I9yqaItCGy+xS6qfSWYk5c/u3SrHc4=
Received: from MN2PR22CA0003.namprd22.prod.outlook.com (2603:10b6:208:238::8)
 by DM6PR02MB5404.namprd02.prod.outlook.com (2603:10b6:5:34::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 14:37:40 +0000
Received: from BL2NAM02FT055.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:238:cafe::c4) by MN2PR22CA0003.outlook.office365.com
 (2603:10b6:208:238::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Tue, 25 Feb 2020 14:37:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT055.mail.protection.outlook.com (10.152.77.126) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Tue, 25 Feb 2020 14:37:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6bL9-0004GE-44; Tue, 25 Feb 2020 06:37:39 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1j6bL4-0004Nq-0x; Tue, 25 Feb 2020 06:37:34 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01PEbNQS021270;
        Tue, 25 Feb 2020 06:37:24 -0800
Received: from [172.30.17.108]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1j6bKt-0004Kp-NM; Tue, 25 Feb 2020 06:37:23 -0800
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
To:     Wolfram Sang <wsa@the-dreams.de>,
        Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
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
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <431d520b-24a1-687c-1f4b-4ebe95181a2b@xilinx.com>
Date:   Tue, 25 Feb 2020 15:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225143245.GF3677@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(44832011)(2616005)(31696002)(426003)(8676002)(4326008)(81156014)(26005)(186003)(336012)(107886003)(9786002)(8936002)(81166006)(70586007)(36756003)(5660300002)(4744005)(54906003)(110136005)(478600001)(2906002)(70206006)(356004)(31686004)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB5404;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49c960c5-e1ad-4bc9-3acc-08d7ba004401
X-MS-TrafficTypeDiagnostic: DM6PR02MB5404:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5404A03E2867206D74ED9BCBC6ED0@DM6PR02MB5404.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0324C2C0E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SFXlEhNP/L10p+yGvtcUJLKIfi1/0F5a2nhzOLS4u0/oVJ/3f2ItKZV/T3CW5EQQALGF3fhuMzFb7hGVjhR9qOgmNwgmqe304xs3IeHt62T5ChSS+eZbHqUlPiWfk440m4sXiVN3ySIQ7HeaUvBLBR+VgLy3Ar+e1bRkNSFruAhRbn39q/geiDZib/MjOrd9PKAlzFjf21IieDkgQIDO6L4fzynI8e/r4zOEbGByLyFCSWYbmKPDgDujxtEI+w4iQ64meHf+sjwgwNTXOtBsS3CTQQDkWhanj9PUwZgui4U7wqgR4cLfGzc+H5zaCC89pt7NSskVo8Lcqm8VTkRzlT3FOVedBec6hwnDqTosinDijiwgQGkc5QKUNW9BNDV+ZeMfuxf25TdbT0Tfs68TGZ13Z88qyXoNzNkVegBon3rSyOPnSUSP71bOSsvagsqV
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 14:37:39.8180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c960c5-e1ad-4bc9-3acc-08d7ba004401
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5404
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25. 02. 20 15:32, Wolfram Sang wrote:
> 
>>> My favourite is to change alignment to be just one space. Then, we have
>>> a bit of overhead now, but never again in the future.
>>
>> Ok, I will add that change as separate patch to V2 patch series.
> 
> Perfect, thanks!
> 

Wolfram: Any option about that multi-master property?

M
