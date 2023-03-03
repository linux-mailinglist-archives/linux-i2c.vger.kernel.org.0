Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17F96AA081
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 21:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjCCUQ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 15:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjCCUQ0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 15:16:26 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CE417CF7
        for <linux-i2c@vger.kernel.org>; Fri,  3 Mar 2023 12:16:26 -0800 (PST)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 323JWVLJ007682;
        Fri, 3 Mar 2023 20:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=LnjbOXkxXfxDBbXTWMO/nE2uVdGPDffVYqGzE5o/zIQ=;
 b=DrYR/9LkVuZuMEpVXgJCwcfCAR1BT8FObJmwTLWY7S3gdfiDjx4ArwGzvGR+yjuyb+ZI
 2cbHG5fcWEcMPfe1bRv68m4zFOcNzj9NK1M8M9OJIL1R/IQ4Pnt0hRGrFM4xEb/quXY6
 bErK5SIPaIYCuDxrIBmuW7CXmOe/xvFJV06x3AhttGynhSMCAb8E/MIAmpP1sEA5cW9B
 LcjrniiLzUGxCL/gIzrH6tlqPL+NfsnoN8MsT+kdMFmLJAHn+LXSDrkKvZcgIyqyZrxI
 0qNrxn9ry+xR/La9nv9Mfl9zA73SNOAGv94t4AmVwri/gFbuSpotLY9iDriopWdzG7OQ /g== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3p3pqq0umg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Mar 2023 20:16:18 +0000
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 60460800379;
        Fri,  3 Mar 2023 20:16:17 +0000 (UTC)
Received: from p1wg14923.americas.hpqcorp.net (10.119.18.111) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 3 Mar 2023 08:16:17 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Fri, 3 Mar 2023 08:16:17 -1200
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 3 Mar 2023 08:16:16 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guAu6n442riD5wRPALXjbyn5MW4QgHxo46kf0iRGn2+tPOvgP9D07WSYZk3DvqvI+ILDYQm8Bka1NXXDQNSUhzywU8Mk7SeoaHPiDy2etlYyv7UviwcixWiLx71LRWuXVNgW1RjtJG0LJV1NiAatELm0lM1QnRuK2tlQbACUSYN6KV/YlEPHonFl9SdOD3ySFOlr4OXgPXULM1mz8JrTkpn+9yxN/g6Dc12q1O92o88KTYYv0hwW91W/Pr42/eoC7Cm35ssQCoQfWhFf54+chTuq4eQr1c+AbkQiNQ3J53JhFnXyOyrJFb7L21n3jUfgPmFbXPqph5uyOqKRIyjK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnjbOXkxXfxDBbXTWMO/nE2uVdGPDffVYqGzE5o/zIQ=;
 b=XXCSAGBftEqBCZ0a6pRF9Gq4rg4I/wAYgb6HjkCmuO6CQhCLVKsYw0HsS2qWKgvtgGZsyZWAVTuIVgosCSEfUS0zvrSLveO9Rle+/aJoTSqsRKjH6oBNa3rcBcho9WPc0xV1cNiZgzlxYGjuSaK/4liSDlZV9B8V3LeRgQ0u0LMfpUU93cbJVxHuqLD22FsHvIJMlV7dgvbIqz5NipGxwuLraQQThON+RvSfusfrWUNJTA9o8Nb7+MWCpCvQ4x4tyXLJfMxvy/X8/bQiiAA0PN+biDVNS97Gy7SCx41lSyXbOdO5YK9+QMjUtmGLLY4XHn94z2tl9J66XfoeZDYwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 MW4PR84MB1731.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 20:16:14 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3%8]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 20:16:14 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: gxp: remove "empty" switch statement
Thread-Topic: [PATCH] i2c: gxp: remove "empty" switch statement
Thread-Index: AQHZQx0nDxQtzjQ6fEGGOtvM18/Vua7pjy6A//+gA4A=
Date:   Fri, 3 Mar 2023 20:16:13 +0000
Message-ID: <60740C41-328F-465C-93B9-D0623E4B1981@hpe.com>
References: <20230217221330.27000-1-wsa@kernel.org> <ZAJRs051DicI2TL1@shikoro>
In-Reply-To: <ZAJRs051DicI2TL1@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.70.23021201
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|MW4PR84MB1731:EE_
x-ms-office365-filtering-correlation-id: 4114be3c-3350-4192-f75a-08db1c242350
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oX07CsyRZJ8lJCL7iYCYcsqazFJ5LkteFT4FCe5IS6s/30XAuqhAsrPEzEfU+WUBg85i+YBXCyXyTcy0PkK9stZeJ3XAzedBt3PkQURC73I6vRPZ8lUOZ2cKrjV6CK9lhpubJ9LZJ75hhuf69QnpLf8nDAQttEyAS5LEQLkujnpOVJ8oHnQGZ16YqqHt95TjLKnvaIKOI12NxLmjQriK+rYp0lpn30++PrlCp7P8PK7xxIQ3nUvyTx30sisc8AVXgS5H7FRufhQspCTUHP+pCut//ZsM59gT8eaN+IdKNCb8gHhPPCKEg9aI0QWIwEJPNSYOb4Y9qDj4oO7tDQN4Bs3UzjWHYY+01J2tG+oJCxycd7tRvjVF1wnYdZZI7y0LcUofAu0G4K3QyRXk984Q8lzh7DOqdJ2FJVsml4hbf8Dn7Jsm6qnmXfepAA6ZGmQUzi25IIb/fIfJD9vD7eZvfMRMoxQWfX2pbiF+SDIejCePWSE7dMEFNo1FmQgMoilUXHZhevsDm/lRh4LDJQ92cUqo0/+kuQ4Q49Q00mQfeY0ZRDyDhH2+7dDJE5cIRyuukg2Ra2HeAe/TdZhyDRwyma11g0GpNRS1r8Bjath8tuUdlKaAIrXRn4DOrxplSxWglc3r66pLP/DyDtEvZqyr6y5bVGfs6DZBC85rdvvUU/mi8dYKPUW4ToQowe4/JgfktYNudePFR5tdlpwwByGnlENTp1x8Jhw/eTgbB0/VYM4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199018)(66946007)(83380400001)(6512007)(33656002)(36756003)(8936002)(38100700002)(5660300002)(86362001)(82960400001)(558084003)(38070700005)(478600001)(71200400001)(2616005)(186003)(6506007)(6486002)(8676002)(64756008)(76116006)(2906002)(122000001)(66476007)(66556008)(66446008)(91956017)(316002)(41300700001)(110136005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTltUUpjc2Jsb05QN3h4WUljYlFxSFJvalJRTGhHU0IvWkRHV29pVEp3ck9Q?=
 =?utf-8?B?Y1lCbFJYa1kyc0NtcDlldDI4VGVoTzlZMTd3bXdDZUJSR05pNCtDbFU4SUlQ?=
 =?utf-8?B?TVp2aHVYNVJhL3JBcGpkaHlET0lhdERVcmNMRnB3dFdPSVhHeWpVblNLZW10?=
 =?utf-8?B?WEhmRFMvem9zY0NlNE1sN1NxS3NzckorZkdTMDBBN2hmaTk3aE01cm5vcmRp?=
 =?utf-8?B?M3BsalpUR01sbGg5S0x1NGI4WUw0UWZuMnk3TFFSektuRU5zb3pjY2h2VExQ?=
 =?utf-8?B?QWk0alJYYTlYVVdUUEtQV0FFQzRGcTZvVk9FYStYazBaWTF6cEI2K2ZkL3hL?=
 =?utf-8?B?MVNtTVV4Q0QwZU9kemxkQXQzc3lBOUp0ZEZ2aGYrd0tkZ3hhOWlDeVRYNkpU?=
 =?utf-8?B?NXl2QmxZOWp4WWVhdkJwbnFsdXB5NHpaUW5iUTIwMXBtYzFEWmFvZnpxT0RZ?=
 =?utf-8?B?TWQwM1lVdm0wMmVZWGZYZHhEOElUdVZRT1htNFhHTU01MnlRUmdTWUpycXBq?=
 =?utf-8?B?S3JVK2w2dHpIekQzM0VreVpVd1Q3T3pLUkh0dkw0NDFRS21YYkRaOVQ1cHZT?=
 =?utf-8?B?aWxZSTYzbWtVTVRMNG1peng3NkNJdUdHSkFmRnFNdVVPVUgvM2x1c2FBWHhl?=
 =?utf-8?B?WnhTcWJxRkRXOWsyMGNJQjZvb1lLWDJDb2trN3FSS28xTFczWjlObDJmRGNs?=
 =?utf-8?B?Qk4vU2RmMEJuUUliUkUwelFGb1RBQm1sR0hlTGRBejJnWnllR3JtWTRRM2VJ?=
 =?utf-8?B?U29lT3dlVlBkd2R3SGJSbHJZQXI5d0xXaGVFYjlWc094RzBCeUdmVndJZUlS?=
 =?utf-8?B?cVRhR2dTRi9Ga3R3YmJqVE5CU1JlTlVNWHJYLzJQcDV0QldXbmtXQ1hPU0h1?=
 =?utf-8?B?ZDF5NXVmRlQveGU1UGh1cjNaT3pXMHIxUU1VMGFya0pvMHEvMXdIODVBVlVl?=
 =?utf-8?B?R015eUcycU9FNldmQWplWkV5NCtPejJ5U3VodVVQc1o2WlllVmlLRCt2NEJG?=
 =?utf-8?B?QTF0RVQxYjlQMWhTb2daWjZ4V0M0S2x4b3F3Zkxzdkh1MDFhcVZudlgxR2FC?=
 =?utf-8?B?TVptYTFRQThGV2FrZmJEK0dNSGpZUGRmeGczUUJXQ0FxNWZtTkFwVFlhYkg1?=
 =?utf-8?B?eWc4YU5lakZtdGtZbnY5VE5WYnVjRHQ2REE0ZXFJM3VuQWJIM09aWWhiUFQz?=
 =?utf-8?B?RkdJOFoveThLMTlwb0xmTTk5R25QOWhBWjlBcXNLQ1lkd0hSNHNQL2U2dXBS?=
 =?utf-8?B?UUFsc0ZmRHg2VVFZMlJOQnBTdkpXek5aZ21JallNM3BpMFVkUS84T1RDbkVL?=
 =?utf-8?B?bW95VCtWdnNJSWJnMHNSTUxSVENFaXFMclFYdkNZcFIrWWg0aGtUdC8rN2tt?=
 =?utf-8?B?OXRTeFg5TjY0ZWExVDJ3aEJHRkwvOXBEZmwzenBodXV5bmNiOUhGajl0Qkpt?=
 =?utf-8?B?NmdOK3l2RnFqelFWTWZpUS9qN0gyZDcyTm5vUGlWbWpvNGt5aUpmM2dvVlJW?=
 =?utf-8?B?a09ZOENxZThCc1RXYmVldFBaWDZxSlRFVmw2OWtkaWhmdUZUZE1TeHFNL1Ja?=
 =?utf-8?B?N3RsMndMNnJIdzNmb0QwLzdFcWhaZHhJWTF1M0pJdjN1Zy9NaVl6YXpCYTc5?=
 =?utf-8?B?U1IwRkN3YlgvL3VFNDByb2J5dlRlT1h3VzUwbzkrMUVtMFVIZ1c4OVFOcEFX?=
 =?utf-8?B?bmI0WnV2dU5XMyszWEtIUW1GOVVSSTNxYkFBU3E0K1hIU21BZDVsekZnVDF1?=
 =?utf-8?B?RUpQRVZTbGdkcnhSTk5LY3pPb3Fia0FIY0IvcExBWTI5TGl1bDJZRHVtcHhY?=
 =?utf-8?B?MW8xejBLUytjRGx3MllCS0k0ZDBYa2ZlZTlCVndzRnFBcTVDQkgwdUY0b2k4?=
 =?utf-8?B?VkdhWHVrWmdORDgwVExKSFNBOGlsOWFyMHdDajBBU0VuajEyRlpvUkxoRGtv?=
 =?utf-8?B?a21KaGx3VkNJNUJ5NU9TRjlzNWZLV1hOOGZLRjkrYTAwS2xqWVl6NS94Sisr?=
 =?utf-8?B?TDZvMmt1WU1lSHA5MkhtSXozdlNZNW85ak1Gam02N0o4KzQxakZVdXpGbG5n?=
 =?utf-8?B?VHVadWxmeWJ5SE5YVGFGSkJJRFk0ZUpOaTBweC9TWEpYemdXTExQVXRsd0xX?=
 =?utf-8?B?dlJTSlhYSElaTURsNC9RVndCdnlQaWNzRFJ6dmlCTm1veHlWa251bktTcSs3?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C98E3E8B9B5F44CACA568C1388B8FAB@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4114be3c-3350-4192-f75a-08db1c242350
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 20:16:13.9810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F50ifICYDHskHSl/OcGWmmKqmUiYM5dHRsCbnxSF53l3eYVw9g3M37QEdTiGKrsIODDFVNK1ewsl6MiOG2jO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1731
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 4AWrziUFnj8PDSoUo_qoqpooJqJqcbJZ
X-Proofpoint-ORIG-GUID: 4AWrziUFnj8PDSoUo_qoqpooJqJqcbJZ
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxlogscore=492 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030172
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gTmljaywgSSBob3BlIHlvdSBkb24ndCBtaW5kIHRoYXQgSSBhcHBseSB0aGlzIHdpdGhv
dXQgeW91ciBhY2ssIEknZCBsaWtlDQo+IHRvIGhhdmUgdGhlIGRyaXZlciBwcm9wZXIgd2l0aCBy
YzEgYW5kIHRpbWUgaXMgcnVubmluZyBvdXQuIEknZCB0aGluaw0KPiB0aGUgcGF0Y2ggaXMgdHJp
dmlhbCBlbm91Z2guDQoNCg0KPiBBcHBsaWVkIHRvIGZvci1jdXJlbnQhDQoNCk5vIHdvcnJpZXMh
IEkgZGlkIG5vdCBldmVuIHNlZSB0aGlzIG1lc3NhZ2UgY29tZSBpbi4NCg0KVGhhbmtzLA0KDQot
TmljayBIYXdraW5zDQoNCg0KDQo=
