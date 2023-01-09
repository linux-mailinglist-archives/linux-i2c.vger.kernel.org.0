Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A31663164
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 21:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237223AbjAIUYI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 15:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjAIUYG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 15:24:06 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9913CC0C;
        Mon,  9 Jan 2023 12:24:05 -0800 (PST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309GiwD8019318;
        Mon, 9 Jan 2023 20:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=bbk7rc5HVwNr6AcBN6txu0OKE9Msg6vFLBl2o7KsmGY=;
 b=b7O7XtOcABijCigDcrTs/W6qPfWw59pJpTsmE2zGgwdqlGcGw6zNzzdzwTkH++drd8ik
 /vISUfXMXa/lGfjjOThs6GkJncB9hV/0Lzur/vQcrU7fNNRG3uSY21IhjDSGTKd6e+gM
 uj39HiKstabMyPWXveSpH2c39UHRGXqoO7q6XPQxnXYL4mF+h2oYfO8/1GGl7kWEgBk3
 xBzyUVYPchVaKFhAAeTwJsg0zf2hWNsE/UWQBYxp0un1XugemA/EW42OX2zOxdiX42Ui
 C9cVlBZBybklDXGVKmVCLDeRpMMdh66UHwxJJG6P5JLzhrGgB6ObSl6yBe2YcaSvhVzo Fw== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
        by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3n0pqc1juq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 20:23:45 +0000
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14879.it.hpe.com (Postfix) with ESMTPS id A3B77310C9;
        Mon,  9 Jan 2023 20:23:44 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 9 Jan 2023 08:23:42 -1200
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 9 Jan 2023 08:23:41 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Mon, 9 Jan 2023 08:23:41 -1200
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 9 Jan 2023 20:23:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKc6iM7iIzmT8pOW4XC7TGIRzwUc1NEYIS9HXvv0AHkkhCGSybz8nuXtXFbJURu5HwEStogatB8kbEnIIbZVCTfgzx9oa4cFo0rmV8OROYfofOQUg+5/CKK9CNaET/kCbzZOpOmE4ufx0C4Rpw/cls8Kk/5pkntoftDaiPwBFjwwszJWrst5RVsTIq8fZiZB28qrRkPuNIzk6uSRYUfKE4IuyzwrsVbyFTs90OeObl1Sm4F9eGFJHshe6b1VaZYz+PJxrX6IRs/7naE24lgawEf4uZRZ1ey7XxS/GobypNvFDuXrLI3gSq6UPiS8zrCsw5rdDxruRJaFudYmGWXkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbk7rc5HVwNr6AcBN6txu0OKE9Msg6vFLBl2o7KsmGY=;
 b=UXWQKtmkwmZ6aUXowS2TGOgkKIpirNrAUCWAbzDbqtFR4qbkhMgpqdGFEUI9+YsDCbHmeFWI1x+gV7Wxpc/hcGOsyKGTUmqU3cZwJQrxiPIutZis6OGIfQtAfcbxIfdSUWWK/NaNUd/jNlAJI5FwB40+ds8VxHQAy2CV1BOPvxSuGwLk5ydvBheYzSpY4obACCFKJuAr+qmGhJZjrY7q0rEA3sRs7h7AGXW1docdFXWex/GOuFCv7w3vU5zc0dYt3B6TD2re+wxNKHVrNG4sNg6PqE2PcC378km3YZpfj7f3ZDuvDOVWQahrZVop/3ANSQv9dU+UR2yvK3/qOwBc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 PH0PR84MB1645.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:171::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 20:23:39 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 20:23:39 +0000
From:   "Hawkins, Nick" <nick.hawkins@hpe.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 1/6] i2c: hpe: Add GXP SoC I2C Controller
Thread-Topic: [PATCH v1 1/6] i2c: hpe: Add GXP SoC I2C Controller
Thread-Index: AQHZEX1xPKR5ZB4j30mcrFy6lqflPK5x6CIAgCRxlAA=
Date:   Mon, 9 Jan 2023 20:23:39 +0000
Message-ID: <1F4A96B7-F90D-401D-93D8-A14CD8F4E0B7@hpe.com>
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
 <20221216183532.78933-2-nick.hawkins@hpe.com>
 <832510cf-0a1d-35cb-8754-7d9c9e94b0a6@linaro.org>
In-Reply-To: <832510cf-0a1d-35cb-8754-7d9c9e94b0a6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.68.22121100
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|PH0PR84MB1645:EE_
x-ms-office365-filtering-correlation-id: abcb0f5e-dbf6-4ea1-7f72-08daf27f64fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q3TSju+ATaT45uMKXqbMq5yoFQUvn6CzQeE70Nze3FkeNJPLc9HDq4rm8Lp2c2cSO145PupHK6SuDmy5PxUOloE8dS+jkiY2JAcRXHI9lha6PfNAoiyakUJCnAwLobb1aFSgfXjihJI9nx0y+y5HIyBz1R1eqTcdtGPmvgXL5EWD9SR0DkoBkto6DY3Wc9rPszD22a4Oy7WASugZqF+dDIstMDWDJRfXY3nK1PN+/qHl/V36AS9CtdsOrlnnscqcS6FcnGFBnYHqTHDFTD4SHWmjVf9ja8oBOqP8xi9AkXgIIMmkZMvNC8TGvXAxfwm8YpDsThP9Cf8BmKSZhxlv0iwQyEXH+ZUIVi/HG+tN3BrKxscPillwAjyrYuo4+VXF1ylMtk0iXVDtWRakRVQbbGPLqDb0mz15jyxtCq1YtOMHL4tfjH+ywn/6GeOwmzq002Ayad4jN4LO4xlUQTPdh28KafS/j0WcLmgG5qmSTAR2GaL1GuLstow1RSHrOcVgK+bZDOb1jIUGv3H2VM+6jTe/W71uPOChJmVRVuxNL6SYyMcIOD2eQhDiP4a+nRlgg/eN3eBBx/EyHVYPzsAInSd0Z+uzL7k8YHM+DTaxJ3oVNQxK21tzjG2WZpsUnD08RBTkD3eBsRW9x6dsjw050u+pFOTNqooSdIMN/7M8FBcbich0EUyF8G3jgo2MuTPkly2XxpWT8U/gg4FAWbfKOZUW5YBS9rrYCmsy8Ju2K/I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(33656002)(122000001)(38100700002)(83380400001)(8676002)(86362001)(66556008)(82960400001)(38070700005)(5660300002)(66476007)(64756008)(2906002)(4326008)(66946007)(66446008)(6916009)(76116006)(8936002)(41300700001)(6512007)(186003)(26005)(6506007)(2616005)(54906003)(91956017)(316002)(478600001)(71200400001)(6486002)(36756003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2ZRVTRISVB2azRDaWtrQnFiaHpKRmlPUlA0RGwxejErOElUdmtLdEMyMFNp?=
 =?utf-8?B?Qy9IWFZHdDJJRVJZUnl6S29TenVXYTBQQmFvd21NVVVkSFpOZkVVL3RycWh2?=
 =?utf-8?B?amFyVjdsQVY2RlNWYnBXMG5qb096Yzl5ZGpDdXI0WW9WTWxDTzhIODRMTFJq?=
 =?utf-8?B?TkZkRG9mUXNGblRUWmViR0ozNjRjQUtrcW9waGZwWHZ5Ty8rS2RSczZuaVNK?=
 =?utf-8?B?YWFRSktvSHJ1VDdUeS9lZVkyNEJuaFA2RGcyZzcraHFUb2VmMjFEaTY1MFov?=
 =?utf-8?B?aDY4MVlQdk9nN3JRc09DbS9BOEp3K2JQMmpXV09GWkNUaFpIVGVTQWU2bUln?=
 =?utf-8?B?ZGZINnl1V292dXQ5cmVKcDFlVjN0MURKUzI1NGE0M29zTTBWRFBjUENWNE50?=
 =?utf-8?B?WHI3WTNoUTA3UGVqcTlyZ3czbCtTRDlSL1NFbkVyZmNNc2NhbUQwREcyWU5L?=
 =?utf-8?B?a01XTnBCcEhMMTNGamlQNW50bkpockdoUzM5U3NXSmFkU0l5VmxDWGhKY0w2?=
 =?utf-8?B?aWNxRUdnL3ozVkZiOEs2Q2o0YXp6b2dkOHJIaFptNzBJN21JTTBHU08zTEtm?=
 =?utf-8?B?UDJBYUszVlk1RTZ5N2xuL2JVb3oyZFZrTmZQd0NBcmdKVjhrdTA2Vi9sMTJk?=
 =?utf-8?B?bVJUK2FieVdtQVdBRFNYZythTkRZOEpEc2xhVWJnb05ReUN5QzgyOHlvL3JJ?=
 =?utf-8?B?V3ZESTJMWmkxVUxwYWpGWWZQZ3JIUDU3YWtzZTZORnVYbWFVcVFvUks0bzBC?=
 =?utf-8?B?cG10cGdxZWZMTTFHc2pBZDFBU3c3dnJiR3E2YmJYcy9zb0xQZTluRkNpMitF?=
 =?utf-8?B?NXQ0d3p3ZlFLSmxSd1YyNzZvVDBkeXAzaER5akl4TDY4UXdzUy8xTUhxazc0?=
 =?utf-8?B?aFJ0dXg4ZldYdFltVncxMHFQSjREQWF0Wk44UzRJQU04Lzg4V0RMa21OL0d1?=
 =?utf-8?B?b3BtYUxCa2xFbHpOTzRjeVVSdzlKTFVVNEo5L0k5VGs4dHZ5ZDQ3RERQRDRo?=
 =?utf-8?B?dTNOcyt6aHdqVzlhSFMzZkh6MkE0dENod2pXZXlsVzk3WkpLU2JldmNJWWFV?=
 =?utf-8?B?YlhaNmxZR0JpSEdGK1p5eHlvL3VDSDJaY05kL3RFU0Z4blllMXBFN3Qvelh2?=
 =?utf-8?B?RjdQMy8ySFFValRteFNPMjVuR1FYSy9xcDZWVFpJcldEZ2xyVDNUdno3cUtp?=
 =?utf-8?B?c2QxajZGcFdhdlMwSjUvZ3paVmlmK2V6RlUzUCt6dHZSWGlIZHBXMlhGODlp?=
 =?utf-8?B?VEw3aEZQWFdJT2Z5U3Bjd3Z2blVrLzdxV1ZwK29IR3o3dG9lc284YVptQ2VJ?=
 =?utf-8?B?QTQvUlVvUjFiTjFJbEZ1cE9SREpZVVljMy85OVpScmlJWWIvNFhici9qTFVQ?=
 =?utf-8?B?bUhGb0VWK1k3RjVZWmhadTFUMnFuVUc4T0hGdmlyU3k2VXdiN25pdjJDdytN?=
 =?utf-8?B?UDNzcmJRMDhVbEdpWlVSQ2Y3WmNBYktWVlBOTnUxUmJBMjd3NlpXUDlKZ045?=
 =?utf-8?B?SHMvdGFVR3R4b0tLaXIwR25KZ3lIRkZhd0h2clVOdG16bXFQb3lvQ2RHUktu?=
 =?utf-8?B?QUJSZTl2dDh4cEZNNXZ3WjdHTkNUTTZqWG9FU0pOSWprSjljektORnBuNHZ2?=
 =?utf-8?B?ZGJFK3dvYzB1R04ySm9JVEhlSGRqcDRqUUpES0s0WkxvSVEyMEkwZE9pT3d3?=
 =?utf-8?B?YU8rYjl2ZVNRUUQ2dHNvdEtZcU5XeGREZEFJMUZRVVU1VXlBNUlGb0NXMXJF?=
 =?utf-8?B?WEhoeGx6cFdna2NGZHMzZnlPQUlhNEk1ZW85a0VibVFKVmRGNWgwcDFOY2Rs?=
 =?utf-8?B?blZYdW5EM0xkaEROMmtqOTFkVm05K0U2SEdmNTVZUmJNTy9Yc2lzTndEeENJ?=
 =?utf-8?B?UWJoam1Fd2ZYS0pmZ0kxZURrcWdMSGp2U0JhRkMyUUEzT1RYWTVkZjhLV2ox?=
 =?utf-8?B?aEU0cmduZ3NYVkg1TmpkbFNQdzVoeXFPS1dxR0hxOEd5RElNNWpsY0ZMa1pi?=
 =?utf-8?B?OURJdlM3VzNoMzR0dFRlY1U2d2xkSU5Dc2lvTXJJRG81NXhYQTN0TlpiT1BQ?=
 =?utf-8?B?QnBVWklTdDJlS2duS3V1WTU3WHAvZXYrT0x2R2JUTXROYVpWU3pkeC9ReFBC?=
 =?utf-8?Q?26RkstDx1Cs6JvG8WFZwrswZO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BBAE588DE866D4BBEA0080C7BD5BF91@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: abcb0f5e-dbf6-4ea1-7f72-08daf27f64fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 20:23:39.4980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gz7eK6Wh0eAVCDEamt0fqK+Ukg4fjtMLTqLQE/k8jj1Oj4R9EYPeoEatbuM8Vfj5by6Fh3tgea+PrAOGp3NRCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1645
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: lwUxw_mRav5Pvw2qDNX-kkae5eJ5mFU3
X-Proofpoint-ORIG-GUID: lwUxw_mRav5Pvw2qDNX-kkae5eJ5mFU3
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=875 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090143
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+ICsgR0ZQX0tFUk5FTCk7DQo+ID4gKyBpZiAoIWRydmRhdGEpDQo+ID4gKyByZXR1cm4gLUVO
T01FTTsNCj4gPiArDQo+ID4gKyBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkcnZkYXRhKTsN
Cj4gPiArIGRydmRhdGEtPmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gKyBpbml0X2NvbXBsZXRpb24o
JmRydmRhdGEtPmNvbXBsZXRpb24pOw0KPiA+ICsNCj4gPiArIHJlcyA9IHBsYXRmb3JtX2dldF9y
ZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gKyBkcnZkYXRhLT5iYXNlID0g
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7DQoNCj4gSXQncyBvbmUgY2Fs
bCwgbm90IHR3by4gVXNlIHRoZSByZXNwZWN0aXZlIGhlbHBlci4NCg0KR3JlZXRpbmdzIEtyenlz
enRvZiwNCg0KVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suIEkgYW0gaW4gdGhlIHByb2Nlc3Mg
b2YgYXBwbHlpbmcgeW91ciByZWNvbW1lbmRlZA0KY2hhbmdlcyBidXQgZG8gaGF2ZSBhIHF1ZXN0
aW9uIG9uIHRoaXMgY29tbWVudC4NCg0KSSBjYW4gcmVwbGFjZSB0aGVzZSB0d28gbGluZXMgd2l0
aDoNCmRydmRhdGEtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7DQoNCkhvd2V2ZXIsIEkgc3RpbGwgaGF2ZSBhIG5lZWQgZm9yIHRoZSByZXNvdXJjZSAicmVz
IiBoZXJlIHRvIGRldGVybWluZSB0aGUgcGh5c2ljYWwNCmFkZHJlc3Mgb2YgdGhlIGRldmljZSBo
ZXJlOiANCg0KPiA+ICsgaWYgKElTX0VSUihkcnZkYXRhLT5iYXNlKSkNCj4gPiArIHJldHVybiBQ
VFJfRVJSKGRydmRhdGEtPmJhc2UpOw0KPiA+ICsNCj4gPiArIGRydmRhdGEtPmVuZ2luZSA9IChy
ZXMtPnN0YXJ0ICYgMHhmMDApID4+IDg7DQo+ID4gKyBwcl9pbmZvKCIlczogaTJjIGVuZ2luZSVk
XG4iLCBfX2Z1bmNfXywgZHJ2ZGF0YS0+ZW5naW5lKTsNCg0KSGVuY2UgYXQgc29tZSBwb2ludCBJ
IGJlbGlldmUgSSB3aWxsIHN0aWxsIG5lZWQgdG8gY2FsbCB0aGUgInBsYXRmb3JtX2dldF9yZXNv
dXJjZSINCmZ1bmN0aW9uIHRvIGFjY29tcGxpc2ggdGhpcy4gSXMgdGhpcyBhY2NlcHRhYmxlIG9y
IHBlcmhhcHMgeW91IGhhdmUgYW5vdGhlcg0Kc3VnZ2VzdGlvbj8NCg0KT25lIGFsdGVybmF0aXZl
IEkgdGhvdWdodCBvZiB3YXMgaW5jbHVkaW5nIGEgcHJvcGVydHkgaW4gdGhlIGRldmljZSB0cmVl
IG5vZGUNClRoYXQgc3BlY2lmaWVzIHdoaWNoIGkyYyBlbmdpbmUgdGhpcyBpczogaHBlLGd4cC1l
bmdpbmUgPSA8MT4uDQoNClRoYW5rIHlvdSwNCg0KLU5pY2sgSGF3a2lucw0KDQoNCg==
