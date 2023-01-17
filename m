Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194C366DA42
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 10:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235989AbjAQJq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 04:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbjAQJp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 04:45:56 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2047.outbound.protection.outlook.com [40.107.215.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E251352C;
        Tue, 17 Jan 2023 01:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iT1+l9fsfj3YZ1Vuu8L1jOQJVz6N2KKXiq4YZmNUXwjgqjDP7bQ/wR1QirqBv85HRvTIvb1a4K68JI42+ymhsFHYSW6vUgKrhieb7lwg9I9LvJfJdiosmwQuaatG7uL385DJHcZqM9zIeIMTK554as2dVVW597Op20ct1i1A3TiJ8Ol/CRVX95S1vNHPnhIW+adIamPyQSWSE5TFaccfY+uvQ+SwJ4FACt0kJcenN/WWT7fWFqcVtO5D1wQunvmVi4Vnx7BS2cgZy2tGactXSjkgeF6BsqASVsRIPBVrmgDTHKAzks2heKBLG9twEMKy4bkjmUJQUrF2EvhmkTsCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4lUIc6XWnV9w/MdG0mKT19lC/sbHXBeuzjrz2CeY5g=;
 b=AePUtmZSaBjlgvTSjMPdca+PfibULaQj0bCGuT39eyYMOtdR5+5lw5NNOiu0iERH2bRanSqtkPFRQnDrjBWeh1Qt3D7+1OYHDzYhLjlxyOFixVcP0T4eI8P4HGl04rN+Nlh3Wmi+FX81YvMZnXGFEg3YJxaPcrksrRlXdQJXG44ZGU7K+O+1fYPwijzzmTVCdB3C9uxHsGduNl/forNUuKdOiVAx+qUnOdmf799UOFsUPxOGwMAHVlCXuW/Altt3cfjKeJb2m50G3vdsL3Cl/uubsTl/ShppPKgvof3TFLXWmBzSQhBfl2MPOBTAzwE6kTcJPE06LjKf2pCIVDVaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4lUIc6XWnV9w/MdG0mKT19lC/sbHXBeuzjrz2CeY5g=;
 b=K9DIF6KEsJs+9zIE5swXAa4Vq5c6yZlLtzaclvxLIKFWv3UGV4zFI8hzCBJwVSnYKw3zx5t+ox7YF5CNYBMqxV2eyiz/BeF5P2A81x8mWxLMhIk0iVEjOSckDE3vQx20xs2IgvVwcCtGlU5UTkIVAwoAcIKOVkV3d02sUPPKvEAtDClthYeWNfjvNemDwqF7nUXsuPPbhmoRsL6MO9ZUyn7x0PBMGgIgLCNgyAC5Hcf8ih2nK1LpphKc5yXyeD6OwUaVlJOnkxV0u/HyvX4fER756+jpDiKAPoxOW+rw9M9ZWmpnU4KI3IJwczRJSV5WMFHr5lUk+y5MI+HGc7NrDw==
Received: from SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14) by
 SG2PR04MB3996.apcprd04.prod.outlook.com (2603:1096:0:9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12; Tue, 17 Jan 2023 09:45:52 +0000
Received: from SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::e0) by SGAP274CA0002.outlook.office365.com
 (2603:1096:4:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 09:45:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2APC01FT0004.mail.protection.outlook.com (10.13.37.116) with Microsoft SMTP
 Server id 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 09:45:51
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     garnermic@fb.com, Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: soc: meta: Add meta cld driver bindings
Date:   Tue, 17 Jan 2023 17:44:21 +0800
Message-Id: <20230117094425.19004-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0004:EE_|SG2PR04MB3996:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad0223da-31e1-4534-67af-08daf86f9f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94/q8zSO9pDQb8Q3Y7unspxnoZ1ZateZ4SG+OixQXH16tJw2uheYtKkdDUaFSr9ahunC6M9OwIp+TiQMH2yabFuqO7kPr0qWzKWxZRcd1sihB8LOztbzFvYvMciTRp5bfNEYoUexKMYexuxgMTo9j/yYB29V1WV+3uIcgY+D3brZEndOtZ9hZQzLH6wmFIvOeVnuA8+wKhYVpRgND8+anMqpiIjQpaTU/oOjIeTCU7nEJatCTGeuz5IHILOdB+DI8L2+TApvAuE54QxIoh+mvUM0e3c1666hgUuIlXtG0tWbFFnJWoDQg7OSf7E6rqP+B9A2fVhQmGBQ1U9CMKgLCLg5WvQ9IyzjSOW1z/LiZCu5r5astxgdmMKh+J9NEhLC7fudOkPrZt2pfjO556xRnC1+3AmMfVJz+jssqE1jhckWKQksdkF5x0UE6tyUTr30yfF+32MBumfzA1jCVzaMmQO8jreRVo5oQRIbUGJY7tE9DEcs4fuLgZm0F7X5EwHvQj7vYFJkhtYEOZCd6CU2FrAn0WOA/t0W8Evg77R02Podoc0/4iGO7HqUgZV7L9PXacmxSBcLTjG2hoO8vto/FdqJRsJ0dHzUaaWUXkNxX3X0hk4pByQHl7mV6WlPHIQ4BpxJEG1d4Mq6uvhNsiG2ipvqdjGppOOeKpOcZtxJHXg=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(46966006)(36840700001)(110136005)(36736006)(316002)(36906005)(54906003)(41300700001)(36756003)(70586007)(8676002)(86362001)(4326008)(336012)(83380400001)(70206006)(47076005)(81166007)(82740400003)(36860700001)(356005)(40480700001)(6666004)(478600001)(6486002)(956004)(1076003)(82310400005)(6506007)(9316004)(26005)(6512007)(186003)(2906002)(2616005)(8936002)(7416002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:45:51.8491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0223da-31e1-4534-67af-08daf86f9f80
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3996
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a device tree bindings for Meta control logic device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 .../misc/meta,control-logic-device.txt        | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/meta,control-logic-device.txt

diff --git a/Documentation/devicetree/bindings/misc/meta,control-logic-device.txt b/Documentation/devicetree/bindings/misc/meta,control-logic-device.txt
new file mode 100644
index 000000000000..e966368e2fd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/meta,control-logic-device.txt
@@ -0,0 +1,37 @@
+* Meta Control Logic Device(CLD) Driver
+
+PROPERTIES
+
+- compatible:
+  Usage:      required
+  Type:       <string-list>
+  Definition: must include "meta,control-logic-device-<driver version>."
+              For v1, the register number, name and mode can be set in dts file.
+              Driver exports the filesystem following the dts setting.
+
+- reg:
+  Usage:      required
+  Definition: physical address
+
+- register-map:
+	Usage:      optional
+	type:       <string-list>
+	Definition: this property is an array of strings defining the names, modes
+		    and offsets of the CLD registers. The string format is "<name>:<mode>:<offset>".
+		<name>: the system file name
+		<mode>: the system file access mode. Should be r, w or rw.
+		<offset>: the register offset. If it begins with 0x the number will be
+			  parsed as a hexadecimal, if it otherwise begins with 0, it will
+			  be parsed as an octal number. Otherwise it will be parsed as a
+			  decimal.
+
+EXAMPLE
+	cld: cld@0f {
+		compatible = "meta,control-logic-device-v1";
+		reg = <0x0f>;
+		registers-map =
+			"uart-selection:rw:0x00",
+			"led-identify:rw:0x01",
+			"led-critical:rw:0x02";
+	};
+
-- 
2.17.1

