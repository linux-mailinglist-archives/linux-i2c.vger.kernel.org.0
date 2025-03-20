Return-Path: <linux-i2c+bounces-9935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 049EFA69F1B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 05:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2ED8A3B68
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 04:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBB91DE4C9;
	Thu, 20 Mar 2025 04:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HQ7U2/FO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17D1ADC7D;
	Thu, 20 Mar 2025 04:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742445626; cv=fail; b=AX+ZXh2CSZ4tq9uHvNpcnUYIdtZJPwNu+G832giKGSGxS5W+nLppxwA6a2jLrs6TBavQ6h6DXd3r7nVuQvWHSEx63nPkTXq2EfBpdJJVJdbuFc+noVN2YCBMogU43ALWYsGsODw11dmWie/sXXmoV5noS/tcgHTY0dcrn3bPwBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742445626; c=relaxed/simple;
	bh=BRJGaip2RZHxdrwWegVQg4WU9aKqEgYpqymfdb59XZ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lTRzPZEHBkPrDh0EIMgjtG3Nih2lLAirm1487C4CP1GNnKcJnmAXrN4eWey6F+0G5/z7dgZhNK/ZWVs43Vcnb52Iwckzhjq/R3gYS33TFcrJqdOKHgIbM3vIV+BUuXFrecaB+emR301w6DPxtJxq7wuxlMiSdTY9hn6MxtzvH+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HQ7U2/FO; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K3a19q030512;
	Thu, 20 Mar 2025 00:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=BRJGa
	ip2RZHxdrwWegVQg4WU9aKqEgYpqymfdb59XZ0=; b=HQ7U2/FOWZ4LXiuABaYEI
	Am5+HFB7eMCE8BKk8LHS7GubdzdHmozhcb1p3aP/CHBOr16L9g8/+dAYYxsg2xhq
	vkscu3+Kv9nS/7BPrOVmjmPCzL6Wh4zKVWyTI2PUVOt4Shf999196BVrwKjaNzhB
	+khVkBXksrn/4zItBVNhn8FpaSfZYPA05751gYfAoMPVHKa9oUSDadi07Ne+aoON
	KHPENBWseaieC7DfT6Li7PHj6KTfiN8UMcs1uTR5a47+fgToT2xN5fgKAyUcXO2a
	B6Lk3yMPBySx4yHghNyzjX1RL/kMk4+GRS/6UPmquV0KKPuO58whD5iGkbXiryPP
	A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013078.outbound.protection.outlook.com [40.93.6.78])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45fwvmmbu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 00:40:10 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQfz0cLK+pmMXaZ5tQvh8hG0TXwDlf2YzE5GlYIbcLDcjVy5qAP/u6E3nwQDEns62QQacrIh2e00Plp2zldQSoFMt9LW92+3hB1WXfjRezgJjSbzZUnqSxK8q6iCV/gH3PtIRna59W26+s74a68e0JQK5HOqlgmP4MQF4rn/ohzg6lcpiYdauhXT1wffZRCnSUDr6KKNDvQWVTsmiZZkIzRdY7uH247gZqfjttPZbGYrwfs+RUgpnmL0V0dc8O/JK/hF1DMW1xggsTpKu3Xhr0ZMJBgfn0nbvFZhxnOZZOtMBIoE0igELHncpT3+ehbyuuUm+1d2uhZwuhAyDhYZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRJGaip2RZHxdrwWegVQg4WU9aKqEgYpqymfdb59XZ0=;
 b=mUjYENMZVHN+Ad3LqCD7NMqpAjOTSrxCjwRjpr9zXDFEIgeZJC95pxHZxkBUx4ZHHsF1EFmsF41YStsCHf0OOg3KWifdM1EYs4vaZZtrJbqz7g95L/hHEXACRbOli1wVyzEVlhmeS4jnOZgETABLa409NbcwVb3Q+Tdj0fF9FAvr0BMCyJ6YZfAoPv080Y0/j0la4gNjnknBx1VRY8LmhuYkjqvc49SLXnkUb8eupVZ+66j7F+r06zmDeU76FwN180UAZha4HyFPEu2tQypSWr9bcQe8LcygW2aI6jPEVnJOWtvC0k1TgztLtpxEUJvR/Pk14HER0EJW20+3afAJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by SA1PR03MB7147.namprd03.prod.outlook.com (2603:10b6:806:336::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 04:40:08 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 04:40:08 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 2/2] hwmon: (pmbus/max3440): add support adpm12160
Thread-Topic: [PATCH 2/2] hwmon: (pmbus/max3440): add support adpm12160
Thread-Index: AQHbmUwMEB3Pp++x50yVbYwU9u2pSrN7b4wAgAAAmBA=
Date: Thu, 20 Mar 2025 04:40:08 +0000
Message-ID:
 <PH0PR03MB63517FB4C1D8E8197FBA1316F1D82@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com>
 <20250320-dev_adpm12160-v1-2-8f7b975eac75@analog.com>
 <4c45ed61-5f9e-4e60-9458-3ad1274d0cf6@roeck-us.net>
In-Reply-To: <4c45ed61-5f9e-4e60-9458-3ad1274d0cf6@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|SA1PR03MB7147:EE_
x-ms-office365-filtering-correlation-id: 76bd2152-b7cf-4459-2d55-08dd67694b01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SVlHdks5UTlkSUtDcFZ4d3dySTJMa3NxWWxPUzhCTHZGWG4xaHZ6ZWNYcnZM?=
 =?utf-8?B?Q2VNYmJIbzlNWmI3U2pZbXNyUjZ5ZmVLQk8zRFhlK2w0OS9uN25VR1dhQ3lE?=
 =?utf-8?B?VkdqYlNwcXd0OWZSYVJnZ3FIVFFZVmVyWDFUcEdyQWlaOVpWV2Ezbzk1UTVQ?=
 =?utf-8?B?dVhPTUdyaUk3UkREcjM1QzdpVG9EeHdzd2RwTjd6RlBjQUlQSFpkRXZ5KzBZ?=
 =?utf-8?B?Sk1HMzZ5OFlKYTV6U1ROL3FHQVd0bGJsUS9YYkRMU2xHY1BqNzVFR1psOUpC?=
 =?utf-8?B?Qk5BcDc5KzJWWk5Ha0JwRFcrcURLMnRESzdrYWx2Rmd5QmVyQlNoNEpiOWVx?=
 =?utf-8?B?dVovYjA0YzRqdzhralhrRjkvUHpVN0RnMW5ZM3J3cXhpSzRSTW1obWFDMSt2?=
 =?utf-8?B?dm1QcXpDZEZMN3pXa04rTnRQZFJ4YkJRZ1IyY2RZTzZhaE1HTDlMeHc5bmdB?=
 =?utf-8?B?NVJvZlArOVFrNWpwYmQ4MmhqUTU1QTB1cEdVV2kzcDc5blpNV1NBZEJvRUkx?=
 =?utf-8?B?YU52bFJ2dmhsTzFKUjdNbTEydmp1SkVvWWI2VVR3eG9LbDNVLzZWREs3aVdP?=
 =?utf-8?B?NHpXUEptQVh5UUhXSCtvNUpwd1lZdmJhcWkrc0pXT1dvNkxiZTUzSE0xM2xW?=
 =?utf-8?B?SlYwai8xWVhENDZIYlBrckhEUWkzWEx5VlZsMll3LzB1bGJFVGJsTnYyNEVJ?=
 =?utf-8?B?aTRxYnY1NUpKeFY3V0Q4WVExNHhSd1BBbzRhVGd0VVk3TDhzT1FsUkFzdHJi?=
 =?utf-8?B?WkpteXhQVGFvdXFpQjR1WTJUUVNOS1RJc0UzVXdmKzJXck5yaktrZ3RQWEk4?=
 =?utf-8?B?eXo0NVplczU1cU95MWhnWnRtVzBweXA3cURsOWVOdmUySGJvOEpub2krdDB3?=
 =?utf-8?B?L0JIdUxQbFcvTHhSblRveDV2WlNnVmlLUWREYkordUNoUVhJTmxPTzhhR05M?=
 =?utf-8?B?V3M1cjc0b1dIZU1EQks0YWlYZGtKOVUxbUgybFlBSUp6VXJRU2RyYXNRYmVy?=
 =?utf-8?B?OC9HYlh6Z1BPc0c0ODRzU29MTkNGNVMxWTZDR0xIOHE4TEU0S25tdnp1NFk5?=
 =?utf-8?B?MTIrR3k0MzdzSVA3L3ZJUGhadFBzazY3ZHp2WVhvZUR4OEcrelhWajF5ck91?=
 =?utf-8?B?NVVHMWwzRVFYVy9DQmVnNFQ1TVVwSWhQOW5QVGt1bjFaLzZXVDl4RlIyV0tH?=
 =?utf-8?B?U25mZXpwM1d0OEhrYlg3VE9WY0dPSVIyRUxENXhVRDFVZGxQeXd5bGNXaGt1?=
 =?utf-8?B?a3JEODB4cWswUUIwZEltZkpPMVl1cWZEVTlQMCtNYkR1Sy9aTDdEc3plcXRK?=
 =?utf-8?B?L2FlcCs5MHRwZXdMVTNOaE5qL09NRXNzZnBvOSsrQXd6d0tkN3BUeFdUSjlq?=
 =?utf-8?B?TEo5RG5CdjlYZnpEVmtXMGVvVWpWemZrZTZ1WlRHODNIcW9iZXh6YW15UExx?=
 =?utf-8?B?SG9RSmhHQlVqdHh1TWl6QXJrNXMweDcxMkJVSGo2eVZjY0R5SkJFKzZ1Nytt?=
 =?utf-8?B?UzdUN3dsNlNtSGxKR2dWRWM1aW1tNWJGQ0FHUmloNElSZ0pUdi95VFBJQWg1?=
 =?utf-8?B?cHJXcEhQcHZhcnBETjA4TTVNVSthZ1B3eHdkSmhxNmNEenJudFh6b0RqYVM3?=
 =?utf-8?B?VnRpVmhBOFZEaEkrbzZ4RE4waGRGdFNsQWdCOGF4LzZRekxicEYxS3p0TWxN?=
 =?utf-8?B?UXRSMVIyL1VneTJLcnQ3cWJZeS96aXFWUTQ3U2hDVDdvaVVQdlRhZmthdFVM?=
 =?utf-8?B?L2t3MVF6WGIrZ29pRlI0dlZ0ajBtbjRZckJ5ZFhzbWE0RFJEUlp6ZFQ3ekEz?=
 =?utf-8?B?NmVUdVRuQWJaakNuVEJFUUFPQ3ByYmUvaHRTQVE5c1RZN0lLb1g0YlVYVXJl?=
 =?utf-8?B?SnVJZTVuNmNuK2Z5bDd3Yk1rMEM3VlhlUVNwZU1VcEFSTjh6SXpiYmlPMjJR?=
 =?utf-8?Q?b+7C3dDjceekHLQ2E5FKuxIkSJ3HNiG1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEVJY0trVkh1SUwvaW5DbExDU3hvTFF1cTI0aWgyVXp3a3NGSzRyUDNwdHE3?=
 =?utf-8?B?dkkyZElwZWtZenpUNDZDVVdXcVpLU0lYRGd1eTV4MllHTVNnWVJ3aVJsMlMw?=
 =?utf-8?B?UTJ4R0VPRmRvT0k3UE1YdzVRZHZRV2JRRFFTOTlVQXdGalg0UEhTdnR2YWZu?=
 =?utf-8?B?SDRTcGdYdWZWZUtsQ0pDRXphWnAwOVFDMEdRcEd5ZnUvazFReHF5OGtrUitS?=
 =?utf-8?B?ZEdvRXNjZjV4aXNXTnZoeFJKRGQvTHpMWEhLREZ2UDhHMURCMXl3R1ZBYXdZ?=
 =?utf-8?B?OWVmRFZzZ2x5YkN4RDhPeFArYnF6RjVuSnlQQUdNYmRGaUp5UjZXYVlRcEJ6?=
 =?utf-8?B?Q3E4cFNGN01pUGRNV1ozMU9xbzE3ZjIwKytXRkJsQi9vOG5VZXo2ZUN3bEd5?=
 =?utf-8?B?QUFhTExzWStQNGZQNjUyZnExVG5NUWJZYWlLQW54K0JqZDRZdjJZbno3Y2lq?=
 =?utf-8?B?UUppVHZlM25hdjFXZGVtWTBaODBMOGV1MlBld245QS92dHNVMVBTbzBSNXU4?=
 =?utf-8?B?SnVKSGNqbEYrbGUrOUw3VGs4YlNBMncvMzZhSUd5ZTh0czBRRmlNWjB0NzF4?=
 =?utf-8?B?V2t6K0xhN1V0M1JPUTdmZ3hCQll3OWdLZmErVTMvVUhQVHJPMDBYOGlmV2t1?=
 =?utf-8?B?cVNYdVZVa3MzVm1JOFNZU0djT0l6M1RCdXNHaExRaDdRNlMwanhKMUd5N1lL?=
 =?utf-8?B?L1BlTFFZOGlXQk44ZmJOMGI0cHA0a1pNa2tidjViSXptTHJENFJ0T3I1SkRw?=
 =?utf-8?B?TDg1aGVkQWpndGdoVFBSWURnNXAwRWlhNGtsVzNpeVJLMkpoekhWMFFrS0F3?=
 =?utf-8?B?RDZleTRzVXRVempVQURrZVFuZmFHS1ZlR0hLa2VJQ2lLWmw2MWt2VG9neU5E?=
 =?utf-8?B?ZGwwZHRCZVNOUklmUjhxMWxhMWtkWWt3TXN0Qnc5aUpvbEFocUtJQ0d0WVY0?=
 =?utf-8?B?YmQ5Y0xaMk5KS3ZFdVpWZEFKMFd3SS8wWG1VMVExczdiN2Yvbkc5dHd3WEdu?=
 =?utf-8?B?VWo5dFlrU1dRQUVJWEU3cWFXSk96SDZqZ1dlbFpDWWFCTUR1Y3pJdzI1UFhS?=
 =?utf-8?B?Y3Y5cjgveHkzSDBVclNNZ1pGRDQ3SkNIWEJ2MU9paEQzUzBvV3M0Q2NCNDM3?=
 =?utf-8?B?TzgxMVpZQTJVd2hvZUxQNy9kSVNsYUc0dUZvSGJnQ2pzMGY2RUNOK29uMlE3?=
 =?utf-8?B?a1JxZ2VUYnJXNEx3MERlMnVhbmc3Nm5OMWpoTWs0bG5BSFhIK0hqWFowUkR1?=
 =?utf-8?B?S21HR3g4eW02dkJueTFSenhhdUtiTVpJWWFhL1R0Zmp3S2FNSzkrTTE5cHhJ?=
 =?utf-8?B?dHRiKzNXenhRZTU0dDU1TkJKN0I4Tk1iQVk1Y093bXc1NXNwVC9veFN3NHNw?=
 =?utf-8?B?Tk82d3JqQmF4dnlwK0wrekpCRUExYWVMc0RRNC83SmZCQ3pRQm1Oc0ptNjQw?=
 =?utf-8?B?WlUzYTJiNEo0NU9JVGJ6WnJHVktkQmRrUDZEcmJWd1JZUmRMTDJ6byt5S2Zi?=
 =?utf-8?B?ZWlERmNyOUtTTHpCZWhKeXhMSUtvRzlYQndIWG1NUXVZVkg4aGxNSUV5SkdC?=
 =?utf-8?B?Q3lIRGIwTmRqQXZaQ1FQakZyZlJJN2w5c1p2OGdaUExjaFFvbmpQVlZoRExR?=
 =?utf-8?B?clIzSE8vUVBKTUN0NzdBREM5NFl0bWpuaUF5MTA0c0x6M3IxVGdWQ3pwSC9t?=
 =?utf-8?B?VkZqdXNXd3JUL2JjaGk2dnVkYlFKYmdENUhaU05IdEIvaW9kVGo0L2U1Vjhi?=
 =?utf-8?B?QmcrNXh6QWxrTGd0c2NGVWd0RGVBOEtDa2xTOXNQQmhadEhSaVhCTlYrRkRj?=
 =?utf-8?B?OUEvRHVjNHVOVk9Da0wydmtvZmRSVTFPTGpZRmF0bkZGTjBwVXZGTW0vNTJs?=
 =?utf-8?B?NkR1QjZtdGxlYi9MWUlEZzBzUzdpRWRaUmNXOWRJOUxONzRDOFlYSHp6T2Fp?=
 =?utf-8?B?SnB3U0ltSEVmRjA4RTlnU1BhaW9mWUNQbzRpek1DYVBqV3QyMnE0VFBqRmRF?=
 =?utf-8?B?TzlzdGZ1dndPU1ViMWdQc1NjWXJTVHpmMmZHYWxWcW51djZIM0xTSDRVWmFh?=
 =?utf-8?B?L2N0S293MGhyOUh5bjd0NnNNRGtEWHVRTE8rM2hMUjMyVDdsSjVJbTZKOFJm?=
 =?utf-8?B?ZnI0Zk1HcG40cldLS2xCd25OaVI3NFdtQmw5VXZaMm5yYXlJVnFmSEdIT2dO?=
 =?utf-8?B?Unc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bd2152-b7cf-4459-2d55-08dd67694b01
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 04:40:08.3959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCXm2g8f7VQT58TwDEc9SmmnhsPWYoF59KDv2wXoj5iwhyOGin0yVrKRqVlTEvyfx4IsJ0oMV8LY34jjvivPfEP0+yoJPc2MCcpOy2jD3+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7147
X-Proofpoint-GUID: Wtk45mKyaNbHCvSbZHRcroNHiVnAs-Ba
X-Authority-Analysis: v=2.4 cv=J5+q7BnS c=1 sm=1 tr=0 ts=67db9c2a cx=c_pps a=BALyy5icRfvvzfOMzojctg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=gAnH3GRIAAAA:8 a=i3tsMBky1FhzpfPjcLgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Wtk45mKyaNbHCvSbZHRcroNHiVnAs-Ba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200028

PiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAzLzE5LzI1IDIwOjU1LCBBbGV4aXMgQ3plemFyIFRvcnJl
bm8gd3JvdGU6DQo+ID4gQVNQTTEyMTYwIGlzIGEgcXVhcnRlciBicmljayBEQy9EQyBQb3dlciBN
b2R1bGUuIEl0IGlzIGEgaGlnaA0KPiANCj4gQVNQTTEyMTYwIG9yIEFEUE0xMjE2MCA/DQo+IA0K
PiA+IHBvd2VyIG5vbi1pc29sYXRlZCBjb252ZXJ0ZXIgY2FwYWJsZSBvZiBkZWxpdmVyaW5nIGEg
ZnVsbHkgcmVndWxhdGVkDQo+ID4gMTJWLCB3aXRoIGNvbnRpbnVvdXMgcG93ZXIgbGV2ZWwgb2Yg
MTYwMFcgd2l0aCBwZWFrIHBvd2VyIGF0IDI0MDBXIGZvcg0KPiA+IGEgbGltaXRlZCB0aW1lLiBV
c2VzIFBNQnVzIENvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMg
Q3plemFyIFRvcnJlbm8gPGFsZXhpc2N6ZXphci50b3JyZW5vQGFuYWxvZy5jb20+DQo+IA0KPiBJ
IGFtIG5vdCBjb252aW5jZWQgdGhhdCB0aGlzIGNoaXAgc2hvdWxkIGJlIHN1cHBvcnRlZCBhcyBw
YXJ0IG9mIHRoaXMgZHJpdmVyLg0KPiBVbmZvcnR1bmF0ZWx5IHRoZSBkYXRhc2hlZXQgaXMgbm90
IHB1YmxpYyAuLi4gb3IsIHJhdGhlciwgdGhlIGNoaXAgZG9lcyBub3QNCj4gb2ZmaWNpYWxseSBl
eGlzdC4gU29ycnksIHRoaXMgZHJpdmVyIHdpbGwgaGF2ZSB0byB3YWl0IHVudGlsIEkgY2FuIGhh
dmUgYSBsb29rIGludG8gdGhlDQo+IGRhdGFzaGVldC4NCj4gDQo+IEd1ZW50ZXINCg0KQXBvbG9n
eSBvbiB0aGUgdHlwbywgaXQgaXMgQURQTTEyMTYwLg0KVGhleSB3YW50ZWQgdG8gdXBzdHJlYW0g
dGhpcyBzYW1lIHRpbWUgYXMgdGhlIGNoaXAgcmVsZWFzZS4NCkJ1dCBpdCBtYWtlcyBzZW5zZSwg
dGhpcyB1cHN0cmVhbSBzaG91bGQgYXQgbGVhc3QgYmUgYWZ0ZXIgaXQgcmVsZWFzZXMuDQoNCldp
bGwgYXR0ZW5kIHRvIHRoZSBmZWVkYmFjayBvbiB0aGUgb3RoZXIgY29tbWl0IChQYXRjaCAxLzIp
IGZvciB0aGUgbWVhbnRpbWUuDQoNClRoYW5rIHlvdSwNCkFsZXhpcyANCg0K

