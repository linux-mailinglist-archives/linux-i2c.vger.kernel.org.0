Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430D454E84C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 19:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbiFPRDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 13:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiFPRDa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 13:03:30 -0400
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD942CC81
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jun 2022 10:03:29 -0700 (PDT)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GAXMKg018270;
        Thu, 16 Jun 2022 13:03:18 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3gmqy4u1b9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Jun 2022 13:03:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsgThN+9IBemqJN5BvaeEdiC1a9CJdytZqvEIyfUBJ43DjNIRngtFpuiDcwo3Rugt5F/+P5Z0AO59ZYAdwM16XqIqd2gR0EcsN9trXQeekotrhJBYtVskzE6mxF7ssBiADaTdMkTSaXAbJMRjS0KuLGE5e7Yxjl3gsrdsCA3fvZnSJe7NhdIsC0z/gPDdbUR73tZ8y+3lVNEyQ10++PUrSoeZiWrphyaA7WVcWHYiD+BeKoeW8ZaWFiG+7N/tP5WSMwxj4NB2lHNJdYldiDc3WMGh1Q8S1UUMugTo5asCMKjwlGpmzdVVBzO7Bi/oqFiuGPd6+StS0jCm348Gu5YdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOtrg5fKfNlnlM+2lGXw0UylOWgQtgOOScfYxPk4cuM=;
 b=ZucIKydUj5G01maSbMA+5nAOQ/2v/XFQow+gZREkacBgwiKUDBMQEZw0vxeyqBR93ciACuUFU0FvfmpmZ7ED1WKAc8pspGShSNC8eAhtI99Aknq0jzM+NOpi6WpWshsmoueYSk4EqcAOU5D6bJk9mXpD17ixLu8CMiIvXeW8n2hWP277jN0sHVy+heB4csrCqmMlVHbjFluQOIQ64NjSXTAS8ogD2V2uRy2NQhQIRNBNq2+rYhkRxZvfRw7vvxw4plYQLEt2vrCX9rjZMlmWvkdj0nXZTkK73I45Jb55DL+WhfEcPHoRiVYpN9sou+twqj++/jRI1pa0hXq1rC77tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOtrg5fKfNlnlM+2lGXw0UylOWgQtgOOScfYxPk4cuM=;
 b=sWU068KWU416zlBJ5mQiePfvFkX6QF/0GPW9B7FCuPt0H59CBbSeeTlQIRLHqjDxqEMTAe0h8n9eCAoEyofSNz1Iaw3SoO9dGysc6Tt48iXsRJ1n5rjj7wszA5V9SHTXnYCF1dHEDLnlrWODtOvhqhp7+OhZoOMiCW5MX5koT7o=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by QB1PR01MB2884.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:33::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 16 Jun
 2022 17:03:15 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2490:1742:8b6c:26ec]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2490:1742:8b6c:26ec%7]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 17:03:15 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "shubhrajyoti.datta@amd.com" <shubhrajyoti.datta@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "michal.simek@amd.com" <michal.simek@amd.com>,
        "anuragku@xilinx.com" <anuragku@xilinx.com>,
        "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
        "rna@xlnx.xilinx.com" <rna@xlnx.xilinx.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Thread-Topic: [PATCH] i2c: cadence: Change large transfer count reset logic to
 be unconditional
Thread-Index: AQHYgEadOa9+p3eZlki0or40O3RNKa1RgE0AgADFFAA=
Date:   Thu, 16 Jun 2022 17:03:15 +0000
Message-ID: <68db68bfe17880d3c393715510e848ace19e0395.camel@calian.com>
References: <20220614232919.1372621-1-robert.hancock@calian.com>
         <BY5PR12MB4902C8591DE77D38B5C3F09581AC9@BY5PR12MB4902.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4902C8591DE77D38B5C3F09581AC9@BY5PR12MB4902.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3b646ab-fb66-4026-901a-08da4fba1a62
x-ms-traffictypediagnostic: QB1PR01MB2884:EE_
x-microsoft-antispam-prvs: <QB1PR01MB2884E8305F97FBE824EC9283ECAC9@QB1PR01MB2884.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JywhJga8E/OQcViSsbvQK2uYEHrzYC938p4Sfcyr++BAq+UvL7F7X7Y51PYi7vLFWCn1O0SgUzOBAJwkokXJDwqYDEYJJifJaKBEq0T4v6ELBuA01h1LY4czZV/2uB05/n4nRIeYWQcYN6sDCM6gFWvGv6ZpoRpUAuDzzuTqKSMqY7Tt7V4K7B4bbBelNlq6qxF1X+8UBxetTocMt/0WLZmIdLt1TQ/t1a5/XQpROvu8sgh1zW7w9e3T6EVSjCFPZnONL4hgKmjTWlOI9JdQsn92aOTokp75UFf8TNWTHqYJlfnAIn3mK9AoJaGEcrVqoLLXjQSJR5s8l5otYRcAT46ib7lauXR+zTcYp2WTr0BBuR1aWU7Wmg6BKmIPODUlb75mlIBxV7ncMNnnZyK1nBssHOYsJRlu6qwuKxZtAFZfqPpcYa9Vf9uZ4q81awLBgcMDC3yaHdIuWn79ujYkI6QCAL1a5azC/ZDud7P/7VGsYyRXIhXj2otByqfg3Os/R6ZeDJOU2dkaCwdkN7Sqwmm+vJeMzOjSuBqHGEcZeXdHsJ3j2wDsJmn+h5PSg/FWXxOlVNRNv3Le+vUo1ilFR5JmSsAB0f+tmysbqxbs2R5knkC+tTwGavAZIDzhby8ukLiFHunnFMsCjmDLhyirWD2UFPLGK1d1K2om89cy0MFnWvdKUCiZQi5KEWcNK643eM79kvxDFfHcFHH7VoJM8H5BwngjX7tbMZRy8n7/p+dehoX0OP9C4OSfEfRjgnktFw4yarh4QJdlRtvSZ1M6+VWCnQi6C6wTPPjNvP+VhSqov8jtY4HdtHZXMu0TFV48mmcgjXi9+6G9ydF+m83aQiHBice95hNkJ5eFThHb1XE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(84040400005)(110136005)(6512007)(26005)(53546011)(122000001)(6506007)(54906003)(86362001)(2616005)(38070700005)(186003)(15974865002)(966005)(38100700002)(5660300002)(6486002)(316002)(71200400001)(508600001)(36756003)(8936002)(76116006)(2906002)(83380400001)(66946007)(66476007)(64756008)(4326008)(8676002)(66556008)(44832011)(66446008)(99106002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGJ4a3EwUGlYOTJtVUljekZXenA0WmNpUG9IRHZibzV0TTFVMHU3bG1MSmwv?=
 =?utf-8?B?WXpJdVVDeHNWVDRPd0d5b3U3VllMSzV6UXkweFlqbkFCWmdpZitMOVpKc0lL?=
 =?utf-8?B?MStGTWp1dzk2eTV2cHlER3AzTnRsTUN0L3BSYm53ZE4rMm4rZXpNZ3dsSzBU?=
 =?utf-8?B?cEdPTFpJb2dBSnIwNDlmdnpzTmVkWStiYUNzMnBvUmxPOG1GNnlmOGpLeGlI?=
 =?utf-8?B?ZGxKTHdjejR2eUszNjRveFc3UlB2RUZuT2NveTViOC9kTmEyaW92U0hjcW5B?=
 =?utf-8?B?ZWNTTjBwSzZueEExbWZvMFJQdTRObkFndE8yQWxsSXlPSVF0WEx1T2Y5T3Bi?=
 =?utf-8?B?aW1ZSy9ydHhiTjB0ZE5xcHBaMGdQRVgxdUVYNDhxaExkOWl5aTh2MkNPRkVN?=
 =?utf-8?B?Rk1hTUl3SC9BU2RRYk8zcDlueElubnNrOUZIa1ZtR0NkL2tQRTlMZzNOYVNi?=
 =?utf-8?B?d09lWnp2VWttL1pqa1gyM3VHN1hOdEYxZE1iMWdrSjMwTWNSK3Q3czk0Vm9s?=
 =?utf-8?B?OGVrczByRWhuNjdHUXlyNnBhK2hmRG5OdXlEK1JWRnVHd0p0NkhiV2VnWVAy?=
 =?utf-8?B?ckFWQmE0MG42T3A5eks3N2ZGbFlrbG1ObFg1MFFJKzRwaU95LzRWTlc1VDVO?=
 =?utf-8?B?eUlXeitCZEhIK1NNS1VGcmlGMmZXNnFkTnlabTk0Zmg2d0RSOWNwQlc4d25n?=
 =?utf-8?B?VUd1aElxOWorNnRIWjlGUGJGazF6VUREbmFoMURaYlhNTzVES0JVcjlCTHVw?=
 =?utf-8?B?bHk4bTZQNWdKdEszek1rQ0VXY1dRamthRkpYaDBUWHRJUDNvbFBJVHJrYVZ1?=
 =?utf-8?B?Ykg3M1ExVUJCMlhDcmJ6Q0tycmFqcm9DaUNZN1VYNGR3V1NPSnhvYUFOWE0w?=
 =?utf-8?B?eExVZVkvMVFyQ1Y3YUU2T1QySzBBMFI5cXVTMG4vWm1OUFFYdWJ5eHVDTU9n?=
 =?utf-8?B?N1g2WWtyRlBkWU52blFBOTBobml5M1VFeDk1UmZYelRzRFZkWk9sM1VaTXg5?=
 =?utf-8?B?Y3ZtaW1xTzFBZmQ0RFRvOUMxM1docVVlcW1tc08wWjdTN0djZW90emxzTXpC?=
 =?utf-8?B?cWpKaHJhUFZkMnU4Qk9KNW9xdHhYTk1mV1ViVE1LUkVWN2RHcGlCcTJUMU56?=
 =?utf-8?B?WThFbmxNV3dxcVZJV1EzNmdXUnM4bEdWTW5Gdk8zRUFCbkdta0JSRFRxa0U2?=
 =?utf-8?B?WCsxUzY5elBaVDZzODhXQmhqRXdycnFQbDVNaXdRNW9DQ0RyaWxRU0FkRGht?=
 =?utf-8?B?d2dkb2x4cEQwMHJpaUNZRmdsSTVQNnlISzBIZHl0UmZiSEZkQlRxa1Bkak5Z?=
 =?utf-8?B?VFFoVUdROTVXc3hWR2VMMThoNjNycTNjL0NTV3BHS05pbng4b2hXUnE0Z3RG?=
 =?utf-8?B?WXp2Y04rZ21YVmlOVG1KdHpHeWV0N29yZlIzcGJtVW4xOVFqR0JSNDZZc3FD?=
 =?utf-8?B?TjJEWThmek94bks5S1JVK1VQYjhXWFl1b0QwTDhPVGFVNExEclViY2RIT0Z4?=
 =?utf-8?B?KzBOMTM2UU4zRkNZMEN3azZ5MzE0Wmt0MGFoQTBYc3I5Z3JKWFVJKzZNeDJX?=
 =?utf-8?B?L1pBNVVFMEtQRk5NcGE2d0pxM2VHazdaMTIyMk40WkVSclFLcW5oSTM0UEJ6?=
 =?utf-8?B?Mk1iYlViNEtRVkVTVFN3ak1uandTM0M3bUFya3grelAydCs4bG1WUDJaWVEv?=
 =?utf-8?B?S0RDSGljM1c4QUg4YU9TSFBLVVk3SG9QTDlnRWhuYW1kT0E3aEtEdEpLZ3py?=
 =?utf-8?B?Z1AvNEJ5WEw4cUVXaUFwZzc2OFhKTmkrUnhHc1dnVzdmZ054a0d6L0poQkhO?=
 =?utf-8?B?dHZvY2NabUVzcmN6T0cwUTVWOWthaDlDT0xIS3pITnhRbjlUWFViK29sS1BK?=
 =?utf-8?B?UnRVUHM3SHdFOFNDNmZLbUlVSVJxY2pwUDN5SHJBVFFqdHhWdVI3c2x1eXg3?=
 =?utf-8?B?L2doTGNWWlZSdVJFbHh6NzBQcnh1NzZiTU5MWG9wdGVydUpiZEtOcHcvcmhu?=
 =?utf-8?B?NjNidEUrZVdYT0cwMmhlNWtZUDdRaGllTFVKY09NamNnbkpOQmg2Z2FKR1pt?=
 =?utf-8?B?NDgzQVJXQXcxS0l3eEtQeURjUXBQOTkvS1RMazZzSlFiTkdGVTZzUXQzcndr?=
 =?utf-8?B?anpPNGVkZ0ZoVmIzSDNna25OZUhDWXFmZUhFME0vNk83anhpQnFGTnhvNEJR?=
 =?utf-8?B?MW1RV0t5TTJjUFRhR1ZXUHBPN1k5dDVLWmRUdjM1U0c2a1Q2RGxxcGU1VVpJ?=
 =?utf-8?B?Snc2bTB5bSs5K3lHd3J4cW8yRUU3K1NVL3Foc2JvNFhuY2RIUjhKbUlLeXJ5?=
 =?utf-8?B?Y2YwaVVOL0dzWnYxcmV4cmxWUEk3ejJqNWJRZnFwdVRPSC9JQmxINGNpUGZp?=
 =?utf-8?Q?nzPdJxr94LaMIgJAOrTSWq+KIN6pQkBW5oZRy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <683E3B69513CF0499704B31CB963CC40@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b646ab-fb66-4026-901a-08da4fba1a62
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 17:03:15.1368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYWZwFKicfzDIF2K7ZOQ25NYVxfnDxC/nyzdE9gwyWkod9d6NDznBz8UjJa6nqwtA3MbMQz3e0zsD1Xbz47AmoyRN+qoPuzCI7xT7L9eIOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: QB1PR01MB2884
X-Proofpoint-ORIG-GUID: MU106Jwj1l56TCO_75jOQUTn0rB3wwBd
X-Proofpoint-GUID: MU106Jwj1l56TCO_75jOQUTn0rB3wwBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_13,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=662
 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206160070
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIyLTA2LTE2IGF0IDA1OjE3ICswMDAwLCBEYXR0YSwgU2h1YmhyYWp5b3RpIHdy
b3RlOg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gDQo+IEhpICwNCj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2ggDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiBGcm9tOiBSb2JlcnQgSGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4gPiBT
ZW50OiBXZWRuZXNkYXksIEp1bmUgMTUsIDIwMjIgNDo1OSBBTQ0KPiA+IFRvOiBsaW51eC1pMmNA
dmdlci5rZXJuZWwub3JnDQo+ID4gQ2M6IFJhdml0ZWphIE5hcmF5YW5hbSA8cm5hQHhsbngueGls
aW54LmNvbT47IE1pY2hhbCBTaW1law0KPiA+IDxtaWNoYWxzQHhpbGlueC5jb20+OyBBbnVyYWcg
S3VtYXIgVnVsaXNoYSA8YW51cmFna3VAeGlsaW54LmNvbT47DQo+ID4gd3NhQGtlcm5lbC5vcmc7
IFNodWJocmFqeW90aSBEYXR0YSA8c2h1YmhyYWpAeGlsaW54LmNvbT47IFJvYmVydA0KPiA+IEhh
bmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIXSBp
MmM6IGNhZGVuY2U6IENoYW5nZSBsYXJnZSB0cmFuc2ZlciBjb3VudCByZXNldCBsb2dpYyB0bw0K
PiA+IGJlDQo+ID4gdW5jb25kaXRpb25hbA0KPiA+IA0KPiA+IFByb2JsZW1zIHdlcmUgb2JzZXJ2
ZWQgb24gdGhlIFhpbGlueCBaeW5xTVAgcGxhdGZvcm0gd2l0aCBsYXJnZSBJMkMgcmVhZHMuDQo+
ID4gV2hlbiBhIHJlYWQgb2YgMjc3IGJ5dGVzIHdhcyBwZXJmb3JtZWQsIHRoZSBjb250cm9sbGVy
IE5BS2VkIHRoZSB0cmFuc2Zlcg0KPiA+IGFmdGVyIG9ubHkgMjUyIGJ5dGVzIHdlcmUgdHJhbnNm
ZXJyZWQgYW5kIHJldHVybmVkIGFuIEVOWElPIGVycm9yIG9uIHRoZQ0KPiA+IHRyYW5zZmVyLg0K
PiA+IA0KPiBDYW4geW91IGhlbHAgbWUgcmVwcm9kdWNlIHRoZSBpc3N1ZSB3aGF0IGlzIHRoZSBj
b21tYW5kIHRoYXQgeW91IHVzZWQgdG8gZ2V0DQo+IHRoZSBmYWlsdXJlLg0KDQpUaGUgYWN0dWFs
IGZhaWx1cmUgSSB3YXMgc2VlaW5nIHdhcyBpbiB0aGUgdGVzdHMgZm9yIHRoZSBQS0NTIzExIGxp
YnJhcnkNCmltcGxlbWVudGF0aW9uIGZvciB0aGUgSW5maW5lb24gT3B0aWdhIFRydXN0IE0gSFNN
IGRldmljZTogDQpodHRwczovL2dpdGh1Yi5jb20vSW5maW5lb24vcGtjczExLW9wdGlnYS10cnVz
dC1tDQoNClNvbWUgb2YgdGhlIHRlc3RzIGludm9sdmUgcmVhZGluZyBnZW5lcmF0ZWQgUlNBIGtl
eXMgZnJvbSB0aGUgZGV2aWNlIGFuZCBzbw0KcmVzdWx0IGluIHN1Y2ggbG9uZyBJMkMgcmVhZHMu
DQoNCkhvd2V2ZXIsIHlvdSBjb3VsZCBwcm9iYWJseSB1c2UgYW55IEkyQyBkZXZpY2Ugd2hpY2gg
Y2FuIHN1cHBvcnQgc3VjaCBhIGxvbmcNCnJlYWQgdXNpbmcgYSBjb21tYW5kIHN1Y2ggYXM6DQoN
CmkyY3RyYW5zZmVyIDAgcjMwMEAweDYxDQoNCmZvciBhZGRyZXNzIDB4NjEuIFRoZSBiZWhhdmlv
ciB3aGVyZSBvbmx5IDI1MiBieXRlcyB3YXMgdHJhbnNmZXJyZWQgd2FzIHNlZW4NCnVzaW5nIGEg
bG9naWMgYW5hbHl6ZXIgb24gdGhlIEkyQyBidXMuDQoNCi0tIA0KUm9iZXJ0IEhhbmNvY2sNClNl
bmlvciBIYXJkd2FyZSBEZXNpZ25lciwgQ2FsaWFuIEFkdmFuY2VkIFRlY2hub2xvZ2llcw0Kd3d3
LmNhbGlhbi5jb20NCg==
