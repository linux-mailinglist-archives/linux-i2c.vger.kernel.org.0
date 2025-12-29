Return-Path: <linux-i2c+bounces-14844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D9CE70D8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569EB303829E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA716322C60;
	Mon, 29 Dec 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="VhjK6Ay9";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="VhjK6Ay9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020122.outbound.protection.outlook.com [52.101.69.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9331ED78;
	Mon, 29 Dec 2025 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.122
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018488; cv=fail; b=ZHE910QE6mEyQaKJ7a28LC9cGw+ptL0Jj+XA5I4rVjlRCC84pHMrMLiB8atRz3fOAZhSegdjkZIMyZvQWMvaoKJR3UVhqap2dP3ovAc9ApgZqaPPr3xomUcQ2vNkLoXKXW8MfsNtADEkhD7BT7MjyJ/6o/0HRcYdcv6r0llw74s=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018488; c=relaxed/simple;
	bh=YE0hMxWOvCCALZO2rw9tDz7TokZEc6IM6UZykQ5IQNY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OF0UJf6IA3pPqZ/iPqU7WZmIFehd3vkSR+3NaSYCo0/6A9qBlLSuUUBtj6eJlggis0xlrHS5tYVs7kPE05Gi99qhY02PS8AQIiVcaBHYeyoktfGAD+7JhIaUtzYuBQPktFWEafjfz7JHESowBzPaxTd1RCRRW6vQ0YIuz0m9ORw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=VhjK6Ay9; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=VhjK6Ay9; arc=fail smtp.client-ip=52.101.69.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BclpHMouLX+8q9oYOl7+ZjUM+Fs9aT4sEBLUOKbmzFghm/p3KMViXZwXjVzDpHbzvT9djdn/JeKNLDbc/v91PKgHcHLUhEpQeBysU0PVh8Zr0/a80y9D9GiqmXeYRqnZnJifU5jwvdwoLaNGsbSlhCbqj268+m1ZYTJJZxXrULjxtGEeMB1FSeMX4O0MsggRYaazQqkIGCK7Py6/YxMeiwCyEwlqpxOfW2npd9EkoZC39vRgJg2J/Ix9d6YeiWuOTbye5WT6LS9IQNJ3ffQ817RfWwQnJYQcdD1TTg47XH/GQf7+p343jZLQLPO9MuTYmmjzTmr27sassU+qRgxDeA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiMnAP5jChhOnUdhZ2hWDjkB1J6xgLi1qB65z/qrMc8=;
 b=sv1naoMQ4d+I35XRc4CVJGZ2DRNz2Z2swnX3e7KwYkTTK8uJcUn14DgUiXTmi2MvbS93TMZB3q0C3CbYRA4y82qFccCaWLNhs4dgptmqOqcOyvrhXHYGiLGo3/BbLUU2m9MbGR31/ihFSCp6WCUCJ+nwul27GZcz/rC208Neefd9mc7oKBXpIphkn+PW9eXAZMVRDxHahdOKTaRUg0iilL8D3TNZGG9sgB/LArHfMPkhF2R2r5EK0aZZr0HG1NKeKflgVwtn2zHqC5gYsy6TSGqMm7u9gNhxBfLGfSyGLS2ZxAjaC5umRRgoj1A1FdN3d+FxxRu32hHb739STHJsDA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiMnAP5jChhOnUdhZ2hWDjkB1J6xgLi1qB65z/qrMc8=;
 b=VhjK6Ay94B4DnouzOKQKbvIz/jtNJ+zaMkM2/D3oLqUdFJfk/kvcEHXBqBG2r36/BRMUmVeg4j3vRYI2o9TI123oPGKTKI73MQZT0isOHrhQDQZLUGty04LP4A2pEfo141pL4GIk1hgu0b5wGOOcDQjFIr183AOHcCv7rFJqffM=
Received: from DB3PR08CA0013.eurprd08.prod.outlook.com (2603:10a6:8::26) by
 DU4PR04MB10669.eurprd04.prod.outlook.com (2603:10a6:10:58e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Mon, 29 Dec 2025 14:27:59 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::e) by DB3PR08CA0013.outlook.office365.com
 (2603:10a6:8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 14:27:59 +0000
Received: from emails-1996717-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-251.eu-west-1.compute.internal [10.20.6.251])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5A52F80446;
	Mon, 29 Dec 2025 14:27:59 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018479; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=jiMnAP5jChhOnUdhZ2hWDjkB1J6xgLi1qB65z/qrMc8=;
 b=n1SKyucyuMPgCZzILCn67KR7NOkLc5cF++hs7eXWvgIM9SllBDZyOsyKin1nqP6S5VLgU
 EisyVuc9sccyfQssemSt6SJdqzSZkuHl196+NJ2JeNskuuo35IvKg5bEGdEGX7SJTY/pHYS
 SWisus/c7qwTOOe8l093GKFaVPfocpQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018479;
 b=MM5uLRaEvHbSLYy0kMCPxFPYb48txLFhuYhBJk6H4kHUGLQhKgdGtBbQvJPFuty4C+RqU
 EhO2a0FSpcErjA7eJWDyJORC8JgDfVm+GmO75bYooVBl9mZhm4Tyu1BnquBLVgXbaPR515T
 +Wg4Y0gifMvEQ9vOdUMd085wYbZMMww=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQItJMgyQVJrdj3tGUPdWiAbsiQTQ6PwN5uAQSRK+4eFmPAQfakQ/HDi8IpOZsHXQ5CmQB+9QBtd0ozTw0r63LIrn/DAfJu7BC/MBaOe2TMgDUfqfD49sY43j1/YRDIEnjHTzskQ4L4Fzoo/dUR3IAgirfbvWLF+TIbtZe+TyciuH93VYtV2/g3UoNpZahct8iC2YjLZuEI8Z0raWN04YMzCmwGfoEz01pDBc9CTtOqkZmhETcXF8TGHlRgG65DO+pnMFxIqIq/fzle6u/eGZH0S0Me3YLC3x4EsHta+Ya7+YBqUaoGc+4UUMb1RPs8/fklJh4BwzJFoiZ1ciRcMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiMnAP5jChhOnUdhZ2hWDjkB1J6xgLi1qB65z/qrMc8=;
 b=sd7BKGZOGs0qfP14yFOi4/d8Dxz4vlR6E9QlvuZ4gftRrFQ+9quvZtBFioUHbjOWa7KyZ31/lCdUQBCIA846hSE7srh4KfVL4nsreXSpmi3ps7WevoyET5efr/5xq7DkJsD7bCg6JxJ/EZQeshXCqgzQJVq/BFAvS0K3KZVdCAUr8QoNopMQ119dRgDjsPETgED/9836dWcv/9LKN/v9D7rhM1nAiJHCB1BxiynSduYP2CNUMkGmAtJE20DoHUAWQv34NauYeNKIBqQSk8z+hcOT5/yqDLCZxjEBtKYPazCAEoE98JgLXkj2xS57nRvNcxFg0c6D/PrG8gH1GDy9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiMnAP5jChhOnUdhZ2hWDjkB1J6xgLi1qB65z/qrMc8=;
 b=VhjK6Ay94B4DnouzOKQKbvIz/jtNJ+zaMkM2/D3oLqUdFJfk/kvcEHXBqBG2r36/BRMUmVeg4j3vRYI2o9TI123oPGKTKI73MQZT0isOHrhQDQZLUGty04LP4A2pEfo141pL4GIk1hgu0b5wGOOcDQjFIr183AOHcCv7rFJqffM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 29 Dec 2025 15:27:31 +0100
Subject: [PATCH v4 7/7] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rz-sdio-mux-v4-7-a023e55758fe@solid-run.com>
References: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
In-Reply-To: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|DU2PEPF00028D0D:EE_|DU4PR04MB10669:EE_
X-MS-Office365-Filtering-Correlation-Id: 47edb507-4103-4661-7b06-08de46e67785
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Zjd0ajYzS3RyaGlNK1FZejA3eHZpL0ZpdU4yNVljV1ZFTXk1UnF4dmprWWps?=
 =?utf-8?B?S0ZzSDBIeXk5TXVCMEdKMm40SXpZUlF5WGhCdXYzdGFjSElIZC9EMXJNUnFM?=
 =?utf-8?B?ZmlIaE1raGR1TzhHcGNqd0xhemVyeEh1d00zTnc4VC9WbXJtRU1IWm1DMk1j?=
 =?utf-8?B?ZTNLZWFYYUQ2TE9iL2Nzb3R6aWlaREVEY0JNZ244Q3RsaGdzRFVxaEpGbWM2?=
 =?utf-8?B?K0xBVlVoQStWbE85b0MwejJSSlFLSEFVYmh0OUU1V0VxbVkzSXhRZXJ5ZExR?=
 =?utf-8?B?WjlmcHVvRGZqRXNzcDUzVjZ5c1pWZW12UXpuME40WjNTZktnSTU0UGZWZU5T?=
 =?utf-8?B?SGtKL2M4OUFWMEwwVUFZMEdINjlsdlliWjNHcnNiTzhBN09BcTUyeWlvcXlu?=
 =?utf-8?B?dnVjTEhya2pvOEJoay9HVTQ1aFVXVEphazRRRjhycERDMUxXMlF4MFVVVmxu?=
 =?utf-8?B?TUt0VzhDWDA4RlJkQ1E3SFN5dTdLeGdDL0R3eGxBNkFGaHFLODRNRXBRTG9T?=
 =?utf-8?B?a1NCTHVSTk9QaFRmeEFxcUwveDRDRi9BcXpubHMzWEV2aG94bTJHU3c4TC9W?=
 =?utf-8?B?MjZJMzArT2QyMExIZmhUaG1xNzhvZDQweURObW9MMFRITGdQN1VJMEJFTndt?=
 =?utf-8?B?dVJlbjR0NlBaTzBjU29jSmV1NU9uSXZrak1oQ0tJMWU4Y1NIc1ZCSGNhZ3lr?=
 =?utf-8?B?RlJXZUd3SEhJZVkvMUFHamFUYkIrRXZrSEhZaGpFSWQ2dzVZakZKZ1M0YmF2?=
 =?utf-8?B?N3VtWTFzVUVXSldaZFdXNXVkUUU0NU14VVNvQ1BReFFuUWV4UERldmdocm85?=
 =?utf-8?B?QzMveHBPRVVFQmtvSWtkWjBXSlhYUWltN24xeGNmb0JrdmtVWnRoZnovTGV0?=
 =?utf-8?B?WnU4YUkwUU1HKzRQRUx3eWEwc1FUc0toSXFXMGd5WXVBTWQ5bTI2bFJZbTZ6?=
 =?utf-8?B?VkVNUEE2Z0FuRlh3OXVKaE1YN0NtMVJWc2xZZEhieHVmYXpxZXhCejFyUk9s?=
 =?utf-8?B?NUo0ditYeUIzRU44aXlJS2RWU2R4TWpvMjQvZG9qRmxIZVRueE5aVUtCYVRs?=
 =?utf-8?B?cCtFS1VUZGVXMkRSc0svYzZDTmltU0tOTFNxR04vWEduZmxWR1UwVFJPTStE?=
 =?utf-8?B?eFhYWlZ6N3J6M1crSS9HblRhWjI0Mkc2Z3I4a1pOa05ZZzk5QW9BWVMxVnNH?=
 =?utf-8?B?WC9neEJ6VHlDSk0yWFFiNWNTMVRJV3BRdU1IVWVYcHdoL01DaHczWHFTT2dt?=
 =?utf-8?B?aWx6dnFqR2xQT3orcDBXd0d1VWdIY2JWbDlJcnZncHBtdUpKNExabmFoQXlo?=
 =?utf-8?B?aTZNNm94ZE8rY1VvaXZFUS9wSUEyT0hFWTFYYllmRGxvVVFkY3I3L0FOUWhV?=
 =?utf-8?B?ZW9YRDJoVklMM3ZveDl3bEdKbU9Ibk5NWEpjTEthWnlvN1JyTXgvNHUvak9x?=
 =?utf-8?B?M1dsWHdyd2U5ZHB4ZnE0eU1ueXc4SW9sSUNLL2t1aklxaG11eDhYd1BXbFJ4?=
 =?utf-8?B?aUVVdXB3S2xHTTE3L2Y3ZDJvV0g1NFp2K1N1UXB2K2JJdTlvSlVLMHdDZmNU?=
 =?utf-8?B?Yzl6a0tMY0NZWGpQem1kcHlEM0NneWZ2OVNWQ1djM0lLRXdjcFpmeExJVS9G?=
 =?utf-8?B?UklRbmFLeXVKUEloMTNCNEtlTlFQc2hPdXB3VDl4YnBuM0orMzlWa21sbVBo?=
 =?utf-8?B?bi9tYnB1ajFBV3lhdyt5bzB1QkdVT3NWNkJhcXV0b2Y5RzZDY3hhcmlRYlp3?=
 =?utf-8?B?VWxmbkI4ZjJtY1pzaG8zVW9Sd1hWcWtRRkErNjFXR0pjK3Y2cTJYZGQxeldj?=
 =?utf-8?B?OFNtUFFQWCthaHlUOWFMOHZvRUI3NjRlZnAwWEJXRmdWUS9ud3pWOEN2Mk5r?=
 =?utf-8?B?dWkxTmFHbUdteFpNeXNHU0pLUUgzQmdmUTJuTjhtQ1JodlRFenFER0RxVThv?=
 =?utf-8?B?bklHd0xzZHhhSnNtVkFySjRFU08xZWlGbkpVMERtZ09OZ3NLbDdRTnMzZFVH?=
 =?utf-8?B?NkRsanYrQ3pQN3lHRHlZRmZWbjNRT0JFNmIvSUpXM3lKSitMSFQ3Ni90WEUw?=
 =?utf-8?B?aUZaRE16dUVxbFNDS01HRGNVSXh1WGdhTVR1Zz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7b499d8eaa70472297356fd9c40a1cce:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f71d92c6-9c97-434b-807f-08de46e66f44
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|35042699022|14060799003|82310400026|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEVCd3dhcnZzZVRwWG1ZSG5ZcHJFc2pIekVtajN4ZXAyQk5uU2pxUnd6bU9q?=
 =?utf-8?B?V1pDaDV2UkdEY3BqSnBnZG53TXpIVm5Qb2o4dXJtVEFWdzdJUmJLU21yS3lG?=
 =?utf-8?B?WlErS0pCbm92alRCNFNPa2o5WXNKWXdjbUIyVE9EVXZqUGpWT0lwS1FveVBZ?=
 =?utf-8?B?RkRieUptU200MHFoWG54VWZaTlBXakVicjQ4WDc4U25ZY2d0WEFzR1pVU1Rs?=
 =?utf-8?B?K2pFVG4wOTJwSW5vRkIzTlVycDhFQVFYSU1vRlBJekNmNTdBdXRSOGROeU41?=
 =?utf-8?B?T1UzNDFCUlFXa2N3TVQwRjJsMlFBY0ZwWE1INlJxcmdiUDhMbWlPK0VhNVEw?=
 =?utf-8?B?NllWTHNyeXlyemtCWmJ3d1U4L3NKZHpETE9qTnExWnBSNGR5OFlpL0ROb2hQ?=
 =?utf-8?B?dVd5bFRRWVFyeVdsV1pYT3RrL3dyUmx2a0lJSGlZeWNpeExaTkJsNGdWWFcx?=
 =?utf-8?B?bjZTRjVKSUVvNGJVVkZPMzRybGh0c3ZockhuTXhva296UFdwVHorZElFYVFl?=
 =?utf-8?B?MElQWTRiSFc1dXBKQ0l5Zzl6WUU3ZVVObjBCVlRUbTFMMWlEYVdQYktzUGI0?=
 =?utf-8?B?S1p4WWliNEhNdjY2TnJKVVdlckplRXI0UUJ0T0NONWdmc2ZvUm1KWnJITGdW?=
 =?utf-8?B?UWRBTlNMdi9sWFFjd0RweXVCSDJ4SXAyQnpXRmhoUThNMVlyMVRtNVh6dFJL?=
 =?utf-8?B?TlFDZVZtU2FCR0JZVGxxWVNwS0VQeEI1WGNxN3M3bFVjTm1Mdit5a1Q0RmQ3?=
 =?utf-8?B?NHdpUEJlOWpZcHFDakRGUkowYUUxTGpCQTBwRXdyVERhSDBIVEdPazdyNmt6?=
 =?utf-8?B?WmNaS3JRSEhvM3JWV1ZTVTJLcmtLY2tUdnNjSVJUWnhDaDhoWWdMOUU3S0Q2?=
 =?utf-8?B?OERWVk4rV3FDUnhra0cyZ0ZRajl3ajVUQ0ZzbVVjRGt0Zzl1Z1BaU0xNZWlN?=
 =?utf-8?B?WXhQZ0loWDBuWFNTTHEyWEw0UC9VbEhkUUJmN2pUdkp3QURwRGtiSFppTnlq?=
 =?utf-8?B?dUJDSjZCYURBNHhQakV0aFpMVFJBSVU4eG5ncDNaM1gveDkwaXBEb3JvNS9u?=
 =?utf-8?B?ZUN0NVRadFR0RkVOWnFueFFtcWdUWnNSZVd4SVVHK2x3Wi9seGlmamwxUkFv?=
 =?utf-8?B?dDZDL1RXY0IxQmhOc2Fyby9sYk9kbkhXQmxDSVJMRzBXUUhLcDRETW5sdmhL?=
 =?utf-8?B?MXFTd1FtS3YzQzZPbG1NVU8yRm5qbEc0czhicXJMVnBmNEIrNXdoWmFiNDZE?=
 =?utf-8?B?V1Q2SnRJTnYwY1ZUM2NDUXpSVGQ0bzV6MWFCd3FyU1lOcXQzOC8vSCtUZW9J?=
 =?utf-8?B?SmhIaXhnQzZzK2YxaERlZDdCNmxMbGxQVEVJTUJBaU5lRHByYjk1SXJtNHlz?=
 =?utf-8?B?djZWWEFOK2UySjBPZUVoeEU4aXhlYlRldGR5eWZ3aUlNWGROVnlVamlnODMv?=
 =?utf-8?B?N25QVU5mb0RnaDI5S25BRlVORVNHSVROTkkrSDBDWjNrYXRKUG1keUpVeHVB?=
 =?utf-8?B?Z1J1Z2NwQjRiTVo3WmIzWUhtQmk0TWh4WVBiL2tZblpaMFRWa3F2a0pnS1pR?=
 =?utf-8?B?Z1dNZS95bC9zNGE2ejBKUDF6RUZCMG15cFlWYTRuSFdqREQyWkliUEEvTDJY?=
 =?utf-8?B?SEptRWJUT3JwSmx0dXJtTXhHZFBDYkhsdHA3SEhMUXZHZDNZYlp6eDNCN2Zw?=
 =?utf-8?B?d3J6NVNYTnh4V0l5RnlrVlZkeXRNeW1EdFlLUk83ZzA3NWJzNEtkSVNibkFY?=
 =?utf-8?B?UW5qUFBYY2VSVFBFREJmK3lYZFB5VENuRXNWM01VSm5mcUNPR3N1eE9DemJj?=
 =?utf-8?B?cVJEZlhaSU1qWFlrazlHRG5CQy96K0ZNUGxCdFV3cFJsQWNqazJ4MlVBRk5w?=
 =?utf-8?B?OXhackRrR2U2VlNXbmpHV0pZUG1DN01oNkk3S2YyL21pYlN6NldEWTN2Y3d3?=
 =?utf-8?B?MjBaNElCSm0rTTNORGw4bkFBRVlJKzBHUUtPU0ljR2oxdXdxdEprNTMyR0w3?=
 =?utf-8?B?V2ZUWHFLTHd4ckVHcmtyRmNLN1B3NXRXVU5rVFA0UWpSL0w4a3hvSFdJK3JJ?=
 =?utf-8?B?NThFNFZvYzRGRmhhL3hWQmxWVFNrclpWbW5SYkNpc0MwZ0UrbDZFMWpxN1Aw?=
 =?utf-8?Q?+SIwYwSn16rj7uSrACsr6xJgr?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:59.4435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47edb507-4103-4661-7b06-08de46e67785
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10669

Some hardware designs route data or control signals through a mux to
support multiple devices on a single sdhi controller.

In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
switching between soldered eMMC and an optional microSD on a carrier
board, e.g. for development or provisioning.

SD/SDIO/eMMC are not well suited for runtime switching between different
cards, however boot-time selection is possible and useful - in
particular considering dt overlays.

Add support for an optional SD/SDIO/eMMC mux defined in dt, and select
it during probe.

Similar functionality already exists in other places, e.g. i2c-omap.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 16 +++++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index afc36a407c2c1..6f4c389a5bfe2 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -98,6 +98,7 @@ struct renesas_sdhi {
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+	struct mux_state *mux_state;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 2a310a1457855..cec7e5fa5aa96 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -26,6 +26,7 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/mux/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/platform_data/tmio.h>
@@ -1116,9 +1117,15 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 						"state_uhs");
 	}
 
+	priv->mux_state = devm_mux_state_get_optional_selected(&pdev->dev, NULL);
+	if (IS_ERR(priv->mux_state))
+		return PTR_ERR(priv->mux_state);
+
 	host = tmio_mmc_host_alloc(pdev, mmc_data);
-	if (IS_ERR(host))
-		return PTR_ERR(host);
+	if (IS_ERR(host)) {
+		ret = PTR_ERR(host);
+		goto edselmux;
+	}
 
 	priv->host = host;
 
@@ -1201,7 +1208,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	ret = renesas_sdhi_clk_enable(host);
 	if (ret)
-		return ret;
+		goto edselmux;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node, "vqmmc-regulator");
 	if (rcfg.of_node) {
@@ -1305,6 +1312,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 edisclk:
 	renesas_sdhi_clk_disable(host);
+edselmux:
+	if (priv->mux_state)
+		mux_state_deselect(priv->mux_state);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_probe);

-- 
2.51.0



