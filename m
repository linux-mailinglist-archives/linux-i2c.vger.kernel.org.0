Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4163EDBF4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Aug 2021 19:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhHPRD4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Aug 2021 13:03:56 -0400
Received: from mail-bn7nam10on2040.outbound.protection.outlook.com ([40.107.92.40]:53601
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229872AbhHPRDw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Aug 2021 13:03:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buEmB7mZV3XTbMgbFITcnJZzcg/bpcpX5zRp+E3n9OdJA2BhqSxtpGPmIUgBmQWVDULuSlL5Kuirq3+rDsOWFeToKBjCkk6ePSO9fh0g9OEXK8yWXv8neeGBOja+lVkdThgXE9CIAMzLa/DMToXMVvgCHi4fyFojbSWNDf9Qd8KSLcVllTI5tL/gmPwWjEjHAj+2w+zOEbC7fqzE3ZJS8X+Vq1QUP445tNwe8nNTAz6cztgGsnuccFQCUShk61KWaaOOBd3c8aoiKC86vsPeXtOMuYVmpFjDbbxqQJw9450qLR624CtrNTuaSrJ1tbQjTinYYJ151KPT15njeuh+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXaomu+6zCJ7Y6vrNaj2HNeBM3cQygRR0jVeD/vZskg=;
 b=Hjo48KcP6JmOaQKF85A6WOmC2EhM8+mvqUuTreqqr9TxEixGt6+uslWGRbtIGnkr+Fq6gTc0rHo6GFiQzhQ6nDLCPiPT1bMhlic864869vjcTymvdtSBpRqLU/F4d52OP9jap+0gRobiMMhm1jToLe9RmI0gIyKhxE1kjNwZ83ZiXvJt5JouccIGFfGX8+yydwZei1Yu54CIoYNUFWNr58BG5l325gIBePCJ3h+4pZKIZPyljEcVfLCjKvtjFPqJb/GuQq3YSVFukFMyOUCsIOdNFPOM8mxbt3c3jB85BZnq5vM7JsmZ5738Zv1U2g8UTysWQiLwMF5IVUXnU2/q6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXaomu+6zCJ7Y6vrNaj2HNeBM3cQygRR0jVeD/vZskg=;
 b=2RYjG0UDU9cLgqQpPEyun+ETytBZclDun21fC7GNYM8yStB0vGAnGd1hNfp0aqddcMwKN8bG0RROJNcZm220S7iYEPeJjR7tfY41NqX98urObQwQhnNwSMBL03WGeGAkNUPLc3Gp2xC99VDWZVIbCOOi6UwelpfVYfD/adwE22U=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9)
 by SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 17:03:17 +0000
Received: from SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998]) by SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 17:03:17 +0000
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     linux-i2c@vger.kernel.org, terry.bowman@amd.com
Cc:     linux-kernel@vger.kernel.org, jdelvare@suse.com,
        Thomas.Lendacky@amd.com, rrichter@amd.com
Subject: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port io accesses with mmio accesses
Date:   Mon, 16 Aug 2021 12:03:01 -0500
Message-Id: <20210816170301.60207-1-Terry.Bowman@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715221828.244536-1-Terry.Bowman () amd ! com>
References: <20210715221828.244536-1-Terry.Bowman () amd ! com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::10) To SA0PR12MB4512.namprd12.prod.outlook.com
 (2603:10b6:806:71::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ethanolxb27ehost.amd.com (165.204.184.1) by BN9P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 17:03:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a81700b6-eb92-4812-d6ad-08d960d7bdc7
X-MS-TrafficTypeDiagnostic: SN1PR12MB2414:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24144633888FE429761F816883FD9@SN1PR12MB2414.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnfEdrYzj93Pe3+VTXYPaenziARUG3VQR0nbL/cl0K/xCCmYH6R6n6Mjqw2wz2p1YNHMUlZWgKi1IBn2zDefIfOA80umOo27bJBlXmcaxv9RM0PJszlnlnsOG5p2E9oUeeHwM+O+hABLiaNtMP66K6VW10cUbB7psaTBfbW/1OyFm2cxpKlRNvUWBj3AUElG+6P72X6afZhVot/LkQA0n0VcQrYJZyXxImnTC4OOxragzlVIn75LijxF271IH8MPAYZPL/uR5HzDd5i/o+r3gwCqWjd8MB1q95gA9d2tAR6f/bvrtVjRWOMUiZcwqHYiYwM6ziQ8ekPY039BebVp9kx0IbOmRUSr7dLUTMpmAKYqCrpU6kWeqxYcoiiVvs+haaUATtEjRiRVO1jC9h3PlngXnABOBfptuY9GKuYyv+tf2Fm9IQQJ7cwB3fzdI3ZrRu8qEZI9c/1r285iDj14pDMmSiJdfHJrC/eSW8KcntMfTfnq8Kc8/LYAiqgaL4uAMAU3s96vwLm1YfQAlvi88qSi5HbcGKMYz2z9vBwcWC/zo0+GuvMOSu48pIDSARKaoYVhLX5wJqVwvcO93Dn7bfs6sI8GGAi8X4FPM/o/L9BpL3DTwRu2Hu/o4SE7bb2+RE3VoJo6/NTg+RYsLBZA+QeixpozayzqPeaTbVRvoSZmnShb6ZvSLtwkICJWZWNJfbbPxyZExPtpP3b6cdwuKIIuYI9K8zdB6ct+jxW/wdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(38350700002)(2616005)(316002)(956004)(26005)(186003)(86362001)(38100700002)(6666004)(8936002)(66556008)(5660300002)(19618925003)(66476007)(4326008)(558084003)(66946007)(2906002)(7696005)(478600001)(36756003)(8676002)(4270600006)(6486002)(52116002)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2KMEbLLGNo5cw9j26pFr+UvpDL/SRrBay+VADtoYoT3UClYjWb+eksxQZlfi?=
 =?us-ascii?Q?ByWaQakzuZBX7hihzgT6XkglnkuTv5HsDBA8hMZ9DhHX4Xcu4x8QjdC3H63D?=
 =?us-ascii?Q?idMhOx66UDnWehCzcFm4dlpYXDk8J/10FW/QkmlI7GRypk8qknTgcu2syqWg?=
 =?us-ascii?Q?6JY6xg7W+5U7KVlHSTaPAGnFcbefHl8wkLShymW82lSG3ZSU4OvDhQ6eHIH8?=
 =?us-ascii?Q?jJ1I2i8PqV+zOFZOO8g3xQhUWHRXjcPeOqtUgLa0oLAH45TZg8gU0HXHzf8U?=
 =?us-ascii?Q?YzTp9H8rVGU/BttEwRjUTRDloLZRYqyuaB+yhBOnTJ0L9Dqmf18nnPshm9CV?=
 =?us-ascii?Q?IpdsJblk5obSJ+YdvyrR27OBmFocpjS2AW8kkTICEXa6bNIXt8shvqCCFswf?=
 =?us-ascii?Q?tQw6G0q3bR2bdysOYwEeB01Be5VQpZZyqXJ1COJDXJzzhvgRGTnRYst0u7PJ?=
 =?us-ascii?Q?igL50uBCM/xqQHzZFM1R+Lizw9a/8pNV7650935FFl7iqN5FhUxnh5VMqVQx?=
 =?us-ascii?Q?M5c3WX6h071CtkCd+pY0800+kMFnE9mV6eox9wvFvay20zDGh4bKF94R96so?=
 =?us-ascii?Q?GnIAfoQA3juagbQqBbuct4F11acQOjUkULsC/mEQO68mhshzc31I/X/gg26X?=
 =?us-ascii?Q?lp8ldTBfQ3UgANgL0VbcrE5asAraE6VDXfjXZ/Biz11sN8H1DqcGY+L+YNAT?=
 =?us-ascii?Q?SF5uHf+jxAfXXJ07TDL7DOjZKRCPqsDXtsURmnG9PB79d7x8208uTMFtYdt1?=
 =?us-ascii?Q?jG3bD+6vc5PcIrSP+n5R48Fwz8lIjkx5yIyg6th0ikTdIvvskuUX8xouTgxH?=
 =?us-ascii?Q?jTILUP/9c6tp7Lt4VLxcES8AH3D0N5ZgCsLv2c7QAMbi72xQfWZXJ6WezNUD?=
 =?us-ascii?Q?d1p6UsyoqlYbp8m8qOv4XbWkZG1ZgykoKsKt93+486j+5bNKOCdeMUHmRsPq?=
 =?us-ascii?Q?U1pLdSpoH+WyF4r+MFWDfJ23T6UBtPKjqWw1HmM3voeV36bFHiFMTxcV4+Bl?=
 =?us-ascii?Q?auz+LxqBYZJbbyqXRoc/KIEUf7hizWZClzOnGi28232Q2Qxs4yTgSdE8HkCU?=
 =?us-ascii?Q?sxx+hVnElsUKUIfT4tHvScJt+2cRCBONC1lGCo+K4d3SfJCptPY6WiV9JNfO?=
 =?us-ascii?Q?J6ybPmElAH0xqy/eoGc2W7CatP4Tou1ZRDuEhwPQHelVfkF/BciKehWIlb63?=
 =?us-ascii?Q?3NpHR95UU6+c4zv2lN5RddO0SjvHkgIHlZBkY8JEN/UaOR5ASt8DPo4bFt4d?=
 =?us-ascii?Q?dKHlXK/qiaGM/lpFbD6r2xKBrO+Zpkk76J0AyHEkmwsmJYILb1Bkr4V29+nl?=
 =?us-ascii?Q?Q9RnKAwe/kz4ZXcwn7qj7X0N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81700b6-eb92-4812-d6ad-08d960d7bdc7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 17:03:16.9354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JV/U48sRS+sO4Ri7dW1FAM/OLLGO+DBgpzIb83v5XOEtPp0IEoa6hEtlBhrFsTH4ghDFRoBkz6CJ2BwPgC7Raw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2414
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Gentle ping on this patch. Thanks.
