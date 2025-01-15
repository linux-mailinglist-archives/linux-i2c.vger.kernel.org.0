Return-Path: <linux-i2c+bounces-9112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F78A122F4
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 12:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D703A14F3
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 11:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BD123F29F;
	Wed, 15 Jan 2025 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rgGh4Scw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2A236EB6;
	Wed, 15 Jan 2025 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941471; cv=fail; b=NLpEJHW3zoTAS1wCL0YG1iPT4kw6daWoin+dvzuU2ybv/7D0U3zjK5IHMQocr20PJOEXkncS5zrvdjPhYaTOYrsSN4M2wYxEKg+xqd5A7u1BTAOY+o5ujG4V8XS0APeguJqe+ufCU76EdCXKBsltWtNw2RcmLjmDZ69ICTwTct0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941471; c=relaxed/simple;
	bh=qahgnu0gR7977K/UyQ2iDJZQdBISLxs/jPMXAYiCzuY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pYvDCtKzRP/WnaUxkEGLXpge0yz3pVfQ+8uSuBWnQMkF4ok9ADxwq69tI/Q8zxbvFeBU7xW7pyaZYyOajBD6kjDFyD7KI7rwygNN/mpjXeD0eAbSJX52TQkg7CidFzEaH26jUMdQW/HBTGGsgldoJqPabqUkIz5HzVp4l/+HJJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rgGh4Scw; arc=fail smtp.client-ip=40.107.94.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBmdDprtjjlsEhkITAGnecgwlThAH+izzqKE2XwpJcqma83rjw+RU0X1Mr3BPsMMoFizdp81a6kcKy9z+J209R2XBxFukaf9iO55Nj3kYwSUvzhB7kCHn3ULwFq68/c/cZ1ITv078BcSaY5NBwHwa1aV+a9IDtxlybHpRA3HGaemlVBMnwqPNO6ydW92PBm/H+vl/IxfO0eud6WJq01HnUq33z0bbQ+sM3vtdeeeWvcLSOmlcf2d2nKc0JvJ7fDx+Nw0Uw9PpmXhszrKwO5pOCPjJ79y3edwPihmgFylhW2e6tWQ5fLbOzcZ2No9JgU5sYK0fC0aYHIwzosbScXq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qahgnu0gR7977K/UyQ2iDJZQdBISLxs/jPMXAYiCzuY=;
 b=UNUZ1EjgF0eq2+1kBgvQ5rjehjBLTUMM84L02MefzUUgG6t3ne6IxN0EpIonyWLczZeuTErjXPgowiAA+Sis23ssx26bUPXYiPRDj/ETogtIOUpQnzyKese9WbGo1dvkNzyUKOisaDl8+rCfPQ/5F9S0vbWYO1tLBowf5uQYZxsLQjtyo6R5VDwYnsfh9LArdag9xyVXz+3xKrmWWIrNDADqEu2ISqX0ib4TpLhatZpXAW4em1bnNPvPj19kJLsrxbfnFvC/ZpSTWadNLBM3XqPp7PTRjV7xjJV+C/Tj9H3BZ7mLjCxDaAGB/sRfOyO7uEvCIdFTgfdGuxeRJGXgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qahgnu0gR7977K/UyQ2iDJZQdBISLxs/jPMXAYiCzuY=;
 b=rgGh4Scw2ivUjF9WTxS5Uw6ejqVsv5b4S+W/pV/ikWoSVWWS8bMpjEedFqYnHMXqRbD+fhg/ked0vWLB3CA29vYcAGNgTo53uimgP64hsN045vQ8914TS/xBRCHLJSt5Ywbrxx7r5H3i4Lu92hef1jxWL9n/Z6EOBrPnujfK+rbtel43nVmdwLRanikZxWiVJXGN7Ro7t+1hFx8sC7ZIFrSrx6WnM0+aan+ZnG0dsC3xZxSLhe0OL9xB3UVFDlgUhA73hEq7ylPKgqSHexOWA4pv2WBfVSOSsEBBLk69dgT49d0VUbcW3daOOCQrIsuEiY69FLhdowrr6AUf16LdPw==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:44:26 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 11:44:26 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Akhil R <akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "digetx@gmail.com"
	<digetx@gmail.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 0/5] Add I2C support for Tegra264
Thread-Topic: [PATCH 0/5] Add I2C support for Tegra264
Thread-Index: AQHbYoKAlsSoFa04CkecyhTSF5GhVrMXwJqA
Date: Wed, 15 Jan 2025 11:44:26 +0000
Message-ID: <e43b438917144c2896cd5105aa9ccac27c753427.camel@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
	 <fbulujgwqziyxxzokrtxzhysybuqep6p5pqt7jbqbclirllzp6@jbslthf3zh5f>
In-Reply-To: <fbulujgwqziyxxzokrtxzhysybuqep6p5pqt7jbqbclirllzp6@jbslthf3zh5f>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: 7b4f5882-1465-4722-da7d-08dd3559f6ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TVp0U2tjMm9wNGFXZStrTUgzWlRlVTNBN042UWpZV3FGUWVkN3dsWWd6VVFy?=
 =?utf-8?B?OEFJQ2NrMTNsdGZQUUZqQ1pwM1drRFF2Zk1MeTR4R1UzWWRHWnRoZExvZjcy?=
 =?utf-8?B?SjRTS0pRVXhqbW9mem9qZ1VkbWtTWTA0anVnWDhNSHBhRzNORkJsNlZDVXR1?=
 =?utf-8?B?dEZvaHNQbW5FQ2NKdWgzQTNjdFZjSDQxTldqNHdQWndYL3cxRlczM3AzQTZF?=
 =?utf-8?B?QXM2S2x6d0lSeWNHL2l5b2JLVW5UeG1WZlZ6aWY3QXI1RzFaWFJEbkF4V243?=
 =?utf-8?B?bTkwNE9RZmd2bGhUTTFZYWQ4dkpweG9pczNEZEkzeFdJbU9jZXMyc0oya0Y1?=
 =?utf-8?B?M3BGTVBqV3BJTnZJY1R5TGdqc1pFanAvZ0xPYVVkUnN4aTZmcWMrWmtwbGpx?=
 =?utf-8?B?ME1ybWRRbzhGZ29XYVRVc1ZIK0F6dGsvMkJiK0FmcHdvTVhLVlNnTDlLeVIx?=
 =?utf-8?B?K0djY3VlV29BY1M0dWhRSTJIQUpabHc4MWhpSFh4VWJmZDQwK0JqVklQalU5?=
 =?utf-8?B?R3FZeFJnYlJGNE5EM0xldzlid2UybitQS2hqcndQSW96L3FrMklibDZIVVhq?=
 =?utf-8?B?eC94MFZ1eCtpU3ZxUVdMQm8vRFNYL0NVU25oTlJnNmFqRkFrcm5KaUllR2gw?=
 =?utf-8?B?c3B4RUdZQ2FSckhJT1VmVW9kYzltMUt2TzVsVllwSEx5ME5MRlN1NHBxZ2FD?=
 =?utf-8?B?aUg3dTdBR3ovM25WM3B4KzBmZXVzaktmMVQwdXFYOGZTMDBNV3JYdDM0S1Va?=
 =?utf-8?B?aE9Bc0pXdTRlc09pQnloWHVNalZ1L296Tkd5cXAyektZaTN3TTNJbjBjTU41?=
 =?utf-8?B?aTJZS0JROHJTc2N3MWZwWm9KT0tJNTF1UTBYSllGMk9yZ2FkWCtPdU90YkNO?=
 =?utf-8?B?WHhXT3pqTXp6OUkzSFlUT0hLemc1Tm84clB5b0ZGdFhDTHB3eVhHOFY5SkV4?=
 =?utf-8?B?cjliNGJUTCt2S2x6YnhYTGxOSm13aTIzbnVDZXlZaDJBeHpCUFhFQ2ZueDlR?=
 =?utf-8?B?NTVVRmhmNG4vMlRNald4MTZ2R3VmNmJQWk5ESTFNWlRRZnVjZ1ZyalNzVFBu?=
 =?utf-8?B?eXpyZDhpbTh6dlg4cmhXVjNiNmJvZVc3bXI2Y09OdXl3SkFBSVUyYWlDVE1m?=
 =?utf-8?B?MlZRSUowOUtBMnNXQkcyL0FBWDdwajZzeTZzb24wMUU1NnJ0ZndXMVJPVE9I?=
 =?utf-8?B?Q0NVNTFKZ01ZTFY3Nk4va0xSSjR0OFhBK3kxcFNhMWFWZ0x1Q1cvOEZ6elBR?=
 =?utf-8?B?a2NVcnMxUEJPb2xYQnNRdUhSazVKZ1dZeVByTVlPZUp6Zmd2WHlmdmd5dkU1?=
 =?utf-8?B?T3YxYktFeGV1Qi9DMHF2NVB0cnJFSkcvcm5WVlJQQ1pKcUZ2c1Z2WEoreTNy?=
 =?utf-8?B?eVVtcy9IcGhVOEZtNVFxNHhPMHZ4M2FLY1ZBOHJyWlcxa1laUGJZdTdiWXFY?=
 =?utf-8?B?eHRzUkR4NUVidVJuVWpjZlpRSXFCUkNhWmdadDhDZ3E3L284K3ZqRXR4dGJS?=
 =?utf-8?B?WXJTY0FBQ2tnaFlLdjZxQjRRRFRIM2d5ZFFYREcxT0RObjg5bFhKRk9meElt?=
 =?utf-8?B?MmNGekhkaUN5SHB1QnVaTUk1Y1Q5Zmtyc1NObGJ4dE85WThQQ3R4Mmw4WW9s?=
 =?utf-8?B?ckJSRml1ek8ycEVLa29sdnJBcm1BWkRsVG1SS1Jxejd5OUxrWWd0N2c3U202?=
 =?utf-8?B?WFlOZDNqMXJNVWpiWHArVUY2Ymd4c0VsS0xkbGpCNDVpR3ZlZ2UxTXB5QW9U?=
 =?utf-8?B?dzlkZEtlVzVBWEZJYUtYck0zYUlEeGF5UmJoNGRtNXVsQjFLUGFtcncxTTRL?=
 =?utf-8?B?T2Y0NU1FOEtUZktpWUQvY3JpRlYyWEwyM3QzUERVUmdhcE1pQnFtaVluTUlS?=
 =?utf-8?B?ZHpYM1ZjOVQ4V2ZQK0twNVZZZnhza09GNmJhNVhiUHRGSlFRNFlCcXI1UzJh?=
 =?utf-8?Q?oCmIlnwguuZ5rJX/OA7RRKmLEwoNCS2A?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHE2cW5NZmN3VUw5ZENtZk1MVWtNNWtwekNxdGdUVlBDekluOS84Z1dvRTRS?=
 =?utf-8?B?N2ZjbGNmUEJTL3p0dmpPZkZiVE9uN0F2cnlKU0FKNEh6ODNjTnFKNTljVXVr?=
 =?utf-8?B?TTdPSEZERjh4TWh3L3lMQVpmZllyUzZiU2hXa1h3ZXJDU2V5SklSc1JuMUh3?=
 =?utf-8?B?MnZLVXVsUGd0TlNkcU1weW5UUm9qVFk0b0MyMUpIblNoUWkxcWlMUTRUdU5E?=
 =?utf-8?B?Z2c0WUg0TUJyODlUdVZpcmZsVXI4Ky9Hbi9qZFlkUlZvSjVJbzcxSTZJK2Nu?=
 =?utf-8?B?M1gwS21zb3Vsb05DMFBLQzlwUFZUNjZ1UWw2a2NSb3Q3YjQrQ05OZXdlcWpv?=
 =?utf-8?B?SFQxbndNaHdWL0wzL2ZyU0RsOWFwZkxHOFNSaHJuUGRFaGVJSzhrSzR5UCtX?=
 =?utf-8?B?T1FoQU1RSUhncTUwSlJVTG1YMXVDVit4ZWp1T1g4QUVkT2JLNDVjNXdxamF5?=
 =?utf-8?B?Y2hSa2hpVVF0b1NGRHFPakpieC9va1ZOVkQ3K3BUOC82Ym8rMFBmV0NkM1Qy?=
 =?utf-8?B?QnhkMElSRWJma05qeE5qcERlNm9HZGR0cW1DSThOMnF5TXBlWGpYa0dUUGo0?=
 =?utf-8?B?VXNLMU93NUJiajBqQzZyc1B6em85bmVsdU9iUnVhY3czMUVwMS9qR3ZUalY2?=
 =?utf-8?B?a05tYUwzZE50MzJVRWRzYUxYY0xEYXo1aU5DVGtjVUZGM3AyMklVOGdlV0R5?=
 =?utf-8?B?L1EzR0FHVDRKRHBsK3huZ1F3VnVIcjVwblN0RTlzK2wxWDBPZzNjWFBCRlQ2?=
 =?utf-8?B?bzYyZDJCb0pSd2VMaUJsaHZDN3FrMFBkTXN5NUE1b3gzRWtOZzFRK3BXYllz?=
 =?utf-8?B?THRUakZNbDhJTkhxeG1SNXF2UDdGdzQyUDNkNjd4SzlUZjFlMGlqaEY1cllF?=
 =?utf-8?B?Njhxa3hueXZTODExQ0dBbzRTcWp4VkVFTkMvYk9mclNEVWh0cEN2eWQ0MmRT?=
 =?utf-8?B?ZUR0VnIxSkZJV0ZEVVo2dUU5RXBtOCsvcFExZGliTFVMSnQ5NmZVWDN1U2Uz?=
 =?utf-8?B?UGJaTXNMOU5kVkZGT01sRFRUK3pjcGE2RkVTcSt2WVJabkN0d20wOXI0TmRZ?=
 =?utf-8?B?cHFTSE1aL3ZUanJ0c2JUd1VKbFFUL21JaS9FaUlQWDFJRk1pYy9ZUUU1YWta?=
 =?utf-8?B?WDdCOUJ6KzVsK0xzUlZQTW41UzJyU3hYN3FLNjZsZk16N3Jla3hNVmNkQVcz?=
 =?utf-8?B?dklJN0JhbHZGT1BwQmNZcGtHVFN4RjVFdEtlcEFsMzZzVStGOXlrZGRwWlpt?=
 =?utf-8?B?dFlHZHlsWVBMMlJrQ2l4ZjB0QU00WTN3bC9KRTF4ZUtFMStYQXNPMXk3WldS?=
 =?utf-8?B?Q2RoTWlLenhWSndSaDl5L2dZcXMzYjZEQ3Vxd0hmYWFqSkxrZm55eUZsaVcy?=
 =?utf-8?B?em5zZDRYSjZmTWxPZVliWm91UGhSd1pmVUdvWEpuRWdJTWNia0kvUVZpa2Fp?=
 =?utf-8?B?TGFhQjgvU3NxeDllSmZXYTVlaFB2ZlI5RXZaTlozbXgraFFWeHJDQVp6ZWNl?=
 =?utf-8?B?YTBKOTBEdDFMU0dxeW53TkozWGRTcVQxSitIMVZXOTByL2tvSWhhc3FpSWNY?=
 =?utf-8?B?alNyNlcvRllBbUEwTzhZdVZ6c3ViR1oxWjNaV0ZUcEI2TjFYN3hFdVJrZ0w5?=
 =?utf-8?B?Q00zRHJiM2x6dHNFNmxFZ3VNYllDaGtNaXNQMXFtNHlHelk3M2NqSVVEVlVS?=
 =?utf-8?B?VHZheVZ1azcvazJDYlJjd3pmRktMSFozREk2UjFIVTNGWTdtVC9CUEV1TUJ3?=
 =?utf-8?B?MmJ5dlJrNzRONkREeis5ZDgzZlhYbmpRMUNINmN6V1I4SlhzMjRBQythYUNq?=
 =?utf-8?B?M0Q3dVZndXpuSSsxdUFHOFllQXU2bHBHL2o0TjQrY0ZwZWZrajRuNHhlZWtx?=
 =?utf-8?B?bm9vVjl0eWNLSDlWR29RdDlWMGw1Q0dPc3FlVm1lYk1UeTJpVW1WSVpYci96?=
 =?utf-8?B?OGFwdjlOZFNVNzhXUVJvRHNyMmZYbmxyVFU2bHJRdmFvRmZOOFBIdmNJUnJM?=
 =?utf-8?B?eVA0ZmEwZXRkd2t0RjQvSkdqVjRwVXBFVExtU2pWVGEvdzM2cUt3QURnSzJZ?=
 =?utf-8?B?ekFYL1ErU3h3RmEyWUFEeStvblNaZ1g2ZjdxUnBzOE9KNENzbGtVKzljUFhH?=
 =?utf-8?B?M3lXV0tyVWhMVnRLY05EWm1tSmZ3cTFPZEtvOWluaEdzUUMrWFU2MEV3aksz?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <938C5DE01157264F9A18F80F3F2F7CFA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4f5882-1465-4722-da7d-08dd3559f6ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:44:26.3229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: veoDorin3EKzk8+hUAKbki2CyXM1F5aJnrKpFYlAQb5/GiiOSxxw7zUwsBCJqe1HJ0zzStiH6GTVray+IvgxhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDExOjM3ICswMTAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gV2VkLCBKYW4gMDgsIDIwMjUgYXQgMDQ6MzY6MTVQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBGb2xsb3dpbmcgc2VyaWVzIG9mIHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9y
IFRlZ3JhMjY0IGFuZCBIaWdoIFNwZWVkDQo+ID4gKEhTKQ0KPiA+IE1vZGUgaW4gaTJjLXRlZ3Jh
LmMgZHJpdmVyLg0KPiA+IA0KPiA+IEFraGlsIFIgKDMpOg0KPiA+IMKgIGkyYzogdGVncmE6IEFk
ZCBIUyBtb2RlIHN1cHBvcnQNCj4gPiDCoCBpMmM6IHRlZ3JhOiBBZGQgVGVncmEyNjQgc3VwcG9y
dA0KPiA+IMKgIGkyYzogdGVncmE6IEFkZCBzdXBwb3J0IGZvciBTVyBNdXRleCByZWdpc3Rlcg0K
PiA+IA0KPiA+IEthcnRpayBSYWpwdXQgKDIpOg0KPiA+IMKgIGR0LWJpbmRpbmdzOiBpMmM6IG52
aWRpYSx0ZWdyYTIwLWkyYzogRG9jdW1lbnQgVGVncmEyNjQgSTJDDQo+ID4gwqAgaTJjOiB0ZWdy
YTogRG8gbm90IGNvbmZpZ3VyZSBETUEgaWYgbm90IHN1cHBvcnRlZA0KPiANCj4gSXQnZCBwcm9i
YWJseSBtYWtlIHNlbnNlIHRvIHJlc3RydWN0dXJlIHRoaXMgc2VyaWVzIGEgbGl0dGxlIGJpdC4N
Cj4gSXQncw0KPiBjdXN0b21hcnkgdG8gaGF2ZSB0aGUgRFQgcGF0Y2ggZmlyc3QuIEl0IHdvdWxk
IHRoZW4gbWFrZSBtb3JlIHNlbnNlDQo+IHRvDQo+IGFkZCBwcmVwYXJhdG9yeSBwYXRjaGVzIGFu
ZCB0aGVuIGZvbGxvdyB0aG9zZSB1cCBieSB0aGUgVGVncmEyNjQNCj4gc3VwcG9ydA0KPiBwYXRj
aGVzLCBzbyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KPiANCj4gwqDCoMKgwqDCoMKgwqDCoGR0LWJp
bmRpbmdzOiBpMmM6IG52aWRpYSx0ZWdyYTIwLWkyYzogRG9jdW1lbnQgVGVncmEyNjQgSTJDDQo+
IMKgwqDCoMKgwqDCoMKgwqBpMmM6IHRlZ3JhOiBEbyBub3QgY29uZmlndXJlIERNQSBpZiBub3Qg
c3VwcG9ydGVkDQo+IMKgwqDCoMKgwqDCoMKgwqBpMmM6IHRlZ3JhOiBBZGQgSFMgbW9kZSBzdXBw
b3J0DQo+IMKgwqDCoMKgwqDCoMKgwqBpMmM6IHRlZ3JhOiBBZGQgc3VwcG9ydCBmb3IgU1cgTXV0
ZXggcmVnaXN0ZXINCj4gwqDCoMKgwqDCoMKgwqDCoGkyYzogdGVncmE6IEFkZCBUZWdyYTI2NCBz
dXBwb3J0DQo+IA0KPiBUaGllcnJ5DQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaGVz
IGluIHRoaXMgc2VyaWVzIFRoaWVycnkhDQpJIHdpbGwgcmUtYXJyYW5nZSB0aGlzIGFuZCBwb3N0
IGEgbmV3IHBhdGNoIHNldCBmb3IgcmV2aWV3Lg0KDQpUaGFua3MgJiBSZWdhcmRzLA0KS2FydGlr
DQo=

