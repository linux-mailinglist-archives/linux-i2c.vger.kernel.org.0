Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1A87698480
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 20:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjBOT05 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 14:26:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBOT0z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 14:26:55 -0500
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D86A3E631;
        Wed, 15 Feb 2023 11:26:53 -0800 (PST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FJP7wV023883;
        Wed, 15 Feb 2023 19:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=JxXiIpydVFe/4pUnoyWY7IO7VlHQXqCybYUKtZQJMtw=;
 b=luOCT52D0qIiNj3CtlYe/33NKJwGbCZ7kOSadi2kVsAjhXSR/eaNX9zGE6lktfjQ2oB7
 mJS0MEt1kZfmMXqWaUVW8JCQyaoQxnDGcYOVEmtaOL+ps9njKsuYp5oXzjAlJk0KV88f
 bmkbTR6Uo+qMniznfRM/1YrazAptBwYOKLmOx5GclPEZi3B6Dop9/yr/SPFS0cApG0uM
 WtWFrHWVYoqFVBD4trgIePodY1p5bAUzQVr8VM7WM5aUpm5oxN2+SkTH4JETzTPxtvTQ
 N50ubIqijcZSdv35KPZ4BCFitWb3qUufzzA3nKH3ZUgWyASCPNpepLVNMbRYKJpeZgUV YA== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ns5h980bd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 15 Feb 2023 19:26:23 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by p1lg14880.it.hpe.com (Postfix) with ESMTPS id A7F6D800345;
        Wed, 15 Feb 2023 19:26:22 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 15 Feb 2023 07:26:02 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36
 via Frontend Transport; Wed, 15 Feb 2023 07:26:02 -1200
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 15 Feb 2023 07:26:02 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NObF4lBw6etffIXOI3Qn+11Wh3lQB8mFqHRpktpIypa30XWyO5l6welCyE+dQbbeEd8J9K1Wk3AlUlx3nGkJyH98RAN31evyrwE0W3Mt8sanBurZrNkwcFuuxmktvmLI9Au3yfMT+OvEJkxRVMnV1Kdzcod644D2yctgr+guS4q0YEJGyFb9UnMjeO5QbX3oeypnmg7f7ELAad3JWd26IIq6BrxhLf7j7tiQrVdlsQJSUEse5QsbQg3rTvsb35FM10JV0CrnoEO0waNx8NkzQcxtdrSByCP3ClhkedoWDwSsXO/Q0Z84CLgBJ4mPAlFfHi4xuMzxtTc+LL5guOj41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxXiIpydVFe/4pUnoyWY7IO7VlHQXqCybYUKtZQJMtw=;
 b=jwYbf+evTuvqGMIYVe8eT3kq/0ou62jBRHnI+lLLtYjwoFWF90zU9sUke5pFVCGkpLSUqoZhWSepB8MFA7DAr2ieFiTSctQaZjXlLdap2MHpoweExRwoMeM2BeiZjhWaSlg9QXDXSNBWotwhLoORDLfone+F38E5uWGR5SG8YLhhBwQa3jOvvLd5CLIIS7Bznk0IpTEhMkt34a2jDuxPGPhyH8TPaLUUBSIEwrqzeO7WbPoKcXIR9jox40Uwmj7OU48XS5TCAC1z3m6EVFzIsMla0IyNKvs7XSOBfRsfarQAVf2U992YIOvXK9b2kwCruHaoRbqRLgN7tge2xUscJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 SJ0PR84MB1410.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:430::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 19:26:01 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::de12:a5c2:5c71:6b87%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 19:26:01 +0000
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
Subject: RE: [PATCH v4 5/5] MAINTAINERS: Add HPE GXP I2C Support
Thread-Topic: [PATCH v4 5/5] MAINTAINERS: Add HPE GXP I2C Support
Thread-Index: AQHZMO1xKLe5o9gXTUe1qZvV6dkcF660LYmAgA+JHgCADLBDMA==
Date:   Wed, 15 Feb 2023 19:26:00 +0000
Message-ID: <DM4PR84MB1927BBB411A7F2B0ADF0F21088A39@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
References: <20230125184438.28483-1-nick.hawkins@hpe.com>
 <20230125184438.28483-6-nick.hawkins@hpe.com> <Y9VrnQxiFjVqtybb@ninjato>
 <6B334EA9-3E6D-4B40-8C55-A539C504439C@hpe.com>
In-Reply-To: <6B334EA9-3E6D-4B40-8C55-A539C504439C@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|SJ0PR84MB1410:EE_
x-ms-office365-filtering-correlation-id: 65234381-20cc-4421-a083-08db0f8a78c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uyO866KrpZBkgE27ZsAhMtRnCtDuykvTCRNc+4sb97jYkmQuDQ9LFrGSCcU0MDKdkMEmDPzf2bIbOpcQ1hPusn4G7/z3SzyGfEmg+hJDkyBptoP/1GfubeMkR5OGzpyZ3JafwTf1l+ZEzuELq+JXYXJv8TmaqCbuJfBFBItYscNiWKo7yefaKSEYorXHq+v3gIlZY+jmPwOPEZbsfr/oIPiJoCwWS/n2ddiryINz5jJKWXlxDQOco8/0g6floBB2/wOSqjlX0Q+dNtAZUp7KkxgrSRcjYhpcfMK+VRBPxavp9cp/AqQbSiMIEr/mrFB7LcuKQUwUKs4rbw5egL9lEJP3I0xG+Ha7vddpdpybY6ODL8mkfiLtArHi7Edx4kV8F2Q7wBGJafJYK3SS36HLiwZxXI3I+3eKv/lAOYe5IS7KF6skmyHvYBV77hzWthx2rh8F2bj7/bmda2XaH78IAt5jaoFLBQ0OHXls5Lf8woBruEvnm2f1qw/6NrUoZok7rbrZnRuGFQz/3Eojvyy35xCBmyZQskp2fnOu7K4SVl0izqllVsBNtmt25yRdTUIcqtflTAnDyJ10sHfFnKTjjgtvTmAD+Vsh0O0jdKkng2c0MAHZOqptaa2BtZ6ztkZvWvXXgAeK33BJfMWWZ9x+pHz5qbukZRwKRCQCwF9QlX6pZxnWlLUKop3Me6iQyRFO4sGlGDTMyMxGO6A3Dzv/iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(6916009)(478600001)(64756008)(66446008)(66476007)(41300700001)(86362001)(8936002)(38070700005)(316002)(82960400001)(8676002)(66946007)(4326008)(54906003)(76116006)(66556008)(122000001)(38100700002)(7696005)(186003)(33656002)(5660300002)(55236004)(52536014)(4744005)(26005)(6506007)(9686003)(55016003)(71200400001)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHZueExNa3FERXZzZ1FwUWI0aXRob2JkWjNvekpjUkxlM1hBQ0o4a2o2NVVL?=
 =?utf-8?B?bFJNYmhZaUNkUHhlaUtFc3hFZEFRZldrVWhTckFzYm5sVFdGckdLalBZcy8z?=
 =?utf-8?B?a2Rlek5OUG9IOWNwRzlaZnV1ckZhdGFpNGcrczdzb05yTVpJR1ZTRk1oNXNp?=
 =?utf-8?B?OGxzdDZiR1hQSGhBemRZeC9maGx3aE56VllKQXc5Tjk0SkgvS0ZOMkVmMWdY?=
 =?utf-8?B?ZDlNVEw2Y09tK0wxZktvOUpOL3NrOHRsTzV4OWJmNHE1enpKZ05WR0pKUlpH?=
 =?utf-8?B?YWdXaDVLN3V4TUpFdGVXOXlFQlcyQVNYaUQ3UDAzTnBDS0h3S1RrY0d4cThm?=
 =?utf-8?B?cTlBMGMzOHRiU3U4R1JpQ1huTElzeS9YQnFuZFh0eUVCUm9PYlBDL1QvckZK?=
 =?utf-8?B?M1hGRmZPU2c0OGVqTWd5YnIvdFpWOFR6ZElaVEtvaC9CZHlHb0cvZDZKTWp2?=
 =?utf-8?B?bUhzcFFabWpTRUFEVkVXanoraWwwUUhKSEI5TGdUTk16bXNGN29CeEFlYjQr?=
 =?utf-8?B?SEdXRFA5bXVTQ3o2QkY2cGhPZW5SWjRsY2wxemphQUJIRDR5N05PT1J2ZTBw?=
 =?utf-8?B?MEJiUXNIMWhxNUwwa2xHaGZIRHhjRExORkc5WG1kLzhTV2hXWXFtcm5xcUcw?=
 =?utf-8?B?cDlsZU0xZTFHV2Z3TVNVWmFuTWFhOVZ2MUdmOWpwSmFvSmZrSEd4Mk0xcFYx?=
 =?utf-8?B?QTBhZE0rL21CQkRWY29XRUtZRkxvZ0VCNFRhN2JPT3ppaEdTY1kvamRLTVBB?=
 =?utf-8?B?UExVeG1oWFZLQ3JOVDdiZzFyaE9tQ0Z6dTdGMjlHUnkzYnpIdXlqejdGVHZE?=
 =?utf-8?B?VDNiVUpDODc5SUljYTQ2Q0g1bHVpbHVhT3dMSzBDNnZEclFKV3lWbWhZNkNv?=
 =?utf-8?B?eWFWMlRieWM3dHJoUkwvR0xieEVGVmFocGp4NnNlTFhGL2lJSXZ0aXdmR0kw?=
 =?utf-8?B?VFZINEhQWEVwaEdkY0NNSnVYT2hkV3F1dmRzbTZkcHdMMndiak5TYVdtZk9I?=
 =?utf-8?B?QTNEclRxbHMxWUdWaVB6dFhRd2d5Vm9mSks5ZnRzYmRqY0VIblJXQ1VrNGNS?=
 =?utf-8?B?d2tFOGxna1A0Mkc2QktkYWs2bFVqWllicHI2c1MyMnhzeko5ME53cHpRT0dm?=
 =?utf-8?B?bDI1cXNianVYZUhCK3RQakpRNnNwZlQ1Q3Q3Q2Rzc3ZBaXFBU05OQjFydStw?=
 =?utf-8?B?cUdZNmRvQ0RnMXdDNllZeTM1dFMxZ1ZDdU54S0QzVkNJdjRoWDQ4OGI4bWs3?=
 =?utf-8?B?YkxFUWZ4S0UzSklodElMSm80anZHbU8zMVVhREZTeVkxR1pSR1NUQjBZVmdm?=
 =?utf-8?B?KzZtcmwxUEJkZHUxMkRQeG15NlVtREVCV0tzdkhqdkt5V20zbDVJMHhSalFn?=
 =?utf-8?B?QzkrenpsS1VoOWVsSWNadGdNMXo0ZXVSakxBdS9JNy80MGRXNHVJRnQ2NzJl?=
 =?utf-8?B?YVNwTkl6WWk4djBOVW92RFJaNzNlUjFxRXVGWDBTWVVxZEpFWWNuL2ttZURs?=
 =?utf-8?B?ejErQ1hnMU8zV2VrVEdZMVZISUNJRjVrVjdGaE1ucTArSFd2RXdHdUhBVUVN?=
 =?utf-8?B?VWxHNmdsY2lWSVh1OGdaczJRUnhHOFM2bWVSdzJMZkIvVlpBK2VucmpqdHBt?=
 =?utf-8?B?QmxWV1g4K0Q5V3RTMGtFZ3NCT0JvQXNHdVc1Z0lmWnJ3QzYvUXFBUlZocVda?=
 =?utf-8?B?eklUMSt0RlRwRnlsWStQNm5IZmZvd0FTcG1JWVRaNmtwUytOZ2IzMm5IMnF6?=
 =?utf-8?B?U1RsQTNLQThQUnJoSnc2dFErOGJaVXlJa3d1djlFZ0NyUFd3TU9nZi9hcTl3?=
 =?utf-8?B?MWdMajRNYnUwRXk0NW0waEplWC9razI1MHVLNGE5WGFvOVNXT2VsUlVvV0Ux?=
 =?utf-8?B?WkdCcVJ5SzFHbXZZQm84QXRyUXdEL2daamVoVnlBYTVtUkdFVHM0bVEzUk80?=
 =?utf-8?B?cDdvaWZBWUNXRmk5MFZCU2VjOXIzazhBTjdMREszT09uVjRtWStNY3hSc0k1?=
 =?utf-8?B?ZkxXNWNlNWZpbEJmOUwyMmtsaDBhNXhmVVpSS3YyYWdZM01lRjBOOFVNMm82?=
 =?utf-8?B?bHNNVE11ek5KWmJQQk5YeG0yZktrM3BRbjFpZ0EyUEMrS1o3U2pybnc4S0pF?=
 =?utf-8?Q?9Z8PHlIFE+ujwjiPPgbDOSVLQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65234381-20cc-4421-a083-08db0f8a78c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 19:26:00.8905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCMg1j879ZUKT9dlyPtrcxtdJoEVIxBAt1k+1X1sjFU/m49pdbH8DNRmPaz5jxBrss0UYLOcOM83XuGV5U8vNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1410
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: u2OqL9Gou_Z-1PQR2-WoAOnF8W8TRQkh
X-Proofpoint-ORIG-GUID: u2OqL9Gou_Z-1PQR2-WoAOnF8W8TRQkh
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_10,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=659 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302150171
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQo+ID4gTGV0IG1lIGtub3cgaWYgSSBzaG91bGQgcGljayB0aGlzIGluc3RlYWQuIFdpbGwgcmV2
aWV3IHRoZSBkcml2ZXIgaW4gdGhlDQo+ID4gbmV4dCBkYXlzLg0KDQo+IFBsZWFzZSBpbmNsdWRl
IGl0LiBUaGVyZSBtYXkgYmUgd2FybmluZ3MgZ2VuZXJhdGVkIGlmIE1BSU5UQUlORVJTDQpkb2Vz
IG5vdCBsaXN0IHRoZSBmaWxlcyBhdCB0aGUgdGltZSBvZiB5b3VyIGNvbW1pdC4NCg0KPiBUaGFu
ayB5b3UsDQoNCj4gLU5pY2sgSGF3a2lucw0KDQpHcmVldGluZ3MgV29sZnJhbSwNCg0KSnVzdCBh
IGdlbnRsZSByZW1pbmRlciBvbiB0aGlzIHJldmlldy4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHRp
bWUsDQoNCi1OaWNrIEhhd2tpbnMNCg==
