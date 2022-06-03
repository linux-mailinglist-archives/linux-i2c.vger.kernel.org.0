Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2CED53D320
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jun 2022 23:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344615AbiFCVTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jun 2022 17:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344430AbiFCVTX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jun 2022 17:19:23 -0400
X-Greylist: delayed 1534 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Jun 2022 14:19:21 PDT
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com [67.231.159.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986F128734
        for <linux-i2c@vger.kernel.org>; Fri,  3 Jun 2022 14:19:20 -0700 (PDT)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 253IscJ3019305;
        Fri, 3 Jun 2022 16:53:46 -0400
Received: from can01-yt3-obe.outbound.protection.outlook.com (mail-yt3can01lp2176.outbound.protection.outlook.com [104.47.75.176])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3gbeux537v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Jun 2022 16:53:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHZ/dHDRgg61xzMbOclDqIQUE+zv5eWIigavfatYma2yvsP6h589V2bgBwypY2uyeDEjEV2M+gxU7G2BjO+rq9xwT+89BaCa354QrOqgPEPYDpAyTW7C8MJshhhIPx6Upio1gjgPefT7LLzX30LhpUUh4J6/sWPG5YfZBVZCTqsxK/VLFxklZM5AX/6lp0yUlh5zWfEoCcGUizaQSwuFbXCNHGq0hxl0jR1/NO5rLx7Sz76a/ErXuRwoYmTIEhd9URRXIAzcZOljJbtB//LOy+7MybPM2vb7221sltsL4g+6ekyVrX0T8GAw6gr85thFbLVcX79hWA5XWg4b7JhOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poqyhlVhIAMZS19D7wiGIK2wEMMiXL1EtiTR/8Qzgyk=;
 b=K5doiQdFWJjrqFa3d8OJl465N4shzef8xsRxFDhOOlsG6Xrpy4kOnCltxC4nnXAEcQ9+YCWOE6SoU+x3IvyMBbAVj82R1QXxUQyEuw0AukvCYq+B+JMY2xnBH1lTi5OCC+AhNfbL6Htuz3KSh6PCdbJvyVmxkDa3achDDVaMOdMX/9Vo9Ej4MJZL2IjEDhcw1paGzdnTpiXIqHKryuPcTOxhjlub1Caj42SKVlmFPiuVx22R5gRjwc/2KzWfV9QJNwii06SyLFn7+gor+zXkoomQOz1Dm/54Q65ADQVdrTAWhI0tGYX0oEzcy575WbXpeAuRLxmkgwzgh9PTrAIbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poqyhlVhIAMZS19D7wiGIK2wEMMiXL1EtiTR/8Qzgyk=;
 b=ZASInojEl0n+EONO9Ol6TgjnwapGO3vCBUMEFqaEUbFLyo5Wk5nbSOWni7fsy4PSbmh2cyGko0JZKvTxltMFDqCxZCFQ3xA9LK7llvQboDYo881aAEiVdqPIG0TAnfBpkTaazAijpbjd6uSJkDaqVQ/km5z8vwOG8gj257jG3eM=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YQXPR01MB6025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 20:53:43 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9552:28a6:f4b6:31cc]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9552:28a6:f4b6:31cc%4]) with mapi id 15.20.5314.016; Fri, 3 Jun 2022
 20:53:43 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "raviteja.narayanam@xilinx.com" <raviteja.narayanam@xilinx.com>
Subject: Issues with large reads on Cadence I2C on ZynqMP
Thread-Topic: Issues with large reads on Cadence I2C on ZynqMP
Thread-Index: AQHYd4wDbhdutL/zP0mnwYXT8vXIAA==
Date:   Fri, 3 Jun 2022 20:53:43 +0000
Message-ID: <6ec42093c3caaadc96462f892003266fad2dd12a.camel@calian.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6da4a22-6896-41a1-42d0-08da45a3258f
x-ms-traffictypediagnostic: YQXPR01MB6025:EE_
x-microsoft-antispam-prvs: <YQXPR01MB60253676C2FAD2DCE64D8A46ECA19@YQXPR01MB6025.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3Fi2vXDqOQx903apw4Es15Bk3FWD3N64e2esFi7s1QcvNbRbqmg82NeekB7rW5fCMSTwx2bgEXBbXzUW0Dql54Y6DeIkq3fpmWyLqNyAP7Dx/mu8Hqzxg/hj9p2VLGweF7g+4XYoDtOwRlAF8W57e1YsEXqTHUhMzB0x0ZJOHlLuzZIl7YNh4MF+koq7yk4iIaOIaPl8/eMiRt2waA4rjLI//svTL3vaHZr0grNrbKQqgIGZwHmF54JGNPMhqQasrIsd4yrYN/O46h+2GLcBuQowYdIzq4zUaf7LU14F/ev7ybkk9zrZi1sSZPOIAJBORe4bSTLY2x0T5h+dX/ZHzpdIxDpgRTvp6EP8jLmi3s9hYWhMotqHkXEvcsC5LLZRcbNjLf7XpuJ4qTvMYrBlW9ZvT04giz3RgesPZp4b4icVQXEImv2A1Mevl8Q4GLylRV+5F5M1DVRwvkPbe72Q6gEpFraxb4Q6/iNhFEJMOAQGDaT+g9++O7IhadWrcTQaFy5B+pWzG7a6WYDYYvt0ry8vzWNdymKIciHRWyKten0MHfvnfEThPlDW9D4+POlM6zYteMQ3cA2HlICzCgAyoR59U68yWZlZMkhhygdAupZpGjLqOG1sdLvO4mg0NRg+ilB1HnA2Yl39cJdLBekR+VFfrP8OFeu5TOgJJamJHO0bGW2KdKIhBdaMePWKg2aROvgumqltcs+TMHAlz8YEnVCYgCovkkhU+Er5KdryECOZkr1JBXICZdQGuqFTg4mbw4LaH8JAeOX/BJT6H6fuy8JTHJcKydQSI+8yVTQNJj9E3KIsa/0vtxfWmHIj7HIXqNDXzlipj8mE2Fp7BOE0dB9WqG7mxHtUIfX0GaVnJ+o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(26005)(5660300002)(38070700005)(508600001)(8936002)(44832011)(2906002)(6506007)(122000001)(83380400001)(2616005)(15974865002)(86362001)(186003)(6486002)(54906003)(6916009)(38100700002)(76116006)(71200400001)(66946007)(316002)(36756003)(4326008)(8676002)(66556008)(66446008)(64756008)(66476007)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzEwOFZMd0loYS9xUHlVUnJCY1RyK1cwQjFzVlhuL0laR3JqRDZhSEphZmgy?=
 =?utf-8?B?eERVT2JSdXJTcEpLVVJ3RW5ZeVc2NUtTUXAxcTQ5WStIdVZuRytEOS9Rd0RR?=
 =?utf-8?B?WDNiRHNNc3lLT3JXR0hXVUJobTBnakNjVFZDVmw2c0VXTTR6S05KdHc4TFVx?=
 =?utf-8?B?bWdzNU0yK2ZwYUdSelh3L3lxMFdHTHNEeW9OZzQ5VGNtc1ZCV1FOZmlMQXcz?=
 =?utf-8?B?cEU5cmZrM2dER3ZZblc4QjN2NzdjUGt1Wlk3ZW5hc0lUekxiMFNXVXFyYnl1?=
 =?utf-8?B?ZXM5ZGxIRkdsZzBvOTY1ZVNGNFpnRS9mUEpsQzY0RlRVUjNOeWpmTnZmSm9i?=
 =?utf-8?B?cG9xZGJQV3cwWGVjL0FBYUZ1dFphL2Y1anFWanBNdCtSRjdkRnpXNUJjeVhL?=
 =?utf-8?B?UDJ6emFaeFBESTcvRzBIK1EzSkt2WWRRbzBFeHNyZGY1VFBiZkxOZlJ1WU5U?=
 =?utf-8?B?ZGh2bVVxZk1Kbzg5clgxb0ZDS0RPTjcxYWFSSmxYeERNRFRoKzhPT056aVFw?=
 =?utf-8?B?Tnh4V2JjTjdLZk9Ec0JPQ3VSWVZrL3FOY1dRRThYdzRLWk1SVk5EbWNoaHhv?=
 =?utf-8?B?UzNGQXFnRkJjbHBKV2k1elY3ZUVGYTNuMGhVT0djV1g1ZzdLekZyRFE4bmRH?=
 =?utf-8?B?TERna09YamN3dkV2a0dObk84TEorL0FJdnNSZWFOL3lPSmp1U1I1QW5qTGZ6?=
 =?utf-8?B?YlpnQU5QTHBVUEVDWmIvYlljdGlOdFFGR2s4Z1lVMEpsTzNQWGJlaDA2bkp6?=
 =?utf-8?B?UldadjZZSjdqQnpWS1MrekRnUnZPcU9DZy94ZXFDeHNJUGY5OGJhVmM2ekNV?=
 =?utf-8?B?SEcxL1VsakpWUC9aL1lhK1dKUmxCNGpsYmFvQXlneURTOTh6bjBBbytLRTA3?=
 =?utf-8?B?VXBPNmZUTU1xRzBuUmh4bnlZYWNjS2p6aXRFM1ozMUFvT1VSRUI0SFZqZmJW?=
 =?utf-8?B?ZG1sVHMzQ0FJSldvVndvYXVPM09URXJCQWlsRmFmd0pxNFhXSkdHSVlVUXk1?=
 =?utf-8?B?M0RvUE54SC9EMFMvanpEUWNvUEljWUNkNDE4Q0lNRGk2TzFIVVBFemxJU2c5?=
 =?utf-8?B?QW9jNkJ6NTFkcDdpVVMrT0QvKzFpems2Z0RGKzFzMHd1emV5blZHYlJNMmRs?=
 =?utf-8?B?RzdtR3BCL001a1d0ajlNcmRSbWt2aHNhVFZtZVNlTENuankweTA2VGJHcDdx?=
 =?utf-8?B?c09ob0h5RHIxMWNSdkZ1ais0alZFRlpkQm83d09lRGFnbHpmSy9tdE1pR3JO?=
 =?utf-8?B?RFJGb0JNTldVSmZnRzU5V3d2c2MzL2J1eHFYa090d1FieDkxZEQvaVo4N0M5?=
 =?utf-8?B?aTZEankvZTN2MVR2dkRWU1orWWp3RVk4REpXZFhRWTFiM21lbzJaZFJDRFpz?=
 =?utf-8?B?d3JmTUFYZkRBT2x4eGRONEhkckVVbG9rUEVHSUVMa3AvdmxpY2ZQMzhGRHpN?=
 =?utf-8?B?a2V6aG9BVVArVW9JRk9vUUJuM0tqZmEvTDBlZ2tEd2FhNWROemhtWWxyUEho?=
 =?utf-8?B?TVFUWGdSNDZSOUd3dHNQdzF4cVpLSWlkejV0VlVrcUNyU21Ldm5Lb1BDWXh3?=
 =?utf-8?B?Zmxta3BENEZBNGVvY2VYMllRZml0WENTQ2VUUFFLY3NhQU52clVVaGRHYWFW?=
 =?utf-8?B?M09XdHF3NWRtYWZURTFTTTg3akNTZ1R2U3E2VFJaTUQ3bUtmcm9xK05nNzVp?=
 =?utf-8?B?NlB6Z2RqU1RJN0hEVW5QNWlpbnNCa0xLNXFYTS9WMFMwM280ZEJKaWc4SXBS?=
 =?utf-8?B?WDVqRGZHamw4VlcyZVdNaCtBYzBWRXphMXIxc2s4QlZDYW5Yck1JanQ3TjRY?=
 =?utf-8?B?NFk1VFBMSGc3alJ2TUQvT3lTZHFDeVZZTy9RZzZtdzhJRlBNWTRoZy9SRCsw?=
 =?utf-8?B?SVZ1bUk2T2I2TzVteGxvYjRqOXNsbEJZRUozZDBLM0pJZmlkKzVkY1JlekRC?=
 =?utf-8?B?cGs4dEVvMnVKSUM2U2RSSWNlbno5R1RPUGp0QmhnM2p2VzRjQW9FZ0FXbWFW?=
 =?utf-8?B?SFFtdFpzS0thREZaSy9VMTJjakhad1RMKytBTG9VMkthM1VUb29CVVlXV0ZM?=
 =?utf-8?B?QUhseHVhMEtqMktuMmlKd2lZZDU5Mzc0WVBQWTdiWWFLTjlHZ01KaVRJd2Na?=
 =?utf-8?B?UjRlMmdTTXpYYUlZKzBYLys1akcvV3RONUlhRmpsc0cxczRMb2p3Nlg5Y29F?=
 =?utf-8?B?SmtvM01oaGdoeUcrMUhaSFYrOGpJa2FZdlh4ZnNySHNJcUdBMU1JdWFqeVEy?=
 =?utf-8?B?VUdIdTRUT2dadnAxcVZOUi9raWZFVzUveWp5Zy9waFFwUDViRTFEdFZJcXlC?=
 =?utf-8?B?SFJCUFdlU1RXc3Zwa09VQTFwNjdvMDRQazh4VjV1R1BjZmVSQ1BRL1BXN3NE?=
 =?utf-8?Q?yLxei7tFuI6cvoePBxGvOy3Jh97RaHVsWnBel?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C151E592C7DF104CA3243FF093F2E80E@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c6da4a22-6896-41a1-42d0-08da45a3258f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 20:53:43.8321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUNCOjjLnpd9nWGJE3ngtgBZPyxfe/EPrSR/xdQeRMGLdCKezKXT4zbNi9DG9ZUuV9ZoVHMVDa2CcUYQjrVe6v9EVAagmMGaw1SfnADcerA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB6025
X-Proofpoint-GUID: s4blUsBwSjxuX8bjaEKlTcGNYj7DMYpw
X-Proofpoint-ORIG-GUID: s4blUsBwSjxuX8bjaEKlTcGNYj7DMYpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_07,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011
 mlxlogscore=792 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206030081
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V2UgaGF2ZSBydW4gaW50byBzb21lIHByb2JsZW1zIG9uIGEgWGlsaW54IFp5bnFNUCBwbGF0Zm9y
bSB3aGVuIGFjY2Vzc2luZyBhbg0KSW5maW5lb24gT3B0aWdhIFRydXN0LU0gSFNNIGRldmljZSBv
dmVyIEkyQyB1c2luZyB0aGUgUFMgSTJDIGludGVyZmFjZSB3aGljaA0KdXNlcyB0aGUgQ2FkZW5j
ZSBJMkMgZHJpdmVyLiBUaGUgdXNlcnNwYWNlIGludGVyZmFjZSBsaWJyYXJ5IGZvciB0aGlzIGRl
dmljZQ0Kc29tZXRpbWVzIGRvZXMgZmFpcmx5IGxhcmdlIHJlYWRzLCB1cCB0byAyNzcgYnl0ZXMu
IFdoZW4gdGhpcyBoYXBwZW5zLCB0aGUNCmJlaGF2aW9yIG9uIHRoZSBJMkMgYnVzIGlzIHRoYXQg
dGhlIGNvbnRyb2xsZXIgTkFLcyB0aGUgcmVhZCBhZnRlciAyNTIgYnl0ZXMNCmFyZSByZWFkLCBh
bmQgYW4gRU5YSU8gZXJyb3IgaXMgcmV0dXJuZWQgdG8gdXNlcnNwYWNlLiBUaGUgbGlicmFyeSBj
b2RlIHRyZWF0cw0KdGhpcyBhcyBhIHRyYW5zZmVyIE5BS2VkIGJ5IHRoZSBkZXZpY2UgKHdoaWNo
IGlzIHdoYXQgdGhhdCByZXR1cm4gY29kZSBzaG91bGQNCm1lYW4pLCBub3QgYSBwcmVtYXR1cmUg
dGVybWluYXRpb24gYnkgdGhlIGNvbnRyb2xsZXIsIGFuZCB0aHVzIGtlZXBzIHJldHJ5aW5nDQp0
aGUgdHJhbnNmZXIgd2l0aCB0aGUgc2FtZSByZXN1bHQgdW50aWwgYSB0aW1lb3V0IGlzIHJlYWNo
ZWQuDQoNCkl0IGxvb2tzIGxpa2UgdGhpcyBiZWhhdmlvciBpcyBleGFjdGx5IHdoYXQgdGhpcyBw
YXRjaCBiYWNrIGluIDIwMTQgd2FzDQpvcmlnaW5hbGx5IGFkZHJlc3Npbmc6DQoNCmNvbW1pdCA5
ZmFlODJlMWFjZGE4ZDRhNjg4MWJlNjNjYzM4NTIxYjg0MDA3YmE5DQpBdXRob3I6IEhhcmluaSBL
YXRha2FtIDxoYXJpbmlrQHhpbGlueC5jb20+DQpEYXRlOiAgIEZyaSBEZWMgMTIgMDk6NDg6MjYg
MjAxNCArMDUzMA0KDQogICAgaTJjOiBjYWRlbmNlOiBIYW5kbGUgPiAyNTIgYnl0ZSB0cmFuc2Zl
cnMNCiAgICANCiAgICBUaGUgSTJDIGNvbnRyb2xsZXIgc2VuZHMgYSBOQUNLIHRvIHRoZSBzbGF2
ZSB3aGVuIHRyYW5zZmVyIHNpemUgcmVnaXN0ZXINCiAgICByZWFjaGVzIHplcm8sIGlycmVzcGVj
dGl2ZSBvZiB0aGUgaG9sZCBiaXQuIFNvLCBpbiBvcmRlciB0byBoYW5kbGUNCnRyYW5zZmVycw0K
ICAgIGdyZWF0ZXIgdGhhbiAyNTIgYnl0ZXMsIHRoZSB0cmFuc2ZlciBzaXplIHJlZ2lzdGVyIGhh
cyB0byBiZSBtYWludGFpbmVkIGF0DQphDQogICAgdmFsdWUgPj0gMS4gVGhpcyBwYXRjaCBpbXBs
ZW1lbnRzIHRoZSBzYW1lLg0KICAgIFRoZSBpbnRlcnJ1cHQgc3RhdHVzIGlzIGNsZWFyZWQgYXQg
dGhlIGJlZ2lubmluZyBvZiB0aGUgaXNyIGluc3RlYWQgb2YNCiAgICB0aGUgZW5kLCB0byBhdm9p
ZCBtaXNzaW5nIGFueSBpbnRlcnJ1cHRzLg0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IEhhcmlu
aSBLYXRha2FtIDxoYXJpbmlrQHhpbGlueC5jb20+DQogICAgW3dzYTogYWRkZWQgYnJhY2VzIGFy
b3VuZCBlbHNlIGJyYW5jaF0NCiAgICBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYUB0
aGUtZHJlYW1zLmRlPg0KDQpIb3dldmVyLCB3aGVuIFp5bnFNUCBzdXBwb3J0IHdhcyBpbnRyb2R1
Y2VkLCBpdCB3YXMgYXBwYXJlbnRseSB0aG91Z2h0IHRoYXQNCnRoaXMgd2Fzbid0IG5lZWRlZDoN
Cg0KY29tbWl0IDYzY2FiMTk1YmY0OTg2NzY2MTk5NTFlODFhZDU3OTFlOWQ0N2M0MjANCkF1dGhv
cjogQW51cmFnIEt1bWFyIFZ1bGlzaGEgPGFudXJhZy5rdW1hci52dWxpc2hhQHhpbGlueC5jb20+
DQpEYXRlOiAgIEZyaSBKdWwgMTAgMjA6MTA6MTQgMjAxNSArMDUzMA0KDQogICAgaTJjOiByZW1v
dmVkIHdvcmsgYXJvdW5kcyBpbiBpMmMgZHJpdmVyIGZvciBaeW5xIFVsdHJhc2NhbGUrIE1QU29D
DQogICAgDQogICAgQ2FkZW5jZSAxLjAgdmVyc2lvbiBoYXMgYnVncyB3aGljaCBoYXZlIGJlZW4g
Zml4ZWQgaW4gdGhlIGNhZGVuY2UgMS40DQp2ZXJzaW9uLg0KICAgIFRoaXMgcGF0Y2ggcmVtb3Zl
cyB0aGUgcXVpcmtzIHByZXNlbnQgaW4gdGhlIGRyaXZlciBmb3IgY2FkZW5jZSAxLjQNCnZlcnNp
b24uDQogICAgDQogICAgU2lnbmVkLW9mZi1ieTogQW51cmFnIEt1bWFyIFZ1bGlzaGEgPGFudXJh
Z2t1QHhpbGlueC5jb20+DQogICAgW3dzYTogZml4ZWQgaW5kZW50YXRpb24gaXNzdWVzIGluIHIx
cDEwX2kyY19kZWZdDQogICAgU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2FAdGhlLWRy
ZWFtcy5kZT4NCg0KSXQgc2VlbXMgbGlrZSB0aGVyZSBtYXkgYmUgbXVsdGlwbGUgaXNzdWVzIHRo
YXQgdGhpcyAiYnJva2VuIGhvbGQgYml0IiBxdWlyaw0Kd2FzIGludGVuZGVkIHRvIGFkZHJlc3M6
DQoNCi1uZWVkIHRvIGNsZWFyIEhPTEQgYml0IGJlZm9yZSB0cmFuc2ZlciBzaXplIHJlYWNoZXMg
MA0KLWxhY2sgb2YgY29tcGxldGlvbiBpbnRlcnJ1cHQgYWZ0ZXIgbWFzdGVyIHJlY2VpdmUgaWYg
SE9MRCBiaXQgaXMgc2V0DQotbmVlZCB0byBwcmV2ZW50IHRyYW5zZmVyIHNpemUgcmVhY2hpbmcg
MCBpbiB0aGUgbWlkZGxlIG9mIGEgbG9uZyAob3ZlciAyNTINCmJ5dGUgdHJhbnNmZXIpDQoNCkkg
YW0gZ3Vlc3NpbmcgdGhlIGJlaGF2aW9yIGZvciB0aGUgZmlyc3QgdHdvIGlzc3VlcyBtYXkgYmUg
ZGlmZmVyZW50IGJldHdlZW4NCnRoZSAxLjAgYW5kIDEuNCB2ZXJzaW9ucyBvZiB0aGUgY29yZSwg
YnV0IHRoZSB0aGlyZCBpc3N1ZSBtYXkgYmUgdW5jaGFuZ2VkLiBJdA0KaXMgaGFyZCBmb3IgbWUg
dG8gc2F5IGZvciBzdXJlIHdpdGhvdXQga25vd2luZyBleGFjdGx5IHdoYXQgd2FzIGNoYW5nZWQg
YmV0d2Vlbg0KdGhlc2UgdmVyc2lvbnMgKGFzIGZhciBhcyBJIGtub3csIHRoZXNlIGRvY3VtZW50
cyBhcmUgbm90IHB1YmxpYykuIEhvd2V2ZXIsIGl0DQphcHBlYXJzIHRoYXQgY2hhbmdpbmcgdGhl
IGNvZGUgaW4gY2Ruc19pMmNfbWFzdGVyX2lzciBzbyB0aGF0IHRoaXMgYmVoYXZpb3IgaXMNCm5v
dCBjb25kaXRpb25hbCBvbiB0aGUgQ0ROU19JMkNfQlJPS0VOX0hPTERfQklULCBidXQgbGVhdmlu
ZyB0aGUgY2hlY2tzIG9uIHRoYXQNCmJpdCBpbiBvdGhlciBwbGFjZXMgaW4gdGhlIGRyaXZlciwg
ZG9lcyBmaXggdGhlIHByb2JsZW0uDQoNCkxvb2tpbmcgYXQgd2hhdCB0aGUgY29kZSBmb3IgdGhh
dCBxdWlyayBpcyBkb2luZywgSSBhbSBub3Qgc3VyZSB0aGUgbmVlZCB0byBkbw0KdGhpcyBjYW4g
ZXZlbiBiZSBjb25zaWRlcmVkIGEgYnVnIGluIHRoZSBjb3JlIC0gYXMgdGhlIHRyYW5zZmVyIHNp
emUgcmVnaXN0ZXINCmlzIG9ubHkgOCBiaXRzLCBpdCBzZWVtcyBsaWtlbHkgaXQgd2Fzbid0IHJl
YWxseSBkZXNpZ25lZCB0byB3b3JrIHdpdGgNCnRyYW5zZmVycyBvdmVyIDI1NiBieXRlcywgYW5k
IHRoaXMgbWV0aG9kIG9mIGFjaGlldmluZyB0aGF0ICh3YWl0aW5nIHVudGlsIHRoZQ0KY29yZSBp
cyBpZGxlLCBkdWUgdG8gdGhlIEZJRk8gYmVpbmcgZnVsbCwgYmVmb3JlIHRoZSB0cmFuc2ZlciBs
ZW5ndGggaXMNCmV4aGF1c3RlZCwgYW5kIHRoZW4gcmVwbGVuaXNoaW5nIHRoZSB0cmFuc2ZlciBs
ZW5ndGggYmVmb3JlIGNvbnRpbnVpbmcgdGhlDQp0cmFuc2ZlcikgaXMgYmFzaWNhbGx5IGEgd29y
a2Fyb3VuZCBmb3IgdGhhdCBsaW1pdGF0aW9uLiBTbyBJIGFtIG5vdCBzdXJlIGl0DQptYWtlcyBz
ZW5zZSB0aGF0IHRoaXMgd291bGQgaGF2ZSBiZWVuIHNvbWVob3cgZml4ZWQgaW4gdGhlIDEuNCB2
ZXJzaW9uLiBGcm9tDQp0aGUgY29kZSB0aGF0IGV4ZWN1dGVzIHdoZW4gImJyb2tlbiBIT0xEIiBp
cyBub3Qgc2V0IGluIHRoaXMgZnVuY3Rpb24sIGl0IHNlZW1zDQp0byBqdXN0IGV4cGVjdCB0aGF0
IHJlc2V0dGluZyB0aGUgc2xhdmUgYWRkcmVzcyBhbmQgdHJhbnNmZXIgc2l6ZSB3aWxsIGJlIGFi
bGUNCnRvIGNvbnRpbnVlIHRoZSB0cmFuc2ZlciBhZnRlciB0aGUgY29udHJvbGxlciB0aGlua3Mg
aXQgaXMgZG9uZSwgd2hpY2ggbWF5IG5vdA0KYmUgcmVhc29uYWJsZS4NCg0KRG9lcyB0aGlzIGNo
YW5nZSwgdG8gbWFrZSB0aGUgdHJhbnNmZXIgbGVuZ3RoIHJlc2V0IGJlaGF2aW9yIHVuY29uZGl0
aW9uYWwsDQpzZWVtIGxpa2UgYSByZWFzb25hYmxlIGFwcHJvYWNoPyBJZiBzbyBJIGNhbiBzdWJt
aXQgYSBwYXRjaCBpbXBsZW1lbnRpbmcgdGhpcy4NCg0KLS0gDQpSb2JlcnQgSGFuY29jaw0KU2Vu
aW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4gQWR2YW5jZWQgVGVjaG5vbG9naWVzDQp3d3cu
Y2FsaWFuLmNvbQ0K
