Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA214C190F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 17:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbiBWQwA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 11:52:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbiBWQwA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 11:52:00 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2073.outbound.protection.outlook.com [40.107.212.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548755F92
        for <linux-i2c@vger.kernel.org>; Wed, 23 Feb 2022 08:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByQpZhHatI5rRg7ynEabENdH+6RLC8twmE55QMpxzbIk3z/gIB05uZ9/rPCx58PtbMeAOKc3Pi6tRsmu2L+GeOlfF5Nx+aViLLNoK8zPhwsgrtDw0JIBPWfoNTa66IiZpUrorYgkX//eTUjPwmwSQcJiArq811B/34TF2JfIsfFf5tFud1pZnhFblaVi7gklg3uDWkd24EHm1K8jaEf7+pv0J5rNePFUBDO9bncYszqOQ6SGdhqt2jHt3mOr9/TZKLc7dk3PuKGeTPGJT/aGlQ003rkMMcFPNqQRIwtWge4OhVCAVYeaZtyCLAYIIjtyPTWTucLadD8hFgz2fDomCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdSzbRhtpPAETBj94wNAY5GEUxiX2f1rXH7xMMqokMw=;
 b=Yu5Y+n5jln2odz9CLstxtkd8d7niusGEYmPhKxgvMbxZaelBowwFjTF0SzbN+aHDrHYXzzeTDASgzVl/HE2UkUJPL3iquU+Elspgbb7F8lavpJOJMxAhj0fteRN+aUT96gQmKTfZFhZgif/NJQ0QHw2P7V+IsUUrxRbL3iNriM9bt7rUW/fHjRZy7OLG5GJXZLSSbH6jHQqA68aArbBuHKjc7ZJqy93Hj7bjAN7C9rEkc0d8Wa/2VWZicEEaSEqqUNqsQSPK2clXtgToUqq1k4MaR90i339y695w6MbXymItuzd1HkmIBT2G3OWZI5OseIVUsXmdLvX6/jg7CKwY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdSzbRhtpPAETBj94wNAY5GEUxiX2f1rXH7xMMqokMw=;
 b=r27E1/SHl8dOl1/+sGuYKylspb6qMsGQySxW7gJkvQltybbn3gPmhNsh7ovKKW8f3T57LElcHUdTaR39I73b5S5dx80PKCcCeQvNtIKv6kdCxvtfoRagHjA0AA+uSJadwhf6rjk8qzsEw6udbALrQK4nVR913cb6JXcMqauvzrs=
Received: from DM6PR02MB6635.namprd02.prod.outlook.com (2603:10b6:5:221::18)
 by MWHPR02MB2365.namprd02.prod.outlook.com (2603:10b6:300:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 16:51:25 +0000
Received: from DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::f0a5:b805:c932:7f0b]) by DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::f0a5:b805:c932:7f0b%5]) with mapi id 15.20.4995.028; Wed, 23 Feb 2022
 16:51:25 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     Michal Simek <michals@xilinx.com>,
        "chiragp@xilinx.com" <chiragp@xilinx.com>, git <git@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Topic: [PATCH v2] i2c: cadence: Add standard bus recovery support
Thread-Index: AQHX5P+4nJkK++Fah0WtMtDDVwc5cawaZ18AgD35WgCASX/A8A==
Date:   Wed, 23 Feb 2022 16:51:25 +0000
Message-ID: <DM6PR02MB6635F09BB6D8A90F09DE8009AA3C9@DM6PR02MB6635.namprd02.prod.outlook.com>
References: <20211129090116.16628-1-shubhrajyoti.datta@xilinx.com>
         <YaTA1j/yrCe1gGOv@kunai>
 <3d326b8430017ef67f5e0f99bb708e00113e0bc7.camel@calian.com>
In-Reply-To: <3d326b8430017ef67f5e0f99bb708e00113e0bc7.camel@calian.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b9ebda7-a290-42d6-ec3e-08d9f6ecbaa1
x-ms-traffictypediagnostic: MWHPR02MB2365:EE_
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-microsoft-antispam-prvs: <MWHPR02MB236587DD8F1BB1DFDD0AA4A9AA3C9@MWHPR02MB2365.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Jf0ZxVYEYDnN12T9LLGSpG6eHICCcBLKHT9jWNWWNulUyJ4ZxtkAO3c/edlVALEOYHpYxzHw89zaziA5lZJxs3Wa6fqPJuvzSn3qC9+zVhiyBnnAFaODs28gmivtsXTml2ACm40KFf6bW6s1Bf9Sz+rSOkYNAW3bdpKc1mTlU1zrE6Gt7jgyX2uSYX7sRZTlL82alwXxXjHZqS+lkBtIq1CjGKAyDYu6pMuvFTQOQ8WPm9wpi7DEsQFtLqJkXLbtQ9MVRLru9ruRC+TGJp8cSPnHM6TRdclEi/VhgKYBT7ZtJUfUxCbqdPONi8iWz3chuJpmjknGXJxdmEoMCMqlixK+y6ek/uRv34/1bDgULlWUxVfyq8eIpyZ6HnAvLc4VQGTH3L1ZycV1rJlLSH55DvjpWku+CKgRYQHGLU6Z+p5ZYo7vVB32AoArxIr169h7vOdo26KxeQo+3iNyjhfBQR4pThu6DX4E7w9TFAoji7qN2DJno93Z/LSpTbUwfzpZ/fXGW6Gb0Yl0OQN32Z5IoHnGCBNfgelPWX5+c56n6/wi/o090qs4UnXH6OmArcFN3HFipmUNTPowrMsBJaVgNdCd/t4yNuBMHu9yBEqczMD3wPjB7fZyo0uMw91CpoILjApbB04P47c+oODq0uPL2GotlL+XWmpLMmnXQnVPfFjrg81UdBOznxi+iqLJY+SVH1WJf6vmrLZUqgMbgLKzvpHdjrAnneCHwknKTjEsFVCnZmBqn2+rlB8jImpOuORR7XycxT68B2+7rxseMJFrdFH1JocrLvxtk9T2yk4xc4unIeOkhvwF7HCuVY5Wtm5scCk6JxcYTPcrIn81AwSpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6635.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(6506007)(83380400001)(316002)(9686003)(26005)(38070700005)(110136005)(71200400001)(186003)(53546011)(54906003)(508600001)(38100700002)(122000001)(64756008)(66446008)(2906002)(86362001)(8936002)(8676002)(52536014)(4326008)(15974865002)(4001150100001)(66946007)(55016003)(66556008)(33656002)(66476007)(5660300002)(76116006)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1RRRUhoeDNpZjY0ODFjWVJZRDBaSzNmR2R4WlIrdWQyN0RjYkpUbTdkYlJt?=
 =?utf-8?B?eDVLc1hEWUFGV21PWnUySFJNVUdoSWZaNnpvRDBiUXdSTGJrTFYycTBPRDhh?=
 =?utf-8?B?dFBlazVCUlJKVk1vYnRpakg2YzdveExSK0V5VHJhVmdSZU5DL3d6K3dScHpi?=
 =?utf-8?B?RG5xamdZQ0NNZW01cExGS2FOZUI4U0ZjN1RzZ3Z0VVpsNmMvdkdVeXNLOG1x?=
 =?utf-8?B?cEZCbGx5Mk82MmNrUFI1MExMOFJyUWVXaG5PUmMySmVtaTVsKzU1czJQOThJ?=
 =?utf-8?B?Y1JPTFphSTBRVUZpNXQ3U2xsdyt1Z3N6RUlGTXJaZUxDM2JPaGF3NkNmcGJa?=
 =?utf-8?B?bjl4dVRWWXZ6WHdUQXdTTXZVTjRJUzIxL0JKMnlTVFduU3lLQTdFek12bjRj?=
 =?utf-8?B?QzRKOWJMQTlvMmllNG5ZZ085V3ArWGRacytkSEozZU1GNjdDSEgyd0xPaG93?=
 =?utf-8?B?SFFmS2lnL1o5YkRCUy9mRFl1U0ZVT2NKV1RxbFBKZS9zMnFLaXpESXErdkF4?=
 =?utf-8?B?VXRJNzRLd1RieHhYVUQyOEpmRXBwbkkzZTdHcDRUUXBqN0MrUUYzZGtCbVFW?=
 =?utf-8?B?QjljTUFycE4xalN4YnplYnl3OXpwaTM2WW5mWjY0SEpMUmF1SnBtR082NDFz?=
 =?utf-8?B?VURLSFFPSFg1MTVGc1RVNWVsV214Z09QbVk3eDErNGFFQ0RhVlJqK3lHYlEx?=
 =?utf-8?B?RkNRSTlEaGlNaFhXY0NKUzI4MFRWdTRLejkrUUlHVHVzNWhFVmhtYmY3MHNi?=
 =?utf-8?B?Nk1LeFVETUdqbDJqZW1mNmZYSS9zdC9OQXdEUFk5WllQenMyWjA2ekttVURB?=
 =?utf-8?B?M3N2OEtRZVdyeGJwMjE0MmhDVHQyeWJKYVZQeDVVUWZYYlFPT2lzUU5XR1Fs?=
 =?utf-8?B?cHMzOFhJL1RxSEhUeFBoa1Z0UEZvZmRhajBEc0haSVdrLzJteW5idG9LckxS?=
 =?utf-8?B?M2FJTDFLdGx2SUIranM3NldMQnlxcC94ZVp1b0h2N2ozS3NRUkVIRGFBZ3ph?=
 =?utf-8?B?cTB4UFovcm9tcFVpTUszamliemUxMkFCbnRNMWJaUGZjWjBMSlBHMWZSbm1V?=
 =?utf-8?B?VlhSTDJhTG1zY1pjSXVhREhUVlRTbGNWMFNhUmN6VlVwaWNQcHZSY1orUEtk?=
 =?utf-8?B?dzQ3WlUxZjM3MmllYnNqd0FIM1NER0FKVzJoeDVvQjNzWGxvUnduSTkzZDJp?=
 =?utf-8?B?OWZZOTZmSHF0NlNIYTEzRVAyTkcvZUxCR0RuTHowbHNsMUN3TVQ0Q1owbVJU?=
 =?utf-8?B?dHNYQ3RBMnNGTFZzWC9zbUdRK1BxVVZ1VVZENFdGU1J6UDhWZTYvYjZzbTdR?=
 =?utf-8?B?eFBrM240RkpQQ1dWd2EyZDFJSG9UVTBjem5ia0VjN1V4Y2s5R2Y5SEdlaHp0?=
 =?utf-8?B?aXlWc3ZCZHdDMVZYcFdLT2RmWDdVTE9tUDRYaGNQT2NvNG1QOVl0OUlTMmtF?=
 =?utf-8?B?cVdTQWZBL2liL3h3UFVqaXJWQ3NpNlVwNWJVRGIvaWVFTjZ6MldVWXV1c2NE?=
 =?utf-8?B?UWpiN1k4ZGJnN1c0MS9FTE9jaHByWTlya1dubUdvWXhQQjRQdzVhVHBWN29a?=
 =?utf-8?B?b2h2UnVIeHczY1F1YTRIZ1J6WFk2SFl6L2lOU1M4bmREUnZ4aU1DcVlpYURZ?=
 =?utf-8?B?TW1BcVBDTm9xTXFsSTU2Sy9iSWhUaTVKeUIzbGlrTlljdldTems4MGRjYjA2?=
 =?utf-8?B?YWhnaTFiYk9WNVpUTlhxK1FEd2NzZFVhQytoV2FPQUhNMWsyM3A3NjVHMms1?=
 =?utf-8?B?bkljQllxaG9vWGlycWNNZC9SV2NVeTJHdHlvTE1wNVZVVm01aVJodGxhdm90?=
 =?utf-8?B?enZ4TEY5NlppMVBJSHFPVWRVVDQ2KzVHVTFWZFh6OWQ2TGFMb3o0TUE1cVBK?=
 =?utf-8?B?QitzV0VIOCs5MGMwdU5FbE5kV2dzNHVOVkNSVXhkMVVQeTNtN2RlSTFhTDFw?=
 =?utf-8?B?R3dEVzNYUXBvUkNyUThWSnNjVzhxMER0QXA3UnZxL0kxZ2NrWldSTEtnRkVl?=
 =?utf-8?B?cDMwcS9EMW9idlR4elhzVTZDdjBlN3cyb2hBOWQzTUxkVjMxMXJHWmMxQzZq?=
 =?utf-8?B?aFJUb2dqWHR0RkZoVVRIMTZJL3lkY2huZmZpZEttU2dyUUJVQXZLSTBENk5G?=
 =?utf-8?B?ajVDOFVQSGJLcU5VNS9pV2dTUGFMakVtRlZ5a3dORmdjbU1Nc2dVWWNobVlj?=
 =?utf-8?Q?mgGILVBpLp3uMm0Ltc9jsb0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9ebda7-a290-42d6-ec3e-08d9f6ecbaa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 16:51:25.2416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SkF3c7cIv32MlvL7GByH8393zBPrpaNWjT5V7f/vQX0mfHlKxbUlvN1hVck3bXMDg5700RlO8zkGOZEs+AHEZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2365
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iZXJ0IEhhbmNvY2sg
PHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDgs
IDIwMjIgMzo1NSBBTQ0KPiBUbzogU2h1YmhyYWp5b3RpIERhdHRhIDxzaHViaHJhakB4aWxpbngu
Y29tPjsgd3NhQGtlcm5lbC5vcmcNCj4gQ2M6IE1pY2hhbCBTaW1layA8bWljaGFsc0B4aWxpbngu
Y29tPjsgY2hpcmFncEB4aWxpbnguY29tOyBnaXQNCj4gPGdpdEB4aWxpbnguY29tPjsgbGludXgt
aTJjQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBpMmM6IGNhZGVu
Y2U6IEFkZCBzdGFuZGFyZCBidXMgcmVjb3Zlcnkgc3VwcG9ydA0KPiANCj4gT24gTW9uLCAyMDIx
LTExLTI5IGF0IDEzOjAwICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+ID4gT24gTW9uLCBO
b3YgMjksIDIwMjEgYXQgMDI6MzE6MTZQTSArMDUzMCwgU2h1YmhyYWp5b3RpIERhdHRhIHdyb3Rl
Og0KPiA+ID4gRnJvbTogUm9iZXJ0IEhhbmNvY2sgPHJvYmVydC5oYW5jb2NrQGNhbGlhbi5jb20+
DQo+ID4gPg0KPiA+ID4gSG9vayB1cCB0aGUgc3RhbmRhcmQgR1BJTy9waW5jdHJsLWJhc2VkIHJl
Y292ZXJ5IHN1cHBvcnQgZm9yIHRoaXMNCj4gPiA+IGRyaXZlci4NCj4gPiA+DQo+ID4gPiBCYXNl
ZCBvbiBhIHBhdGNoICJpMmM6IGNhZGVuY2U6IFJlY292ZXIgYnVzIGFmdGVyIGNvbnRyb2xsZXIg
cmVzZXQiDQo+ID4gPiBieSBDaGlyYWcgUGFyZWtoIGluIHRoZSBYaWxpbngga2VybmVsIEdpdCB0
cmVlLCBidXQgc2ltcGxpZmllZCB0bw0KPiA+ID4gbWFrZSB1c2Ugb2YgbW9yZSBjb21tb24gY29k
ZS4NCj4gPg0KPiA+IEd1eXMsIHNvcnJ5IGZvciB0aGUgbG9uZyBkZWxheS4NCj4gPg0KPiA+ID4g
IAlpZiAodGltZV9sZWZ0ID09IDApIHsNCj4gPiA+ICsJCWkyY19yZWNvdmVyX2J1cyhhZGFwKTsN
Cj4gPg0KPiA+IEFjY29yZGluZyB0byBJMkMgc3BlY3MsIHJlY292ZXJ5IHNob3VsZCBiZSBkb25l
IGF0IHRoZSBiZWdpbm5pbmcgb2YgYQ0KPiA+IHRyYW5zZmVyIHdoZW4gU0RBIGlzIGRldGVjdGVk
IGxvdy4gSSB0aGluayB0aGlzIG1ha2VzIHNlbnNlIGJlY2F1c2UNCj4gPiBvdGhlciBpc3N1ZXMg
bWF5IGhhdmUgc3RhbGxlZCB0aGUgYnVzIGFzIHdlbGwgKGUuZy4gYnJva2VuIGJvb3Rsb2FkZXIp
Lg0KPiA+IE1ha2VzIHNlbnNlPw0KPiANCj4gSXQgbG9va3MgbGlrZSBvbiB0aGUgc3RhcnQgb2Yg
YSB0cmFuc2ZlciBpbiBjZG5zX2kyY19tYXN0ZXJfeGZlciwgaWYgdGhlDQo+IGNvbnRyb2xsZXIg
cmVwb3J0cyAiYnVzIGFjdGl2ZSIgaXQganVzdCBiYWlscyBvdXQgd2l0aCBFQUdBSU46DQo+IA0K
PiAgICAgICAgIC8qIENoZWNrIGlmIHRoZSBidXMgaXMgZnJlZSAqLw0KPiAgICAgICAgIGlmIChj
ZG5zX2kyY19yZWFkcmVnKENETlNfSTJDX1NSX09GRlNFVCkgJiBDRE5TX0kyQ19TUl9CQSkgew0K
PiAgICAgICAgICAgICAgICAgcmV0ID0gLUVBR0FJTjsNCj4gICAgICAgICAgICAgICAgIGdvdG8g
b3V0Ow0KPiAgICAgICAgIH0NCj4gDQo+IEknbSBub3Qgc3VyZSBleGFjdGx5IHdoYXQgdGhlIEJB
IGZsYWcgaW5kaWNhdGVzICh0aGUgWGlsaW54IGRvY3VtZW50YXRpb24NCj4ganVzdCBzYXlzICJv
bmdvaW5nIHRyYW5zZmVyIG9uIHRoZSBJMkMgYnVzIiksIHNvIHdlJ2QgaGF2ZSB0byBkaXN0aW5n
dWlzaA0KPiBiZXR3ZWVuIHRoZSBjYXNlIG9mIGFub3RoZXIgbWFzdGVyIGRvaW5nIGEgdHJhbnNm
ZXIgYW5kIHRoZSBidXMgYWN0dWFsbHkNCj4gYmVpbmcgaHVuZyB1cC4NCj4gSSdtIG5vdCBzdXJl
IGl0J3MgY2xlYXIgZnJvbSB0aGUgcHVibGljIGRvY3VtZW50YXRpb24gaG93IHRvIGRvIHRoaXM/
DQo+IA0KPiBUaGF0IG1pZ2h0IGJlIGFub3RoZXIgaW1wcm92ZW1lbnQgdGhhdCBjb3VsZCBiZSBh
ZGRlZCBpbiBvbmNlIHRoZSBidXMNCj4gcmVjb3ZlcnkgZnVuY3Rpb25hbGl0eSBpcyBpbiBwbGFj
ZT8NCg0KSSB0aGluayB0aGlzIGNhbiBiZSBtb3ZlZCB0byBhIHdhaXQgdGlsbCB0aGUgYnVzIGlz
IG5vdCBhY3RpdmUgd2l0aCBhIHN1ZmZpY2llbnQgdGltZW91dC4NCkFuZCBvbiB0aW1lb3V0ICB3
ZSBhc3N1bWUgdGhhdCB0aGUgYnVzIGlzIHN0dWNrLg0KDQpJZiB5b3UgYWxsIGFncmVlIEkgd2ls
bCBzZW5kIGltcGxlbWVudCBhbmQgc2VuZCB0aGUgbmV4dCB2ZXJzaW9uLg0KIA0KPiANCj4gLS0N
Cj4gUm9iZXJ0IEhhbmNvY2sNCj4gU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4gQWR2
YW5jZWQgVGVjaG5vbG9naWVzIHd3dy5jYWxpYW4uY29tDQo=
