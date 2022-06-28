Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E77DC55CAB3
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243058AbiF1HuK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 03:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239652AbiF1HuJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 03:50:09 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001C310E9;
        Tue, 28 Jun 2022 00:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgQTbh1P8fU6PuZ/0MlHQPDd9809vWUDFWjBAXy8lgnrLa/ED6+/K63bI71Ml8GkYACd0+Qh/B9XG9tq55qPG2bXWdHuUvLQt2IG+ckr2yTQWaEqYy7kH5OWjQkCD21tAGuUtiVkeizF4NfV+BaoDfXcsBs+QxNBVtoS+KccbT/QXsVuUqdATURdeiCO5KpEUxU+WJmAoAx1YJrGF9Izgru0z1xhbMVm6/y9cmfQyPnhh9vAOlMmj7XJKYbUHFtemQ2vc66Fb24X6ktH1omqXET2VbRW7MCd23v7ruMPxk9QwnIkTh9nNaBA5fhj7kVDqhEp0ukqspWvc7un1BCqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bxi8FSASWu2czJn5f4MpzBHp6b3NhCrHROKgjmzsA8=;
 b=oQ0PZJLZMcZXGgq2MkAf1waK0S518pZALR7BNodlxHLvjOZhy152pLH/SF3+oaty2LzV0aFio9wGf/CGUGmsuwOosqbLa1QBWfXJ90PmamprQerD1h5wA1VSFpUiOJpRUjVxanlZyO1nwXxwejK5d3jpcZAkch2tiYQ8fyrzKXJME7HkBaMNP8b7SPTUdM5becon/zA9Fz+3mFJaqVyTnghKOyGiWVReofNeezhjkS8W/VgxSI+bfbfO4Uu/WiPCQjCvooTkCJhvjDU/zFlFdDc9J89sx/ZteLU+1PNwwOi03ySURQDby2Fjcni9soxR8krHglTEI4PxmPImm4FGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bxi8FSASWu2czJn5f4MpzBHp6b3NhCrHROKgjmzsA8=;
 b=cv4U8j5KHx0bVhnXnQH91z7MOXGJhvPQzf3po5tlgGiiGvAotzTFOu2upcpQW/LFIDDY057ODB0+4Rx9+/2C/Ru59dx1mJs4b9tX74xQMRxNhlMO0w9GVmnJaNfOCJ5S8UGImbWOYKguVcXtWpLgU5y7RCUmrQLuxRYx/7cshVI=
Received: from DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24)
 by DS7PR12MB6216.namprd12.prod.outlook.com (2603:10b6:8:94::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Tue, 28 Jun 2022 07:50:04 +0000
Received: from DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::a88a:d6dd:520c:55bb]) by DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::a88a:d6dd:520c:55bb%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:50:04 +0000
From:   "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To:     Marek Vasut <marex@denx.de>, Raviteja Narayanam <rna@xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>, "joe@perches.com" <joe@perches.com>,
        "Goud, Srinivas" <srinivas.goud@amd.com>,
        "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>,
        "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Subject: RE: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Topic: [PATCH v2 00/10] i2c: xiic: Add features, bug fixes.
Thread-Index: AQHXanX+pvqNUfd14EqKjH/KbwICX6spB/+AgBzauQCABFS4gIAAg4OAgAFUqgCAAHwiAIAIXN8AgACCTQCAAvH9AIAAkDAAgg3CoTA=
Date:   Tue, 28 Jun 2022 07:50:03 +0000
Message-ID: <DM6PR12MB3932B33F03C714C717170FC18CB89@DM6PR12MB3932.namprd12.prod.outlook.com>
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <95162fd0-10e6-2bc6-4079-899ac26f66ce@xilinx.com>
 <0c51785f-9763-aebc-a9ea-04337ad1accc@denx.de>
 <SN6PR02MB40933E99A241952502B69F41CAE19@SN6PR02MB4093.namprd02.prod.outlook.com>
 <45aa8d2b-a077-32a2-0608-8f20a5b807a8@denx.de>
 <SN6PR02MB4093C7F2EB59D854D8753A01CAE29@SN6PR02MB4093.namprd02.prod.outlook.com>
 <328f6c4e-ff0b-c88f-d246-75b493b67a9a@denx.de>
 <SN6PR02MB4093E219E0BCE2C3CBCE472CCAE89@SN6PR02MB4093.namprd02.prod.outlook.com>
 <5d49b316-6fcd-e677-578e-64b0ab5520ab@denx.de>
 <SN6PR02MB4093ACD6E6A349BA9740ABB9CAEA9@SN6PR02MB4093.namprd02.prod.outlook.com>
 <d70b569d-a0e3-81b0-a553-ed88423924f7@denx.de>
In-Reply-To: <d70b569d-a0e3-81b0-a553-ed88423924f7@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a3c3482-b2c7-42b7-9961-08da58dacfe6
x-ms-traffictypediagnostic: DS7PR12MB6216:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zNDXnuMnNdR2Mb93RZP5PE8ON3/B9oz2tsEgOUlUMj7OE8DGifQ8dCtvjX7D1m1kKFDhjXT+Wbfih1LKupX7VySYk5UTeN50xX6Cv+hTVthi+t/LrxXhglvPL5zpoQ6HSoGi0+0siHO+cIEoeHwa95LIlJnhONMlWe5o9MNl3FGy/I76ojCWJnF4NLb9UqNtqWllG4eYPfRKPBx7gbBj+QBp/pO4whUy1Iki/VaO7pfdEkYEJoZgdFcyf8H3yjI382IhesYZTh+6ckgYlmWL+QNmb28qX+A0sHxygt7i5luIlF795YXeeAhC0ylZAgrp0P5G4RC0v+JrerRuJHNoByTlAffxY+WTASLE5us7G9k8w6dTjWxPnpswRYqVB2V3PZKLyWCE8XSovEbpw9f725Vs1iFVCNxwXg9Q+JvfdJe2ci7gHeDFFs/mQN/D5q8fxT+9fgnyRP7AMkjxFr0+xxY+nRHlR97+/HGjpzHmGDT64Hz7J6OsbqlR+g4PEZzA8ECye1Wnf4dLQCHL5nwzS0dg1OwJZ4dgEoWD9LRSl/SpCVbhzbbJt4ni2/6zug48z1DtJcXMn9Dr7M20mvjbmkE2+bHJZarV7/jsplemRpjl/R3rC5Wl6BXo/4ynyhvD5bXyBQOxduBHcUUixiVWA57C19wVBDu5bprTtnyQMIN/WJ+p7ZDAhsey2Nlfz+kEjFqoQBTmNE3nFhpRTJBvqoywWCwIwlpkDJCBvEz9GJTlD0zE++MLS64HH0qHdwOyvW1Qj1CS885pIbhkC8/yxHPiAYazlobh8FQZ1znyEzTLb4Dez2no8vXKpIFROvf/iN/ZT/hd8LNn5Ib8xvY1Sw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3932.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(4744005)(186003)(4326008)(76116006)(41300700001)(86362001)(5660300002)(33656002)(110136005)(26005)(66476007)(316002)(55016003)(71200400001)(52536014)(66446008)(66946007)(8676002)(6506007)(9686003)(64756008)(53546011)(7696005)(2906002)(66556008)(8936002)(83380400001)(38100700002)(966005)(38070700005)(54906003)(478600001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnlsSWcyWGcvN25YV3orY3JlQksraHY4YW1LOXF1bDhKdlN5dHJaSHNSaU5V?=
 =?utf-8?B?YUNVc0dmcXltY0Mrd3o2WXVyRTRqTXlRNUVGM3gxNmlpYW04TVFENEkyVFVU?=
 =?utf-8?B?WHUyV010V1N4OENHZVlPM1ZOM2pkeDhiQlFqcy9keUUyeHRuL3NBOHBPSXY5?=
 =?utf-8?B?VEhUV2tHdTk3S0F0OEZtN0w0d1lqWktPcmd5Y3lmeWNiTElBRUp0eUlieVFi?=
 =?utf-8?B?TkV4b3hHVVRjZndWMXRwNnNrRTVXaUd2aFBxWktHRGgvWElCWDYrSlhQOUw1?=
 =?utf-8?B?T0pvd1lmcGluK1F5YWpVV2Q2SkNMZ3Bqd2hNTEhDY3k3N2Z5ZVJvbWdmdThX?=
 =?utf-8?B?bmxTTktIc1ZGV0hKWm4vRVh3Q0NSOS9ZZ1V5aGdXNERlc1pET2ltNktaT0Q1?=
 =?utf-8?B?S0I0a01GL1dzYTk3VzhUVjJXVWd4SG53Um1rRXdoKzE0RUo3ZjI4WFdRQnhm?=
 =?utf-8?B?YzhyL3lScks1MXNsM1RuSmp5QVREeGEyYWgzNjBFSmxtbW9odzJEQ2V5NFJh?=
 =?utf-8?B?czQ1U09ib1NsbFVaUktiazZqakJzcGVNYkJrdFdURFRXT1V3bHAyM1dvNEJY?=
 =?utf-8?B?Vm5ZK3FQcGRCTTR2bmZrYjhabTdFZ3hRY081RDNPZGo4NVo5ZE5heDFyODFV?=
 =?utf-8?B?WmwrRThnNjU4NUUwRWQ2dzRVTjJIZ0FiaFJFbmh2bEtKTXhvUmlBWTZIeXVU?=
 =?utf-8?B?Y2lCcjMzQldyTEtabkZNRlVaQXI1czZrWGZLY1pWWUp1VEMzN0Mwb0hBSUFW?=
 =?utf-8?B?bjdaeFBEVFl1dHNSOFRCbzBPZHhjZm9xd1JYRS9vcE5oN3dpNEpFTnNJQjdJ?=
 =?utf-8?B?Q2hraExLN2xMa3JGNFdsWFV6YUlMMlE1NUJpTE5sWjFZOTJyMWE4LzNBZFUv?=
 =?utf-8?B?cjdkeVo4Z3A4a2FLRTVLTll4NmtRL3hSbGlvQUE0Q25JOWs5TVpjSk5PSFRz?=
 =?utf-8?B?aVlrUmk4d1RjRzkva2ZKdW5VS2lLVVBYUERKZmMvZENhaEFSeGFncVFzd0Fj?=
 =?utf-8?B?dFBwZytBdkpmT05hL2Fsb05rTkJSMlkrRGdaU20vdVVMSSt0R0ZlZHUvOHY2?=
 =?utf-8?B?RXZCOEcwTHM1cUxxUGRnSUF4eVd6Z01kQit3Y2s3R2RXWXFTZzhyNTNDbnZS?=
 =?utf-8?B?Q2pkTmk3VjFzMi9hdFlhc2lZb3I1WHp4Z3ZtZW92ZTR5RFpEUFFlcXNEa2Iv?=
 =?utf-8?B?aXB6RDJackNKeEszbm5IZGw2LzVsaEYwUlpJM3lTUTJTNkdXMVpKY0FSdUw3?=
 =?utf-8?B?UGRYRmFkYUVKM21sU25XblVOc2xQQ2NHRGswSUFiYVMyM05Dc0o1SEtjYjMw?=
 =?utf-8?B?d0p5bkY4d1VwVEp2cng2STFDYmtCRWhUU3hRNmRSU2M2MSswZEZTT1BkaFdY?=
 =?utf-8?B?QXBsSXFoRzdwNmgvSTNXQ2g2M0k2Vnp0aVJWYjhPRmNLUkxleCt2YzQrdElv?=
 =?utf-8?B?T2JuYnFIcTVIVVRHbVBpcnpiWVhpTkNIc3dkRGVVOUxmYTFDU2YrVTZYNHBx?=
 =?utf-8?B?Y3lBUys5NlRRUjF3b1VSWHlzTFNVM0NOZ2xmbkNZcmhSRnNHVktqeEROM3lO?=
 =?utf-8?B?ZTd0SXQ0SjBhdWd0UUI3UWFXanlsME14bG5MK05ERm1UbDVUSStNelRWQUtH?=
 =?utf-8?B?bS8wQ3dmdjk1WGNweGlCK0xxNzFmanBBVnBrK3hheXRMdmhsZG5hbzRLL0h0?=
 =?utf-8?B?V1V4YTFvcUZ6S29JMU12TnM0ZUsvY0g1VGJ0V3NLSjVzUHRRa1lCVlhxeEcy?=
 =?utf-8?B?c2FPRkhvdklJRUVzMm9sSjJnamQyczRHY2ZHWkJ4Zi9QWE9KVTBDVmZYWG1k?=
 =?utf-8?B?WVRFM2ExNUNJc0hZNnF6YTlVTW94YkhlUnVDTGZsK2tJVkw3aGlib243SVlE?=
 =?utf-8?B?d0ZtaC85U3RVcitDQTEwaGhXZ0MrYS9oN0oyMXk0bzR3NGd0LysyWDRpOTZp?=
 =?utf-8?B?VGxlMm0zRStMYTVmL1g2T1c5Uk11VUVTRkJGLzlXdml3elM4azJzd0pTZFUr?=
 =?utf-8?B?ZnU5bWpLK1dVek1sVDNid3lwSC9mWlJXcGZncGRXVDJublY4TVFTZHgzR09U?=
 =?utf-8?B?WHBad2ZZSUg3OWRZT2hiQzMxTlNqZTFLSURNVkI2c1ZEWkNzMnVlMFAxVUVX?=
 =?utf-8?Q?Vngg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3932.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3c3482-b2c7-42b7-9961-08da58dacfe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:50:03.9832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /jKHRgFe89IijRCtXUM/S22lPlLqY8+ZD59jUx9SXNx4FSE7nYOFvjRoVpDCoXS577d6bv2JGaLSrCRnTMS/Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6216
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTWFyZWssDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4gDQpTZW50OiBUaHVyc2RheSwgSnVseSAyOSwgMjAyMSAxMjoxNyBB
TQ0KVG86IFJhdml0ZWphIE5hcmF5YW5hbSA8cm5hQHhpbGlueC5jb20+OyBTaW1laywgTWljaGFs
IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCkNjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGdpdCA8Z2l0QHhpbGlueC5jb20+OyBqb2VAcGVyY2hlcy5jb20NClN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjIgMDAvMTBdIGkyYzogeGlpYzogQWRkIGZlYXR1cmVzLCBidWcgZml4ZXMu
DQoNCk9uIDcvMjgvMjEgMTI6MTEgUE0sIFJhdml0ZWphIE5hcmF5YW5hbSB3cm90ZToNClsuLi5d
DQoNCj4+DQo+PiBJIHN1c3BlY3QgdGhlIGF0bWVsIG14dCBkb2VzIG11Y2ggbG9uZ2VyIHdyaXRl
cywgdHJ5IDI1NSBieXRlcyBvciBzby4NCj4gDQoNCkkgd2FzIGFibGUgdG8gcHJvYmUgdGhlIGF0
bWVsIHN1Y2Nlc3NmdWxseSBhZnRlciBhcHBseWluZyB0aGUgYmVsb3cgc2VyaWVzLg0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8xNjU2MDcyMzI3LTEzNjI4LTQtZ2l0
LXNlbmQtZW1haWwtbWFuaWthbnRhLmd1bnR1cGFsbGlAeGlsaW54LmNvbS9ULw0KDQpDb3VsZCB5
b3UgcGxlYXNlIGNvbmZpcm0sIGlmIGl0IHdvcmtzIGZvciB5b3UuDQoNCg0KVGhhbmtzLA0KTWFu
aWthbnRhLg0K
