Return-Path: <linux-i2c+bounces-5458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FB954CB8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 16:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F6A4289EBD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A5D1BE87D;
	Fri, 16 Aug 2024 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HhmGG3qc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3F1BDAB5;
	Fri, 16 Aug 2024 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819468; cv=fail; b=l4vtdWk5SzuZbXuvHKk12CrE/9TdK2A2Qw2vMrK9B0TAhwopN8vkijGn3PjXJZGFw36dgXFP+qk1GSuxSPTpdEi1A9BEbrcixqaloc8H8+9tRfA+z9NVBp6ZbW+hKmj5UuWdwlH7bxnOHBIdTXlSiFcn9sjcgS8BlpHN+dSBMDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819468; c=relaxed/simple;
	bh=gw3slFuC955isIIlT15oMrC7xqekrDM6Wfb4e6Yqo9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uVygWHOPR07jchOxdkYx8HrhnqzMCoTdh2txnGLnQ5u6G8SwUigaFA/oXwTZYiK0IJVv5EVg1VVRX8vEhgoaxDNNit3KP1rDsOzrNGU1OaIZMtmpEkK/WmYhry7qIbMgFbTU7A5PstYTe2yIhVPSW9+wFEL1xOrMu3Sm6kkGdsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HhmGG3qc; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F90Tbq+V0upGYodL6Z3NLlCl3SbqQm1//IWjPsTcKlW+Z9xemxfyFelu0CHuEuGCuvvLSN1mSn07UrcwTICmvv1RhXTFvILYJkoS0WHlxGqi3eXAz29oXH+/gvR5DVvub9RNh2YVfDlufOCovzzPhOufiS6E1j24QejFQdhyGZo+QamdfAjrUwRwDdeWe4euexenqewxUTKzeGS+vu92PTOgCBG4E82pdki241eB+jJ7w8P4brBmeat9UFTlT9ISYCUZKjOoa6PUp921oAY4ZjIWFRqS7R1ee8pDNEyEti+W9JJqzmrr8LOJsaEKbHQI7IsPz0t4I4tp7pIJdmx6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svfQzugDudijmma2LsQNR1DWfWHvojczAL+XOqErsTI=;
 b=t/amP3eKCPdzzC/ii6MsXa1oWNdgFMAkhCCS1QusZ3TDZXECZwBKrntbxItGJRnuykxJVrelUm8q1d4+zzbNFM8slfPeCBtkgYTM5uZun1R8Or3bLlfqSloW0Vucij33UG2WPit6WkHufRJUX+XsiLoWjOS93urcxX6O1GsUGVb2DynYLxBUl/IFwPZ1qIJG8UN+H1KBmzidBcHSTqSWVAuBtiZTL7srav+ypmDjDKenCl8FfkLdaPO+b5ywjF6B6pjknRtmI1KmJOmLGJJ5Wvui/B1ZXiwFzaFfMxVKmBLy5xvAE7JEQTpIuDh6aQBLYE75yQOYnCentBnqAZnQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svfQzugDudijmma2LsQNR1DWfWHvojczAL+XOqErsTI=;
 b=HhmGG3qcPK+SMc9cveHGUMywxHwWi6pDUZjBBB06nlncOoxYUuQQGaJspzu/9zXHwdwPzqCELcUKR/iuMGjZSFSSw4SVa3Z/ba5K6Okm0pMHXsKu1bo3vPVNbN0z4seZirGjBr8CzBF26tpQvypy8u/yy7jQFAZzoA8fX8UeNS1QvYAtm2JhaK35qCFL8F5S8McR4WFzGPvWUuqEQw3LrTWPfQvp3iYcby76PjFf/84kwxgXBzqpLuz8/yuaCyONLN/IOx7fOXA3+C5NDxJdN5HT6rdGup7m/3a2rLozCrs8bblGx5gowhcHdt23tTm1qnb8lk3d1KtZD6Sup1xNNA==
Received: from CH0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::14)
 by CH2PR12MB4214.namprd12.prod.outlook.com (2603:10b6:610:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 14:44:20 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::b2) by CH0P221CA0004.outlook.office365.com
 (2603:10b6:610:11c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Fri, 16 Aug 2024 14:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 14:44:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 Aug
 2024 07:44:08 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 Aug
 2024 07:44:08 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 16 Aug 2024 07:44:04 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andriy.shevchenko@intel.com>
CC: <andi.shyti@kernel.org>, <apopple@nvidia.com>, <digetx@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <leitao@debian.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <paulmck@kernel.org>, <rmikey@meta.com>,
	<thierry.reding@gmail.com>, <akhilrajeev@nvidia.com>
Subject: Re: [PATCH] [i2c-tegra] Do not mark ACPI devices as irq safe
Date: Fri, 16 Aug 2024 20:14:03 +0530
Message-ID: <20240816144403.17756-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <ZrYJPdW0-MQMejP3@smile.fi.intel.com>
References: <ZrYJPdW0-MQMejP3@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH2PR12MB4214:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df9aeaf-0c3a-40b8-3d25-08dcbe01e9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d4LSBFI3BIC2sWdujbWK1lqIHncwKQ3V1Fo+f8+FncAzd37txdYSiccHFCvY?=
 =?us-ascii?Q?gdPH0JR3ocr3EHhSMh6rvCmxGIRSPbDtuf/Tu7oakjgqYo4I8phKUnv/5MLe?=
 =?us-ascii?Q?lUv8JyKX87v+vaWHS87Ehv8/SISqozbmk/TFf7dH1rccedL72dXKN4Jqw874?=
 =?us-ascii?Q?m2pB/f3R7jfo1Q17KTKNGFm6vuQK2iR7De1IsS4ehXM1BiVzhHnYpqNQMcG1?=
 =?us-ascii?Q?74CdHhCeH1eehbkg/lZ4hL2Rw625SsSROoSU/bt9hEn+w8e8XYWKnjXQewLf?=
 =?us-ascii?Q?/BTtq2A+BvA4dxt0JIt7+uN6IW7FSKXDISwu6eBo3+8DWCkC3M+GnZ8Pz4cb?=
 =?us-ascii?Q?+Oa2bfQgr7QNzAHUmnQCQrlAl+zMBlYVBSamgHOZarSxA5TGULaxNJ+XVOvd?=
 =?us-ascii?Q?Kzew0q3V3hSMG4YK+a/fAxr1BjFBM1BuiBtTEOnzDKC10L7zZI27vY95piUu?=
 =?us-ascii?Q?i1y8wZ/rVUadEfJ7tEesdJYapAmzFICAAGu4h42kYFzj1BojYh2YJpUk8JmL?=
 =?us-ascii?Q?R7678Ibj16eswuP1lq6oJ6xDaoYznSv2slsaImN9byGkeUvUsh6fcfzWgSgT?=
 =?us-ascii?Q?uwRBA/Tu6rv2lC7fy9aTBc0nCFSydz9YihUXWQZvHjpOQUWNG1FD93aevBIX?=
 =?us-ascii?Q?IbxjIN782ftoMRGuycZglaLW1UxnH/lkGoyjcquloQuIRUFoA0XLVbdyPct4?=
 =?us-ascii?Q?GqtAoaQMkWQeBqVG5v6W+UmL1K+kHrEs1+vyV4//ipSlJQixIR0mLGFrPdjg?=
 =?us-ascii?Q?eTLOtDuZ+6NuKqPlNS6QlFHHRMtxYc1Qmlznw7NKenguZa61hACVPBZMG73h?=
 =?us-ascii?Q?KwPKZ4COWiTsUSET0MLId/TUMpWPPNUBWo2Sh2uQ1Jxvy50Xlr7Udz5y3F2L?=
 =?us-ascii?Q?keIbX6VYeRdYvZXhVyPKO6dYRNTjimdOh2WuMyw6Cbnk6rRBkhkzZCcL31gi?=
 =?us-ascii?Q?LSaYizM0u3PS+NNkRSuhLfFUvWtpNKY7eQuGgQ4Jy8k5zy7UFGO7DOflgzhV?=
 =?us-ascii?Q?itVMz5pDHwnLLBDHtVEtnUrGherUN8I9rXJ+r3ipEvjjKike9l9kh/qdnNWB?=
 =?us-ascii?Q?CA7YT1O7Rx81urZOEvM1eTCT8Gv4fZIuyMYO8JVfIDqNPhK7BeLhptN1lNo6?=
 =?us-ascii?Q?7Z+G4s7hdKhLPkHm+wFmZ+TDghHauPaub+oCZpNuFnxOHwHhOfLCEJjn8x0M?=
 =?us-ascii?Q?9Z8x2EKB3WPjgKcBrj55nEw1BW8OrIHjM5f1PRUEqIK6Z1GNhRKnrrX66vH1?=
 =?us-ascii?Q?0AJzcag2ah6FAQLyLpvE9eJ85qP5plTLp87xFI9bQwbANMD6hRXVPkuJJbBX?=
 =?us-ascii?Q?CyneDmMzUv9qL9NZ2G0raMQZv3H6eadgYOpPMNEl05GDsWq8b8a+OI3jECwU?=
 =?us-ascii?Q?TPg/ZgUcvdjBsi7PQy+isLpSoARTMr/qH8WBVztuctdZRkpOpfQWCm6ZWYAI?=
 =?us-ascii?Q?+8Vubjdo2y04MykzC048DekbBKgYSyRA?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 14:44:20.4926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df9aeaf-0c3a-40b8-3d25-08dcbe01e9cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4214

>> I think these are two different goals here. This near term goal is just
>> fix the driver so it can use the pm_runtime_irq_safe() in a saner
>> way, avoiding calling mutexes inside spinlocks.
>> 
>> Getting rid of the IRQ safe PM seems to me to be more a long term
>> desirable goal, and unfortunately I cannot afford doing it now.
>> 
>> Laxman, what is your view on this topic?
>
> Yes, please, comment on this. We would like to get rid of the hack named "IRQ
> safe PM runtime".
>
Any thoughts on how would we handle atomic_xfers without pm_runtime_irq_safe()?

Would the below patch be a good way? I didn't test this though.

@@ -1373,10 +1373,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
        struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
        int i, ret;

-       ret = pm_runtime_get_sync(i2c_dev->dev);
+       if (i2c_dev->atomic_mode)
+               ret = tegra_i2c_runtime_resume(i2c_dev->dev);
+       else
+               ret = pm_runtime_get_sync(i2c_dev->dev);
+
        if (ret < 0) {
                dev_err(i2c_dev->dev, "runtime resume failed %d\n", ret);
-               pm_runtime_put_noidle(i2c_dev->dev);
+               if (!i2c_dev->atomic_mode)
+                       pm_runtime_put_noidle(i2c_dev->dev);
                return ret;
        }

@@ -1404,7 +1409,10 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
                        break;
        }

-       pm_runtime_put(i2c_dev->dev);
+       if (i2c_dev->atomic_mode)
+               tegra_i2c_runtime_suspend(i2c_dev->dev);
+       else
+               pm_runtime_put(i2c_dev->dev);

        return ret ?: i;
 }


