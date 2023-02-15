Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18BD697D74
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 14:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjBONcf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 08:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjBONce (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 08:32:34 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE071BD8;
        Wed, 15 Feb 2023 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBmsI3CyctQINLt4U4skt6YcYqWfUcsOm2HO45h9/v9JjBJjIWdhop1JSvKM0fieypkVlE1Cn+ltBj8lNo9YvNtOo1JamYK3UzSWakrSel3KBhPAHC2YKpevuT3rBKDRl53PvlfgKvrQOO+j967unXK/MJMQBUELLaxRI+4IU2hOWOqbwqIT7FeKb51BzVs8dn/S5um/ZtHwVF5mzP7c0lm8xoaW56wdiZN2XaLagqEULBY1oGDF2RnRnEhH8rlqSwh20ZZtXgG+0Z3JWhf57dfQ4RzdFEMtJEzPunQA+NeQura1TLgZou904IkUbHKsnpokSKIoFyaYQEHT26sMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv1CuUI3ZsLHT8oTzKS8jFsTwH7pPnbP3caCYDIuDfY=;
 b=JNyDbPb/8kVKJv2LPVg2Vz21AC5r1bP8qIPdE5n2A8Ft131iECT1K35403+gdnmFJ59IChOe7ENaKYQw1BLfR9jptaiwF5q60coevGqnJRCO/wfn7bY8/Xy5cIWwi0vwIdP/agi4UaJRP4AwZaJqHxPrX+cWSwoqKQLhUTzceNvO4wRtUfHwDGHZlqUQ/fwDyWjut5HC5zqKCGD+W5efCb87YYAk1Zz7h1CxkNVZf2zHavqLiwFOqmrYytUdF8zzf4Fg9iU0Dw/P1geC7mvsLsw9a+FjuO/F1ClCXH9+O7JFl+93foOHtbkHICXPIFGuWWy/sP3Fu7vHMUq2DcOfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=amd.com smtp.mailfrom=xilinx.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv1CuUI3ZsLHT8oTzKS8jFsTwH7pPnbP3caCYDIuDfY=;
 b=Wt2hnuQSOSpmKy0yJaveJ55+z8wpF4xbS5Gf9Rgu0ytkoTBJ1bhFKqnODmNENDEnNLcRGqmoqda6ZU96k+BCC5nh7GGfOD6ZsCQm1vKTY6VZ8qDTRXo3FoJhQN21AUV2rnxDQ1qXnp1Tp4a9Xj1t2UvLO6wR80Y5wjqEFGn7cJY=
Received: from BN9PR03CA0081.namprd03.prod.outlook.com (2603:10b6:408:fc::26)
 by IA1PR02MB9229.namprd02.prod.outlook.com (2603:10b6:208:427::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 13:32:30 +0000
Received: from BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::38) by BN9PR03CA0081.outlook.office365.com
 (2603:10b6:408:fc::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.27 via Frontend
 Transport; Wed, 15 Feb 2023 13:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT009.mail.protection.outlook.com (10.13.2.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Wed, 15 Feb 2023 13:32:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 15 Feb 2023 05:32:27 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 05:32:27 -0800
Envelope-to: git@amd.com,
 manikanta.guntupalli@amd.com,
 michal.simek@amd.com,
 shubhrajyoti.datta@amd.com,
 srinivas.goud@amd.com,
 manion05gk@gmail.com,
 robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 andrew@lunn.ch,
 devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.64.3] (port=42317 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <manikanta.guntupalli@xilinx.com>)
        id 1pSHtb-0005Bp-8k; Wed, 15 Feb 2023 05:32:27 -0800
Received: by xhdvnc103.xilinx.com (Postfix, from userid 90444)
        id 617BB1055BA; Wed, 15 Feb 2023 19:02:26 +0530 (IST)
From:   Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To:     <michal.simek@xilinx.com>, <michal.simek@amd.com>,
        <devicetree@vger.kernel.org>, <andrew@lunn.ch>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <git@amd.com>, <manikanta.guntupalli@amd.com>,
        <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>
Subject: [PATCH V6 0/3] Added Standard mode and SMBus support.
Date:   Wed, 15 Feb 2023 19:02:21 +0530
Message-ID: <1676467944-17426-1-git-send-email-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1NAM02FT009:EE_|IA1PR02MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b11f0f6-19cd-41ab-05f7-08db0f591659
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JGzltlaCr51/oD6t/e11FN1zm7yFJji4nrq/JqKYsJjaCWViZ2Aq2mlisXg8moOu9Stsamvd3u9hgTvf/vjgLi7OzHg/2z5KI/ILRlennWqmvXwaGNrg/dSjgpoxZz8xdWaivvI0WKJz/Sc76vWyqGRnwa7Oo8NNrVmAGQGISs2Oc/kg2TaJtDTrA8BnRUpG6/DSjcV4i23zHJCZQx/l9yWuIUuI9nQmkeQOiaTeLCJElJ8eWm6HG9f5mfmppQf1fA4WpCccZa4VrFiZRdg/mrwg8auaAuoXm18sg2G/8gxPKmB5SywaZH4rQiDDL2zrI0fDxNwMfHZVxi31FnH6Tve//fMdaC3GcQuy8L21eddgqT6UR1qYWWCq0cYvdlkuEZ/BGXiQpQgaXcFuXXcYeTdhDVVkknK100itvi6MBG2ql1VI5r4YlNrVpC1UHs+mgtPogWm7WlUBw7zrQHw3sWEChYrJOJuQoeHDO/NtJvtekoVJI5RJemyidtzZrkI0DWwo/8fpKNzzq+CFCmjnymGWnlzo641wOyDY8pNfeU/dm3TzYETf/rI9FlQTG3RsHVMeJWV6klShRCIfHGHGhE/rWHzp++qwoGdjGSwPeql416OxM/z/tAa5BVlfvu8yVCIotHibXY6Um/EbRv6Rd2hD6NbzEcmqUOOctgnisT/LYe0gbLd9Dx9kEv9NTOfpYXdfhKVAA4lr9cioNUlh5egpehPblPSc1VNMCqJqqFDPEWTV2KPhOvURk4KsaH7
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230025)(396003)(376002)(346002)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(336012)(42882007)(47076005)(40460700003)(7636003)(2906002)(82740400003)(82310400005)(5660300002)(7416002)(44832011)(356005)(4744005)(36860700001)(83170400001)(110136005)(36756003)(54906003)(42186006)(8936002)(70586007)(316002)(70206006)(83380400001)(41300700001)(6666004)(40480700001)(966005)(478600001)(2616005)(186003)(6266002)(26005)(8676002)(4326008)(102446001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:32:30.2933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b11f0f6-19cd-41ab-05f7-08db0f591659
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9229
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-Add 'xlnx,axi-iic-2.1' new IP version support.
-Add dynamic SCL frequency configuration support.

Raviteja Narayanam (3):
  dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to compatible
  i2c: xiic: Update compatible with new IP version
  i2c: xiic: Add SCL frequency configuration support
---
Changes for v6:
Add enum for clock-frequency in xlnx,xps-iic-2.00.a.yaml
Changes for v5:
Update description and add default value details for clock-frequency
in xlnx,xps-iic-2.00.a.yaml
Changes since v4:
First 6 patches of "Added Standard mode and SMBus support" series applied
to for-next
https://lore.kernel.org/linux-arm-kernel/1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com/

 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml     |  11 +-
 drivers/i2c/busses/i2c-xiic.c                 | 149 ++++++++++++++++++
 2 files changed, 159 insertions(+), 1 deletion(-)

-- 
2.25.1

