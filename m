Return-Path: <linux-i2c+bounces-15252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B7D39417
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE0053031369
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CFE2EBDFA;
	Sun, 18 Jan 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="LWJ+v6L9";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="LWJ+v6L9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023098.outbound.protection.outlook.com [40.107.159.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7A2E7BB4;
	Sun, 18 Jan 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.98
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732171; cv=fail; b=fdK2cCmXzd1aBRrQw5BtuVFd4R/ccjwLiBJ0J2ymE0xr9KJCyVmo6QhjdJn8SkKUA3K24hzw+EMQfzmJ9RndUfGbXFuslVbg845FITEYl2hL2Wp3Ig04dBkAbw9emsMGzb09/0YiKrChbAvAJ2EXsWQFHXVUxA4fIPC6piLcg9c=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732171; c=relaxed/simple;
	bh=IuPheYGH+lSPEb9HuW+RyIfNZwsN3DuPIhGk7kYkEkM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q55+ekvjt3tWRMlvH4ZHZqvod+YwIDNbv9CzGQtGldNEpkve3yo8eTcDTNwNOKLClpK5NXnXUL+WwgJBrUrwGAoKA9S8BT97338Bf3ZRP6mqDGzBxbacjw82qZlLRAdfhepafZhxcNx4Y9AgTqEnWUGmb89sqnqh5e8utNmJ5M4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=LWJ+v6L9; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=LWJ+v6L9; arc=fail smtp.client-ip=40.107.159.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vmhZsSdk5AJTn8xaRdc7dzEy2awt+e6SPRPVnTJJN4t7lbKU+bqSRgNueLI3URrJeSNzf0cjtyyiUVH6D66PM9NJnnFxuNoXTZQtk2xQMlbUbHtwhemW6xsnm4dQ8CHhqRbCTnRlSqmIep5OdHMrrj/QQU2fsg56fanzMzUfu857oB9m1dh2HQ5MJ72aF8/teZeXo47Gzz/fd2opfXTutOxLIxhgiHopmxe1rcsbvwISttlIzwsbVeLKGvnBXq1D98VfeM4bFPqsHIfyJFDRe//U4vVzM2tgUaQOIQ2mUQMeuqnEHo1iUK7+oshOnA2xysdr2990mPu5vA8AQqgU4A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjzZNAGaUt2CgGZ3DbY4ILyKnzQXxS+kftXIto706Cc=;
 b=m/A30kfU1tYD69fJAZiN3TQXWr+UdH/MqmavhBOwLKkdZkf4b37SQcT3bBcyCRsdwmen9gFm2NDCsd3FPdVXy3MtICXPb7TfqhGfmns3OV5C9sSpkgfsWiOP1gjWHYwX/4v1MnRfGNo4SoqCAI8mG//iQgaXKezxVq7U9iK0v838CsAeLpXzjztCy0oyG/tItYfoZa5ddAMlUG5lRYHhxts70mAc4/lz199mTZkMvcQ3xTikYMKTvd8e9ojTNJRqgFjrrONufzQZ9t8dG0Lhoem7xTEjbPwn71C1rxvid7PhqBzwWe00k21FdOP8mLbE9PTUaIqszHnB9donv3UZhw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjzZNAGaUt2CgGZ3DbY4ILyKnzQXxS+kftXIto706Cc=;
 b=LWJ+v6L9x9bpP/BNRvQnXJneaQHMOB7xB4O9NZyLvxHzoBKKzWGFK0Fvs6sX9AAcdLpjG+J6gKE3PTYRj37k5SVF6rMkHx6TDYpqkhEgmOzDAewFqwXBbVAi23Z73c89xXOMEmdMwDJ9Z74EFH2hj4GCO2NNBbKT75EVM7IGYRs=
Received: from AM0PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:20b:28c::16)
 by GVXPR04MB11596.eurprd04.prod.outlook.com (2603:10a6:150:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sun, 18 Jan
 2026 10:29:22 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:28c:cafe::28) by AM0PR02CA0119.outlook.office365.com
 (2603:10a6:20b:28c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Sun,
 18 Jan 2026 10:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 10:29:21 +0000
Received: from emails-281835-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 20D1680151;
	Sun, 18 Jan 2026 10:29:21 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732161; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=tjzZNAGaUt2CgGZ3DbY4ILyKnzQXxS+kftXIto706Cc=;
 b=bmycPAn4z+h80MBYbnZoaPQZkpqUQfVmOgkoLMQxElfoE0lHg9U53RwoVw6reEuaE1RjE
 2HyFnnUv2SUVw+u5WFK97kxgOprTZ+l3WNmyzd57mXXEythVNKt2zq1npDf5zrk6vnm9mV+
 IW0V3TAxgVrsqnNeu/GZ3TbvEsOeorI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732161;
 b=Pmp0xrSrpOg0okULOBETrokll7iYvfes4v8iKWkO1M3/Q9bBpORayHNJhpdnTLBdqU94W
 2NVIpuVa6oH31JkimcPhr2lhio4I6GcWUwz2440GF1YbYwUKlZHp+uJbPfd6q4b+/nDYxKd
 ZWki55KvlQwFkww5I0r4EGEqRoTFgGA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRsPgBk2ehRZkqNMWLBgqKbgz6p32ukPORp9QTDQOKDOKqmlUhAb5gt81/ejEZZ0sRn4qaBHiymCVpV/ep6vBSOrbvDOSN9aQJDgC2BuBo3dLIKkD4YqrwYOuFE7JlKR0g+kHJHHF7yrtpnHLXGwfZ7RpzB2xvQPhibFJCj0E9l/hPu52Bnr7wWxk3nirKysDff68SSCeilYPleqW1w//Q0Tk2MI/c8qMXyeO8y+k58GOxrMrcQjkxGk4gjjy5ls4AWLOVDr+eqbVHkukiZ39jFcSG+roGGm2OTZKCi/8jtZ0FcwtQn0P9rvGAvNMCDbDmz3XMLpORmQDNteh35Z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjzZNAGaUt2CgGZ3DbY4ILyKnzQXxS+kftXIto706Cc=;
 b=TboN8klHAw0lirAl9km7nHMJjVfrzOfCGqJkTEGuVn+txxfMamkFL6d4TXMX+tJFuDc377rAYp78c3qYItNmO4OsNnvoR3Qxss4COJbTN2tGVExVORMkmsPWJ40sBFY7Kjhu2J85D+ayqY3o5PV9K4ned3qbf5+87p29DmirveG6BiZYFkE7iPb6GgQRgZpeYPESzLlaPF3WQq0zeUCoZI98CVfLicfB4uezIgYfrzr6N652C5NTOBR02dmZNI9Vh/fBGi+aHGc06NJDHQr2nIKgBl8qZ5Zei6wWE75VO5/7huYoVkc84mHcqDkbPN81f/4H4yfdbMzHLCH107RbZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjzZNAGaUt2CgGZ3DbY4ILyKnzQXxS+kftXIto706Cc=;
 b=LWJ+v6L9x9bpP/BNRvQnXJneaQHMOB7xB4O9NZyLvxHzoBKKzWGFK0Fvs6sX9AAcdLpjG+J6gKE3PTYRj37k5SVF6rMkHx6TDYpqkhEgmOzDAewFqwXBbVAi23Z73c89xXOMEmdMwDJ9Z74EFH2hj4GCO2NNBbKT75EVM7IGYRs=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:13 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:13 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:28:59 +0200
Subject: [PATCH v5 3/7] mux: add help text for MULTIPLEXER config option
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-3-3c37e8872683@solid-run.com>
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|AM1PEPF000252DA:EE_|GVXPR04MB11596:EE_
X-MS-Office365-Filtering-Correlation-Id: a00e7630-6f75-48ba-a795-08de567c7193
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UVFjS2FxNkFOSmZHYTMwR2c0VjE1Y3haQUU5N1JxNHJ3UnJyR1pHZmZnZldK?=
 =?utf-8?B?QldnN2c5a3lkbElZY3pWUGE5ZjQ2VHBYdzdFUXU3TXJOUWNEK1dndzRBNitS?=
 =?utf-8?B?UWR2N3dRbWJ4bXVTenJXNjFhaGtpZ3gwRlk2NHdRZU5vZ1FOeCttbERSc0Zy?=
 =?utf-8?B?WHprdXMxaEdNQ0loS3lZak8wOTU1anp4NUl1TTh6RUluWjZ2cjBVcHN3d1gv?=
 =?utf-8?B?RUpTN2VuOXcxRW5XbDluQ2lwa0pUUVpvbGhBNUcyNzJKTlowTnVVL0VOZ0Ez?=
 =?utf-8?B?bmJiL2dXejNjRjV4VEpXNDlPQVdRVHd4bksvaXRBNzNlMlh5ZHZpMTBIR1pI?=
 =?utf-8?B?TGNoQ1dUNmprdXZvUEEyckRSTEd6UEFCNkVESkt2RGczQ2JpZGQzVzJ4UFpB?=
 =?utf-8?B?OHlJcis1K29VcWovZGl6L3NFYnNubFNKcUNwdXZCZEVLWVNKVWE5NHcvWU5V?=
 =?utf-8?B?L2VYM05iL0FWeGFpVnlwMG9WMEFwaGJXakEwZDNvMndtUHBzR0xKbHB1bVhT?=
 =?utf-8?B?VTBMS095VFQwNVc5bzc4MnZ2bWNOVHlqUU1vZ0w5TVRPQittU05YUDVQWlh4?=
 =?utf-8?B?ejNmVE1kRFdadmxPQ1JWTEo4WktUYzRoVk85SktkbEFXUTQzb1lsTFpRNHZZ?=
 =?utf-8?B?UUhvT3MyYnd6VUFVdm1jUUMvRXRLS01lQjEzaDBEUFlGTFk0TkYzaEVYaW9I?=
 =?utf-8?B?STBiOCtMblJGYi9XbUtHUFRVNjZCSUplZUw0aDQ0K0ZpUzRDZDFFTmNUV09O?=
 =?utf-8?B?Rzh1L2o2N2lXdUdrRmNDQVNRL2lCMk94cXEwSEQxSnBtWFBJQ3paS0Fmd1V1?=
 =?utf-8?B?YXZYL0ZKVTlRVkRlL1hBQ3ZQYis2SnNKRjUzZXo0QU9yNmVjTWRNYytQS1lw?=
 =?utf-8?B?YVVVLzNjTkhYd00xc3BqZDh4T0x2WVpidDQvQitxQ1hKZUcrcytXU29rOVVs?=
 =?utf-8?B?c1BsSXVtZFJWczM3SUs2SlJETENCcXdEd1R6K3g4QkpRMFM0eStvWkl2VGJQ?=
 =?utf-8?B?V3JtYWFKcmdYQWlmaktlVkhKL0w0QzZKLzFQTFJJbEZUSEI3a3oxU0hHWUtJ?=
 =?utf-8?B?ZDVwTFJHbWVaY09jTm9veUFEQXhQam1Mcy94ejRQOUJyYld1YlFXSGRHUml5?=
 =?utf-8?B?STdLeDZPU0s3bDRZYTY2U2VBOWlCbS91d2J4SGs5OExTTFBDcFZRaVBoa1Nr?=
 =?utf-8?B?NFpCK2lwSTh4TVV4YmQ1eWVJZm9HR0hhb29HZWZiSUF6K250Z0hwK0xMeXYz?=
 =?utf-8?B?QzQ2Z2FxWWxGSllPcEh0VTZwRVVQN3FMcFlzUnFXMlc5MkJlUDZDS2FYR0Uz?=
 =?utf-8?B?Z3FLYmxlbnJCbUh4YkdCT25IZnEyODlzZmh5a0hpRmxwQXVMcnhuSk02OGp3?=
 =?utf-8?B?azV4QWh3Z01hZmJEZW5yMWUybk55ejVFei96aUdmQmZpRHpSNWJRanF2UmZH?=
 =?utf-8?B?bURWVldvS252L0tKREwzaVF0NGxHejhXb1NkVlNVU1c1MStHaGRNV3E1N2JT?=
 =?utf-8?B?QzErTy9LMDlwVVdLQldsb01OQTJoSFJJNHJWOFlKd3ozeUtiWHNTZkM2ektj?=
 =?utf-8?B?U0VvZ1JlSHhEK3drMnpFR3dWUi81WlRrVXE0V1pSMGtRQm9vVEZoclFEOVNv?=
 =?utf-8?B?aFord2NqZzRNK0RpRmRNQW9uNFhBUXg2OFZCKzZTRHlMNnpXTU1lMGpZaWti?=
 =?utf-8?B?SVk2QmhMcFhUQ1kvZ0FnWEhDeVFjbWNKLzhaYzZ3L3dubEhmZnpPL1Z4b25W?=
 =?utf-8?B?bDROb1VsQ0Q4U3VzYTQvdXU4QkQ4cXJldGZyUEVXeExiQVB3K3JGTHF0MXFM?=
 =?utf-8?B?eDZBa0VVQ080ZXZmNzFCN215UGQ0dStsb09XZGhSYXZ1S3hFVEluc2pveGlR?=
 =?utf-8?B?ZFFTSU9mOXZOTWFZbXFhQXhRUHhhK29kVjRtZGN6dXRSZy82Q2xEY0hsZmd6?=
 =?utf-8?B?cWJwWnBxL1JLQnRwS05QRWdlcGd2NFpqUEFNODV1ZWNEeFkwRXN6dVJRSnl3?=
 =?utf-8?B?amFKeXRDZFYrbTNsSXViVFBMeEJhMVBDNGppaTA1eS9McURGTE1JTm5Ea0hr?=
 =?utf-8?B?K1pYcHR4eEhOeVJQY3Y1cXlwUjREdHIwb0ZKZmhhS3o5R3lmc1h6azRTUlNi?=
 =?utf-8?B?WFR2a3pOQ2wzZm5TcU05aDhCS3dxMWVVSWRlU3VINXlZcUh2MXB2WVVycnNj?=
 =?utf-8?Q?KZjcxsqqat7CsJIo/B2aoa0Nvgk7FGRvodTO5dDXBzjG?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e16379cd77704973a1897acfd8ae6368:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a8422e97-0cd7-45e5-60e4-08de567c6ce1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|376014|7416014|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkdtQ2ZjcUxWNlN2Zi9FY1hUR0x0djNDK1RZMnJoNmtmV05hTU9HNzl4RTlB?=
 =?utf-8?B?MjBSdXRJaVVha05EczdwYkorZ1A3MDI5MzdkaGFtYXhtajhNM2w0K0FRR0dY?=
 =?utf-8?B?Um1lL0I3YWFOZlk0Q1lUZC9IQ0loZWlHSVFST01uYTlNRnMzd0NsSEFpWWxX?=
 =?utf-8?B?UXhkeXV4TU82SUk4ellLWDlUYnZIbEhTbE5TNUMvamVqWWpZTElhOGI1UFZF?=
 =?utf-8?B?dHlFUThBR3g5MkxjTk5sU1RDbUtLY2pvWXQ5WTlMWXlZdlJJMUgyVE1YZHR6?=
 =?utf-8?B?RWVvQ1pCc2g4bUF3VEJKSSt6SzVZNVRZN0RCVnFkNEdIcndxeUFFM3FEblFi?=
 =?utf-8?B?QitRanpyUEZEb3FwU1ltQktJT1lialA3U0pVMyt4SytaZjdwUFpjekZYTFpT?=
 =?utf-8?B?d1gxWVFMRzEwcm9vQzNHUjdGV0M3dW96QytoeFJpOW90ZW92Vis5dnNRbW94?=
 =?utf-8?B?NnlzL3R5dTR6U2VhNjVjMlAyWW5UZ2srMXN6TDYrbmNzU1p5Z0FKWmRJUWh5?=
 =?utf-8?B?MFo1bFpaejM1MHpLYXV3bmZSSFZ0U29CWXluU1pmUTh3V25ubmRiRm03anN2?=
 =?utf-8?B?ZHB2bnQrb0RnL0s2MGFaVlpOSFdIZEV5SmlMY0ZqelhmNE4yeG1FRDEwV21q?=
 =?utf-8?B?YWZrNGFDQ0JFZEF3emJGUUdFMW5sQlR1T2VRRG4yTFdBV0VaZFBYREZpdzUx?=
 =?utf-8?B?QUNiUG01c1ZlTEl5c3NwaXF0V1JIaWV0Um9xUHFXbjU4MW1OcDhZOWxQZW5I?=
 =?utf-8?B?djRnZGdPQVBka2RBUG9YclhoaStCdld1UUJOYk9yMXBxSFNOSGpyYTU2bWVH?=
 =?utf-8?B?TVNzUW9MZU5WRm9jUW9aL1NybkZXWGs4ZkpDaUVTUTA4am9kWTFleGRuUkVt?=
 =?utf-8?B?c0lIL2NZTTAxcld3aFQveFhUWGlzMk40bG5NQnB2K3Q3dkh2WVRVbEtPdGlp?=
 =?utf-8?B?ZnFRdWUwenlscEtKSXR6NExlTi8wUTJCajJycXUwbm9TUDhzd3Y4N2JLSkJl?=
 =?utf-8?B?eTI5MlZZTGcrZkcybUVYWHRuMWZBc0ZyaktYRGk0dmhPUU5XbDBnUFIvSTNm?=
 =?utf-8?B?THEwSkxRamowVGVLMnhYN2F1UG8vby81TVRhUVk3ZGlqcGpXcEdyeVdMZkEv?=
 =?utf-8?B?UEtpT1lPbklqeWpEZkhqaXVsOEM3R2VTK1lkazF6MU0zUnY0MEJQeVEweURp?=
 =?utf-8?B?TW96T2krWlN0T1owdDBLYVhobTRyWm9NQmFiZUQrY3M2OXVHc2hSNWV6WC90?=
 =?utf-8?B?N0dzT3d1eHBjaUMyRkpsazVzQStrYlFGNEdhNWtsQ0lpQ0RUaG0wM0pqdEZj?=
 =?utf-8?B?UzJBT0VZNU96dWc0WUYrUGlqcEU3UWQxSkFLSFhHL040dG9GUDMrRnc4TDdx?=
 =?utf-8?B?N0pFN1VNanpjT29QNDlxbzhhQXJmRnhMVndUdU4wSjRucnRHSU11Wng0eW5R?=
 =?utf-8?B?MHlHT25MRWhzSXFzMEhCdWdSRERLV3R0WmEvZVFkRjNxb0ZPVDg0WjFDcktx?=
 =?utf-8?B?RXRuSG5nYUFyMmc4VEtEdUtQdyswdWtFdnp5aWtCY1NYNFhGd3ozVHlDemRU?=
 =?utf-8?B?NWxxTVRqN05heTJQOTdpTU83M3VvbDlpZDUxUTRFUVZieVVmN0piRitFQkh3?=
 =?utf-8?B?MDNZOHdaUFhHUXVSS0hZSzZsZFhQRFoybDZ5NWszakFBSG81K0Z2RFMySjk5?=
 =?utf-8?B?RzZWakgzdGY4MWRQaktFeks1Q2t0ejBGcG5YMzlFTUlHTmpnRDhkRlJ5bGFH?=
 =?utf-8?B?N0J3K2puWFJuUzBjS0IvejhHTTU5eks0YUpZSTVwZ05aY1N5d21sMDdjVVI5?=
 =?utf-8?B?M2owMnRGV2pVTXUyaHRsb2lraFMwWU1ob0ViVUZNR0dBQW5YZGE1UEJlNVpl?=
 =?utf-8?B?dkZHMjhJQUxQRlZPWTZRaWgvdVlzeUJvZDEyMFhSYXFXN1N5bkdHL3pSRCsr?=
 =?utf-8?B?NnE3QmR5Q1N6VWRZMlhjNitZSWxBRFZ4QUJhWlk4VWZWcEdzTkUzQU5DTXhZ?=
 =?utf-8?B?NzQwQ3RLZ1B2NTBkeXdYZmhCald4a3lxNEliaHZJY1M2SXpWcVg1SUZuTnFz?=
 =?utf-8?B?VjZpM09wY0VZTHpNTGZWY0RMTm5veU85bXdNZEtrV0FkejI1UHV4S1pFUkgy?=
 =?utf-8?B?L0JzU2F5TTNONmNobzMwZWZ6WWRJdDVGbjk2RjBJRWFvRWlNR2NETHc3SWZI?=
 =?utf-8?B?akcxcWlZQ21sSzVOQzVWTmxtNGdtdlE0djJxZHhIVk10cSsyaWpSV1Awc0dN?=
 =?utf-8?B?UTU0czFSNnJtQnhjR0hmZ2piSDR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(376014)(7416014)(82310400026)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:21.3616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a00e7630-6f75-48ba-a795-08de567c7193
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11596

Add help text for CONFIG_MULTIPLEXER to allow enabling this option
through the kernel configuration without explicit "select" driver
dependencies.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mux/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..b2e1abc7c910 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -5,6 +5,14 @@
 
 config MULTIPLEXER
 	tristate
+	help
+	  Generic Multiplexer Support.
+
+	  This framework is designed to abstract multiplexer handling for
+	  devices via various GPIO-, MMIO/Regmap or specific multiplexer
+	  controller chips.
+
+	  If unsure, say no.
 
 menu "Multiplexer drivers"
 	depends on MULTIPLEXER

-- 
2.43.0



