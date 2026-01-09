Return-Path: <linux-i2c+bounces-15006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F279D077C7
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 08:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB7FE3012E92
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADE22E7BB6;
	Fri,  9 Jan 2026 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vigem.onmicrosoft.com header.i=@vigem.onmicrosoft.com header.b="Tzpqb7eI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay23-hz1-if1.hornetsecurity.com (mx-relay23-hz1-if1.hornetsecurity.com [94.100.128.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0203939FD9
	for <linux-i2c@vger.kernel.org>; Fri,  9 Jan 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=94.100.128.33
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767942125; cv=fail; b=AOf9RE/VWYTC4JBTkkxVIXUVqhA/oMCvAaGaw3rPb2vE6dAvtEwsnjZg3wxCARWv7ZG/54zZzQYtROEuNiGgstQ8yjhf5XoRndL1LhdZZMlg++d5E/Ydio2d5Fk2P8X0MCL36nP6KB2AeFlXTDWNJDdpLa+oNDAVXnMzOfoLy7I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767942125; c=relaxed/simple;
	bh=un7zLbt5unolIkPvZnGwRFYZGdPT2akPSUewqv8INK4=;
	h=Date:From:To:Subject:Message-ID:Content-Type:MIME-Version; b=lrigYNFgEMKailpsJXxh4S08cvP2aE9NTzjFGTsuMFCZBdxmCGLV1GZO9bzt3YdX2LhoR8WCWWhrSAjqwGAJWMSrkYTZIAz0FclUNYpKfqIVXqAAlS19DIFVBVTAaGdcGoH+Xut3Vd7LA2/oDZMdE13uv3+dBHm7uW+/+rN0fWs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vigem.de; spf=pass smtp.mailfrom=vigem.de; dkim=pass (1024-bit key) header.d=vigem.onmicrosoft.com header.i=@vigem.onmicrosoft.com header.b=Tzpqb7eI; arc=fail smtp.client-ip=94.100.128.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vigem.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vigem.de
ARC-Authentication-Results: i=2; mx-gate23-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.65.113, headerfrom=vigem.de)
 smtp.mailfrom=vigem.de
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=vigem.onmicrosoft.com header.s=selector2-vigem-onmicrosoft-com
 header.a=rsa-sha256; dmarc=pass header.from=vigem.de orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Xz6gfjjy/doJUzBGhPGpBb28N+u+N34a1oX12T+ugrM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1767942070;
 b=GWoCA3N1WhSGgDEEyfvVixybngUL1qkHDQnnv4tvAvpZUe0hLUljwquq87MyhldTAZj4mSVo
 xyeuxVIbzFc9jKXlF4mHDombPVontz3Yn4xehLqNNQuGN2UsJJr8tlo92dnuXORofufdWHgKi5/
 JyzHz5DsoUT05FuoX4wfWzP8G7+x1Ya1xTJGLD166t+Hv09988S9EwB+lLWh8iYW5COm2dojRmP
 HKqojr6fVxAcOC7V3KgjP25h2wGk1F+Nyt8STNYdYfBBYJwZ2q6SNfDMafQm1K1vMNEO1NxApZz
 YDdYZaG/2UqtuOFFwWVyRkCCK2+CmmUltIyMOEg07GcBA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1767942070;
 b=ONT/lHw5mJ6NJFdD1ePYcLe0kOtDsX6dSdMTjjVTf7dJoDAynw6DLSazmQ0v7N0p/Gp4BlzS
 zi3mrD1cJftVSaAfEA1V9iXdbRxOOLCzi3cNuPD6fW/CfXJzcITfd4UsfQdHAxrkIlunBWzQGkv
 EOp963TveDhp7x3iDkWkRmD4kzn3zbzBTQRjxOZtJemtamJ4rjxOkn9m9Im9hH+yahOQ4oCGjHG
 K/GZt7PzhuKIVtDmUmFKaFJSmY9duk30FXSjvpap+IoxKIqKpoCRayKuGAEvpnfwRlaxY2CqKOT
 aBdmlmfEdFBy5HwHT/JZ6LBiuTkcR73xMK/Pw5vk8ZoKA==
Received: from mail-northeuropeazon11021113.outbound.protection.outlook.com ([52.101.65.113]) by mx-relay23-hz1.antispameurope.com;
 Fri, 09 Jan 2026 08:01:10 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8DnRYDdP+ZRkBPO/7LUy5vVhBNFoqPjKMuJx0BwBdK8WdlMgrdlq23XkRMsHgHE0yOpafs6P48yZ/GnEUto09xiaBEzinwJlzqZsnmwkY0tS0cLIx1YSuarYDZlcdZ/uVIKophw5kTt46s0IPlQRgl+oNlfW0qKc2LgoIXt3SKWntuD4WyXafLPvZVADsmUpFrCgMJss8j+EeGzDY+lE0yC2ufYqI2EvMsUWkMmJDsa887F4mcieP/qAvEYbUFrk2JMUVbWLnXSzhmuKnGggr9uDtlLSxxuPXK3fM0vIXfH3SxhJkHjXrdbKMaFDvNdfmPxrKni3TnPNVSyGr44Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz6gfjjy/doJUzBGhPGpBb28N+u+N34a1oX12T+ugrM=;
 b=kBqWZ1Byq5d8dAhz/SKIhupq/NlKEoYz68AktlGDy944DKdQt5qF39WjOPu2MKnsEdVVlwE54l17IJB3OPjw+U/CA69LwbtBqCrAebYrLP3j6KDnoc0WlWoAeRPSJVu889SvTxU9vk14Yylp18HVQ9hW2lsP55zJ7sjRvgp67j0z2Xu0ii9Hmb+/vWTUH8tZBp+J0m6UzLhY2CnKhxAEYp6/AD6/THniHrYZmII/hwljRaLgQGDFx9NqFjt1OBq35bIqVJ4qd/mo+cH1Mq7+wImRUe5xWWF0iUhn9KfhHiiGhp0GbElcgZLLyMjPANdNpEi4EouSqKVgNnSQ1F3IJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vigem.de; dmarc=pass action=none header.from=vigem.de;
 dkim=pass header.d=vigem.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vigem.onmicrosoft.com;
 s=selector2-vigem-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz6gfjjy/doJUzBGhPGpBb28N+u+N34a1oX12T+ugrM=;
 b=Tzpqb7eIBfyjZ1vR2gzGtnzYX5fUcosRBFE4QMBZuYYXEWDBJXT6N1Lwmoz5RWdhySJoTNYLuvoTT0VXWR5NVbauE7zbWVjGPQifXHBZi08Xjp4f5YHpYzuG/MXwk6C2qGTYkK+0NuuBD7mF2eqU9P73lNB6kUOD+BkNEGPdSrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vigem.de;
Received: from PA1P190MB2609.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:4f8::10)
 by DU5P190MB2051.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:524::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 07:01:01 +0000
Received: from PA1P190MB2609.EURP190.PROD.OUTLOOK.COM
 ([fe80::ec87:d57:c9ea:24f6]) by PA1P190MB2609.EURP190.PROD.OUTLOOK.COM
 ([fe80::ec87:d57:c9ea:24f6%6]) with mapi id 15.20.9520.000; Fri, 9 Jan 2026
 07:01:01 +0000
Date: Fri, 9 Jan 2026 08:00:14 +0100 (CET)
From: =?UTF-8?Q?Sven_Z=C3=BChlsdorf?= <sven.zuehlsdorf@vigem.de>
To: Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-i2c@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: mcp2221: free I2C bus after failed transactions
Message-ID: <0302dd6a-3f04-c340-5b6d-5003c6d08026@vigem.de>
Content-Type: multipart/mixed; boundary="8323329-1019163610-1767942061=:511054"
X-ClientProxiedBy: FR5P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::15) To PA1P190MB2609.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:102:4f8::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA1P190MB2609:EE_|DU5P190MB2051:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d5942c-4a7e-4a83-19d3-08de4f4cd905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2l1SWJEQXp0OFlPSE9nRXpUUEk2cUJ6SWdKeGRPdityd3lLSzFJbUlROW1n?=
 =?utf-8?B?eVM0RVZYQnVQb0ppdHdIZVo0d2Y0KzZuS2xtcHpuQVNvWTExZEIrRjN3ZnJn?=
 =?utf-8?B?SzJWQnI0VWdFL2RqQ3M1Zmtya25CY1NmUzljRnZZdnoySUxaMVNTMWtVT2RS?=
 =?utf-8?B?RmtCNFhhSGd0ek43VE1sa0Z1RExOcFVVaVYvTk93aGMvWldEaS9NOHZPN1gr?=
 =?utf-8?B?MXc2ZXpLTHcxR2g2d1JKUGh2MmZkakZaeWNsTjRoM2J0SXZzZDd4MThOUlBu?=
 =?utf-8?B?NXNZRzF3eHlEN0VQTnQxQzIxK1FWeXVqc1J0RDE3TXFGbEpDMlh2LzUzUVZi?=
 =?utf-8?B?UHIwMThQRU9mQW5QL29hRWR5a3cwWVNOU3d4U2Z3M1phQ1lKUGZwSDBwR3dU?=
 =?utf-8?B?U3NNbzFjVjh0S0lEYUJtQjhlSUE3WGRUOWcrN3grdlNzT2hZMzlXZnl5OGJH?=
 =?utf-8?B?OWNKQU5tOEpQYTJ4cG02bGJ5WUQrQjZ2akFXcHFNN1NTRzZKQWsrT1I2cmts?=
 =?utf-8?B?dDBlZ0VjOUZjUTYzdmdNZnh3c29NYXBjSkxpbkRrL1A3UzAzUTEwanEwR3dZ?=
 =?utf-8?B?Vzg4UHNEZjdrOTE1cWNvQlpMcnd6aENaellZWHR0VXh6ci90WGZwc3I0dUhZ?=
 =?utf-8?B?a093dFpHcHlHZTB3UVYyMUxiaU04NHNjNEcrMm1KaHk1SVIzUW5PeGxzTGQ1?=
 =?utf-8?B?VnRyczFQSGJTWitBd2Z5Yndxd2tVbGtza3E1ekdWUjBFWUN6a3hwWGgyNEhq?=
 =?utf-8?B?VHZzZ3RFdHM2NG40eko4eWFWemxhbnVqZ01YbUo2Y2F3UUllZkFadXo1SnFr?=
 =?utf-8?B?dFdkUllEL3BUUkpvMFRaWWJic0ZSMC8wUllCcnc4c0FWKzYwRE9GdlRGNkhO?=
 =?utf-8?B?Z1AvbVhXTXN1NHIwUlFxUHh2bWdCdldtYzRlMmpoUTN3ZnFadm81NXVpSGpS?=
 =?utf-8?B?UGdPVFNCbFdMdEdnVjNNenlPNjl1cDNQd05XeWt5Y0EvUEFoSEZwQW1CZTgx?=
 =?utf-8?B?OEhYWTVNd2N3bXRoSHJwbHJoQURxRnJiQ3pqMXI4cytlaWdPbmdCZTN4WGln?=
 =?utf-8?B?R3VwZFBmenE0dnQ5Z3V5RE8wdmY3MVBMMitCOVJvc056dTd4Y1c4bjlYczF6?=
 =?utf-8?B?VWpEbWUrWndKN3N3OHFmYVZXTy9VQmlmQTZsL25sdlVxa0wzZTZtWWt3dTBK?=
 =?utf-8?B?QnFKd1h2VExFTm8vTU5EQ1VJSzIrYURPaEEwQkw0aXQ1S2hPT3p0dHBGYmk5?=
 =?utf-8?B?bGtVcmJnK01MaGxzMWdwb052YmVMQUI3U3htVWt5MFhyUmVoQUZmRWJxOUV5?=
 =?utf-8?B?NVk4QnEweG1kbjU5QTdBdjFDSjJNcVNncmx6WGhCbHA0cm1LbTg4azZBNVpG?=
 =?utf-8?B?cmQ5alN4VFRqb1NCUWpiTmJqeE5ZVzN4UmN5V0ROczQ5V2lBKzJHejBOczhO?=
 =?utf-8?B?a2Q4a3dvSFdEYjNXZElYQ0JGeVk5ZUUrbzhhR2ZVdDhkaDlmek82dkxyK1Jk?=
 =?utf-8?B?WmhFeHpKSVNNdnJ6cXdHRkZaY3NsUVBPZWlFbWhGUEllenBMQ0NNbENLeW9y?=
 =?utf-8?B?em01dFI2NUtWeVJpSmUyYzNzSVdGRG1Zb01SaUd0Um4zQjJLRVVZZEJCZEV2?=
 =?utf-8?B?c20weXpzTDRYNC9UTHF1N3YvWU5wWjVtMFlYQnlIRzA2Qm4xZW5DaHVrTDJN?=
 =?utf-8?B?WE0rK2JVZGE4ZVJNcmJVTkRVN3hDQnFFTGJJNk5vV1g3MmpTeXQraEZzYWtC?=
 =?utf-8?B?M0h6b3NYN1NDWHJ1QWNuaUM5UjJjRWV0Rm1vcExua1hHRWZMSTQ4UTJqcWl5?=
 =?utf-8?B?aWRxTTN6NVNCRjh3RUdBWldTejBXaElvaEFNZzliRmVwQlU3OC9yV3JjTXJG?=
 =?utf-8?B?MzF0TEVLaTNDL3BSd3lYWkxKdFFMQmFEMjc4MVdoa3lhOUhPWDh4eFNCZjlZ?=
 =?utf-8?Q?BOmDOPGoJmgPaLZLoweF8X+B+m+W0UyS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA1P190MB2609.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R29yMzJBdUdibHB6eXFnNklVYjBMU0Z1b1BHbXZwalNWd1pBbzBKdi9vd1JM?=
 =?utf-8?B?RlRsMkh0OUxHWkMwdkNUM092dTNwdWRiMVA0ODRHNDNvT2ZhYlNCZEpyaUNt?=
 =?utf-8?B?eDNNT200cWFvcStHbzBNUm96MWhFUjE1amJEOEtwZDA1dWFDRytTUVNoUFNK?=
 =?utf-8?B?dHZOUnhxREYvdEUxOGw0RHVJMXpWQ01jL3pVMXJSb25idHJBMm9aMFNyVnR0?=
 =?utf-8?B?YVJEamtiL1RDZU0rdFgraG9EQUc5RFoxZlM5dVFqa2ovRXRZcTZBWG5oMW5m?=
 =?utf-8?B?eVBLejVFL3oyMjNCOWJRV3o2dHc3VFQ1NjFSazYwMzRnVSs4RzNackJCVWlV?=
 =?utf-8?B?NG9kZTR1RjVrSmkzWE9FMDYxd01idXpkcXJHRkZRS2NPMWpXY0MreUtXamdO?=
 =?utf-8?B?QXB6ZjBRVGhEZXRiODloaDcxd2pVeHZGMkxsZjByQWdCVzBxaFJFTkJZdncv?=
 =?utf-8?B?c0p3Y1ZIeC9TdllyTGFxWFdYeGxlZGFUekFsTTRiRG1vdlhrVGQ0UDdDUjhM?=
 =?utf-8?B?L1R6TTRaQU81N1Z0WHIxLzczQ1UzVkhhb043SGw2R2lOR3hBNVduaGpGV1pz?=
 =?utf-8?B?Tkt4dWRlemIvNkVyQXg4U0prNVdjZllEbWd2bk5tMmNTNDZzTUxiaW1HQmd1?=
 =?utf-8?B?MFNCSlFFTlB3TUpTSkkzNnNnNjJpV3R2UXo4ZDlkTWswSUt4dEpnb1d3L0xP?=
 =?utf-8?B?Zy9QRzNSWU1CVmgzYzAyOHc5bHNFaW12cXBaVk5uTmtSUzhjdSsvR3FsbVcv?=
 =?utf-8?B?WDI1TFZua1ZndEhHNmgvRFJ0SFNGWE56VVhRU2VRZ2dUMzgzWUZtRkxlT3lG?=
 =?utf-8?B?K2JlQS84ZUdPWlczME5say90YUpCK0FJdnZUVTNlYzgyYlkzMWYrSTA0UTNV?=
 =?utf-8?B?Q0RHSEhpa0Nibk13UEZNY3Z3amRiZEkvZm92U0xFUGlOTFJjMXo4eHllRU1h?=
 =?utf-8?B?b0JyekFodHNTSEh6NC9mNDdYM2xKTm9qSTVQc1FrLy8wSU9JbkV1d2oxSWxq?=
 =?utf-8?B?MnZzcU52QXpUb3d0QmNGRzd0RFZIRzZoMDhkNXUzYmloUG4yZC96L2MvR1RJ?=
 =?utf-8?B?VHFlR1JIUGR2aVB2MTlpK2JOd2dRU00xZFR2NkZ0QlNKMnBySi85Nzlobkcz?=
 =?utf-8?B?THlpMTF0K1N0eWhNVVJnRVlCYmJXcFJXQU1LTkZIR0N2WEdDbkVIWVlPdEtm?=
 =?utf-8?B?cWFyUlladWI2OFRtVDNaY2dZNlEzRWF3SUtpbExTcTlodWwvV29VSVdzTVdh?=
 =?utf-8?B?K1dmZ0d4UzVNTHBLVFhJUTE3bHB5MFFsdUF5NXFGanZQWUhNZHgyZG9oSmoz?=
 =?utf-8?B?UU1XS2VlcC9VUFlCeFA0TWR3RFZRbXoxV2F0clZDSmhEVVk4NXBzUzg4U2NE?=
 =?utf-8?B?a1FBVlhVc1dNa2tnYmNFTTdIaWZvY1ZQYnNRanhmOWEvd1lLcG41YlN5SE1I?=
 =?utf-8?B?bEh6ZUc0eENHZzgzcVFPTEVGRS9YTHpHOEg4S00wV1QreEhDSERKRis1aTJL?=
 =?utf-8?B?a2pXZUUyc1FqWlpJUXJDYjdXd1UrZ0RycHBEQ2UvVW1Xb0Z5RUZDT2QvWVNH?=
 =?utf-8?B?RjAra21YYjArcHErWCtrVG0xelBpSHdDbjc1NnN1S1BGNFRzRXpoSGZRZ0h2?=
 =?utf-8?B?dW9QaFk4bUpRbGx1SjBoSjZPMytORU1pV08zalBoWkY3S2g2b050VzFwUEJz?=
 =?utf-8?B?SmVGQ3JjU2EvT3NyVGZxcHp2MkdHckxvN2NKZG1lem9FSzkwczJ2Vjd0MldW?=
 =?utf-8?B?cFc4cnJSb04xbWV6dUdiMmdBZmhOTjROUlptTnk5WGhSc2FNaGdMVHovMW5h?=
 =?utf-8?B?UlZzdlZrUkYrQnFscjJBMXNqZVBvYlZGc3JTRE1YeFo4MkZCTWdITTVGWHFR?=
 =?utf-8?B?eXFDdGkwdHN1cHJ0WGtnVVhsUlNiNFprS1pIamc2dkJ6NHJmRkxtalVrY2ly?=
 =?utf-8?B?SjFYOE91bWJrck1wT25CKzNUdGZhSk1CV1VPNENUQUN4WnVZdHhZNi9wUVF5?=
 =?utf-8?B?NVBOOGUyMnNjUXBjZEt6cWdjYXByVzhHMXcwUVF1SXFjWEszT2plZk1wcUIr?=
 =?utf-8?B?NDUyclpRWUY4RHQyT2pEbVFVSDZmWXpuNCthZVc0VEdmaW55d0NmMHJlMnA4?=
 =?utf-8?B?MUYwdnVLNmkxa1dVWWcwWEZPSDcvbXV0VmR0VVh6S0ViWTBFYzEwTTBJOWFs?=
 =?utf-8?B?VmZkTmlDTEc1THJxMkVjbSs4bGZkTWdnd3hXWmVNZFBCdEZuYnVIMEVubWFC?=
 =?utf-8?B?QTdzbXBNOFAxdDBLTmRKZnYxZkQ2VDFWVjZ1UHRGK0h6WTlQVGFPSmVaWVR3?=
 =?utf-8?B?am5pTXVXazVXUG1CYnM0WG9BNThFak02SFUvY0wxT2c1Zi9OUGg1aW5sMkIz?=
 =?utf-8?Q?NWq061j7a4lM/r7tiJxOpYaTBM3LqtwMjLr2p15tcoLhq?=
X-MS-Exchange-AntiSpam-MessageData-1: t9v7ff8LYWKY8aKrFOTnqRwo8VsGbkE52qc=
X-OriginatorOrg: vigem.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d5942c-4a7e-4a83-19d3-08de4f4cd905
X-MS-Exchange-CrossTenant-AuthSource: PA1P190MB2609.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:01:01.1498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: dc3cc44e-876e-4b98-9250-42df44be4933
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXzJYsiJ5MMT9IWaZbfQ1ac0AyQpe0+JIAblKVW2D9TZnIF6DjMJJcDzezsxpc4aqi9QzLhYH14+1YK90B/GuZCZ4NP2h4cnpyDD6NsVXJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5P190MB2051
X-cloud-security-sender:sven.zuehlsdorf@vigem.de
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: sven.zuehlsdorf@vigem.de
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay23-hz1.antispameurope.com with 4dnXjq1v6nz4NS6W
X-cloud-security-connect: mail-northeuropeazon11021113.outbound.protection.outlook.com[52.101.65.113], TLS=1, IP=52.101.65.113
X-cloud-security-Digest:c61dc0b63792c0929c3f92a4f8a82e2e
X-cloud-security:scantime:1.513

--8323329-1019163610-1767942061=:511054
Content-Type: text/plain; format=flowed; charset=UTF-8
Content-Transfer-Encoding: 8BIT

The conversion of unnecessary speed reconfigurations to actual error cleanup
has missed the timeout case in mcp_i2c_smbus_read. While we give up on
waiting for the requested data, the chip is still executing the transaction.
Attempts to initiate further transactions will be rejected with
"I2C engine busy" (translated to -EAGAIN by the driver). This can be
reproduced by attempting a read from a nonexistent device, as e.g. i2cdetect
does by default for the 0x30-0x3f and 0x50-0x5f address ranges.
Explicitly canceling the current transaction fixes this.

In addition, when initiating an I2C transaction and the chip accepts the
command, i.e. doesn't return "I2C engine busy"/-EAGAIN, we still need to
explicitly free the bus, if we detect an error condition in the HID
report's I2C engine state.

Fixes: 02a46753601a ("HID: mcp2221: Don't set bus speed on every transfer")
Signed-off-by: Sven Zühlsdorf <sven.zuehlsdorf@vigem.de>
---
  drivers/hid/hid-mcp2221.c | 19 ++++++++++++++++---
  1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 33603b019f975..50237b31c781c 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -274,8 +274,11 @@ static int mcp_i2c_write(struct mcp2221 *mcp,
  		memcpy(&mcp->txbuf[4], &msg->buf[idx], len);

  		ret = mcp_send_data_req_status(mcp, mcp->txbuf, len + 4);
-		if (ret)
+		if (ret) {
+			if (ret != -EAGAIN)
+				mcp_cancel_last_cmd(mcp);
  			return ret;
+		}

  		usleep_range(980, 1000);

@@ -332,8 +335,11 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
  	}

  	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 4);
-	if (ret)
+	if (ret) {
+		if (ret != -EAGAIN)
+			mcp_cancel_last_cmd(mcp);
  		return ret;
+	}

  	mcp->rxbuf_idx = 0;

@@ -353,6 +359,10 @@ static int mcp_i2c_smbus_read(struct mcp2221 *mcp,
  				usleep_range(90, 100);
  				retries++;
  			} else {
+				/* Too many retries.
+				 * Give up and free the bus.
+				 */
+				mcp_cancel_last_cmd(mcp);
  				return ret;
  			}
  		} else {
@@ -454,8 +464,11 @@ static int mcp_smbus_write(struct mcp2221 *mcp, u16 addr,
  	}

  	ret = mcp_send_data_req_status(mcp, mcp->txbuf, data_len);
-	if (ret)
+	if (ret) {
+		if (ret != -EAGAIN)
+			mcp_cancel_last_cmd(mcp);
  		return ret;
+	}

  	if (last_status) {
  		usleep_range(980, 1000);
-- 
2.52.0

--8323329-1019163610-1767942061=:511054--

