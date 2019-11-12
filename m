Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 470DFF88D5
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2019 07:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbfKLGv6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Nov 2019 01:51:58 -0500
Received: from mail-eopbgr700050.outbound.protection.outlook.com ([40.107.70.50]:56231
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725801AbfKLGv6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Nov 2019 01:51:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFQb7aUvcsbYE/TLOyhcMFHHeIInWB6ftcYCvYkwHY2d4Xw3ETksGT7N5wl5CCACDu7AaupdVBAR+fCetwRV+c0ndMNKP6LSw+0AXpe7N601K7/cJyXPUcUn/3kl5FwsL+kIyJTjmFZolKCnfbZ/ZIVYYToskLI741z6cNiZfrppYWnss80thphS2Ub31+mq52oXqWB49OjHYHeHk21AgB00RBAeBxKaivQWSb3+d0ja+xMsqMnAh7fn7W5bhxM7gN+FYp4hHZYiNlQUfwEUXdggj45V7/l2kVi4UcEYH1BhLMX2Ag2ef05cGMLXFPV+UM6c0IWG5iyALbZCm+KbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Y/GFv8ChfbA/hN5WX30CQfqPTCveSFAfjmY4NSnBGw=;
 b=CAUZX+89TSREWVSH7Aeo6jnWultG0ATDN2WZ+7EpV5qrb31lCGkD5PGm1b6028GJD5yZ/Ozlrr7nBb8RZPaYL5BtcZiInHIsy9bdrIZMiX9cTd/iHvCm0rZ4JKRzRbr7v/F8kJ0d7QzuU1N0gv6nKj7LhbWCmO8DQaGBf3de3P/zar7zgYfDSL+8PicTMYwEnClBkUeYZHxIdUjHWHvdtmyGNi2LWzog4tYQhFJf9e/kFWhwKRtWWg+a9TLUKnP4AT2uBiJHO7M7PcLVfxvCoPq7P+hekfDNJ4KcwdtCvDj6qtpU8/Sc6Jky53uUYG+X70ZOyzv43b1l5njYTTjryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Y/GFv8ChfbA/hN5WX30CQfqPTCveSFAfjmY4NSnBGw=;
 b=mWUa8Ry9oBqhyfw6OAhU091BwPWREDEVFs+qHeKBET3OChJEtVOn0xUXz4JeX2Dho5DrCzwsXkInPJO9o2cgxFCChtm89e0kXVZe1BthZYmZKM1vEHYpYL/hdpLGjkeNywOAV0cZOtz9c5W9ESD93Po7jdivV52LtUz4R/L7pEE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB4096.namprd12.prod.outlook.com (52.135.50.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Tue, 12 Nov 2019 06:51:55 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008%4]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 06:51:55 +0000
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Make the device acpi compatible
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     cychiang@chromium.org, rrangel@chromium.org,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191111161431.26293-1-akshu.agrawal@amd.com>
 <a5f6a3a9-8eb7-58fd-a624-718374c2437f@collabora.com>
From:   "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <f4a5228d-0fcb-c64d-ecde-8dd20c39899f@amd.com>
Date:   Tue, 12 Nov 2019 12:21:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <a5f6a3a9-8eb7-58fd-a624-718374c2437f@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::31) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64cbcc63-b5aa-4888-a31c-08d7673cce37
X-MS-TrafficTypeDiagnostic: MN2PR12MB4096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4096980DE925A5204C49DFFAF8770@MN2PR12MB4096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 021975AE46
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(189003)(199004)(6246003)(81156014)(6486002)(8676002)(6436002)(305945005)(50466002)(4326008)(36756003)(7736002)(558084003)(316002)(229853002)(7416002)(81166006)(5660300002)(47776003)(25786009)(66946007)(66556008)(65956001)(8936002)(6512007)(66476007)(65806001)(66066001)(99286004)(478600001)(23676004)(31686004)(52116002)(2486003)(186003)(6636002)(6116002)(76176011)(11346002)(446003)(2616005)(26005)(476003)(486006)(6506007)(386003)(58126008)(110136005)(54906003)(230700001)(2906002)(31696002)(14454004)(3846002)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB4096;H:MN2PR12MB2878.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMClYV5QHlU1m9vqEjCHq5au6s5OcAgL2UxAX/9/F8af0kmqJNShl7f6V8DXBs99T2WMmzmy7kM+Od7iVbH46N8brtE9z7GJrCY55D/G8APpsY42XDahWhLsBQw6z7/X5W8gPqUKlodl+vSdlMlXexrgnmL+UWwntfZhjhDCk1rlf58gAjhzKwrzPH8sOcqoRmz6L8YmYgZJU/9Lfa2S5WXgmJ6vgQwOhlPbyQ+MSFVvU8dozCvB4Dw+eeyhEFRFqkgAk0klBqyi332iiGW9cI/ccp5C9XM/MvK10tDV5Uye298TsjLq8P0DEMATm20IwXLOO6S7L14R6mg3LQweHm0Vdnwewr5DAKgslYyZrcVb84y6G8wNBRS6sjr/dChAieqIpOsGrue95uoK18VrGm7vHyDVcSq8w3W4yup1sVgmLtzK2JoEK7MWcoDM3Kol
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cbcc63-b5aa-4888-a31c-08d7673cce37
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 06:51:55.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tL7CYQD/og1bRK0XtgzRPJEV2IWsKSjC1vm6mgF4UA7hn2s6gexypNRrwki/akipegdDAtiwL6PiFnZbvifViw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> Question: Is this supported on older firmwares or is only expected to work on
> newer ACPI-based devices?

This is for new devices and we are yet to push Coreboot patch populating the entry.

Thanks,

Akshu

