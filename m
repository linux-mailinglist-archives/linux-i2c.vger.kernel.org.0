Return-Path: <linux-i2c+bounces-7950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F29C68E1
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 06:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 160752837B9
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 05:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45FD1714CB;
	Wed, 13 Nov 2024 05:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xq8bpENK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01C02309AE;
	Wed, 13 Nov 2024 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731476772; cv=fail; b=Vy+qF7E9+j3rz/4McogBBcPT+i8KRUDW67N1dQ6CPopclxbk0TFUVgokOMKZfT19f0zx0lZyduyqHy93AUPgDN6JOH7nrQ21QXLz+trE3FGVoOCNFOXJqsUsgi1aGvf354Iwb0zy20gPaA03FGIr2IgB7wZCML3G+lInzslwXvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731476772; c=relaxed/simple;
	bh=wvfwHf9RJEd0X6HJ/K24+bWW9JPgCNdue85a0tJu0zk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MDspjLmvb3syx4Heb7vHjXClqLxcHou0NOvyqDmY3sq24IxE83YuJbFdcvknLhvYbW/X+WX5Fvz6OHWxE7a1/+Xau/grhHebU4XFivOjKpB0VwUCqXYswgw8sZHXBSW21ajZftYwHBLV1KVtLZNseODeoqjywniHe8h+iI08H6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xq8bpENK; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD3Ne3B000821;
	Wed, 13 Nov 2024 00:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wvfwH
	f9RJEd0X6HJ/K24+bWW9JPgCNdue85a0tJu0zk=; b=xq8bpENK5Sc/vOYJ39bXe
	PqQlDVGxp0HzTOPobjVmoaSGeeZ2yiVOu4BaMETh6DAWUngWXfvMfY4Vhc6Wk0Ha
	Uh/6PAd8UIn9XPb5W8bMcl64BRYgcIMxXsumBr60AEdjyGtcHWUNNnDEfGfQVgnE
	Rymf0nrDR8BTGqP7nZw5TiGZPy2c++AL5YVOj6FI784ghPkmNDX+FnJNHd/a/lg/
	OEa4JLAyUL/+MbBO+jgX7/Uxx+tI6BYl+58TM8gl/g2yo/7pMEmVBvlEtd35XIip
	Jig0Yil589GYNdCl20KCVUyvfY8ujpPbSjNljc5Yt4g+DHAYVmGJowRFs/5sKYuf
	w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42v48j5a8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 00:45:36 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHL1ggphi9RWvxXIipJmmFrx3UKagJIqVEw+k36ryG6qx0Sax9wQpc7jxO91IcpkY0JBPvgpccEbBThvb2RYp0sr77UJj/gFRFlPEfXn4f/6HkI5fVlciYR4vbAvsgLwUlphWJulsKZDqVlM5ZnFXByCoDhYTZuQjy/tDW8nNBu26jGm9J4qQnXWtwxH0d5O0G9q8jp7YxwC6G3Xss47gtNXQxJ7hAbnssUqNxrQb8eCqhW+mAK3mplaXyhJJaRQCsllc9jQjVnWN2eI80F5fINnVFXt8j2NHf0QpXnOimimfEyNlvjxQwopCoaR3l43KLAguEjciP4y79z2N6haFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvfwHf9RJEd0X6HJ/K24+bWW9JPgCNdue85a0tJu0zk=;
 b=Qe9E9rbXgjqvguEjV2vphs3mgDk6sHaoDMhzfl9JLlivs4uf3pXlMwuEic/CjNrXS1cosZC+Cb5G1EjSmhmEHzWVzuY+D3FCXPU2h/tXeL+XWakUWMjSschuUxiafG+kZ+ZGaQ3q6MZtQM4PM4fywoYotLvXcZCfAr+cJjjPqpfVdhQGpNV/ggZjY0XohZLAyCMAhiC90UzJmAB5dkF3KHPVlbQj0WpvJO3EzbWgnO9s5OMtewyHEneTMZnAjJuYQkNrlWfoNotKcIw7CkdlclQh/2QfgYslVKuLvSmdWq40PvK2Z8Dg7UvsNQYWMP5UZHJnGhsY4NNq3BH8236LTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by PH0PR03MB5733.namprd03.prod.outlook.com (2603:10b6:510:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 05:45:31 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 05:45:30 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Peter Yin <peteryin.openbmc@gmail.com>,
        Noah Wang
	<noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
        Lukas Wunner
	<lukas@wunner.de>
Subject: RE: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
 ltp8800-4a, and ltp8800-2
Thread-Topic: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
 ltp8800-4a, and ltp8800-2
Thread-Index: AQHbL/lfH4HqsXF5fUulgDo4VShnB7KrDXcAgAHo9YCAAH9ZAIAHSIWQ
Date: Wed, 13 Nov 2024 05:45:30 +0000
Message-ID:
 <PH0PR03MB69387FA17AE40D62115E29B88E5A2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
 <697a9596-f5aa-48d0-ad26-ebe06b831ee8@roeck-us.net>
 <PH0PR03MB693869F52D961845C8388D258E5D2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <c6b1718a-1a16-4670-b9b6-d8d9bebad4f0@roeck-us.net>
In-Reply-To: <c6b1718a-1a16-4670-b9b6-d8d9bebad4f0@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWTJWdVkyRnlibUZjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAzWXpka1pUTXhaUzFoTVRneUxURXhaV1l0T1RNMllpMHdOR1U0?=
 =?utf-8?B?WWprM01EYzFNemRjWVcxbExYUmxjM1JjTjJNM1pHVXpNakF0WVRFNE1pMHhN?=
 =?utf-8?B?V1ZtTFRrek5tSXRNRFJsT0dJNU56QTNOVE0zWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STROVEEySWlCMFBTSXhNek0zTlRrMU1ETXlPRGd5T0RVNE1Ea2lJR2c5SW10?=
 =?utf-8?B?T04zTTBXa1p4VVV3ME0yZFFVRkpzUm1GWWNXSXpWREkxV1QwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUW5oMWRGRXJhbnBZWWtGVlRXSkpZMlZvVUhKT2Ex?=
 =?utf-8?B?RjRjMmg0TmtVcmN6SlJSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQlpuQjVZMWRuUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
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
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|PH0PR03MB5733:EE_
x-ms-office365-filtering-correlation-id: 0e54adfc-3839-46f8-ff20-08dd03a66274
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ejBjK2Z1cDNEVnFoeC9pbEswNFFVM0RrLzZtUkYvVkRXRXRRUzFVdk5ScDBF?=
 =?utf-8?B?MGw4c2NCTmpocXlPeDMvSTNnU2d1R0RnQ3N0eVlINjErQ2dXTVkvZHhYTWp0?=
 =?utf-8?B?bStQTk5JZXdyMjhDZnA3Y01uYU1DNU1WSXhZRlJZY1dzY24weEcwM1hIdVJm?=
 =?utf-8?B?dVJWRXYvYURybmJNRGllbkJSK29MMzd5K3h0Wmh1SDhGMzVESzFDVjEwMzcw?=
 =?utf-8?B?OTlwNzhkckNqKzQxOFRaSnNNWitMaHFUZ3RJdWlnQldvMDV1OExUS3pPaGlG?=
 =?utf-8?B?SXAzN0JXWHZqM1VVc3F1Rm1tU1hIb1FyTmFObnF4Ymt4aUZMRHhqWFZWQWY0?=
 =?utf-8?B?Um5hYzdFbllVQ0FtR0tTckZDQ2dxT2h2ekplMUxYNEtSZ2tEbmJiTUFKc0w0?=
 =?utf-8?B?QXFqc2dGUmtSMFBlZFZQa1N6Y2JzVk1CWU9BUFdRU3d2M0N1R2V1NFZHNWR5?=
 =?utf-8?B?dXRiSGVFQjNJZnB5TXloM01PaTUzOW16aFQvUGJJM0FrQnBWdHBIT0Rteitn?=
 =?utf-8?B?RHprcXlTUEZWN0hHa3RTYTRJdEJLN1o4dFpnSTFDSysyVXpPRjZWMStkRGJk?=
 =?utf-8?B?UHlnVzhrVndJWEpDOUZ5T2lGVVpGRkNqcy9EempycTd2MzNGN0h4Nmt0K2FY?=
 =?utf-8?B?L1YzSXdnWnM1T3ZZVzNDQmtlNHlNeXJJVEpuMDJNVlJWYzErQmgrRkxWaXcv?=
 =?utf-8?B?dnUyMktzVkkrTXpPSmgrS20ySkN6M2JQWU05RVIrMER0SGNma0dNT0NWK0ZH?=
 =?utf-8?B?ZFZXOWovZE1WVmM5TWlKKytKQ1Jvb3dGNmlXTkhFakR2NE5wZHBLTWdtQk9m?=
 =?utf-8?B?bzNsckVMT3FERFNIS09XRWRUdlJKbWhieUJwNFFiWDU2MkduQjFDOFZNNk50?=
 =?utf-8?B?ZkVBZWNjNko2VmlGZjdvL2JXRjVmWXU2MTN6dmI2MDl5U2lsVzBub0ptcXNK?=
 =?utf-8?B?OHRFSE5hK0RVU3doZEh1YU0wY2tkYjBGL0Q5SVFFT0VLMzNsUHBXdmNRSHZp?=
 =?utf-8?B?TmhKUU9FSHRSdkVrd2MxTXF5Ymp1cFUxWllCYWZzS3orNXVqQU8xWjcrMWZk?=
 =?utf-8?B?T1JxQm5ENktOWVYxWEZZd09MaE42MUJBSlQxKzFLbWw5TDZCd3dKQXVab1I0?=
 =?utf-8?B?bS9jZmg2NG42QnpDbTZ0RjZKbGsva3J2WjVKdEI0alh0TkdXQ3NLSkRMTzll?=
 =?utf-8?B?L213NlhaR3p4cHpJMFd2Y0lHcy9SLzZ3YWpabEZrcVI5S2NtUnZiUlEyLzlv?=
 =?utf-8?B?K2ZrazA1Um1xajBjWHBPbWV6c3ZvUXdxNzE5T1VyV0JrbmdJODl5cGFlMkUr?=
 =?utf-8?B?cXhzamR4cUtmMmM3REJLMlY0Y2FCbUxVN2FUZjU4WWZvdm9DOFc3TXdFME44?=
 =?utf-8?B?cHpmQkxxL0hYVUoxc2lFQWFjYlV1Yk0zMC9aS0NDVlB5MEs5NFdHN2ZLVy8x?=
 =?utf-8?B?cDRyZ21iaXIrcWM5RTJTMEdsQklsUVNMS3M2S1ZxdDNxZEFLRm9WMFp3bW9k?=
 =?utf-8?B?M3NNRE9RaTRabVNyY0pRS1hpblVSU3YzSzVxZ1dmdzc3eDJBMlRmQytJU0F5?=
 =?utf-8?B?dXk3OTNUeCthaThzUUZtMXVlNHRTUFRZNGN1bFFPaTV5dHNCaS9uYmNPMXhr?=
 =?utf-8?B?WUo3cUVMZ3FkYVJaM2w1UTQ4dzhpeE04U3Y1TWNDUC9zTHI1UDNVenRjZXRv?=
 =?utf-8?B?b0xFc1ZxblZ1aEZqOXpVLytCOHJwdGZ6bm9pdThHS3hzSno2a0IvR1NQbTVv?=
 =?utf-8?B?Kzl4OXc3eDZnbjBKcVNZMTc2YUpPcm1VaG10V3BLV2UwRS8vZXlVaUl1Nlor?=
 =?utf-8?Q?pbcnq8dHZ+f8k/4V17E/Kav1z+xgcRx0xp+J0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q09sNU1Ca010MlBuTU1LeWJ0ZlJlZDdCaUZxREFPakg3Skt6VE4vM1BCNzlC?=
 =?utf-8?B?dDJjZEZraVBTcFpHK0pIVGJaSmpSTGQ3dzdNdlhkVDJzVmlwazZWYUlZNDNm?=
 =?utf-8?B?WXJ0MHlLZ0RoT3djU1ppdW16a2lxd0N5U3E3Z0pYMkU2K2FkMjc3TXNvb2Nl?=
 =?utf-8?B?bnVRaUd2SnJaVWQyZVJXM3hVcXdpQWZuNWlVYUpXcTVKSXdNa3hGMlhmbWk2?=
 =?utf-8?B?bWg4ZlBCK1M0MlEySzM5L0ppdTNSTHR0Z1BYSEZXank5bGh6NmZPS2ljRWlH?=
 =?utf-8?B?TVFubTRtQ0xyaStwYXJ0eGhwaWtCZ25Ed2xvUUE4aFM0ZkpzMmRlR3plMjYv?=
 =?utf-8?B?RjQvM3RxYjkreitjdzEydU9BSDZ0akVPeWltZVArVjk2cHc0dWFrdW1kWVZJ?=
 =?utf-8?B?b0t1ZFRCVlFSSm5hNXZtSEZ5aXl3RlB2alVRZ2dMQlZ2c2wzb01QR0kxa2J0?=
 =?utf-8?B?dFBEQzhhS0h6dCtpNUJKWlVpNGNRM3pIU0JmRkpJcVFrTjc1dDVFSEdPVEkv?=
 =?utf-8?B?ODY4N1EwbHZxTHBaaG9qd1JiTlo4OHp0dVhqWWVJS2htcTRIN1pDbzhlVDh1?=
 =?utf-8?B?TXNmemErNk5qRHVMdFlmRzRCaS9qYkhLZFZ5ZHNqRWlOMUFsQnB0bnNLblRi?=
 =?utf-8?B?QmY3ZEx4Y25GNmpKc09yNVNaV09QeHY2czhtL3QrK1oxM014TC9td2JwdVZi?=
 =?utf-8?B?R29xcjhGczZYUk15ck1ydWsrSjJ5a1BKTld1OTYraGlPcU1YOEluTDQ5OXVJ?=
 =?utf-8?B?OVlCZmh2OGRJcUNXMzdSaEd1eXgwb081dmNGdXZnQVVvRkhpSEsvWmRaZzc5?=
 =?utf-8?B?TXVCTm5SRUFwbmFnbW5zUWxKNCt4ejBNSEJlNUt6dHBpRVNORTV1d3NmWHRN?=
 =?utf-8?B?ZVdHcWNJaHJMSlh4WTdtREh6WFh0ODdrcHVGdGtuM09MZllCWURQdFE0N0g3?=
 =?utf-8?B?TWZvOXdwd3NKN0VxWjl3TWJRZndhaTlzL1hrdXUvaDl2aUs0QVIzcWFiUE51?=
 =?utf-8?B?L0tOcEFhM29iektGRjZEUlBKVG5OaWlUc2E3cGVjQlA1cHF5c09kSFMvaDJI?=
 =?utf-8?B?ejliNmZVa3BGZlF1UkZyZXplZWc5WllQTWo4eTBHMWFjUmlPRFY1MGZLOVRQ?=
 =?utf-8?B?UitKWFRvVG1wR29OMWQ5allNVmZJS3BoUVMxbGQ0QUYvalRDWDNCU2dGQ01G?=
 =?utf-8?B?cFJRY2lHWWd1M0lVblF1K3ZlTVF2UHJZdDFzdHYrdnhZS3RMRXBGc0FDdC9X?=
 =?utf-8?B?V0VWSnVwL0duVURkSmVycEVvYjlwVGhiejlrS2lUZDhYSVRjMUd1YWk5eFVF?=
 =?utf-8?B?UUlMTThuUGRDbm93cUtjand5V1ZHYVdGTUo5MUp4RVVLRTN0NEVnYk9pR1ps?=
 =?utf-8?B?M0dQSVhRbVdwMTdzL0FRQU1mV0tsMjhQSzUrV3U5L1pZSEVDNDBrU2lwdWw1?=
 =?utf-8?B?d1hJZ1B4OExKa0JHUzRrS3NiUXFEbzdpRXhBbzZyTnRGRTRqZG9Ubm8xTU15?=
 =?utf-8?B?NnpGMmZIbDdSV20vNE5lRXo5VExJV0djQ3dIc1VNSjJMdEpCSUpHWXRHWWtD?=
 =?utf-8?B?ODAxN0oyYmdmZzZlaHJudGRmdU1LNVFFZ2tpR3NmNkdTcW5RTVdKdCtoSWE1?=
 =?utf-8?B?WmlaY1NVamJSV04wSHhSeGZvTFVwamhtQzZWTjgzVlF2OVhuQ1U0TlpOKytO?=
 =?utf-8?B?VHJuaEx0LzNWbEVNYnZkUDEwckxqT0hPQmwvMlZXdjZRU3ozZ0RNd3BTT2Fa?=
 =?utf-8?B?VHMvWG04TCtYTkh5Ymc1N3lkalh6eDcveWdwUzRMYUxqR1gyajJheTZqc2hZ?=
 =?utf-8?B?bVVwb1VSZ0JYY0hqQ2xKSTcrbVN1VTFPSTlrbnFZT011bmh2eWRoUytjWlF1?=
 =?utf-8?B?NStuNHpJQ25vSGRZMElQNzlaOThlc015bTZldlZBcDF0bm16aWdpRlBMWTJG?=
 =?utf-8?B?OWRyU2xHbk1IRmM2dkc3Q1NPMVNKbjRxOGhoRm45T0xqb3JBT1ZhcUgzTFRI?=
 =?utf-8?B?OVMxTUhEWGtnU3dPMTJKWnY1dXdnakFjMk9oZXF5UjM3L1gvbXdSbDhHeUpY?=
 =?utf-8?B?dnFKbSt4TVd5aUFlMEtFVE1uaDc5dUZ0KzJFVU53YUFpRWtYQUszSFRBOXNX?=
 =?utf-8?B?TGV2L1VDNXE0b3JTZm5qYWRGTmR0UndTbCtrazFjU3hvODdHMVRFUkdFSlQ5?=
 =?utf-8?Q?SHSwQMGRGDhShal5B16IRyg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6938.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e54adfc-3839-46f8-ff20-08dd03a66274
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 05:45:30.7329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SIYIG4AQlgNgz0FhaSg9Txfr3ZVEQH9Fl9vNqAfH1cHxxyunE+bNMbnshI+NEYj02EB4tUR6ExR/eJqCJamMN8xUMOOifNc4QwHr13BpRGiCgACUD5AbTOR3BvbT6MZf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5733
X-Proofpoint-GUID: Kyrj8DteOAfZKEXO0vkGsptddneSWagB
X-Proofpoint-ORIG-GUID: Kyrj8DteOAfZKEXO0vkGsptddneSWagB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130050

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogRnJpZGF5
LCBOb3ZlbWJlciA4LCAyMDI0IDEwOjMxIFBNDQo+IFRvOiBFbmNhcm5hY2lvbiwgQ2VkcmljIGp1
c3RpbmUgPENlZHJpY2p1c3RpbmUuRW5jYXJuYWNpb25AYW5hbG9nLmNvbT47DQo+IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0N
Cj4gaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtZG9jQHZnZXIua2VybmVsLm9yZzsgbGludXgt
aHdtb25Admdlci5rZXJuZWwub3JnDQo+IENjOiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2Uu
Y29tPjsgSm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47DQo+IERlbHBoaW5lIENDIENo
aXUgPERlbHBoaW5lX0NDX0NoaXVAV2l3eW5uLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBQZXRlciBZaW4gPHBldGVyeWluLm9w
ZW5ibWNAZ21haWwuY29tPjsgTm9haA0KPiBXYW5nIDxub2Fod2FuZy53YW5nQG91dGxvb2suY29t
PjsgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBMdWthcw0KPiBXdW5uZXIgPGx1a2FzQHd1
bm5lci5kZT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGh3bW9uOiBwbWJ1czogYWRk
IGRyaXZlciBmb3IgbHRwODgwMC0xYSwgbHRwODgwMC0NCj4gNGEsIGFuZCBsdHA4ODAwLTINCj4g
DQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDExLzcvMjQgMjM6NDQsIEVuY2FybmFjaW9uLCBDZWRy
aWMganVzdGluZSB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVu
dGVyIFJvZWNrDQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA3LCAyMDI0IDk6NDUgQU0N
Cj4gPj4gVG86IEVuY2FybmFjaW9uLCBDZWRyaWMganVzdGluZSA8Q2VkcmljanVzdGluZS5FbmNh
cm5hY2lvbkBhbmFsb2cuY29tPjsNCj4gPj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiA+PiBpMmNAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gPj4gaHdtb25Admdlci5r
ZXJuZWwub3JnDQo+ID4+IENjOiBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPjsgSm9u
YXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47DQo+ID4+IERlbHBoaW5lIENDIENoaXUgPERl
bHBoaW5lX0NDX0NoaXVAV2l3eW5uLmNvbT47IFJvYiBIZXJyaW5nDQo+ID4+IDxyb2JoQGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vcg0K
PiBEb29sZXkNCj4gPj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBQZXRlciBZaW4gPHBldGVyeWlu
Lm9wZW5ibWNAZ21haWwuY29tPjsgTm9haA0KPiA+PiBXYW5nIDxub2Fod2FuZy53YW5nQG91dGxv
b2suY29tPjsgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ow0KPiA+PiBMdWthcyBXdW5uZXIg
PGx1a2FzQHd1bm5lci5kZT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGh3bW9u
OiBwbWJ1czogYWRkIGRyaXZlciBmb3IgbHRwODgwMC0xYSwNCj4gPj4gbHRwODgwMC00YSwgYW5k
IGx0cDg4MDAtMg0KPiA+Pg0KPiA+PiBbRXh0ZXJuYWxdDQo+ID4+DQo+ID4+IE9uIDExLzUvMjQg
MTk6MDksIENlZHJpYyBFbmNhcm5hY2lvbiB3cm90ZToNCj4gPj4+IExUUDg4MDAtMUEgNTRWLCAx
NTBBIERDL0RDIMK1TW9kdWxlIFJlZ3VsYXRvciB3aXRoIFBNQnVzIEludGVyZmFjZQ0KPiA+Pj4g
TFRQODgwMC00QSA1NFYsIDIwMEEgREMvREMgwrVNb2R1bGUgUmVndWxhdG9yIHdpdGggUE1CdXMg
SW50ZXJmYWNlDQo+ID4+PiBMVFA4ODAwLTIgNTRWLCAxMzVBIERDL0RDIM68TW9kdWxlIFJlZ3Vs
YXRvciB3aXRoIFBNQnVzIEludGVyZmFjZQ0KPiA+Pj4NCj4gPj4+IFRoZSBMVFA4ODAwIGlzIGEg
ZmFtaWx5IG9mIHN0ZXAtZG93biDOvE1vZHVsZSByZWd1bGF0b3JzIHRoYXQgcHJvdmlkZXMNCj4g
Pj4+IG1pY3JvcHJvY2Vzc29yIGNvcmUgdm9sdGFnZSBmcm9tIDU0ViBwb3dlciBkaXN0cmlidXRp
b24gYXJjaGl0ZWN0dXJlLiBJdA0KPiA+Pj4gZmVhdHVyZXMgdGVsZW1ldHJ5IG1vbml0b3Jpbmcg
b2YgaW5wdXQvb3V0cHV0IHZvbHRhZ2UsIGlucHV0IGN1cnJlbnQsDQo+ID4+PiBvdXRwdXQgcG93
ZXIsIGFuZCB0ZW1wZXJhdHVyZSBvdmVyIFBNQnVzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYt
Ynk6IENlZHJpYyBFbmNhcm5hY2lvbg0KPiA8Y2VkcmljanVzdGluZS5lbmNhcm5hY2lvbkBhbmFs
b2cuY29tPg0KPiA+Pg0KPiA+PiBMb29raW5nIGNsb3NlciBpbnRvIHRoZSBkYXRhc2hlZXRzLCBJ
IGZvdW5kIHRoYXQgdGhlIFBNQnVzIGNvbW1hbmRzIGFyZQ0KPiA+PiBpZGVudGljYWwNCj4gPj4g
dG8gdGhvc2Ugb2YgQURQMTA1NSwgYW5kIGFuIGV4dGVuc2lvbiBvZiB0aGUgQURQMTA1MCBkcml2
ZXIgdG8gc3VwcG9ydA0KPiA+PiBBRFAxMDU1DQo+ID4+IGhhcyBiZWVuIHN1Ym1pdHRlZC4NCj4g
Pj4NCj4gPj4gV2l0aCB0aGlzIGluIG1pbmQsIHBsZWFzZSBleHBsYWluIHdoeSB0aGlzIHNlcmll
cyB3YXJyYW50cyBhIG5ldyBkcml2ZXIgaW5zdGVhZA0KPiA+PiBvZiBqdXN0IGV4dGVuZGluZyB0
aGUgZXhpc3RpbmcgZHJpdmVyIHRvIHN1cHBvcnQgTFRQODgwMC4NCj4gPg0KPiA+IEl0IGFsc28g
YXBwZWFycyB0aGF0IHRoZSBMVFA4ODAwLTFBIHJlZ3VsYXRvciBtYWtlcyB1c2Ugb2YNCj4gPiBm
YWN0b3J5LXByb2dyYW1tZWQgQURQMTA1NSBidXQgdGhpcyBpcyBub3QgZXhwbGljaXRseSBzdGF0
ZWQgZm9yIG90aGVyDQo+ID4gdmFyaWFudHMuIEluaXRpYWxseSwgSSB0aG91Z2h0IGEgbmV3IGNs
aWVudCBkcml2ZXIgd291bGQgYmUgcmVhc29uYWJsZQ0KPiA+IHNpbmNlIHRoaXMgZGV2aWNlIGlz
IGludGVuZGVkIGFzIGEgcmVndWxhdG9yIHdoaWxlIEFEUDEwNTAvQURQMTA1NSBpcyBhDQo+ID4g
bW9yZSBjdXN0b21pemFibGUgZGlnaXRhbCBjb250cm9sbGVyLCBhbmQgYm90aCBoYXZlIHRoZWly
IG93biBtdWx0aXBsZQ0KPiANCj4gV2UgdXNlIHRoZSBzYW1lIGRyaXZlciBmb3IgbWFueSB2YXJp
YW50cyBvZiBsdGMyOTc4LiBXZSBzaG91bGQgZG8gdGhlIHNhbWUNCj4gaGVyZS4NCj4gDQo+ID4g
dmFyaWFudHMuIEluZGVlZCwgaXQgbWF5IGJlIG1vcmUgcmVhc29uYWJsZSB0byBleHRlbmQgZXhp
c3RpbmcgZHJpdmVyIHNpbmNlDQo+ID4gdGhleSBhcmUgZXhwb3NpbmcgdGhlIHNhbWUgZmVhdHVy
ZS4gSW4gdGhpcyBjYXNlLCBjYW4gdGhpcyBiZSBkb25lIGluDQo+ID4gc3VjY2VlZGluZyB2ZXJz
aW9uL3Mgb2YgdGhpcyBzZXJpZXM/DQo+ID4NCj4gDQo+IFN1Y2NlZWRpbmcgdmVyc2lvbiwgYnV0
IHBsZWFzZSBzeW5jaHJvbml6ZSB3aXRoIHRoZSBlbmdpbmVlciBhZGRpbmcgc3VwcG9ydA0KPiBm
b3IgYWRwMTA1NSB0byB0aGUgYWRwMTA1MCBkcml2ZXIuIEFub3RoZXIgb3B0aW9uIHdvdWxkIGJl
IHRvIG1ha2UgYWRkaW5nDQo+IHN1cHBvcnQNCj4gZm9yIGFkcDEwNTEvYWRwMTA1NSBhbmQgYWRk
aW5nIHN1cHBvcnQgZm9yIGx0cDg4MFggY2hpcHMgYSBwYXRjaCBzZXJpZXMuIFRoZQ0KPiBpbnRy
b2R1Y3RvcnkgcGF0Y2ggY291bGQgdGhlbiByZWZlcmVuY2UgdGhlIG9yaWdpbmFsIHBhdGNoIHNl
cmllcy4NCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KDQpJIGNvb3JkaW5hdGVkIHdpdGggdGhl
IGVuZ2luZWVyIGFkZGluZyBzdXBwb3J0IGZvciBBRFAxMDUxL0FEUDEwNTUuIFdlIHdpbGwNCmJl
IHN1Ym1pdHRpbmcgYSBuZXcgcGF0Y2ggc2VyaWVzIGFkZGluZyBzdXBwb3J0IGZvciBBRFAxMDUx
LCBBRFAxMDU1IGFuZA0KTFRQODgwMC1YWCB3aXRoIHJlZmVyZW5jZSB0byB0aGUgb3JpZ2luYWwg
cGF0Y2ggc2VyaWVzLg0KDQpSZWdhcmRzLA0KQ2VkcmljDQo=

