Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28B5699D4C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 21:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjBPUDW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 15:03:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBPUDV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 15:03:21 -0500
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FD0497FF;
        Thu, 16 Feb 2023 12:03:18 -0800 (PST)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GJ6tkm022298;
        Thu, 16 Feb 2023 20:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=Ut/XrpIAnDol2ngz/eGxyoIrsOtMVWmbsalFcWTOIZQ=;
 b=JKxeC54yLo0WVDoSrWzlPOfbBomxYQfv+QWa8Dlrz3ZHekmpOASpsDlSUajWV96vdLOc
 snvOIPdMzezRFEHM98NvG2eNVV6p21nfpA3YSSvG7PsAjNptUa+uMZoiT59vFKBM2tD7
 2O8wGe8BQOVHrWeU2Imjb3bGLqEN5ff3suGKMwHbzOKz8LG2Duv8IibZvQ8WxGVv/IJX
 sf/KWgd52WDniSaNSRqgYArI27rN2IN5Zi45jV4phudqZVTDCrQRecVSsEgL2sSADx5k
 p7WCxnQNR3xlbWCXOXlL8MDqPH3f1UtdKkVUH+Qw/OnIhZK7IhtEWHC36oB/IWGtUYEB YQ== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3nsq0ajd28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Feb 2023 20:02:50 +0000
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 8749E80035D;
        Thu, 16 Feb 2023 20:02:47 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 16 Feb 2023 08:02:47 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Thu, 16 Feb 2023 08:02:47 -1200
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 16 Feb 2023 20:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NowHxK8Ue+QwXjvbOAR6fDhQrxubNd9Qatic6QkzdrPE0TNSSmi1JfOy2YF06y9Ui1IykzGIK3e85ovo9xum1UgyJ7jximad+pxAeCf/Ec/jRKQLbaq/k19evZi00IO/h6kpwGhaa+kwZBauQnythRl80+y1m/y58+VyxsA/+JVI0yXaLF0u6wslAtEi12TQc8WBRV/U+0noes3iYdybtzN/8jcOJ/jHqYgOt4PgUBYxh4FAZ3EUr2+3WWRapNwN/IU5oL1nRIjYByUd9AjOyVVXb8NdPGWQRoUPTTpoxMKqAe5P/Go2hqv7T13ErdYOAqB/Z+S18cghifCAkMy9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut/XrpIAnDol2ngz/eGxyoIrsOtMVWmbsalFcWTOIZQ=;
 b=edsQDGF1ECMSn6izsaKSR43tRriQfby4rpXyP1/+DiPnAE0+5e72bY+a1gTC50cif4XuUUrGi6aYagf3Y3HaF26bhLadf3ZFHGvid0Gdgo0TCrsuwHphi9olbSlTIXKT7nPKgxsewwS9WemfrALnvAKkMFYhKLMviW4rVXCtQ7NbEJ5swjsbjRmn7T119Img4x1Bc2NRTxPE40KOOXqQJ+eF390x8xAWKcp4F/wXSKjc2z10jfDWa5QNGd7Ek6fiGDxJ98IxpFUNw6oItHY9dOWqTbB/Lv4/7RRvUd3SQSY0fFpkZEIBA/4y/NbcIGJ5guTN8G8+nTqzDiHkJWap3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 PH7PR84MB1677.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:150::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 20:02:41 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%7]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 20:02:41 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH v4 1/5] i2c: hpe: Add GXP SoC I2C Controller
Thread-Topic: [PATCH v4 1/5] i2c: hpe: Add GXP SoC I2C Controller
Thread-Index: AQHZMO1r8VxZOPzEg0me3QQmpPk0Tq7QlnYAgAEmWAA=
Date:   Thu, 16 Feb 2023 20:02:41 +0000
Message-ID: <63020BDF-DD97-4828-B464-8DFF94A2B794@hpe.com>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-2-nick.hawkins@hpe.com> <Y+1Alvn3eepZ6yAC@shikoro>
In-Reply-To: <Y+1Alvn3eepZ6yAC@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.70.23021201
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|PH7PR84MB1677:EE_
x-ms-office365-filtering-correlation-id: 2791fa47-88fb-437c-832f-08db1058c306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FLealsxlPJH2ABAAbmwDAVH4N2dtYQQuE2jPKeY33Di5+FrQjdwBHVvZGH3vq6Mo4xKxfV/dx34rE2dUWBxzJ61uk2XhxCVssqixZZioi0DqLw0FpDZkv6qUrzARXfAvSyUKDEhSvIEtFUpEUoTmkgHGcfe+fGl7coxcrmcppazwAkeM/5q79ir/n7PuYK97VehPlAz3ajH+/IOwYnKF2VA3D2x3WjXul1EGlFlTBptooA5n3cDqphSNSJzTz8CjJwZT1CnKTSGSqOlr4yGuKgmAb654seXT9pIVDkHcrCZuubLrHEe5DseBD9IZZmcCUAhWZM5GffuYIvEH247F0qeutyG2q4ofuTgw3YvWeQjrm0ClzPfNJxdzdAgM0AZOAzTz8J+gzI8roMEtkCOMiow9qhU0Wd9QWB6gsSRj/JLQvco4zZNjdE+RLkBFPN1jZlWFJQB6gpPmoxGeCoUy1D3Tkfo0fVcZ6Pd14w2uyWcEa/CdiQb/reWXXcTcXkgnEdC3+pY453v4HZDfQiePyJd4P50qUYymzXEkVmPgKKeykXfbFex9iJqar3skieG4QAjWihyx9dLklprtJHrx2ZR9eewQq1jbSKpNUADzo8VixrIvRLngDQ3naMlvfro6Dsg+7khe5ndqfQO8TqhbhyXLU2loR2fU8QUDf25nyU7jIK7oSYy/CcZ/A4Z6nKZUeCqBqsOUs//w28MSLvHaS35h0m24HxAmHRZ9J0cLWCU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(76116006)(66446008)(64756008)(38070700005)(66476007)(66556008)(91956017)(8676002)(6916009)(4326008)(41300700001)(82960400001)(38100700002)(66946007)(8936002)(316002)(54906003)(6486002)(4744005)(5660300002)(2616005)(122000001)(71200400001)(36756003)(33656002)(2906002)(86362001)(6512007)(478600001)(186003)(6506007)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0tGTmIzTUM3UUZHTEY5UzQwSUZmZTFwTTZVUmgwWE1Cbk5oVFlUVXcxMmE0?=
 =?utf-8?B?UlhCV1p0dHR6YTdRNU5KSmVXbEJhYmhzcFFjTkl5ODN4blByVGhsQ3A4MHdT?=
 =?utf-8?B?elVjMFErQTB0U3BQR1ZNdnA3amxrRm9uNElzTXFkdGIyZzFWWUFPenc3TWFP?=
 =?utf-8?B?K3R2dWV0c0NTSHdjeVpYcnh6SFY2ZDhybWIzdldOWXAzVkIxWUhkeWx3SkZY?=
 =?utf-8?B?RTExZ1RzTnZXdVJVQ2ZWK0o2SFUxUnkycktOb0NzYnRvVzd2QUpFY1hLM3lv?=
 =?utf-8?B?RlBLRWQzd3hQd0dMazk4WSs2QlJGa3R4V3pqUVd4MUYzNDduc0VZNCtUbTZj?=
 =?utf-8?B?Q1JtcXhDYmZrNjkxNUFSUmhDMitjZEJra1daWHJpTVNPcStDVkdvV25XZHNq?=
 =?utf-8?B?U3BKdG5PWm9qbUhGRHA1WHFOZWZtd3FJNTZNNEZsaE0zZHNjazJkeUtZU0Y3?=
 =?utf-8?B?TG05alh3UFdMdnRIRzVIdTZjRTBlYzNwT0xzU2xmOHhEVCtHOVB4ZTJQY3hk?=
 =?utf-8?B?dmFrRjkvV3UvbHl0NkI5SE1qc2ZLSkR4dGJYL3A1TUhWaG00anlLQzIvajdp?=
 =?utf-8?B?RkF3Nythc1QxUVFmZGJ6SE04S3J3RUkxK3NmVDZwZGMvNjN1VzFPUFJlWnVw?=
 =?utf-8?B?SXBSTDAzT1poWVpKQ0F4ek1SdDdsbmEveURvd0R5Mm42RlMxZ0pKYjFRbkVq?=
 =?utf-8?B?bVljQnA4L1ZtZ0pPYWlnWFVjbXZ3VWxGSDNxeXhXM2NWVXdKMnpJUnp3bTdB?=
 =?utf-8?B?S0ZFVkpxbHhMRDZtdVJJT2lDVDFzbzlsbEJZWXY0cnJyS3p0ZGZWWE1RaENS?=
 =?utf-8?B?blEwQ2dJQnRTSHIxTTRIVnNoWGM3eHpQdEpCT2dQQ1JQak5HR2J6cEpvY2tE?=
 =?utf-8?B?ZE8vTU9hNGYvSlNJcXc3dnJObzV3WjZ4VTdydFFJR2V0WTVKMnZvc21zYTBF?=
 =?utf-8?B?RHhmOW9lWGs4clBDaklDSGlXTmJXYWlHek42VnBSdmZZcFFpV201Um50Ympz?=
 =?utf-8?B?aUs1S0hXc2p1eHdqTDlPZDlBQmVhbVppTC8yTVV4eVlpaDdMdHQzZTRqUy90?=
 =?utf-8?B?RGl6ak1MeU1mQW4yTWNjN1Mranppcjd1ZzA0S1NiUVdhVUh4VDNxK3JGc21F?=
 =?utf-8?B?bld6ZFlhOW9BNC9JQkpEeVE2R0tKYkdhSzY0U0NMOWFGQXRXTi8wMUhQNGsv?=
 =?utf-8?B?Q1hpcHVwRlQ1YStZUEI3dkxoak1VSzhVSGttWjVtaFcvNWVnSHNtMTJWTkRu?=
 =?utf-8?B?M1ZyYTM1bjVKckRNeXladVF2TUtiMjA0VGFuSTJzeTduNllPUE01cnQzaldn?=
 =?utf-8?B?SUpDaXVOV3lzWE5LLzBTT2xtU1BMRkZOeG5QVThpR21aTXRxdk8xWXBKWVRr?=
 =?utf-8?B?TGZEb1ViQmlZUFFzWTZxajEvandRRXVGcEM0VXZ6a0pIVkhBU3BxNlh1N0d5?=
 =?utf-8?B?U0UzdE9QWllPL0Y3MVpVbGhNL05wSkhjSDBZQUx1SVVvSzZmVFpidjJUVTdq?=
 =?utf-8?B?UVp5OSt2TDB1QVZRSkZKaW44Ulh4ejdkSFcvZ1dwcHl2WWpCMFI1MGZpb3A2?=
 =?utf-8?B?N2RtaUV6TTd5M1ZHdXlxYWFBQm0zVUthYjJNV1NZOGROa21mRi9WZ2NBMnc0?=
 =?utf-8?B?MkhFUEl2UW1LK3FweFFmTlFXZzk2SExqRC9jYXhBWE82bTZQVnJNU1BJVVFz?=
 =?utf-8?B?SzN0WTVNZzBjMmp5T3dLZTVLR3pGMHowSlhqRjQ5eFpVNi9GRXV4MlYwSjVh?=
 =?utf-8?B?RkZOY1BSK1NxRTNWZSt5QTkwRk53RmRMMXA5dGx5RVFGQ0ZGWEdoajhOYkla?=
 =?utf-8?B?WUxXMEdiMVF3WWlINjVUckJTOU1xQ0t3emZ6c2xiMisrdVppdmE3VjBKeDd6?=
 =?utf-8?B?WlNpU2NXRUg3aHdIZ2JnN1VXOVRCbk1KTnIzOUE4bEF3VnVEcGRkVUhBOVdh?=
 =?utf-8?B?ZVB6a1FDY2pCMXFNMTZLelgvbnRxYWlybDJoUTRrM2VGT1p6SFd1VUxqUDhF?=
 =?utf-8?B?aGdsa0VTNXZEQzl0ZTNCS2xRRWdWWFJXb0VnYkhHd1BFejhlVHJOMStYVXBw?=
 =?utf-8?B?Rjhid2JCSGRFbndLQmFINGJJWkx2ZVZsaXgrYTM4U05BVnQ1eXZzT2x5NGlO?=
 =?utf-8?B?ZHZ3b3JKWndZVWtGTWUrSjhucDNYeWxvRUowR0JzT3pYV3VPQmJSM1NEdk1T?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04F98131AAA08746805B338424A0B039@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2791fa47-88fb-437c-832f-08db1058c306
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 20:02:41.7582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaPrXFqre9MWPGOl5lLI8Yo8584u1zRkiOCjhQYn+J/9ftj6JVmh59RmKUWwBu7ALq8VbDoLWbjUtVsIMmKZiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1677
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: G48MJojEa7XAr5Ofp2B61LgfLPOnqHGU
X-Proofpoint-GUID: G48MJojEa7XAr5Ofp2B61LgfLPOnqHGU
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_16,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=845
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160172
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSAjZGVmaW5lcyBmb3IgdGhlIG1hZ2ljIHZhbHVl
cyBmb3IgSTJDU0NNRD8NCj4gQlRXLCBpcyB0aGUgZGF0YXNoZWV0IHB1YmxpYz8NCg0KSSB3aWxs
IHdvcmsgb24gdGhlIGRlZmluZXMgYW5kIGdldCByaWQgb2YgYWxsIHRoZSBtYWdpYyB2YWx1ZXMu
DQpVbmZvcnR1bmF0ZWx5LCB0aGVyZSBpcyBubyBwdWJsaWMgc3BlYyBhdmFpbGFibGUgY3VycmVu
dGx5Lg0KSG9wZWZ1bGx5LCB3ZSB3aWxsIGhhdmUgb25lIHNvbWVkYXkgdGhvdWdoLg0KDQo+ID4g
KyAvKiBVc2UgcGh5c2ljYWwgbWVtb3J5IGFkZHJlc3MgdG8gZGV0ZXJtaW5lIHdoaWNoIEkyQyBl
bmdpbmUgdGhpcyBpcy4gKi8NCj4gPiArIGRydmRhdGEtPmVuZ2luZSA9ICgodTMyKWRydmRhdGEt
PmJhc2UgJiAweGYwMCkgPj4gODsNCg0KDQo+IFRoaXMgYnJlYWtzIG9uIG15IDY0LWJpdCB0ZXN0
LWJ1aWxkLCBzbyBpdCB3aWxsIGFsc28gZmFpbCB3aXRoDQo+IENPTVBJTEVfVEVTVC4NCg0KDQo+
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZ3hwLmM6IEluIGZ1bmN0aW9uIOKAmGd4cF9pMmNfcHJv
YmXigJk6DQo+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZ3hwLmM6NTMzOjI4OiBlcnJvcjogY2Fz
dCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdlcnJvcj1wb2lu
dGVyLXRvLWludC1jYXN0XQ0KPiA1MzMgfCBkcnZkYXRhLT5lbmdpbmUgPSAoKHUzMilkcnZkYXRh
LT5iYXNlICYgMHhmMDApID4+IDg7DQoNCkkgYW0gY3VycmVudGx5IHVuYWJsZSB0byByZXByb2R1
Y2UgdGhpcyBlcnJvci4gSSBldmVuIHNldCBXPTIuDQpXb3VsZCByZXBsYWNpbmcgKHUzMikgd2l0
aCAodW5zaWduZWQgbG9uZykgcmVzb2x2ZSBpdD8NCg0KVGhhbmtzLA0KDQotTmljayBIYXdraW5z
DQoNCg0KDQoNCg0K
