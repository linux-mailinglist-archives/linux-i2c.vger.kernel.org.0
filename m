Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 007836E1AF5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 06:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjDNEHi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 00:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjDNEHh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 00:07:37 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12hn2210.outbound.protection.outlook.com [52.100.165.210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2054EE0;
        Thu, 13 Apr 2023 21:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD7x+pqffilAckY/zf6w8a244PiBPd4Jypqsg4woArG7RUvtMEi//0nj9BYTQ+9akRA4IhALc68zWl1SETEL/L/qNV0hN+stZ6kax2yMIu5Usbhh48F78kttBwHFBUx03sOArnpdTYMC9yTALRf29u3JUXRIucxkZQmtR3QcQ6ldQEx21D77yJSNx8wRwBbDdU7SP553qPMtct5vTl/qM1LowSqhPKdMdhBesmiAJx7Uey/iwkxW45v7eM7+jWkDxm+W9Pl0O841ZnF0L1s/ecWl8CStL+y1uruFDIGidHzyJ60/YC2zp55cG110su6Ip7HOgZygTAv0j0u04M7+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg8B4lHP5z0+rZHu8OXrZC0HfArZ5QnNN+ytAkVaKGc=;
 b=C1KKuPOyMRhjH2MZiHmqHh6VJoqloysioTHfk/+SELfh2XDghnGvZTIG2JA5rtstgBhAEQ20Xe2dFTxVBWdmcoXgTNWJpFSETDV187IEk184Haa+puPzf8A5OGNIybQ3u9RL6FRI0Wul+8/iOPjS+eQW7sTcpKyvNYRcnW4Z77Mt6SoVindhqsEhILpbuC2Nvtk6uUWa7myHsXQCqyOKK8U2deSkS1hHfUP6PJkjfkKhXH1gWr88CDzWGOvr6EkRvt5uFHpbhj+n4vpl7ToEZAl15+LGQsq6yyO+P1lMpOiDAkU17bcYyYNImFK0EyHBe0QYVX9Dcgp/J0bKWblo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg8B4lHP5z0+rZHu8OXrZC0HfArZ5QnNN+ytAkVaKGc=;
 b=ngAAbfitAxpoEnurVamoEsctDqeozyLakaOcxX5rMyomfgafEOj9j6TA+bIRcc8GI2SlzuFXXxGVnhIFcw1gLyluHxOk5pUS2z9I6l2HNd/aChtOyLbxD/OBApOVSvk3G7NUtjx5xtnDor5PmIERHfaJ56uhFOQm+fUentaRJyY+tr3NB2tZB7ws/qqDHneL07nYnKlp1+DucYLwA86SxgicrlO6PGo3AxjTWJtJiBsTwmoHcpXmodZKLOe0vUy9F/Jsd29id+bb3jeFWKWNdgojLVPIElrvX2UCvazR2Rd3EseqmXDlBVhdpNevSLHfepHeUDW/C8TPk3vXK6LTqA==
Received: from DM6PR02CA0141.namprd02.prod.outlook.com (2603:10b6:5:332::8) by
 SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 04:07:33 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::63) by DM6PR02CA0141.outlook.office365.com
 (2603:10b6:5:332::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 04:07:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Fri, 14 Apr 2023 04:07:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 13 Apr 2023
 21:07:25 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 13 Apr
 2023 21:07:25 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 13 Apr 2023 21:07:22 -0700
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <christian.koenig@amd.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <sumit.semwal@linaro.org>,
        <thierry.reding@gmail.com>, <wsa@kernel.org>
CC:     <akhilrajeev@nvidia.com>
Subject: [PATCH v6 0/2] Tegra I2C DMA and SMBus blockread updates
Date:   Fri, 14 Apr 2023 09:37:09 +0530
Message-ID: <20230414040711.19370-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT015:EE_|SN7PR12MB7226:EE_
X-MS-Office365-Filtering-Correlation-Id: fe836ea3-4817-4c29-b907-08db3c9dc5db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJH7X939NaoKfTuyU8Qov7inFjHjePxEh0v1r8WJXk5lJqt6V4oRnM8FgHVg3MwAQTU6lKHEqxbjuRmre9Bec/GCNeXDYYqVuGYX/4ca7yTHDDGUD3s+bM87B/otllu0yET11DfZZOgDjqVCFZ5JRVRhDm6p5oUFNHz31KArya8noHtKkLYlH3C5YmnGRtZ9mrAqG2VRI5Qdz1w88rtFDqwbpN8w/nYe/myQxnzu4fXDGzkhrIYh793jZao9naOjY24mTrpX4OdP6n0xLCr88+qWiHtrs0e2gOiy0itWs4x7VoDytk0d0DepXeGb5YRMVO1T0pbL4Li4LCpAODvmobT3ePXL831rLUZBc0ORE9WhiMBSA9IyJtUqUvbEHQL3Ju7pzZ0R7k/fOhTRWDIK/2iTz1J0WkZHhxqVqjBkTvQj2uOqY22JStaGuSxdUqxS/NpKkEPioP1NZbKb3qQgGLb6ebIpoEh+U+70/yB/YY+MQqlSv7225iyA/iIK5qh53fHzggUmB079rqYRGvegtStJh+P6kPf2kf7ZFIqXyFr/guPFYJ3sZQl3tp2MTA6CWrHAaYM2RYz4hKD37yJ+jL8vFR2zabzBGJtz2Oc0ytAnN4nY7cjsrGEoatuEjrhUtAqUrjfqUZvM7PHfDZbNXTkjeFb/t3HinB8EwzbINfpxBqkO50URKo5YxfY1nEjBH5J/86jhMip2k4WPocy3bkbJxYZCN5DH+jo5lDhjYYycHAF4A0eSrLFGVwFErW7idMzOuU2iU8Rcpollr94J+hGQD3DgfkELMWA+Osxy+Ul+KiMOChfMW/1bG0yo7/GvRrhx+uEq7FmaAkDFyT9rAdz/ez2sbSISTsTpFrwcNr+4wP5Q66HLgFizB6GYkfh8
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(5400799015)(451199021)(36840700001)(46966006)(40470700004)(86362001)(36860700001)(40460700003)(15650500001)(36756003)(2906002)(5660300002)(316002)(4744005)(8676002)(921005)(8936002)(40480700001)(7636003)(356005)(82310400005)(41300700001)(4326008)(82740400003)(83380400001)(336012)(426003)(34020700004)(70586007)(47076005)(70206006)(2616005)(1076003)(26005)(107886003)(7696005)(110136005)(186003)(478600001)(6666004)(2101003)(83996005)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 04:07:32.8694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe836ea3-4817-4c29-b907-08db3c9dc5db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7226
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset contains two independent updates to tegra-i2c driver.
* Update I2C DMA channel usage to use single DMA channel instead of
two different hardware channels.
* Fix PEC byte issue during SMBus block read caused by mismanaged
msg->len property in i2c_msg struct.

v5->v6:
 Updated __u16 to unsigned int
v4->v5:
 Corrected the comment style
v3->v4:
 Combine the two patches to one series to avoid merge conflicts.


Akhil R (2):
  i2c: tegra: Fix PEC support for SMBUS block read
  i2c: tegra: Share same DMA channel for RX and TX

 drivers/i2c/busses/i2c-tegra.c | 109 ++++++++++++++-------------------
 1 file changed, 47 insertions(+), 62 deletions(-)

-- 
2.17.1

