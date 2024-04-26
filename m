Return-Path: <linux-i2c+bounces-3229-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377888B3D1D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0912282C06
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B1156F38;
	Fri, 26 Apr 2024 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="jLIE7goz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781431514CC;
	Fri, 26 Apr 2024 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150230; cv=fail; b=efYjpZHt/npjbQJKQXz5k1zIRJc2MNB92fEAjsEn10/3EaZgjY6jDA2+1SdmEjHRfpJhqygda4azzfvoX/CdfK/wwXmG7Ra/D/4dW4bvDtz88pFFe+VuLqOMDSJYUsOV/f2b12IslgCv1P3M0KJAzMlPApnzjSLLo5JE9XSo3Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150230; c=relaxed/simple;
	bh=37bibsntXePyd0Onk5xc7YKBS7gyuV2opUWpMfc0FPw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BjDULjwbJgnK6Fy6/+Py1VTzlymMGFobTyKmT3tArqIqa8WZ+bkB8bcSiwy+R05vbHjbo/mTnsT5eLaUcz+ysDtzHjlixm4/eu2G167e1dgtJlpPTV6MG+o5Xw4yxZeJEWAJrRK2JEmN/zvs42Xdmi/2gW2oAjdNqnWyOWjZNzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=jLIE7goz; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWCcHj8Z22PM5c5O1CjJFcHSrwPqaCgR48MwnFENNSHYu88G3OkrFr2Nr00AYGUxLS6XcdDxQgUBiFgt57rd3n3bMXTRTSHMQySBCH2Zn7SA7Ea8F90AJm+PLVibNKnOKepNMkVV1Z33aGJ4PCur/FnFk+iG6KBT0rUTQVdROPB6KOu/BMrDu4f0xpbNsz+lXsHZZfiCThwIk1D9G03VmfX+GIxyO2SzHdSDVHFAv45HBfBdPJAbQsKEUkGQJFVGBfVFqURD8aYefVVpchSUIOpnxpKVyUA50Ub8eDPcixX39IzK0R/4hhFWraMr+NLM/2fm4uD5H0GiIm8f+jItGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOZ4y9LpmO3SIsxBmkTLzn2Xo1D8twp3LSzmvFtE+a0=;
 b=nrk0RqR7KD0syFtm48tRnOnPluZVC84PE2cdjwetFIZ+vq2CK0c1yvy6G5Xl+/riEP0tnrqeT95NWl42F4gCqLd0QDPSRvMVKY1vQzTZhgPctpesO+2JPW8swp5TXxiI0RCNYDkGBSxvcbbHIbEO4dGrJidRo2N3h15lGX3WFc9jMf0eVQBAwdreDWaMCCrk7tRU712NTFrWGCTvV9cRu/n8CeX2STH1KFarDUzJAGxPcSHM48QM7Ur9+BTf4lEGq8ppkeyKmHQUWr5VT2kM1wCWDYL+BnjJ9ygysgYNp4Y/jAQdSxGck1nfVwUAj9O0aV55fV39sUfKV1yyc09ZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOZ4y9LpmO3SIsxBmkTLzn2Xo1D8twp3LSzmvFtE+a0=;
 b=jLIE7gozIYwukbmwqUCzdK6/FIjGr+M0zoQWm+DN7Quvnj6DeZeOrBzxLJtD0P2SKd2zNRR1PwZ3Nve2i7Pz7yKpZReHwS6SlZ5LWkN+0YC4VjhuLiG7oM9876jLabVJacOnp5FViSBuNPjJprDJ1xOWrsT+p4sCeEACXLnXmXP5CvQgLvrtqteJioQ/aUGtca3p/UgzR4wO8szDMYcBI9mmNw+vAI+t6/eBtEUbIYtCqxn5YO++pIGyU75Rflo4u/vpeSIDJYRHOpO+FT87VW5pwHmZ37vnJE8fq6drhLAItAg7v4YV/Jm2ZtkxA0ikxxkPJjlBtRLGZcsCbKAihA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:25 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:25 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Date: Fri, 26 Apr 2024 18:49:32 +0200
Subject: [PATCH 1/7] i2c: mux: add the ability to share mux-address with
 child nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-mule-i2c-mux-v1-1-045a482f6ffb@theobroma-systems.com>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 01dcd41a-a324-4c5a-b457-08dc6610f831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE1tc0hDcm85bkI2RUNUdnVlNyt4MDZUaWJRT0pYY0FCU3U2dXJ4aUE0VlF4?=
 =?utf-8?B?azIxYjdzd2EzNUFWa0R3NDVIZlA1aXVIb0greWxsK1RtdWVuR2JRNGdSbGdS?=
 =?utf-8?B?Qm1UcUtNV3ZSc1pRa2VsR3o3VTZFaC9wenZuR3JYa1VGc0ZpdVBuRWdXTXZl?=
 =?utf-8?B?R3dEQjI2enRJUHFWdDlka0xVTU9zSktxaUNPb0pNd0xabVd4R0svTnJsT3h1?=
 =?utf-8?B?SDJuNWdSMlNEeFlHam10eE54SVk0UmdGcENMZkdPSDFORysreHEvVDVRYTF0?=
 =?utf-8?B?L0xBay9zMWRHak9ES25GTWZhRW11RU8yRjNWK2lReHhwU1RENjJlU1crUUoy?=
 =?utf-8?B?TmErQUpudVF4M0hLbUgxWkYrYlloRVlsOStwM3FSa1didk1JcHJJNk5DVTJu?=
 =?utf-8?B?ZHNBRWxRUkFPVUtoVzJaaVdzSWNoTmlxQ2hnT1dDQ0VFSGpidlVGanpaeGJH?=
 =?utf-8?B?MEhYWThLeHVpdEFxZHhLdHRTbVNpQm5PR1hFaWVMZG9kcWFRdHBlWUl3ZEJT?=
 =?utf-8?B?Mk9HbFpTcit0QWtUMExxa3ppbGpBMkV5NTBtdkJKNGtwOTdzb2Q1emJrKy9x?=
 =?utf-8?B?OU9YTjNUdDF3N2lRTnRpR2J6R1EyNkwyOHU4a0xaeFZDQTd2cHVuUDFQZ0Iz?=
 =?utf-8?B?OU9DRFRVNnFDNGNiR1dTaHNoMUljQkt0aDhCU1FFVTJhVUlrNkJ2dzhpMnl5?=
 =?utf-8?B?R0xjWFNJeXQ2MFd4RmlDa2JwQ0VNUW5yam1jeUd1Y1BlbGtjZkFjL3RKSkRm?=
 =?utf-8?B?SThJeTE2UVJEYXdQTHFMMWs5cFBjbUFJZmdpV0Y1RUIveGYrbGJ2MmFtNHNQ?=
 =?utf-8?B?dFZZQWhnanlDSFB6SmQrSGJzYTdYdyswU09qcUtwMU43NWFwUTNWU1BOM1dZ?=
 =?utf-8?B?U01wSWZwU0UySDA5TWNQQ0JkSlZFcWdhK0RWZGpleFRLV3A2Y0J6U1R5WEZx?=
 =?utf-8?B?emthWld4Yno0My95STNZU3pqaFN3V1pYK3F0VlZFbVU3RnVkVGZ6TENrUXBy?=
 =?utf-8?B?ODZ0M2UzbTVIVGR1V0x2SVJJcHZDUUl1SkUvZTVyS05HYjVlT0ZNdjBwNGpw?=
 =?utf-8?B?RWJiVVZENDhENFBWQUFFNWxkOURMVlg1Y0wvQVo1SldTVzlXZWpVdEpRTTUz?=
 =?utf-8?B?STQvUkdjazFESzBiZGg3WGVOV0RQYXpmVUNIRXpjVWNqeEVtd0xieEJzenNT?=
 =?utf-8?B?SUNGZFgvUUdnd1NEaXRrUkErZ2JXRW10S0ZCSHduWGg5TFo5ZFZFNDd6UXhD?=
 =?utf-8?B?Q0JxTHRHeFNKdk9RbmM1ekdhUURFS3VMK2Z0M3huRjFiUmh6SVFxcytIVzdt?=
 =?utf-8?B?U0NDckF6c05DeFRvaTh3cTE2QUpjeis4cWo5ZXRsSVlkc2Z5Zy9rOGVkT2px?=
 =?utf-8?B?MkJCZ3BKWWt1YjI3V2V6c0d1d1FVUkdTdXZYYWhnMVZmbDFaSkZ0M3owNnJB?=
 =?utf-8?B?V29COGxmdjJ4OENKcERZV25WeE9SODVuazY1VWpQWVZpTEJGdWZ4Wjh6VlBB?=
 =?utf-8?B?YWtFSEI5STl4QXdXUFdKOTJxbEg2RHhSVkxnYXhYSEQ5NS8wbjdsUHV3bkZB?=
 =?utf-8?B?NndqcHBONi9zR3RhU2V0Z2ZRU0dmb0Y2MzcxQXl1d3JsQ1E3ejd3dy9SUmFW?=
 =?utf-8?B?ZTNpclNETlNGd04vakRpSkVVYjR1S054RXdqM1BVZGp2TURnVmU1d3hyVGJs?=
 =?utf-8?B?eW9oaHlhV0ZiNjV3RVJRZCtKTFFGWnRNM3JlN3FVU0JKbkxnc2FodU5ucjhH?=
 =?utf-8?B?SDA4VkNPTnFuN29OUERmellEazVnc1J0UWp1cVZaaG1PYWdHcFdjTHhoL000?=
 =?utf-8?B?Si9qSmYvSlE1U3gxZVdMZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejBFUTlBWEY0MHBhcG5ZZkdaMVk3YmxIZ3BGdUFaZEhna2hoaDg4QVRETUJz?=
 =?utf-8?B?WTk2Vm0yQXBRMGt3WUE2VU45Qy9ZZUFvSTdRbkkzcHo1eDE3QTkzQWNHRDBn?=
 =?utf-8?B?amRicDVxZFpDcFNlTzcvSGM2dG0veStROFVoZElrZUovTmo0c3Q2Y2RtcFdn?=
 =?utf-8?B?cms4KzhDV3NLSzN0NHlQNCtBV3VCcnAwVU1iYWFKZFpwcXdVdGU4NlJ6Y0VO?=
 =?utf-8?B?R1k5cXgrS1NBYzFJbi92UzRKR2V5NjV6S1BRbUpZNVpJV3dRM3Bod2k3VUVi?=
 =?utf-8?B?UkVrekRQQ2JKUVVsTmQzVEM4c05FcVZUdlUwQmtLY0hoQzFVcVJqVTAyZmpK?=
 =?utf-8?B?SVRPSkNZZTdPVk5EOVNyVk01OWlJMnhDVFVEQ3FQWVJiS05vVng1SEpVVDJL?=
 =?utf-8?B?dDdHaXRrbGY3eXhoZmRVTDZHdXNoNXExSjNpN2pNK0hPNWFBaGNRNFFDTjFZ?=
 =?utf-8?B?SkI2YTZPdngwbFhwRC90VzRQQkIzMVJUMGoxWkIzL3RYcUVad0xkUFZSSUZo?=
 =?utf-8?B?YmF6YkVOdC9nSGZMUHg4cUFKclpZaDhvM0NYL1ZxRjlJQXUrMUVJcVNDUWt6?=
 =?utf-8?B?NFVaRXFyRFVSdTdNMG1WRnBzZ3p3R01hSldkS054bkNxVG9Oc25paWJNY3Q4?=
 =?utf-8?B?am82N3hTNGN5akw1NlhyNTMzSWtwUGlYa2pkem83QVhyam43K04wZ253R1FH?=
 =?utf-8?B?SFRnZzlGRGlNM2hjcERoWGw3K3ZnVVJmRkhpZjYzT1FZa0JNNDZhL213NzIz?=
 =?utf-8?B?R1NRR2JYRGJuOHNpUmV3aWRFZ0ZCeWpkYVpuRE9DaHdPb0tDaWx4aVM0T2Jp?=
 =?utf-8?B?MG5Rb1dqSUZuWFFoeXJQV0xLTk14RHhNdTZEREc1VzcxcEwvb05DWTN4TkdB?=
 =?utf-8?B?ZUNBTDFFR2Y5cy8ycmRKclNNT2ovNHpCMlM3L2w1KzJzR2VYenBZNElsOTA0?=
 =?utf-8?B?eFJiMlpzODB1YUxqRzBtYVNPQ3VOM0xqYmFxYXhXV3pDckFKVHc2T0RxZjJi?=
 =?utf-8?B?VzBGYVNKYmRTbW4xYVhCVCtsR3lhQmNJdmRXVERQKzBCTXBlYnhQb2toOTZt?=
 =?utf-8?B?ekxiSE1NRm1heW1HZTZBTm9Za1VNUEMrSC8rWXJSRFQ0R2pqSHhWaDc3d0Ju?=
 =?utf-8?B?UmIzZTd6NitjNzJudjJMZmZPWmJSdmczcW0wcjhZeER3VnFvd2dvR09FQTFp?=
 =?utf-8?B?RkQ5aDhVL2ttalMxU1ZIeUpxQmVtdVRGc29ITDJoVWxZQU1uTndkTjRpY3RP?=
 =?utf-8?B?UXdIWTEwR1NpZkhWSXkrT0RXRmtKNVpnZ205Y3BPVlFpSXpUdCtrdjRuZmhz?=
 =?utf-8?B?LzQ1bWxWMk9HVHpaWlZFYXU2a2RNVy9EdUNETldOY0ZlS3g4YUtsakJJWk1a?=
 =?utf-8?B?eHZmd284ejQxQTVCazlxL1Bjc0tlQ0dkTVJncktIaEZ1ZnhJNHROTGkrV2J0?=
 =?utf-8?B?amdhVlJGbStXdXJMb1pwRWh4d2lXWGpnRGo4S1I3RWhKY0k3SStXS1VZMkxQ?=
 =?utf-8?B?VkVaK2VyQkxOZmJEcGxVZmpteVNibUVuMlRucDVwTEJBWXcydjh2QlJWeWVm?=
 =?utf-8?B?cURmaFprcm9yRnF3YkVPVDlQN20rME1WV1B3WSt0QTErdVpJN2JZZnpxUytp?=
 =?utf-8?B?ZUZZaUg3V1hUY1IvK3lPVUh4c0p4YmsrZHVUR2RIWGNrTGpDdHFEUHJiMkFl?=
 =?utf-8?B?NnowUG8vbk1lVEI5YmVvVnJiTzRWQ0ZtQ245SThVb1VtVWQ5V3FnY2cza0hP?=
 =?utf-8?B?cU5yVW1ONkJyL0FLWjdJSWRFSDN0WEw3Y2h6elFHKzA1dHpxOVcveHIvWnlG?=
 =?utf-8?B?L01HeGUrTzBzOWZxZ1V1MEhqWEk4U2RHNWRKM0RoendkOXVoNTMwR01WN3g0?=
 =?utf-8?B?Q1NnSFNIZFVVSFpBcUVZNnZpR2M1bElGQXdhbHlxRjZvR0JWUS9jSjZHank5?=
 =?utf-8?B?eC9UQXFiZnlZOEhTYnlUVnB4SHVPMzdRRzRHVzg5Um8zRFIraEdib0NYWVBk?=
 =?utf-8?B?cm1lRnI4VWRLdURkSnBmaFpxMzVlVG9rTFdvc2hFRHFUWnRJT2N3djJxVWJk?=
 =?utf-8?B?WHU2NDlNOXBFQVJUbU9aajBySXBEZzgzcktGQjl4TEZ2OXY4UHJGY1o5Rlk3?=
 =?utf-8?B?QVd6VW5hSk5ncWxBRnpiaURTMEc4Z1FWOHFKUUVJQlFqb3pZMUMyS0pZQ0Vs?=
 =?utf-8?Q?HzCIaR8PoTwse4NQTTuyqQI=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dcd41a-a324-4c5a-b457-08dc6610f831
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:25.1088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s31FsMxDOfV7owdLmFX60Fksqy+dhoPm+0I5FmeNv1h6Y2P1UPM2FD25PXg6OSI0A7K/V1PCMCy4vq76ABHWvnKu/W2074f4SMgPtC69b2XZaoJdip3iFUUIx/py5FS9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Allow the mux to have the same address as a child device. This is useful
when the mux can only use an i2c-address that is used by a child device
because no other addresses are free to use. eg. the mux can only use
address 0x18 which is used by amc6821 connected to the mux.

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 drivers/i2c/i2c-mux.c   | 10 +++++++++-
 include/linux/i2c-mux.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 57ff09f18c37..f5357dff8cc5 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -331,7 +331,6 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	priv->adap.owner = THIS_MODULE;
 	priv->adap.algo = &priv->algo;
 	priv->adap.algo_data = priv;
-	priv->adap.dev.parent = &parent->dev;
 	priv->adap.retries = parent->retries;
 	priv->adap.timeout = parent->timeout;
 	priv->adap.quirks = parent->quirks;
@@ -348,6 +347,15 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	else
 		priv->adap.class = class;
 
+	/*
+	 * When creating the adapter, the node devices are checked for i2c address
+	 * match with other devices on the parent adapter, among which is the mux itself.
+	 * If a match is found the node device is not probed successfully.
+	 * Allow the mux to have the same address as a child device by skipping this check.
+	 */
+	if (!(muxc->share_addr_with_children))
+		priv->adap.dev.parent = &parent->dev;
+
 	/*
 	 * Try to populate the mux adapter's of_node, expands to
 	 * nothing if !CONFIG_OF.
diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
index 98ef73b7c8fd..17ac68bf1703 100644
--- a/include/linux/i2c-mux.h
+++ b/include/linux/i2c-mux.h
@@ -21,6 +21,7 @@ struct i2c_mux_core {
 	unsigned int mux_locked:1;
 	unsigned int arbitrator:1;
 	unsigned int gate:1;
+	unsigned int share_addr_with_children:1;
 
 	void *priv;
 

-- 
2.34.1


