Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53F5484C29
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 02:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236917AbiAEBhf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jan 2022 20:37:35 -0500
Received: from mail-bn8nam08on2042.outbound.protection.outlook.com ([40.107.100.42]:49376
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235917AbiAEBhe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jan 2022 20:37:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5h2IA22NBKho5FAmklzyYKaE32csLaeO3APv763OxEZ06CwoL3hqxWX/OjiyFh23PzPvLIvUGkhthN5tR5ePdBEsIm+kKSSwQKP3yip1CfIswMUJdoWCnEPcT3+VoWYF0ybN+dyhU2DGeoYdPfltdytRraHo36a8KbGIypggOXYhgQ9ZphDAfUGFi5HSVBvRiSc3pc+lmWlPSCdB+hfvxyKVQtSzdPesvqzYIeSF+snSHx8Qwh1IPjUoiVDEQbCZj+uqhAB6UQpthDkbGjknQdxaKfly16B4LV4iWPPV4ZSgaUWzrMo9/XDsyIR1CEYZIZmUUHTLIOVp6e5mewBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJJKqMS1iBmbf6VNSxUMeGwzNEl451ZwZrIJsIb93E0=;
 b=Azo5kSssrRRBmvoyVt35bapvGxJ3oiNZHjGpNIbtCFR2mYXZgBpAWfLLXueUWbhnfBthduTiztSonD2eFG8REY5DMPu0aaGlCFEzfKlTGN8Ndp6LsviFJpBuqmW1f1CiRVeup+CQJ+3bsoCpBAsKtDfti/qvZXAFYpi5xPnLc7zE9DuV6CnIoHcmsKu/lKaD2CaBdzwBECqLPGqXAWExvwH9rT21SbMkYORyMF5PIJDWUzsQRxXlEe49hE9KKLB6OdYWexKNwtpuaFhgPPLfSvKn2dQLOcJUyg69UwF92aYFPJxdu/v7xMS853smUTukRWePnjKL6QUVRQVptqZiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJJKqMS1iBmbf6VNSxUMeGwzNEl451ZwZrIJsIb93E0=;
 b=x8PWXADrEsLRDSgkMb3CIq3xhKWQTF5mgiQWJhRGTFgy8NeI5nFTRpBLNeK8rkBJMOxclGLVGxCX3xj4GxRX6b4cDCBdD44x8hgFDnKWQ6iTfhZwAFTi3V5SJATb4p3bDudayBDuc/336TrvmKKEzObSpFu0VjXK98a2aBzNi0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15b::19)
 by CO1P222MB0276.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:15f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 01:37:30 +0000
Received: from CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824]) by CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 ([fe80::acb2:d13e:3a3:c824%9]) with mapi id 15.20.4867.007; Wed, 5 Jan 2022
 01:37:30 +0000
Date:   Tue, 4 Jan 2022 18:37:27 -0700
From:   Alex Henrie <alexh@vpitech.com>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, jdelvare@suse.de,
        alexhenrie24@gmail.com
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Message-Id: <20220104183727.95caa694dea38a7ae5fc8c49@vpitech.com>
In-Reply-To: <20211220104106.e4c0e3d95145cc2f2a91c3d3@vpitech.com>
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
        <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
        <20211217195128.49285f55facfe061655a6279@vpitech.com>
        <7fb63895-e8fb-c9c3-c5da-f922ae0c69fd@marcan.st>
        <20211220104106.e4c0e3d95145cc2f2a91c3d3@vpitech.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:303:86::18) To CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:15b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95506c77-2b88-4343-c5ca-08d9cfebf00f
X-MS-TrafficTypeDiagnostic: CO1P222MB0276:EE_
X-Microsoft-Antispam-PRVS: <CO1P222MB0276D14261B5E49172408F6FB84B9@CO1P222MB0276.NAMP222.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68IQeIBqqYZFuiSKO8EO+ZKKFOXpge9vMDyB5aWtF3GqqnTZRYtssRfQr+wmPJcfsbP1ufTWICj89zWBkEejKAbOvYVVNibIIsx772rLYHgJIoWshN5vF2zbSWTmQvmtaBBv+zG7tgktLsLT1CFmS/JT6bMQWUe9pWmmkj99awkb8WPyQ8Ta2T8xdiviGatSysp+L22YEZybfhTuwLZRcDbURWnmEYbb3GyUQIHjI7odDIvhrDxvWi84CXyCBQlAi32OVmm3+mfhv+qxsq+FRikwRWambvb6SQCIFlazZl9ECvaHyjkALjUzNQYkh6J9Nf9yH/0an5UhT0ZGFvzxbG+Vkz8nVrUuJl1SOKjcuwo3Q0WPvr2ENVvLF/XJkXuIe3B712F/W/7saQ8cDfrnlsjn1m57NFddWqL+Meg/F0gFB67DhyCc1yzymFwIyLIchiQiViFrcWhxl8dfGW/BAln42P00mwjCz4SXBtBtteOuqSNuUccSAJuCrYMfbZjUVga3E1nWBDhXRnBb9lCgF39+tiGEgH4N/ICtzkC4epJyl8fvgtINR38ua8iX/tOORoBr+QqO14Q5GmP3gYBFQUdrpReqKZtsZIK/fDv4GgIwH+Mc7DV7qBg3IA6tgGclAsxk90clI7DY3rUAuPc9uc1Mf/9mB94l2PZI8x/QpiEk7qQgV3VDOq6rfYqQNzMQEw2tJO7QDakzUOCugjc/CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(136003)(39840400004)(366004)(376002)(346002)(38100700002)(4326008)(5660300002)(8676002)(2616005)(38350700002)(86362001)(1076003)(508600001)(4744005)(6916009)(66476007)(186003)(6512007)(316002)(26005)(66556008)(6486002)(2906002)(52116002)(66946007)(83380400001)(6506007)(36756003)(6666004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QydZ+rwgXMxDsPA/eMZYii+emaUlJV4Qd+p0ZEZC/EencnkY4NTe5h+l8AVW?=
 =?us-ascii?Q?F8hQgsy9me8fIuNhvd3eZFR1YSh3Wo/hpX0ur+jIPixYt3M5w7WkeKajOQ8u?=
 =?us-ascii?Q?rCmyWsb7MiRxtwJU78QBR+a6+tLyjTnV0KRLn3jYPZMGGL2JnIBtzKP1bepe?=
 =?us-ascii?Q?TzxR/9dBuZQI5GV6AU5LNzIAQuvcw1sPEtu9/ShChdnPfIRYVq2+KoHwJNyp?=
 =?us-ascii?Q?iMB6mdXkXbffD/+00i8OwbJ1FZH2apgKqJo2PJBORTKwrzpEBnXW4Fs0p0J6?=
 =?us-ascii?Q?zdFGElKDp4Gbf2FwGEapsjinJcnIPppNhjFNLcXMQlnSnJRa7XLYzHWSvaGR?=
 =?us-ascii?Q?MNyqf0iNB2VAhJn+M04edBs8W1H2BGWz0AMm0sGcf3VOSM9OasMlnxLZxiML?=
 =?us-ascii?Q?Sq77Yj39LcBJLNJsMEU/GW273rZ3aOcP9ln7Y80hyM4CcFkltE0uPv+cdN4W?=
 =?us-ascii?Q?b5OdEcPEzrEvfKrV8pDDjsGfGGIH11zSaZu1Fynl3MuR4/B2pqS9clmJXcK6?=
 =?us-ascii?Q?wTiokvaD2ewfwhhXF/U1GR2eaKqMRddNXsCTWSHfzeDliBiqkjw+TwLwG6Iq?=
 =?us-ascii?Q?7Bqn6TCd9gi59I9hbrDLCPf/P3dPp/9CSk4J76X2u2WfxDrbHyQq2r5xh1PP?=
 =?us-ascii?Q?/b6hA/vy3hUdIEox9CnxhJ9CL+/mFctFZ93uVLSM2VvyPGcuVJFcavcVU4iW?=
 =?us-ascii?Q?TVECmntQid1TQkrtT4sFGn+JdLuZfJH35jRcf4mIm/zqJUgOvgVRdOlywKlk?=
 =?us-ascii?Q?9E0IYZ86VcFtye0IfnQJfk3Y+KXcN9UK4Wt3N1pAC4twqZCNGLFdlwqzuCpd?=
 =?us-ascii?Q?TXgUP6vlB1deQmcMZOo3yhzeS5e2Xnx9rpG7brJFyaz6VcxreRgQjmWllaeR?=
 =?us-ascii?Q?BcN0yJ0DlV4FBcOBIW+L3HuSe/XwubHbivhkzf3e7vBtg6l0H2B04jwKAgza?=
 =?us-ascii?Q?+LbD1PB1UFein8GxA60XeeZF5JKPM7fjbQVRy9rY1kuLh+C64WHTtMzsUPvK?=
 =?us-ascii?Q?IIUKFgzOS39vcmZHZ1UlOhLjsPsDPmLX/NzE1f7eUqzhOuvhyj8XbcyloTPz?=
 =?us-ascii?Q?lIOHQe5pdqzzcUuyFxTP16Hm5b4V2isuZi2dOVAdthK3eRiXEGBpxHPUerQR?=
 =?us-ascii?Q?dXVszl1PyYDq8CaqvAkmaKltZkcONKwsZoNT4abvreIgBmQ2OvPY3fRnd30j?=
 =?us-ascii?Q?G40LkDXorI0z/Frty6qn7RAnTQNoyilOiWsSoEUTI+5IZI259CkmBLNTW657?=
 =?us-ascii?Q?ZujwuwbmbotqHNUK1h3wax+h25fqsiOp0JpkhJz2ergsv10ch69zt+6DKa2D?=
 =?us-ascii?Q?CxS2PRScVDveuMI/1WJNAjAla47u/YH8XNOp6X4lybe4tRWmPd5/qzyE3sN9?=
 =?us-ascii?Q?Ihoakxtpn2mHHYtapA9gQJn0cHISwidn5R81AmaFDBecHmW0Pc/7KkbaPQ0a?=
 =?us-ascii?Q?otXTlckIGsuPKHq1heMPDxtXovmsE7JnzQzDc+43Xyh3FHu6gtuwxKxQwq5R?=
 =?us-ascii?Q?2QpodMIsu111svEWpR65Ywn0CWHfaS/e3QLBmFFX5hJ+rr7K6wpPaNXd7vDA?=
 =?us-ascii?Q?UtyfWUIG2zl7/SzwQZlMmtCoMQ9b4tGMVVNDacZnBe3+F7j/mo4qxqFjKJar?=
 =?us-ascii?Q?diEPvIp5Og5odm5LCHdor/k=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95506c77-2b88-4343-c5ca-08d9cfebf00f
X-MS-Exchange-CrossTenant-AuthSource: CO1P222MB0212.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 01:37:30.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: per4fvEo7Y79HyvM3Ql5gaaja0lFnXzb/R6efkAcuKG1ui6sjr9oONTMFusGi72YYU41J8p3yqAGSRISycGrzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1P222MB0276
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hector,

I had an idea today that you might like better. In your proposed patch
to share the SMBus with the BIOS, the kernel will lock itself out of
the SMBus if the BIOS uses it unsafely. What if we add a module
parameter to instead return -EPERM in i801_acpi_io_handler, effectively
locking the BIOS out of the SMBus instead of locking the kernel out? I
tried hacking that behavior in and so far it's working well on my
troublesome machine.

-Alex

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 8020b6b97..442eef67a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1629,6 +1629,9 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
 	mutex_lock(&priv->acpi_lock);
 
 	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
+		mutex_unlock(&priv->acpi_lock);
+		return -EPERM;
+
 		priv->acpi_reserved = true;
 
 		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
