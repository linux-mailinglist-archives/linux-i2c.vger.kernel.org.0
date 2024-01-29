Return-Path: <linux-i2c+bounces-1506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E983FE0E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 07:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7962A1C21E7D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 06:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9417D47F50;
	Mon, 29 Jan 2024 06:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSmuM4XA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC345BE8;
	Mon, 29 Jan 2024 06:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706508924; cv=fail; b=SAeb4piZ1PHTC94/xynfEI8ZBsno6fTwmMkr/xTENCRiyBWjs3Xm5uhw9YMBVRWACSKODXBHyoTpHTvIVM7vzrxH7xHLO2/RzTGN5Y9KOnyQKqsNYEYslQ4vYcWENqmh+kWYZ+1lG4w0lRZKOSJCzcGvhcHaP1EsryzTFkqJzn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706508924; c=relaxed/simple;
	bh=SPhMK9Et1lptBHrmiMMRx6/JawgkG7omfX2UfWKAleM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SfugCpM+yBAk3TM9Y6Bd5+ghN94VqY4iB20w2S27HIQgXY9U29W9bvIYLavD7oTxgFgVsLI0oNTWGfmwbnThW5bZ6AHhisPVahZ6A30eCacfXlPa1zKoFkHpBs7k/zuOJ5ojudBrGy9dGHsQqkN4wgf+5qFdal1jYAclVdz7Q4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSmuM4XA; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T5eu7v013355;
	Mon, 29 Jan 2024 06:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	qcppdkim1; bh=SPhMK9Et1lptBHrmiMMRx6/JawgkG7omfX2UfWKAleM=; b=DS
	muM4XAxQx15MXv6XnX+CPY9yIPOnvKe7Ww/OmMPpvZw2n4kfuecrNw/kFxNjKLCW
	XT5Nt6znlbz/zdU9Ad9aHx9/2OF9Thx5Pgs0A/Im3vB7fmyNw6kqkbvxCaP0X5X+
	kyC3fykpscvyz7TxfGoPDKBcEJdIhBvNIrfaAEXJswJnJwcfCBUtLOkjcix+Zpe7
	8J6H7QkRCo5nK46OIOXVHHSGZvNc90/dDRmRxHwb21ddxtfJ8EELb7ef+5sVBzBZ
	mY9ZzTeueVKMh9Xx5BS7euJS9ZSEAUUWrG0fWCAeVQ6vttkccsqlCbdn0nb3XGIQ
	NT+5uiJQUDYsX/aG7wgQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx3rqg935-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:15:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVFUlugQxQaxQ5yRL9sY0c/4CX0cYFvSWJifzVy7kJQBZBMQJy37Z2etbB6HDkEVl405Y0C1N02fy2MWtvnjbhKx113JJFlmgcMe9eLi6GlC7IbdpJmhsqYOoqMEJ6/0TJiw+fkznX3cFPHZQxpMnYKl+ihvcRnlWmhoZjoPudCSsbYYQuRWKYv5NLrR1S1xNpvzZRgeU8fkfKfbSWrzHX3dgjGlPoYh+TRo0qD1azKQ0+skaQEianGeRvIwCMxA1kLPIYBfYxxiEsw5aLctX7nVYuflqBW5vjoaHlZW3zYziDg9QK+OH3AF+3kBsGwzKx+QeSC4C+fzd40M95E7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPhMK9Et1lptBHrmiMMRx6/JawgkG7omfX2UfWKAleM=;
 b=P5hngdT2PqZrsfu7Qz3daXhweMreH1MOJAXhXqRIwQFC4jJHB9d592CKShsxZJ07g/zaVFj9lvo1zWjqhmCA98OijfD3x8UyOfwBP5dcP27kYf365dKBNrZH4SalnbNI9pmMiJrFu8elGu5RhpyYNIwHJHipYMQhETtk4Ph9AVLYMFwAEOIhGO5wFaTZGxIp0SjV/Brily43gq4KT4KrUrnyqwhZlQEWY2+Iq9aLAnuYTzGtHvSgJxsdRAhMURhwvUM4QL/QMQHy0Y7gxas6fOasDOJQLosg3uz86sSmzMk/eUjxCWnrqv55blhvs3MntVGjnHsF3fRA49KaCjLd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SJ0PR02MB7552.namprd02.prod.outlook.com (2603:10b6:a03:32d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 06:15:13 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::75a9:e461:7c33:5315]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::75a9:e461:7c33:5315%6]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 06:15:13 +0000
From: Viken Dadhaniya <vdadhani@qti.qualcomm.com>
To: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "Viken
 Dadhaniya (QUIC)" <quic_vdadhani@quicinc.com>,
        "andersson@kernel.org"
	<andersson@kernel.org>,
        "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "Bjorn Andersson (QUIC)"
	<quic_bjorande@quicinc.com>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>
CC: "Mukesh Savaliya (QUIC)" <quic_msavaliy@quicinc.com>,
        "Visweswara Tanuku
 (QUIC)" <quic_vtanuku@quicinc.com>
Subject: RE: [PATCH 1/1] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Thread-Topic: [PATCH 1/1] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Thread-Index: AQHaRV7JnmLFzVDTGE2XN35iO7KpObDWQ9SAgBolTZA=
Date: Mon, 29 Jan 2024 06:15:13 +0000
Message-ID: 
 <SJ0PR02MB7758BB7F88DB478E5A7B130DEB7E2@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20240112135332.24957-1-quic_vdadhani@quicinc.com>
 <e8a81915-30d0-46e0-b73f-f6522e2269f6@linaro.org>
In-Reply-To: <e8a81915-30d0-46e0-b73f-f6522e2269f6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB7758:EE_|SJ0PR02MB7552:EE_
x-ms-office365-filtering-correlation-id: 1a101b40-1bd4-47f4-74c0-08dc2091a7e2
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WNYLU41wm0NbCgh/V6FIrW0O+TnCQUsSEXF6+kHtI3J2ZRzKfB1V/bV3rAfb9lXzeeLDyGVc7y8/rb90Y5Rf17F30AIRp+PDcJDtDoigLMDp1yl/od982rVu2T+ye1u+MTHqpbOXAs0VRQURhsqT9KkJYlSzodRleOqUTvdytF0V3f/uKOw32sCLDRk0en8DOVYmrKGHwSx1WG+42p3ZtKZQuvNPn9KoojqO3+hyMbmL4hA00YQ3cas939w10fjq9EeDFcKLI+T7Cb4PKdObpEBBM9aTXlV/cR26ZuC7Xl9E/0UnDzCdmL3Zfi1iOLpa6bvRQU3ACqrrQNpXX+j5HgK12ZaSzKRI952xJG0rJvKI/O45XYCZBf7dg0miKjGlMabqijmdTd/Jio0THYQdLEcpv+0r7wYWCcAfItvmgYcDeQb4BtCNrJtMLOXFgBAcXiHaypaqwfPg7Q7YUswsUpYvbbGfZcpFnUQootDTnCMjZwh97XrjAq9/YV8Q/aBfQpSiZYsBdxf+EgMHOsVrbldpJyHAV1IE1AqDwIE7CtN2Nz93AaNDCfWjhGkUKiYggv/iYiW7uKbFcifyX9oMI5hfztqOm5JUKzHiTJQgzl4uDTm+FX15wUc+Umb6zf2GWbfFNsfeYD7gFikDRnb1fCoeXCQOurtFNHR2OahxA4b41nc2lZy/keQQiJ7duJm7
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB7758.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(346002)(136003)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(921011)(55016003)(26005)(107886003)(41300700001)(66446008)(38070700009)(316002)(54906003)(64756008)(9686003)(478600001)(53546011)(6506007)(7696005)(71200400001)(83380400001)(38100700002)(122000001)(66476007)(66556008)(5660300002)(33656002)(2906002)(66946007)(76116006)(86362001)(110136005)(4326008)(8676002)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TjhuYnZwc2VIV3daTmw1dUt3WmYxUHFmMUhkWXpGVXoxRlczVWp0anZ5WTAz?=
 =?utf-8?B?V25idUgwNEdzRkVyMGxtODdUeTBaRTc4d052SEFGOU9ybjlFeVVzNVlMUFlN?=
 =?utf-8?B?UDZuSGJMT1d5bGZiakl1Z3NrNzcxV0NxMCtSMWVXdS9jbmdwZVlzSGM0ZTBl?=
 =?utf-8?B?RlRDS2pxTWVmSVNYUzgzdTZBZWxvTFJOSEx1K2xXeTFTdm02UHNaLzlISDZ6?=
 =?utf-8?B?eGZIUTdtdlhtK2lBRjlBeWtQVVloSlV5R0ZvQm1CR01pL1BxV1Q5cHJVOEpy?=
 =?utf-8?B?eC8wYlppQkhPelM4bXhYNGZyOEFvSkM2cGMyYnZBeERXTHNUMjRERFZ1ZWFC?=
 =?utf-8?B?cWMrdEV5aEZOdktVZis4Z2lsdnJnTld5Tm1yeWNrNllveFFuRWtzMUZ6dDd2?=
 =?utf-8?B?RS9KZU5IbjBUQnV5VjVDUXBZV2gydUl3R1ZVbmxlSkdyWitpQWpHZjdLT0dq?=
 =?utf-8?B?VnI0RmJ6NzgySG10dlRZRGxCZFdFTnZjczZDNkkrU0JaWHpHcDk0WVhUbjY2?=
 =?utf-8?B?anBvK1h3dlY4VEZpQklHQ25tVVhxQ0dWMGdERExUL3g1V08yUkRrcGxCWGdh?=
 =?utf-8?B?alh4WWNCS1Z5RjQ5OXJ5bVBqdHJNS2VMNTMyd3duaEdKb0g5bWk3RjVQUVI3?=
 =?utf-8?B?TmtvTVQ2SUhWTFllMFJSM0E4V3ZHbFVZcU5JKzBac1o0ZE5ZNFF4dUVtMmJ1?=
 =?utf-8?B?dllFZEd2MzlISGdFMHhoSjg4NmozUW9CVnVWRGZEWTlOd3g3VGl5YzU2WU00?=
 =?utf-8?B?aGo1TSs3d1hpek9IN2FNVUtiNGZQTnhvUWMwaEJDcUcvd2NUVDliUlNzOVRi?=
 =?utf-8?B?MmhEUUczdmpIbGZORDhTZXJVamFOT291N3REOFBzdGg5UXdLL3ZXbEMxMitk?=
 =?utf-8?B?S1VCcE4yUWV0MXVvaU1acVh2TUpGd01ZUFcwM291S3o4KzFGVG1TcjBBVW9l?=
 =?utf-8?B?a2U0NFk2d1k4RFZkTWwvR0o4dVgwTVBIMFhjNllhcHQvZFplM2tMNUlTNEhH?=
 =?utf-8?B?Qm83akNsVTF3byt1MWJHRUNDZjNrNnUzR2ZZUGptOGRBZEE2a0tNTExMeEx3?=
 =?utf-8?B?NVJDVG9GUHRRRitHWXFlN2JXaklTZ1dxMHgrVkpaTWNDTS9KS0tLN3JBR0xM?=
 =?utf-8?B?Q1ViOVhzYk1aenVob1FEYUt1cTVDWUQ0eVEyZG93MmFyU0czaC9JM0tyeThM?=
 =?utf-8?B?TitSZTZMUGZWcy9yQWdYSGhYN3VKTEY2WGxJRVBIb2FvQ2lmZ29sc01CaW1Z?=
 =?utf-8?B?U25ycmlva3Q3VGNPQTRqaXMvRW1kREdMZXp5NFMwMVZHVm5WeGI0ZzUyekF6?=
 =?utf-8?B?eWhsbnFsQlVDbDcyN2Z5b2lFMUo3SndrS0ZlbHVaaGc2dHpodDJ3V1E0aCtU?=
 =?utf-8?B?OVhqSm15azh6T21FcFFWZ2NRNUswQ1B0RHhOaU5jOHorMjdzbDZLelF4UXls?=
 =?utf-8?B?ZHRHcVVXbG50Snc3cDZhZGRSdVY3aktnelVVSFZyYmNtSHN6YSthOTZWUE9B?=
 =?utf-8?B?MSs0Z1JpZTRLK0xTVERrWnFNcklpTDFBbEQveFNwanBCRktpcU9pM1BZWGFL?=
 =?utf-8?B?dTJ3WGcybm85d2dNWVBmblNoTGlMRHRqSnFOK3F0Um1NeWRjM2I2OWlyTU1N?=
 =?utf-8?B?ZWdMSkw1N0tJQTRaVWRpejIxTmRlN09mNkdvMlZib0NQQldXQVhOTHVNS0xE?=
 =?utf-8?B?dlRGUjdzTW1VQzdhM3dMcDhRU0lNcVNPa3NiclNMTTlFa0tLTzB3bkd1K3Bu?=
 =?utf-8?B?MjRIMW9kR3pEUERMV1k1TlR6bzZGck50OHR0dGlKNURuanE3bEN4dnpoN0s1?=
 =?utf-8?B?RGM0eW9YcG9mMUk5T0ZOaVdJYWc2cU9WY2VZYmVsZW90TE5QTThUN1pGem9N?=
 =?utf-8?B?a1luUCtTRXczK3llbGpwemV3bjFtZms5Y2c4Q3lCblp5dklaNFkzSHZMYzBT?=
 =?utf-8?B?K01SMFZqSTlsUVZiWUhkRzBkUXZDbmhoTjIwZHNvd0FHTDBXditFeStQdHRl?=
 =?utf-8?B?dFdBL1U3bUlLL0M1VmVsRmZmR0h2R1Q3OStLZXF0RmZWNjJSMFJQRlJaa21k?=
 =?utf-8?B?MEZoRWgxbzAxZnhScUhjNGVPU1NuUGh0YXZzS3cxSXorRE9nZksyLy94U3Nq?=
 =?utf-8?Q?dQP66KFyCI+IzFyQC3mdBay6/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	TIHDsE4ZRx4PMk2g/xGeqBjBsAamr1vABssclWc/ScG7x2y/Ur/VOvtlZVhbuYPuVaeGiUDHxPmWV48eHwj8zC9H9+l11qfh8qvLIVBtFq/Zq/5k4rN6IXJImqlm1z7cKkf/2e6aMhHNSvZi47mUy2+KsZLY1cEMEd1XOXOQ0S3h3uGASLe0TL/uxJUOEq97E0nyFi7C9SXELvZolUBRxrj/pb9g2zKeyA/IuZWEO5XM/3qki1kfm1PKJWryruNRS3fMT46P5Y76Aq9UM2Ci0YOQL6AoSHyhGd4Av/auInMiHf+9SZRY7/7RVzT8N0uYA5EnBRu474ZnhyT7cPLuMP7iv23cjQfglDYUM9mLRt5p3Co4ep09mPO2pVUeRWuLcpajk1YJc2IIerzVnvba+kSziGVeG2vaVT4CSO7nR2RTmBmAsvjCKD032An6VzVml4rq0z7ojRD0mDp2Ieg7rxL+VOMaTKxvA1lC8A+cVnPc/iFYSTkhCCSNX90V55It8WjGViFoYRWuIs+2cNa4q0OcTmm8tMzJaF4fL9LqLiMXgX7QSVOYYuza/CLgDkCHRbdrJcOwPLj+KoNeIvZitTOBioyHzun8lUTJfsRjydHy/ohwXt7l3THAY4F9f44Q
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a101b40-1bd4-47f4-74c0-08dc2091a7e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 06:15:13.8386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qU8EUQM0aDJ//SC4bH5bBOVL8HhPBL/S5Ku+t/Brw4r6lbUap7ruUpZ/m1zC17ebUYGDJxC3kbbJ9CzFOR+iJrc6r+VE8K3JZiFII6SgEGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7552
X-Proofpoint-GUID: lhGBUS6aELizbadYtz23MxA-bNnFnzkA
X-Proofpoint-ORIG-GUID: lhGBUS6aELizbadYtz23MxA-bNnFnzkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401290043

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnJ5YW4gTydEb25vZ2h1
ZSA8YnJ5YW4ub2Rvbm9naHVlQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAx
MiwgMjAyNCA4OjI1IFBNDQo+IFRvOiBWaWtlbiBEYWRoYW5peWEgKFFVSUMpIDxxdWljX3ZkYWRo
YW5pQHF1aWNpbmMuY29tPjsNCj4gYW5kZXJzc29uQGtlcm5lbC5vcmc7IGtvbnJhZC5keWJjaW9A
bGluYXJvLm9yZzsgYW5kaS5zaHl0aUBrZXJuZWwub3JnOyBsaW51eC0NCj4gYXJtLW1zbUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxA
dmdlci5rZXJuZWwub3JnOyB2a291bEBrZXJuZWwub3JnDQo+IENjOiBNdWtlc2ggU2F2YWxpeWEg
KFFVSUMpIDxxdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPjsgVmlzd2Vzd2FyYSBUYW51a3UNCj4g
KFFVSUMpIDxxdWljX3Z0YW51a3VAcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS8xXSBpMmM6IGkyYy1xY29tLWdlbmk6IENvcnJlY3QgSTJDIFRSRSBzZXF1ZW5jZQ0KPiANCj4g
V0FSTklORzogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4g
UGxlYXNlIGJlIHdhcnkgb2YNCj4gYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90
IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiBPbiAxMi8wMS8yMDI0IDEzOjUzLCBWaWtlbiBEYWRoYW5p
eWEgd3JvdGU6DQo+ID4gRm9yIGkyYyByZWFkIG9wZXJhdGlvbiwgd2UgYXJlIGdldHRpbmcgZ3Np
IG1vZGUgdGltZW91dCBkdWUgdG8NCj4gPiBtYWxmb3JtZWQgVFJFKFRyYW5zZmVyIFJpbmcgRWxl
bWVudCkuIGN1cnJlbnRseSBmb3IgcmVhZCBvcHJlcmF0aW9uLA0KPiA+IHdlIGFyZSBjb25maWd1
cmluZyBpbmNvcnJlY3QgVFJFIHNlcXVlbmNlKGNvbmZpZy0+ZG1hLT5nbykuDQo+ID4NCj4gPiBT
byBjb3JyZWN0IFRSRSBzZXF1ZW5jZShjb25maWctPmdvLT5kbWEpIHRvIHJlc29sdmUgdGltZW91
dCBpc3N1ZSBmb3INCj4gPiByZWFkIG9wZXJhdGlvbi4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBjb21taXQgbG9nIHJlYWxseSBjYXB0dXJlcyB3aGF0IHRoZSBjb2RlIGRvZXMuDQo+IA0KPiAt
IFNldHMgdXAgb3B0aW9uYWwgUlggRE1BDQo+IC0gU2V0cyB1cCBUWCBETUENCj4gLSBJc3N1ZXMg
b3B0aW9uYWwgUlggZG1hX2FzeW5jX2lzc3VlX3BlbmRpbmcNCj4gLSBJc3N1ZXMgVFggZG1hX2Fz
eW5jX2lzc3VlX3BlbmRpbmcNCj4gDQo+IFdoYXQgeW91ciBjaGFuZ2UgZG9lcyBpcyBzZXRzIHVw
IHRoZSBUWCBETUEgZmlyc3QNCj4gDQo+IC0gU2V0cyB1cCBUWCBETUENCj4gLSBTZXRzIHVwIG9w
dGlvbmFsIFJYIERNQQ0KPiAtIElzc3VlcyBvcHRpb25hbCBSWCBkbWFfYXN5bmNfaXNzdWVfcGVu
ZGluZw0KPiAtIElzc3VlcyBUWCBkbWFfYXN5bmNfaXNzdWVfcGVuZGluZw0KPiANCj4gYnV0IHlv
dSd2ZSBub3QgcmVhbGx5IHJvb3QtY2F1c2VkIGJ5IHJlLW9yZGVyaW5nIHRoZSBjYWxscyBmaXhl
cyBhbnl0aGluZyBmb3IgeW91Lg0KPiANCj4gVGhpcyBtYXkgYmUgdGhlIHJpZ2h0IGZpeCBidXQg
SSBkb24ndCByZWFsbHkgdGhpbmsgeW91J3ZlIGNhcHR1cmVkIGhlcmUgaW4gdGhlDQo+IGNvbW1p
dCBsb2cgX3doeV8gaXRzIHRoZSByaWdodCBmaXggaWYgaW5kZWVkIGl0IGlzIGNvcnJlY3QuDQoN
ClVwZGF0ZWQgY29tbWl0IG1hc3NhZ2Ugd2l0aCBwcm9wZXIgaW5mb3JtYXRpb24uDQoNCj4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogVmlrZW4gRGFkaGFuaXlhIDxxdWljX3ZkYWRoYW5pQHF1aWNpbmMu
Y29tPg0KPiANCj4gWW91IHNob3VsZCBoYXZlIGEgRml4ZXM6IHRhZw0KDQpBZGRlZCBmaXhlcyB0
YWcuDQoNCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXFjb20tZ2Vu
aS5jIHwgMTAgKysrKystLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXFjb20tZ2VuaS5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXFjb20tZ2Vu
aS5jDQo+ID4gaW5kZXggMGQyZTcxNzFlM2E2Li41OTA0ZmM4YmJhNzEgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1xY29tLWdlbmkuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtcWNvbS1nZW5pLmMNCj4gPiBAQCAtNjEzLDYgKzYxMywxMSBAQCBzdGF0
aWMgaW50IGdlbmlfaTJjX2dwaV94ZmVyKHN0cnVjdCBnZW5pX2kyY19kZXYNCj4gPiAqZ2kyYywg
c3RydWN0IGkyY19tc2cgbXNnc1tdLCBpDQo+ID4NCj4gPiAgICAgICAgICAgICAgIHBlcmlwaGVy
YWwuYWRkciA9IG1zZ3NbaV0uYWRkcjsNCj4gPg0KPiA+ICsgICAgICAgICAgICAgcmV0ID0gIGdl
bmlfaTJjX2dwaShnaTJjLCAmbXNnc1tpXSwgJmNvbmZpZywNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJnR4X2FkZHIsICZ0eF9idWYsIEkyQ19XUklURSwgZ2kyYy0+dHhf
Yyk7DQo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBnb3RvIGVycjsNCj4gPiArDQo+ID4gICAgICAgICAgICAgICBpZiAobXNnc1tpXS5mbGFncyAm
IEkyQ19NX1JEKSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldCA9ICBnZW5pX2kyY19n
cGkoZ2kyYywgJm1zZ3NbaV0sICZjb25maWcsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJnJ4X2FkZHIsICZyeF9idWYsIEkyQ19SRUFELA0KPiA+IGdpMmMt
PnJ4X2MpOyBAQCAtNjIwLDExICs2MjUsNiBAQCBzdGF0aWMgaW50IGdlbmlfaTJjX2dwaV94ZmVy
KHN0cnVjdA0KPiBnZW5pX2kyY19kZXYgKmdpMmMsIHN0cnVjdCBpMmNfbXNnIG1zZ3NbXSwgaQ0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPiA+ICAgICAgICAg
ICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICAgICAgICByZXQgPSAgZ2VuaV9pMmNfZ3BpKGdpMmMs
ICZtc2dzW2ldLCAmY29uZmlnLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmdHhfYWRkciwgJnR4X2J1ZiwgSTJDX1dSSVRFLCBnaTJjLT50eF9jKTsNCj4gPiAtICAgICAg
ICAgICAgIGlmIChyZXQpDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOw0KPiA+
IC0NCj4gPiAgICAgICAgICAgICAgIGlmIChtc2dzW2ldLmZsYWdzICYgSTJDX01fUkQpDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGRtYV9hc3luY19pc3N1ZV9wZW5kaW5nKGdpMmMtPnJ4X2Mp
Ow0KPiANCj4gSWYgVFggZ2V0cyBtb3ZlZCB1cCB0b3AgdGhlbiB0aGUgc2Vjb25kIGNoZWNrIGZv
ciBpZiAobXNnc1tpXS5mbGFncyAmDQo+IEkyQ19NX1JEKSBpcyByZWR1bmRhbnQuDQo+IA0KPiBZ
b3UgY291bGQganVzdCBoYXZlDQo+IA0KPiBpZiAobXNnc1tpXS5mbGFncyAmIEkyQ19NX1JEKSB7
DQo+ICAgICAgICAgIHJldCA9ICBnZW5pX2kyY19ncGkoZ2kyYywgJm1zZ3NbaV0sICZjb25maWcs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJ4X2FkZHIsICZyeF9idWYsIEkyQ19S
RUFELCBnaTJjLT5yeF9jKTsNCj4gICAgICAgICAgaWYgKHJldCkNCj4gICAgICAgICAgICAgICAg
ICBnb3RvIGVycjsNCj4gDQo+ICAgICAgICAgIGRtYV9hc3luY19pc3N1ZV9wZW5kaW5nKGdpMmMt
PnJ4X2MpOw0KPiB9DQo+IA0KPiAtIFBsZWFzZSBpbnZlc3RpZ2F0ZSBmdXJ0aGVyLg0KPiAgICBX
aHkvaG93IGRvZXMgdGhlIG5ldyBzZXF1ZW5jZQ0KPiANCj4gICAgVFggRE1BIHNldHVwDQo+ICAg
IFJYIERNQSBzZXR1cA0KPiAgICBSWCBETUEgc3luYw0KPiAgICBUWCBETUEgc3luYw0KPiANCj4g
ICAgSW1wcm92ZSB0aGUgc2l0dWF0aW9uIG92ZXIgdGhlIGV4aXN0aW5nIGFuZCBtb3JlIGxvZ2lj
YWwNCj4gDQo+ICAgIFJYIERNQSBzZXR1cA0KPiAgICBUWCBETUEgc2V0dXANCj4gICAgUlggRE1B
IHN5bmMNCj4gICAgVFggRE1BIHN5bmMNCj4gDQo+IC0gQWRkIGEgRml4ZXMgdGFnIGlmIHlvdSB3
b3JrIHRoYXQgb3V0IHNvIHdlIGtub3cNCj4gICAgd2hpY2gga2VybmVsIHZlcnNpb24gdG8gYmFj
ayBwb3J0IHRvDQo+IA0KPiAtIEluY2x1ZGUgdGhlIFNvQyB2ZXJzaW9uKHMpIHlvdSBoYXZlIHRl
c3RlZCBvbiBpbiB0aGUgY29tbWl0DQo+ICAgIG9yIGNvdmVyIGxldHRlcg0KPiANCj4gLSBBbmQg
ZHJvcCB0aGUgcmVkdW5kYW50IGNoZWNrDQoNClJlbW92ZWQgcmVkdW5kYW50IGNoZWNrLg0KQWRk
ZWQgU29DIGluZm9ybWF0aW9uLg0KDQo+IA0KPiAtLS0NCj4gYm9kDQo=

