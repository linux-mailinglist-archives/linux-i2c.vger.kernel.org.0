Return-Path: <linux-i2c+bounces-7746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8479BB075
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C5B3283FBC
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A29E1B0F28;
	Mon,  4 Nov 2024 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bpj/e7WB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2043.outbound.protection.outlook.com [40.107.103.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A741AF0DE;
	Mon,  4 Nov 2024 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714461; cv=fail; b=BjV6kcPZZgLf7kJTfYfE4Tlo5Y5fuWOWtjDUhHtZq5pfil9QdVCH/dxuxCMSOecWYwVwPO3OgLdlPLtLje6PfmzrRQUq0D5KyqKyzQREva26/SDSnzb3+f6NTxKvYTesPPLrSoOhDjAi7RHVaupHilJsrc0YyqfZBjfOw4t7Cc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714461; c=relaxed/simple;
	bh=eXTiXZdr6s8vbszT2854uxa1f2diHUZswZghoypOvq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qRnD4oG3O5HZvIYuffuDc8+FOk4fs/D9+eV7UIPEeBuMSITh9uybjhr+JJiSNTRzjrx9/PU88/mzsfwaavA/dr7NmEuHd0VbynddLKp8zWzJm1KaUa3OQdQXStc4F5MZWyWF4/5fohpa9SxVvabuHJO4YlXeJmJ1npkT2eBpD2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bpj/e7WB; arc=fail smtp.client-ip=40.107.103.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GThlBxiFr05naUFMNPAQvXbuU6niNxFF7y63zss6AspkUVcissCgvWRu3N0GyM6CS3N/ux2zJVfEpnx02wCavTWSIwfse9itV2sM7yUoZ1gm489IiZUO08NwCMEhsMKwhqk0rCR9le30cl9VCKQ2J0P02kQBDbnuiJvfODOgdf3CDWEgA8lER9rRhC9MVeyBB/VYCVqd516BU5eNybDyp+1hIJ4p+YxWnreOJTYAV5oO8KU2xJMgoEGnF/H8VLg3+kRKnb1FoBmPN8CQRxhDkbYsXEEmKmU2Z69E6CbIonWFg3LyxcrbIdZVQXMFABmIUg5qnCTA5jgmJspGpPO2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgO/XiOEPRQvMBO2tUabL97yTL07kdte5ieZgc2j8JM=;
 b=IIGV7Rc4Og5Td3dDy7w5+Ioc7Ffp7bByUCk/Oe3Wmj2NBJLd5bX4YywO+eGEBaMrBA2Qvyk4V5vfVZAa33aB2otlvg/RLJInTVbVu3f1EawBpFJSi6lS6seoaDcBTJNWXPkO3mDWlMrXFyv/6tcNV4zIVD4KpzqoOeGrhQ6ojs3VIHVwoEqh4kX4BhpcfunsrS2npUoHLusnC5c8enN71LqQxcDjxBdUL33bLG1vRoSPjR0vJ696mguqiVgV17+T5m9svPdbKApV/1oVvXNg4hYrlvY0Nmn9yG2nowcxjBwAxE3Yr07bixc3FO/LVL4OIzDCjbQ9ml01x39Rr0eFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgO/XiOEPRQvMBO2tUabL97yTL07kdte5ieZgc2j8JM=;
 b=bpj/e7WBjRIKLk/OhDVJ/GBE/S+hBOZAnPPCnSXpeoSHOO8l9oVbQ+QnQdeJwqACHxrI9retrRQ6SkvSD/hkrMd7dZIHbwol00iiqxEkFmpMrjwndChG3++VfVAScVstEux8G/urf6gxM4AqtcTcF/pm9+Z6fkbk4hr/4jhHcBZt9Cf/eiJ1WPJTSwMq/03p8l73H2If51qIcAJJ0bg4giLqxk+bPjng3Lxg2cVZ9/Ql3kxH0s2K4dK2zGSAEtnSDrgzSXVcR8Qz0OmHG4caOeoYrG+HUuptZTRPb1LhDmPIo4jlDNy88KVfNOHDacLATkmXQrMBJzreF+Ivr4nu2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9229.eurprd04.prod.outlook.com (2603:10a6:102:2bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 10:00:53 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 10:00:53 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH 1/2] dt-bindings: i2c: imx: add SoC specific compatible strings for S32G
Date: Mon,  4 Nov 2024 12:00:43 +0200
Message-ID: <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::32) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e245b4-bced-404b-c560-08dcfcb790a0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWxzOVlIV2E5OVFrbnVqRTFJV3d3K09xeWRKNS9QUVJGSVhLLzdVU3dyNHRL?=
 =?utf-8?B?V3lUeE02Z001Nk95emNPNjJrdHNVcHlUc0lsY1ZXMEl1ejVwN3ptZHRpTElM?=
 =?utf-8?B?RXRTbjJaWkFva2hIWEFTT0xRZ0hRTWlON0tZSC96Zzc5U3BYTWlzS1hRd1hK?=
 =?utf-8?B?U1NqeTRJZnFiMFZPNHlIYi9KdnYxZFhvMDRWcS9TYjRDK0U2TXRMV0RHS2cx?=
 =?utf-8?B?NGVTdkZPR0pvVEhQVjVYQWxTMGxWa25ZYUlvdk1ibGIwY1E5WkIxNTQ4cTJh?=
 =?utf-8?B?c09YT0cxR3RCaGorWnJqSDNndlJ2QTlrc1ZTbDdDY1JkREhCRXR6Q2FlYjJa?=
 =?utf-8?B?KzZiaUcwc2JaS0R1RFRIc2ZmcUtCMGVpbHdYdmszeVIyc1NGektjWW9jYU5H?=
 =?utf-8?B?K1pXcVZuMHhnK1RobDhWZTVRNHZTOTB1TEZOSitON3ZKOG9QcXJiRWRwZTUx?=
 =?utf-8?B?VVRxUVNudGZhRlg5cXhja1NzRnRla2V4VlpFVC9vbllDUUlpQmd5K3BQWEwv?=
 =?utf-8?B?Mm4zQk5LbC90OGF2Nk9QazFjTDhCQndQM3BHN2IxVk9Kcmk2UDRkb21BMERi?=
 =?utf-8?B?a2hvLzd4YlA5bXovS2hCMFpuSkwreStjMUVZK0Z6dkZ1VCs1ZlNrYTBra2Zr?=
 =?utf-8?B?SnBZWE5RdUc1c3JPaFZuVUJ4S0F5VmpFVHpNbDNqUVpWbmlsKzFqdXRiLzVU?=
 =?utf-8?B?Nit6ZlI3YVlPWFpaN1VCRFNBb3pNS0ptbTRzUXNlbW9tbXY5Nzh1V1Rsa0NN?=
 =?utf-8?B?QUhCRDduaDM4aUFWMngrZW1tUXJyQlhYdVBFUlRuZzczQ1JqUDVOMzBzVGVR?=
 =?utf-8?B?dllNVmZURENYZEJDelovckZ6b2pibm9lY1JrajBXUExzbGxvQVAzdkM4Vndj?=
 =?utf-8?B?R0s1aWlqUjVLR0FQa0RHTmNsMFhjb0tJV0ttTEVpK1FUeTZsNGMwc2NDcldH?=
 =?utf-8?B?S2ZFZmtxR1luclJDK2Z6VXIrUXFLSllXMXhlbkh6VTlpMHRGazY1U21DSXdP?=
 =?utf-8?B?bHNsRGtBaUtoUGZaUlY0OG5GVDBCdEdwOHBwNEhpVE9ZNWY1Z0ZFS1haVktQ?=
 =?utf-8?B?VmJDK2twQkp1SWVRRkp1TzlvT2tVNlU2VStuMndueDlabVV0ZGVIaW5YeU9D?=
 =?utf-8?B?Q2l0T0hiVnVNRTl5QVNtN3ErZ2lBN0J5RWQydGJxVDdKc29zRTVzTFd6Wkwz?=
 =?utf-8?B?OCt2YUNtbWxvYzN4UU1YOU5GWVRIMWVGMzREdHpjZHJsRmdCZTNkNXIvbFRH?=
 =?utf-8?B?VWthTlVXZHMyN2FjSEhKSlN2ajVFbEpyZFZ6MmJncWNPUDU3ZXNhRGR2SGRs?=
 =?utf-8?B?QzBjNE5pdU9uMXVESWhuTklKQ3grM2dQZFpaVER6cDZqWHhYMHpDK1R6VStU?=
 =?utf-8?B?RWNhVi9pOVI5TExrV1p3bVFYa3RDRDI3UlprVWxiS0MrVFRtaXRSdVk0T0Zk?=
 =?utf-8?B?RmNIc20vc2l2VjdTcTQ3RFV3ZzYxVHRMUUUwTnNYME9iT1BIbWF0aWdRY3BV?=
 =?utf-8?B?Q0RlaU40MWordSswZTBremFJNzBKMWdLTm1JNHh6a2Q1cE05ejFGT2FPdkxt?=
 =?utf-8?B?UEN2Q0hJOVQrK1g4UmtkUmwyYStTM0gycHF6M2pETUxCYlZwMDFROHBPV1pE?=
 =?utf-8?B?Z3pWTGV4eXVySDlSdWxvY1poQ2ltVldnR0I2VGZQMHV0b0h4eTRoV3pFNGVw?=
 =?utf-8?B?dlFLQVpxWlA0M0ZPRHJYdHhybGlLelh3ZitoV3YvUDIwWEU3T2tPdHdmUmpj?=
 =?utf-8?Q?DaZPnAF4sv5xBDdrTnv3zrRX2HmAZIzvJzLX5Bn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckthOHRpTUZGYndGbkoySnpXUnZ3NGg4OWFMOGNQTU50czNOUmQ2ZkJxMHFT?=
 =?utf-8?B?L2xWTkJwZGhSbWJHUnVkUkxROE9EVzkxNzNHdnljOXdIckx4USs3RjlHNDBL?=
 =?utf-8?B?QU9sZW9jNFRoRHRRekI0Zm9kVXRhYmw0Vk5Dd28wSVFHNjlsdHNGd1JnZ2hU?=
 =?utf-8?B?YUpxUVp5UllaQ3I0VVFYRjhiNFNPZWxsOHNCZFZmN05SWEFGK3FJekJvQ2xk?=
 =?utf-8?B?VEwzV3N6ei93WUhGOVd0c3phQVN5UlJrclU5SkJxajA1dDRiZWtQcno1V05x?=
 =?utf-8?B?c1ltM0dLclNydjRMQUs3bS94dUJtNTFCN1kwZlZqbE95QTA3ZTgxMnBUVFps?=
 =?utf-8?B?aUZZM1phbTNKN25zSk1abEtmbGZHeFdYWkZxeUdSQ2ZacElpUEdab0daelZJ?=
 =?utf-8?B?WWZ2QlN5S2lTVWI2OGZ1SlVCNlBjNG8ySHo3djBISlJyN3llcUx2MGNZTUVi?=
 =?utf-8?B?UzJ1VGI2L1Z6dVlINC9xcXBYWVF4dURJT24yQ2tpQmZKc01CQ3RSamNLTWRh?=
 =?utf-8?B?eTJoay9FNUhFWkZWRVZDOFRVTzR5L2xmTlovYnRLR0Y0ck8xdTk0OHplVnAw?=
 =?utf-8?B?NElpaWlxbFdWcmthR1VEak12QTY3YjdnVHdUYU0zZmNWdXZjZ0Zhc2c5N0tG?=
 =?utf-8?B?bCtWM2RscFJyTm9STzA5aEU2elJOYUdscjgwVDROaUgzQjhid2JOUHh3TlUv?=
 =?utf-8?B?Y1dxc04vRXI0WUQybjhsNVg3S0cybDRNL0I3dndjRFlOSWV0d2MzUUhYcGZz?=
 =?utf-8?B?a2tXalA3a1ZucUVrcjlQQXJMdHlNZVBjaHJFUVh3c2RMaGtsK0FOeWw0ckFT?=
 =?utf-8?B?b2NEMVA1THg5c1cza09uOHErcWZPWm1jeHhZb3JnejV0aEE4cDd3TGFmeXQ5?=
 =?utf-8?B?RWVzc2tidUo0ZHA5R0NXQW0vbTNQWVl1RXFLYVYxQmhhR0QyMmhmamRoWUt4?=
 =?utf-8?B?a1RNTGJlZEVvcjU3OW9uY0lCQmVNUzZ1dHhpMHBtWEM2MDA1amlSQk9IMCtw?=
 =?utf-8?B?U1hhOTd0ek0yVG5DWkNGajlVVDFXMjJaZi91RnN3UGZGelo4RDNBRldObFFw?=
 =?utf-8?B?amZVZWI5VkVQRjRMS0d3azJRQ251Tmd5S3ZtckdCV1VhdWR3bUJ6OHNOamkx?=
 =?utf-8?B?N2tkMVIrQ1NMWk5yREpEQ09lTzlXVjZrTTVHMm5sbis5eXd1VEZLdnlPMERJ?=
 =?utf-8?B?ZTRWYkYzWElCRm9teGlHNW9kdkNiOFZlSEZjcnVoMlFPczVJWC9MenpNVW5F?=
 =?utf-8?B?Tm44VU1pQSs3cjBmVnZaRzZYWjdkOFdmUENLRXVIdzR3QTl6dlg3SHRlU0F2?=
 =?utf-8?B?aEZqNEtLMDRtU0t4WGpFL21mTGQveVpwV0pRT1RmaC80OUVaNk1RZmpHVmNY?=
 =?utf-8?B?L0E2REdESkd4L0lRUGg0a0QyaXpSRE8wT3ZxZ0JhWG1Yc251ZWI3VmtSQ0tD?=
 =?utf-8?B?bkxwVHFJS2Jja1ROa2tJU0gwMm9qVUVkNFZzMFZ4WFJEWklMb1ZtQXVyeEE1?=
 =?utf-8?B?Rk9ZQ0VHL1dKMHB6WjhhdnJ5THpVZkwrUjhRb2tOZVVNL2FQbHlDWmhYTUtw?=
 =?utf-8?B?T3kxTjdlRHMyRXVzQ1JHcXlVMlhha2owMGNXRXB0eHRTbmN6MTdZWkJYWnhU?=
 =?utf-8?B?OUIrTFpGZXJBMlY1K2Q4WHZETCs1MUl5eWk2Sm9MQWcyQ1czT2pLanBRb0pD?=
 =?utf-8?B?ZTA4blNnbkRIbkFoT1ZiemxhNzV3ZDFvZWc3NW1JRXRSaHNWaURHZXdvdkZy?=
 =?utf-8?B?NTJMM2ZSUFZTZ1VnbDVqd3ZvNVRjT0d3TFFDZFdOdTRLOGdsY04vcmtiVGVI?=
 =?utf-8?B?eTBmS3c0OHByYlRsYmZ6V1VrQ2ZQSWRSZ3Fvb0k2TExHQitrNGdobTFFd0Qw?=
 =?utf-8?B?aUtGenM3QmREbUU0dmd3bm14LzA3VnhDMUkyMldNdncrK2pTWlFFaGdSN3pt?=
 =?utf-8?B?ZW1JTngrQTlwLzdacXVVYXI1M3Q0RXpqNE1MakNiMlJoVDlmVlh2MnJsb0NN?=
 =?utf-8?B?SlNVSUdpTFNiN0ZHSW1LNHlnNjMvT0Q4bFdJT3JyeXNjQU52RVhBZEQ2OHlx?=
 =?utf-8?B?YWtFVGFxYmtvM0hzUkVBcjJDVW93ajhYZ25tbTNDNFhwaUQydGNLOCtCMWJv?=
 =?utf-8?B?L1VkZmpSMk4yRm1ZUFlkcUo2ZXZHYTgxelI3YUhWN1pnbThEZlFwNGNiODM3?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e245b4-bced-404b-c560-08dcfcb790a0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 10:00:51.7693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hLgf/P67NRI9pDjdhPKqQW18PlEUez6DrOUHKFzBrTWzbtNgtbWeuLO6Ad0dqkne5MZU84djiItIvejjYyOgx5X47fIifnufqvZ7S30G2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9229

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

S32G2 and S32G3 SoCs use the same I2C controller as i.MX.
But there are small differences such as specific
<clock divider, register value> pairs.
So add new compatible strings 'nxp,s32g2-i2c'and 'nxp,s32g3-i2c'
for S32G2/S32G3 Socs.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index 85ee1282d6d2..0682a5a10d41 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -18,6 +18,7 @@ properties:
       - const: fsl,imx1-i2c
       - const: fsl,imx21-i2c
       - const: fsl,vf610-i2c
+      - const: nxp,s32g2-i2c
       - items:
           - enum:
               - fsl,ls1012a-i2c
@@ -54,6 +55,9 @@ properties:
               - fsl,imx8mn-i2c
               - fsl,imx8mp-i2c
           - const: fsl,imx21-i2c
+      - items:
+          - const: nxp,s32g3-i2c
+          - const: nxp,s32g2-i2c
 
   reg:
     maxItems: 1
-- 
2.45.2


