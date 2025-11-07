Return-Path: <linux-i2c+bounces-14012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3565C3EA10
	for <lists+linux-i2c@lfdr.de>; Fri, 07 Nov 2025 07:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 738843AEDB6
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Nov 2025 06:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BC12D1F7B;
	Fri,  7 Nov 2025 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="RV3PZu1v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023083.outbound.protection.outlook.com [52.101.127.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6904239E88;
	Fri,  7 Nov 2025 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762497307; cv=fail; b=UY+5b0pSDYic58teaCpjIeq2qtfsNikYjtmbPevq0x6+gxsBLGs/Zz1jZwfdCX7ux6k//9z3how1+8Xi6X1i+KVqG3a5HWhQ1OGULa06hEpTXqHZvolwEyjnY9FU4j1U1VpbP8Bcu5av3gWiFDuCyPuz43xypDx6eCkXnar+RQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762497307; c=relaxed/simple;
	bh=iig0t5BjZwVRLYoXmDmr3Ipb4QB4CODQU/ZAqvxJwOw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rMcwXOcZESjM43zZYCx/jUWC1RHfqIDSygEMjiEAnX6hEPezsB/c1QBw8qJo3LmHFS/j74wbcQ1+ZpCqLHct5SRw39Vsqv9EoArhugE4Jbl/RP5DOGuWLRHaqCoX9bFCVnPEvKj0p1Z4KqxsmvatWWpKqd6dJ1A0lPKPHxmaaAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=RV3PZu1v; arc=fail smtp.client-ip=52.101.127.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKg94gfb6ZRdbZZUn1DmiIJ/8898shr1xDi7sfQKnf0RuRQ+ix+SrLQT57AYqQypZHJIBX5PWPUX1sbnBXM3UgJ+jJC10pOluQQ8AxMarxYuHWLGSJCAK043CWmwzWKdZ0lB3M3oQ9ba8in9EGNpUKWLVhZlXUy5nJU9vOlhTCP8+ii0i3jC4VVVvU3kpXt0H4zk2BPV4kRU9Mr5XLvZX+0z3oqEqEiHAdn4GMeXFbjn7qzucZ6FNdyQPg8v+bVbm/cKv3ATdOCM2O7XIwcay0EQ0wtpNbfHVTif/n6syPYovHJ0RWbKJmZNSdbmdnbK1Tjx+zkYoL5+hC9nkrmtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iig0t5BjZwVRLYoXmDmr3Ipb4QB4CODQU/ZAqvxJwOw=;
 b=MNK8+Eh6WUvDPjClV5IsSl60A54dpGfVFf3Rmb+sGH8bCC3fdgji1womGIWdBnO+Uoewqm2jnqMGy6RO+gQBAuTQjONiEPLi5UGePtxm3LmSvZQxxPt8hKVmXLxe+SlNUTrJt6+0KT/C4qj3YeD4/5RQM+diSlJ3KVDtuMpJ9sPKzOj3ARSPOjTlg0byvDJfco+vSunBE74yvHFJgjOqUHNwhLC+NxlxoIcvpfhZw2qW+yrKt8mb2gUbvySfVC3QKAF3/WVbIrFxm8XbbVhyYl8FUGr4N9pK3EA5uo6mGt0mLFKGVv5q9kAnPt4kmVHjqdYhCS7M2eHgdE6+0DmNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iig0t5BjZwVRLYoXmDmr3Ipb4QB4CODQU/ZAqvxJwOw=;
 b=RV3PZu1vIc2BYyr0mDEfgRh3AZTueviqnEYyYVHt92reOXYzDa3pJkigZQWLsOpzLzkwEWN98rS66TCXR+vhldnUqE2ODgeTPun8FjbVId4VOG/jKUZex0Ge3uuS4ZfeEOnJCo5YpgizrJE7Vrawif64xPywpnu+tPClBHf6f7PwuCxwkPyhL8gKdkxU9o3HXYuOuaqa84NA8XHUBrJ6mo2dfJ84Qmbjme2DlbnREdYFPxZvIXp0fxpu9jg2vnoTNtsz8S9vA7PClkpBpBQ00TJ9QhSBAz1/GYyMezz93bkviGNoudxPPPjYcyGTDwd1qNf+9YV3Ky8FnEdTyRqKoQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEYPR06MB5860.apcprd06.prod.outlook.com (2603:1096:101:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 06:35:01 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9275.013; Fri, 7 Nov 2025
 06:35:01 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Thread-Topic: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Thread-Index:
 AQHcRwi3xNYEORZZrU+2vI7qaB6dc7TWXdeAgAJ+8DCAACECAIAA8atQgAnHsICAAxs48A==
Date: Fri, 7 Nov 2025 06:35:01 +0000
Message-ID:
 <TY2PPF5CB9A1BE6AA78DB1519305B565746F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
 <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <36e2b87f-5567-4bd6-bd1b-789623441461@kernel.org>
 <TY2PPF5CB9A1BE62BD449193B23A22DF941F2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7e3c1b0b-2880-4abc-b80f-30ffc16d6158@kernel.org>
In-Reply-To: <7e3c1b0b-2880-4abc-b80f-30ffc16d6158@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEYPR06MB5860:EE_
x-ms-office365-filtering-correlation-id: 74a8de6a-96cf-4b8e-0636-08de1dc7c79b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXViMDFHQ0YzYTdCZ0xxR1lzWHQwQVpqVDlyWUJSK3VzZnhTaWhkMS9YK2Yv?=
 =?utf-8?B?NWRaaS92RWJPSjk4eWZXR1BmazJFS1d3V3A0QW5GVWdBbDFlKzRnTXJrWi9D?=
 =?utf-8?B?T3grMEFlSnJ1aGduUWEwMmNQeUVVMG9LS2JxcEJkUmlJcFhDTEYzNGJ6MCtE?=
 =?utf-8?B?U2hrRWU2d3ViZEtOTk9wWnJWaTNzY3loSUdJQWtmS1VydzRWaWgzTFlDWEwv?=
 =?utf-8?B?MGUxekxqeFdrSU1tN2VjVHpOZjZRckZVZTRjNkN2YWtCeWxBeGY2TWJmVHA1?=
 =?utf-8?B?SGJlamtkNGIrNkQwOHplUHdtaWNYdXl5SFh0Y2FpV3J5eC9OS25BTWhHVzlQ?=
 =?utf-8?B?SGJiWkVsYmNjdzRKbDJid2F3dmttQll1cjFKbzBEQVl6bi9mZFJaNzhoUmg0?=
 =?utf-8?B?WDhOZ0tkWXAveTRwNTJZa0g3U2luVFZlajhFZGYwYU90a2QvUGswSVN4SHZY?=
 =?utf-8?B?RHpNOGduRHZHbU5pbVBBeWYyZEJpZEFLSWlUU0FYTlQ5QVpVdHAzUHVNSkYz?=
 =?utf-8?B?S2tRL2xDWkdEdHRCbVM1ejN1RG1zN1A4TzFBdmxyT20zOVlMMk1ZR3RoNDFh?=
 =?utf-8?B?VnhqZExvbFNYR0w3ZkNlcURpL3hHWHdqNEpmcHRNQmZ1Ly9OeUZsNUNBUEJU?=
 =?utf-8?B?WUlVMk9WcS9YcE5jNHRqOHRIU092c2pTM1RLdExqUUxwSWxnaEEyRFJPZnBh?=
 =?utf-8?B?VUZRNlh2RnBOYWMyM20zRWpwc2lyN0JHOE5VWFV1Ym0zaGlCZTlmTGJQckZX?=
 =?utf-8?B?ZnZsTS9JdEhGM0hmaGFlL2kxV0NMNnBhM1hzOVlpd2VNeGZ3b2NBTXRJYTZT?=
 =?utf-8?B?RTA4bnZDazM5OEtPZEV3cDJvYWMrVldOOG9lek1iTHF6N3JiQnE1bHBEcFBD?=
 =?utf-8?B?emRaOTRuNFIrRXFBQklFdVhUVEQ3bnRHN1Y2dUNJaG55N1RvUkZWeGJZUEwy?=
 =?utf-8?B?TldrZlluRjhCcmVlZ2hXSDJWWnZ6UFRsL015OTlCSFp3MEVSU0Y1MG5BZjds?=
 =?utf-8?B?cE5JWnBsWCt1WGYyaFcyR2Y3U3R2K0xRdjBQbUE0eHVQaGo5UGY0NEpENnVJ?=
 =?utf-8?B?NFpBd3VNUE80djVybUoxOHJMRkQyMHdqWkRhRUt6dUJzdmkzQXlTV3dGRXJy?=
 =?utf-8?B?QWJaZUg3Q0ZJWXlKOGVZVCs4MGVmMUJjZnM5UXNxNzFlWjhyS2dqSFF2czZr?=
 =?utf-8?B?VnR4NDJRRzlFbE9rTVA0TkJxTlVRTm56U0NoZStTV0FIbTFvaXBHYlREeXJV?=
 =?utf-8?B?VzRvdFYzaFl4aXFKeURVRGRCdHU2S3JJNldvSW1ENWpSd2t4bmttQjVCenJk?=
 =?utf-8?B?U2hLSi94Y1B3Mm5Hc0p0cGI2QzRmMVg2eHQ5alV3Z0FLVEFTem4zVXpCYVpv?=
 =?utf-8?B?bDgwaG5YNHBCYmVrNE84aDJIRkhKTjg2eHVSa3BkRHZXb3JIWWJwU1NhNkJo?=
 =?utf-8?B?T0NqQXdrQjRpTTNCaVljSzNZb0Y5MmN1UDVyWFVFMXp2Z2JGc1JNNHF3NG02?=
 =?utf-8?B?cS9Kb0pwK0ROeG5uQ25zc2cyeHV2NkZlbkl3a1gvNjRDUEJQQW1DR3BSTGVz?=
 =?utf-8?B?S3dOUXU4RjRqYzdMYXd5QWZUOWlCeUc5UEw4VGlzamZJNk5vNzlsdmZLOElq?=
 =?utf-8?B?WllQWGREVDdQZ3FCUzJvZGMzWWJtTlBJOFo5cjNGZ1FKbVgyTEl5aFJMTlV2?=
 =?utf-8?B?dzBwY0RqUzZkd1N6ZE9qTFM3RlRENklXR2lVK0VLbEZsUkRlUVJETjNkS0ZV?=
 =?utf-8?B?Q2hGVEJZdnF6MXVJMSt4UlFUL1hxTmcyd2VVK2ExNjBxd2p6UUx2S295UGxk?=
 =?utf-8?B?TTdWQy9mbCs3MVpZenZsMmNZMjBXWndtR3dWNCtNTUVqM2hUVWRiTWlCNWFE?=
 =?utf-8?B?Rm42dSs3dDR2ZUVmQ3E1MTNrcmRTTWIrYWZ1MGIrOUp4amZ3L2hYOEpFRXJy?=
 =?utf-8?B?RzByNmc4Yis4VGI2Wi9kOGQ5K0RBNVBUR3Y1ei9qZTROVkpLTG4xS1BDSjJ2?=
 =?utf-8?B?bUZwUEovMitPaFdLR3Ywck91bEUrVWJHQUg1TTBWeVFBMG5HYThEcGhtamdn?=
 =?utf-8?B?S0w2RHFieUJFNUFuM2M4NXpwV0pkZlUyQVl3QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVRUT2JGazN4Tjc3WENxM2Y1RzlMTHdoekNWcnh1Nm1vbldXQ1daMHlhR0Uz?=
 =?utf-8?B?VldJa255M21leFNPMlVvUlM1NTdEZDllRTE4K3pGTk1ITks4NzJMdUJkYlNX?=
 =?utf-8?B?SnQybFByY2tRblNCamlNaUtGTGtqZHlibStiTWZVdXVlQllMcmdyeDExT0F1?=
 =?utf-8?B?ZHpqakpPS3pCRkVqalU4TzRHMnRZczV3SXNTN0pjakNlNE95NXdtQ3FxbXo0?=
 =?utf-8?B?dEtqb2N0VS9zWUsvLytrM0pHR0lsVDMzd0gxUWE2QXBXcFIrelNFZnJ2WnI3?=
 =?utf-8?B?eWttN3RzZEFhUXlCTDFWRVAwelNCeTZmRm85ckQvM09qekNaU0I0cWEvZVBi?=
 =?utf-8?B?NGgycGJWK2hQUktwTDJ3KzRHZWZyRmVHb1ltRWNlRnZ5cDV0bE1mRnhDb0R6?=
 =?utf-8?B?K3FHdGY1U05CMEY1NUtRYkxZZExCY2RuZW8vMXduWU9mbkNzeUdGWHhtbUht?=
 =?utf-8?B?SksyUVdWSit2NEJTNWdCU0dBYVBEdGJXN2lBdnM4S0hzeEJIYUZWenRqSWxC?=
 =?utf-8?B?SmZ2TTBpZ0JOWGZkVlRrN3BuamVyU0ZZSlN5S0Y0Nk02VmtDT1RGNGpnK1lP?=
 =?utf-8?B?bHB0NGdmdDBoT3MzM2JIVVFCY0pna1MvVUJ6TTdmK0o3WDJwMk9NT3RLMXBQ?=
 =?utf-8?B?OHNNZ0JYdzNhRWRpMmx4NXVqT0JzMXB1TGg0MUZxVDZiZUNQY3haa25NT0oy?=
 =?utf-8?B?YlJzUGl4SXVWV3ZLM0FQdEQ1Q2psQW1EYnFubjFMOG5PMi9KemFjamVVMk04?=
 =?utf-8?B?VGU2RHZYRyttRU9hNkZDUDZWdGsvMlFBck5sc09LK2VkTGF6THJyZ1AwaFpl?=
 =?utf-8?B?R1BQSzh3bFNZckN2Zk5KM1QxRWs5OVA4VWtzSUo3aFB0Tmd6VWxFSVRWc3I0?=
 =?utf-8?B?LzFNYzhneW1xNGszazRtakdJbUN0eEFweFU0SFRZWUNkMG0xa28zalo2NUtv?=
 =?utf-8?B?bFlmYzJtVnVqYVNLQlNZYlo2S2c1SFM1cUo3Y0E1ZFFDdERXbG4yWHIyR01l?=
 =?utf-8?B?RkllNDVEUmUrdlozOHlxM1lIUE9qYkhNZXJ3YTlJWVZvdTduZGNWTC9qNWhD?=
 =?utf-8?B?VDJpeUlUQ3NlenhvMytIZFdiOHdEbkc5ZjM5bDdGMnVZOFc5cDRscFIwbDdZ?=
 =?utf-8?B?c1hhNWpkOS9zY3pxdXJ0MHQzMUpyVzhIRVY1cFQ1SVBDSGFEaGQzYnovMnhx?=
 =?utf-8?B?NEVXNlpqelhVK3BVNVkydUVHM0Q2YmVZZlRvS1lVM0w1OFhQR0VjNHRtVHFa?=
 =?utf-8?B?QUc0YXJ4NVY4dXorV1RBWUhRSkRBa1R2VGNLR2srdmpuR2hYQXErdXRYMzg2?=
 =?utf-8?B?dzNqNGZZWU1wNE0vUk00d2JrTVk0cit1bVFDVXhvZWtmWXBPZkhrbFd2Z1hL?=
 =?utf-8?B?U2psb2o3dWxJTkVjRnFPQWdDcXdwR0dDSG5zMzRMQUN6NXNQMUFSRGdsZEhT?=
 =?utf-8?B?R2NobG1pdnZyNGYrdXA1ZEM2NmRWYVUrWnc1WXFCLzk3UWFTS2hhdW8zTXJv?=
 =?utf-8?B?Z0hTVHpONXdGQkFKNzdUVVFucEwzWjNZbkVMSjYvaCsxNVQvYTZ2MURKLzBP?=
 =?utf-8?B?Y3ltOXZzd2RqZ0RxREpOUFdUakhMNzBuNTk5M1UveDNUUjFDRHg5UUVNNTBt?=
 =?utf-8?B?Nm02aU1iQ0VMM3hSMEExRDJIenQrMG0vR0tkMTBKUEZWQmVZclloYWhzNGxp?=
 =?utf-8?B?bWRBU1I0dlc1N0lMcVlBN0l5aXZyMzBKbTc5YlZXTEhSRTFwT0ZtQ1h4Y2FL?=
 =?utf-8?B?UHZOeHg3MDAyR3hYc2J3dEhMd0JxVFhSUEdENWlYQVozZjMvU05UWDFpZUZV?=
 =?utf-8?B?YzlyY1RWUTRXUjFkZm9jWkxXeU5uNXQweUxuZWswckJmamRITWZBZFJqSE84?=
 =?utf-8?B?UFZXRHppZU9sZFk1SUxqVHdFTTc4UDh0WTdSMG93VkpBMmNyY2FUUElNbzRa?=
 =?utf-8?B?eXB0RzN1RGY2Z0dpdWdxMkVFM1FnSUZWSHo5RWlMczNqankwejExdnE5MFd3?=
 =?utf-8?B?SlFXdDFFcVQ3NkVFaFhoTHVqYi9Qa2x1cEh1bVdLNjI5TUxCL3dEd3lwVEhS?=
 =?utf-8?B?V2lLYUtFT2gzdXFIcWZQN2lJaXNIc0oyZ0lDeDFxalRVOTBDK3dudDU4Ujhk?=
 =?utf-8?Q?6neQblKKBhkWh9kLkvoygzfLz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a8de6a-96cf-4b8e-0636-08de1dc7c79b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 06:35:01.7082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pply18v/0iNBMBBLLLVrCpOTD0LSB4aUI1G5zqcS1b4ZgN6pFywQuHkAU0ce+Kpc+gIYSLhtjQhn7FDa6L1vSjFDiPpazbbQLLeYWsmwV0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5860

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMSAyLzRdIGR0LWJpbmRpbmdzOiBpMmM6IGFzdDI2MDAt
aTJjLnlhbWw6IEFkZCBnbG9iYWwtcmVncw0KPiBhbmQgdHJhbnNmZXItbW9kZSBwcm9wZXJ0aWVz
DQo+IA0KPiBPbiAzMC8xMC8yMDI1IDAyOjQ4LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIxIDIvNF0gZHQtYmluZGluZ3M6IGkyYzogYXN0MjYwMC1pMmMueWFt
bDogQWRkDQo+ID4+IGdsb2JhbC1yZWdzIGFuZCB0cmFuc2Zlci1tb2RlIHByb3BlcnRpZXMNCj4g
Pj4NCj4gPj4gT24gMjkvMTAvMjAyNSAxMDoyNSwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIxIDIvNF0gZHQtYmluZGluZ3M6IGkyYzogYXN0MjYwMC1pMmMu
eWFtbDoNCj4gPj4+PiBBZGQgZ2xvYmFsLXJlZ3MgYW5kIHRyYW5zZmVyLW1vZGUgcHJvcGVydGll
cw0KPiA+Pj4+DQo+ID4+Pj4gT24gMjcvMTAvMjAyNSAwNzoxMiwgUnlhbiBDaGVuIHdyb3RlOg0K
PiA+Pj4+PiBUaGUgQVNUMjYwMCBJMkMgY29udHJvbGxlciBzdXBwb3J0cyB0aHJlZSB0cmFuc2Zl
ciBtb2RlczogYnl0ZSwNCj4gPj4+Pj4gYnVmZmVyLCBhbmQgRE1BLiBUbyBhbGxvdyBib2FyZCBk
ZXNpZ25lcnMgYW5kIGZpcm13YXJlIHRvDQo+ID4+Pj4+IGV4cGxpY2l0bHkgc2VsZWN0IHRoZSBw
cmVmZXJyZWQgdHJhbnNmZXIgbW9kZSBmb3IgZWFjaCBjb250cm9sbGVyDQo+IGluc3RhbmNlLg0K
PiA+Pj4+PiAiYXNwZWVkLHRyYW5zZmVyLW1vZGUiIHRvIGFsbG93IGRldmljZSB0cmVlIHRvIHNw
ZWNpZnkgdGhlIGRlc2lyZWQNCj4gPj4+Pj4gdHJhbnNmZXIgbWV0aG9kIHVzZWQgYnkgZWFjaCBJ
MkMgY29udHJvbGxlciBpbnN0YW5jZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQW5kIEFTVDI2MDAgaTJj
IGNvbnRyb2xsZXIgaGF2ZSB0d28gcmVnaXN0ZXIgbW9kZSwgb25lIGlzIGxlZ2FjeQ0KPiA+Pj4+
PiByZWdpc3RlciBsYXlvdXQgd2hpY2ggaXMgbWl4IGNvbnRyb2xsZXIvdGFyZ2V0IHJlZ2lzdGVy
IGNvbnRyb2wNCj4gPj4+Pj4gdG9nZXRoZXIsIGFub3RoZXIgaXMgbmV3IG1vZGUgd2hpY2ggaXMg
c2VwYXJhdGUgY29udHJvbGxlci90YXJnZXQNCj4gPj4+Pj4gcmVnaXN0ZXIgY29udHJvbC4NCj4g
Pj4+Pj4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgaW1wbGllcyB5b3VyICJyZWciIHByb3BlcnRpZXMg
aGF2ZSBub3cgY29tcGxldGVseSBkaWZmZXJlbnQNCj4gPj4+PiBtZWFuaW5nIGFuZCB0aGlzIHdv
dWxkIGJlIHF1aXRlIGFuIEFCSSBicmVhay4gV2UgZGlzY3Vzc2VkIHRoaXMNCj4gPj4+PiBwcm9i
YWJseQ0KPiA+PiAxNSByZXZpc2lvbnMgYWdvLg0KPiA+Pj4+IFdoZXJlIGRpZCB5b3UgZG9jdW1l
bnQgdGhlIHJlc29sdXRpb24gb2YgdGhhdCBkaXNjdXNzaW9uPw0KPiA+Pj4NCj4gPj4+IExldCBt
ZSBleHBsYWluIG1vcmUgYWJvdXQgInJlZyINCj4gPj4+IFRoZSAncmVnJyBwcm9wZXJ0eSBjb250
aW51ZXMgdG8gZGVzY3JpYmUgdGhlIHNhbWUgcmVnaXN0ZXIgcmVnaW9ucw0KPiA+Pj4gKGJ1cyBh
bmQgYnVmZmVyKSBhcyBpbiB0aGUgbGVnYWN5IGxheW91dC4gVGhlIHNlbGVjdGlvbiBiZXR3ZWVu
IHRoZQ0KPiA+Pj4gbGVnYWN5IGFuZCBuZXcgcmVnaXN0ZXIgbGF5b3V0IGlzIGNvbnRyb2xsZWQg
YnkgYSBiaXQgaW4gdGhlDQo+ID4+PiBTb0MtbGV2ZWwgZ2xvYmFsIHJlZ2lzdGVyIGJsb2NrLCBy
ZWZlcmVuY2VkIHRocm91Z2ggdGhlIG5ldw0KPiAnYXNwZWVkLGdsb2JhbC1yZWdzJw0KPiA+PiBw
cm9wZXJ0eS4NCj4gPj4+IFRoZXJlZm9yZSwgdGhlIG1lYW5pbmcgb2YgdGhlICdyZWcnIHByb3Bl
cnR5IGRvZXMgbm90IGNoYW5nZSBhbmQgbm8NCj4gPj4+IERUIEFCSSBicmVhayBvY2N1cnMuDQo+
ID4+Pg0KPiA+Pj4gU2hvdWxkIEkgYWRkIGl0IGluIGNvbW1pdCBtZXNzYWdlIGFib3V0ICJyZWci
ID8NCj4gPj4NCj4gPj4gVGhlbiB3aHkgZG9lcyB0aGUgYWRkcmVzcyBjaGFuZ2UgZnJvbSAweDQw
IHRvIDB4ODAuIElmIGl0IGlzIHRoZQ0KPiA+PiBzYW1lLCBpdCBjYW5ub3QgY2hhbmdlLg0KPiA+
Pg0KPiA+PiBZb3UgYXJlIGRlc2NyaWJpbmcgdGhlIElPIGFkZHJlc3Mgc3BhY2UsIHRvdGFsIGFk
ZHJlc3Mgc3BhY2UsIGFzDQo+ID4+IGRlZmluZWQgYnkgZGF0YXNoZWV0LiBOb3Qgd2hhdGV2ZXIg
aXMgaW4gdGhlIGRyaXZlci4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQu
DQo+ID4NCj4gPiBCdXQgdG8gY2xhcmlmeTogdGhlIGFkZHJlc3MgY2hhbmdlIGZyb20gMHg0MCB0
byAweDgwIGluIHRoZSBleGFtcGxlIGlzDQo+ID4gbm90IGFyYml0cmFyeS4gSXQgY29tZXMgZGly
ZWN0bHkgZnJvbSB0aGUgQVNUMjYwMCBTb0MgZGF0YXNoZWV0LCB3aGVyZQ0KPiA+IHRoZQ0KPiAN
Cj4gSG93IHNvPyBCaW5kaW5nIGhhcyBhbiBleGFtcGxlIGZvciBhc3QyNjAwIHdpdGggYWRkcmVz
cyAweDQwLiBZb3Ugbm93IGNsYWltDQo+IHRoZSBjaGFuZ2UgaXMgdG8gYWRqdXN0IHRvIGFzdDI2
MDAuIEJ1dCBpdCBpcyBBTFJFQURZIGFzdDI2MDAhDQo+IA0KVW5kZXJzdG9vZCwgSSB3aWxsIGtl
ZXAgdGhlIGFkZHJlc3MuDQoNCkFuZCBJIGNhbiBmaXggaW4gcHJldmlvdXMgc3BsaXQgYXN0MjYw
MC1pMmMueWFtbCBwYXRjaC4gYW0gSSByaWdodD8NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg==

