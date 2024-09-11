Return-Path: <linux-i2c+bounces-6567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87C975615
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB80B28461C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B541A2C21;
	Wed, 11 Sep 2024 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KzmHJF4h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EF68F6C;
	Wed, 11 Sep 2024 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726066415; cv=fail; b=kRy07BrD7sUNfpkQ2PFUmfap9xw5xgdhM6RLg0Zl6rm//BF8sG0MGl14GVqRCPhuITkEvbXp6PX1fxEJK2NLd1WhGLSKbhrxoC+Czc63MHOLcnEcwg309zVhGcW7FEOw3EHQqISyZii1OV8BUQY/QmY7MpOz1M7aArmsYbBtCOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726066415; c=relaxed/simple;
	bh=/iDcme2vGRZDL/4zkjrZ5cPf9bxsoj2PAIlXgHAL3fA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kWahKCRWUO7n7b6Yx154TEdU8frM8kezsh1MQAj0ATmZGoJuhzbTMYsEmVZEhEyO+2PlrEQ5uRdABycwLxwua+LDTe/Igx/hUmtFJezIubnsBAShySTpjl/L2/nKSvK8op4HXvYX38r9yLLjAt8RzpZFXZc/du42EYNq8yf9H9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KzmHJF4h; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1qr9KC9cJovgvUmngElrFsCOUX/YG7lu24SAs29yvjG3sXfVC08LLrCfVAJb3qXLZaOFS28t3qi3GXSkG6YSzgkMpOcoBH3AcaCUZBHK9ZMYXF/oJaFKimuED9eaVkdy7LytwfsjLQO4+gXiqQbdHL/feeV6e7+FWKsqV7V182uFnaNFWgV4stPkqBbWaU9dEc7BURd4+qvCdJuHjHRs7RH5p2+eoLHUREmDLaqmTrxP9WH2IJN6uNhePeBITOkaIVSNfF3tyIJGxBfnFRlzH5r6skFUzRVQ3IR4yxo6u7SwF1VfP+GwK10J8jJ408IRfodXJYcZP3Tu5r1hxs/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4MdAhXaoS7BxKBll4LHryjJjk8zKhCHtXVukQFlcqM=;
 b=a+gpWJyL605uq9EGIjSAoSUj4Fymtgl7lqEH2Xx+QRR/9dIFiTTkO3JLMPpXfFrcvR/5C2dbdKOoGsJr22SF+pVsjUf7bjupjbupaqI1Li/yEVfk5LX2SmMUAC9Z+ZznoS7GTQmvVyg3Ul8ldBvFn+Dz05DiqEHSvXYESc3IIVfW8aJYjtQI9FFfEnfnofHfRZt5UuPJ+9XNvIHVOUMZ4dcvlXTtNUZUTBx5Bt1SevM8ttjS+PXNEyliS551do6j1+odpFgvt4mZJhiDzf2dnhtgbvB+ZZ3d7yXL2xhXq9Qc4c6cxOoXrRLSAlPbN5ruXQC9sJ7FzPktNnlAh4HHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4MdAhXaoS7BxKBll4LHryjJjk8zKhCHtXVukQFlcqM=;
 b=KzmHJF4hYeb1jWEtIKzSjKDe48/E4HiR6f2vlYgEIRqvdsOShYlyctCo6GwiljUVl01224ta/IS3aogBe/2A+7ZAdcK/9IKkO/ySZTG2Bv+gfO0bTUL3lbO2OyroRuI1TxenMoo2Gg+V6bE6PX/LCWEiL6IQrljs9MwibnpXyDNHDJyik7YB3ulDt2oTMlJhM0caPHQioyl+vprjZhX+OmgtTx0rGoBiX9gYv4u2e6ghqprJ296UL0+Q7Ma8UK6F55LPmn7aqpJyULkkJknDWAH+Fbc77fXlFwC561fiFKvzgo4e1S8LPIuM6hGl9vpidkl4PZUrM4IZwwSRHLHjWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 14:53:28 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::3a57:67cf:6ee0:5ddb%6]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 14:53:28 +0000
From: carlos.song@nxp.com
To: andi.shyti@kernel.org,
	aisheng.dong@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH V5] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Date: Wed, 11 Sep 2024 23:02:25 +0800
Message-Id: <20240911150225.192468-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::25) To VI1PR04MB5005.eurprd04.prod.outlook.com
 (2603:10a6:803:57::30)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5005:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 8503ad8a-54d6-439a-311d-08dcd2717e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XWQcaHeC0T301XOmLqt1OvnkQKqf32MhIaqOv8KSut2OWi6rH5roCmQXeBHj?=
 =?us-ascii?Q?ox6+6YjPKTK2tbkzlMoZjiEhoK2n7/YG/ZvytMzMsrAASEIdJbUIQFHpBymy?=
 =?us-ascii?Q?jEHa76Ti4XVy6AyVIddiAWe0Xbe6/xmAvBb8ikk1mheB/bX6ept1VlprGLsi?=
 =?us-ascii?Q?+JhFHi1sS2gBNgNeUnYIoVmO2HXw9o/4UHKaPGWKdLLuEu1mUypoOx8PQPv4?=
 =?us-ascii?Q?4T3geRrBvf6bNjH4xdPVt93CSONTudjTDsm2H5XyN+QKowhFmV+3oRab7B/t?=
 =?us-ascii?Q?7UDIqmGxsser7FeUcCPHnM/wATA0m2/6vMQZET+W4IGRVo2FZDpm+4VcT32w?=
 =?us-ascii?Q?oenrKG7Ccq3/hHBeKtHG/B2zzESkJcQet83idLTm5CD/HuTSIHZd1KsimWKI?=
 =?us-ascii?Q?DtPMh2td34IYP5kXhGpKMr2pZ6SyArF4VT913hi8jIbsYqof3/PfNmLWtnyi?=
 =?us-ascii?Q?6FtHr2nDFLuPzCfSg6qhU2unwlKLMQBFFcsyb5caGA2X8uG9N/EEKK6D3IzU?=
 =?us-ascii?Q?GmQ5yoRm3AZmoLe958Jcz13ygfVCqic35UY8B02pvYfSoHCoC77357XKeT74?=
 =?us-ascii?Q?Ke9t7luCgUnioSHg34uXsoEYHTHW4Qvw59i5BY/u2oCq8h9Bk0l7VUfWSta+?=
 =?us-ascii?Q?/O18hsm0GYjFtu+0QNwh55netw62yxq4hV0ekmzaC2KhbL8dwGOw5wc1g00+?=
 =?us-ascii?Q?jbqb9s4j4HN97mJGvhthI+dVPfNMYR271oC1kgYVOw+kJYdytRyrYuuOJF5q?=
 =?us-ascii?Q?+sYFhNFJNZ3jNkVkqhCE35JCDyTrfnjn7cuHIpt0G+tmCmiW7kpQzk5eCDps?=
 =?us-ascii?Q?fp6adVWWPZLrcS+Kr8fo5vWj3rOws2jC/FBZgysNdy6d1+k3jyHtVfL0O3MC?=
 =?us-ascii?Q?lqn6HBuSh9fTsY3yGJLUkW+UAo+s8zGzkNkVQ56VeSY6AFWV4jq21ObnHBRB?=
 =?us-ascii?Q?FopgoTtnB2de3rUsWPY/uCOcccJAWBv7xVeqw1J2IdGTzbQulUxOPk4sHzFS?=
 =?us-ascii?Q?h/9kf8QMRd8lRf6D0GjyGccUsjpipSwr8oYqXgETRu6u/duKFCX6lIsJZpFs?=
 =?us-ascii?Q?+epszGIRaehlmq9F0ToSRvHKuueGCFUsDWrjSpVVyPxyrihyyNEYVW2fytDE?=
 =?us-ascii?Q?XiuEUdb1SiNf0IpeeroT1iKnnLErPLmOeIWFFjyCKrzHGm1AUfognTNNx018?=
 =?us-ascii?Q?+QUT5p6MnR2fJNQG4SrAYoh9wSM1aNjD4I7P7FawWOHaifk1fW/PzmhCqOmQ?=
 =?us-ascii?Q?urYu2bAtF5ZV53W0e3uGlElORQCPhUtGZJvXaFkcPEiltEDzKQLcU0HBLfro?=
 =?us-ascii?Q?wqdWYGnLJZ3SPNhiHxAu3UXwUnAZ3YtW6bYLvU0MKfVEb4txkcUXVRyfCem4?=
 =?us-ascii?Q?/zOI4tuNT0TY89odpCKVM0LDdTDOIb/JJV2p3iCzdD5lZ+3UfA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iJIuZPN55tukTA9CviB+3dvEHnI1fEtl6UJyFkl17+31BGrJZX4WpGm7YZ1I?=
 =?us-ascii?Q?EHQO2NFHqvQHNiFCtRc6dRHuq+P6npouky3fEtPNTHBrstc784yQApWWiFis?=
 =?us-ascii?Q?WfMDWfhfRhsG3f3wjJpB3et3BlK6VSaik9EaFcxH4hqbUYZRdpfrrhGISpjS?=
 =?us-ascii?Q?1NvU55KUEVaXO4Ceidam22GqObbNx351qlGdSg3CXf5MDGjXas6WO8q1vRDi?=
 =?us-ascii?Q?8FoE29zU0CDb9frxQnWnf04eZgHnIwbwTyA+6rG2XMBPXfPJ6Q2zluO8uovt?=
 =?us-ascii?Q?hnXYQB/33oYICOTtU5rgAz6v+XTBfqRqlNmgCsD1dPBvaQluqmOf5bDVehga?=
 =?us-ascii?Q?T3vGJFmu26fbczTP/C2M5JrX74P/+DtVeTHWZM/v+ifWdl681vl1vPL3YhrO?=
 =?us-ascii?Q?xc0TxSYQR5ZpdnAAB1N7ietlOLNKhunqDvegD1ehCvFZzBOk33xA0EN9z1Yw?=
 =?us-ascii?Q?0q2v2s85wpiEhAAAlqp/7ctFHJTQZEKpnuxgrf+QtIRGJzjXNsDOIGqkvAUj?=
 =?us-ascii?Q?NCiz1F8LYRMgeKM+cqH0QkjBcTMc+i6Rx6sPobCZVen35e7UfuqVAPfSABBy?=
 =?us-ascii?Q?yzVznAND7gbE8m0QKaMlheN7v4m5SeUlX2ZoL3WVYNRDsppF972X5M8mzspC?=
 =?us-ascii?Q?a1ia8DgwJIvFu3C5D2ZPqa6OKEGkaJW4XV0djrYdwXFUvDFpbS480Mjhkkqh?=
 =?us-ascii?Q?DFxJOMBd3KPQPHlM5UL8wl3Pe+kAwMlEyOi2Eibh8wJzJ1z3bGx1U6AzSHZy?=
 =?us-ascii?Q?CenIzEfJGS4ZJSQsg10hZQvLiYUGD8rRdPW7is40Rl4rcyi4ztUatLnX743m?=
 =?us-ascii?Q?LyuHsFmPrI44QpfXKHG5pEgSdpbcIH+Sn3RpnIq9IWiCSOnh0Xc9S0gh/964?=
 =?us-ascii?Q?fAdXTMAzNwvBC7flwbdIC7mmyDqqJixwLYeFodj53mHGpGfllZUpNIF0Nj5L?=
 =?us-ascii?Q?rzhBVHiUnKNE2wb8P8W8rcEgaGIAf/KsbpBjKv8zL5yGAlheogS1hTIlSO9S?=
 =?us-ascii?Q?lUnb6pUZOlcTMKaRJRN8upt2zJ8wzG+6TcPhIMlEM0axEVhCKJvRiOj4diqX?=
 =?us-ascii?Q?Wtipbw485PYru+8MKSqtWTCzgMtZWluEQ+Y0O/dXvZPHquYGnlpe62UG+zAZ?=
 =?us-ascii?Q?dLtYkhOgqHZVsvvdmPgthvXoQqBLj9Y7pMuPIT3QYhpNvN4nNUdaOVowwW1W?=
 =?us-ascii?Q?6I4+dvRCswfCnd1W+zRobh4YglIhOdF8oQKYE7bz3Fy8XLtz1wFnumMUbFq1?=
 =?us-ascii?Q?uKjCuIH/3Kn/slo8XeL299oKOw38bs8CAHinsHCuSFB7XfYD6DCAg2TCwqGn?=
 =?us-ascii?Q?3SA1EJ1pSyW0ZFFJdW0Xlrc8tPARDDbGGs/sTEuXbEl7W0K1LBTr1Y0RYsJw?=
 =?us-ascii?Q?YcrAw1r/ugEhI6a29K194ev8A0RD90JjGd/7JMdaofRzCJu8mblQ+2qFMLPm?=
 =?us-ascii?Q?uSsqd0M6wEnuAp+ahcsGc34a7A5+3wMDvvtnvLN38q0PY9KuT5dTHkedvtYR?=
 =?us-ascii?Q?qn2Fmbf/DnwpzvgI7O36mhaF3GwH8WVcLQSJxQMsJbhUDbCWlCbvRuwA2gGb?=
 =?us-ascii?Q?SjZrV8Xi6cmAepOMlcXoWnd6+rNdzLFmoaUx0xxY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8503ad8a-54d6-439a-311d-08dcd2717e1e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 14:53:28.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvAgYFK1ayygAILmOzPRpSdZfl/EUjYpdK38IIbglickNyjvWdVYlPDO6fqsTjKQKTsubrW0HB0+c1Rd4+WUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

From: Carlos Song <carlos.song@nxp.com>

Add eDMA mode support for LPI2C.

There are some differences between TX DMA mode and RX DMA mode.
LPI2C MTDR register is Controller Transmit Data Register.
When lpi2c send data, it is tx cmd register and tx data fifo.
When lpi2c receive data, it is just a rx cmd register. LPI2C MRDR
register is Controller Receive Data Register, received data are
stored in this.

MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
+-----------+-------------------------------+
|  C  M  D  |          D  A  T  A           |
+---+---+---+---+---+---+---+---+---+---+---+
| 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+---+---+---+

MRDR is Controller Receive Data Register.
MRDR[0:7] is DATA filed.
+-------------------------------+
|          D  A  T  A           |
+---+---+---+---+---+---+---+---+
| 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
+---+---+---+---+---+---+---+---+

When the LPI2C controller needs to send data, tx cmd and 8-bit data
should be written into MTDR:
CMD: 000b: Transmit the value in DATA[7:0].
DATA: 8-bit data.

If lpi2c controller needs to send N 8-bit data, just write N times
(CMD(W) + DATA(u8)) to MTDR.

When the LPI2C controller needs to receive data, rx cmd should be
written into MTDR, the received data will be stored in the MRDR.

MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
MTDR(DATA): byte counter.
MRDR(DATA): 8-bit data.

So when lpi2c controller needs to receive N 8-bit data,
1. N <= 256:
Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
MRDR.
2. N > 256:
Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
COUNT(N%256)) into MTDR and receive data from MRDR.

Due to these differences, when lpi2c is in DMA TX mode, only enable TX
channel to send data. But when lpi2c is in DMA RX mode, TX and RX channel
are both enabled, TX channel is used to send RX cmd and RX channel is
used to receive data.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Frank Li <frank.li@nxp.com>
---
Change for V5:
- According to Andi's suggestion:
- Fix code alignment and improve logs.
- Add exit goto branch in lpi2c_imx_dma_xfer(), lpi2c_dma_rx_cmd_submit()
  and lpi2c_dma_submit() to simplify code.
- Use dma_data_dir and dma_transfer_dir to replace dma_direction
  for better readability when setting variables in lpi2c_dma_submit().
Change for V4:
- According Aisheng's suggestion, fix code for improving readability.
- Add dma struct, when dma resource not ready not alloc dma resources.
Change for V3:
- Optimize DMA timeout calculate function names and variables avoid confusing.
Change for V2:
- Optimized eDMA rx cmd buf free function to improve code readability.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 525 ++++++++++++++++++++++++++++-
 1 file changed, 518 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 976d43f73f38..f2bbd9898551 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -8,6 +8,8 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -29,6 +31,7 @@
 #define LPI2C_MCR	0x10	/* i2c contrl register */
 #define LPI2C_MSR	0x14	/* i2c status register */
 #define LPI2C_MIER	0x18	/* i2c interrupt enable */
+#define LPI2C_MDER	0x1C	/* i2c DMA enable */
 #define LPI2C_MCFGR0	0x20	/* i2c master configuration */
 #define LPI2C_MCFGR1	0x24	/* i2c master configuration */
 #define LPI2C_MCFGR2	0x28	/* i2c master configuration */
@@ -70,11 +73,14 @@
 #define MCFGR1_AUTOSTOP	BIT(8)
 #define MCFGR1_IGNACK	BIT(9)
 #define MRDR_RXEMPTY	BIT(14)
+#define MDER_TDDE	BIT(0)
+#define MDER_RDDE	BIT(1)
 
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		10 /* ms */
+#define I2C_DMA_THRESHOLD	8 /* bytes */
 
 enum lpi2c_imx_mode {
 	STANDARD,	/* 100+Kbps */
@@ -91,6 +97,24 @@ enum lpi2c_imx_pincfg {
 	FOUR_PIN_PP,
 };
 
+struct lpi2c_imx_dma {
+	bool		using_pio_mode;
+	u8		rx_cmd_buf_len;
+	u8		*dma_buf;
+	u16		*rx_cmd_buf;
+	unsigned int	dma_len;
+	unsigned int	tx_burst_num;
+	unsigned int	rx_burst_num;
+	unsigned long	dma_msg_flag;
+	resource_size_t	phy_addr;
+	dma_addr_t	dma_tx_addr;
+	dma_addr_t	dma_addr;
+	enum dma_data_direction dma_data_dir;
+	enum dma_transfer_direction dma_transfer_dir;
+	struct dma_chan	*chan_tx;
+	struct dma_chan	*chan_rx;
+};
+
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
 	int			num_clks;
@@ -108,6 +132,8 @@ struct lpi2c_imx_struct {
 	unsigned int		rxfifosize;
 	enum lpi2c_imx_mode	mode;
 	struct i2c_bus_recovery_info rinfo;
+	bool			can_use_dma;
+	struct lpi2c_imx_dma	*dma;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -305,7 +331,7 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 }
 
-static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned long time_left;
 
@@ -451,6 +477,426 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 }
 
+static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
+{
+	if (!lpi2c_imx->can_use_dma)
+		return false;
+
+	/*
+	 * When the length of data is less than I2C_DMA_THRESHOLD,
+	 * cpu mode is used directly to avoid low performance.
+	 */
+	return !(msg->len < I2C_DMA_THRESHOLD);
+}
+
+static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			      struct i2c_msg *msg)
+{
+	reinit_completion(&lpi2c_imx->complete);
+
+	if (msg->flags & I2C_M_RD)
+		lpi2c_imx_read(lpi2c_imx, msg);
+	else
+		lpi2c_imx_write(lpi2c_imx, msg);
+
+	return lpi2c_imx_pio_msg_complete(lpi2c_imx);
+}
+
+static int lpi2c_imx_dma_timeout_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time = 0;
+
+	time = 8 * lpi2c_imx->dma->dma_len * 1000 / lpi2c_imx->bitrate;
+
+	/* Add extra second for scheduler related activities */
+	time += 1;
+
+	/* Double calculated time */
+	return msecs_to_jiffies(time * MSEC_PER_SEC);
+}
+
+static int lpi2c_imx_alloc_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	u16 rx_remain = dma->dma_len;
+	int cmd_num;
+	u16 temp;
+
+	/*
+	 * Calculate the number of rx command words via the DMA TX channel
+	 * writing into command register based on the i2c msg len, and build
+	 * the rx command words buffer.
+	 */
+	cmd_num = DIV_ROUND_UP(rx_remain, CHUNK_DATA);
+	dma->rx_cmd_buf = kcalloc(cmd_num, sizeof(u16), GFP_KERNEL);
+	dma->rx_cmd_buf_len = cmd_num * sizeof(u16);
+
+	if (!dma->rx_cmd_buf) {
+		dev_err(&lpi2c_imx->adapter.dev, "Alloc RX cmd buffer failed\n");
+		return -ENOMEM;
+	}
+
+	for (int i = 0; i < cmd_num ; i++) {
+		temp = rx_remain > CHUNK_DATA ? CHUNK_DATA - 1 : rx_remain - 1;
+		temp |= (RECV_DATA << 8);
+		rx_remain -= CHUNK_DATA;
+		dma->rx_cmd_buf[i] = temp;
+	}
+
+	return 0;
+}
+
+static int lpi2c_imx_dma_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned long time_left, time;
+
+	time = lpi2c_imx_dma_timeout_calculate(lpi2c_imx);
+	time_left = wait_for_completion_timeout(&lpi2c_imx->complete, time);
+	if (time_left == 0) {
+		dev_err(&lpi2c_imx->adapter.dev, "I/O Error in DMA Data Transfer\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_unmap(struct lpi2c_imx_dma *dma)
+{
+	struct dma_chan *chan = dma->dma_data_dir == DMA_FROM_DEVICE
+				? dma->chan_rx : dma->chan_tx;
+
+	dma_unmap_single(chan->device->dev, dma->dma_addr,
+			 dma->dma_len, dma->dma_data_dir);
+
+	dma->dma_data_dir = DMA_NONE;
+}
+
+static void lpi2c_cleanup_rx_cmd_dma(struct lpi2c_imx_dma *dma)
+{
+	dmaengine_terminate_sync(dma->chan_tx);
+	dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
+			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+}
+
+static void lpi2c_cleanup_dma(struct lpi2c_imx_dma *dma)
+{
+	if (dma->dma_data_dir == DMA_FROM_DEVICE)
+		dmaengine_terminate_sync(dma->chan_rx);
+	else if (dma->dma_data_dir == DMA_TO_DEVICE)
+		dmaengine_terminate_sync(dma->chan_tx);
+
+	lpi2c_dma_unmap(dma);
+}
+
+static void lpi2c_dma_callback(void *data)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = (struct lpi2c_imx_struct *)data;
+
+	complete(&lpi2c_imx->complete);
+}
+
+static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct dma_async_tx_descriptor *rx_cmd_desc;
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_chan *txchan = dma->chan_tx;
+	dma_cookie_t cookie;
+
+	dma->dma_tx_addr = dma_map_single(txchan->device->dev,
+					  dma->rx_cmd_buf, dma->rx_cmd_buf_len,
+					  DMA_TO_DEVICE);
+	if (dma_mapping_error(txchan->device->dev, dma->dma_tx_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	rx_cmd_desc = dmaengine_prep_slave_single(txchan, dma->dma_tx_addr,
+						  dma->rx_cmd_buf_len, DMA_MEM_TO_DEV,
+						  DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!rx_cmd_desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA prep slave sg failed, use pio\n");
+		goto desc_prepare_err_exit;
+	}
+
+	cookie = dmaengine_submit(rx_cmd_desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
+		goto submit_err_exit;
+	}
+
+	dma_async_issue_pending(txchan);
+
+	return 0;
+
+desc_prepare_err_exit:
+	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
+			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	return -EINVAL;
+
+submit_err_exit:
+	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
+			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	dmaengine_desc_free(rx_cmd_desc);
+	return -EINVAL;
+
+}
+
+static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_async_tx_descriptor *desc;
+	struct dma_chan *chan;
+	dma_cookie_t cookie;
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		chan = dma->chan_rx;
+		dma->dma_data_dir = DMA_FROM_DEVICE;
+		dma->dma_transfer_dir = DMA_DEV_TO_MEM;
+	} else {
+		chan = dma->chan_tx;
+		dma->dma_data_dir = DMA_TO_DEVICE;
+		dma->dma_transfer_dir = DMA_MEM_TO_DEV;
+	}
+
+	dma->dma_addr = dma_map_single(chan->device->dev,
+				       dma->dma_buf, dma->dma_len, dma->dma_data_dir);
+	if (dma_mapping_error(chan->device->dev, dma->dma_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	desc = dmaengine_prep_slave_single(chan, dma->dma_addr,
+					   dma->dma_len, dma->dma_transfer_dir,
+					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!desc) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA prep slave sg failed, use pio\n");
+		goto desc_prepare_err_exit;
+	}
+
+	reinit_completion(&lpi2c_imx->complete);
+	desc->callback = lpi2c_dma_callback;
+	desc->callback_param = lpi2c_imx;
+
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
+		goto submit_err_exit;
+	}
+
+	/* Can't switch to PIO mode when DMA have started transfer */
+	dma->using_pio_mode = false;
+
+	dma_async_issue_pending(chan);
+
+	return 0;
+
+desc_prepare_err_exit:
+	lpi2c_dma_unmap(dma);
+	return -EINVAL;
+
+submit_err_exit:
+	lpi2c_dma_unmap(dma);
+	dmaengine_desc_free(desc);
+	return -EINVAL;
+}
+
+static int lpi2c_imx_find_max_burst_num(unsigned int fifosize, unsigned int len)
+{
+	unsigned int i;
+
+	for (i = fifosize / 2; i > 0; i--)
+		if (!(len % i))
+			break;
+
+	return i;
+}
+
+/*
+ * For a highest DMA efficiency, tx/rx burst number should be calculated according
+ * to the FIFO depth.
+ */
+static void lpi2c_imx_dma_burst_num_calculate(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	unsigned int cmd_num;
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		/*
+		 * One RX cmd word can trigger DMA receive no more than 256 bytes.
+		 * The number of RX cmd words should be calculated based on the data
+		 * length.
+		 */
+		cmd_num = DIV_ROUND_UP(dma->dma_len, CHUNK_DATA);
+		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+								 cmd_num);
+		dma->rx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->rxfifosize,
+								 dma->dma_len);
+	} else {
+		dma->tx_burst_num = lpi2c_imx_find_max_burst_num(lpi2c_imx->txfifosize,
+								 dma->dma_len);
+	}
+}
+
+static int lpi2c_dma_config(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	struct dma_slave_config rx = {}, tx = {};
+	int ret;
+
+	lpi2c_imx_dma_burst_num_calculate(lpi2c_imx);
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		tx.dst_addr = dma->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		tx.dst_maxburst = dma->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(dma->chan_tx, &tx);
+		if (ret < 0)
+			return ret;
+
+		rx.src_addr = dma->phy_addr + LPI2C_MRDR;
+		rx.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		rx.src_maxburst = dma->rx_burst_num;
+		rx.direction = DMA_DEV_TO_MEM;
+		ret = dmaengine_slave_config(dma->chan_rx, &rx);
+		if (ret < 0)
+			return ret;
+	} else {
+		tx.dst_addr = dma->phy_addr + LPI2C_MTDR;
+		tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		tx.dst_maxburst = dma->tx_burst_num;
+		tx.direction = DMA_MEM_TO_DEV;
+		ret = dmaengine_slave_config(dma->chan_tx, &tx);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void lpi2c_dma_enable(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	/*
+	 * TX interrupt will be triggerred when the number of words in
+	 * the transmit FIFO is equal or less than TX watermark.
+	 * RX interrupt will be triggerred when the number of words in
+	 * the receive FIFO is greater than RX watermark.
+	 * In order to trigger the DMA interrupt, TX watermark should be
+	 * set equal to the DMA TX burst number but RX watermark should
+	 * be set less than the DMA RX burst number.
+	 */
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		/* Set I2C TX/RX watermark */
+		writel(dma->tx_burst_num | (dma->rx_burst_num - 1) << 16,
+				 lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX/RX function */
+		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base + LPI2C_MDER);
+	} else {
+		/* Set I2C TX watermark */
+		writel(dma->tx_burst_num, lpi2c_imx->base + LPI2C_MFCR);
+		/* Enable I2C DMA TX function */
+		writel(MDER_TDDE, lpi2c_imx->base + LPI2C_MDER);
+	}
+
+	/* Enable NACK detected */
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
+};
+
+/*
+ * When lpi2c is in TX DMA mode we can use one DMA TX channel to write
+ * data word into TXFIFO, but in RX DMA mode it is different.
+ *
+ * The LPI2C MTDR register is a command data and transmit data register.
+ * Bits 8-10 are the command data field and Bits 0-7 are the transmit
+ * data field. When the LPI2C master needs to read data, the number of
+ * bytes to read should be set in the command field and RECV_DATA should
+ * be set into the command data field to receive (DATA[7:0] + 1) bytes.
+ * The recv data command word is made of RECV_DATA in the command data
+ * field and the number of bytes to read in transmit data field. When the
+ * length of data to be read exceeds 256 bytes, recv data command word
+ * needs to be written to TXFIFO multiple times.
+ *
+ * So when in RX DMA mode, the TX channel also must to be configured to
+ * send RX command words and the RX command word must be set in advance
+ * before transmitting.
+ */
+static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			      struct i2c_msg *msg)
+{
+	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
+	int ret;
+
+	/* When DMA mode fails before transferring, CPU mode can be used. */
+	dma->using_pio_mode = true;
+
+	dma->dma_len = msg->len;
+	dma->dma_msg_flag = msg->flags;
+	dma->dma_buf = i2c_get_dma_safe_msg_buf(msg, I2C_DMA_THRESHOLD);
+	if (!dma->dma_buf)
+		return -ENOMEM;
+
+	ret = lpi2c_dma_config(lpi2c_imx);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "Failed to configure DMA (%d)\n", ret);
+		goto disable_dma;
+	}
+
+	lpi2c_dma_enable(lpi2c_imx);
+
+	ret = lpi2c_dma_submit(lpi2c_imx);
+	if (ret) {
+		dev_err(&lpi2c_imx->adapter.dev, "DMA submission failed (%d)\n", ret);
+		goto disable_dma;
+	}
+
+	if (dma->dma_msg_flag & I2C_M_RD) {
+		ret = lpi2c_imx_alloc_rx_cmd_buf(lpi2c_imx);
+		if (ret)
+			goto disable_cleanup_data_dma;
+
+		ret = lpi2c_dma_rx_cmd_submit(lpi2c_imx);
+		if (ret)
+			goto disable_cleanup_data_dma;
+	}
+
+	ret = lpi2c_imx_dma_msg_complete(lpi2c_imx);
+	if (ret)
+		goto disable_cleanup_all_dma;
+
+	/* When encountering NACK in transfer, clean up all DMA transfers */
+	if ((readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) && !ret) {
+		ret = -EIO;
+		goto disable_cleanup_all_dma;
+	}
+
+	if (dma->dma_msg_flag & I2C_M_RD)
+		dma_unmap_single(dma->chan_tx->device->dev, dma->dma_tx_addr,
+				 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
+	lpi2c_dma_unmap(dma);
+
+	goto disable_dma;
+
+disable_cleanup_all_dma:
+	if (dma->dma_msg_flag & I2C_M_RD)
+		lpi2c_cleanup_rx_cmd_dma(dma);
+disable_cleanup_data_dma:
+	lpi2c_cleanup_dma(dma);
+disable_dma:
+	/* Disable I2C DMA function */
+	writel(0, lpi2c_imx->base + LPI2C_MDER);
+
+	if (dma->dma_msg_flag & I2C_M_RD)
+		kfree(dma->rx_cmd_buf);
+
+	if (ret)
+		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, false);
+	else
+		i2c_put_dma_safe_msg_buf(dma->dma_buf, msg, true);
+
+	return ret;
+}
+
 static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 			  struct i2c_msg *msgs, int num)
 {
@@ -477,12 +923,14 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		lpi2c_imx->msglen = msgs[i].len;
 		init_completion(&lpi2c_imx->complete);
 
-		if (msgs[i].flags & I2C_M_RD)
-			lpi2c_imx_read(lpi2c_imx, &msgs[i]);
-		else
-			lpi2c_imx_write(lpi2c_imx, &msgs[i]);
+		if (is_use_dma(lpi2c_imx, &msgs[i])) {
+			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
+			if (result && lpi2c_imx->dma->using_pio_mode)
+				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		} else {
+			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		}
 
-		result = lpi2c_imx_msg_complete(lpi2c_imx);
 		if (result)
 			goto stop;
 
@@ -546,6 +994,58 @@ static int lpi2c_imx_init_recovery_info(struct lpi2c_imx_struct *lpi2c_imx,
 	return 0;
 }
 
+static void dma_exit(struct device *dev, struct lpi2c_imx_dma *dma)
+{
+	if (dma->chan_rx)
+		dma_release_channel(dma->chan_rx);
+
+	if (dma->chan_tx)
+		dma_release_channel(dma->chan_tx);
+
+	devm_kfree(dev, dma);
+}
+
+static int lpi2c_dma_init(struct device *dev, dma_addr_t phy_addr)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
+	struct lpi2c_imx_dma *dma;
+	int ret;
+
+	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return -ENOMEM;
+
+	dma->phy_addr = phy_addr;
+
+	/* Prepare for TX DMA: */
+	dma->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(dma->chan_tx)) {
+		ret = PTR_ERR(dma->chan_tx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
+		dma->chan_tx = NULL;
+		goto dma_exit;
+	}
+
+	/* Prepare for RX DMA: */
+	dma->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->chan_rx)) {
+		ret = PTR_ERR(dma->chan_rx);
+		if (ret != -ENODEV && ret != -EPROBE_DEFER)
+			dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
+		dma->chan_rx = NULL;
+		goto dma_exit;
+	}
+
+	lpi2c_imx->can_use_dma = true;
+	lpi2c_imx->dma = dma;
+	return 0;
+
+dma_exit:
+	dma_exit(dev, dma);
+	return ret;
+}
+
 static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -566,6 +1066,8 @@ MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
 static int lpi2c_imx_probe(struct platform_device *pdev)
 {
 	struct lpi2c_imx_struct *lpi2c_imx;
+	struct resource *res;
+	dma_addr_t phy_addr;
 	unsigned int temp;
 	int irq, ret;
 
@@ -573,7 +1075,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
-	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
+	lpi2c_imx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
@@ -587,6 +1089,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	lpi2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	strscpy(lpi2c_imx->adapter.name, pdev->name,
 		sizeof(lpi2c_imx->adapter.name));
+	phy_addr = (dma_addr_t)res->start;
 
 	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
 	if (ret < 0)
@@ -640,6 +1143,14 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	ret = lpi2c_dma_init(&pdev->dev, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto rpm_disable;
+		dev_info(&pdev->dev, "use pio mode\n");
+	}
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.34.1


