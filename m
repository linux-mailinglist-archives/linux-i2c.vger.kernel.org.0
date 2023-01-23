Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8828367802C
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jan 2023 16:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbjAWPmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Jan 2023 10:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbjAWPmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Jan 2023 10:42:17 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1CF2A147;
        Mon, 23 Jan 2023 07:42:11 -0800 (PST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NFP7TV020838;
        Mon, 23 Jan 2023 15:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=staV8E8UsGF0OgPFkM8Pljr/cfZ6mTpQtAQg7g65AA4=;
 b=aRxjxn3EqMnhK+1FpuGfSMgvZYSXkLlIQ6pyqrZOT7pwjtlKy1ybv6Qn3vVp1i9Eq5c8
 GY2PoZrXX0YA32g2T3hqLaQQP/fZvhbQU0NCQeI21DblxOvvwwPySdYx2+GUf1YBhkC3
 BP9DHTXWZipEqWErVbCu+qm8K6MWEoAN9fqnDKYtNDfVoDopdXpccEXCdfZ/yLEJ8dGq
 VmSbB5TvK3twm77YazxYtDLUD8aaNZ2Fl0z9HXWME63r8jw8PvR1POFMAYSyuO58UB7I
 JA7JOa9UCS09ypS8UQRUJpkmUKayYTg0mP5VZ4B6tDLthe+O8RfpMcikTvNkVVLK1B7q mA== 
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3n9vuwg5gb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Jan 2023 15:41:34 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14881.it.hpe.com (Postfix) with ESMTPS id BF7B2802B99;
        Mon, 23 Jan 2023 15:41:33 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 03:41:33 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Mon, 23 Jan 2023 03:41:33 -1200
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 23 Jan 2023 03:41:32 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbIJ8uegzuLHTGcopzCG8t4v0R1lbxeEYDFLVRwWQgY5owD3Vwsi1f+t4STAh50I6hOZBl1+iclPeyIKSSoP2ccrAOA4sX4Ztl8t7zWw1lyGvCWdEMQuzxisXvWkplaBsumKsMm2fU1kB5xPfziL3YuCnmjeEjiBYbtXx0n6gOX2K2PnWls7mc+E9t5YBvoZ9hMFcACvXvoffrlwALOCz4ob+W4wUcO6rwVxJof6gj1IKpcAgq1nKYtqOd7HOTDPtSn1mBHko/VK40WHvva7aLUXUkjF/UXGAe++NrXUxcguzsRAWIgu4snjwFxvGa98ZZmAP1LSXEX6IhPbOX5abQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=staV8E8UsGF0OgPFkM8Pljr/cfZ6mTpQtAQg7g65AA4=;
 b=fzmUA0qpXQxYr0R2Y4s7dj9Ox45x7NIQ4JzvKxPAOtiy6voD74Qq7IjB5m1q4hEHbuGNB+bTUdeYpCJXHqdJ8lqD4zZNOZDdf7ywYsn6H2G7tMzXB/McMUxCNVWOuS7ivTUf4mnFkM5Hy6sxZ9PIk0WMR296iNQVtelJP1jwaxTjub5X6S8BMh2kWTQ4s2cn73nmQAIVXIGcmlfkkv2ykLeUO520JoqYH/SbqR49YyRgdJZQ6Gjhjkgu5dyOe3pJBr0Ch9TvZ7MhGasZ7zy032ZKB4hCrtD6D85Hm/7HiUJM4XV11Huj48Jx3RqPBGQPJTved5ngpgfNr8rqOozIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 MW4PR84MB1778.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 15:41:30 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 15:41:30 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Joel Stanley <joel@jms.id.au>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/5] i2c: hpe: Add GXP SoC I2C Controller
Thread-Topic: [PATCH v3 1/5] i2c: hpe: Add GXP SoC I2C Controller
Thread-Index: AQHZLQH+Z3hu6r0p/ku88iaKBUtSNq6reFuAgABLXYA=
Date:   Mon, 23 Jan 2023 15:41:30 +0000
Message-ID: <B78CF79F-A54B-4E44-97F3-7D93763D59D3@hpe.com>
References: <20230120190159.23459-1-nick.hawkins@hpe.com>
 <20230120190159.23459-2-nick.hawkins@hpe.com>
 <CACPK8Xe46F4Rk1jkLzXdzHE8t_HePe83teTrwUoV4wMvOn4_CQ@mail.gmail.com>
In-Reply-To: <CACPK8Xe46F4Rk1jkLzXdzHE8t_HePe83teTrwUoV4wMvOn4_CQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23011802
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|MW4PR84MB1778:EE_
x-ms-office365-filtering-correlation-id: adbead16-49ca-416e-4f4a-08dafd584c64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 30d+qV55poHI3ZKRnaOluBaIq5JVgEzwI3ig4orb79KEbwyXC/OeXSL3mL+T1evSmSxL2sk1hcEo/wSJjcXZ5d7AMklmL4kCJxjDkCFnuq9Gc4YsQRHwT91eBtp1nGmz1IYP64e5q+kQLDddUCUHlJqE998D4LVGQl66i41FHgfubJbX/neVARq0JAb8poRXZjuyuPW9jgm1yMcWG6zuO7n2aVDxEGf9mqbvFh8jZyK4aCuWLE8kl11/ldmhfRI429nse1VPI5WeuUf//WsrHGcR3dZ/7pLVR7G+rCEzzFsayLDa0XNAiA1XaJDshu8F5yNvTwJQH36SajvGgnh6bLSS0CxqIpyPin5NH56uVndVs9YONeiaNAeT0AhkHgYu+sUqRmrKpXhkGmeeMLiP1g9biNvU3DCp/0fPGF0QddBIgNenO5wTlrObvyu+iVH7er/1fzc700KnVHKGdBrXq2qqDw+RfoIPBf1MTiCdPXTJgTHkGgzlD0lzoosWkl3KC7CQfWNN8jPqsBcIGdu0uzpPX1vSL45Y1fiGZYGvrXDGb94mz7OkXzG+LG8UVSzjSX9Gy9AC2HZr6MxRjNArHJcwHbGYHTIv7me/1bhMLm06OWxUNML1VW6g0qlip4SQdsgW9jN+Q+bMRnMegZVatQWSg5OcgB/tL6+eA0UhGF1ClNDveTCFv/G/ZhJtMdPfcH7JNSYYYGgY15tuXk1P59Gvup3N51yir59Hhkka0oY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199015)(83380400001)(38100700002)(122000001)(33656002)(38070700005)(82960400001)(41300700001)(86362001)(2906002)(4744005)(8936002)(5660300002)(4326008)(8676002)(6916009)(186003)(6512007)(6506007)(66556008)(66476007)(316002)(76116006)(54906003)(64756008)(2616005)(66446008)(66946007)(478600001)(91956017)(6486002)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJIM3o2SHorZUVUSmJBZnFlZUMzOFdpZlN6WDJIdERsQWczZVg2WlNSTUto?=
 =?utf-8?B?UGMvQWVCY2hTNjhCd1lZUlNiVFZJUHNOME0wVlFsWlNFc1lMV3RydVdiYkxk?=
 =?utf-8?B?djlHb1lZOU56QXFlaGRabUl6QUFXWVM2aisrMDk1SGk1UTlWUUtoTWZFMlli?=
 =?utf-8?B?YlpLNEJZNFpncjc1dGo2SHNURDZCdHRwbnZGcnV6eU56OWQza3R1eVZydndE?=
 =?utf-8?B?dUtlaFFtYTRiMTl4RkxYVXNlWXYrSllEZ0dmMFRPbG9uVXpDVEZUakhwOG81?=
 =?utf-8?B?MHlzTWtyem5DNDVvSElzMWNKYUZNMmNsL3NyaWpzTDdDTExBSHVKMHRXakx2?=
 =?utf-8?B?bnFPVE5rVUZ1aGtCVklUMWtpOCsvQ1JTOTAvVjFZeUUxUlpOai9UU1JGekpu?=
 =?utf-8?B?STVXT1BtSi8vSVVTQllNU0U0WS9HSDhVM24vMWpqL1M5dlE0TkRjYUdOeTVT?=
 =?utf-8?B?anNpLzREcEFMM1hjRzNxRkt6NVRadC94OXJ3ZE95SkFFUW5Yak03WjhzNFVr?=
 =?utf-8?B?NVpOd3N5Tm1obWdtM0hBcEZydnc5YWpXOGd6bFNYVjUxdzhncEgrYnRUdEQ2?=
 =?utf-8?B?Z1U4cngrait3ZmpRMnJRWmEyVjV4K0JPV3JpM1M5UXRKQ2Q4RVRhR2pXVmUw?=
 =?utf-8?B?N1RPeUZPMlljNzdEK2J5UXNiOWE0Y3d4eksxKzl6NHdQTksrV2JseWVPbFZZ?=
 =?utf-8?B?cWJoK2V0eFNrQXlJZExQMkxXTzROaEEvRG1rcnFPcXBGMjRINzRST3p6R0ZW?=
 =?utf-8?B?K2xxK1FnbmtQUzlob3U1Y0k0T2RIZm1peDFwQXlDZGlTSkowWG9LVSt3Z1ht?=
 =?utf-8?B?cmgzNzEvcVY1bjBaZWphYWw1UWV1eklGNzdnSDdoRS9iS3QzWklBMEpPeDRN?=
 =?utf-8?B?MG5rZFNqMkpLQmwxcVVHZlNUY0pINk1Nd1AzY1J2cjducXVhRElNblFwWFhE?=
 =?utf-8?B?aWdjOFdvemMvRERPbDI2WlNDRUZ3bzdQb0tPekpPSGhvQVZKQ0xqRHRsc1dy?=
 =?utf-8?B?NXJFd3lEUEYxa2hSRHFLSElvUENYVlJ3MFltTmlaZk1CZWh5OFltV2lVdGlR?=
 =?utf-8?B?dnZBNTQ1K214ZGs1V1NDU1AyTWxYYlh0RDVYV1M5QkJKMVZZT3FJRjhVbUdD?=
 =?utf-8?B?UDZ0VVlsK2pDbkppRWJURUlvc0tHRFN6S1IvbnlUVEUxaW1HZXRXMEVxNFNU?=
 =?utf-8?B?N04wMVJNM0hBSlRDYzY5RzUwT0MxZGtBQnFocUs0RGc4aTYrTUdzOGpsdG9J?=
 =?utf-8?B?SVlURnZ2L2NyLys0UGxPdU5kcVlLb3lSamJmaFFLbVN0R2FocTd5c2dXdlNx?=
 =?utf-8?B?enVTWmFYdjBoUUVVcmFlL1hDVklFNitTNDZGNCtzTWY2WG85SnUyelJXa0x2?=
 =?utf-8?B?TEVOdEgzWHdhVEtBZ1FCZXNNRUZ6MnRkZDFNWGpoNXIzdVpPZkpiNzlHYlpp?=
 =?utf-8?B?VDRCSVNlNW13M1haTjBubkxCL2cyb1pmVFptelN0TTdQSjBtM1Y5RWZmc2VB?=
 =?utf-8?B?K1g0TXR6K0R2by95aXpnbmZqOXBDUVR0M1BDUWhSaFYzTDhOL1dhemxReDVy?=
 =?utf-8?B?NXArbTJsOGNhdkRTRXBCb00zRTVWRkxab1ZKeWpHbGFRZzltVXlrcUcvTXFn?=
 =?utf-8?B?S3dOb3FiNFlxZDV5ZHRrQkpmR3pVeEdJc3pOTEtaTG1pY0M2N0VqOTY3K3l5?=
 =?utf-8?B?VWFmZDUxdmpvSDc0b2JyWXJNUWhkUThMd2hKWkdMc3BienMwK2xUTHpIVTIx?=
 =?utf-8?B?REk2YllHQjhob1FiTVBKV0JycG5Jc2JBaFBBdjBNa3VhdUdkalU4UlRmMmFT?=
 =?utf-8?B?ZVZGeWVieHU3Qis3TmZ6WXhNbXBFWTNWYU1iV09xaGMrSGtodVUwVDlNRDg4?=
 =?utf-8?B?MmZvb1BkcGkvYTdoYit4d1hJOHlTekNxZWk0NUhqN1Q0K3dBNHd1SExBbTlk?=
 =?utf-8?B?S0V3ZVd3cHg1ZlJhUnRvb09zMmhzVjFQUzhXbEkrMzVUekJ5M2xxVE94WEI0?=
 =?utf-8?B?bjJsQmhzQ25nekRTdmlERUJ0SFdKNGF6Z0VaaTdFc1ZVK3V3WlN2bFJROURy?=
 =?utf-8?B?SnI4SWNpbXdSRVB0V3VJbFp0ZEtZeW9NRmJQdHA1am9EQm5yV2l0UXJOdnVh?=
 =?utf-8?B?dmEwdTNuUG56WEpmVC91dlEyUS9TS1dUdW9vcS9YdDh2a3NNVi9qME4vSUo1?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A085F89531737B459B853E938D03905B@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adbead16-49ca-416e-4f4a-08dafd584c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 15:41:30.6781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xs2E15zFmXRHPq6l+XaxFJ1sfHvx+1hNYIQmOvAsfsxsO/gnLwbD8vHtracREYwo8QayiR8yZIvuBhwUmKg25A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1778
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: yx5DH4ZfcSedsLKMtf24i8JXiXy8ukwF
X-Proofpoint-ORIG-GUID: yx5DH4ZfcSedsLKMtf24i8JXiXy8ukwF
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_11,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=613 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230149
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQo+IFRoZSBpMmMgY29yZSBjYWxscyBkaXNhYmxlX2lycSBmb3IgdXMgKHNlZSBpMmNfZGV2aWNl
X3NodXRkb3duKSBzbyB5b3UNCj4gZG9uJ3QgbmVlZCB0aGF0IGhlcmUuDQoNCg0KPiBJbiBteSBy
ZXZpZXcgSSB3b25kZXJlZCBpZiB5b3UgbmVlZGVkIHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6
DQoNCg0KPiArIHJlZ21hcF91cGRhdGVfYml0cyhpMmNnX21hcCwgR1hQX0kyQ0lOVEVOLCAweDAw
MDAwRkZGLCAwKTsNCg0KVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIGNv
cnJlY3QgdGhpcyBmb3IgdGhlIG5leHQgcGF0Y2ggc2V0Lg0KDQotTmljayBIYXdraW5zDQoNCg0K
