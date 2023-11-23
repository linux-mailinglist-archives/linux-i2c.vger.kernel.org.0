Return-Path: <linux-i2c+bounces-426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC37F6425
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 17:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE47BB21086
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 16:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CB72FC29;
	Thu, 23 Nov 2023 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="G9Vase7y";
	dkim=pass (2048-bit key) header.d=calian.com header.i=@calian.com header.b="aF16BfwG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA798BC
	for <linux-i2c@vger.kernel.org>; Thu, 23 Nov 2023 08:40:51 -0800 (PST)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
	by mx0c-0054df01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ANBVvnH015814;
	Thu, 23 Nov 2023 11:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=selector2; bh=FDjUVRxogexwYr+zVupuf1E4/BdV+zLEFPteS/rgBtM=; b=
	G9Vase7y9GyZxJ/4pPS8djoaoaBqI275k2z25fqFOnBIz6RUam9tVLE9DRgxlp76
	QVP2bYBY0L85/Lk++TScgCTsyxOLnZ3epaHdmlNsECPx7xZpKKAbPYG03hx3r28v
	cD38QS3mjOtXyTlwklrX2tnFxRjfwVtVZkAMVJHZWMgTOVSr3j8ZVSQTnZYWDykY
	G6boF6O1LFhSfczGaHxE3eGaIXtDwrDE6tpbMNwrQv3618u5HUlRaxAVte5aYbrO
	1pJ1i2Be9AqzMgt+65sPTN54Mk1TRUnyVdRJmRopto9VA/lJSu0lTilMf32cxkIn
	dOtiqScAa9YLOJey9ro0cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=selector1; bh=FDjUVRxogexwYr+zVupuf1E4/BdV+zLEFPteS/rgBtM=; b=
	aF16BfwGJ983zYB7R3rNvrkK5oIw13KvVzy/2vhrJs+qFcEg4AlEktWEKJ0mXiny
	i2BlhvF3g7hogQ9TU0Vr9i7nidjqIieLAr8g+1ikzwAcJWQrNYckFdX0WPRGVNXQ
	zuS7+vuw2oquK/GDeJ8WpWCD5jnR9spOeDxfNKvl9C9VRp/cWM9aW4Aw+WJbr9xu
	SbuCDmgYcwmW5O8dGkTiy5nFYJGFFmRkHJvjp8CPhip5lP5qoTMTVO25i8gvFfSb
	ULxJ9qzvOsm8yY2mdtTiu09wfiJ8Kr4AAWRkcmaq9X2rMacg+SJ3sTCsYKucuZoA
	D93hMEQFx18t67DJeW0hoA==
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2232.outbound.protection.outlook.com [104.47.75.232])
	by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3ues8xnfu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:40:31 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3nPBobfFr8WaffSQesWSFkwRkN9HUhgRfW/O5XjFpQNJmu6DZSI2NDntXvcssENNA2juXXtognhEPQxo+HEA2PDUCWYy7ZxCkGtm/sLPSlBH9fTv2yIGekf1Af+9Q4/2A1krx5iwVo4UHQFFBzfdU8pFJIVNZWtRq/MOVefz43MJsSCnP8ZV3aRLvLJVO+ugEIP3BkzsaFh/PKiVQ4OAb/S1WmJ82eM+sngHrfweKo/Km8PPDPNmqeUFdfg6wqEN1NXvtJBE7Zo1muJzFZxY2G47Wx328ptdqBoAOz8SGdPwQrBJ59Vdcwj4NRHGo/8RnCWksqbJe/m2VSk0cD+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDjUVRxogexwYr+zVupuf1E4/BdV+zLEFPteS/rgBtM=;
 b=DhpoYMqDsWgOI0Hd5NIn3B/oL9eoAXuT00k+UG8a5fapk4hqNlQDP9qmeBLPWEUTjyEvLLWALRx3jtmreMcJ4LQclGnXVv00e+HMKIy4fpyeyjOkklILViSMkyX3aYe4eVdP4ENN76nUhKXYMAt1BigWeLQhEHYMj3eERWv54Xf+3ZcdtK0lT+hhHufeE6I4sd5fuaL48h4iLCw+Sbtb4+n8NmomGp69yW6AxA0As1Jvuvck9aTp+i4kfew35/n7md0Z10a4uYTc9HsqPV54sV0Go0gWIOFtVeBuYTlVDsRmihlmqu4mAS3SSlnMP6UkjTI9ibCec/6pWGihSFytAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT2PR01MB8501.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 16:40:29 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::8e4a:d951:9c01:a8af%5]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 16:40:28 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>
CC: "michal.simek@amd.com" <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "ben-linux@fluff.org" <ben-linux@fluff.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Topic: [PATCH v2 0/2] Xilinx I2C driver fixes
Thread-Index: AQHaHKYQwYuAaxqoTUK0TRr8PhRYYrCHaXCAgAC0ywA=
Date: Thu, 23 Nov 2023 16:40:28 +0000
Message-ID: <53ff179ced8021ca34d7b70fd31f3aed0aa6e5fa.camel@calian.com>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
	 <CAKfKVtGT1Aq8gQR9uazjm=yGjRRTj-cKYe-_4n4ME3sThaPTzQ@mail.gmail.com>
In-Reply-To: 
 <CAKfKVtGT1Aq8gQR9uazjm=yGjRRTj-cKYe-_4n4ME3sThaPTzQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT2PR01MB8501:EE_
x-ms-office365-filtering-correlation-id: 474e2dbf-854a-47a1-5748-08dbec42e6e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1kSgH+PCcKCgKngUP17SYo8EZHxdhAaG9FTOH3y4filh1sZZQJzvok4ww7v2H38u+3U8DQjnb2ph7q112JFCT9meQGrlrSWusyPelJe7zXaESUNnqbjKgG/N6ME/GJenNAyNyxpIjhtF8PlhX+/Xjf3YLvsQJFEXM1hlFJeWqFInbrHXyztiwpWKdmFiM/Ciu3cApmajR/XEskV5Rzu68B6obpGeqAYwZAht5Yfd1Mv6yu7qMzAhX8/l1iXipIv2y+VpntzPq1XeEoVenRZyY29jX29wo+oYJhR+qJaqnqbTCQgjhWV6OiYM+LVmeoq29kGAtH92cF4oPxts3caqzohukLKKTJdXgkFLhHaLmQJhHaEcP3kqJnej5wi4n18VDXig44CscsGTxtLq2V4qsJtRoCWAvuCZAj3XMQNSuhM1SK2RFLsmRGmu1Tn6h3IsuN6Oi0uUqUJimmH8uwXZbs4q4NEhpjjvGxkva4qY/7VVua2jEzFIhQxaUqczpJfrT43EH9oWyW5dmUCA49b2jGpv37wR3cOPPljGHLfrvA8YRDOKTbrwWjsXuad4v9kzToQ0wCKV/5tpQG6RfrgCMkO2/6edTHD3XYSYFkdhTuC9GT5v9hiXpbRysPK7DAWaf2P1bom1wGzI+ncfKpOz9ZmBk/i10C6Yw9VBrgZMk98=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(396003)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(4001150100001)(44832011)(5660300002)(4326008)(8936002)(8676002)(2906002)(41300700001)(316002)(6916009)(66556008)(66476007)(66446008)(54906003)(64756008)(66946007)(76116006)(38070700009)(86362001)(2616005)(478600001)(6506007)(71200400001)(36756003)(6512007)(53546011)(83380400001)(122000001)(38100700002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MDl4S0h2MzIxNHpDOUpNQ0lRMkFhaTV4SkN2dDBGdzlYM1dtL0o2aFB5OENQ?=
 =?utf-8?B?MXhtQmhSUnl3T0xIWDhuS00yUnROVzdpMUx3Y0JVU043K1BJbHhaenkzeW4x?=
 =?utf-8?B?VjRFTzU4RnJYYkJiaWhyZmR5a2VweXVrbFdKSFk4cGQwUVBPc3RyMUxyQi92?=
 =?utf-8?B?b2FmL1N0czhhWm9MZkNHYzRqZjFiZ2ZiN0lGYlJSNDlUcmZqU2wxQTdjTVNs?=
 =?utf-8?B?ckJ0N3ZvTXN0VndIeXdMRG9zSkF2VmtLYmRvWlJMa0d4UGdoZFI1NitIaTRr?=
 =?utf-8?B?VHNVYnJFTjNUSVZhTkt0TUk3NnhoVmI4UU94MzhQNk9SZHQ5aWZHOFdCUWY3?=
 =?utf-8?B?aEFjeUwvc0pZNkMxdEI2ditaVERlYThJdzdpcHRZOUdrRUpkVVBLS3U1TVB1?=
 =?utf-8?B?YVB2Qk1aTnVQNll3WEdPbnZGaExPNXRad3RDeXJzS0ZzcENzbmEwS1FGdkVH?=
 =?utf-8?B?MlhoT0NXZ3lTWHovYndlQXo1QkdFcksvc2VaYXhzRzJSL3RkT3M0NFB1Z0RI?=
 =?utf-8?B?Q3VZY3I0M3ladkdDN3ZnNXloTVRhU3YzbVJHbi9CQ2RoRkdsWEp0cU1VdW5W?=
 =?utf-8?B?Y0FDd2txeFhlTXMxY054VFpTOVA2SmxkMEpBZGwxRWliL25yZ1c2OEcrN3dJ?=
 =?utf-8?B?bnJpbkVsM0lkVEdpWGxKdWJoRTNoaEg2cktyNkoxWndmemhnbTdJL05GYzRi?=
 =?utf-8?B?aWxSNGNYdHRaZFdsSzcvUkRsQnErV09rbE10RkRjV2hSQ0d4VmtkNUdRSUNo?=
 =?utf-8?B?T3ViWXBGZlVPNVdTU0tDSXRyajBEMGtlZDV4Y0xiSGVOalJWQVU2YlU3d2Jn?=
 =?utf-8?B?Q0hKdEFqbnRGVk5xOEZSVnRYKzRTOXJwNFYyMDB3aVFmMWg2bzhmV2UyanpT?=
 =?utf-8?B?cDdOZVJpTGEzNzQzSkQ4NldzbVJ2TkdxcFJtMzFsT1BpWDMyMkVsSjZUalli?=
 =?utf-8?B?Q2dOYTM3UXVpakpVV1Z0SWkxY3JHelYvOXJLS0k2SllDcDFqdXIxUVZvSjlF?=
 =?utf-8?B?Qjh1cXBmUUFJVHNHTWxVMXVMUy9JdGJ4bDVGTnhmWlIrakYxejdYbHM4MGpo?=
 =?utf-8?B?QkpaelpNTFNGUStGYTZ0VENiZmZaVXoyUW51cGtQQU84YXNRZ05Lc2JPOHdZ?=
 =?utf-8?B?RFdtTVdJZk5LMTlKRG9UTWZOMW4yYWkwVUNNNGNLcmhyQkh4MEpBakx0NVh3?=
 =?utf-8?B?TzVqOWMzNWRLVUtnaG1aajFHSDhTY0huSmgrYTVuWHRaN3BlL2FyQzIvSkhJ?=
 =?utf-8?B?TFVQdENDbC9YSHRudHZEY081U3lGTlRVU2FJSEVlTnZmNVo5WWZkRlduRzFG?=
 =?utf-8?B?a2tFWGRQSXByMVF6UllmYlhEcE9kSDUxbnhkZndhanVJUGd5VnEzaWxSNDVS?=
 =?utf-8?B?OHJuYkRCemJ5VGthaEdOeE1DQ3hwVUxieHk0QS9VMWVERnhWVU9mVkZxbW55?=
 =?utf-8?B?T3ZMb3o0a3BMcGRGRU1KMkFZSEtKTU9LOFU4blgyU3kyRksrZkRZM1RQallY?=
 =?utf-8?B?K1ZVa0psaWlpeVJzTFlUYmNEOGhVQXhFVHpIOUtJNDdKZndzUDNOejAvWEQz?=
 =?utf-8?B?L2s5N055bldvaUc1Z1N4S2dVTkNnM3BhSW8vQ2RJUXJFZ3JsYnN0S1ZlQTRx?=
 =?utf-8?B?Lzg0cXRGV29tRkNJc3lVWC9pWDlDVVEwR2NxTTFqU284NXZoejcwT0tjKzBa?=
 =?utf-8?B?SE1WcCt5SjhSTTRFQ3Rtc0FPUEpXT2JJUHBPc0NRdTZpWVk5aUMrQmErVmNn?=
 =?utf-8?B?ZnJNVzRETUJHN2xyMklaTEx1NkFJQlJJNk1hRmRtWml6eVlvSTBuWVNGUmUr?=
 =?utf-8?B?TGRzUlBieGxwekZjZmgvdXY2T1ZKN2lFOGR2Qnh0Mys2QjVvME5sekE2ak5D?=
 =?utf-8?B?Nk4zSXpqMlB4b1h2Z01BMFkxdjdHMk5IU2p3UjRROTQzWWlDZEc1SGlkTXpC?=
 =?utf-8?B?VmRvVzlKaGdXbGxWWUhVNFplWEF1TVFXUmVvTU5NNnJ0R1N2UnJ4eU5XbXJY?=
 =?utf-8?B?YVliMU9rUElKZ1duQ0hFOXc5MUt5NVdhbEFXbEd4Znp6ZDU4T1BMU0tiZVVH?=
 =?utf-8?B?b3FWcGo4bTNQbERUREtNdTRkQ3R1ZmQ3QXF1aGEvc2dHckhMU2ZqQnJ2enJI?=
 =?utf-8?B?WkpoVFpoem04NFJnRmgvR0swSExQOFNVM3lteUlGWVluMUFDRTdiNlhKRmlG?=
 =?utf-8?B?S29wUUtLcHZlZjEyalc2WmxzbUtTTkgrTVd3dDFPc1JNdjR3MzUxZDF6emFS?=
 =?utf-8?B?MVJ3QjdSYmFQZHlDRTVoUEhyOW5BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4020F4698C8CBE4DA2937CA9A224B080@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?cEJLQ0UwVVZrMyt5enVuQ2QzUGJHZlllZjZkZTltYVJsUzZpK21pZUhxQThY?=
 =?utf-8?B?ejVZMFJRanJlWE1nTkYvL2IydHlLZGtxcDBtbjdpNFBUMCtXTHpaampmbXp6?=
 =?utf-8?B?M1pHMHJJeVcwV2ZOV1N6RHcyNCtib0xHUnNEOGxnMmtYckNjWGhDRllRZ0FU?=
 =?utf-8?B?YXhoQjd3SitoN2VsU3p0UGZod2JHa3daS0hIdjNuZy9yaUpLUE9xRmloRENl?=
 =?utf-8?B?NGVnWnZSWk1CMmFYZ2JBcFk3YmcvRlRpYm1scG9xSWsrWjlHbWRlRG5iWFJ4?=
 =?utf-8?B?WHR2YU1zbDJSWHdNNFZqdUNEOFRWRkdjb0hGZUpJUEJYN1pRcXNoMXNkUndI?=
 =?utf-8?B?SnJLSkYvRG0zamd6a3ltcnhLR1BMMjVhbCtOM1ZwOG1tZHU4T3hPUGFpWEhi?=
 =?utf-8?B?Nm14Uk9MMmxyMWhiT1dNUEZLL0dwUzNnNk5nNktleXU1QmhkQmg1SzZLVG5i?=
 =?utf-8?B?TTJqQ3FyeXpFZDV5aTFuNk42aWZsTEttNTNNQWtMcEZpWlFnaENLRE5oUDZL?=
 =?utf-8?B?Z0FoTllDOTdCUWhqMlp4SzdFNjlSYXhjRW00RFV5OXAyWWJvS21nTTYrbXdi?=
 =?utf-8?B?ZTJ4YzdhcFM1bThvOTcyMm9WdE1lNWpDd2Jvd3dSZnhUZmNRT0g4c0VrL0M3?=
 =?utf-8?B?MUF1RVdkOFZoclRieVJEREZ1a05Mc1RXU2xrRW84M0lEYUtGS1dBOTBjeXh0?=
 =?utf-8?B?WEpaaXZ5TTF4QktNQkwreG4vMXlVTmk3bHVLRDZlN2l3cDZCQ1FSODFqU01D?=
 =?utf-8?B?VnE4cFVYUjdUb0VqNXhQZ2h4anBNUVdOWEs4Tys3NE5mVkUxM2IybmtMYTh6?=
 =?utf-8?B?MzdEYmVGTDl2OWppTEM3Z01idnFEdHRYSFRHOFpscW9zQlJkQkxjUmN6UUow?=
 =?utf-8?B?OGd3NjZ1VEpURWlZbmZyRjVLZ0Ura1ljY3JzWnVpVXB6YWQyakVpNmRkUWlJ?=
 =?utf-8?B?TjhQRmhjQmhZZUdkZDZSY1lMS1E0TGxSeUFFeTFWbXAxWm9sN2pYekVXUGJF?=
 =?utf-8?B?WXQ0ck1YMEpERGMrdkNBdHNmdmlDOElGdXhCU1NJcVdOSm84NmFZRTR4MGRL?=
 =?utf-8?B?am5NRExSVjEzYW5HNjI4TlZpNlM4QzZIRTVOSXh5V2ZKbVlFODNKY3kvOWNN?=
 =?utf-8?B?SEw3S09UQ1B6SHdxaFlPUGw3bjgvOVBKL3lyRDVienhPV2ZtdHZLQmxWMkpk?=
 =?utf-8?B?Q21KNmU5MU9qRlhYTS8rZE5sTHlEL1gvcVY5dXdHMTI2RjhGaUs1UGF1R2kx?=
 =?utf-8?Q?1Hd85GeAJBfaV8u?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 474e2dbf-854a-47a1-5748-08dbec42e6e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 16:40:28.8116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nwd5WJNF08bpY0vjw+gRXXCvQ+b6AhGvedI9hPNyqBBJWwJLHs/2VgIxVPumDLHB3pVVKM9LiikomDtCyXsC3pUaxo8TdYWB9TRV2yHWf+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8501
X-Proofpoint-GUID: 5tLy2MUawfq8fGyEwxtuatBdYQAvA4Vk
X-Proofpoint-ORIG-GUID: 5tLy2MUawfq8fGyEwxtuatBdYQAvA4Vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Reason: orgsafe

T24gVGh1LCAyMDIzLTExLTIzIGF0IDExOjIzICswNTMwLCBTaHViaHJhanlvdGkgRGF0dGEgd3Jv
dGU6DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhl
IG9yZ2FuaXphdGlvbi4gRG8NCj4gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlcg0KPiBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLg0KPiANCj4gT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMTE6NDLigK9QTSBSb2JlcnQg
SGFuY29jaw0KPiA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4g
QSBjb3VwbGUgb2YgZml4ZXMgZm9yIHRoZSBYaWxpbnggSTJDIGRyaXZlci4NCj4gDQo+IFRoYW5r
cyBmb3IgdGhlIGZpeCBpcyB0aGVyZSBhIHdheSBpIGNhbiByZXByb2R1Y2UgdGhlIGlzc3VlIHJl
cG9ydGVkDQo+IGhlcmUuDQoNCkZvciB0aGUgbWlzc2VkIFRYIE5BSyBwcm9ibGVtLCB3ZSB3ZXJl
IHNlZWluZyB0aGF0IHdpdGggYSBYaWxpbnggTVBTb0MNClBMIEkyQyBjb250cm9sbGVyIGFuZCBh
biBJbmZpbmVvbiBJUlBTNTQwMSBQTUlDLCB1c2luZyB0aGUgaXJwczU0MDENCmtlcm5lbCBkcml2
ZXIuIEhvd2V2ZXIgaW4gdGhpcyBhcHBsaWNhdGlvbiB0aGUgUE1JQyBpcyBsb2NhdGVkIG9uIGEN
CnNlcGFyYXRlIGJvYXJkIGFuZCB0aGUgSTJDIGNvbW11bmljYXRpb24gaXMgb3ZlciBhIGNhYmxl
IHVzaW5nIFRJDQpQODJCOTZEUiBjYWJsZSBleHRlbmRlciBkZXZpY2VzLiBJbiBzb21lIGNhc2Vz
IHdoZW4gdGhlIGRyaXZlciB3b3VsZA0KdHJ5IHRvIHJlYWQgYSByZWdpc3RlciB0aGF0J3Mgbm90
IHN1cHBvcnRlZCBieSB0aGUgZGV2aWNlIGR1cmluZw0KcHJvYmluZywgdGhlIGRldmljZSB3b3Vs
ZCBOQUsgYSByZWdpc3RlciBhZGRyZXNzIHdyaXRlIGJ1dCB0aGUNCmNvbnRyb2xsZXIgd291bGQg
Z28gYWhlYWQgd2l0aCByZWFkaW5nIHRoZSB2YWx1ZSBhbnl3YXkuIFRoaXMgY2F1c2VkDQp0aGUg
UE1JQyB0byBmbGFnIGEgIkNNTCIgZmF1bHQgd2hpY2ggdGhlIGRyaXZlciBpbml0aWFsaXphdGlv
biBmYWxzZWx5DQppbnRlcnByZXRlZCBhcyBtZWFuaW5nIGEgc3Vic2VxdWVudCByZWdpc3RlciBy
ZWFkIHdhcyB1bnN1cHBvcnRlZC4gVGhlDQp2aXNpYmxlIHN5bXB0b20gd2FzIHRoYXQgc29tZSBv
ZiB0aGUgY29uZmlndXJlZCBtaW4vbWF4IHRocmVzaG9sZHMgb24NCnRoZSBQTUlDIHdvdWxkIHJh
bmRvbWx5IGJlIG1pc3NpbmcgZnJvbSB0aGUgb3V0cHV0IG9mIHRoZSAic2Vuc29ycyINCmNvbW1h
bmQuDQoNCldlIGhhdmVuJ3Qgc2VlbiBzaW1pbGFyIHN5bXB0b21zIG9uIG1vcmUgdHlwaWNhbCBz
ZXR1cHMgd2l0aCB0aGUgRlBHQQ0KYW5kIFBNSUMgb24gdGhlIHNhbWUgYm9hcmQuIEl0J3MgcG9z
c2libGUgdGhhdCB0aGUgcHJlc2VuY2Ugb2YgdGhlDQpjYWJsZSBkcml2ZXJzIGNoYW5nZXMgdGhl
IEkyQyB0aW1pbmcgc3VmZmljaWVudGx5IHRvIG1ha2UgdGhlIGlzc3VlDQptYW5pZmVzdC4gSSB0
aGluayB0aGUgcm9vdCBpc3N1ZSBpcyB0aGF0IHRoZSBiZWhhdmlvciBvZiB0aGUgSVAgaXNuJ3QN
CnJlYWxseSBkb2N1bWVudGVkL2RlZmluZWQgaW4gdGhlIGNhc2Ugd2hlcmUgYSB3cml0ZSBjb21t
YW5kIHJlY2VpdmVzIGENCk5BSyBidXQgYWRkaXRpb25hbCBkeW5hbWljIHN0YXJ0L3N0b3AgY29t
bWFuZHMgaGF2ZSBhbHJlYWR5IGJlZW4gcXVldWVkDQppbiB0aGUgVFggRklGTywgc28gaXQgaXMg
YmV0dGVyIHRvIGF2b2lkIHRoYXQgY2FzZS4NCg0KRm9yIHRoZSBzZWNvbmQgaXNzdWUgd2l0aCB0
aGUgYnVzIGJ1c3kgdGltZW91dCwgaXQgY2FuIGJlIGxpa2VseQ0KcmVwcm9kdWNlZCBieSBtYW51
YWxseSBwdWxsaW5nIHRoZSBTREEgYW5kIFNDTCBsaW5lcyBvbiB0aGUgSTJDIGJ1cyB0bw0KZ3Jv
dW5kIGFuZCB0aGVuIGluaXRpYXRpbmcgYSByZXF1ZXN0LiBEZXBlbmRpbmcgb24gdGhlIG9yZGVy
IGluIHdoaWNoDQp0aGlzIGlzIGRvbmUsIHRoZSBjb250cm9sbGVyIGNhbiBzZWUgYSAic3RhcnQi
IG9wZXJhdGlvbiB3aXRoIG5vICJzdG9wIg0Kd2hpY2ggY2F1c2VzIGl0IHRvIHRoaW5rIHRoZSBi
dXMgaXMgYnVzeSBldmVuIHRob3VnaCBTREEgYW5kIFNDTCBsaW5lcw0KYXJlIGN1cnJlbnRseSBo
aWdoLg0KDQo+IA0KPiA+IA0KPiA+IENoYW5nZWQgc2luY2UgdjE6DQo+ID4gLUZpeGVkIGFuIGlz
c3VlIGluIGZpcnN0IHBhdGNoIHdoZXJlIGFuIGFkZGl0aW9uYWwgbWVzc2FnZSBjb3VsZA0KPiA+
IHN0aWxsIGhhdmUNCj4gPiBiZWVuIHdyaXR0ZW4gdG8gdGhlIFRYIEZJRk8gd2l0aG91dCB3YWl0
aW5nIGZvciBpdCB0byBlbXB0eS4NCj4gPiANCj4gPiBSb2JlcnQgSGFuY29jayAoMik6DQo+ID4g
wqAgaTJjOiB4aWljOiBXYWl0IGZvciBUWCBlbXB0eSB0byBhdm9pZCBtaXNzZWQgVFggTkFLcw0K
PiA+IMKgIGkyYzogeGlpYzogVHJ5IHJlLWluaXRpYWxpemF0aW9uIG9uIGJ1cyBidXN5IHRpbWVv
dXQNCj4gPiANCj4gPiDCoGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jIHwgNjEgKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+IC0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiAtLQ0KPiA+IDIu
NDIuMA0KPiA+IA0KPiA+IA0KDQo=

