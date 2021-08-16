Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252603EDBCF
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Aug 2021 18:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhHPQz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Aug 2021 12:55:59 -0400
Received: from mail-dm6nam10on2087.outbound.protection.outlook.com ([40.107.93.87]:36544
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229587AbhHPQz7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Aug 2021 12:55:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BknRLJoByV9pE4hIddT41e64bTtDVqFx8nHTL1FpTo4vxiROPbhaQygTVpvrrl91wSyPjZBsFNqDpB5IV9WEarLkIhdYpvYxrX78b8FK/yvrDEmFXjZ5nXSi/D58TYAtXL97hFs/DioADjPADXuzVebNrVWpxJO9tp8dk5qagjRj3vaI+qJOcmFltZVfuIRBBICFJ2FVRwbbvyz757cVeb6Byn9JKjBdb06g1nRwvYRx0hkAfqE+MIYI9P+6HKVnD9TIPT019gUOIFuWDmyTCNcP9KN2efHHPH2FyDmKfFJbDhnoe3F315cDLEnUBGXD5XU4eN7o+GiURcehbMMCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=SnlBIua0+9Uc/JQ6pvE+Mt1tEw/lFJ+7RV9olVgHecXbqC+d+POJLcyA9HO04FP+QbMkRHFGydWFwrMYezw7OgGUp6mJQZ343NdM/MhtMXdUhODaVfhzelAKoLQnzltcnD0sRHcILVXtGrSrhdbgFLUt2ZmhqOj74KHppU3/1jhZ2XsLSDwbnC1OsvuhnC5EZ7Lgxq5RLgC3sHh8PkPwP3IIPYPm9U+lMR6SK0+HJzf8EUzAUcdpv04Zkktzqv4l7AmCTnFmCjPLgHbbwLbIqi+ipd5bKLQJ8m5WAeZ1a605EFsbkhPDP4QJVS37Tp0FEWuyuxW+109Hz+KsCZwjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=eS5N34I4TRphZCHvHwqAKK/1czu8IZOyf7U2hJCv0LWjXKk1Wp8cXYRGNX0dqG5txLajnF48toZSxsQaTsCK8ZV9m84QSEp4Nf9n3hLCPeEZJdWRdU0Jt8j/a484imzw2gwhWZ5Z0KBBlOUKWSKWTffRbgb4bsLTY9hY3Uyoq1g=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9)
 by SN6PR12MB2637.namprd12.prod.outlook.com (2603:10b6:805:6b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Mon, 16 Aug
 2021 16:55:25 +0000
Received: from SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998]) by SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:55:25 +0000
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     linux-i2c@vger.kernel.org, terry.bowman@amd.com
Cc:     linux-kernel@vger.kernel.org, jdelvare@suse.com,
        Thomas.Lendacky@amd.com, rrichter@amd.com
Subject: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port io accesses with mmio accesses
Date:   Mon, 16 Aug 2021 11:55:09 -0500
Message-Id: <20210816165509.60087-1-Terry.Bowman@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715221828.244536-1-Terry.Bowman () amd ! com>
References: <20210715221828.244536-1-Terry.Bowman () amd ! com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::20) To SA0PR12MB4512.namprd12.prod.outlook.com
 (2603:10b6:806:71::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ethanolxb27ehost.amd.com (165.204.184.1) by BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 16:55:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ee3f693-213c-4c6e-7f8b-08d960d6a4c8
X-MS-TrafficTypeDiagnostic: SN6PR12MB2637:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB263740C15D47FBA1B3C08FE983FD9@SN6PR12MB2637.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xeoQw59XtQvjCySCdqlynIo0kamgmF7zuIbhaelAW13ndhsHi3WTWFt5CbNNc6D99FW3NMKR9rF6KVTHamfaGOzx4GhvH+dTPQcYmRDAfOyNcUFZLa4cRbRH+IpCG2Cb4ERHnO/CItdfEBD+92dMU59uu+x9KKrzFymUCKDBvmPUifxaql7oxAk59B70zYvPJn1y2jkWt7wytauB9TK2QS/w2g8W+gm6ruflEm1XrYJARW+LplvW3dBusVZIZ0sJ1a003JzkE1Nhtmdh/T3PypMYNz/zitqj9CuOYGVnGNos7tP/sBM/qRJ9uh+ldGb2b1f8FvtZSGrqipRnXwuy8hjRwdryK0yepvAtrrBJ7CZ76SZPG8bTTGhSNjWzuv00GefBGPkkrPdDmQYAJ1ZfI+WvKCb+NMRXtVbfdDk9OFc4K7cAA89yYQyGqo0bxMfTXNsgVOHRyiVkubIqB19K6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(66946007)(1076003)(6486002)(316002)(2906002)(86362001)(66556008)(4326008)(36756003)(66476007)(478600001)(2616005)(956004)(7696005)(4270600006)(621065003)(73894004)(52116002)(6666004)(38100700002)(8936002)(38350700002)(186003)(8676002)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJYGLbPyzQAHhUDQjF1QlUtdCnMzyhtJOx7RJMYNif07G3Uiju6UyztFyHXO?=
 =?us-ascii?Q?75F1kapPU0q61dOhNYmZcPtN+8ainDcgLfdawNLxx8M82/JbrV7cnyXHx8ec?=
 =?us-ascii?Q?qBzyKNYxyNJCPAAx/QQAHaeGsjRg7Qg/WdvRuuR3gpDpzjUDJUK29K4cM9gg?=
 =?us-ascii?Q?8BivMrv0WvZqG1bExI1WXJvep0LX5+d0pClypSIq+dL9hKrwA4OjvDhYE6EZ?=
 =?us-ascii?Q?qVLdzqGuyThl+v892EyDlF9QBhjzndXsc/X1L6rrC6SEhoo4IOdXSGT+7l3t?=
 =?us-ascii?Q?x9zyx04kKAh4PSGTAZKA5xixfLeSoW6MHqJVSRoNEsnJTxXHGV3OeCeU8TJS?=
 =?us-ascii?Q?vzHkrp1mUAKa4QIbGbcYSHVBH3fijqk3C7X7GuWyuJss/00g7fU9KThQVvgI?=
 =?us-ascii?Q?ABsoMu393XL6Vqmrov6B71BUr3tngwVF10OL837mMt+GVgKexZd3fyMRUzHo?=
 =?us-ascii?Q?9fByAoRfV5KBEsBL20EjXf6ZeDXUW+9PsX3fW1VHr8a7uLxfSWRFLkXpGuK2?=
 =?us-ascii?Q?AIsfNClrsMr85s/OB2Hm/5ka06FjqxueIkBB2KaByoWotMhOqKuwJICmHjNK?=
 =?us-ascii?Q?OAAZgsnUNLCCS75qJapHz0bqh0gq57HUO95yv4FwmqpTA9mUQ8L8IaLxqsdr?=
 =?us-ascii?Q?JU3v889iP4vdoWVdIghzUsWdiAUlx/pnh857zuJzE4wsn/8xJc294GyJjPGU?=
 =?us-ascii?Q?tBgdQTqMEvuvcUStbYRHA+ytvaL1uuZffat7dRc4hdl55kKvwivxRQb+IxgH?=
 =?us-ascii?Q?5qqP43MZzkhUfLF/IpkNJ8q5qJHP+Jwr2wfBJLpLqh+Z4bvpz9qXcvvGQbor?=
 =?us-ascii?Q?HnX6dbh4J9II5Thp2AYsyGBNGyUYyiCzg85RLDIj44uHBT2RiG36BqUFwKL7?=
 =?us-ascii?Q?0bArPtmMa+eOfYfPVKSQJ4B5vR+MFBAYkQ1o81OWu7KV0Em3pI3cI9vFHtoJ?=
 =?us-ascii?Q?H8SiOmcRZ8KiLy53iSX/rvVZdJiOwV2mKlrjVvob0qZ7f2qs+nvj8xwHAgFm?=
 =?us-ascii?Q?2KCuiif8GcUVdtuRneqS4Ge7JLmZ86QWIpfkDoojc29yIu9NJhBlPszlS2Xv?=
 =?us-ascii?Q?s7g9vmiT9t3wXzO7ZsMksw3DpENHUbjgcGZXMEZX43H9gDzL/qwJvdCw24zN?=
 =?us-ascii?Q?k2ohffJWH4dxfUO3PMAzI+tLOb56HU8Fq1rYATpT/Fh6R0jMAO1i7r5TSLVP?=
 =?us-ascii?Q?S9VF/4EV6tzKmTcXRrZYGcAeYdSm1iJWnLSB6xiZ7sLzfrx+S+uXirhrHknd?=
 =?us-ascii?Q?HNHPBjDRK/7vetOV7mrppRtV5/6imkMFOzeManyCaPJHngyKfwKTepod/U47?=
 =?us-ascii?Q?xRlsc1P6Uln52u1/4PumNEgZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee3f693-213c-4c6e-7f8b-08d960d6a4c8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:55:25.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifp7RmuW9T88lD7+GN2s+FhCC35Y0x2aYTX4oe74WZfty68R06plPVgy9TUEOEWTMgKa6YBSqJqxI2vQgpVbcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2637
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

