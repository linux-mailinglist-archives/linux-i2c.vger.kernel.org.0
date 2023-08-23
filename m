Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9AC7785AF6
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 16:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjHWOmC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 10:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235658AbjHWOmB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 10:42:01 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49C8E54
        for <linux-i2c@vger.kernel.org>; Wed, 23 Aug 2023 07:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ny8/LeCUn4OCXw+3K4UjbHwFRW4n1Zssq6g8MSLPFkd9lMISJz7XHszNMfjkdw8+iMUUmw/s0+yArTd9ZZUnf1WqOXdb7Z6ztJO68vHhebaSX0Jw+JQUFFzwwlH1Q0BqKrKmOfSsRTlLFOL0ZSM23iN8f18EiGgTQ+3R04BMdUo+wKVBe9xXdm8fGwY34VNuhbBQuv0r+AToCgpPGrk52sfgh7e1x0mJUgHw+KOGNID/s2DmNSR50Ek+RAA/KGqorUuNygBTkYLDmPiqf7k84a7swVCRJAbzO3UOWzGC4V803GFmr0rUFGRsA9LVGB+vjWWRHfe8HR5QOcyhPe61LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rl2zpxl0/pksn1sSJMX1k672ze+U/s9m/dDk2KV4zFE=;
 b=nnGVrn2VOwmdYBWMRYtE3TiwhfQNxRNWCxrmoWrXm7+jLQYc2no7pHvNkhX/vNlZKUH39KfdyCXmLJ8L3EA2gSoxfeOLRUBC4zn0rckPmAizSXofWLghSr9sm7FxwMpcXnvQw8Cm88myCnjzbqWRn/afKHiFNIat9Ak5CKpCBQMVsH+/+WDftgy5Y8PImyQbRzPxLLWbtbrJ/fY68t5xJA/CMfHRffzzCZh6JI2K/o11AUdwKn7/ng3iGAyqMyWJDaHc9Fw4+VUy2i7hJNp2t2pMvu8/uG4oQPRJpsGfcPA6ZYFTyokvoT40UVlOlK4Gfp+Dmk5zNvhPYHFH0K5Q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=axentia.se smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl2zpxl0/pksn1sSJMX1k672ze+U/s9m/dDk2KV4zFE=;
 b=ZI9XqNl9smCWd9pBKTPHorCzkNRzj4IhAeovVOYW1pZh3OEoi3UfGnaiYVrCLI7VaB/LMeZWMeqFAViAQ1wH3zogBm+x4C3jG9ARvsDd2JfIAkkc6dZ3R72TM1byNC6PnEb03JRbMy7rJKD1YlLCpa/Cz4gXsQqJhhn1RhW+jABP3CLz1Xtx6CpBAlpmY6tI4s9o89JpdfZ6uowUbCBujXq0QCb1fhn+kHcSAnpSfI9OHPt39317zAS9WXNsclf+KSLEatzu8GhooQ79u5oHhyzvCU660ZY56Qtck7+Tx7/knob8Pp8LB82GMqhJWeK+rJe/+0dXfNM5gLWpYhtNLg==
Received: from CY5PR15CA0094.namprd15.prod.outlook.com (2603:10b6:930:7::23)
 by CH3PR12MB9218.namprd12.prod.outlook.com (2603:10b6:610:19f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 14:41:57 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:7:cafe::c2) by CY5PR15CA0094.outlook.office365.com
 (2603:10b6:930:7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Wed, 23 Aug 2023 14:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Wed, 23 Aug 2023 14:41:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 23 Aug 2023
 07:41:46 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 23 Aug 2023 07:41:44 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <peda@axentia.se>
CC:     <linux-i2c@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-mux-next 0/1] mux: Add regmap based mux driver
Date:   Wed, 23 Aug 2023 14:41:26 +0000
Message-ID: <20230823144127.7885-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH3PR12MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: a91ef2ce-6646-4082-b623-08dba3e719b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ovseSYCMOSyxEHfYUyFqZ8cTm7np4ax1a1FtI0ZRJIs0B+KqT7cWJS7zeKYoFwHm8UJcWfdbOwFlnyFsw7LUtk/Tyqj/ahyXlGDvLuiSowOOaBq1gSMZHUMyzudp+yvhAStjr26UCHYw52ujZhvFBMjmVFCtWpuWcZKnV2qDgQ9yncZpifNw+OcyPCj7FP1aXt/IArBCJb13bZpChjsVZGBfyBqPCzPXULCryAnVCpKijMNs7hLCvfSL2cGHXhH7/CR0e/+kwld98Z0X140S6uYD6hqLzAV3pgAXUrNLS3A47W6dVWyAZAjT5z9eeJml5yBfV99sHnnNGkNPGDCPnmmopTtk5/obYS+u5Odx6AW1V9PvKq5sfRNpr7ku/d9BlplVAnfhR1jZosOgkK8qTVWP1lCvUB4JainJNliOmZOTHBzxapsv03KgqskDaWnFYCXbxww5r3dWOMbdz79JfJfVNPRd4lajmV0/bnTNX7kMMzHXorfKUDKfpRGzCNVa/BbTuA9iE6C7h9ilIbCNk7bMS5C4I1gUdrpD2cai/Kxp9zoBNg8z1D9jxOogldgsUiGopig7cbDwkT15jLb9pPdPkMXfuTs3cNUsW7fQfnwisUTk4/GGqQJYVO2tgfJA3McFbgUEstyZrx3uzCtT/k+7mR11L933lBIPnSsQxw8isgzpvxJBN7DJorgTecAsIh3v6ANbSinCyoDzupZ+CiqZjCbgaKi4dLDWtvv4hRSTUVsvGkYfHlX6msI9d2jwHF/LCHgGGwxqbHPetdxCA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(1800799009)(82310400011)(186009)(451199024)(46966006)(36840700001)(40470700004)(47076005)(40460700003)(36860700001)(4744005)(36756003)(2906002)(356005)(7636003)(82740400003)(86362001)(40480700001)(41300700001)(70586007)(54906003)(70206006)(6916009)(316002)(2616005)(8936002)(4326008)(8676002)(966005)(478600001)(6666004)(26005)(1076003)(336012)(426003)(16526019)(5660300002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:41:56.5591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a91ef2ce-6646-4082-b623-08dba3e719b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9218
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is improved version of
https://patchwork.ozlabs.org/project/linux-i2c/patch/20230215195322.21955-1-vadimp@nvidia.com/
Since this patch has not been reviewed it is sent again as v1.
Also doc file is added.

Vadim Pasternak (1):
  i2c: mux: Add register map based mux driver

 Documentation/i2c/muxes/i2c-mux-regmap.rst   | 168 +++++++++++++++++++
 drivers/i2c/muxes/Kconfig                    |  12 ++
 drivers/i2c/muxes/Makefile                   |   1 +
 drivers/i2c/muxes/i2c-mux-regmap.c           | 127 ++++++++++++++
 include/linux/platform_data/i2c-mux-regmap.h |  34 ++++
 5 files changed, 342 insertions(+)
 create mode 100644 Documentation/i2c/muxes/i2c-mux-regmap.rst
 create mode 100644 drivers/i2c/muxes/i2c-mux-regmap.c
 create mode 100644 include/linux/platform_data/i2c-mux-regmap.h

-- 
2.20.1

