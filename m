Return-Path: <linux-i2c+bounces-10983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9910AB6B57
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 14:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1B0189E2BF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA9C275864;
	Wed, 14 May 2025 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="jpPbe8AD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2072.outbound.protection.outlook.com [40.107.247.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581EE2741A0;
	Wed, 14 May 2025 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747225357; cv=fail; b=s7QfEI0r5884FKsFUkltDtrmNv101Wcgr2bsgmVPovOkwQB42v/rVr8l+olVWp6PW96WdMmPO5EKpzfT0Vte+ifpxpduOl+2/Xcf8Kt0ZcM7/Qy55Z7RaHIonufzTaXScbGlvNrUJCj4ah3DID3/E+KqnSyDbymHdlH4S/2hHrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747225357; c=relaxed/simple;
	bh=VVzHdSoWBjLzTAug6qlQIa9jhEmT0+pZgv/5ETFVPww=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aCMUY4na5S49MTjPvMXFfjXmxC+E/yZCb9d3de76Dm7EpLjyWaBUyIaKndWhRqhcPDGLSI/HSfVIYguUkPNNOY4x7wJtjTFyiHCiw/2ohX62t5ScrMtYC+RZoOHW9mP3ndEuM1M7POxUb07vMxMkYRNb0tqR6BqFxEC+pwNHyNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=jpPbe8AD; arc=fail smtp.client-ip=40.107.247.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTneJmmKiCk9kQoUl/gNg9UlhGKRJNlzC8a/Y0HovXeAkKy3CvJ0VljdeFJvDg48FqjL0dZbx/+l2dSLc5d6/JPd8NhNy82CrrVAQxFmaKHCJ1+WrOhnFAn2bYIPcMTQ37mrO9FhVgHNfqdhXiJFf2StF7ux3GUXM5u0+UqZcfW5L9rD95zMV0vAupcp0Txht48c2FSoZBSXg5AxwTozWsrq5lzow2Kar9b7lEJXuxrEGUaBES16TFkAu8CgPg6s5DYwWKHV1sQrAducO40dNmXHkstwpfW4YoOzEO4tFV6wh4YnGI8HMOC4nZEa8vS3E2O8+c9ES8Nbf27jmN/+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI+GH9EHg/bJQmwm+CI+t21umN2AwnOZyRTlXOToPmY=;
 b=gvN6xrU/RVrQGwEBUxfPb90QIS5K8Tx+yZ6X0jpg1QbUBb+JN2Viq56TfmlyJvRX8zlrphdZbmqXwgZCG2lKrOgLspTQA69SdSF2kqoYF2NbUPjMZKr0TbfkH0lJA25qUUHaxHy+M0nK5nU+blmEc0ZZStiRtf7Ep5kSbQoJxy6wtNay7XEhUp0uaEAxZJPyVJcmtGTvLi61ZSPpG7AMCxBYQdI2upvejYqgQStir0PeOT7Ejld6Fm95gStsfcuQ8u6laTjp16ub4CpN4D1vvBcnTSnFu/YdSAqNPOLZTF80Rv/QJ2CcWGdGp0BVFHelTTPe2f8PUtjWnP9LOvOSmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DI+GH9EHg/bJQmwm+CI+t21umN2AwnOZyRTlXOToPmY=;
 b=jpPbe8ADwCJFXVz44LDZp5KkEK0oEBkAPTjCBtXrjpbJh8Wc7w2RYgjq8iOT25KttuO8koEqD7O+nelnlStOC8U9T/3BvTYaWcO1VudnpIVGKpDnXvhAZSnOtBMTdJD5omDruSs5Ae+9al0Nvrar+uy8DS6s/OwMbrn0OomAFEZrT5ETDSCJy8Kal0ZCVqwN92YLsrU4XDqWubhRnG1v7I18Ck61HYs+/xN+8urW3lnUVUh9Ufo99TOO2DY3ZA5iTSypkSb1XLULtSgnIVLwAp0+0U+ACVkMo0iGgZ1AbSLZ+4/upC57yCm7AF39B/pVKguP738YQOo4x6lb5aSoYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23) by DU0PR07MB9140.eurprd07.prod.outlook.com
 (2603:10a6:10:404::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 12:22:31 +0000
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa]) by AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa%2]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 12:22:30 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	mariusz.madej@nokia.com,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v6 0/2] i2c: muxes: pca954x: Reset if (de)select fails
Date: Wed, 14 May 2025 14:22:24 +0200
Message-Id: <20250514122226.3267855-1-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3794:EE_|DU0PR07MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: cd22e70d-052f-40f5-1864-08dd92e1feff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R9FeXCkZ2FopxS1KbmbQgtLaOliMKDigD4a/Ta25yGEGxrbKCDj7yYaLCL6G?=
 =?us-ascii?Q?yzajaIUrboN0q6M+2RzBgnOqtAa7tBnDyICDC/Ms5IZ6VrJ12HeyyHZLz1pm?=
 =?us-ascii?Q?3WufTCdBhImWKOrD17iOXdenfrBJnATTIv0w106QmQhdmv+Bt7Ce8DrHb/bX?=
 =?us-ascii?Q?76LQse/2UFAXiUxo0B+tPsN5jTpWVl7vjJ27ygyKGsRALU8GaDZ5XIvdDXq1?=
 =?us-ascii?Q?F4DXl9SIa+IrShKhGoRnamtZOaGLcpj3VOktDcVOHE+VCjwtFfLOCI5eyWxm?=
 =?us-ascii?Q?Ljfrayb01sU5Z20tAbXF0SQugDLz5g8qA336rU9l6nwquMKHVxLPy6IoqJQt?=
 =?us-ascii?Q?bv41CyHojiiJFxESAxKmBdBD6Q2Qj9WcHLMbcAzJE/XQdzqw2zDrMyL0dPIC?=
 =?us-ascii?Q?LwqPGaUGbFluhufylgrgCVqKREP+p1ZAgMIIqBP3WxcJTU9sSU1pvxhV/36S?=
 =?us-ascii?Q?/h1Qw4OTqhdY8gwhg1xZEdf/Sm1kGbIWQQlH7fr5LFctmGJlV+UHI7S6JZWg?=
 =?us-ascii?Q?Mb/UsJZHp26iWs6ctgdGSPuYCLHnIbpyKpyiCX5qK/fKbuu7pOB5yC7nzgN3?=
 =?us-ascii?Q?SNwzHxFnDwbFZTD8nbbFwsfpuwAg4qnX9A7j6we0QQCWxCHFuVrb4WdPqvbR?=
 =?us-ascii?Q?KxNiCD2xTwN8E7Jua/FZ49qhsREr3NgY85ZuqX01+ppKKtcuBZKFft1W/sDD?=
 =?us-ascii?Q?hriXrvGxYqIk1z1Y8IG0idmGehF+yXZarObyfzb2xsKHMacbdNbu1x84YSD0?=
 =?us-ascii?Q?E6N7ZjIl00mTsBGUje5J3tvbH1yz1Hmzy4XFxE9IMtu1oLy72sKwbMp9Ah/t?=
 =?us-ascii?Q?y7ChP/d15PR6+haAUCVdaeLREfdcnXPej4bikKG+FwHzbZMNjZg3UOzF51wT?=
 =?us-ascii?Q?2e0MG+qGakewUElE0SjrEIeF5bAliBw1ZESD1ETrSW1H4vD3D9hQCUTgL+1Z?=
 =?us-ascii?Q?hTTiStJEnwr0I2u/CR/zDDDjD+VMMkkqVkQY7Igk2r9djdT9fsUQjGcDxsfw?=
 =?us-ascii?Q?eNxdOIlNxKe2uBGG6md3IFcEeEoBrC66OlQiCm3oBlSc/94nwAq+6fvo/y9Z?=
 =?us-ascii?Q?C759M+VrciTqXv60U3iBU2bHDNBjNsCHVobBn7rbR5KCpVgJrX0hMDSm2Ie6?=
 =?us-ascii?Q?kTc0UYb+XuY1jhKOTcReqJ4i+4HuQQQK6NwxwzVpqBoxJKJgud9HKmFrPKdr?=
 =?us-ascii?Q?irAgscIzOx1g+kQxpuhC6dB7cDWWYGpSS+rEbVMJjR3Fjza0ThjdK6BP7pss?=
 =?us-ascii?Q?7Z/xJtBXenn+yo+t5Vq8Au6yQ8HANaUH1rnfNEEbL7pXNJkC9uBgpYbVcPAC?=
 =?us-ascii?Q?d7xcCSoFl4C6KoZ8Y23cCEH42KO/7KcN+qa6c3WZPBuF/HDoRtKhcZd1mAPb?=
 =?us-ascii?Q?ORwgBm31VmRVxwojBl30EQENdcw6WOvzRmX/6ccBoHonZHU17Z3NrKFiWMaH?=
 =?us-ascii?Q?sswL0oam9VU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3794.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qBYCmC2XYvXZSDMD/iPGmCZFbbpppLWvBc9sgFRJLad9PwL1uS7D5UodNcsk?=
 =?us-ascii?Q?wUjuORrjVuBorrTYtCmJdPZYPYl3zPm0UhU8k4rPhblrCA+kceg6dJ27qwbJ?=
 =?us-ascii?Q?+Td74mYkYEPc/r4ZHQEfG8HZOo0HOs0qR4N4beolqOGIrnJeXxKV/YArcRES?=
 =?us-ascii?Q?3ZcKzD3vN7BuOBCIsBm+tBWB5TEIc4Yginvbp3jZyPd3rUZDcNyM8ay+QdoH?=
 =?us-ascii?Q?7RoWCfiFYziungGFERUCZLGE2kHbSpIEGf+EDW1Orvvl5ZLb6I/ChLth2+se?=
 =?us-ascii?Q?nrkTMlMzuV9HmfCZ518Dz3XQ7s5/0VAKPXRgEOLydqGFJ/X8Ayi8W4jac3ji?=
 =?us-ascii?Q?fJISQcCFHu6hdaXnVyS6j7CUZnaBZbqNQ5AQGSO3IfPjlz8Kzrc9jJdiXXfB?=
 =?us-ascii?Q?YDwRS8I7Yzf2a3P7ypCEd+uY3WrvebRhX0lGzvBEZ7nQxenIlMZ3qzaUSOx2?=
 =?us-ascii?Q?PLKS+mm2q2YOS/cXmBXXQCe0flxfy48Lv79CkHDSXF4XQWaYvVp6nYEwCLgi?=
 =?us-ascii?Q?KRe+sEyIvactdqyarr2UxKDwC8pDaTbic4JZOnom1EfuRhQOwBgSVNW2wWg7?=
 =?us-ascii?Q?YMSYtiQdX4ioOIDqRwo7ed5KH6wxH0+f9lV2IWmMGn+rJfZaL20lI6s3G7VD?=
 =?us-ascii?Q?3o6loZIqexeN4NK2kfkQz8fgWh6WmeA/c6G3MJojzVgLcePbfG74oWShzCwY?=
 =?us-ascii?Q?btRsjw9lLnFi8sMDTTr6j/+E0ZGbOggKJi63cpf4nytLJLWThYssoCcqf+FN?=
 =?us-ascii?Q?OURsuHDMUE30RZ7IOg8cS+Pm0QpmildPeieG0ZoEaTVvdEqJoyt0umvzAs2+?=
 =?us-ascii?Q?97OvHEq/g0z+X2GgqxXwBAdl9BlcFDcuds9tk/2JIUyn+RsHK5mrl85sI92r?=
 =?us-ascii?Q?3l5m6GjMJw1O9JbN6Rfb1P3JyIwBa3QOOdLWNAYBE8H/IyBEAkjHebs2RWQE?=
 =?us-ascii?Q?otnGTuE8/9hQE3N8iuLZAIMf6nu7zhcpzs0wCuBEJxQ6e9puQS0mUDjxYR38?=
 =?us-ascii?Q?j1D0bMUBV9lCtetdjPWA7gnUKhfLL/JeqZaxStjSccp+Dlh86Fmp0/QemGmd?=
 =?us-ascii?Q?PpfrNCduyqTCRrU+aO+MLwbVthLhXEqb0BlIMiiex4yFCZflZ9Dgpb98wb+X?=
 =?us-ascii?Q?VQaLRMJO+/i9CwRwCEfHXfnKwbisD4wf82woor30Dn2iKJnUTtsTKmFkRJ1R?=
 =?us-ascii?Q?OpPQIQN3CkNWJY56fmNKmt//WorFxzHrSMFMaRU17EUwp31iZpPt/OoIBJMp?=
 =?us-ascii?Q?1Z0SQmytstQJiGvW2WyUr57YQCsp9PWFIWydaNXskFs4Kue+iGKfIt50BzNl?=
 =?us-ascii?Q?qdRbvckMUcrsEwypHvRETCMO+Cc3py8ptuYGPeMW9wg8HXNgNISmc6FOzVC/?=
 =?us-ascii?Q?zLRXtmdwL6nWbrnIRd+Ji2xGKzvKSUMq0fChnaHqXC8tw8Hpug/qjpV5+tfZ?=
 =?us-ascii?Q?rAfzUIXzAAgLQHc2Aw5bTgt8+7EzhbxPju0fteqLaAYYSzQsn4XKh/3Otdj7?=
 =?us-ascii?Q?590f6e6iP19NHx29iaCq4CQOri4/0/ojwgauuhQGR+uNzBKU9ArKKzzAVT0z?=
 =?us-ascii?Q?uygu0g5zTUIpINu/tRvHv4poxhEvVlVddzedUfN6BToJpPEx4f25RmXLrYYr?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd22e70d-052f-40f5-1864-08dd92e1feff
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3794.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 12:22:30.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBK62P+3Ut9EQxeFZ9nq6Y/PsuDsmA7Pbxotw56KWTjwtEwKJnbtBnbzC8136pihI9T8eolL6jtPPA/SobRYOpoZE6ZwaKjAgUihfhqZy8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9140

The pca954x mux might not respond under certain circumstances, like
device behind it holding SDA after recovery loop or some internal issue
in mux itself. Those situations are indicated by ETIMEDOUT returned
from I2C transaction attempting selecting or deselecting the channel.
According to device documentation the reset pulse restores I2C
subsystem of the mux and deselects the channel.

Since the mux switches using transistor switches, the failure of line
behind mux that is currently connected prevents sending commands to mux
itself, so external reset signal is required. 

The following series of patches removes legacy gpio-based reset calls,
because reset controller framework already uses reset-gpios property
and resets the device when channel selection or deselection fails.

Even through the current transaction will fail anyway, the next will
be possible to perform without resetting the whole system.

---
Changelog:
v2:
  * Removed mail header from the commit log
  * Decreased reset pulse hold time from 10 to 1 ms
v3:
  * Make this functionality enabled by appropriate property in
    devicetree
v4:
  * Fix missing condition check from devicetree
v5:
  * Declare dependency of a new property
v6:
  * Don't add any new properties, use reset controller only
---

Wojciech Siudy (2):
  i2c: muxes: pca954x: Use reset controller only
  i2c: muxes: pca954x: Reset if (de)select fails

 drivers/i2c/muxes/i2c-mux-pca954x.c | 49 ++++++++++++++++-------------
 1 file changed, 27 insertions(+), 22 deletions(-)

-- 
2.34.1


