Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4010780A6E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 12:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359212AbjHRKr3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 06:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376435AbjHRKrE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 06:47:04 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5CC2D68
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 03:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUKUZ//pTn+ExcJX8Qd5YPqxIL0QSAg5deM96fEIR5qoAYNLffPYIsJWWh1LT/GG7j2wsvWXaWEqPE6zA+7ax8HQdccW9ajcIPAySyFBDlKX1LnPAdJd97YjDcJ4ppS969zAoUDc/lLirrNO8kpU5LGuYNBHd+okT4bvDQoZpZTpxowToj0xRscecbV6/0eGj+JgIthzeYsXPP0Lrw3gUrV9wy67S+obNr7SS4Mw43gGniKJqSvUUZACNr+V+s4xkdTKVIdnjRPOEoDgbSCsWFY+jonIi/l1/U8qsKLa1Ms2fK/wt3Ymn2iMYrMXDUGWm3amkZifkZ+TVqM43ITGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVqa18Jba7wgwp/6oLblNGJ9GH9m5/FDPmVBzQclZLk=;
 b=RX2wR0N68lGkv/Qyns4rkD0Ble/zeFimnds04BYuieHAQKpGnQ3Ka4JNzCnROPsSj2N+p0UuRUMPKuZDP09tNXMRsInQ8P6QzcxfU8kjfWUjDdYsf7j4zme5LbIob2/xWtbhPKU8940OxCP3a5PTR8c24ZRTdqUHNoT18j5hEP9dcEwEQoQn16tBXhkCE7wBB3WuMrsSDfLQ60ZQ5kKQ7jECrGCdFQznitCA5usI31RkMECbLRpnYQiU6VaDw1hemKaFfnbQEQ2VeWzXpFRnGSA/uYDis1Il4mLcnGLtdzkI3IWh2WnFLMKupKsC2MKb4zlHq6m8Y1VtrhSjTK5tIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVqa18Jba7wgwp/6oLblNGJ9GH9m5/FDPmVBzQclZLk=;
 b=CcBHAmXflApt4ubGECVFl23fS5h8gIwXcMX8mqhDU0xUiq9yK0MYbQsZJMoBVqKo6eIOSycmU4QIQpO+/4f3MFCln86X1Pq9RV8oo0eP2UtjvRPVs6O+DtUbvOuZOwa/LztmjKAJbf+MAJVuhOmlJQQA+j2piyQ2VxI+uniKX2g=
Received: from SA9PR13CA0112.namprd13.prod.outlook.com (2603:10b6:806:24::27)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 10:47:01 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:24:cafe::8c) by SA9PR13CA0112.outlook.office365.com
 (2603:10b6:806:24::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.6 via Frontend
 Transport; Fri, 18 Aug 2023 10:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 18 Aug 2023 10:47:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 05:46:56 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 05:46:55 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-i2c@vger.kernel.org>
CC:     <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>
Subject: [PATCH] i2c: cadence: Fix the kernel-doc warnings
Date:   Fri, 18 Aug 2023 16:16:54 +0530
Message-ID: <20230818104654.9604-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 0529eb4e-944c-4390-a6b6-08db9fd87405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWbuod7ok7vDh2XjnF36In8BgtKSzdbqZhlQRHFXzGd2Y9vN5BFr+GHJB5S9bCcjimPbU656/EEiLB11e2nwnxr2QFkCOjeff6dAL0NpAS83JBVb69t8Sx1Ij5LEEHHX6iVfp9xDjOS6RxNU2c1bfIsn+r8TbydmL2bsjF+rK1OOn+g6IIfhv77h4n+3RFrjdCBwSRy7DsQPV3VUs0uxN9P765ea8+6Phu1nwGhNvoqV0Y/5KhuuDdJkiiMIZsPzY7B+7Sa/iq1AeWpYbHqRfYDmoeCRnk68B51090pT7yIVvvpx5dc+01ketYSJfz5xp7+zzrwzbc+BJbHz8mtMSV0sEl0HdY0CIMNdIL552qLQj4XZJibX0mHcV/1A/ayMLLI6v5E7jKB+LKHSpfPcSzgHlSli7wMl5AB1T+gLDUo59I5qGRmSTE/w1JnCmE6efiOM/mG/t3lIfkQypvKvCxlKxSYDBK/y6lkCaNpOgtBRHtVYMXaSwEBsMG/cakAEZUePmkW2yjckNBIoMGq4biqxE/8wpeEXD5eTo3QMym5dqDvgbxEwQjhdBHSnJEvMffvlU1zR0SsOQNR1wilAENtrxNZ4nmerFyY39SB47igK06Diu647lcJC+Y4XuJnTCTpZNji4nS+J8MTolfTUuuEYA6EQdT1Vi6kzp6zhbggtnwWWVOs+opBSUpl95w3iLnDz+TYZcbgV6qhfS1reag6CuoVrwx3qdqmN9XP1zsrDZ+IeQMzN6SLFBp9vJZejtlOG4gOK+oS9l5xZlq6PCw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(86362001)(336012)(426003)(1076003)(26005)(40480700001)(83380400001)(36756003)(36860700001)(47076005)(81166007)(82740400003)(356005)(2616005)(2906002)(54906003)(316002)(6916009)(41300700001)(70206006)(70586007)(44832011)(5660300002)(8676002)(4326008)(8936002)(478600001)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 10:47:01.0555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0529eb4e-944c-4390-a6b6-08db9fd87405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This fixes the below warnings

drivers/i2c/busses/i2c-cadence.c:221: warning: Function parameter or
member 'rinfo' not described in 'cdns_i2c'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308171510.bKHBcZQW-lkp@intel.com/
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/i2c/busses/i2c-cadence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 9849f4502570..aa56c5704d93 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -182,6 +182,7 @@ enum cdns_i2c_slave_state {
  * @reset:		Reset control for the device
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		I²C GPIO recovery information
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
-- 
2.17.1

