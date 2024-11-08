Return-Path: <linux-i2c+bounces-7880-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691D19C1727
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 08:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CCBD1C22497
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 07:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C90A1D1735;
	Fri,  8 Nov 2024 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="T9BRcbp9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED451197A82;
	Fri,  8 Nov 2024 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731051880; cv=fail; b=MSokgVPFqZrZJ7vUOW1JmOpz3SDHlosQKzkEBnxD864uklkRfVWOOe6SsRYNBPhMeY8+Ym26JdyqGCEP/Nms70Nn2n4zczPF4Nkdyg8SQY6QcWM2xjrf+yFWR3zYffYcEPTpepWBMWzU3VyD7CpNPqN6kKwpKmM3D7fjqOsdu5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731051880; c=relaxed/simple;
	bh=kMLJt4mF7iUAa5j2SJtisOs+BOqKRKBPAoiLMOMUvbw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AUgyKZ2VD+dXEyxAz2zrTEuUZI7H9Xst4CmM1xrP1qhHAH5JD2yq2JmDEMmzwNdRrRipP7rS2DDrcpgN/LlmXNFjpfh19gGgk93QVkQUQppqUrkaX/pBmHy/Lb3KPsuhm6AJAycz2WgwGygtE5vFPkDlQs/842gSC66npm7fONA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=T9BRcbp9; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A86ptgo013105;
	Fri, 8 Nov 2024 02:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=kMLJt
	4mF7iUAa5j2SJtisOs+BOqKRKBPAoiLMOMUvbw=; b=T9BRcbp9HdPNdm8uILEEj
	3Zid1aoK/TpMLePZQrl21hF8js9rSo1DlZWZ0jm6f1Zzu8LbzcE/dqEU3sWXFqiP
	aLTcVXdhsqN2ldgXqFAkrqchNK/r6/sj6FCfNzjhhQuzFUD5i7QFr2TK/DqD6zuj
	fNMietST9ofkQ4RrsSRWDQqaZp6A8aRW0QNihLhbXjFOopSOCsjUfQM7/RirwYP4
	cSV1Sobv4jgJKT40l6xNjPhSmWNVId5t4AIHP4vIrmykasqYQCD2qRHZ8wPm4w5h
	FWUNNg/IEYrUyRGWhysuRuNm4mcj/+rmNdQy3YamaGOJinl8s4z0N+zJ3Q1B+DPq
	Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012036.outbound.protection.outlook.com [40.93.6.36])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 42sdrh868a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 02:44:04 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOGc0rd0stUrxQ4CFuFK2Hb8TI/KE1XF4ZHnR8uGmJRth8apO+85IFGlwSnS4zOPzreCmHwCYeUZ90XkT3ZLB2XAZo4hrBssyBWhomChkGPdxh1ZA6UgkDiIjqHvKMjHKgXAD+tXGdI/kXX9f9ZQyMBEDbONgWoQxd3QIFDJw4DcBtnD4AEEK5V8n0tt8HOPlQPtlE/fRTXJ7kWxGWbueVW8dhU+dOmJcKyM2s+Lp4GvpmP4WkXsE+Wm1Mz7ZSM4qpMz/T1Xw6xXVb2n0OOwa26Jlz88BHo//YpAlLauuSlVEiWSgAzBkifKSSja/FOZmdVuDBjKV6mevEeq2AeznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMLJt4mF7iUAa5j2SJtisOs+BOqKRKBPAoiLMOMUvbw=;
 b=p8yGch9ITRkFrXVegIH3C398NJHDvgeNOSpF+Jm+sbCU9uA878iyUvtRuw03aR2dNT7GxvcQGfOFJJCnrD6dldxef2j4v5VyLpUoqYUQzz5iTtfQQ63POvzIJVjb+H25qP4Sa+zKD5ojWJkymy41pZ1ndZswHfv8I2n6F7NsOvmraixy+fGcJdMAtUnEJ2mgCRVMBYy10X5N1bT/CkMz0QjKK2+f+45PwQw/LWEPMqTYNv/2lgnaQ0ViX0BUsKSuLceI+Sg0SsCWr+BDhwdXKOFY/wFqSnHKMbVueGFkxPJrsZQHJD092eq55s1RK1lfeoExEvpx9oBYf8MPc5UFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 07:44:01 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 07:44:01 +0000
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
Thread-Index: AQHbL/lfH4HqsXF5fUulgDo4VShnB7KrDXcAgAHo9YA=
Date: Fri, 8 Nov 2024 07:44:01 +0000
Message-ID:
 <PH0PR03MB693869F52D961845C8388D258E5D2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
 <697a9596-f5aa-48d0-ad26-ebe06b831ee8@roeck-us.net>
In-Reply-To: <697a9596-f5aa-48d0-ad26-ebe06b831ee8@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWTJWdVkyRnlibUZjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB6TmpWa01EVXdOQzA1WkdFMUxURXhaV1l0T1RNMk9DMHdOR1U0?=
 =?utf-8?B?WWprM01EYzFNemRjWVcxbExYUmxjM1JjTXpZMVpEQTFNRFl0T1dSaE5TMHhN?=
 =?utf-8?B?V1ZtTFRrek5qZ3RNRFJsT0dJNU56QTNOVE0zWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STFNVEUwSWlCMFBTSXhNek0zTlRVeU5UUXpPRGt4TmpneE1UY2lJR2c5SWpJ?=
 =?utf-8?B?ME4wVkZaazlIUVZsQk9HczVPR3hwVldaTlZWTkhORkI0TUQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUkRGV04xZzBjMVJJWWtGbE1sUjJhVGRNTnpORVpE?=
 =?utf-8?B?ZGFUeXRNYzNaMlkwNHdSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|SJ0PR03MB6567:EE_
x-ms-office365-filtering-correlation-id: dd6ea5d8-206c-4c78-7391-08dcffc91cb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1FrNDN0U05hMlFIcmFsTVloTVFhQTQxQ21tMTZEZTVldFZaRDVlV2ZuUjNB?=
 =?utf-8?B?c0wvdzAwanRIQ05Vc0d2SVJpQnhyMHAxRTJtc3JvVWFMbVFXZXlHdHN6N29V?=
 =?utf-8?B?U0d5ZUtqbkZtVDFuUmRxYVdwV1Z5MWFCK0hrM0lDdHczY3BualFpTHdjUS9y?=
 =?utf-8?B?NlYzc2JMZFZuU1Q4djRjRTNmNWFtNVZaMU5kdlc0NktsZlNibjYrV3BoZXk5?=
 =?utf-8?B?VnM3b2R0Vm9DWUFFcnZzNmFKNGdDV1BhSWFjN2d3eWN5YldUMUE2clhKUDNL?=
 =?utf-8?B?c3VJZzgzNHBVQUJ5ZGZhaFFpd2I4MmxKMXRocThiMDlVcWo4aHBieGpxMVlo?=
 =?utf-8?B?eUJBNDB3S1NraC9hYWNFc05SOTRFemNNblhpYnNOS05ndWFUM05WaFUxVDlJ?=
 =?utf-8?B?R2g0WTdublY0aGVBR0ZOdHJxM3owQ2pBVzhyQjBwNTJNeFI5MGprUVFDY21k?=
 =?utf-8?B?bDZyVmxtamVXdXlTdEdkVHJCcGR4ZFFqeGhlV2JmUlZqVWhJQ2hsOTRONjdo?=
 =?utf-8?B?VDdlUysxUEgyTHJnMDlpS0VrUXY0UHpmRDNaUnE4UVM3Yk9ZS09SMkxWZElB?=
 =?utf-8?B?c2pJcmQxZmdtM29ZZGo3M2ppcTJYUkpIRHZZUjVoSFhZcjc1ak4xSUd1a001?=
 =?utf-8?B?Mlo1TjdLb1hieVhVZ2FPQW0vYThUczBESVNHdjk2TzlHZWFKanlIVGI5S1hq?=
 =?utf-8?B?SlJwTG1PbERUK1pGVmlxOW5EM1loOGpBenFoY0lHelFVUzJ4L0NFS3hyS05z?=
 =?utf-8?B?c3B2em94Ly9rbHI1ajJUNDdmRndhbFA5emFxM0RtMmdrUStaOERmV0h5NzNt?=
 =?utf-8?B?YjJGcFJsc0d0eE5BS0krdHlUS0RvTlpVNmJxR0w1UVBWNEdNSFl0eGNPSXRu?=
 =?utf-8?B?WEkrSkZIQjM4RW9aVHhJZ2R3SmN0cnVWeStRaThXZVpENzZQTWtaUEkwajFK?=
 =?utf-8?B?TDVMcVhoTzc3Ri9lWGZzaDhzbnA1K09jbktWT1E2MndEL2NwN3ZLM3lic2dG?=
 =?utf-8?B?M216Nkw4Nm5nZDFZR0xWZzkzOUoyT0xwOWxSVjB3OXNSMVhsdFliS0N6UDIz?=
 =?utf-8?B?RkFPOVAwelZhY0VlUTdKeU1xUUFtVHFWeHdZRGtJdjF5enJDYU1xZGVVNXZI?=
 =?utf-8?B?R1lrc1RnUTFpMFlCYVkzaEFVY0N0cHRzc0FSVHFsRnZNMkZMallZa1N1U1Fz?=
 =?utf-8?B?QmNTWDNRUUIxdUU1MUFjVzBPbDJMZTlobnZzUlcrQisyWkY2YWgvcmdYUEJJ?=
 =?utf-8?B?elVZM1lMeThJY29wZmVLMmxPSzFqSm9ZY3d4MUc0Rk1yVnFFaUR3cWtoTUs4?=
 =?utf-8?B?d3c0bmtLeFJmZ3ZOblNzTlB0UkNDS1JXNnR5ZEtBVGVFR0t4bUVtaHowaWRn?=
 =?utf-8?B?UFRpZC9LdDIyMFVoNnVJOWRTYmUzWlUwS0lEQ2JxcDlnYzZhbmhxbXYrWkxQ?=
 =?utf-8?B?WEh4bVpDenMvS0prTloxRkY5SGI1QVRBV0NxTUZPcjQzTEZJdXJDeVNRQ1l5?=
 =?utf-8?B?c2RTWksvTHpYUzJLNWtDMGl4VjJhZHVjL1hDYWs5bUZaTWFEWEtyY2xjM2pB?=
 =?utf-8?B?bks0YW8zNEROMEc0c3k4QzJhRjZrZ2prcFU0NW9EeGV6ZUdjZ3E4Z1hBaU1z?=
 =?utf-8?B?cTRSYTltLzhBcDRXQzczeXQ1K0lJNVZha1lqMkF3ajVkNGUxZ2o0U0dObGwr?=
 =?utf-8?B?WFgrbUFVcnU3UWNJRkpaYUE2a043SGsxbFdnbENMVHp0RVVHNTdlcWxMRE1S?=
 =?utf-8?B?eFhTakdiaElQT1dWUlRSZXo3NmdNT2VVL0drSUVaaTNwc0tmSnZ3VEhGRWR6?=
 =?utf-8?Q?K5to9on4R9M+QMPstrTsONji7SQlx8wAnqtFk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2JhaTY2T1c0Q01KeWdUM3RQd0RhOFU0QTNUS1l5ck9FVmNGOE9sbDMyNG9k?=
 =?utf-8?B?U3FHajJHc1o0VXAxOVVxc0wvRmZ3Y3FGV0VDeGVib2Jodm9WYU5sUnQ0aEJu?=
 =?utf-8?B?UkhsVzlXeTAwZ085Z3VkVUU2VDZSZmY2aW5jdkU1Vkt2WEZPMldHSlV5M1I5?=
 =?utf-8?B?UFFOQzVpTWVzOTNiNmt2SHlrVUNxcTY0L05EdnB0eUc0NzRRaFUvdEIzVHR0?=
 =?utf-8?B?NmFJdVlOS28xV2dUV2ZoNS9Tc0dyK3RDSnBxdThFRFc3NGRuT3FMMWUrMThH?=
 =?utf-8?B?L05LT292Z01xL2RVN1FFRDdIY2FoUGlBaGF5L1dLbzFES3pjTC9rNnVQR3E1?=
 =?utf-8?B?MnpBcE9HRUt5Nzk0UGtYUnVFNFFGLzVneFczeHRlT3VwcjRBYnMyUzFNUlF6?=
 =?utf-8?B?aWtMazlBbTg3T1NxTVc4dHdvQXgzRjZ2c01LUGhMTXpubk9CN05Ddmc2TlYy?=
 =?utf-8?B?UW0rQnVMRUN1V0NXeENRSzlPMFRQbU5qOGh0ZXV4R2l4Q21WcWIwNmhJRGxl?=
 =?utf-8?B?MmZNYW1sU3hFUWt6c1NQbDlkK2ZXTlJyTVJrNzg2YjhEVG1SSVFrOVJ2WEZI?=
 =?utf-8?B?eGxET2dISlExRnYzM0lZOWd1bCt5U3dYdXAzYzl3dlVIWFZtanE0b1JRL1Fo?=
 =?utf-8?B?QjExK2NDRUVaNks0ZGIxd2lBc213WmNDcFp3MWRRcE9FTlg5V29TSVIyQTVO?=
 =?utf-8?B?R2xhTFlhdTQ1TXYvMHVPUHhTd0RWVzNKZDBrYnlKL2tkVnR2Mmp1UkxNWGZB?=
 =?utf-8?B?eGgrQ25rbHkyRFlkTFRSWUFqSnBCN3VEdHZjTmFhSU4zbEEwK2pDanY2a1Rp?=
 =?utf-8?B?WkJNMmRjaGs1THlWbFZuVldQeHhNZG5jOTExNXMwRlcyU1pTYWpOVlJ0TlMy?=
 =?utf-8?B?em1SMCt4RWVPc1RoekRDZ1JkOE91TjNEWVZYV28waXA0L1R2Zm9hNHBmYzU0?=
 =?utf-8?B?b0ZGd3crL3NSUmpTRTJ6WDRIb1dUcVdMY29xYVpuRkxVVCtGaXVKUTNnQzdR?=
 =?utf-8?B?MEF6U3V3dEUvajBTeDBqWmNoZkZRVE1VMkpNQ1NSS25jRklSRmFnU2t6RHN2?=
 =?utf-8?B?RkFuNUV3WlVycFlIQXE4enJHTGFldXZ0WnlMS0dmU0pvLzkwaGI4RzZwc2I1?=
 =?utf-8?B?bkFWb0hmUkpyTFY2aVNkYXFyYzZRNm45MWhiV3RGMTNZTzhCM0JudE1lWjl1?=
 =?utf-8?B?QVpjRmdJWWkzRVpjK0p1M2piY3hiUjlHMlBSV2drY0NXRnVjVGtnc3pna1FX?=
 =?utf-8?B?SE9Va2ZId3VIeTQ5bEFZQWt6TzVJRHlTVWFCYm14V3BWRG0va1VzaXJMb3lC?=
 =?utf-8?B?NEgyWXg4ZSswN21wTWsrWUxISVRMYjJEZWYzV0ZHR3huOVcwWEZwK3pQWnJq?=
 =?utf-8?B?dlpGeVpvTGdWcENadm5qd0hYeHZCMG1BRXFRQVVmT2oydGxSRVVCYWtrZlNV?=
 =?utf-8?B?U2NFT050cTcyeVB3am8vYmFpNGNvZHErL3ljd0tQeDFvb0wzR3AvUkNORlVx?=
 =?utf-8?B?VUtkZ0thUUFIbElSSmhGMEN1cVAxRDM5akVZblRON1kwb0RZbE9PNDBmRFBU?=
 =?utf-8?B?WTF3MGpsM1ZVYUthVk9WNHRLekcvTFVaem9ISG5aVXRRUzFHWmRoaTlzNENo?=
 =?utf-8?B?R3BFamxkYmxBbGpWa0didUFkbWoyZ3BXbkZSVElSYVZxeUZ6R1p0TkVZVmZN?=
 =?utf-8?B?TzhudHJ0MjhwRy9Ic1J5K05pK0NTVmFybGxmbmFGaXFnZ1NldEJNSjNJSzQv?=
 =?utf-8?B?cjBSaG9QZWUrdnlEdGV5emhQWHd6STUweDdrSFNmYktHQlNjNkxTVlU4WmJw?=
 =?utf-8?B?VU9aL1BwdE5RMEt5Y3NmYUFwNnFoUzBnK3lxZUg4dVBYSUJ6L1ljcURxUEhE?=
 =?utf-8?B?NHlVMW1CMGluK3ozdjlkblF1dkhSWGlYR1NTb2Y5bUlTRmxHNWF4bmQ5YVJZ?=
 =?utf-8?B?TzM4NzArY3pIRkl4d0VRQzhPNG14MTJJeWd6NmNvclBoeTM2eW01RHErRXZU?=
 =?utf-8?B?MStpU3kvV0U5anlQR3ZuejkzRFdVR1dUSHozSmQ5Mk1keGFUNFV2Y1BxK3Va?=
 =?utf-8?B?V05lek5obDVtM2JaaDduMHcycm8wZjRXUTRUOXVpSUd2Qk1McHpIOHErSlE5?=
 =?utf-8?B?RWxVRGJjcTFCU0NBem1id0ZoWEs0dzVYV2g0UUpOVUVLclkyUGhMRHJPM2RB?=
 =?utf-8?Q?KHw5iuTMQHf8aMFEsg/Alns=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6ea5d8-206c-4c78-7391-08dcffc91cb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 07:44:01.4788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3gT2ocxRzWnt8LvhvSSegbok9QxBMhKYREel46T+JlMNquWUyAVn5U/sPDmWzvedlsup+pwFJq/WF/q3WPI1M9gaJLV5XSHr5eUM1BHy4M338ia6hDL7LokI0SDN4HJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567
X-Proofpoint-GUID: sCjrrpuOPmuOlNPAH4nYJygqXDSNbY7D
X-Proofpoint-ORIG-GUID: sCjrrpuOPmuOlNPAH4nYJygqXDSNbY7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080063

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVGh1cnNk
YXksIE5vdmVtYmVyIDcsIDIwMjQgOTo0NSBBTQ0KPiBUbzogRW5jYXJuYWNpb24sIENlZHJpYyBq
dXN0aW5lIDxDZWRyaWNqdXN0aW5lLkVuY2FybmFjaW9uQGFuYWxvZy5jb20+Ow0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
DQo+IGkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiBod21vbkB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IEplYW4gRGVsdmFyZSA8amRlbHZhcmVA
c3VzZS5jb20+OyBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsNCj4gRGVscGhpbmUg
Q0MgQ2hpdSA8RGVscGhpbmVfQ0NfQ2hpdUBXaXd5bm4uY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJv
YmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47
IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFBldGVyIFlpbiA8cGV0ZXJ5
aW4ub3BlbmJtY0BnbWFpbC5jb20+OyBOb2FoDQo+IFdhbmcgPG5vYWh3YW5nLndhbmdAb3V0bG9v
ay5jb20+OyBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT47DQo+IEx1a2FzIFd1bm5lciA8bHVr
YXNAd3VubmVyLmRlPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gaHdtb246IHBtYnVz
OiBhZGQgZHJpdmVyIGZvciBsdHA4ODAwLTFhLA0KPiBsdHA4ODAwLTRhLCBhbmQgbHRwODgwMC0y
DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAxMS81LzI0IDE5OjA5LCBDZWRyaWMgRW5jYXJu
YWNpb24gd3JvdGU6DQo+ID4gTFRQODgwMC0xQSA1NFYsIDE1MEEgREMvREMgwrVNb2R1bGUgUmVn
dWxhdG9yIHdpdGggUE1CdXMgSW50ZXJmYWNlDQo+ID4gTFRQODgwMC00QSA1NFYsIDIwMEEgREMv
REMgwrVNb2R1bGUgUmVndWxhdG9yIHdpdGggUE1CdXMgSW50ZXJmYWNlDQo+ID4gTFRQODgwMC0y
IDU0ViwgMTM1QSBEQy9EQyDOvE1vZHVsZSBSZWd1bGF0b3Igd2l0aCBQTUJ1cyBJbnRlcmZhY2UN
Cj4gPg0KPiA+IFRoZSBMVFA4ODAwIGlzIGEgZmFtaWx5IG9mIHN0ZXAtZG93biDOvE1vZHVsZSBy
ZWd1bGF0b3JzIHRoYXQgcHJvdmlkZXMNCj4gPiBtaWNyb3Byb2Nlc3NvciBjb3JlIHZvbHRhZ2Ug
ZnJvbSA1NFYgcG93ZXIgZGlzdHJpYnV0aW9uIGFyY2hpdGVjdHVyZS4gSXQNCj4gPiBmZWF0dXJl
cyB0ZWxlbWV0cnkgbW9uaXRvcmluZyBvZiBpbnB1dC9vdXRwdXQgdm9sdGFnZSwgaW5wdXQgY3Vy
cmVudCwNCj4gPiBvdXRwdXQgcG93ZXIsIGFuZCB0ZW1wZXJhdHVyZSBvdmVyIFBNQnVzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2VkcmljIEVuY2FybmFjaW9uIDxjZWRyaWNqdXN0aW5lLmVu
Y2FybmFjaW9uQGFuYWxvZy5jb20+DQo+IA0KPiBMb29raW5nIGNsb3NlciBpbnRvIHRoZSBkYXRh
c2hlZXRzLCBJIGZvdW5kIHRoYXQgdGhlIFBNQnVzIGNvbW1hbmRzIGFyZQ0KPiBpZGVudGljYWwN
Cj4gdG8gdGhvc2Ugb2YgQURQMTA1NSwgYW5kIGFuIGV4dGVuc2lvbiBvZiB0aGUgQURQMTA1MCBk
cml2ZXIgdG8gc3VwcG9ydA0KPiBBRFAxMDU1DQo+IGhhcyBiZWVuIHN1Ym1pdHRlZC4NCj4gDQo+
IFdpdGggdGhpcyBpbiBtaW5kLCBwbGVhc2UgZXhwbGFpbiB3aHkgdGhpcyBzZXJpZXMgd2FycmFu
dHMgYSBuZXcgZHJpdmVyIGluc3RlYWQNCj4gb2YganVzdCBleHRlbmRpbmcgdGhlIGV4aXN0aW5n
IGRyaXZlciB0byBzdXBwb3J0IExUUDg4MDAuDQoNCkl0IGFsc28gYXBwZWFycyB0aGF0IHRoZSBM
VFA4ODAwLTFBIHJlZ3VsYXRvciBtYWtlcyB1c2Ugb2YNCmZhY3RvcnktcHJvZ3JhbW1lZCBBRFAx
MDU1IGJ1dCB0aGlzIGlzIG5vdCBleHBsaWNpdGx5IHN0YXRlZCBmb3Igb3RoZXINCnZhcmlhbnRz
LiBJbml0aWFsbHksIEkgdGhvdWdodCBhIG5ldyBjbGllbnQgZHJpdmVyIHdvdWxkIGJlIHJlYXNv
bmFibGUNCnNpbmNlIHRoaXMgZGV2aWNlIGlzIGludGVuZGVkIGFzIGEgcmVndWxhdG9yIHdoaWxl
IEFEUDEwNTAvQURQMTA1NSBpcyBhDQptb3JlIGN1c3RvbWl6YWJsZSBkaWdpdGFsIGNvbnRyb2xs
ZXIsIGFuZCBib3RoIGhhdmUgdGhlaXIgb3duIG11bHRpcGxlDQp2YXJpYW50cy4gSW5kZWVkLCBp
dCBtYXkgYmUgbW9yZSByZWFzb25hYmxlIHRvIGV4dGVuZCBleGlzdGluZyBkcml2ZXIgc2luY2UN
CnRoZXkgYXJlIGV4cG9zaW5nIHRoZSBzYW1lIGZlYXR1cmUuIEluIHRoaXMgY2FzZSwgY2FuIHRo
aXMgYmUgZG9uZSBpbg0Kc3VjY2VlZGluZyB2ZXJzaW9uL3Mgb2YgdGhpcyBzZXJpZXM/DQoNClRo
YW5rIHlvdSwgDQpDZWRyaWMNCg0KPiANCj4gVGhhbmtzLA0KPiBHdWVudGVyDQoNCg==

