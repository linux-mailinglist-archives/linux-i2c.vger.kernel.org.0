Return-Path: <linux-i2c+bounces-9896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC1A6841F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 05:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7506616DEE6
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 04:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00A324EA83;
	Wed, 19 Mar 2025 04:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Yt5Hm8Cb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED5A2AEE2;
	Wed, 19 Mar 2025 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742357431; cv=fail; b=QuD/1vEBr4QLlGETBdpt34ZzDAZtvfmviACZEHJ0yQFPPKhJMicC5Ury4Ad1MVbbXn6t4/QolcdsiFrJV70bNqS5NaaLmNQJK9rYrYTCpmfVgyOSdeCbV3FKi4Jx0+2K8ATeIctVw1gzegFXquVorZsSbjDhkY+JOxc7UKn4c6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742357431; c=relaxed/simple;
	bh=4p9LcBlEqkBKXEdf69jwnJ4SkL2Q0P7Yg9qbiG++x/A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vw8fCpXkRORjj0qce6DBo7oYS/Xt3DrDmRmcNFQFAaB/dFn2FYxPGsqpGdleqhdyRbVfAiVrGYdRtMf8L4+X0othw5XilbCQOgjyM67229KtVheXpLj591iOOSoGw92U5otEj+Z7pPdaltdecQm+YvXNvdvr6XC6OTsxU1wVjc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Yt5Hm8Cb; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J160id010250;
	Wed, 19 Mar 2025 00:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4p9Lc
	BlEqkBKXEdf69jwnJ4SkL2Q0P7Yg9qbiG++x/A=; b=Yt5Hm8CbwFCCF4nXzuz8+
	sbnbBVxJxQbg98aMwfZPpRZ6N4sUtJHYcGV74dx+bRoDLRg3UlNIkPQtmPDc7/ZO
	K024W37cWkdK/Nljzp3rUx/2U8CM8atbgrHT1J4Y8U6UedxC3T5SC1eXzNQub83P
	bnK8nra1zzDBQHMIMl9/RFxx9gN+wpz04QgmqFxe+mzL+eJgU+RSPf7p3Gz/+Hl6
	lwviO2aUeUvJhlQ4JxHzb9/xvjvDpuUdDydUcGnF5zeCMxShf2/8tpXLV9NkcrGQ
	PwAbRa3H1yPVIIqw0WzLnClWAWlTOYKtpRPCVT5ZHU2FylxqIIBoYN6iRPMHMwE2
	A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010007.outbound.protection.outlook.com [40.93.1.7])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45etxgy7sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:10:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz/DjGjszpSHm/dPHd/PyQDbMaB4fC/QXL1U9rjbEmJ2EwwD5+gQiseahQnwX3iFr1eQYC7KI2kNzXOigJFNlDhzyEIu1mICUXXaefy+B17AyDBpWwpdcgFdtT7OCN8VVVbk0MpKQ2SESN53lWHvQZCMQL2HrgHc1oGh29wwr7MTk790GZLQu8ZyYhxwaWn9py5ZahgaA9bKVxtdqqJ+W71rWM6Q27Is7ToBJoJEEs+OQrwKhIfzrvgacYcPH9s6/q2HTz9JGc0glhjTWgfsjaJrVKDc1yUqvrjLtR4myC9N87aSDWcf511c6nP6H9T6eb6NBXj3anybfGrfQqfWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p9LcBlEqkBKXEdf69jwnJ4SkL2Q0P7Yg9qbiG++x/A=;
 b=Oqlvl5LMQ3VM5Vg6i8L/DbyRCd726XfWp76Np9vGPC6ZCTuiHuVNNo2awhuEKrIErZepgLjV18aRf2yoPsjurfK8wh6RFF8lfSe9+AFvzoVCW1eQrlI1lha9xR3zbl8KBkViW54ADHkQaPM80zMQSFgj9xvCohOclt6W+VHyxrfXLC7aq5HNjG+5IFQmLrMJwYwtMiovFRxtqGEowKmH5OJ90Mel+RCbO/TT0dJCMT9gedN4FexQ8y0eIIkyHCwLZHINYnurAC0CUBbgnR0XBj/jxhu/rNmfmpiVHq3NqD4miB8DSVs85738jg6FHipt0lUOjLnRGRa+mV3JQSzUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 04:10:06 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%6]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 04:10:06 +0000
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
 AQHbh4VxpikJXQqM80uP0g18KkqRJLNZP5kAgABvcICAAEgqAIAA4wiAgACBPwCAHWbz8IAAYD+AgADXJPA=
Date: Wed, 19 Mar 2025 04:10:06 +0000
Message-ID:
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
 <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
 <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
In-Reply-To: <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|DM6PR03MB5371:EE_
x-ms-office365-filtering-correlation-id: fcc4da17-f3d6-42d4-821b-08dd669bee67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUhsaDQyTG0vWnpsNy9ueTJzQlJMZ3BJU3lldkZ3UHpJbkUyYXlqRVB0R2J2?=
 =?utf-8?B?bmJGMk5xbFJWMkFVcVZqQ093OTMyMGd3VjlqUEQyb055MTNrbWRqanBaeWx4?=
 =?utf-8?B?QnFQci9PL0NkWXNIRDM4OUZaaStwWHJMeUN2TGVTS21VZ3MyZ2tISFBBb05u?=
 =?utf-8?B?RUljL1RuVGNWWnJIQkN6RExuQ0NiTmlBVmFiajZLcnhSV3RNQTdxclUydEkr?=
 =?utf-8?B?SUZ4RTZUWDdqTTRhNFVwc25HZjNVSW9HSmdBT3ZONTlEWUdKMkJ2WXFVTy94?=
 =?utf-8?B?SmNkcXVKUlg2dHZ3ZmhHWXB5a2xJeE9RKzc5VHZtaTh1bWdMSFQ5MG5Scng5?=
 =?utf-8?B?RGtIS0IzbHZwV3d5UEN4dytTTEhTeTJXNHVDblZlck14OUczdGtieDZ2d3Ri?=
 =?utf-8?B?TGN5b1lwdTRiS0NQZkxIYnNFU09JRERhc21UMnE3bmNQcUNJUCtsdmp5bXN0?=
 =?utf-8?B?d1lOSUtuOU1ua0VCRjJnSkNvc3hVWHo3ZXJCbVdHMmtyN29IeG5QVHRyMWVQ?=
 =?utf-8?B?TVNiYVFwZ1ZIakR2cG9DVmZacEdtUElDQlVldlhSUGNrOGlQb3JUL1UyS2hi?=
 =?utf-8?B?SDNLRENJYkYwYmtZUWhhOHMrVjlEMUc0eGJtSUZOekE2S0cxMGFhRmFmbUNh?=
 =?utf-8?B?em9tTUt2OStVOUlIMHUyWkZtbzVseUFjaDFsODZKdVVRVlV4ZEw0bjB6Wkl3?=
 =?utf-8?B?ZDI2L3BHbHFYUDlXMldlWm1NNjQ1ZFY2bEh5OG42OVlLQnFVUCtaNisydlNJ?=
 =?utf-8?B?QVRVZnpkUTZkdkxOL29DeXB6N09Gdkpobzh3RkRtVlk1OEE2UFI1RVVtZzU4?=
 =?utf-8?B?R2pvUUloU1VwTW5KRkFaREtIWnJLYTIzdXRKV0ZnOFdtK210d2d1QWoyNUdz?=
 =?utf-8?B?ZkJmaTdoS2JNUkorSEZzeXlRUzdnRmZLcWN3OG0rRVBNaUxNWEUyTTdaVGtr?=
 =?utf-8?B?TUlQSHVCK0ozZ0VseVdMWGtKd3l2eXB3THdVbjJoMnBoajBRNDQ3YzAxZW5m?=
 =?utf-8?B?Y0MvZlY1bDBsYzFVTDJSdTJESExUaDZtZ3hBa1pHZTd4SitRMmxkL28wbDRq?=
 =?utf-8?B?M3ZLamQ1UnhKMTdPd1VGM0gwSXZCQTRpV3BicXI1Q3lLd0lob0lrazQwUG9k?=
 =?utf-8?B?MzNCdk5SNXoxbk84S2FsMEdsY3ZKUUpFbWIyejFOZW1McWp0UzFFcUJpVk9a?=
 =?utf-8?B?Z29MbG55cEwrZVUvWWpyMDV5ZDBoaXNPWGgvWStPdHBoMEpaT3UyQVU2UnpX?=
 =?utf-8?B?V2lmS3B6Q281Zm9OcEJyZ2ZUS0p3QW5qT0JrK0ZUNmI4dy9KUWR5a2pmSmhw?=
 =?utf-8?B?VWFSYWxnS0hpa1hydEZvcmtWYlhKQ3NTR3gzcE5BbGk3TS9Ta2dyZXlWNHpI?=
 =?utf-8?B?bTdPMng1QWtWTnRRRXNlTnlnUk50ZkZhYzhlMHBSUHg1LzhNTzR1bTVLMUpr?=
 =?utf-8?B?c2l6OWg3eVZteVhCSUVTNzlFYkc3dGdvR0ZIVG5qVHRnOGhVZlVwQ3h6T2Z4?=
 =?utf-8?B?U0NrM1JMM3lDdG9nek9rZmZlZklPd2l4M2UrZ1VZRDkwSXAwNHp5cUR3NnBC?=
 =?utf-8?B?c25FWVJaUHUwVkI2SGlQa1hiUk1NWDVZK2s5MFUrc3J0VmFCaUdtb2pGanBj?=
 =?utf-8?B?T0pweFh2ZEM4QzZuVUlMYmxVN0dKNXRWZEZFeDFVWHJONmEwSWRpRHVSSnF5?=
 =?utf-8?B?Qy8wYUZwQnlEcXg1WGIyb3VMeE1NSC90UVBKT2hmZTZ1d1BUN2k3V0pzQ3dw?=
 =?utf-8?B?VnJkeFFCWHorcUF2ZHNZRGh5SU91V2xKcWY3TnhkOCt2Wm4vQUlJbXdXZVNT?=
 =?utf-8?B?anNvYXdLaGxZOUc0SFByVUxwTVQ4cTlBdFJnNXZVNTErVi90akFiNGxhTWtw?=
 =?utf-8?B?SFdGT28rSGlGNmhxbVAwVEUxVzNvV3hyaGJlb1FaYU5mSnNEMTNwRmZua0dP?=
 =?utf-8?Q?bJ+P6fteMF/2kwhzX7f3bXRMEypF1vnk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3NZUTNwcFdyNW5mY3JyQklMQnpSVG9sL3pPaTdHalNLSEdkd1F0M3hTSGpE?=
 =?utf-8?B?SFVQUy81akViMXY5UTVHM05xNkZYcTV1WTlYRlFQdnhadWp1aEtBQnNQZkNF?=
 =?utf-8?B?bnlhTCtJU0tJZUtrVk9LTGFWbUxGdU1TQVgzUlBhZHllODRJaGxsbERVa3dM?=
 =?utf-8?B?ZVEvL1pCbHFic1hDVkFnZ3NFaTdma0hqaG1nU0MyWGxYUHc0NFJaeXlJYXNM?=
 =?utf-8?B?VEJ1WVZYbFZuWmp4ZFVBcFFJaklRUnZWZUFzR1VmWkpUVklpaFg0SEh2cjFq?=
 =?utf-8?B?dGlMMG9ScENzUEFUcGRjZ1k4WDNzb1B2ci9NcDNtTVFnSklNUy9SdEw4MmpU?=
 =?utf-8?B?Y1VucUdnbmtRak02QVpmbmdoNTd2Q0JkWlZvYXU1ZjhNNXNlYTJhd1dRL3pE?=
 =?utf-8?B?RWVBYU9VSFYxeWhmcjErWmFJeGhadTFnMVdmOU1vekQrREZBVnphMytBcWRr?=
 =?utf-8?B?c2xjTDU1Ym1jaUpNR0IzWGhaMWl1TWpDcW92Y0pDZmw1Y0VLK1Zyak5DZklS?=
 =?utf-8?B?U0prcWNnQ2dPK1RkelNuQ29pVmtVd2hRaFJRTUNwQlhsSG9RUE1YY0ZLRFZi?=
 =?utf-8?B?Nm5Na1lqMk1UWiszcGZtZjN5aHhQeXhrdnRvbnlHd092ZGJobFF4VjVjYzN1?=
 =?utf-8?B?WmJPVEJXaE5LWFh2UUM4eUNFQkE1aWdhNnVnNjhQRXpMdGtrczFhMnZzSXFL?=
 =?utf-8?B?YVJKcmRjdFdDMlpnN1l1YXdNLytZRkc3MFl1R2F5M21UczRxeFNVSXQ3ZVlm?=
 =?utf-8?B?VW0vb0VQdS9PYU81bk9OUkQ4Wkd3Y0t1YUo5Y2c0V1hCUXNMRlI0S0FQZk11?=
 =?utf-8?B?cURvUXlGUUxwVStTQ3RpU3JJNlFFazcyeHVmUjMrb0ZmeU0rM002NmhscVBk?=
 =?utf-8?B?WXRxaUlCODFXWU14U1Bla2hzR3RXNzY3dEFUcFJTR1lLVEUxSnRmVXBOc2Ru?=
 =?utf-8?B?VHVWUGt1VXQ0LzBqUFBiNFRQc2hTZXF6MElUN3RLTkhuMHZqZEFpNGZBZEZO?=
 =?utf-8?B?QThKWEVTWk9CaHlkM2pSaktsRzJIOHRoM2hvNVl0RWt1blFHQmNwVXBOSG92?=
 =?utf-8?B?QkgwYk9UaE5Icm1Wc2VzYmRQaDRFVzdRRDZjdW5NWEJIS3RQM1QrN0lOK2tV?=
 =?utf-8?B?S0kxSGdHMGorc2ZoVXl1VWIyLytVSGsxY29MQzJTSXlJRG5YZ1VqSzNyM2Vi?=
 =?utf-8?B?WkRxQ1B1Wm9PdkN2RUczcitmL3FnS2xRcFd1cTZiQkQ5VUExT1pCZzc4MWxI?=
 =?utf-8?B?RDNPZFYybnEramZudFRGaDF5MkpCcnk2NFJlWHZkNjVvYmxLZG9vOG1WMFhV?=
 =?utf-8?B?UENNME5Rc1doZVo2TVIvVTdQai9xUXBROGNlaTVUaVBsWjJhSnluOFV3cXNV?=
 =?utf-8?B?dnp6NzhRTWVlWHoxZ1UrRGsvaFRxajNHSGtqVEc4QXdCVXdueklFcDcybWg3?=
 =?utf-8?B?UWtOVUlCYUlSbzFUMVVQV1NyYWxHc3czdTZ1Qzk2OHBGenN0eUdNU1hsRktB?=
 =?utf-8?B?MUM1Y0VSOE9UNnBxd09oQysvZUZ4WUIrckNMQkxveVAvdTFBYlpXY3I1V0hl?=
 =?utf-8?B?UGgwTEVjdzZ1eWh6NXM1b2xBNkVzR3JhcmFLVmM5dGtNSWJ1TzU3U1RQbU1T?=
 =?utf-8?B?Mlg5V1FVdHovZVB6QnpsalNWL2hJSHd5eTVYWm5lVGVRdGVSY3FkSExJUUNz?=
 =?utf-8?B?dXRyK1NCYlJ4Y1Y1QWFpaHhBQWpHSU5pTjRKZTAwN2lxeGE0YjFQR0ZBSHFW?=
 =?utf-8?B?NzZpWDRDTXdWTkpVbTVQaEZUbk85K0p5OVZzYWRWTndnVU9nZlYyUUMxR25K?=
 =?utf-8?B?a2h0NVNPNzE5aDBRejFESkZXNkdLbkt1QjZkOGtwcDk5N3hOckpNSnBxOHEr?=
 =?utf-8?B?SVoyNzhMakd0Z3UyRFp4OVNPeUFUc3NDTnR0LzZwT0xlbGtQcE5WQXphVC8r?=
 =?utf-8?B?OW5VNk1QSHlhUEdWQXV0ck1oSVg3YWdlV0dsNmY5d2lFelpJRDBRV0s1SE0z?=
 =?utf-8?B?RFhUZm9McjQxdHo0SHdVZEE4N3libUlJWXlZSHRGaDJIUkJnNWZSdDc5SFlP?=
 =?utf-8?B?eVR5K2V2WkdXMVBFMEhVekJYUVEweUhNWXhxTnFvNURlRVhkNjUvTzhIWUth?=
 =?utf-8?B?aDAxM3VRMVRxbFcvbEloMTN3bGFCWUhPY2owZzRVOWJtNVp0eVk5a0pvbWVw?=
 =?utf-8?Q?gJO3gS44Y9yezIODEHMJBGM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc4da17-f3d6-42d4-821b-08dd669bee67
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 04:10:06.1971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2x9XM1hpe5Qh0CZ9WE7mvRRSsDL+FcF+RpLRk9ibyHY8d3R2Ef8PfpBv6w0pz96aJdLwfO7a4ScFT6HuVom1j560V7qa1ijw38vC5g4qsW2vfBi5oBjOmzN+ERXpa0S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5371
X-Proofpoint-GUID: VeV-jkWZzVXiU1Pd-iRixr9ixdaRS3Bp
X-Proofpoint-ORIG-GUID: VeV-jkWZzVXiU1Pd-iRixr9ixdaRS3Bp
X-Authority-Analysis: v=2.4 cv=Jq3xrN4C c=1 sm=1 tr=0 ts=67da43a1 cx=c_pps a=+1/HLBYLL4tv2yjlBWnClw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=pGLkceISAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=J3049UBQN8VkXaC3JFQA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=e2CUPOnPG4QKp8I52DXD:22
 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190026

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVHVlc2Rh
eSwgTWFyY2ggMTgsIDIwMjUgMTE6MTcgUE0NCj4gVG86IEVuY2FybmFjaW9uLCBDZWRyaWMganVz
dGluZSA8Q2VkcmljanVzdGluZS5FbmNhcm5hY2lvbkBhbmFsb2cuY29tPjsNCj4gS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47DQo+IENv
bm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEplYW4gRGVsdmFyZSA8amRlbHZhcmVA
c3VzZS5jb20+Ow0KPiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgRGVscGhpbmUg
Q0MgQ2hpdQ0KPiA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1od21v
bkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBkb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBkdC1iaW5k
aW5nczogaHdtb246IHBtYnVzOiBhZGQgbHQzMDc0DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBP
biAzLzE4LzI1IDAzOjAzLCBFbmNhcm5hY2lvbiwgQ2VkcmljIGp1c3RpbmUgd3JvdGU6DQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdy
b2VjazdAZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiA+PiBTZW50OiBG
cmlkYXksIEZlYnJ1YXJ5IDI4LCAyMDI1IDEyOjMzIEFNDQo+ID4+IFRvOiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPjsgRW5jYXJuYWNpb24sIENlZHJpYyBqdXN0aW5lDQo+ID4+IDxDZWRyaWNqdXN0aW5l
LkVuY2FybmFjaW9uQGFuYWxvZy5jb20+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4+IDxrcnpr
K2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBKZWFu
IERlbHZhcmUNCj4gPj4gPGpkZWx2YXJlQHN1c2UuY29tPjsgSm9uYXRoYW4gQ29yYmV0IDxjb3Ji
ZXRAbHduLm5ldD47IERlbHBoaW5lIENDIENoaXUNCj4gPj4gPERlbHBoaW5lX0NDX0NoaXVAd2l3
eW5uLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gPj4ga2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4g
Pj4gZG9jQHZnZXIua2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiA+PiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IGh3bW9uOiBwbWJ1czogYWRk
IGx0MzA3NA0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1
cy5oIGIvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1cy5oDQo+ID4+IGluZGV4IGRkYjE5Yzk3MjZk
Ni4uMjg5NzY3ZTVkNTk5IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3Bt
YnVzLmgNCj4gPj4gKysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1cy5oDQo+ID4+IEBAIC01
MTIsNyArNTEyLDYgQEAgaW50IHBtYnVzX3JlZ3VsYXRvcl9pbml0X2NiKHN0cnVjdCByZWd1bGF0
b3JfZGV2DQo+ICpyZGV2LA0KPiA+PiAgIAl7CQkJCQkJCVwNCj4gPj4gICAJCS5uYW1lID0gKF9u
YW1lKSwJCQkJXA0KPiA+PiAgIAkJLm9mX21hdGNoID0gb2ZfbWF0Y2hfcHRyKF9uYW1lKSwJCVwN
Cj4gPj4gLQkJLnJlZ3VsYXRvcnNfbm9kZSA9IG9mX21hdGNoX3B0cigicmVndWxhdG9ycyIpLAlc
DQo+ID4+ICAgCQkub3BzID0gJnBtYnVzX3JlZ3VsYXRvcl9vcHMsCQkJXA0KPiA+PiAgIAkJLnR5
cGUgPSBSRUdVTEFUT1JfVk9MVEFHRSwJCQlcDQo+ID4+ICAgCQkub3duZXIgPSBUSElTX01PRFVM
RSwJCQkJXA0KPiA+Pg0KPiA+PiBNYXliZSBzb21lb25lIGNhbiBjaGVjayBpZiB0aGF0IHdvcmtz
Lg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+ID4+IEd1ZW50ZXINCj4gPg0KPiA+IEknZCBsaWtlIHRv
IGZvbGxvdyB1cCBvbiB0aGlzIG9uZS4gQXMgb2YgdGhpcyB3cml0aW5nLCBteSB1bmRlcnN0YW5k
aW5nDQo+ID4gaXMgdGhhdCB0aGUgZHQtYmluZGluZyBzaG91bGQgbm90IGV4cGVjdCByZWd1bGF0
b3JzIHN1Ym5vZGVzIGZvcg0KPiA+IHNpbXBsZSBkZXZpY2VzIGxpa2UgdGhpcy4gVGhlcmUgaXMg
YWxyZWFkeSBhIHNpbWlsYXIgYmluZGluZyBhcw0KPiA+IG1lbnRpb25lZCBpbiB0aGlzIHRocmVh
ZCBwYXJ0aWN1bGFybHkNCj4gPiAiZHQtYmluZGluZ3MvcmVndWxhdG9yL2luZmluZW9uLGlyMzgw
NjAiLiBJIHRoaW5rIGEgYmluZGluZyB3aXRob3V0DQo+ID4gdGhlIHN1Ym5vZGVzIHNob3VsZCBz
dGlsbCB3b3JrIHdpdGggb3Igd2l0aG91dCB0aGUgY2hhbmdlIGFib3ZlLg0KPiANCj4gSW50ZXJl
c3RpbmcuIEkgYW0gbm90IHN1cmUgaWYgaXQgcmVhbGx5IHdvcmtzLCB0aG91Z2guIEkgbG9va2Vk
IGludG8NCj4gdGhlIHJlZ3VsYXRvciBjb2RlLCBhbmQgSSBkb24ndCBpbW1lZGlhdGVseSBzZWUg
dGhlIGNvZGUgcGF0aCBpdCB3b3VsZA0KPiB0YWtlLg0KPiANCj4gPiBXaXRoIHRoaXMsIEknZCBs
aWtlIHRvIGtub3cgd2hhdCB0aGUgc3BlY2lmaWMgbmV4dCBzdGVwcyBhcmUgdG8gY29udGludWUN
Cj4gPiB0aGlzIHBhdGNoIHNlcmllcy4NCj4gDQo+IENhbiB5b3UgdHJ5IG9uIGhhcmR3YXJlIHVz
aW5nIGEgZGV2aWNldHJlZSBmaWxlIHdoaWNoIGRvZXNuJ3QgaGF2ZSB0aGUNCj4gcmVndWxhdG9y
cyBub2RlID8gSWYgdGhlIGN1cnJlbnQgY29kZSB3b3JrcywganVzdCBzdWJtaXQgYW4gdXBkYXRl
ZA0KPiAoc2ltcGxpZmllZCkgLnlhbWwgZmlsZSBhbmQgd2Ugc2hvdWxkIGJlIGdvb2QuIElmIG5v
dCwgSSBoYXZlIGFuDQo+IHVudGVzdGVkIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2luZyBhbm90aGVy
IG1hY3JvIHdoaWNoIGRvZXNuJ3Qgc2V0DQo+IHRoZSByZWd1bGF0b3JzIG5vZGUuDQoNCk9rYXku
IEknbGwgdGVzdCB0aGlzIGFuZCBnZXQgYmFjayB0byB5b3UuDQoNCkJlc3QgUmVnYXJkcywNCkNl
ZHJpYw0K

