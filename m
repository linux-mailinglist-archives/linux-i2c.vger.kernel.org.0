Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF7A3331AE
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 23:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhCIWnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 17:43:01 -0500
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:20897
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230122AbhCIWmz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Mar 2021 17:42:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hh/d19hNQAf125+7K+nfuoZut6E/CHu3Qq/sV6j1EiqzQal5PxwjlXCQsLR/RKmBEy2W8R/2GN59mBa2oLsLjDSIP0aLaWpgxtEA4dnIDs8vv0OlNZP+5WBZG2ThSNKUxE1ycLSlS/xYEWHXiBSAHK9qo14KgsmVRWPqWTtHM5gLXikY7GCOG7PTXmk7tZq7RZ27N4DqnfyKAktIZ2RSyPLJcrYu5sqYyriWeK6p4zqQ50xzdYWxQHk6SAWJQOA6PGTST9T/q6+1WRqR0MoY+3GbsHe2HZAteYP0vMdAyafEndeV55So3qR9c9Mj5BuU2jXCIeI2C4VbveLtIWB5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbP1G4f6PLBwC3DHc7sErgCsGDWRZgNvcP3zZTRRiVM=;
 b=ELSQ7PpG2vjka1BNT51T0g3V2Yd4y776+UzQuWhEoY9b3aYWDKEtxW+e4NxaEkXo9G97spnmL5a61qVfdu/so4XTrpeSZmlhmmBCEr22aED5QvlJEbMaL+zEejwsVK7EDbbJjnSyY3BaX4ma6Yon0BPvNNpLt9acAh4FamkrFEIWWMGs6t+GExtZ7hZwVSxN1TtAis1RUelNOuJt+fjb9CPTzffb4t3ed9xfOgnN++mTiAUdRZu+KxQhDx8Zx3s3wf5hyDGFD/bh6e+p/5uanDlX0JycfjQM15vfZyEcjlnghCyOcLSYMWZZR29vtmSUa0TRcN5w53AYsZdRiygN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbP1G4f6PLBwC3DHc7sErgCsGDWRZgNvcP3zZTRRiVM=;
 b=bFC7mODdH/SpUhpzVcRnQfcB3j6aySpFCaXDEYcYfmYfCGt+3wWsCKM+cnxZAdOS6EwF7yQhr6Q0Snw+yOlSChBT/iIopwltIb25BeczbmmD33yi4BrcOsgbtOxKxJ6gaL5keamno5iDtgDN2Xge5VJBP3qFLA4/J48dDZkM7PM=
Received: from VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:65::17) by VI1PR10MB1631.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:802:32::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 9 Mar
 2021 22:42:46 +0000
Received: from VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc22:3312:96a8:2a26]) by VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc22:3312:96a8:2a26%9]) with mapi id 15.20.3912.028; Tue, 9 Mar 2021
 22:42:46 +0000
From:   Adam Ward <Adam.Ward.opensource@diasemi.com>
To:     Lee Jones <lee.jones@linaro.org>, Mark Jonas <toertel@gmail.com>
CC:     Mark Jonas <mark.jonas@de.bosch.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "RUAN Tingquan (BT-FIR/ENG1-Zhu)" <tingquan.ruan@cn.bosch.com>,
        "Streidl Hubert (BT-FIR/ENG1-Grb)" <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: RE: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Thread-Topic: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Thread-Index: AQHW/i8Eo+FG3x20CECsBAnqMTUkC6p6VhOAgAEniACAABb7gIAAz+XQ
Date:   Tue, 9 Mar 2021 22:42:46 +0000
Message-ID: <VI1PR1001MB09741B1D3E04155E58D65DF9EC929@VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM>
References: <20210208152758.13093-1-mark.jonas@de.bosch.com>
 <20210308144211.GK4931@dell>
 <CAEE5dN3DcULAtmQ=4WjT3nD20AVV2sX=Yx1WSS1UuJsBWTgc3g@mail.gmail.com>
 <20210309094211.GN4931@dell>
In-Reply-To: <20210309094211.GN4931@dell>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.198.88]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3991ad0c-1881-4b14-6ca0-08d8e34ca8de
x-ms-traffictypediagnostic: VI1PR10MB1631:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR10MB163179E5FF552AEF968BB818CB929@VI1PR10MB1631.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sp5km1oMX4dGsNMrc/NtP/v34pAJWCDxX2sJ7V535Hhzb9P4ZwrWfOsX6DnFgYWXrQ8WhQwHEACX4LvN4u9t1N/9vVpwSPup4tfNwD1eJN0I7fHXq7yHp93cYzcrEC9ObVqYLDqJvCUKGlTbgWcLZRPMwrcVvs2X59PHTI9YzZqlW7bvUTBvb12uTabgvzbljypFY9Jw38CZcrPQ5Ma7GLmoNLaycZpfIPhONxQr2vAxgiAzDeBHPaK7AxaMDp/ThU4AbDZDHKJU4oi20yXq4K12/BzTtYqoi/bx05i5D3g+p+ajCBFvnodHoQz4ma8up9Ij0elrdZRDSm3PIPUh7tWwxhQmcMGKgL5zxes2FHO0Jz/Nma78RsYyAXq0rfV7Sbjmfom0wb+XGNoO4mklHrg0y4t1Wo1GSKA5eAJWvsTkKR35cF/Xcwt1qYmSjOvH0VrxO9WtAqPARh0+ZQ3xh3emsTjOwGakSVmN8HkoS5W981xIIcTeS/s7ZmRUah1TpujWhUScqmu8z7fAVzs6VQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(376002)(366004)(33656002)(76116006)(71200400001)(8676002)(316002)(5660300002)(66476007)(6506007)(54906003)(64756008)(26005)(110136005)(86362001)(83380400001)(66556008)(478600001)(7696005)(55236004)(52536014)(8936002)(55016002)(66946007)(66446008)(4326008)(2906002)(9686003)(186003)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dHdFQmxJN3JtRjhmQzEyQkhIS0pFMEpYMVd2S29oMkpxT0VPRTMybE9GcjBD?=
 =?utf-8?B?R25Bd2s4NHdIWnI5dGhWc0Y0S04vZTcvTUlmbzhFR0ZxV2ttSjJyVkxEekpV?=
 =?utf-8?B?Z3JJZXcwdU0rVzJPR1lyVVVTUSt2bTk4RWtGSDVDYndlZ2Vtc3NzRTI2Q0h6?=
 =?utf-8?B?eWJkUVI3T1IreXpSS0JZSlBJYzVoV1cycVBNdXdUZW5tUVBGcVJUTmxHOVJN?=
 =?utf-8?B?Qk1Wb1dTVC9rM243Yi84S1ZrNWhkY3NWeUJlWVk3VVpPKzNLQlhaK2k3QnFM?=
 =?utf-8?B?VCtNOFFNN1lObW94OFNWdGt6eGJoLzNka2RtLy9xMmVYNjRNTWRibHJwZlE2?=
 =?utf-8?B?YTFiMDRZZFhlZ1lFcjdQZGxWUDVjbWZDWVlRR0d4SEpFVytKZjBtOHZRTXEr?=
 =?utf-8?B?aXFQNmtRa3BlUzlnektReUlDQ1pGZm5LOE5hcG52M0crcFA5ckt4YnJjSVN5?=
 =?utf-8?B?bURyc3lwQmF4MDVXR1Q3U1JGVWQ2eG1ldUM5UU1sSTExa3NjZHNteGZONDFZ?=
 =?utf-8?B?WFc2Vk5XNFJ4RHpVMmF4Rlhud1BGcFRTTm1iYTBZY1JTTTg2TXg4cHhVTFY2?=
 =?utf-8?B?SzNaTEttTmlqVU1RS3pWTnZ2RDdqNlkyUEYvbXo0UnZXNjZiNS9vMEJPdkxT?=
 =?utf-8?B?SDNHTHZiUGlmL3BuZTlCZTV0NGNiZHkzemNhZVJwZnNaYmZ2d3hVbEc0K2M5?=
 =?utf-8?B?L3lSOVJ1MmpZSWVlT2tTV0N5Uzh2clhnRDZiQVlJM2tvMHF2c3FSK3Q1aVdM?=
 =?utf-8?B?N2RzTWt1cnVHTUNUeEJVMytVcjhiemltUXQvRHJoek1raTZROGQwUzVrTDNn?=
 =?utf-8?B?clU1alZtajFNUStvUms5V0ZjMGhkMHlmb3J0N1l4dTEwRHdRbCtKQmliRkxN?=
 =?utf-8?B?dkZyc045KytONVlEeisvYURpYnRGbU9PZ0lDNnpZdERuYm9kNGttM0JLYlNZ?=
 =?utf-8?B?MWZPeW5xTkZKWFBjZkx1TEUzTTlhWWlpdnN1clE0b0FvdjdoeWdVRmd3VG9D?=
 =?utf-8?B?Q1JBRTR2YXFvWnEwcVFGRWxwU0x4cC93MThqMW8xejdFR2VJSmlmM2c2M1Qv?=
 =?utf-8?B?aFBqWnRFNjFhYU9DL0pZbW9RK2lIVG9lRGJFTHgzNDREbmpWay8wYmg2NFBw?=
 =?utf-8?B?NnlVRkVPVUt6N29yMk91ZVBwc3hUR2Y0V3M2Q0VKdmhqQzRUVHpSNjd1cmtv?=
 =?utf-8?B?RGJweitYc3ZvU0cvWlFKTllzczdnL0FvVnE1cWdZV2kxTkk5UG0zK3NhMmxM?=
 =?utf-8?B?OUtoRkc3RWtJQWlXSkxXWlAvdUd6c25IM2NXN1pKTUo4U0RWVGt0aGU1cE1B?=
 =?utf-8?B?VllOeVl2bUZsQjltR0RoOXJRYmROM2cyeG11dGtyWkRFTU9WTVR4eGl1TnU1?=
 =?utf-8?B?emRWK2l3YmNGSzliTG04aTYyZHF4RVVmQlBvWGZ2RFNqVEpoSFBVZzR2cEFD?=
 =?utf-8?B?TXk1aEh3aC9mWE1mY0toajhNV0wvSzdJMjBVbmZ5M0lvUTN5ZHpoVVRvWDN6?=
 =?utf-8?B?eUgrRmFpZnJqWVRqby8yOVJNRVhxejRjenQvWkMrcDlSU3N1OEVYTmdtKzZP?=
 =?utf-8?B?aDB1UnV1eUFtZmJqbGJUaXIyeC9WRmVHd0o2WXduN0pSTWpxKytGWEZDVFA5?=
 =?utf-8?B?c0JoV3Ezanh1N0ZVQTFsclEwd2paSlUrZEZ6NXVXT3JvZGwvdmhKK0FUODV0?=
 =?utf-8?B?SHQ1VnQyQXdqanZEM05KbWtFK0tybHhiQU1kMlhvcTFDT0NJNmhwZXpKRGp0?=
 =?utf-8?Q?gO3ZDCIXp94v0LgMOxt8HZViQ/TJPEyeh8TMGQF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR1001MB0974.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3991ad0c-1881-4b14-6ca0-08d8e34ca8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 22:42:46.2434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaXXqb11nF1Uhf7+T2C12/u5Zge0cMsOeEFvo2R65jZRHjvhzuvWC2nFaLWwMB2QoYKpKtIAEz+ZLHjyKHq+1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1631
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGVlLA0KDQpUaWR5LCBidXQgSSd2ZSBub3RpY2VkIHRoZSBsb2dpYyBnb3QgaW52ZXJ0ZWQg
YWxvbmcgdGhlIHdheToNCg0KPiBPbiBUdWUgMDkgTWFyIDIwMjEsIExlZSBKb25lcyB3cm90ZToN
Cj4gT24gVHVlLCAwOSBNYXIgMjAyMSwgTWFyayBKb25hcyB3cm90ZToNCj4gVGhpcyBpcyBteSBz
dWdnZXN0aW9uOg0KPiANCj4gCS8qIElmIFNNQnVzIE1vZGUgaXMgbm90IGF2YWlsYWJsZSwgZW50
ZXIgVHdvLVdpcmUgTW9kZSAqLw0KPiAJaWYgKCFpMmNfY2hlY2tfZnVuY3Rpb25hbGl0eShpMmMt
PmFkYXB0ZXIsIEkyQ19GVU5DX0kyQykpIHsNCg0KRGV0ZXJtaW5lIGJ1cyAqaXMqIEkyQywgc28g
YXNzdW1lIFNNQnVzIHRpbWluZ3Mgbm90IHN1cHBvcnRlZC4uLg0KIAlpZiAoaTJjX2NoZWNrX2Z1
bmN0aW9uYWxpdHkoaTJjLT5hZGFwdGVyLCBJMkNfRlVOQ19JMkMpKSB7DQoNCj4gCQlyZXQgPSBy
ZWdtYXBfdXBkYXRlX2JpdHMoZGE5MDYzLT5yZWdtYXAsIERBOTA2M19SRUdfQ09ORklHX0osDQo+
IAkJCQkJIERBOTA2M19UV09XSVJFX1RPLCAgREE5MDYzX1RXT1dJUkVfVE8pOw0KDQouLi5hbmQg
KmNsZWFyKiB0aGUgKGN1cnJlbnRseSBzZXQgYnkgZGVmYXVsdCkgdGltZW91dCBiaXQ6DQogCQkJ
CQkgREE5MDYzX1RXT1dJUkVfVE8sICAwKTsNCg0KPiAJCWlmIChyZXQgPCAwKSB7DQo+IAkJCWRl
dl9lcnIoZGE5MDYzLT5kZXYsICJGYWlsZWQgdG8gc2V0IFR3by1XaXJlIEJ1cw0KPiBNb2RlXG4i
KTsNCj4gCQkJcmV0dXJuIC1FSU87DQo+IAkJfQ0KPiAJfQ0KDQpJIHRoaW5rIHlvdSdyZSByaWdo
dCB0byBleGNsdWRlIGEgY2FzZTsgdmVuZG9yIG1vdGl2YXRpb24gdG8gb3ZlcnJpZGUgdGhlIFRP
IGRlZmF1bHQgc2VlbXMgaW5oZXJlbnRseSB0cnVzdHdvcnRoeS4NCg0KQmVzdCByZWdhcmRzLA0K
QWRhbQ0KDQo=
