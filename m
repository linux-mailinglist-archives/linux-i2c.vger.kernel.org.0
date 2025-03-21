Return-Path: <linux-i2c+bounces-9972-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D661CA6C0A9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 17:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21A763B36CD
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 16:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C7922D4F3;
	Fri, 21 Mar 2025 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="EWwDTwq9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2096733F6;
	Fri, 21 Mar 2025 16:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742576049; cv=fail; b=pvWHNtyJ1VsbFug7pscSm0JfOlNnje2zo88PwRtMMmP17w5agzMMgwtvcLXX5Lzr2yLQvFS6b9tDYCueJD9tCWRIpuY3G55EhGXcQJ6EYpRo+8TNqWdwAsfHcYCMsHQA6bc8zISp4rZYSgWaeHg5DQ3smM3ZgIQaL5e/vHHqM14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742576049; c=relaxed/simple;
	bh=4O53E+s5kdJabUwrxynY3yVvmQt0Z6szMyWmeK12MD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EZdwiNSo9GI0oosyCEMcPfj4EhIRRO6KeUUgJtlPFD8xck13VP0CoNxE8nw0LkHuyH+h6AZQMaO6oFTBnlgKZeOUKiRbYCbLrcwpEy5y7ASM/cIBqU9D9U3Z5qFUGid7HuYvk3/iF8az00unmW87mbazTDCJoLnEalW5Ijrnr2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=EWwDTwq9; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LGDkqg030651;
	Fri, 21 Mar 2025 12:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4O53E
	+s5kdJabUwrxynY3yVvmQt0Z6szMyWmeK12MD0=; b=EWwDTwq9IUcNHm5EPJvbr
	zjiq81DqSqpfetKXIVrfJSZ1yj78G4DPN8XtqJoSJY507KQ/ANLPsxulmm+H9NYb
	sfKrfSzYq7u7xpm0D85xgL2jzMLULn8IH708ARVgX/V/fcO9JvxOJ7O3M55pIst1
	j0dgfcrOk3tFWyp4hgvZW5Dy9xDjQJSM41H1T/KC6WZyZZMeoP7XSkviSBoEyTLz
	cANNGJH4RXfcXlhKWvO9fUdYvU9yD1BgFcHDLbD5TWzWmRroZRsSgOTQRyvLGCs4
	f5/qpok4XyVlPdv0Bk3bGYZHlX+7Zdr0tQOQqbxWGEKBlBACVbHDJv2i5a2wPdFQ
	g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013058.outbound.protection.outlook.com [40.93.20.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45fwvmwyrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:53:51 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vO8mFnQKsO9gWRCzzJWId1kiBAqeIPGN4DCcPV0j+uZMEpqrOKnpzM3yQRfc3EWI9KjzhX+vy6rKi+WClF0OYlhhiIDr9hg+ONOP31dqXhJ88Dt4xf1UfNxIrIA2zoNN79t6VlS4DjhbzbYADq6/XM9VXiGEuy0/3F2pnIfoldqP9oeT0Fhz+CKzhYmu+RkYhZQ9p/i3DnYvdNu4UtEd+9qnkwTIWTbqZCnE3yPXJ0RjrYZ3ZIx/nPoX1uW6TTP1XQjBtvZQEto5wzl9wJjzLtcCVjZJ4lz4J43p6wFzjdCL7HADifPtVknWFoNT1FnZjPXMuP2HLDkXuuE1v9geVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4O53E+s5kdJabUwrxynY3yVvmQt0Z6szMyWmeK12MD0=;
 b=jcFXAILWACQWcfQOeRoIZUPEpZZt+HAjEfto4RhHi1asbg2IeuMf9N6EEbjrRKyQvV69gxDpwwfHBdQwnOHm2xTqCn7v5GLaQj8EwMVDQdzyfhp6WM3eb9WLnd4rU6V8Zpnxpxj5MJ2d1rK5fjqqXFPK+mwjUsilbSoVzVEOgd3+Vqt2l0opz7Rb+1lUBOeX54+yQXiikHXg2Dh1hJ7PcC3iRLKNroWCfvIVdyHTFinde5eW5Mk5rjJxVFvIYKYwOPMMXTWDzd64KEHK8k0S6FWqrQB0KjzAtVPl5uEM9h+0ysbL15Ds6gDsunq60+oPg/IFVyC0LlNdxTiOnJMiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by CH4PR03MB7602.namprd03.prod.outlook.com (2603:10b6:610:236::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 16:53:49 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%6]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 16:53:49 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@wiwynn.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Thread-Index:
 AQHbh4VxpikJXQqM80uP0g18KkqRJLNZP5kAgABvcICAAEgqAIAA4wiAgACBPwCAHWbz8IAAYD+AgADXJPCAA/jlgA==
Date: Fri, 21 Mar 2025 16:53:49 +0000
Message-ID:
 <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
 <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
 <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
In-Reply-To:
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|CH4PR03MB7602:EE_
x-ms-office365-filtering-correlation-id: eb47fe1e-66a2-45b1-9e4d-08dd6898f409
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SEVhT3V2ZTVQZ2hHN1hLZTRiR3JVT3o4WE8vdm41Zk16aytNRGpqdjhOWk1w?=
 =?utf-8?B?Q0JJNVdHbXZvRHd2dm1sZWppU0h3ZTNsSVRUSjh0K2pDV2tZOUd4ajhKYll6?=
 =?utf-8?B?M0lBSmc0TE14KzJIR2lpb3JZRmxYUnNTWDMwSFhXNHo5NkpkZ2gxR0E2RVVW?=
 =?utf-8?B?enhXYWhoeTlaaTlvbmlNRW9nUXBNYmV1b29sZENpd0o3V05SSXU2THNyNVlL?=
 =?utf-8?B?VTFNNE91dGhndlBBWmlEbzZhbTFJckV2SndNV0d3RDF0UThtaUlKdEtZM3Jm?=
 =?utf-8?B?amFKWWxuKzRBNGIwT0JSV2syRTJ2Nmo3T01rR3BwRVlwa1lwM2NMUHlGVExQ?=
 =?utf-8?B?R2lHT1dIV21WamdrUHZzL2IzU0paeEpqOGJWbjRVVVVnSFdpeWtuRXJ5eU1h?=
 =?utf-8?B?b0JEWktjUnFxQWJyK2IrRkJFbDJOMjM5REpBR0oyeUYrNGtFTWhOeE1ndDBh?=
 =?utf-8?B?QXF2bXd4dWZ6NlNTUjc5NXV2WGtSL0tJbGpBdnFJcUdSbVJETDFZV0NmaFJp?=
 =?utf-8?B?MzBKVlB3QkFqTnZWMm54L2plbnRmaGNHTHJIRlRXcG9IN3VsMFJ2Smk1cVZ3?=
 =?utf-8?B?T3VjVDZVdEZ0REFiSDZ0Ymg5bytKTWpWZTlyTGdXbmlPME9JUlB1ZXE0TTI2?=
 =?utf-8?B?K1BCVzdqZ01sS0FZcXgwMXY2VS92SENRM250Zk5CKzhmL0VWZEhJT2V5bktV?=
 =?utf-8?B?UzRPOUY2MGUxTHNHQmhBYmJ1TjdQK3dnQ0hFeE4yb09jQ0FPeHJ4SkFSUVFS?=
 =?utf-8?B?MlQrTXJ0d0hHbTgwVlJPUlFybmhRaDBtRVExME1pZWx5V3dyNzZ4WStEMkY0?=
 =?utf-8?B?V1lmOCt1YmZxaXhORlN6bHZzYzJWWjU4eTJTUkpuQUN2a0wwNHk0UU1GNVh3?=
 =?utf-8?B?aXFEQldxY2NNVEJQLysxb2NoL0VjMk11dzlTZDl1ZVFia1UyMUN6cHNOMFRF?=
 =?utf-8?B?ajZ1bE4zbTE0LytET0xBMGF3c3VwUHB0R01nUlpHSkF3VC81WGE5QW1lSWha?=
 =?utf-8?B?NmJPSThnbHNwN1FocTJPY1NBN2RWV1RRSThtVURiakVvOUVpN2R6S0FKeE1u?=
 =?utf-8?B?c2toTXFvS2YwQWRsaUVhZWpOaUwxdDVLYjE5MTRZUmc1eURCNldTYUp0RzU5?=
 =?utf-8?B?QWkrcnRFSlFYeENjSkkzMkNpcGV6ZGxKYVVYNHgzMloyNWcyZUxteEVmZkJz?=
 =?utf-8?B?SEJ0Zkl4djFkaWcwTTE3bFp6dzQxbFJ4MENZQkZpU0Mva09YMG1yMTZKSmpk?=
 =?utf-8?B?RVVMRHIrUVc1TEpuVkVFaDQ3Wjk0ZXpZQSt6MXQwTGFtYS9RV1crUU9KcGNP?=
 =?utf-8?B?RzFhU0lqZForVk9oZkRUT0RJYzRYSTl1OTVvaldCZzYxTExJWHg0WmxZTnN4?=
 =?utf-8?B?OHBxdFJmZ2c0RExVeTdQU2dyVHhBQjRSa1hoRVJUMG52eFIzc29OWUpkUFBO?=
 =?utf-8?B?Z1lIaGFIcVAzd3dsZVN3MGZ5bGhBMENxS1U3UmI3QytKNnpLZS9iSVhHTnFx?=
 =?utf-8?B?bUZ3dkQzb0pUU3V3aWNBQjNqMVBBYUlJSHRYSncxUWZzbVl3WkNTZ2k1SkY2?=
 =?utf-8?B?amZia1FSWUppV3R2OEJQT2lKYmZ4VS8xNUR4QzFNVkNlK2x2T2V0V0kzNkJC?=
 =?utf-8?B?Zi9WR0ZJeU5hdXZQWXBCdnppTWlzUFM5TFlUajJ6OWFuWkF4YlBMOGE2R3pJ?=
 =?utf-8?B?aVJPempkYzhJM0p0N1UvNUNWL1JBVzkyc2xkR3FCMzRHeG0zQUVtSXBCUS9p?=
 =?utf-8?B?OFFMcWNNM2E1QVJjeEJLOTNZVW03UkFPTytMSkd3TkI1MmhqQ1VsdlJmUWJK?=
 =?utf-8?B?WVFST2YyYXFCUWIyRU5IT2N6eFdhUmQ5cnRyVEdTV2YwMHk5akNqNEhITTdk?=
 =?utf-8?B?RGFDSlBFbTZUcFllaEVvNk5xT3NQdkxNVnU3ZW9FT2hpU205T0J6cE5ra3Ur?=
 =?utf-8?Q?6d/EzTsxflMpK0stokHnPxhDAR2UVs4g?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEhPMlJMdmM4MERFbWlPMHJ4eEh6bkxYUjMrWWlTSnRWcWRwVlpSZmNWa2FE?=
 =?utf-8?B?ZEdYVEhPU2c5cmVvdUxxQUllNFJFMnVPUXA0Z2J5QWVwcTJRR1BMbWVETktu?=
 =?utf-8?B?TzkvSGZxeW5KbmdaOVBWYmZYUlJpZktYRCswcml3WElzYk1TaUFkY0Z5UzA5?=
 =?utf-8?B?ZzBUV1g5aUQwWHRsT2REeGUyNUtVRHViTVh2UVVyUFgxQmtRU0F2R050V214?=
 =?utf-8?B?ZnVVSE4zNkluTmhyTWZOZmpOSmFFa2kxR2R2TGJjZzJ2ZERtYmsvQVROcE5a?=
 =?utf-8?B?NktZTlRrZFhhbytjaFFlYWI1aGdCSzcrMEIzLzRkOG1zN2dOZzBjTkU3dm5Z?=
 =?utf-8?B?UHJuNUtRUm5SalZZdWtTaE8rY2dJbVhMNkxlRWc0M0FUYlMyRkIrZHlRcnhK?=
 =?utf-8?B?YzRCMmVncWRHb3NIUktuQVNQdENPcGU3M083S3BjbjZ4bEMwRjFsNS9zMktP?=
 =?utf-8?B?ODhYVW9pNmd3cEVEck96SlMzVGtBTnprNXIxcHd1YVlOVldDV2lUNzJSTlEy?=
 =?utf-8?B?RVhyZUgvUXhKWTRtUjh5ZFQrVWYvM3h5Q3VTdHlrYnh5cGV2WlFPZ3hjZVVI?=
 =?utf-8?B?TU1kZ01jWlVJZzZZU2tDOEtsYmR2MjBLWlNVbmVpaTRLMjBHdGRyUElXUi9n?=
 =?utf-8?B?czI5NjJQNXE2RU96TVF0NEE0aUU3c09uYVpIYzNnTHVteU1xUVBRb2ozbHZr?=
 =?utf-8?B?azBmNUhZTGE4VEc2eHVZQ0xsYUZUaWpocU41Zk1iNjNPcUZRT1dMblY2VnZY?=
 =?utf-8?B?SnpycHg0c2JUMXIxcjJHNXU0azB2V3Axckh6Z0M5WElVd3c5cnBNYTFBTmJ2?=
 =?utf-8?B?ODJhV2FBNGZBMy9WMk5sNmZVT2J5VjZ2WTRuU3VVUnh5UVd5QU5MS0plLy9U?=
 =?utf-8?B?dnM3VTliNzB0UE9GalB4UmY5a0pBbUNEekxMcElmVjNQLzBzZVFWZHVaSkpC?=
 =?utf-8?B?dWk4UWtHdWR1WHdFcnhsSldnUStyUmtXM0h6dkc5bFU0Nk41RTUxK25WNGlG?=
 =?utf-8?B?RmcreEFIL2tIRG16ZVhxSmlMUXZZeXpEaWh1bmh0YWhCOG50dU9ZUmk4dklG?=
 =?utf-8?B?dk55UFRTeDdCT0tBRHhBU1FNNlZiMUd2a2VpQjlzQTNISHl6L0FISzE0UWdq?=
 =?utf-8?B?YWpOSUZtTVJtTnBwcWdYWnJTRlZVRXV6dld2TVNkVS9NdnAwbkdNbDRNUnV2?=
 =?utf-8?B?elZHdCt3b092YmJ2eFJHbDFKQVhDSGt6czJwUzVlTUZ6QVhSazA4ZFZHd2hx?=
 =?utf-8?B?N2gyRHBSQWh0MmtGMEQ0Zy9RTy8wT3EyRWhyeDVxMXF1blhFS2JOKytKTU1P?=
 =?utf-8?B?UDZ5cTZYWEpsTWdLY21sSTNyNWJYY0dQekQyaDB6WGdtNTUyUnk1SEpBdEYy?=
 =?utf-8?B?b1hHbzdaeGU4K0k4OW9UY2ZVZ09XbW1sdXRDb2J5Sk9kd1JHYzdXSHJ4OVJs?=
 =?utf-8?B?TTVleUZ4dU1iOEhocVRHd1F2bWJMdFd3d0lpcTlGRmNVOXZ2NlJuVlRBclVT?=
 =?utf-8?B?aXJGeC94VU9YN2F0cThkTzJpU2gyeS9wWkVCcTd2Y20wYUlWdFhtd20xVnNJ?=
 =?utf-8?B?dGZXS1hqSGhiZWlENGVzZ1FVTjJNWFhETlMyVFBmY3ZIMXllb0dXMlBQUy9m?=
 =?utf-8?B?c2xZUXlxM2I3d0RHWFkzU3Raem84Y01oZktkbHJ0dWVWYmxVR0o4eFBObzR4?=
 =?utf-8?B?K1YvOEpCOTVOTC9IUzVXZCt3bGhiV1M2WDRPWElCb0RUdUh2ZnJ4UlQ3MUJw?=
 =?utf-8?B?YUFCeXZZZVlhRFllVzMrZzc4NFU0NXV4Q2syKytHT2hscFRiMHp4UTZQVnJG?=
 =?utf-8?B?MHJ5K1JTZW50MXBOanR1bmdXV1VQYloyV09hUnBMV2tjMzJzWG5aR3E4N1Yx?=
 =?utf-8?B?Mm5YS3NJdFR3dGY5dGRwdjBwY3JrN3lmaW8rREw4enY1TE5aQk03VktuelZt?=
 =?utf-8?B?bGpUSmpUVFcyaE1vTjlwdUlUWmFrbWVSN0Z2VC9Zdm1KNzJFUkM3QXg0Z3A5?=
 =?utf-8?B?c00zVFRibmdqUjJRM1hGVFlFVUE1Ny94amlPSVhWd1l5NW12QlhhWnJXK2x3?=
 =?utf-8?B?Yi9jSWlwQ2JMVkgzenp0cm5VMUdQblpnYXJlSG54d04vWW0zME8yVENDUWNo?=
 =?utf-8?B?WVNRd0JlQkQ2K0g0d1RFMjBkZjR2MFhBa1BLV3NVY3E3NUJQTVVNUytZUU00?=
 =?utf-8?Q?kmAyEvmhndKH6CJXhFJRu/I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eb47fe1e-66a2-45b1-9e4d-08dd6898f409
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 16:53:49.4570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77yd2N19WM/8qQmnEX3hjebjhUyae9PhhPHpoYoGoJtbQ5KrLFuq1elZyBcuTvRebYkZYu/ay5XEiJqh+RYofnQMOGqPOxqdSYS3keaTUAiQvkrFZclZn/55mzFbSA1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7602
X-Proofpoint-GUID: wMK9sGH86iyyrJr0fZF1ABNUpOCIMkTJ
X-Authority-Analysis: v=2.4 cv=J5+q7BnS c=1 sm=1 tr=0 ts=67dd999f cx=c_pps a=UiiUhvOI59TtQsb/yF5oqw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=9tklJ5FAx3Bhv99aqTwA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=e2CUPOnPG4QKp8I52DXD:22 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-ORIG-GUID: wMK9sGH86iyyrJr0fZF1ABNUpOCIMkTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210124

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFbmNhcm5hY2lvbiwgQ2Vkcmlj
IGp1c3RpbmUNCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAxOSwgMjAyNSAxMjoxMCBQTQ0KPiBU
bzogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PjsgS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47DQo+IENvbm9yIERvb2xl
eSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEplYW4gRGVsdmFyZSA8amRlbHZhcmVAc3VzZS5jb20+
Ow0KPiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgRGVscGhpbmUgQ0MgQ2hpdQ0K
PiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1od21vbkB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMS8yXSBkdC1iaW5kaW5nczogaHdt
b246IHBtYnVzOiBhZGQgbHQzMDc0DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBP
ZiBHdWVudGVyIFJvZWNrDQo+ID4gU2VudDogVHVlc2RheSwgTWFyY2ggMTgsIDIwMjUgMTE6MTcg
UE0NCj4gPiBUbzogRW5jYXJuYWNpb24sIENlZHJpYyBqdXN0aW5lDQo+ID4gPENlZHJpY2p1c3Rp
bmUuRW5jYXJuYWNpb25AYW5hbG9nLmNvbT47DQo+ID4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPg0KPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6
eXN6dG9mIEtvemxvd3NraQ0KPiA+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkg
PGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBKZWFuIERlbHZhcmUNCj4gPiA8amRlbHZhcmVAc3VzZS5j
b20+OyBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgRGVscGhpbmUgQ0MNCj4gPiBD
aGl1IDxEZWxwaGluZV9DQ19DaGl1QHdpd3lubi5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtDQo+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtaHdtb25Admdl
ci5rZXJuZWwub3JnOyBsaW51eC0NCj4gPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1pMmNA
dmdlci5rZXJuZWwub3JnDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIGR0LWJpbmRp
bmdzOiBod21vbjogcG1idXM6IGFkZCBsdDMwNzQNCj4gPg0KPiA+IFtFeHRlcm5hbF0NCj4gPg0K
PiA+IE9uIDMvMTgvMjUgMDM6MDMsIEVuY2FybmFjaW9uLCBDZWRyaWMganVzdGluZSB3cm90ZToN
Cj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4+IEZyb206IEd1ZW50ZXIg
Um9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiA+
ID4+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjgsIDIwMjUgMTI6MzMgQU0NCj4gPiA+PiBUbzog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiA+ID4+IENjOiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPjsgRW5jYXJuYWNpb24sIENlZHJpYyBqdXN0aW5lDQo+ID4g
Pj4gPENlZHJpY2p1c3RpbmUuRW5jYXJuYWNpb25AYW5hbG9nLmNvbT47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPiA+PiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitk
dEBrZXJuZWwub3JnPjsgSmVhbg0KPiA+ID4+IERlbHZhcmUgPGpkZWx2YXJlQHN1c2UuY29tPjsg
Sm9uYXRoYW4gQ29yYmV0IDxjb3JiZXRAbHduLm5ldD47DQo+ID4gPj4gRGVscGhpbmUgQ0MgQ2hp
dSA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsNCj4gPiA+PiBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtIGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPj4gbGludXgt
aHdtb25Admdlci5rZXJuZWwub3JnOyBsaW51eC0gZG9jQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+
PiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ID4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAxLzJdIGR0LWJpbmRpbmdzOiBod21vbjogcG1idXM6IGFkZCBsdDMwNzQNCj4gPiA+Pg0KPiA+
ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzLmgNCj4gPiA+PiBiL2Ry
aXZlcnMvaHdtb24vcG1idXMvcG1idXMuaCBpbmRleCBkZGIxOWM5NzI2ZDYuLjI4OTc2N2U1ZDU5
OQ0KPiA+ID4+IDEwMDY0NA0KPiA+ID4+IC0tLSBhL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMu
aA0KPiA+ID4+ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMuaA0KPiA+ID4+IEBAIC01
MTIsNyArNTEyLDYgQEAgaW50IHBtYnVzX3JlZ3VsYXRvcl9pbml0X2NiKHN0cnVjdA0KPiA+ID4+
IHJlZ3VsYXRvcl9kZXYNCj4gPiAqcmRldiwNCj4gPiA+PiAgIAl7CQkJCQkJCVwNCj4gPiA+PiAg
IAkJLm5hbWUgPSAoX25hbWUpLAkJCQlcDQo+ID4gPj4gICAJCS5vZl9tYXRjaCA9IG9mX21hdGNo
X3B0cihfbmFtZSksCQlcDQo+ID4gPj4gLQkJLnJlZ3VsYXRvcnNfbm9kZSA9IG9mX21hdGNoX3B0
cigicmVndWxhdG9ycyIpLAlcDQo+ID4gPj4gICAJCS5vcHMgPSAmcG1idXNfcmVndWxhdG9yX29w
cywJCQlcDQo+ID4gPj4gICAJCS50eXBlID0gUkVHVUxBVE9SX1ZPTFRBR0UsCQkJXA0KPiA+ID4+
ICAgCQkub3duZXIgPSBUSElTX01PRFVMRSwJCQkJXA0KPiA+ID4+DQo+ID4gPj4gTWF5YmUgc29t
ZW9uZSBjYW4gY2hlY2sgaWYgdGhhdCB3b3Jrcy4NCj4gPiA+Pg0KPiA+ID4+IFRoYW5rcywNCj4g
PiA+PiBHdWVudGVyDQo+ID4gPg0KPiA+ID4gSSdkIGxpa2UgdG8gZm9sbG93IHVwIG9uIHRoaXMg
b25lLiBBcyBvZiB0aGlzIHdyaXRpbmcsIG15DQo+ID4gPiB1bmRlcnN0YW5kaW5nIGlzIHRoYXQg
dGhlIGR0LWJpbmRpbmcgc2hvdWxkIG5vdCBleHBlY3QgcmVndWxhdG9ycw0KPiA+ID4gc3Vibm9k
ZXMgZm9yIHNpbXBsZSBkZXZpY2VzIGxpa2UgdGhpcy4gVGhlcmUgaXMgYWxyZWFkeSBhIHNpbWls
YXINCj4gPiA+IGJpbmRpbmcgYXMgbWVudGlvbmVkIGluIHRoaXMgdGhyZWFkIHBhcnRpY3VsYXJs
eQ0KPiA+ID4gImR0LWJpbmRpbmdzL3JlZ3VsYXRvci9pbmZpbmVvbixpcjM4MDYwIi4gSSB0aGlu
ayBhIGJpbmRpbmcgd2l0aG91dA0KPiA+ID4gdGhlIHN1Ym5vZGVzIHNob3VsZCBzdGlsbCB3b3Jr
IHdpdGggb3Igd2l0aG91dCB0aGUgY2hhbmdlIGFib3ZlLg0KPiA+DQo+ID4gSW50ZXJlc3Rpbmcu
IEkgYW0gbm90IHN1cmUgaWYgaXQgcmVhbGx5IHdvcmtzLCB0aG91Z2guIEkgbG9va2VkIGludG8N
Cj4gPiB0aGUgcmVndWxhdG9yIGNvZGUsIGFuZCBJIGRvbid0IGltbWVkaWF0ZWx5IHNlZSB0aGUg
Y29kZSBwYXRoIGl0IHdvdWxkDQo+ID4gdGFrZS4NCj4gPg0KPiA+ID4gV2l0aCB0aGlzLCBJJ2Qg
bGlrZSB0byBrbm93IHdoYXQgdGhlIHNwZWNpZmljIG5leHQgc3RlcHMgYXJlIHRvDQo+ID4gPiBj
b250aW51ZSB0aGlzIHBhdGNoIHNlcmllcy4NCj4gPg0KPiA+IENhbiB5b3UgdHJ5IG9uIGhhcmR3
YXJlIHVzaW5nIGEgZGV2aWNldHJlZSBmaWxlIHdoaWNoIGRvZXNuJ3QgaGF2ZSB0aGUNCj4gPiBy
ZWd1bGF0b3JzIG5vZGUgPyBJZiB0aGUgY3VycmVudCBjb2RlIHdvcmtzLCBqdXN0IHN1Ym1pdCBh
biB1cGRhdGVkDQo+ID4gKHNpbXBsaWZpZWQpIC55YW1sIGZpbGUgYW5kIHdlIHNob3VsZCBiZSBn
b29kLiBJZiBub3QsIEkgaGF2ZSBhbg0KPiA+IHVudGVzdGVkIHBhdGNoIHNlcmllcyBpbnRyb2R1
Y2luZyBhbm90aGVyIG1hY3JvIHdoaWNoIGRvZXNuJ3Qgc2V0IHRoZQ0KPiA+IHJlZ3VsYXRvcnMg
bm9kZS4NCj4gDQo+IE9rYXkuIEknbGwgdGVzdCB0aGlzIGFuZCBnZXQgYmFjayB0byB5b3UuDQoN
ClRoZSAic2ltcGxpZmllZCIgZHQgZmlsZSAod2l0aG91dCB0aGUgcmVndWxhdG9ycyBub2RlKSBk
b2VzIG5vdCB3b3JrIHdpdGgNCnRoZSBjdXJyZW50IHJlZ3VsYXRvcl9kZXNjIG1hY3JvLiBJIGhh
dmUgYWxzbyB0cmllZCBzaW1wbHkgcmVtb3ZpbmcgdGhlDQpyZWd1bGF0b3JzX25vZGUgc2V0dGlu
ZyBmcm9tIHRoZSByZWd1bGF0b3JfZGVzYyBtYWNybywgYW5kIGl0IGRvZXMgbm90DQp3b3JrIHRv
by4gb2ZfbWF0Y2ggbG9va3MgZm9yIGEgY2VydGFpbiByZWd1bGF0b3IgbmFtZSBpbiBkdCwgYW5k
IGl0IHNlZW1zDQpsaWtlIGl0IG11c3QgaGFuZGxlIE5VTEwgY2FzZXMgYXMgd2VsbCBhcyBzdWdn
ZXN0ZWQgcHJldmlvdXNseS4gSSB3b3VsZA0KYXBwcmVjaWF0ZSBpZiB0aGlzIHdvdWxkIGJlIGFs
c28gdmVyaWZpZWQgb24gb3RoZXIgZW5kcy4gRm9yIG5vdywgSSB0aGluayBJJ2xsDQp3YWl0IGZv
ciBhbm90aGVyIG1hY3JvIHRvIGJlIGludHJvZHVjZWQgaW4gcG1idXMgdG8gc3VwcG9ydCB0aGlz
IGtpbmQgb2YNCmJpbmRpbmdzLg0KDQpCZXN0IHJlZ2FyZHMsDQpDZWRyaWMNCg==

