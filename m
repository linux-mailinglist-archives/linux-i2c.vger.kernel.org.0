Return-Path: <linux-i2c+bounces-3037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263C8AC35A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 06:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC72281824
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 04:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEE1111AD;
	Mon, 22 Apr 2024 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HEECG7zf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103B33234;
	Mon, 22 Apr 2024 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713759013; cv=fail; b=jI2eY2+s5h4mshMIGLcMxv96hPLfEYxwsgBykhFdnuNO79rO9QKuYAxmp4orGariXHaPSbt0bprnUks2tMRIof+yrYnrWkEolfChxJwYBf6c+XwUMRcLbAr8is0HVs352IPbxJdG7KWP81UCznexI2a0mPzf/52o+CTqzQ6P0xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713759013; c=relaxed/simple;
	bh=Vy1sNHVr0Mw6vWNeBufurjeySEjssoFRjGbV2nsuwio=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pUnMH+NWuHjaI0GUcm1dBd+G4MKLhUlta+5RTniyX+IsnGalRz5Jbm8UrsQBUTSjs87Vhw/L8C/yMv0JB6nbkI5mymJdBM+SclL+DhvoRnT+wG/7Uv7HX71psYw4y+wDgPhPQApOkANUDlkXHqSQRxUqx/RvncLlkYXZ8mRaDD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HEECG7zf; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M3duRd003828;
	Mon, 22 Apr 2024 00:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=Vy1sNHVr0Mw6vWNeBufurjeySEjssoFRjGbV2nsuwio=; b=HEECG7zfkUB7
	q98WrYEU0vvSpIjiHktmPBlhB4cPI5fTscITEEDEJmaJQqnoDIOY6gPZ1k2FNQfA
	cLIptQVoBxh15OP05WUsoy7M/1dboHcRvFFxUdUmL4j3JxAy+YcuxZ36aeF3LPjn
	V3gWjZXTc3DaZgWgutQ/zbiP0VYs+yUWy26lvgNu/anPOoptk9oOKJ1mxfuHdpjZ
	Gy612oeNm3SR26k/ERrQ0YVUR5fVFNXcQqiwWlp5tuLQtu4pXV9+iED44aM1f+vo
	UgsFrML7R/FTbpLab6KlstWWha/bPaIcEwbbuR9IJxwKpjYhpFsxHAK8KA1veeXm
	WFT+6T5+TQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3xng6d82bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 00:09:55 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyTlNedtZ/mPJVfll/CqjcaEWq53WrtbRdw3MWnpqnLJHTzCBywi9L+mXXQNRrom699JYf4iOfxwPffGOxDAivuIEmRBPA4oLjsWSqJpQQ540qpMaU7yLoePHvPzrhy63GhZuVBuPZ7mf52nG9bt03IAq0FTBWNzvhNCWH4/P9QYb6n/VS2iBQTvbjh5+ZYI/qjftU55Vzr01jVDWXjB/kx9CCDfqOh5RgrtlzmbaB9vRL4vsUDti1ZhZ9+CEIqXrOXr3pSkc7ujHfv+YURZaMKeQ/jzYWXehKhhR+4L9JxgkKJRtY4hf3cFojxu7Gk2MoXaHzI6yau99OV6X88QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vy1sNHVr0Mw6vWNeBufurjeySEjssoFRjGbV2nsuwio=;
 b=ghWHuCwzB5J4LRBYT5cQ4lxnlrnK2jrmamoMDiH2OC0WClqc4lFwW8/cHcBq/mwY/P6BdG/QJyIuZkkehbt9E4NFi0axqhAdgZATidjxi4CpuP8VeOnLIx5UH18G5KiSSxo1rCgSf6zlNx3gRR+4JMycWOTXFKuAiEWw82TBIxq6E5TAnY6peSHkkkcbQdlYOEKYdMMVh6muUno/q9FPiTeZP1AJ4sy0yqWCePXK1pI+N7v++O5+ratgL2jOqJpfsIryaSYFKGw/g9mAdG7tiZX2jEV2Qxq1kL6o2i9lkbdKwmGH/8Bo0vjcfYmJsgOuWoFeS0R0QqF8GXJzZRM1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6607.namprd03.prod.outlook.com (2603:10b6:510:b8::19)
 by PH0PR03MB6266.namprd03.prod.outlook.com (2603:10b6:510:e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 04:09:52 +0000
Received: from PH0PR03MB6607.namprd03.prod.outlook.com
 ([fe80::3584:6608:a812:fa8c]) by PH0PR03MB6607.namprd03.prod.outlook.com
 ([fe80::3584:6608:a812:fa8c%5]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 04:09:51 +0000
From: "SanBuenaventura, Jose" <Jose.SanBuenaventura@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Subject: RE: [PATCH v2 0/2] Add adm1281 support
Thread-Topic: [PATCH v2 0/2] Add adm1281 support
Thread-Index: AQHalGAFIWN1AISsv0Ors6evP335XbFzoZqAgAAEnQCAAAUk0A==
Date: Mon, 22 Apr 2024 04:09:51 +0000
Message-ID: 
 <PH0PR03MB6607B80801B186F4E1ADA7F1EC122@PH0PR03MB6607.namprd03.prod.outlook.com>
References: <20240422025123.29770-1-jose.sanbuenaventura@analog.com>
 <9b95f926-b96c-4266-b292-3c3cd362905e@kernel.org>
 <2292b566-7fde-4834-a9a4-a74b14235541@roeck-us.net>
In-Reply-To: <2292b566-7fde-4834-a9a4-a74b14235541@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYW5OaGJtSjFaVzVjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB5T1RGbU56QTBNUzB3TURWbExURXhaV1l0WWpjM1pTMDBNVFUy?=
 =?utf-8?B?TkRVd01EQXdNekJjWVcxbExYUmxjM1JjTWpreFpqY3dORE10TURBMVpTMHhN?=
 =?utf-8?B?V1ZtTFdJM04yVXROREUxTmpRMU1EQXdNRE13WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXpOamMySWlCMFBTSXhNek0xT0RJek1qVTRPVGczTnpBMk9EVWlJR2c5SW10?=
 =?utf-8?B?SVRXbEpXbXhPVjJVM2VtUmFaVFZ0ZFdJeE9UaGtNa3BLWXowaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUkRsbFNHWnlZWEJVWVVGVVMwSkVlbkJ3WkN0SlMw?=
 =?utf-8?B?MXZSVkJQYld3ek5HZHZSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQmRuTkhTbXRSUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6607:EE_|PH0PR03MB6266:EE_
x-ms-office365-filtering-correlation-id: f17fb6f1-d02b-4d91-214c-08dc62820f24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OXArS3pDbWUzWG1Qa0NCK05RZnUzeWR0SmdnZC9ZS2FlOHQ2bnZ3d2FqRzQ5?=
 =?utf-8?B?QmV2MGIxSFRzblFVK3JQck1xSExDZFVHcjFJeDNPM3NicXE2cGZTT2R1QzNJ?=
 =?utf-8?B?NFRXOEk3M3creHM4bmdwRG9EelJ5Vk83a0hpNTVLWFZXejR3SEdMWXF3RW9t?=
 =?utf-8?B?b004S2wxS1YwN3FlUk1GMzFtRUl4QUdRV0wvT0hqdVhsSXNuMW5sZHoyeU9X?=
 =?utf-8?B?TTQ3MjZqRklOWS9aQXZWQk9vQngwSEROMjRERzVESWdWRDJSYjJVWVFydWo1?=
 =?utf-8?B?L0RTMWcyM0N1TU9OK1RudEd4dXVUcUJmOTBGQjVRWnZ4SlNKRjRCdzNVZ2hr?=
 =?utf-8?B?TnNUMEI3czdlNnRyRGpuUVJWMWliUFRjSlF4ODA5ZG9wYTVacE1MYjNLRWJ1?=
 =?utf-8?B?VW5La3BqNnMyTmEwMUN4LzR1ZzNycnRCd0FuSFNrbi9DWUhVRDBkZ0pSS0VX?=
 =?utf-8?B?MGhHbzQvUWcvaGltZGJJeVFrNmF3L0x2NGU2dk1aMHFIbFEwbWo2YzVUUitJ?=
 =?utf-8?B?Z0pCV05ibERPN0xIUllrZVRzM0JlcERwa05WdFhQQlJheVY2MXNtYVpLQ1NF?=
 =?utf-8?B?dXpwV0JvN3NxMWtrNGJmSTU1amMrVGJwUTU1Q2xLZ1JMT3FkTmhQQ3lzY0hX?=
 =?utf-8?B?Q2JZamp6cmZ1SEdZdVBhMThONGUrdVBCTlp6cU55YS9yZVFuSlh2eE9jUk1N?=
 =?utf-8?B?NzRYWC9BeHdKMllRNXJBREtjaDRDdi84YXAvTlJ4UEF5aXQwc2IydHMwS2J6?=
 =?utf-8?B?RmFpeUpzZ1BTTDc3SmhTMm13NWwybU0wenByU2Q5ZTdSRW5Xc2tYUEdoVmU5?=
 =?utf-8?B?Y3BEUmNWbDQ4OXplbnRFYjZKT3h4c2FZQ09VKzlKdHB2MitnQUxEbm8vcDRw?=
 =?utf-8?B?Q3hqNk14OTNVQnY4aTRwNmYzdVhPRkpLZ1lmOUpjUXpqcko5UDhLODRmL0FN?=
 =?utf-8?B?Z0c5Mm1XKy9KUFZnTGJJVEJRc3FrME55cDFjQTFubTVRaTgwOWxHanhCeThX?=
 =?utf-8?B?UXdRTmNZTVpWYkM3bnQ3TTk2ejhucXJtN3JlS3pOd2d2cml2d3VDYTlQeENr?=
 =?utf-8?B?bUpKczBOREdRUUdsT3RweVdDV0RtdnpJMGxaQ0d3dzNPMmpXU25mYTRkdW9n?=
 =?utf-8?B?L1hLRUp6RlJSK3JQZk9oVTlkdlRZeHF4N1dQaHJTM3JWM0NPNkVQZytESEhK?=
 =?utf-8?B?WTBLWFJOM0ExcVh5VXluc3ZYS2NuVjhKcTVyZWlmV2FvNTdTTnpRTU1Qem1q?=
 =?utf-8?B?SnFwd0w3RVZUc2NFNEc2a210VDVTdmRVZzZZd3hDbytYQXhVNHhIcENIYmpz?=
 =?utf-8?B?TGRkTWVRVC9wN3luSjJUUjZtcGlXbzBpdWg4M3VtYnBjalJ4SElYSkpQSUYy?=
 =?utf-8?B?MytMZjVnRG42ZCtDTkJhTDNXNnF3aHRBMEVUKzQyanhhUE13YkdXWXo4NjRj?=
 =?utf-8?B?dm5XMGlESjdkNCt0Sk5sNjF6V3AzeVNVVXlQN1RVRk5hM253aEpBckdJQ3No?=
 =?utf-8?B?Q2hKTWo2QkduYWJaNzR0cXN5cldueUIwSXVxLzB5cWM5RDNsaGNLWDAyd0VM?=
 =?utf-8?B?eldMS1JhRHJleW9WK0tyM3FKSUtQdkdQQkNXa2RRZFkwK1JaN3pDUjg4blZm?=
 =?utf-8?B?Z3pWWVhPMWM5Y0g1Q2h2VjdjK0IxVTZVQ2tNN201VXVEc3RlU2lsaFV6ZkpM?=
 =?utf-8?B?eVYwbDhGU25EbTNnZzdXREVhSWtnZExRaHRzTDkyeVJNTGMraStOUGVvY2w2?=
 =?utf-8?B?bzUzZTBBS1drTG5TdXd1eWI4N1lSYTc1TGlQcVFVeHR2UTBhVUtNL3p5aERL?=
 =?utf-8?B?V3UxeEZ0WVYwM21uckQvZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6607.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cWNVNW15dldZRDhCRnZINXZkQXMyVFNqcWdwTk5xOXdrWnByYTB2R0lGSzBT?=
 =?utf-8?B?bDhMYm9JM3F4S2lVc0FPcVVsM3ZMYnhvUGRIVTArUTRCOGJLUElDTThUTTVW?=
 =?utf-8?B?SC9Pa09leTFuMXRSMVJEWm1NMkV2UVNRa1RMNXR1VWpJb2FtbXA4WlJCRWs3?=
 =?utf-8?B?WUd6TGJyVldNYTIyMkdjYWQ3WlM4OGEzZWpZaHVETXpVaUF1ZElWNkhTTmF6?=
 =?utf-8?B?V2FrOXZEc3p3amQ3QUZsNU5OYjJ4eWp1RzlPcXB6bEtFcWZjMXpKSDVOY3pH?=
 =?utf-8?B?KytHS05aUFpDRGhLQWsxb05Uc3dlSlVqYXZEVURqSjZrY3BNMmVBYVlqeGZv?=
 =?utf-8?B?MjN2ODFjUVdzTVMzbENvd1FldzNzcHF6NzJxSDNDcTJNSXU1NmRKOW5LVDMz?=
 =?utf-8?B?NjdwZ0NxMkI5QUZEc3hSUVNXT05FTEduamJxdDVFSW80clBsWHZXN0N3MkRt?=
 =?utf-8?B?V1k3eVBBdVlRemk5NlJSSHdGWkFaWloyVmF1d1B6bm1jQTZ4ZGtkbU0rbkZ3?=
 =?utf-8?B?bEpHUjZ2Tkk5aW5jeitNZWtXTEVJUG1BOWpRYTdlRkkrY2w3YXFxcGkyRUdB?=
 =?utf-8?B?OXUvZCtSa25seVJDNGNvZ0xueTBEaVQwTjVob3dlSVMrbk50WWRRd1d2MDRN?=
 =?utf-8?B?ZGVhVFU3cnprMXZjbW5GWUJybzA4NldCVHh2TXZzYzJjSHU3UnJiZFozTmlW?=
 =?utf-8?B?YjhQajdhUVdPZW03OUxsYUNBUWc5eDJKRVQ0V1dsRWZQUStuRVViUVVOSmtu?=
 =?utf-8?B?dDNXdlcrWHJiU2JlcUp0UUNhamFWTEJtSW9DbCtzQnA1dGhVckVSbWpXQXh1?=
 =?utf-8?B?VC8xMkEzcVkwcmtuWDg2Uzd3VHhXdDdwMms2c3JVTGdHM09Da09ueFpBME5t?=
 =?utf-8?B?TlBEKzFwanQ3eFNPeUZnMFM0V0lnRmFGYmNXN2dUaFZIYmNZdDJGNTJabDVH?=
 =?utf-8?B?L2tyNjdGMUZKUW9NNi9rWWw1S3h5bkNYd0phVCtWV3lELzladzZEVmlQZDdM?=
 =?utf-8?B?OG5jbzNSRjcyWkZrUUNPcC80RE41YUZ3YWNQazJQMllNMzVHaC8yWS9sa2N6?=
 =?utf-8?B?UnQrL3BXbmxXeERNZUJRTE5DRjZiYllPemFTRWdKcWVucDdTek9WZmM1Z0VX?=
 =?utf-8?B?MENISUVmYmtHUDdsdFRwOHBYMzU1L3kzNHB5OGJza1Z5U2hmdHA3bm1ZYlM1?=
 =?utf-8?B?QmpqdkNhNlk3bFQwZXVzREVXMXdyU3B2N0VabFZ3UkhTQVNmQldYdXdlN0xZ?=
 =?utf-8?B?S3lEWktRZjdocFg4RjBocWRaeExWNUVpcHVRaVlhT2tKZTcxb1RvTGNjajRK?=
 =?utf-8?B?YU13OFhBT1dyVnRSTFIrYVhJdkRPdEs4UGxXVkJWblFKbW9wTVM0L0FVbVda?=
 =?utf-8?B?aXpBL2hzVDBCbEU1eGhGS0RBNTI0SlhNSTQxcWk2TnNHTUxldmJrQW4rMFZV?=
 =?utf-8?B?NkZzaXpWUXMwVVVSbThQakI3L0JtZ0dQVXRkWFVQR1hnSCtmRERoeVUyWUNS?=
 =?utf-8?B?V2Q4SzZFQm1TM3c3VjU2cmlqbU9qZy81SXFDS01PSm5DcHlXQmJLbE15UEFq?=
 =?utf-8?B?QXVGZnB3am9YMmJVUEZUTi9icGwzUFBGeWIweUhhSk5YUkZGYk5Pa1hOR2dD?=
 =?utf-8?B?NHhPRy91SkorRzNhaEgzV3lSTGgvd0VwT2htbHMybXJKVGxIVlRNZDhCMnhz?=
 =?utf-8?B?OG1NTUZsRnd0SGVlQWNnak9LTEVzVkx0Z2R1azJnQVdUR1gyS0FpdnkxYzdI?=
 =?utf-8?B?aFRzcm9iaW8wOEZhRURCTWtDdm1wYmVHaVpsWk53TGJaM2RadmRSU0xDTFVo?=
 =?utf-8?B?cFZnRGUySk4zRThYTE0wUVorRFZYTTQ2OWJkL1EzS2E4V2N2eEdVUDVZeHVN?=
 =?utf-8?B?TU1EVG0zdDdCQ1lucDdLUjJLVGlCb0JpOVJRTkNSc1BQWW5OdFRtTkIvS3cy?=
 =?utf-8?B?NjVOekhWOUhPb2MyVmw0ci94a1NaaU5kTUFyUWphVlZSa3llQnVaUjUxZUpB?=
 =?utf-8?B?Nkc0N0dSVTRkY2ZuelhhdXlqUXJiTFA0Q0g3akpCbVR5UWdaTS94Q2l4N3Ay?=
 =?utf-8?B?anZLVlNkZXlaNThGZHMzOWRLVmpsVFFyL0lMKy9tUUpHVlR3REgrNzFLWXR5?=
 =?utf-8?B?OUl0ZU5PbjZHbndPY1VxbG1qc0FqajA0VVdlU2FrOUpkRWV6ZVVrSm5oT2tk?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6607.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17fb6f1-d02b-4d91-214c-08dc62820f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 04:09:51.8746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhE8VwgdDUNm05XH7/MOqu5x/hG5+RpUEsUMTAtFZoHZ3mBlqFLGpTbzhCcEDxx3+c1dQXkuT1tHVZCIrDJgfx37owWVBRIx/iaipGTcRAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6266
X-Proofpoint-ORIG-GUID: KM6KH5k3G61eMjWL_WkmkT3h4RznMoQq
X-Proofpoint-GUID: KM6KH5k3G61eMjWL_WkmkT3h4RznMoQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_01,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220018

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogTW9uZGF5
LCBBcHJpbCAyMiwgMjAyNCAxMTo0NSBBTQ0KPiBUbzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPjsgU2FuQnVlbmF2ZW50dXJhLCBKb3NlDQo+IDxKb3NlLlNhbkJ1ZW5hdmVu
dHVyYUBhbmFsb2cuY29tPjsgbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
DQo+IGRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6
IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5jb20+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29u
b3IgRG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgSm9uYXRoYW4gQ29yYmV0IDxjb3Ji
ZXRAbHduLm5ldD47IERlbHBoaW5lIENDDQo+IENoaXUgPERlbHBoaW5lX0NDX0NoaXVAV2l3eW5u
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIEFkZCBhZG0xMjgxIHN1cHBvcnQN
Cj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDQvMjEvMjQgMjA6MjgsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6DQo+ID4gT24gMjIvMDQvMjAyNCAwNDo1MSwgSm9zZSBSYW1vbiBTYW4gQnVl
bmF2ZW50dXJhIHdyb3RlOg0KPiA+PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIGV4dHJhIGNhc2Ug
YWRkZWQgaW4gdGhlIGFkbTEyNzVfcmVhZF9ieXRlX2RhdGENCj4gPj4gZm9yIFNUQVRVU19DTUwg
cmVhZHMuIFVwb24gY2hlY2tpbmcsIHRoZSByZWFkcyBmb3IgdGhlIFNUQVRVU19DTUwNCj4gPj4g
cmVnaXN0ZXIgaXMgYWxyZWFkeSBoYW5kbGVkIGluIHRoZSBwbWJ1c19jb3JlLg0KPiA+Pg0KPiA+
PiBJdCB3YXMgYWxzbyBjbGFyaWZpZWQgYW5kIGFncmVlZCB1cG9uIHRoYXQgYW55IG90aGVyIGFj
dGlvbmFibGUgc3RlcHMNCj4gPj4gaW52b2x2aW5nIHRoZSBTVEFUVVNfQ01MIGVycm9yIGZsYWdz
IHNob3VsZCBiZSBhZGRlZCBpbiB0aGUNCj4gPj4gcG1idXNfY29yZSBhbmQgbm90IG9uIHRoZSBz
cGVjaWZpYyBjaGlwIGRyaXZlci4NCj4gPj4NCj4gPg0KPiA+IFdoZXJlIGlzIHRoZSBjaGFuZ2Vs
b2c/IEl0J3MgdjIsIHNvIHdoYXQgaGFwcGVuZWQgaGVyZT8NCj4gPg0KPiANCj4gU2FtZSBxdWVz
dGlvbi4NCj4gDQo+IEd1ZW50ZXINCj4gDQoNCkhlbGxvLA0KDQpUaGUgb25seSBjaGFuZ2UgZnJv
bSB2MSB0byB2MiBpcyB0aGUgcmVtb3ZhbCBvZiB0aGUgYWRkaXRpb25hbCBjYXNlDQpmb3IgU1RB
VFVTX0NNTCBpbiB0aGUgYWRtMTI3NV9yZWFkX2J5dGVfZGF0YSBmdW5jdGlvbiBpbiB0aGUgYWRt
MTI3NS5jDQpkcml2ZXIgY29kZS4gTm8gY2hhbmdlcyB3ZXJlIGRvbmUgaW4gdGhlIG90aGVyIGZp
bGVzLCBvbmx5IGluIHRoZSBkcml2ZXIgY29kZS4NCg0KSSBhcG9sb2dpemUgZm9yIHRoZSBjb25m
dXNpb24uDQoNCkZvciBjbGFyaWZpY2F0aW9uLCBkbyBJIG5lZWQgdG8gcmVzZW5kIHRoZSBwYXRj
aGVzIGFuZCBpbmNsdWRlIGEgY2hhbmdlbG9nDQppbiB0aGUgcGF0Y2ggdGhhdCBzcGVjaWZpZXMg
dGhlIGNoYW5nZXMgZG9uZSBpLmUuLCB2MSAtPiB2MjogcmVtb3ZlZCBjYXNlPw0KDQpKb3JhbQ0K

