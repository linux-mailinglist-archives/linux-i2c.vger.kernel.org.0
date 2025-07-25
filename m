Return-Path: <linux-i2c+bounces-12030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D596B117EA
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 07:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CAD174A2D
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 05:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68921242909;
	Fri, 25 Jul 2025 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HUAFcY1z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215A7464;
	Fri, 25 Jul 2025 05:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753421014; cv=fail; b=HivTOiztOUwq7v8rnnaar8yCR+Pvh6glL7EVVw6NyOuMcYtkNkHHLa8n9wcG38rT/TqbqGeAM0TNmWAur99fnORYTVZWsuPO+yJVz4KpZ/WAYGbyzlsHD4kwJZQTUhwiyk/gwS15jQ7BiGRibosdQm/BC1xHh2o/TdwE3d0rq0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753421014; c=relaxed/simple;
	bh=oq1dD55x+JenqB5NLAZzwOAxpAjMF3vsr1YGs3DCTCI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S083WQNmv9V7HGRpaYyJg7n7BOFsLsGa0xx33amg/G4lLsvEple/KoYinq1WrzkhgaAvailOvxz1lBPEMFH4i+EjNbJu0fmAigoa2q8fwSgFExXKLnNJA7a/Rexk9n/77WiDKV6ruJX9glUySWK7NMwuug0WNwD4jvuqihN/SKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HUAFcY1z; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7g0OcqYv8ocvHlp3fN2C9Sbq/mVmjdBYIfrk6Jm/h/eGa+tBfmaCQ8NLDuQsaQYt/01a3aaI2UHkod7W1FDIOQ/n5tcAUcmOTcmJOvT0YKx8zVwyyNVBI8jnbkzLiJcbcZxWWS/mseR9v1smpAQr7eK6L3HfpeCRFgx7oo1woweyrCXkFEQqOJV1EOCRWKVzxz6zTh5f6WGjkz4bmI1ABXXv9ek1mMQLVjyaj5MsIpCM3h7d+tweGA7s68bdIVXBsNhZamJjBxyt7uY+XwOFlOvnsGP0GZo5jwPCuOSuX6HQDkoJabfMkH1RcQk08SDdlD4XIwD2PS2Hr6gARv0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YA9rrNUnOhhOTtYgTqXj83axDCzAQAJ0zvEwUo+xvw=;
 b=dXSgshrtteA5MJIu7d4GBiQqKXKnbcT0JoWq0vYMw5XKK8Hyutr7enbj3ylcJeIjI7jM3sZWmRWrnnKcNi5fORhMMsI1Vc5d6df+bw8WCn9H37nA7C5BZHrM7QfksZDZqrPRhy19MD4zJ1BULnlRCQWG8dXH3M3MeeFFbjCdg48xa3sSqnEHq1rSNdhqw9RQpEIJAgefBG9F5IDmXJgws+eaGVvRwncnZa+4CSpdwUPoll3agJROqOhWzZoX3tD3KMogzXSJczzVccnY2BmypEGAmcsolRsis3kz8B0wn4fBAngJg1ZGtT5kBi8Maw61lDlXRbbW0r3JowZyY85OYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YA9rrNUnOhhOTtYgTqXj83axDCzAQAJ0zvEwUo+xvw=;
 b=HUAFcY1z+/IYuLNUgm+Sc13gjbespMv6ZdwJwVt6ymqq1CvKUsI5C+POGBSAWt6IaO/4H4cDK38S3lq1/rX5YIpSlJiZfS5DMg5+s9zu1Lo4bQmoLZNzC+0chvzb5DQsQY9Cwg8GgZXAub4ICuRURb63cePVVPSUOPQUtlXioRSw9V0KYE/8q/CYPhj+mesRuPvrsll/AhfQhrLIhZ62XwE/WAL4uwU6QIR/gQ0Xasgj2gakxrJ3L7MMeffzT6n4+GtI1kqPdhajlfHTeE9dm4ML9LeG1Cq05CDPekZlOstLmtolPgKGPJq6LIWUH7xjqSzdega79Pc7bysPA+Sv7A==
Received: from BLAP220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::35)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 05:23:23 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::ce) by BLAP220CA0030.outlook.office365.com
 (2603:10b6:208:32c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.30 via Frontend Transport; Fri,
 25 Jul 2025 05:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 05:23:23 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:06 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:06 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 24 Jul 2025 22:23:01 -0700
From: Rajesh Gumasta <rgumasta@nvidia.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<andersson@kernel.org>, <sjg@chromium.org>, <nm@ti.com>, Rajesh Gumasta
	<rgumasta@nvidia.com>
Subject: [PATCH V3 0/3] Introduce a generic register settings dt-binding
Date: Fri, 25 Jul 2025 10:52:22 +0530
Message-ID: <20250725052225.23510-1-rgumasta@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f66e4fe-2be8-4ad2-d882-08ddcb3b602a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WevB2sZ8Kvl6Tgr30l4PfacmJsLqjXU93ccuarywWuJCBLcrp5ecUnxeybL/?=
 =?us-ascii?Q?1wOe+tCLqw7sZAkKWfezOPixBxspMrtTeFYXrpxjrrMrGPav6MZ1eXBHA81D?=
 =?us-ascii?Q?REG4QUuOvK361B2ckMI+oVhZD6YvvypCbw/+cutgUSUvtP3lFDIYrAnd47MO?=
 =?us-ascii?Q?9n1ZeilwewgAPkztN9TVZqz80qS7uRS/v6qzibwliez/YRhfF3Hxk9m0uELM?=
 =?us-ascii?Q?N2bpgc0mdTnYq6HarEI0j1ARpPO775L0S1bhPD36BY2GaNmrg1wEfaUjwbj6?=
 =?us-ascii?Q?MZIkS6kqTaPxcT4Fc6Hq4WWE/U9fhdmKxBFdKF48m3uQAzQbAIS/bA8towcn?=
 =?us-ascii?Q?GeNGjarLb51NEzMdBbnmjedzahh/d0QTiJaGrgagAHQBpQr/dIncpTtOR7vz?=
 =?us-ascii?Q?9yj8RuCeRf49QDZT4KaGvCdwf5z0PcZ69KIIwUuW+Hfyse+KixCyJpL2pIdO?=
 =?us-ascii?Q?zBK8Zpp204H6OeCWxSN6+842l3+oanKHNdZNXyMuE5qbw2gnmm4t1n30i+Kw?=
 =?us-ascii?Q?VW9QqyPTMvcXaivwze1/fcycCD7jM4ZqM9hJbMs7SfE/V7zQG3JQnpsUQDVJ?=
 =?us-ascii?Q?sZU/7Xsu0VAauAX/jbZR/VVKaevYXDq18cBwHxhVCU5Yn7of5qPq6Ae6xvpY?=
 =?us-ascii?Q?h+Ypd/z9V30bnTCGddPa6UaFnQ9TSC9J78kMlv8ahj7EnlLabvnRhL1aGZ7W?=
 =?us-ascii?Q?JM2jsTjRo3ebvJKnSn9kommeYUOjcdzvd0eDashHdNsH559R0WdgHd7MhbQY?=
 =?us-ascii?Q?la2lK9JOgwQH3NKLRQY/vwCA9u1rOvXjiHDD7tiG/bqboAi4BeCq0q/kefsE?=
 =?us-ascii?Q?LBSq9UdMFGNTFle/EUEsdqy1PmwtpQhcKaFs27EVqXFzSYJYiEa0l1KcXJ6+?=
 =?us-ascii?Q?fTOL7LKHsXd4shVqi1p+aIUeOhYmYlZ4PuYLfyGrl4X0rrxBZk+HZKp3iKX4?=
 =?us-ascii?Q?ysj1dm/pDhbOWgolet5hf8IFXIA729p0pTWxSfGjh/DVBdwkGcfFqNLLzKK8?=
 =?us-ascii?Q?kubi3jinsvw6YnDe600ZToWVZ71mNf38T+vg3VG1RloZgd9L7Q+tMJZxQ9PB?=
 =?us-ascii?Q?VFJuOvHWrA47EEQOe4KsQ+X3R1/GeVK4Wkdl2xQFit7QBxGZYmdKNv4vaLRx?=
 =?us-ascii?Q?+esiMNhg8idCqSCC7toMQhMUB3X7eUyWpG6xGqQIqMyOQy8zLsNO18cFzrbr?=
 =?us-ascii?Q?1D+Aj2tRq+ukxSnZRRgustuguppRLpDNAwyiyWkCJ+d+0gMMgwrZXt41j7t0?=
 =?us-ascii?Q?oZeepXoi+VWACL9ilXjk/kocMnDnJZ+gDBhuEChAOOmGmKal8h7v/ivjbsGS?=
 =?us-ascii?Q?aKF/0AfF0xjbcOzk9ojiC2NwErxdHC4IJ7wB3fF/HbPLJGyHv2sQrdI+ItKO?=
 =?us-ascii?Q?SGRjUzhLK5OUGT95mOKkOYzsplHDKUGNgHqBtSPyCz8G64W70/1SMtE1iJVZ?=
 =?us-ascii?Q?aXPU+n3zXKQ0lo+RudF9yeIWyThT0lsDRgdcH0cFO3y8Nm1rTYuZEzBqfUeL?=
 =?us-ascii?Q?mqsf0Gheax67rAODlmsPNqcO/HK0F7X02Pz7ii4rpFGKryMqynY5aOK4+g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 05:23:23.1565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f66e4fe-2be8-4ad2-d882-08ddcb3b602a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359

SoCs such as NVIDIA Tegra require specific configuration of their
register fields based on various operating mode to achieve optimal
performance and reliability.

In practice, this often boils down to writing specific values into
specific register fields for a given use-case. For instance, configuring
a controller might require programming a specific values into various
register fields. This can be static values that are always written to
the register fields for a given mode of operation, such as setup/hold
times for I2C high-speed mode.

While this data could be stored in the driver itself, over time this
will bloat the driver by adding the necessary data for each SoC that is
supported. Given that this data is SoC or platform specific, it would be
better to store this data in device-tree. This patch proposes a generic
device-tree binding for describing register configurations that can be
used for any SoC. The code for parsing and utilising these bindings is
not included at this time because the initial goal is to see if such a
device-tree binding would be acceptable for storing such data. This is a
follow-on to the series 'Introduce Tegra register config settings' [0].

The examples included demonstrate the use of 'reg-settings' node with
MMC and I2C controllers, however, it is designed to be applicable to
any controller that requires specific register settings for a given
operating mode.

Example device-tree node:

/* MMC register setting example */
  mmc@700b0000 {

    reg-settings {

      default-settings {
        /* Default register setting */
        nvidia,num-tuning-iterations = <0>;
      };

      sdr50 {
        /* SDR50 register setting */
        nvidia,num-tuning-iterations = <4>;
      };

      sdr104 {
        /* SDR104 register setting */
        nvidia,num-tuning-iterations = <2>;
      };

      hs200 {
        /* HS200 register setting */
        nvidia,num-tuning-iterations = <2>;
      };
    };
  };


/* I2C register setting example */

  i2c@3160000 {
    i2c-bus {
      #address-cells = <1>;
      #size-cells = <0>;
    };

    reg-settings {
      default-settings {
        /* Default settings applied during initialization */
        scl-high-period-cycles = <3>;
        scl-low-period-cycles = <8>;
      };

      fast {
        /* fast mode settings */
        scl-high-period-cycles = <2>;
        scl-low-period-cycles = <2>;
        bus-free-time-cycles = <2>;
        stop-setup-time-cycles = <2>;
        start-hold-time-cycles = <2>;
        start-setup-time-cycles = <2>;
      };

      fastplus {
        /* fast plus mode settings */
        scl-high-period-cycles = <2>;
        scl-low-period-cycles = <2>;
        bus-free-time-cycles = <2>;
        stop-setup-time-cycles = <2>;
        start-hold-time-cycles = <2>;
        start-setup-time-cycles = <2>;
      };

      standard {
        /* Standard mode settings */
        scl-high-period-cycles = <7>;
        scl-low-period-cycles = <8>;
        bus-free-time-cycles = <8>;
        stop-setup-time-cycles = <8>;
        start-hold-time-cycles = <8>;
        start-setup-time-cycles = <8>;
      };
    };
  };

A few things to note:
1. This series only includes the device-tree bindings and no example
   code for using these. This is intentional because unless we can agree
   that it is suitable to use device-tree for this then there is little
   value in reviewing any code. The previous versions did include code
   but we have omitted this for now to focus on the bindings.
2. This was discussed during the device-tree session at the 2024
   plumbers conference and there was interest in this from several
   other silicon vendors that would also like a way to describe register
   configurations in device-tree.
3. The examples and example properties are based upon some
   configurations used for Tegra. The property names, units, etc, are
   simply examples that could be refined if deemed generic/common
   properties or made vendor specific if not. What we are looking for
   is some feedback on the overall structure, with having a top-level
   'reg-settings' node and child nodes with configuration for each
   use-case.
4. The I2C bindings are known to fail the binding checks if the fix for
   the I2C schema is not applied [1].
5. The file i2c-controller-common.yaml is added as a place-holder for
   defining the 'reg-settings' nodes for I2C controllers. However, this
   is very much a place-holder for demostration purposes. Ideally, these
   nodes would be part of the main I2C schema.

Changes in V3:
- Renamed as 'generic register settings' as opposed to 'Tegra register
  config settings'.
- Dropped all the associated code to focus on the DT bindings for now.
- Added a 'register-settings.yaml' as a top level binding.
- Made I2C register-setting timing properties generic I2C properties.

Changes in V2:
- Move config settings to a new node
- Use phandles to refer config settings in device node
- Update subject of dt patches

[0] https://lore.kernel.org/linux-tegra/20240701151231.29425-1-kyarlagadda@nvidia.com/
[1] https://lore.kernel.org/linux-tegra/20250709142452.249492-1-jonathanh@nvidia.com/

Rajesh Gumasta (3):
  dt-binding: Add register-settings binding
  dt-binding: i2c: nvidia,tegra20-i2c: Add register-setting support
  dt-binding: mmc: tegra: Add register-setting support

 .../bindings/i2c/i2c-controller-common.yaml   | 73 +++++++++++++++++++
 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 64 +++++++++++++++-
 .../bindings/mmc/mmc-controller-common.yaml   | 24 ++++++
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 48 ++++++++++++
 .../bindings/regset/register-settings.yaml    | 31 ++++++++
 5 files changed, 237 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-controller-common.yaml
 create mode 100644 Documentation/devicetree/bindings/regset/register-settings.yaml

-- 
2.50.1


