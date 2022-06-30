Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1038156125F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 08:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbiF3GUd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 02:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbiF3GUc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 02:20:32 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D471C1C93F;
        Wed, 29 Jun 2022 23:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaFcRDFaP2WSplFLlRlVZgKswzmzfRWHudRL+bRrp6FvlXRTJtWEUs9Qbptn1oD06RJGmnUkltYTaC0ns6hIngryr4kGnq2xeeiGPCvx0agGlkZBkuCIghPmhvxIBmMp3WQZYtdFTtC21cHX7Qz2k3lVRhJBhaDBQYJApO/W3cGOuId8ZtjGmbFSNGiZnsgogI9hc1afeHteaLJoMJdbzq7C5ws7pIlfqKtPOmKLmp8Xa+8fqjsI3sJam70r+/nFy8r2p5ikzFf0XeQRHtnBsmlKeV6ctfoeWl1I+95rn87mtY2GIoXfXZoOOXPBTYj5YGWL0LuPjrke9XAsiD4Ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9iogG/0vKFKJogPRE845FhcoiT9eLy4Q+kpMKx+wcU=;
 b=k43vhXW6EAOIYF+NlQyd3FFAcbRjBRVhhgcuw7PoiGQfYzA6t5yeo0iXtcwU2sRtY/V8BgdhnWbkSVyDFrcWgZhy7Q9h4HtPB3IqLcIoz4ONGv15FJOH/B8Dn8acfiEXs8hzpP3zeGZBENEuR3e4VVmYMAEssY2Wz3dkYeWLQweCE/JKMYurpAAKsDAT2qOhtOg3FH4fOynX8IjOgBtJnw1u8jRmZjkTjy5f7mZyHM3VEnc+Ji4awxqR8CoyvOG3j64CAMAtKNIWAXav0Wd4oS8IADmrqmXXVrCLWTijsqLgUDiedQo1ZGHbMM5R6ofdLy02HBeJMhdPLn8R+n876g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9iogG/0vKFKJogPRE845FhcoiT9eLy4Q+kpMKx+wcU=;
 b=plvYPhBJNUPARFKBkpT1aySSvNjg5bdeeCXK4zoZXn4FwfTMMmxSVSKx71D3Bho0MmO4UJg/vt40FfT0613hLroysINeb/XxR96yQ4UEJZHgUV2g9XcFIxq4Pd84wpRmSPG8jk7tTAwSESmAUf/W7/8LWR0kMmjo4dMYKiw7kko=
Received: from PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10)
 by PAXPR04MB9232.eurprd04.prod.outlook.com (2603:10a6:102:2ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 06:20:27 +0000
Received: from PAXPR04MB8304.eurprd04.prod.outlook.com
 ([fe80::6c24:a20:26bd:60df]) by PAXPR04MB8304.eurprd04.prod.outlook.com
 ([fe80::6c24:a20:26bd:60df%2]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 06:20:27 +0000
From:   Zhipeng Wang <zhipeng.wang_1@nxp.com>
To:     Wolfram Sang <wsa@kernel.org>,
        "samitolvanen@google.com" <samitolvanen@google.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] i2c: core: Disable i2c_generic_scl_recovery
 callback checks with CFI
Thread-Topic: [EXT] Re: [PATCH] i2c: core: Disable i2c_generic_scl_recovery
 callback checks with CFI
Thread-Index: AQHYipisQEgXaD6RFU2HjOnVd/mFf61mx7cAgACusOA=
Date:   Thu, 30 Jun 2022 06:20:27 +0000
Message-ID: <PAXPR04MB83044938120EC7C8C55FB2A6EBBA9@PAXPR04MB8304.eurprd04.prod.outlook.com>
References: <20220628024155.2135990-1-zhipeng.wang_1@nxp.com>
 <Yryn8PdQIH7RaUwO@shikoro>
In-Reply-To: <Yryn8PdQIH7RaUwO@shikoro>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-Mentions: samitolvanen@google.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db6e773f-50d6-4f0b-44a6-08da5a60a001
x-ms-traffictypediagnostic: PAXPR04MB9232:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MzOha3yZn7sT80ig/XMT168qn3o8PVveRRLJGlrFCbusJLOXEwTbeTtVplQ7JZo5CHfnmIcvM+5QcCmmkuIKECNjAqfnyOceAQlRzMhkNaqq/GBYslvQ0LmCyVWuJqiKS/NLiYbJ2TZCOmNH/nYjbsMdtMdBk3ZieRrsLXOxEknRPSDDnHRhQZG+EusMQW5eGdZ84UWUuj9kHER4j0iCziu/+6veKUHlhNFJ6qQNSOgSm9sHrSRORXXEmdCgS2K/Vsvfou1tYdt43scyXYuswWHlb05Aq3/7lv9Cb6ihWAbcN1fr3o84co4S85ylUnKNlhbu/BpIy4+nozR/UlFbkrEe+hIBYCbxnE4rLJ7MVVOeFwIRMYyIKBIvybIb1JSjb/IBBcXtAEJJEctz/UJeewt/EUhV3O1Q9tJXQCoqxRhgg+6IbbaBRgCtkvp/crRIozS+mWTzfo0vqSor3V2a9FYJilK8xowbUjY6DVRMjkaejfwNvCFvgsMqFUXOLXt4L0kvxmVx3jXbrYkg+pHJ5G5VuGKbGZ7VN1evan/6fJDE0Uo9hByF0XyRJ0LFTunAmhm2YBs6ydYsAEcPyH8Y2c167MA3+YsDwaCfaRnDu9OiugU7p9Q7TRrxj6BkNgEvqLUANiQHMXZbhRIZER1ioueEWAMiIIz/+CGlaE0hpAV+9TapvKV2b3vvQzxHKZBh4Z4H7ZDPSFz/ywbuRZdQ1wYYcJs8myUIPzceIOO9fm9e6GTa40u1V5lS2RHWEbddtnfJbX0+uPpoESj1mhk9No6/5K6XxC6lHo9UStGvAn/wH9yMGbHqtGuekG8iR+Tau7seQll8OYJyVpjq5RhQ3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8304.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(33656002)(186003)(41300700001)(8936002)(66556008)(86362001)(478600001)(26005)(5660300002)(9686003)(83380400001)(2906002)(38070700005)(54906003)(52536014)(66476007)(110136005)(4326008)(53546011)(122000001)(55016003)(7696005)(76116006)(66446008)(316002)(6506007)(8676002)(64756008)(66946007)(38100700002)(71200400001)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?d0VGYVNsMXl2QU53aFFWeG5KUyt5THV6Z291TkZZR2JFZ2J5Nm80a0QyT0JE?=
 =?gb2312?B?N2ZscXVQbTduQ0JxWjVZMVhXQTBoVE15cWE1OUR5S3lOZS9hQnAySm1xdjF2?=
 =?gb2312?B?M3BXNUhuUllTaExDTE45b2tIS0pTcXNrdGdEeSt5KzlHcDREaWt0UGxsSXZi?=
 =?gb2312?B?eFhITHcvMy9YNFRHS3pFaG1rZ3ozd3lhSzA3c0FIVVE3aGFhd3ZCK25qbG9j?=
 =?gb2312?B?NnIwYU43NFNra1phOW1pUFkxN0RhTmk0QlZJdjY0SlJnL2ZrSEtKbGdWZFZB?=
 =?gb2312?B?TlJiME1ROTNNSVJkYTRSMmNTaFBLVGxrRzF2K3pIWFRHbDNQRmxBZk56Mzlo?=
 =?gb2312?B?RE5XT0ZBZGVCbG9zMUt1aVZ4c1F6dWd0V05aaWdWb3ZBanFLci9LeHJwOVRW?=
 =?gb2312?B?c3ZFWEUrWjlTSWxRR0N4eHN2Q1dCMjl4WlFMNFJYOUFTOTN5LzVFUHpJWlA3?=
 =?gb2312?B?WjFPK1V2WVpVZ1lsL1A0eVBvVUdieVEzSWd3c0c0RklHS0dQQU1CL2NQNExa?=
 =?gb2312?B?NlBMakdZNmlrWXloK0ZLWU40MTNqL011TURLbFo0RHJlWGxLTWMzcjFHU2c3?=
 =?gb2312?B?SUgwamRPVlpWR1JuR2NGQTZQdEV1MzlUOWJTRFM0K012ZG9BOUNDeUJkNXNo?=
 =?gb2312?B?OXhXVUVPNXRwdnVLZTBZYzhSRVMwREZOUGoxNDhPb0NsN3QzNnYxUEV2MnBi?=
 =?gb2312?B?VnYvM1IrOVdCUE0xTXI0aGUyTXJoMCs4VDlsK0M0S1lqdFNBRnVmeTlrZWlC?=
 =?gb2312?B?dkk5V2ovbnI5OGFOTk5meE5JczlDTVdya3JHLzFBTnJvaHd4eVhWdkRqNVJ1?=
 =?gb2312?B?Mks4SVF6YlBFVER4MkFOUGFUS0Z4YTNETGV1Zi9nNDlvRm02VXMzZjVDNC9p?=
 =?gb2312?B?U2ZLd0liTDdLOEJvT2lKZEZSK0NoM05GS0hKTnhlTFZPWit0KzhqVGwvOWU1?=
 =?gb2312?B?M0thdjhaLzF4MHNRazVyL0g5RXpUUUhZTFdsdkwrdzJEM2RQdGNkaFRZdWZa?=
 =?gb2312?B?WkpBaEMyNTByRVZ6WGI3SFVORWVNaE9wMmNYaklrS3ovVlJ3bE42MmxSTC9E?=
 =?gb2312?B?THRqQ3Q5Y3R3WUFoRXh0em1GUWFPcklxd1VmL0dqMENuYkdqcVRvaGt0dWVZ?=
 =?gb2312?B?VDVCK21uRG1TQVhGOHk3YmREL2xFc2FMT2NGWUtsQ1JqZGdEQXpGOVJQWVlL?=
 =?gb2312?B?MmNnbmJMQjhqbit6b2I3clM5bGtGdGZYd29WU2FNblVjczlLODU0Ynd5U2d0?=
 =?gb2312?B?SFJjVTNsVWVHWnJLaXRIRHFXdkhiNXhxdmw4VmF5cEh0V0JlUUk4eFNDSFFP?=
 =?gb2312?B?eXhQdVhnb3hoR1VubTNZeUJyY0ZGY1JqYjFKc25kM3NFeW1SMFJBNmYrdXNu?=
 =?gb2312?B?R3NNZHI4UWl0Zy9LY2ZDZXZMOXBFNUVmODZaclNhdEpDdFBDaWJBeGlHQlYv?=
 =?gb2312?B?MDVQMnA4TkY5dTA0dG1ZOWZjWFFVUXVLOGRIdnpobmJFNHRWb1QrYWlScXI0?=
 =?gb2312?B?Z3Y2NG9EYnJZaXNsSHBCN2F4OTFXVEtwNGpkeGcwelByd09FV0FRMGlvWFA2?=
 =?gb2312?B?QVR3dEVudnY0bUs1SnpralVXNzF6UUxubVB1VkhjT2hnQUgzclFGQTN1TllT?=
 =?gb2312?B?b3Z0OWtpbzBXZDZLSFlYR3RmVUV2RVVSNWZuaG9aYVF3enZVOWs3dGt2Z3lD?=
 =?gb2312?B?QzhnV0NDWVRvTUZCR090Qm02RGxOY1hCOFEwTzNYLzFYMHRhcUp6NXB0Q2o0?=
 =?gb2312?B?UWR3ZjFCVytjUk14U3VOdU50ZW5iZmRJSlFCQ0QvZ2RqV2x6aStYbStndjhu?=
 =?gb2312?B?ejIzaHpnTDBZZnN0eCtIRlVVVW1tT3NzdjlnYWpuZ1B4eERzSDg0enpWblVY?=
 =?gb2312?B?UDd2M2lyYmUwbXNSalB1RVI3MC9DSmQ5dEZjdmpROGhMRkM5TGpTV2pFWC9x?=
 =?gb2312?B?N2Z4bWlBaTFwNmNZUTRYYkpzZWdKMHUvL1cwVkhsMy9HczdtNjgrWHVHUTZO?=
 =?gb2312?B?MWlSV0FmSEQ4K2NwaUZ2a1BFVVlNQis4THJUWTAzVzRIMitJOCs1TXU1NFcx?=
 =?gb2312?B?VEptaEJVMjJvMTdmRlNFWTlGN0I3cTEzS21zV1lBSVgyelkwVjhqNzUrajZD?=
 =?gb2312?Q?G8R35wqZwWGKLnnh3C2Yztmq6?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8304.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6e773f-50d6-4f0b-44a6-08da5a60a001
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 06:20:27.3988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuXcu6JBg/0rgjTQZ1jaiPRfJOta9g1DeDdJFNTIbZPHjuZqJZ4IXhjMd73nH7rJ1qGaYBUoU/kH3flvA0mNCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9232
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Q09ORklHX0NGSV9DTEFORyBicmVha3MgY3Jvc3MtbW9kdWxlIGZ1bmN0aW9uIGFkZHJlc3MgZXF1
YWxpdHkgYmVjYXVzZSB0aGUganVtcCB0YWJsZXMgYXJlIGJ1aWx0IGF0IGxpbmsgdGltZS4gVGhh
dCB3b3JrcyBmb3IgdGhlIG1vbm9saXRoaWMga2VybmVsLCBidXQgbG9hZGFibGUgbW9kdWxlcyBh
cmUgbGlua2VkIHNlcGFyYXRlbHkuIENGSSBpbiBsb2FkYWJsZSBtb2R1bGVzIHdvcmtzLCBidXQg
ZWFjaCBtb2R1bGUgZ2V0cyBpdHMgb3duIGp1bXAgdGFibGVzLiBUaGF0IGZ1bmN0aW9uIHBvaW50
ZXJzIGFyZSByZXBsYWNlZCBieSBwb2ludGVycyBpbnRvIHRoZSBqdW1wIHRhYmxlczsgc2luY2Ug
bW9kdWxlcyBoYXZlIGRpZmZlcmVudCBqdW1wIHRhYmxlcywgdGhleSB3aWxsIGdldCBkaWZmZXJl
bnQgcG9pbnRlcnMgYXMgd2VsbC4gSW4gb3RoZXIgd29yZHMsIHRoZSB2YWx1ZXMgb2YgdHdvIHBv
aW50ZXJzIHRvIHRoZSBzYW1lIGZ1bmN0aW9uIHdpbGwgZGlmZmVyIGlmIG9uZSBvZiB0aGVtIGlz
IGluIGEgbG9hZGFibGUgbW9kdWxlLg0KDQpJbiBzdW1tYXJ5LiBpbmZvLT5yZWNvdmVyX2J1cyA9
IGkyY19nZW5lcmljX3NjbF9yZWNvdmVyeSBpbiBJMkMgYWRhcHRlciBkcml2ZXIsIGFuZCBpbiB0
aGUgSTJDIGNvcmUgdG8ganVkZ2Ugd2hldGhlciBicmktPnJlY292ZXJfYnVzIGFuZCBpMmNfZ2Vu
ZXJpY19zY2xfcmVjb3ZlcnkgYXJlIGVxdWFsLCB0aGUgY2FzZSBjYW5ub3Qgd29yaywgYWZ0ZXIg
ZW5hYmxpbmcgQ0ZJLg0KDQpGcm9tIGEpIHRvIGZpeCB0aGlzIGlzc3VlLCB3ZSBjYW4gb25seSBh
dm9pZCB0aGUgY2FzZSBtZW50aW9uZWQgYWJvdmUuIEkgZGlkbid0IGZpbmQgYSBiZXR0ZXIgd2F5
LCBzbyBJIHN1Ym1pdHRlZCB0aGlzIHBhdGNoLg0KRnJvbSBiKSBDRkkgdG8gZml4IHRoaXMgaXNz
dWUsIGRvZXMgU2FtaSBAc2FtaXRvbHZhbmVuQGdvb2dsZS5jb20gaGF2ZSBhIHNvbHV0aW9uPyBB
Y2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGluZywgdGhpcyBpcyBhIHNpZGUgZWZmZWN0IG9mIENv
bnRyb2wgRmxvdyBJbnRlZ3JpdHkgKENGSSkuDQoNCkJScw0KWmhpcGVuZw0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4gDQpT
ZW50OiAyMDIyxOo21MIzMMjVIDM6MjkNClRvOiBaaGlwZW5nIFdhbmcgPHpoaXBlbmcud2FuZ18x
QG54cC5jb20+DQpDYzogbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0KU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSF0gaTJjOiBjb3JlOiBEaXNh
YmxlIGkyY19nZW5lcmljX3NjbF9yZWNvdmVyeSBjYWxsYmFjayBjaGVja3Mgd2l0aCBDRkkNCg0K
T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMTA6NDE6NTVBTSArMDgwMCwgWmhpcGVuZyBXYW5nIHdy
b3RlOg0KPiBDT05GSUdfQ0ZJX0NMQU5HIGJyZWFrcyBjcm9zcy1tb2R1bGUgZnVuY3Rpb24gYWRk
cmVzcyBlcXVhbGl0eSwgd2hpY2ggDQo+IGJyZWFrcyBpMmNfZ2VuZXJpY19zY2xfcmVjb3Zlcnkg
YXMgaXQgY29tcGFyZXMgYSBsb2NhbGx5IHRha2VuIA0KPiBmdW5jdGlvbiBhZGRyZXNzIHRvIGEg
b25lIHBhc3NlZCBmcm9tIGEgZGlmZmVyZW50IG1vZHVsZS4gUmVtb3ZlIHRoZXNlIA0KPiBzYW5p
dHkgY2hlY2tzIGZvciBub3cuDQoNCkNhbid0IHdlIGJldHRlciBmaXggYSkgdGhlIGNvZGUgb3Ig
YikgQ0ZJPw0KDQo=
