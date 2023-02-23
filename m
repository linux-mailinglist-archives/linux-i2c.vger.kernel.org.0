Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FBE6A1195
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 22:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjBWVDS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 16:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjBWVDR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 16:03:17 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBCE2BF21;
        Thu, 23 Feb 2023 13:03:15 -0800 (PST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NK21lt012283;
        Thu, 23 Feb 2023 21:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=JFmyS15ZCMhP13z00uLgB3p7YqHPQOopf6esSDTrCZ4=;
 b=Or30OEAQNDf5iIID5gHVQBbVLJxFEQ5mQ0cULt9b1gFQA+I0ou8ZksDyjvNsUeIGvnut
 /SveIWk6hqz0KH175fD9o26k8PP7xi+t90czUmGi5K4HXpB+uUzXRyJMlYr1DhX0szaz
 AXRIrqvrzCyegfZyjJdzUfkwOslbjJp+VR6CsuWMjrqCFEJU958zfvZspDKa/IaRCys/
 4zKpLAYIk9DyATKB3zM1+85HzQ9TN5+CyJ5nF6qT1KpPWriEzs3uJEaugf887oopcMXd
 8Dasa79uQ52qXD2YcwIYrV2BuuzSZgWjjsmGsRH1rCN+c94plzeKY77MzVw+zRZIXDR2 Mg== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3nxbx22y2n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Feb 2023 21:02:49 +0000
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 3C15D800359;
        Thu, 23 Feb 2023 21:02:48 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 23 Feb 2023 09:02:42 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Thu, 23 Feb 2023 09:02:42 -1200
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 23 Feb 2023 09:02:37 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYnay4j/4PsKyreVwR/4jeHQAiUanP76P3bdZcT/YloeQCJ4kGKdVZotkv0tK3wchv6/E1MTdj1XJ9YeL19je83lMD5cfoTCr27C+H4xy9+QkEpRKw7Y5mWY8HNEjCNid8T1a7jcGpuZib6SLoocJAz/qZkNMO/5WebUkC4NjrGYKyHFNSFd8r+rv05iZFF9DLokdwpUiVDsTpt7x/sEhrEBJmAKQdR/Nlw8N3UJ+4tnMZvmB4YxIQMcfAP3zOOFvz+0ckBLb0kyzzM4wmAxIYBs6G9BHYUa0Ha1vjdPPNJWRpnBnv91ubufcHQwyC2JVprUdVKoDpIlltv2I6mX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFmyS15ZCMhP13z00uLgB3p7YqHPQOopf6esSDTrCZ4=;
 b=WbfWUhmAjfXIJrxhzFOISMxV9aTR171RmTFA6J0lwdMy/RnvDQuXmLcg84wQd5YvrT1vuMEZzjzSOOwSRR/T/Ij7V5l5NSYSyEwXXSUURPz4j9kAKNcDYTJXrPolCJQ407olGWqxVZdpZyPRJQ1P8EL88l1ddr5iJUBGq3fYkmzMzn7i12PdzNhpkOMXwPAjKLd/nY9x+qPVOMlZS3d/Dt+8Yz1Dti0kUZLoRMIePsNZ5TIdD3+7dSAAoFt97M846i02EtFkFQD8X84K7i2IAbO/+Nef+cU4u1wqDuEuAUuxxEllvdB0Bt1UPcs17ucAENKTRVTZSIeB+xnQ+SObKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 PH7PR84MB1485.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:150::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Thu, 23 Feb
 2023 21:02:36 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ee74:bb9a:75ba:71d3%8]) with mapi id 15.20.6111.021; Thu, 23 Feb 2023
 21:02:36 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v5 3/5] ARM: dts: hpe: Add I2C Topology
Thread-Topic: [PATCH v5 3/5] ARM: dts: hpe: Add I2C Topology
Thread-Index: AQHZQuhJXgK/7/i9r0iiM2KjL1y9xq7UfJ+AgAgtSYA=
Date:   Thu, 23 Feb 2023 21:02:36 +0000
Message-ID: <66D4DB5E-46AA-4280-A073-E22262F7FD58@hpe.com>
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
 <20230217155054.99757-4-nick.hawkins@hpe.com>
 <dc708865-6005-760f-cbb0-cb2d1d989b9d@linaro.org>
In-Reply-To: <dc708865-6005-760f-cbb0-cb2d1d989b9d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.70.23021201
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|PH7PR84MB1485:EE_
x-ms-office365-filtering-correlation-id: 634c8bed-17b8-4c16-0e7f-08db15e14a76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x+qsMLJtdhEVO8ziv/IGMj/XsxOg9ClhGaW4BVhw69SCdxVx7b0J+TMQHqn0kL/lIuCSQfANDJV+MtLODYJ9FNNejNg2qYRM/DOSQZIqqbdRQN3efPcND0Zb7AIPQ0ReSFje1hXBZv5NfR6d1UWiSshdLj5ov74L4rr6v/QtWdvmVi/NPQ6KXrJDKAaN1kbmUBOoU86D2ICZX46jnSB+43Ta6fvJQMWNOYtx4pOxj1Nl6ELZKjk7YctW+tm+jGM1tAyNyRx1zhb2QMwQFB0ot03aeH9XJ9vPelMCgkm419U24ae80dALs1T1KSHVLqRPsnsplbFG8pMr/BAelJisFUplqcTYMnWYX6uxZIy8F+Hgk7FM9RtyPLztnpyhllxaBAX5S69eSXtglfipcD4Ji0lvHHDwKJo/veK2k4CUceWzdwiexea0G8mihJcxy1tDeNB7kVS+PNipMWqHm+uNajUOXojGZRbHLBwoGNWOQnfsIBJy+/aIuSKFHcrKRekSFb7vv0PInugIDZJ1x8bE1bwh36nHocxnxb/0Bf2fzvPsdKM+38suQ3x4t2QMNF6o9dZ0GHXCWIdX74sg6tHC2+oPNyFLbR0RcrzVDipCB2J7iZEiOcjBWCc1AGJMn8nDwelqPzt4moHr683m8EbrP85Ao6lJLfzwJFywrbFZdUaaQhGpHtQauAGm+KHlq/uFje94TuBOkBBYGU8Z0z7OToMqbOjxZADcKcUHj7ULc2uQn4/WiLE+/XjDEf/38IhD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199018)(921005)(64756008)(66556008)(76116006)(6506007)(41300700001)(66446008)(316002)(2616005)(5660300002)(91956017)(66946007)(83380400001)(8936002)(8676002)(6512007)(71200400001)(478600001)(66476007)(6486002)(110136005)(186003)(33656002)(36756003)(2906002)(86362001)(4744005)(38100700002)(82960400001)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UW1NUjFsTVFDY3dtVUZBeFpNdUd0SWdLZGp0cHVCTExVa1IzSWp0QjVXREU3?=
 =?utf-8?B?eGdXakhxemt0em9idWtMQVUrbzJnM1dpNno1RHdmellTL3BJaTdOQVFyOUpU?=
 =?utf-8?B?KzB1dFFpNXozZEN1eEVkVWNqdTMvVmViR2tLMlVtU2MrK3VJRXNwbE1hMlhZ?=
 =?utf-8?B?clNiVkZVbC9YWEV2dzZqTUdncGozQ3ZDY1YzUVZTbXVLRTBHNXdKbjFGcDl2?=
 =?utf-8?B?NGZXKzV5Y1VkSWF4bUlQdVplcFp4eUFrVEdiaVUremN0SXZFbDVqbFZPWERy?=
 =?utf-8?B?bDVLUFl4Nnp3WXBsTjdIU2FXNG9Xd1BCaEFkYWZGZW9wTlVuR3VIenhLTEov?=
 =?utf-8?B?bStOT3NmTmhscGl4cUl2ZnNvYTN0Q1ZhZ2M5Q0tLclZIdUk1bTNyU1gzUWl0?=
 =?utf-8?B?cEJnZGpvbk1TcnQ1TVpLTXVKOUpFY0F1Y3BrK0FJRVgwMlFjdFJCamgvT3cy?=
 =?utf-8?B?amV1ZTdneVFzbVpJemJtcDY2QUc5bDhsK1JZdnBlaFd0VDlJOG9zNWtXUFRi?=
 =?utf-8?B?WUp6T3J5cEczM2pQdkhmaGFGL2dPV0pEVHozSVJPaEVaY1NyRlRaZGNMd1E4?=
 =?utf-8?B?U2poZ0NpckE5OFlGa1RhbWNBWWRFWDJPdFVjT1lHOFdBL2ZJaTNXL3BtYmYv?=
 =?utf-8?B?R214TVNTSnV2Y3NVUGtNcjN6R2tvSXJ5MTlqK0Qvem1WZDlsWEFCQmdLZjdB?=
 =?utf-8?B?RFBBVklpd1dtTGN2OGtpVzBaaE5sZm83anVqTTcyNUR1ZWJGNUFtY2lEVjJW?=
 =?utf-8?B?WTlDYVZqcFhZWGo0VzRTSndxWWxyRURLZ081NHNOZmE5QjBwMmtrN25VUUVr?=
 =?utf-8?B?K1hPOW5VbVgvR3hPYWtBSklTRmY0K0Z0SithWm0vbnREZHc4NXg0OVZiajdY?=
 =?utf-8?B?eHZzWmNtOGQ3MW04T05JelBmTXU3OS9ZNVFrLzVLQTFxM3B0WGJUTzFmVlhR?=
 =?utf-8?B?eWVPeEFSUE1NZkNnbXYyMjhiUEpSR29xZEVsT0lod3U0MkV1dVl0anBPckZq?=
 =?utf-8?B?dmVPMnZNamNNQno3WmJQQkhVdjd0Z3lSWkg1YXd3VlF3RHJsWUpJeG1adkJ4?=
 =?utf-8?B?djE2SG9uT3A2WmlpSjMvUHYxRkg0WXR5RlFETm1FWjkyd3NBeld2RHlKRkc3?=
 =?utf-8?B?UmRJT1MzN3EybHhXYjRLelRjQ0pSNEhEckliRzJkU2hoUlZzWEFHS2kvRlpr?=
 =?utf-8?B?blQ1cEg1QmkwQnRyY0cyNHh5c3A2OWxiS0RQWktBMlo2ZXJrQjZTM0M3emp5?=
 =?utf-8?B?RkNNOVZCWlJyTW12THJkUE52OTJrcXhHb0Y1SVRiVVBDOXYxWDI3RzdOTlRq?=
 =?utf-8?B?dzNRMTQvMTVwQXNPcWowemY3c0dHQXhseHBjM2NHL2VsNmF1Y2lLOUtKeUNP?=
 =?utf-8?B?V2FKNmN1K3I4YnlkRlNTa01idnJNR3lwU1FOMXRsS3FlZFRjcUFROGl3cXg4?=
 =?utf-8?B?dzV0RUQxR2NBZEJDeXFBdmp0TlladFpSbTVlaUF6c092RGlMdE9xQWdKWnJR?=
 =?utf-8?B?TDZNQnR5RlVOQkM2RVNwLzhyVUI4bVBMUFJnbENkS2ZnMWZlY1VIL09sdUlw?=
 =?utf-8?B?bGJBTW1NUzJYanlCRWd5R1dyZ25JU1ZFd2dTT1p4a3lXT2h5b2N4bDZlNVFi?=
 =?utf-8?B?dnMxb3pFcUtVQm9zbkNXZE5QL1FCY3FoVllra3dRQzlza2R1NDBtYW15czdr?=
 =?utf-8?B?QzZvWXo5ejJjODNGSTZ3dFhheXB0cFJXK280YU5MRnk4c0g0RW5UWE1qcGFX?=
 =?utf-8?B?ZjJObjFMK1ZnZ05PZW9rN2xOOU82SHNHMTY0c0VpbDNyYnA4OC9DdHllU2k5?=
 =?utf-8?B?b1loSVd1SGtsS3dzMWJKSW9xNXNaa1lOMitzMjdUVGs1ekRxckhFVlUrU3Bq?=
 =?utf-8?B?QXorbnBKVU9pcFgrSXRqK0JqSjBtMUpGWkFlQzByWmVNc1RUTnFua0lmNm9s?=
 =?utf-8?B?cjdqRjhMZnJ0Nll2SFNObHZhNjlDYytCMXNPMFc5eXBMYjZVMjFHM2xJbGVY?=
 =?utf-8?B?RFJ2aUtIay9GRFI1SkdzV1BtREZGT1ExWEp0V1hKZWl1dHR2cmtUZmVUSExE?=
 =?utf-8?B?V1FUdFJDMTRCRTZNSTFlZ1E5eEoxTHR2NkJBZzdDekJZdVppa3ZTbmxVYnJ2?=
 =?utf-8?B?YzQyZ0lXR3FzUTUxbXBUcnRzTnZLNnN0QmoyZnp1bnVBN1NRbXB2Uk5BdHlm?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D804814EA1034F4A94FE3EF727BF470E@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 634c8bed-17b8-4c16-0e7f-08db15e14a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 21:02:36.3651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rwj9++cUBIstByssUmOIWECy3XhNx07V1DFsCA9oowm30AfmDgsjcRKRxirIbTs3sK4TUgMeMMKQvDcmvJzYKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1485
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: lt85hbax721n-nwg6qZjkhQdG15OxyQC
X-Proofpoint-ORIG-GUID: lt85hbax721n-nwg6qZjkhQdG15OxyQC
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=527
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230173
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBjbG9jay1mcmVxdWVuY3kgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgYm9hcmQuIElmIGl0IGlzIGZp
eGVkIGluIHRoZSBTb0MsDQo+IHRoZW4gbWFrZSBpdCBmaXhlZCBpbiB0aGUgZHJpdmVyIGFuZCB0
aGVyZSBpcyBubyBwb2ludCBmb3IgdGhpcyBwcm9wZXJ0eQ0KPiBpbiBEVC4NCg0KR3JlZXRpbmdz
IEtyenlzenRvZiwNCg0KSXQgY2FuIGJlIG90aGVyIHZhbHVlcyBob3dldmVyIGlmIHRoaXMgcHJv
cGVydHkgaXMgbWlzc2luZyB0aGUgY29kZSB3aWxsDQpkZWZhdWx0IHRvIHRoaXMgdmFsdWUuDQoN
Ckkgd2lsbCByZW1vdmUgaXQuDQoNClRoYW5rcywNCg0KLU5pY2sgSGF3a2lucw0KDQoNCg==
