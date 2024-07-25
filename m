Return-Path: <linux-i2c+bounces-5068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C993C309
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 15:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C106AB226E3
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 13:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F0719DF6A;
	Thu, 25 Jul 2024 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="i3YzIZuz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020111.outbound.protection.outlook.com [52.101.69.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E63E19D8A4;
	Thu, 25 Jul 2024 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914112; cv=fail; b=kzwu8BpvlOkDa55am7h8hkq8VHEeOF91h2mWD7fsvvbBYhhP4nipdqKsAWg6WJQgWA6RaPkxFyzPhY1n3r9dTsDbHKJmgVPYIt7dsuGShpjEivWhno48qXo2DS7OstTby8XsrVRi6mtDe1QVS1pNRSqMZF32gRZHJGXpFj5SJYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914112; c=relaxed/simple;
	bh=ZqLxvdbON4HGIDwXyHoLXPvWlZD6EQcsY3ekUxJ7maw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iFb22wMJSziVTc5zOkIWR1GrZLKUq0OgR31pygUlYuKQLNFrDSAsx36qQbNLzFSH6QVziUvuHGoLaSSZC+Mxmbt6yBmJwmJSwm9gYoZy/xTc0qJe0/Cr+3We9AJ204cAS0PkBgSvmILC95EsmxfnWFVwM28fY51pA39e9BDshHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=i3YzIZuz; arc=fail smtp.client-ip=52.101.69.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK0sMfNbl40xnHjdPY/pgFAY2pYhCaUoSjgEaRnh7WgChVTtjBnpjaAfi+DM+jfFDv2sC6YNL0vr5eCLnSpe+sbcrqFQb/MddOK/3VCYhg0yRvg3TvebiqPOz4zsd2lofVPcLPFB3Hcuu7FP9byh2bcDt1Z+4hwYXEcGRQ3so0YsJS4oPQ+J14N/93kLoJj1NpX5b5GDTUQcnZw8uzP0XY4sDC4uAe0xL3apUsoup4YOchhJpGGn6fMr1ihrHD9pnvM2gm+RJfEkpibC/H7YrFoO+hoUGvfHFNH7T8FdxzZAgergAB9hg+dFxXvhj7uBCNvBwAww22PvmmynmjoacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpOnVJ2Fq9UBRXgKUtAdUe3ZeBAX+dIsb/Jnqh7FOQ0=;
 b=XaXGDTHH5N4F222rM+Id7DMgXUxPhupQ45JOuU6Eno4ytpP0vzcYK/fkNCqtr1wZLawmOyXtYsYd6d6qlL3u/jrCrC5spNfoYDZEX1uAt07AKwgoQnrJkBdnrlglaJ9s4zXTLEKQswgBMsSZQfWTeIEFz5MNTh55Rc3sPtrq6UJyXp7y0S8a2pOOTSmuGV4x7iTxnL4rZKW77KkFwyLbnq1N9XEYiRrKyYUUxoc9GWj6/w9NAU4U4IJTKtZCq0roLZz52R002IWSjFtlCC48OSq3p0ssXIFxLA4wS0e/eNhNFzeFm5HQ6A5dHOpKULb6DETU2E73+Sm4iKv/oUIibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpOnVJ2Fq9UBRXgKUtAdUe3ZeBAX+dIsb/Jnqh7FOQ0=;
 b=i3YzIZuzQJDEiQ4RYCFrDgpMkSKkoeRs9+/Ad4EZ9w7QQUzw+T+4PZjmB6LqPFNSdHoEneE3bWvLcK563DyhrvUXncmmOgrdGJt23ywQSEUunbRmavc/JYL/TSSMrJRFk2TgWvUtntg06HiwcQ+7e89jZwI+OhKPGJ9vUpMSC1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by DU4PR04MB10670.eurprd04.prod.outlook.com (2603:10a6:10:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 13:28:22 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:28:22 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Thu, 25 Jul 2024 15:27:54 +0200
Subject: [PATCH v6 8/8] arm64: dts: rockchip: add tsd,mule-i2c-mux on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-dev-mule-i2c-mux-v6-8-f9f6d7b60fb2@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 77719568-08a0-47d1-b7eb-08dcacada7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlVleUQ5ZVRKV2lFTlgxUFZIQ0Q0aEN2S1FHeCtGN3gzYUtzRHNWZUZJZWVj?=
 =?utf-8?B?SThzRHdEemFsZlpuU1dqUUF4ejFYWEhjVHJiT2l2blQwZUcxb2FFVnp5RTY5?=
 =?utf-8?B?Y1IyZmVDL3NJWnNGZXZCMVl6dEp4ZW5KM1FrcE9MZnNXSVlteDhJZzBSLzJu?=
 =?utf-8?B?MFFFd0ZwR1FINk44cGVxclZheHpzTkgvZFhIYUNtak10V1FQVXdTdGx1VEZ1?=
 =?utf-8?B?ank3YXNMYm5lTW00bWVlUmRDa0lSQkpvUzhrL3hlcHB0UDBMckhhbFBpWnRX?=
 =?utf-8?B?RGE1dXFXUHNrVlhZZlNFZHhsZHR5alYwR09VblpJU2VYKzZtOGNzYmNHMEZr?=
 =?utf-8?B?VzFVRzNKeWJ1Q0hOUDZhYnExcWZFbUc4SlVpVTJJcGFjY3V6QjhpYTBiSUZL?=
 =?utf-8?B?WUR4L0pvQkkvY0licGNuc0lkZ0FSTklpQWZGRGd0Rnd6ZmlZSmRqMDRvOEdi?=
 =?utf-8?B?KzgzN3RkQUM1UkltUEJ2WFhsMmtsVHhPY0tzcWhIdW5WSWtwTGc3bDYwQXJm?=
 =?utf-8?B?LzZBVVBWZ2FXYzJNQ2ZMLzFGanlzWmVocVFpaEtESnZBZG16czUwbkNxZlpL?=
 =?utf-8?B?c3ZBcEJrbDVwWHpiZmJwSmFvTEhIS2dKNGxxVVBIOHZWZTBBTVd3dGRnTUNJ?=
 =?utf-8?B?c0FnbDBFN3hLQjZoM0Y1Tk5acjg5V1dkdjNIbkozc3R2L2xWRk5mbk96SnlX?=
 =?utf-8?B?Q045bW9vTTNkQllqMmFlenhmYnBOSmU4Tm95bWhVeXh6UmsyRGZNS082cVBI?=
 =?utf-8?B?aFYxaENEUWZQU0U3bzdicUZyV1p6YlltQzhkL2lkR3graTlvNTdWTnVSVlI3?=
 =?utf-8?B?b1I4YmZja25wMFJyL0Nhb1FUL0pvTHFZcVl2OU5QM2c1dHN4VnhaZng2NlQz?=
 =?utf-8?B?WVF2VmlVSXJJcjFUUHRPdkRBWVRoL3BRV2JzZzB6SURxVDF0Y25COEhGY1M4?=
 =?utf-8?B?SlNnWng3S0RIbjN4aGlqejFMdGZOQjRzWExTem1PZjlhdkZvTWVlL05iS3hx?=
 =?utf-8?B?eFVtNUxjdlhkYzRUSE42NjBrL0ZVUm41ZVdVTUtPV09zWjFVb2VhYVZVVHdV?=
 =?utf-8?B?R1lPc0dMV0pLU0dkQm01UmMyWjNSSUE5V2g3L3N6aENQMXpwUzFhRWNYUlVu?=
 =?utf-8?B?Ym9aVWd2bytaa254OTRVcUl0K3BPZEtPL2Z2R1ZEakphVi9Ca1lZeWVLRm94?=
 =?utf-8?B?bmVSMHpSTW9US1MxYlhMWjkvY1hhbE41R2pTbzlFbTlJRzRTeXh4RGdqSVE2?=
 =?utf-8?B?NEpqZGhqM0Z3Y0NsRmNDd0RtbFR4NldjQnRJWm9CeGRyMDhWSUhtcTZUbGQ3?=
 =?utf-8?B?SUcwK0ZIbjJ5ZTdNUkN1ODJqdjNiMFBJQ3BWUll6ZWFES0d5WEZxV2o0QWpR?=
 =?utf-8?B?TEdaYllLaTY1ODRsMk9HYUQ5YXlJQ2FwNzRtK3l2aUNXbUZoYVJWT0dBWE04?=
 =?utf-8?B?UUF6c2RaTGl6Wk5SMHVHc2ZEYUdreHRFbFVqZGZjb2I0eTZqc3Fockdob0V0?=
 =?utf-8?B?dFRrQUNSdmljVGpFMkh1cFJ1bS9zUjF5MFpBMFBqQ3lJeDRsUmFWemlHM0ZL?=
 =?utf-8?B?QzRSTWxDZU9EVldKZlhBeGR6YWpXRTFybW93LzFFbHNDYTIyWDJ1WDgxYzVC?=
 =?utf-8?B?aWJ1WHJaZlUwL1NQNElyNWZxenp6T0gvckNxQ2NPVTlhYXVmR0MwNTVXaFBT?=
 =?utf-8?B?WEQyN21WZ0RYOWxVZWQ0d1krNzJadEJ1Z2tHaXZsTUFxSk1vZ0dPRjJhNHVT?=
 =?utf-8?B?SCsxSWFLbUJ3dm9ETHQ4NldVV3dPVHNFTmxnbmRobTFYdU1zQ1VKVUNzSWNu?=
 =?utf-8?B?YWQwc2lOOFc0RlVzSUZBUFZ2bDJZdThmQUljc1BkaUNoblkzK2pSMGF3NHd5?=
 =?utf-8?B?dHhHaUNqaVJTWjhFUktlZVUwRGNibFJIQ3hZMHZkQ3AreGEwNWRteTBTbW8x?=
 =?utf-8?Q?jrdT6KPUY/g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNPeDdvZHM4b2lkemMwZXVBa2huZ3NKYnFSWDNKb3htUmVmTnhGczRlTGdW?=
 =?utf-8?B?bXdHdkdGTnpNc3RZSXJTQ1pOSVpvSHhMemlHcWg5bWZQdENzM1p6UDJXQUZS?=
 =?utf-8?B?VjdjRGlIQ1ZZN2FvMk02QlJMcmVtcEdkdkc5LzhoK3B6NHU1aFVFMG84ckNa?=
 =?utf-8?B?bUd4OTlVYnVYUUcrVENtZ3VsQVE5TDg4SlNaTWZjZlhQVjhMOWNJZ2Z6bUpa?=
 =?utf-8?B?WUFNUVlMTVJRSnMxRlA3TDRJdzBSMUlyUHNWTENudDZ3TklZMVVsZU92OExQ?=
 =?utf-8?B?RjVBRTJSQk5JU1M5bk11dGFySXpWUGNySkt6b3JkVWVabUNjajRhL216cERq?=
 =?utf-8?B?MjRrKzZFc052QnVxRDdFNytVOUhwVUx3ZTJ2bUdHRHhwWWk5SFIxcHhvUGx1?=
 =?utf-8?B?cGw0L0lXdjdaNGlET3FWSS9JbG9CRm1IbzhmL2lDNXdpeGRKa1F0VGp6aWo4?=
 =?utf-8?B?Q0NtdUVqK1hNYnh1V1JlNmtRdWg1N3J4ZzcrSUZoSEhIUUtMd3Q4SE15d0kx?=
 =?utf-8?B?UDdHVWdwVSt5UHhLRFNybExqZWJDL05QMzlwc3ZPdktnKzRoNHVua0pRcEtI?=
 =?utf-8?B?Vkd4YzhHTEk3d1FUUjcxZDJwS3ZZYkxVaHJHS3dCOWhhQWh5NkhpYm9jRGI3?=
 =?utf-8?B?ZitTMDI1QjBnb1NVVXQwMGdXeHE3YlVXRjlFQWhsdDRjSXJUekRHSCtHNkN1?=
 =?utf-8?B?T0xpR1RRR3M4RTA4T3YrQlJCbVBQaUozekZqN2tQdGVPaVFCUm96ODV3Yk0y?=
 =?utf-8?B?aEJYTDhoYU1scSswUFFUYW8rVlVXT2dNUmUzUW9xdGZmZk9KSnQ2Z2w2RVdN?=
 =?utf-8?B?bWp4MmsyTGJoQVpmdkdOSmhsdkd4dnhJQlJmbEt1TkdHTFpESStiVU1wVnN6?=
 =?utf-8?B?U2QrOFJ6NWIzRVFDNUNjZlBCeW1pSEFyUWtCaVI3TEVZYmFOUW9xTXZsalN0?=
 =?utf-8?B?VjhyZDYrUERiNEh3VjcvRnJnN3pYUS9YNmgvYWRxdldTUjJEc3lMeENLemNM?=
 =?utf-8?B?THh6LzloRjlWQ1BsaU9TdGZvR1BJZGt2ZlVITXRrMUtHTDlvR0gyQzc2NUpK?=
 =?utf-8?B?MVV4M3IxUUhhT1FHWEVscm12a0hqanN6ZUxCMFY1QWZUeEh0N1pia1hQekpY?=
 =?utf-8?B?d01tVitCWFdwSjJxZDJCNDN1THEyeWZxR2ZZK0w1VTk5dE9VQ1BsMW9CUTdJ?=
 =?utf-8?B?RkhoT1lqOUZWc015OWRnZ0pVNU1Bc0ZDdTBLSG93ZXNuS3ZCcWxuVUNid1NH?=
 =?utf-8?B?NDFtZU8rcXdEckJTSlZSZXNvTzhSL2l6NW5PR0Y2RGNVa1lmSHBLZlNuMVVz?=
 =?utf-8?B?T0sxOHd1cUpqNnFOd2tpMWp3TURoTDQ5UU5UeFozTm9PeUFLV2hqY3lnS2JC?=
 =?utf-8?B?NDc1YmszdHJqb3FVU2o4aEx4QlR5OFMvZDduYjg2b2JHelFxTnZtM2YrODA3?=
 =?utf-8?B?Sm5KN3l3VlNsSjM5L1dITW9HQnBVcWliWFMrT2VSQmhaSDliS1d0OVc5elI4?=
 =?utf-8?B?UkZWV24rODQrWmhJS2x1aFhVL09neTgvSVYwWS9CNTI3ZEhldUwvRzFFd0ZV?=
 =?utf-8?B?Ylhna2Y1cmVPYnlpMzdTS0tWVUk5dlNFVzJsellYMFhSTzBOZERFSHJ0T3kv?=
 =?utf-8?B?aElScWEvLzkrUlZ4TlVvYUp6SWo0QzdyMUNLZ3JnQXozZmJRNlNURHFGN1Bw?=
 =?utf-8?B?Qzg5bGFTLzU3NmZ5d2tUQ3BUakUxZG52bmRTamY3eHh5dVUya2ozRjNZU1d5?=
 =?utf-8?B?UHhQWkMxMmRXeDJaZ0dZNGZsd1BkMENxcVYxNlBjYUpQSjczcWRXU3IrRWZT?=
 =?utf-8?B?REZUNVpOMklGSDh4bFB1a2kzN08vaWdLRFhTbWM1bUJFZ1BUVFV5Y2psZkE3?=
 =?utf-8?B?QWJYU0NBOXlxWncrS3BiUlE2Zko5SjhPNUxSM3ozc1R5Y3Vvc3FZaHlVNXNL?=
 =?utf-8?B?dkFOKyszdEgvZU8zcXV4dXhJT2JXU29yK3pzMm9jTDZkMGM2K3JTQkcydS9C?=
 =?utf-8?B?VmY5cVdtUlFhaU95c3MyQ3cxQW1jWTZGM1Zid0U0RGV0MUd6TzFJSkdnbHZz?=
 =?utf-8?B?MHVvOElBTXNEZ2UxVVRzTHhzbkN1dVR6M0JZMVl1VmhIa25oL0JmQVpSejB4?=
 =?utf-8?B?Z1hmYU5acHpoZk5kVWU5bE8xRldtakZDNmlCdE1rSVRNa1BiajBFb2tjRzdz?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77719568-08a0-47d1-b7eb-08dcacada7bd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:28:22.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hva0Dwl7eo/bT3kYiTon6aa/SBwxDeB0keg+nw1Khohzwj0YIMA23F3NfiSgsGQ3nwSNBMGdIb1AahGyJBqRuAMoiavPh+iUbjF/2h3viNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10670

Add the tsd,mule-i2c-mux alongside with the amc6821 (tsd,mule) and isl1208
as a default device on the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..a683ed3e2fce 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -292,14 +293,25 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	fan: fan@18 {
-		compatible = "ti,amc6821";
+		compatible = "tsd,mule", "ti,amc6821";
 		reg = <0x18>;
-		#cooling-cells = <2>;
-	};
 
-	rtc_twi: rtc@6f {
-		compatible = "isil,isl1208";
-		reg = <0x6f>;
+		i2c-mux {
+			compatible = "tsd,mule-i2c-mux";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c10: i2c@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rtc_twi: rtc@6f {
+					compatible = "isil,isl1208";
+					reg = <0x6f>;
+				};
+			};
+		};
 	};
 };
 

-- 
2.34.1


