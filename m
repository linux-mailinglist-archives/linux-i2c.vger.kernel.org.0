Return-Path: <linux-i2c+bounces-2085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38686DBB9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 07:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC7211F2607E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Mar 2024 06:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AECC67E8D;
	Fri,  1 Mar 2024 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jbE6DqJ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF067E9D
	for <linux-i2c@vger.kernel.org>; Fri,  1 Mar 2024 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709276008; cv=fail; b=Cb/vLPWu9tHZ4jqUGH3qFAUzhSPUU7WiwW3I2iw3rrchEUsxxs475WBbJjWl3DQNOCRW7J6j1JTPzayKtDkmHwryTE0h6j+bZN5u6B0uK+4EWTcCjeZ5iGFFUcpmIwU5Zi1fO1ubQkghPtzrzWydgQ4IU4NG4fY312Zsl3LEKpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709276008; c=relaxed/simple;
	bh=e0HdmDONLfktiG3XxeSFBJjEppr/X7w2rGGCwh5mTqI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ctJXpt4V0Htm8eUw/5NAy8r/zFnqhXjXoA5rDGlGFFpJka41KaFf1KtsTfg4QyieyGVjELobi6yVIIrhjExyyoDUdcYAoO8qAV2fNYbosBRz8gT7RCxQtPPL0MPNjWmjEKEvAgDFAx1dgWqTNhfoN67IxXOSwqEXj8syAB2WG+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jbE6DqJ6; arc=fail smtp.client-ip=40.107.93.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRpjiCP/B3DjeBSvodcVhP+NFzVSmpM82d7tLjOpgGjcbX7ynDXw5GMnBvlba+q4CC3P0MxuaPOCVdlnhcd+ORwKABj3hnAYOvnDQ5H+pkWl21ob7ZXSv2cGLzr2FNE/+LkOCultU6kfRq8v55TTPzbAwKYRRXLIQUhvMUEvqXuiLdlQa6gn8yYiPmhztZ/6GvOIn1k7WQJ3GdbMmERjg5Tw+YYggdlBm041yge3BeYOJqgsRetC1Qbu9OMU5KaoNT5PPxkLBRVeCwe8cgV9z2IiioNigVOh7o8vE7n5cz7hNtEWr/OPmGVO2pOzP7aIz1IupMWshDtALm7WhNO2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0HdmDONLfktiG3XxeSFBJjEppr/X7w2rGGCwh5mTqI=;
 b=gbjHiRBW8yy6a6Ha7Lm5NV8Sq5Zcz/unqq6NY2drJs4DaHxd7BWNkPJ4Je5lwwFDDvIp5TPrBus4TuWWQJxtOZEtloHVo1dM1jdQyKXQex2zjEa8iQ4IEVlCVeltcocON4uDa2wCUF9aIFsezH+UlMucePwK7XUbkeKyQ53UwDMuT+P11xyL7smWK8YjtUPQGMRAl/uc3a0ccFq4LUzkqqHDrsc2x+MLlG3C2jvF6KilwiQFbiCevCULBaTrmJbNUtIy6dPzGcdHtVoOIOeZQ2jRfDLNE5sqVRJrSgc7Y5aPDwclQIA7lBlJJLt7Vi0wVD5lblMM27YSTcCSTa7GTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0HdmDONLfktiG3XxeSFBJjEppr/X7w2rGGCwh5mTqI=;
 b=jbE6DqJ6FZDDzwrcs+WDsNIJyYF76RDPzbQaDEpUb1rMk9+k3eNxdiRmE8MAcG8AdDvDlQrzd7Twy9pfQa5wqTv2/rITIAbTzUpT38UYpERAwc9K4YcrcuMI91+ACWwR2wY42ZD5an55TJXYqBjkwTSIhUPZ8GRRmCZN/oMU3Y0=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.27; Fri, 1 Mar 2024 06:53:24 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::55f7:70c6:e4d8:cf09]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::55f7:70c6:e4d8:cf09%3]) with mapi id 15.20.7316.037; Fri, 1 Mar 2024
 06:53:23 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "robert.hancock@calian.com" <robert.hancock@calian.com>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "ben-linux@fluff.org"
	<ben-linux@fluff.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "Simek, Michal" <michal.simek@amd.com>
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Topic: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Index: Adpq1QcdAzP+YxHrROCgMDD/K+/P8Q==
Date: Fri, 1 Mar 2024 06:53:23 +0000
Message-ID:
 <DM4PR12MB6109AF4214782537FDAEB5B98C5E2@DM4PR12MB6109.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|SJ1PR12MB6025:EE_
x-ms-office365-filtering-correlation-id: 20636128-dad4-45ff-a70e-08dc39bc4a0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PTs6SbZQ3uG4V4/qApQKS9g7Q5KuVaCGMj6Hv2Pn1ya/joSfQSuFfNqaOZlE/Husu7N2wnFoPj43x9OBvkAtb4wVFwbfZ9UmSnqrCFBqqB1DFD6VCLod1ZsBU6laUB1uRW8/x61d9N73Cdikfu+J0JYOReSMJXkdgIQvPViecGEXNQXd+zCSMJvmoRyE7DklJZPo8htO2A1PLGama8i9Js94map9ZZpdTFckua3HWZ1ZfRHcILDZMVhBfdUNKWZTYtb/bwLFJo6+BpawAsy3MemQw2O5+qzUUuoW5AmWXCa9FqV9T5CWJryQPdrs+ZUj9sMChrLSFO1pD+kHihqEqolvz3m1zOHxBCB0CoRq+40xe0g7MjRvJF4pOeI9xcHsC5rnBDsuT3rMxo5RucxsIPpGX2pSeZtTUJ5LEZ1wSWxv9bJo3Viwc8fSbC/OQuawwHe6rznPATwELSA3u0Rl9sCQugoMPq6B5wqWY7iJE/PlYlu03qDeFKeIKADlV0gAEKIBl2b+R63ZiDHTYuFmGhEdRB8txTZGADRhhRDfcNhR7Tl/HeLtilPIrWGpc+jg+eP6Ryy9mm1/tprequC7diXWnD7pQ0W/z4n9t/PLA3y9Fn+7wIcv8mXDOh+KTtY+CeNd/59kIStWUmi2HXdFivPjTOSLlH+ZlaPeHBFlR7OJMq+00lrrSi0yA5FvHDwF3jKSLPEaSAAp1UX2AqjWIw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PaBHtKzJkSjbgwE6X6X0kbIQpN99/IjKRue3X3ixgLqQUqSPHn0Dwz6wJW27?=
 =?us-ascii?Q?aNEnxVy36Z3aWaHATxrl/wYApAN3Dn44xp3dgXOocgBMysBFGS0I+iLqloFE?=
 =?us-ascii?Q?0zpltHCMf8AF1mp9mMMwpDrkxgwRnDSQZX/SjQOV9op1O7+wzn2ZIMxmW3Zj?=
 =?us-ascii?Q?ErU4u4vbHmfAJupfA4X867dW3bw8Zoppjd5CfWRxnbv2/u+nxlwAk/OpIqgO?=
 =?us-ascii?Q?PswNm7GaAYzzxvlp59Dyed3pc/T7Yv21CQ5kRZI2/pEjjqtHjsUHAW8drQIt?=
 =?us-ascii?Q?IH6QtMrRX8ZM5+6rdNUsQYzTku5RikMEKdf7ORCQEAUb16Stly8Ms+E6nZcx?=
 =?us-ascii?Q?JwKjppmoCIf1J/9Pr1ukUIcJL8nk09s6kqDqBtcPDBcLhthb98Gz6aZ9jOs3?=
 =?us-ascii?Q?kKMG1EFtaMqbuRBaK9SRLXuCcBQImIK35QUotI/C+ZDoRGU09qIv5Q2Onv81?=
 =?us-ascii?Q?8yD986664FAMLZjh5i33JI+m92fgCkNUHbvLlpq3SzpFo+DM9l856iqMQUrQ?=
 =?us-ascii?Q?9rEsEe3Lc8t7oaHUkLVVQ1dBj7DdtJkpGil4uZeZhsAEVptoZmHwipuo1Txs?=
 =?us-ascii?Q?mSc5lrRqR99dmedpgM/pPNill5700Xe86TPaIbEu1ZCZDx70zigRGyZJGjXl?=
 =?us-ascii?Q?okYF3VM93dur4EC2M2hlk9gTVVMreMFy5SfcW0aZUqLTjy+ZE6KEfcQzr7zc?=
 =?us-ascii?Q?wOC6YXVqe1ai+wYjw4nHG/FCZxRwLXiqqe77ZHCov90U97z1YBsfoHUuaEtz?=
 =?us-ascii?Q?dEG1Xm1dk/LT6AIXJD9tUHAieZforSP7QhWXGBYQTAnEF6gtH2b6U9aJbSV5?=
 =?us-ascii?Q?lHHbw0jmGN2EQs4yvf5hxPWRcxeaT2bmUIEBQEw8aBfqKOScXIhqa4nTTQjI?=
 =?us-ascii?Q?QY0rEyDebCvwHmyv1u/zGSWbXE3eO2NeNbPvyTorTSqVxqa685SeMtfJF5c3?=
 =?us-ascii?Q?vc6PtIcKkMOWHS4yz0taSC69PtVX7AFCkHAIuVxUsJj86juB7Ld5+fffWoHW?=
 =?us-ascii?Q?PqaHpOLU+4K0TqOMqNZx+R+2OIY4hAmUX+b9CmwM8VRBI9fFs+8ITRIbBFTV?=
 =?us-ascii?Q?ZOqLmTzC8QjU2T39hgwBtFd7BQinCAgydi5eVlCjjjr6TUUTfXVbjJ5njg34?=
 =?us-ascii?Q?fJVwMdcudzJ90+NeBQSJeRFuEsp++jmXZiK2SNVaOwjldrjrKznslmPn1c4T?=
 =?us-ascii?Q?RYcjTib/oGdZu+LcmNIFfR75ha4Or8wko2DTcPngFQ1Y08Q1Eyrqbyl0WaGr?=
 =?us-ascii?Q?glA6sOXNPVS61LLxAZ+PXTcX/PDPi+VC5mQ2uLu65mB1XcNFPePx32xdR+s1?=
 =?us-ascii?Q?K28qZulZQmvqJblHXIwjkO2U+BZRbpWXEl1rFYCT7rvH7AwJbqD55AhKx7Y4?=
 =?us-ascii?Q?AsUYEYEvAKoRF9GEDFtpplmx+v7AB/GlHQPtJuFTg/C3y2eWBM6VrwxhnOo3?=
 =?us-ascii?Q?6NGaHRRip5uULYNzcRbR4pc2TsbpKAiCfT3MhMy5AlfzADrKZS6IoP6RHoY6?=
 =?us-ascii?Q?gAvzW6YtsUnrNeuo02upMMoXJng0rHFrJng9lanW9Z38yIArDQNMT17DodGT?=
 =?us-ascii?Q?3ryqqWFs4YiNqChdGwY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20636128-dad4-45ff-a70e-08dc39bc4a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 06:53:23.8510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: miTo7lPPaZF6nOs+7b6wimtuuPgrIMHtANUw82iqSV2+ZmVUOi1k+2n3kog2sNVNKkCGdWDpjH2ayK9MoXwKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025

Reviewed-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>

