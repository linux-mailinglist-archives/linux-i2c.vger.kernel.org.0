Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B965966DA3B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 10:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235525AbjAQJp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 04:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbjAQJp2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 04:45:28 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060.outbound.protection.outlook.com [40.107.255.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85404EEE;
        Tue, 17 Jan 2023 01:45:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G971FWHTDgMlvIMvzaICxvdbxTdPbrzen0p/+0yLFGIILY0rI+ThF10t4rEBf3u8A3xVVMeLqWh2PhfeUIMqndWAOVA7W4yX7psP8kTWbLZzM5nM/tIrRMPjYxgEemG1KzvCcFO3HZQIkk3OMGopla47ox8wetJoLkkQ+SZND1mkvYV/4sC0vuGN4MUNWvdSbip67bwsb2ppfHOYT2cvJUNghv+iUA1HeDNrfYEpgwR0wmTC1XBsOt9mmL2nkToAJvvvCXwVIErBPLXkgZn7t08NA9R9H0IvUVrgIgVftIZgQvms7Cmgd4QK/hRl8TVMEfSuk6cw3YdwsWufzAWIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pROaJsXFY4UK3ogpEefzO3d5HSphULxdTIa9+mOlzeE=;
 b=KoXBP7JmHwoIiDJZA2zcd0b0Vd9Z6KMKVUPW58PpYDKw1RE+7d2HlzkCRdZKiNT668pdtRpZ3HzRJdbv3YQRyrtIIgy7LE4r8bwg5kB25ApgDokGxai3A3SKblhknuEHUETctiQTlgsB2MuG/KnC3k1kFhif1mImhsHfDChcYKyjlsTP0HIqjqcnu++DVqL+pRTh3mDoIZ+BRGf2flfQJrSNRA1FB7t6rx7a7gVHZsXB49sgP69F4UKYBENEw+VVYy+NWkOW1BXH8JavVJQUtGQ1sYkm4tTtzngG5LbJFYf+Sr8fjMLLi8oIkwAJPGz2j/CogiliHvbByj6tiZNeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pROaJsXFY4UK3ogpEefzO3d5HSphULxdTIa9+mOlzeE=;
 b=u9ar2YUGvJ0V5SpmpTlOpTvKprP+5vfLN96dY2tJv25z2nEdpPihjqbOz95/b04dqSHW5g0AvM92EKwEF671aFkUhkH/PoCRw6f2ET7DUiZwgr1xhbG4qmBPN32upVIWclCI98kHAQ8naIAAZxLikjSaIn9d/w4UExCpVprUHvmXeU+pv/6iSv1xHyT4ENAfGh778aomxT3kvMWOEFM2q3f05RYUY1GBLDJzL7aCcUAqLO2F22PrclcEmx3O3VibIdR5j/yHHIGUzyt67Qm00nC2M+Kbbt8rCt/QMY1mcjQfQ+mvLux3xAkg4CLM//ZvxzyeG+L01Nrk1jCTk/jJKQ==
Received: from SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24) by
 KL1PR0401MB6308.apcprd04.prod.outlook.com (2603:1096:820:ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 09:45:21 +0000
Received: from SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::c7) by SGAP274CA0012.outlook.office365.com
 (2603:1096:4:b6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 09:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2APC01FT0004.mail.protection.outlook.com (10.13.37.116) with Microsoft SMTP
 Server id 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 09:45:19
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz
Cc:     garnermic@fb.com, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Meta control logic device support
Date:   Tue, 17 Jan 2023 17:44:19 +0800
Message-Id: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0004:EE_|KL1PR0401MB6308:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b1836732-9f53-4ba8-0082-08daf86f8c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AN5mM3v9cdFKOrapfQU4f5KTSlQK+J+ZjPz1EUJHBkJ+wvvZiP9JJoMxGzOowT8ffYMBv2QscLadslNAO3bRZBAvQ6d6CS7dpnkcg4cawcLj+3/Bhpya2Lmf/GRQsUYbi72zFO07+6VvTdbJoeWhhmm+jAoCNxqgSZTXcAgU+fgUi+ciXlT3q90dPamSZy3QzKwYHAwFHZOyzQ69h9yvO3jEKrY5Y03+cwH4AXwYyazn6GvUAMN4C+MghD610tPmXjQy6i5uro6v2qxLZpMs/JU+liX1M4e3LT7RCbds8tUYSpYnWwSHnAIUhxO6Z0bg/n8plTMy/t5kNytDfEI+ePvQz08zxXYwqvcRaRkxaWRmWgTuZhKl0r1CAO2pHHHwq3Qf+1gq2Hfuq5XudNa7kcKnuJ2J0JUojJ9CrprdkVFkP3aiBYQP/fFmBNtqiUxcATVlhboStseWnvZVLyw5rxh3+2DQIrIHJ8K0T2AGrGowDvNdytr2HaS0wOdnv0fACNWzb1dcFowZ+Br2Zap2o81c1jkKYQm8b9Wyxy1X3PWwtLBMKvU9i/KddjE/EOVyaTQjri424gipX+j8P8co88ZVSX8h4dWLyv8bntCPlydVddVDOX2QMf6/r7YH3Xt+L62ep6dWMalgFGbWsOLqfqxGUdDscRbhUWAQUTS2Fik=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40480700001)(36756003)(47076005)(8676002)(70586007)(70206006)(7416002)(4744005)(4326008)(8936002)(186003)(6512007)(478600001)(336012)(26005)(6506007)(6486002)(1076003)(6916009)(54906003)(316002)(36906005)(9316004)(36736006)(956004)(82310400005)(2616005)(41300700001)(5660300002)(86362001)(356005)(2906002)(82740400003)(81166007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:45:19.3512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1836732-9f53-4ba8-0082-08daf86f8c24
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6308
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v1 - Support Meta control logic device driver
   - Add Meta vendor prefix
   - Add CLD binding document
   - Add CLD driver

Delphine CC Chiu (3):
  dt-bindings: vendor-prefixes: Add an entry for Meta
  dt-bindings: soc: meta: Add meta cld driver bindings
  misc: Add meta cld driver

 .../misc/meta,control-logic-device.txt        |  37 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/misc/Kconfig                          |   9 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/control-logic-device.c           | 443 ++++++++++++++++++
 6 files changed, 498 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/meta,control-logic-device.txt
 create mode 100644 drivers/misc/control-logic-device.c

-- 
2.17.1

