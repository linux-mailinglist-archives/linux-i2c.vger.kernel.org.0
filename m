Return-Path: <linux-i2c+bounces-5064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEBC93C2F9
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 15:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6573B282B8C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 13:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039E119D07C;
	Thu, 25 Jul 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="le9aSJZL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020111.outbound.protection.outlook.com [52.101.69.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3199D19B5B5;
	Thu, 25 Jul 2024 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914107; cv=fail; b=cvp8yzb3Zfq/42h9WoGrZfmzMVVcaTAMDzgIPRLULqwYx3lvVztlHVmDpCFpgo9B5pU6jQiYZBrDPr/GvCOo+3gm6MkpjdCUJONlGQp87H0WqQhumGE0AWQyzr/jR+tf2mx7VsNjgl87mEY4P2qryag0uf6OYmZdu2IawgRImUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914107; c=relaxed/simple;
	bh=xUOzJhYgGi7tOD03S2/glWYlpwIkiosXRfldjdIrq0E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CAJUQ30Xy0HXNJPnH/nFFGX8L9EejCn+7kkgvqH1JaFCy7XxwAgD51+1LDj9Xq9kVggmWPhbsexfdK/ZTX6uAoq9QHQwPG46G2C6SYM7lidyfejUerL3RRcDJwrQDzyGQc+J+Kw96ZnLvqG5YFJFjy7dc36nC/Gb2DagWXWM7Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=le9aSJZL; arc=fail smtp.client-ip=52.101.69.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMexg3paIUiOxdE1G6jqxq8cnRCu+DTNM0agRpYM5Notcn9GBe4fZ5SiQFlNf7/XEVjgGi7wsY9ge7I3AVOVuOI1FcXACpdmSwWhoiFq4WVIQOZPwQ9SKSIUPLT8GnM/3wj4ZW/bIzH4kG5aGA6FKx6Z4xV2to60qTFB5S/qggnMj/P1EOy7QQ1ieb3cZRkYeuzlQsV9zNDgnIAt7msVCjOTEizfswBXhqfKxl0oCBbT9DOfjS5EArY9iZPL+zqCsZ1N8oRjUpS2aCsY5wJ5SUomOSEDzeqi3P5M5S+lh5jG2gNvSwRiHF5a8LVS553xnoeIPRrHWMIoPfwk0ecFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M5rTS0hwBjxoUhV0wrTMNvLyx5reO/n4ovPpVOxKL8=;
 b=XIqU3s8D7FTo+kKbZ5um8tahpCTU1n0VsO63J6PDwNzmpMO23yTKIQpvNuK4PtwMkuvNAWDUU1wQzBgkjz1h/vfyUjx5tP4rdbPzvElNorQiG8g/hogwwZYTi6niptCPBpEdISz4UNPioyigFA6W40rSJobqhtkrud5qMDhkjWe1aKLl++5jsr85jCptYIwYwr6Rn/qWJO+m+kfT1Bk6RBNL80PK6tjcEo0jKU5zzrP0D7XLHztyefAvwDpQwP4/mj7vczXd7U1SpHCQmK8itydKyc1+7nOIlkzVWhnwwwPFr5Bbp1yItZ65riU3V+MCm/3pMeCmiEbrcD/FgQnOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8M5rTS0hwBjxoUhV0wrTMNvLyx5reO/n4ovPpVOxKL8=;
 b=le9aSJZLwVyIdJUCQz2mE4B4ym+973yzTpKAKqhtU8G+Rq+PBZz6qk+kEmxLdHahiU7aTf39jtDnBUglvEKaEWQwmHU5cWJsq4dCmDOr2T1QcYnZzrLObkQeOi/LTpTugqS1gMZhAZM0Kn9so0mOzg0PXt4Bo0U8V+a8N9SWo/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DU4PR04MB10670.eurprd04.prod.outlook.com (2603:10a6:10:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 13:28:18 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:28:16 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Thu, 25 Jul 2024 15:27:48 +0200
Subject: [PATCH v6 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|DU4PR04MB10670:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae2cb55-40ec-4d8a-f682-08dcacada461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RW9mTHlhTElNNmx4djhRMFhKK1crdGRzM0U4VytNajQyUEsvZXJCeS92ckpU?=
 =?utf-8?B?dVh1WGZEK3Vma3M5OTFRUTR2MFFCUVRwd3ROYllkcWRlUWcrNnBUcW5SNTNr?=
 =?utf-8?B?YkdseDBxOW5QZmxmeTFxVUQrQTkyeVhYaml4ZzFSUk0wSzVEcDJHSVVMWDZF?=
 =?utf-8?B?dm5ZaFhWcXhURFZDOElNRFFKVWs3YXdHbXo4Y0V4NTRtT2FpdWZrbDd0ZGtP?=
 =?utf-8?B?SFdMd0luOXJmWFNmcFV4cVNYUTRGd3J1YUU1RU8wbmdoRjJ4ZTc2VExRRDhZ?=
 =?utf-8?B?UmFtTWsvN0ozenZkUWRQRUZYYUc4a3NJbEw5UlpjZTJWWVFacDg3Z3IvT2JC?=
 =?utf-8?B?dW5RdlFBS09ZdmViR1pXcXlxRnArQU5oSnY1dm5YVTJOaGVXSlRjOU9YRkpZ?=
 =?utf-8?B?QWNpUHFLR2orRFNsaFVCb2RKQ0J3KytJaExEZktjTTNkUjN0OCtQemVlZ1pZ?=
 =?utf-8?B?Wm95WmtQQ2QxQUdnR3dtUjZEYWlVSFJ2WlphTUFQY0RVL01SRkRuR25HRkVw?=
 =?utf-8?B?WXFYRDl4N1hmbVFpRUlmU29GTmRsUWYvN0h6a1o2dnMzUlUydHZMRzNNcy8x?=
 =?utf-8?B?a2l2bWp6Ymg2VkVzL2VMMFozdjlCc0Y3cXB1YU9nRlozNW1xbzVyb0tkMTgz?=
 =?utf-8?B?U21vdTlNUzN0ZWI1TTRzVmJWUkhxeWxoM3YvVG9oRkZ2eHc4K01nNGN0SWhH?=
 =?utf-8?B?bWdOZnltQnFOa2V4Yzc0am5mY1hKb0QxeUphSUNYUjBYclR4VTNnaVNlZHFo?=
 =?utf-8?B?bDhINUJ0ZXpFUXpZeFlzNnQveThwT3FJcXBQdUErN2dXNHVDL2c4MEt6Snc1?=
 =?utf-8?B?eVFURG82cjBSZ1doUGxNNWx0WVBSMnNCSVk3YjVWMmRmcFpVL2pZNUVOMWRp?=
 =?utf-8?B?RWV6QWFJUnNJalluTU5XKysrNUNMTXZQelppcGV2dUo1ZUhQVE5OM0duZlNl?=
 =?utf-8?B?OGVLZVJ0M2JRME5aa1Q4TlpucXlhNmNBSm02dStrNnhEMTc1NUp0RnhNYWhU?=
 =?utf-8?B?Z3pFcndrUTNac1RpYUNNRFVDdGpEWmxWSERWWUdLVlZZbkczUEExRWJDOXlW?=
 =?utf-8?B?cFJqWVZ0Zmc2WVZZYVZYeHhRRmdKK2FkT2RmVHpOY3MxQWhzd1JzdHlocHhK?=
 =?utf-8?B?bXpQZUFOOTZpekJUaUIwRkF1ditQc3pvTzBXU2JmTEZFMVphaXBNNmxMYWJW?=
 =?utf-8?B?WmFZeG9MZnlpUWlsODhlY0paY2szQ0ZtRTBTQ3JVOUNkTnVLWDZsdkJCbWg5?=
 =?utf-8?B?T1VxVGxqMTRORTZyRGtQQ0JCTGp5SjdVRXQwcnI5ZWdYN3FPeFF6MHhsSzZV?=
 =?utf-8?B?R1VjWVhueE5LY2wrM3BIM1FReVEzMTJBbVJvRXBXazlUTDBsUG1KdTlYSDJR?=
 =?utf-8?B?SmpNTEFGWXVUSTB2dkpnckhpdGUwRFhCLytQaHBRdmdjR0cwbnFLYis5aGU0?=
 =?utf-8?B?YXh5cTE4ZGxMa1VwSkQ0anZMZEdPRGNoM25HSEJuaXh2c0NoOUlic1psVU5s?=
 =?utf-8?B?RTJxMVFUZVBBTkhzcUhuSGJCRDdOVTd5OHVYcmNHNjFUeFRCZHJ0Ym02bStI?=
 =?utf-8?B?OXlybnhiaThBa0d1VXpaeWZ3ZGMzTHk1RmIvc21wd29ISWI3anc4eTRKNmdD?=
 =?utf-8?B?bzBnWk9ja3JqZlhwTFhGdEhmV1lvbkJ6bWZMVkptQkl1aGdQRGZrK2I3R3kx?=
 =?utf-8?B?UVpCZ1VUT1h3R3pRSEVjdVo0Q05zblVDWllVT2ZSQ3MwcEFNbk1wTlVSN0FD?=
 =?utf-8?B?dDhESEtDNGU5Rk8wTWkycGVsNWI4UUJ2RHA1RWprN1hBdC81cVNtYS9WZHFZ?=
 =?utf-8?B?SFAvdEp6UjEyWWhvbURPNU9ETldrblpmeVk1cFFwZzZJSkdzaFUyV3dCN1I3?=
 =?utf-8?B?MnVUVEpNRTEyRzdCQmp0Y21MYTJlT3BvbWMrSHZkN1J6bWhreHVUVWRmUVg3?=
 =?utf-8?Q?N1pa1VrFlIM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFFNRTZkU00zR1BKYnhLaVh3STBZMHJrVUlNMEVyd1ArV3AreExQakt1cGNF?=
 =?utf-8?B?eGptcHM2R2RObldDVVJsWGVhRVdLZlJxSVE4UkpCMzJmTFlOcDhob1dRRjlH?=
 =?utf-8?B?Q1RtS0xFRFZIeTI2MFpOeDdKdnVXWHYxcWFtMnhBRkVzUDRBNWNxUCt6aWRI?=
 =?utf-8?B?SnZDeHR0cFJQaWVkdE9TR3NNVzhSSUtvRVI2Z1haSmY5RGFTQ3V2QVNrVFVp?=
 =?utf-8?B?RWdHdEZ4R05tNUg5eXRhYTNocFBlbEY0eE1mSXd1WjdwMFdCZjhIMi9GQWNl?=
 =?utf-8?B?YkI1TXdWOWQ5RDhWYW02cFpkclh1NkEreDJpZTlWZVd3a2dZc0o4Q0I5SDdx?=
 =?utf-8?B?dGhGcU9OUmhZZVFBa0JEajBQb3RPUTBGd0VIenJsNmZBK09JNUVIb1dpT2Q0?=
 =?utf-8?B?a2VhM1JwOGtFYnJadnk1eFFRcTU0Q3d3MnNsZXdoT3ZVc0p0SG52Ull5bGtx?=
 =?utf-8?B?Q0RJaG1FVHg4dk1ucVhRaytqNE1icEhrMkhZb0tQQnM3UmRMK3IrTXQ4TGVa?=
 =?utf-8?B?NjJvZWp2OUNkeGtQblFVeDJ4RzVKTjVSb00vTW1HbHFXSEhPMVZjT3lIdFI5?=
 =?utf-8?B?ZnMrNm1weXl3UVhqNWdMSnU0eUc0YXNORjhrdWNuU2twbGl4Q052bGFxU3M5?=
 =?utf-8?B?ZXBJeG56OVZheS85NGtIRkF5a3NyWXNLWXFuSVRXWndNNWNkMTUwMlYxc3ZV?=
 =?utf-8?B?U01SS2FjL3JscndXZTY3U2tvUTJSVjJkSEdPMnJEaTM3TUQ2YzE2azZmaEc5?=
 =?utf-8?B?ZG0zWUJVeVpnazFrOUIyOTduRDM0ZzRoUkNyb3N5SXdjMlBha3JmU3VoN1NF?=
 =?utf-8?B?RmorUFk5RGx1VTZvdDlraHd3a1lDNndvU2YvY0JFYzJVS2xjSU5ya1dYV1R5?=
 =?utf-8?B?KzlnR1R3MU1NeVd6cjJOYkIyblA2bjM0SDVOMDZuQS9QR1l4OUFrMWxxcDlz?=
 =?utf-8?B?aGovUnRJWjdzcGlJN0NCRnlyYTNHN3RXOWhweGg3K0h0MjIzTWxwNkF2T041?=
 =?utf-8?B?QlNqVHovbW1ZRkJ5azBsQkUvZ1JyVXZ4dVVhQzBQSWVvbDhENlloMHFRbSt4?=
 =?utf-8?B?VDlybUUvK1ZEMlhBUE1KemhaV1NJNXlGM01LTkdUcUNDNE1YeGdycForTmpP?=
 =?utf-8?B?RnJMUW9lZFp3YytZcFJJb0VVQjNuaDVtVWJqNEs0dVFwdVBScWplN1lscHFw?=
 =?utf-8?B?VHZ0VzJ6ZzlyMTB4YkYzcE1aK0tLQUhUWnQzSi9HZDdhSWM3bFpnVkhUbXF0?=
 =?utf-8?B?b09VV1FDYXg4ZDhMT0M4aDRKZWdlc1p1L1FhejZ1Qmo4QVgwUjFlVHlSMkNY?=
 =?utf-8?B?b2RET2M5TFZxanlEcFpzRHVmNWx4ZTErUFg3dXB6ZXh5d0FteEN3RUFRZjlP?=
 =?utf-8?B?SzhOR2hkaXJVOXhVWHFod1g2c0IzOTRvY0xSMndmeHBJUTZlMXBRYkZ3eTlX?=
 =?utf-8?B?aVllT0ZEVk1sbmtFNVYydkthRFJ3cDMwak01UVVmaXNURGhKN3RxZmlqc3JN?=
 =?utf-8?B?QTArTXpQVG4xcFB5MW5yYzgrTkM4S1dIczI1WTVzZXRRTkkxeEhNU1VGdGk4?=
 =?utf-8?B?TlFMY1JJU0FwRjZQb1Y5aFRzYXJhNWVrWmZueU5oVjZmbmJTdHp4Q2kyODk3?=
 =?utf-8?B?RVlKYzhaUXNGQ0p6MnBSd2dlR2UwUmVtYWMyN2hIYy9kcEkzZVo2UkF5eTBF?=
 =?utf-8?B?WmVrcFB3SFZ1UGZkUmV2c21IUS9xSXVSYk9HUVJCNzFhN2oyRzlZK0crdG1x?=
 =?utf-8?B?cEJFTXR0RFJqWkZ2WWdGRHA5dDlVcXVpMno4WS83cDVXVE93c1pjRXhIbGlY?=
 =?utf-8?B?cXdNalJmeUdrM25TS2N6OXRxSzNNSVVnMVVEZElJTnREUmRxK1lDQlMzQk92?=
 =?utf-8?B?d0xYOS8vc0Q4aTlUUXduemdBSjk0ejJnUUN3MGY1RSswRmpLeDUrMHZsU0Q2?=
 =?utf-8?B?NytoSHJxaDBrMHJRSTZoRXBTa3RnM1JHRlFHOEhSZStZakhyUUtSakNlcWxJ?=
 =?utf-8?B?SlQ2U2w2eGd0V2ZSS0wzalY2Z0l3TWYvaUxiZWZWUzJDMWYxT1krQ2hSNEVU?=
 =?utf-8?B?dFcveHluNExnWVBGcDEwbVZwcFUvbFJGc0FYSVo1VHFkSE9qbmVYMFFXUVBp?=
 =?utf-8?B?aGd0V0FONFFKVDUvQ3dyNDRQTDRCeU8vWkVvN3FqeTdJQ2JtNy94ZDlXL21O?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae2cb55-40ec-4d8a-f682-08dcacada461
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:28:16.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5g+EMos8vl+mKqyIzAniOTYloUBJAW4I0HPCsbMCA976v1EgVbj3SVHXwZIu3gd+Ca0VafWo7h0Ig2j1heDIEF7zREFQEJP+TJGgfEz5Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10670

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which an amc6821 and devices that are reachable through an I2C-mux.
The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821 reg 0xff).

This driver is expected to be probed as a platform device with amc6821
as its parent i2c device.

Add support for the mule-i2c-mux platform driver. The amc6821 driver
support for the mux will be added in a later commit.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  16 ++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 155 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..6d2f66810cdc 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,20 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Theobroma Systems Mule I2C device multiplexer"
+	depends on OF && SENSORS_AMC6821
+	help
+	  Mule is an MCU that emulates a set of I2C devices, among which
+	  devices that are reachable through an I2C-mux. The devices on the mux
+	  can be selected by writing the appropriate device number to an I2C
+	  configuration register.
+
+	  If you say yes to this option, support will be included for a
+	  Theobroma Systems Mule I2C multiplexer. This driver provides access to
+	  I2C devices connected on this mux.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mule.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..4b24f49515a7 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
 obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
+obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
new file mode 100644
index 000000000000..062596869651
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Theobroma Systems Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG  0xff
+#define MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static inline int __mux_select(struct regmap *regmap, u32 dev)
+{
+	return regmap_write(regmap, MUX_CONFIG_REG, dev);
+}
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return __mux_select(mux->regmap, dev);
+}
+
+static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mux_select(muxc, MUX_DEFAULT_DEV);
+}
+
+static void mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct platform_device *pdev)
+{
+	struct device *mux_dev = &pdev->dev;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_client *client;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	int ndev, ret;
+	bool old_fw;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(mux_dev->of_node);
+	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
+
+	client = to_i2c_client(mux_dev->parent);
+
+	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED, mux_select, mux_deselect);
+	if (!muxc)
+		return dev_err_probe(mux_dev, -ENOMEM,
+				     "Failed to allocate mux struct\n");
+
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
+				     "No parent i2c register map\n");
+
+	platform_set_drvdata(pdev, muxc);
+
+	/*
+	 * MUX_DEFAULT_DEV is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, MUX_DEFAULT_DEV);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to write config register\n");
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to read config register\n");
+
+	old_fw = (readback != MUX_DEFAULT_DEV);
+
+	ret = devm_add_action_or_reset(mux_dev, mux_remove, muxc);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to register mux remove\n");
+
+	/* Create device adapters */
+	for_each_child_of_node(mux_dev->of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "No reg property found for %s\n",
+					     of_node_full_name(dev));
+
+		if (old_fw && reg != 0) {
+			dev_warn(mux_dev,
+				 "Mux is not supported, please update Mule FW\n");
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(mux_dev,
+				 "Device %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "Failed to add i2c mux adapter %d\n", reg);
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct platform_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_platform_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


