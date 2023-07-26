Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC566762F36
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbjGZIIW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjGZIH0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:07:26 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2083.outbound.protection.outlook.com [40.107.15.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9205584;
        Wed, 26 Jul 2023 00:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIo+uxgdqNKJxW8RuFkQGiKbE8xdh6JY7R+BI0KkT+SNsSkCi9o6rNtvW+BArY2YuaTJvdjYsrdxVabxMcu0ik0z5VA7cERFd/gE/mCO9AnqT0fa3rrBm2jpAfeRkbzUMpZZHQXL13V3a+V2Cvz8taABHJBYoZsAEZqsERdjpegKgiRHm84Y9zQp76d506dtDrfWGodtPrQD6UEXAVUvGavGykKGwnzzg1xjwi73efsTfbhZSjQcUsbfgOClhVFp+rUXks63oCLKO2UoJbVin+hjPkzutDqY9KrZSgdTzm03xNsCYa7n/qoX6wgcIZeJCooZ/cIonfhEbDcquukFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twbZxhH3cS1P/0vYmpUi4g3VezaIwoVjQ/RSQOnmj6w=;
 b=OE4ma5hRKbJTjdPvvMi3yguROIBfqTaKKFva/sU2ShVyhnf4Yg/kmTD6oOoQMKuZYR9nZj0Ujkk+eQws4rEAaJ8AvRqIkC9UJsG85g3nZF92bOjteyULaDkSLP/o5e7QlCUBmTEzfhZ7StVEvI6fNb8KMsfy96NfasLt+IlOhsr0Bim9bRo78LpoVfoa7pso6pE6r+eWTrsFA8/LMSlw7jQysnfbE5un/xZAwMaqYFYh+BXeUqBR09BJSDgVb/DJvd1vwMUSniRfGBBdJFFH8veYc71YAcHKIccBEcY7XGmKXfKXsDlGEN99XH+X+59qyW5dVn8p+icUjy1lY6VvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twbZxhH3cS1P/0vYmpUi4g3VezaIwoVjQ/RSQOnmj6w=;
 b=MuuTrCv6C7cCcUHvyoRT/dgdmpCh2CcnCkCMoWEcxHES63WZb4WouxVFwGTrlZLLbRe3j4WA5mt/PVGOGzTklNcHvet1LUbb0NsUNQQabROGEn0gMDB6TV7UMy/JSTiz3AHxcnAss+pgKp2waTnmWqzXkohkSMWETtS7nA9Lb5w=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 07:59:14 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::b73:c305:c239:daff]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::b73:c305:c239:daff%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 07:59:14 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Carlos Song <carlos.song@nxp.com>
CC:     "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c peripheral clk
 doesn't work
Thread-Topic: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c peripheral
 clk doesn't work
Thread-Index: AQHZvtHd1H1NlksFykekE9rw4Zk2ma/LJU0AgACGF3A=
Date:   Wed, 26 Jul 2023 07:59:14 +0000
Message-ID: <DB9PR04MB8477BE7C43982637DC2F0DA68000A@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20230725083117.2745327-1-carlos.song@nxp.com>
 <20230725234102.louqs6gvlhfehjur@intel.intel>
In-Reply-To: <20230725234102.louqs6gvlhfehjur@intel.intel>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8477:EE_|AS8PR04MB7686:EE_
x-ms-office365-filtering-correlation-id: d1dfba1c-73c3-4e27-ee6a-08db8dae3431
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IvJk5TvehAGz2dlhYA7tS4gYqRfQKlKAyNVLbjy+4L0hNUVevWYqlsCwjSN+OQrHOHr7ljOV4+Vj3nVciAixuiXwczJG6XoAQfza/DfqT8H7bs5A9ZeNVQa0m8Z/sfrmLe28bgu1REP0oHHStp1eozrTIHyrsP8o2tugm9g+C2L6FdDBOUE6lxqhAdP3Uyz44VzDbH3DnUAqmiChuZQnaVasFOzYSveAZxdOx0l8FQ66Z3ep7ANbWEW7cFk4scHBDU5aY6hSNhlrq6eqmb6ofqlT1dTuJ5VDfrFbdGicg/lOAcTbjBcPdFW7Kfzc5ucYP/jjNHkONM9Zlayj39RXpyRPvvlYx+b5kQSRhf73qkrFhJ3OaAojI4XPFsvdRjkYtxzLX9FSIGIdVZDRehNz9x+eAasslg3VNWA/xdtcCAurEhXZPivhBRAxJvr2iR5Arn1KUAJkIzJgaGoi3b5vA4rYi4Klyog+y7TgFGM+cvH9HtWdGtMOvnv3ydVLF5Y99wGk3SwWc0nIhIP4vz+TdK8FPfbC7pFtZz5xBc/EF9Da4rQu80A/td87daWDlT+HB4XMAPfZjLa1nN0Z3a2FPLQBnoi/W+kqEB0nvZvHq0S1hcetCRyBka/UOe4YCTZK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199021)(83380400001)(478600001)(110136005)(54906003)(52536014)(8676002)(8936002)(33656002)(44832011)(55016003)(41300700001)(2906002)(71200400001)(38070700005)(6506007)(66556008)(66476007)(76116006)(66946007)(64756008)(38100700002)(86362001)(122000001)(66446008)(5660300002)(4326008)(6636002)(316002)(26005)(7696005)(186003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NXJ2SjgvdkNuRkpYejJ2b3VDcjRrVEhXOGtnVFkyaUxuaktkdkZocjlaQ1Iw?=
 =?gb2312?B?UStZRGFXcHRKZmpINGtuVHRlUXJuVVh4UWRrME5LWklGeUowWFdJd0dzYU8r?=
 =?gb2312?B?T1ZHbjd1ZjNkSmdXaVlGM3JkTllyT1FXVmtpa1lLd1VyQ3VxNUZCYzFVd05z?=
 =?gb2312?B?cGhpbzV6S1c4dWZUVzE0ZndYTm9mRmdRbjRYaGtMNFR3ZXI0c05lN2RvQXJk?=
 =?gb2312?B?MmhUaUJqVEh0cTE2c2V6UGh2SnFIeTJLdmZkWFdVL01aM1BHZGZjYlpHTUZC?=
 =?gb2312?B?UXlOa2hXZElHUEZwTlVGV2FoNXVXN1BiWS9BZ2hRUGVWVEVveGJqeUZOZVlV?=
 =?gb2312?B?NTRhNVFoUnM4YUJCNFhBUmhWNjhLSVlLdjRXb2l0UHUrWkY5eFF3WEovcGx6?=
 =?gb2312?B?aFlVQmYyT0pveGxHNjlxRGRhM0ZLZG5CVGNDNytxYnQ5c0MxQzlQcDZPd1N0?=
 =?gb2312?B?ZHhWSnNnZmo0ai9ja0Q0bEs3dXd1bmhjcTlOZy9TMmtZSkEvWE1qZDB6MUN3?=
 =?gb2312?B?Z01mckxFUVRoRWxaRzJpaEd1Z05LVEdrdUh4QXZ5MDNiZWpWc0FNZEFNY1VF?=
 =?gb2312?B?VmdQUktoZURBd29objAxTUVQZ2tBYUdidFFnM1VENDlGSmRya3hRblNuZEJr?=
 =?gb2312?B?VGlweTIvN0Z5QkNkcUcwenB3UWhSZnc0ZFJxRTBTV0lGdjVldDZxR052TXgv?=
 =?gb2312?B?Qlg3MmFjUjNnR1RVemJEeW8xQmJTWG53OTcrWnNvUVpyaWpXMnRKV040alFT?=
 =?gb2312?B?bDhaUU5nT1BnRTN4WlA3L08vNklXeWFSa1kzcFczVmgwWEpNcEZRWHJubzkw?=
 =?gb2312?B?MUpMV085TGNVakwyelU2QXJmd0x5c05keFRLaUg3R2dITUZSS3hSZ0hzT0xD?=
 =?gb2312?B?TC92UHJjWnR3aXpvbjZDVVByRFI3YVdjTGJLZUlHWHZJcWVhNHhKQjdsRGZm?=
 =?gb2312?B?N1h3djZYSDVvOXEzTnNLMHBaSXZzUW5kWVdnWDgyUjBQV0hEZUJzcy80cldN?=
 =?gb2312?B?dG9GL1ZEN2ovZkxrVG5JQ0hpQVdYRWpjd2t4UUNZOEgySGVZWGYzM1hxTVRU?=
 =?gb2312?B?VmY0N3piT1lrdTkxRVgzNjBvdHR2WTZxclRaREpGWlVXQndBOFZ0UjJJU2xW?=
 =?gb2312?B?YTUvSkxCZUc3UEp6NTFjZU5CSnBrQ3gwRytIQ0d1aEl5Z1RtQ2J4akxod25h?=
 =?gb2312?B?cmwrZEpmdllQV0VoTkZBVWwyOXJTZlZDek9aenlLcEZqTW13dnkwbTFoMWox?=
 =?gb2312?B?ZnJuZ1RnK3NEYzU5MU1hV1pqRkh5cUt5clhtQTQ3eDhpaVBLcmJOY2FROHNP?=
 =?gb2312?B?T1lvakU0T0VvRjNJRnFHL0grMW1tUHk0Tjd0R2JjQjBldTlYRnZCZ0x0OWp2?=
 =?gb2312?B?ODk0M1BvSUxPd3F5Z2VCQmlJblNlTWJFSXhaVVZQOEUzcldKTzFEZTFjejFi?=
 =?gb2312?B?dmV5U0dpcHBXMTZvNlhrMkxCZWloYXI0QkhlTVkyZWlhUTBoTCtZZFAvQmJk?=
 =?gb2312?B?bzNqYnQxek4zMnowZW5qd1VQMllwdmFIdmFQODY0b2VHNUhMRUhTeTZFZDN0?=
 =?gb2312?B?ZUdra09sQnBCWWErNVFhZDZ1WGRPQVlmZ2Q1MlB3enpGeExSS3kwVWFwNVVZ?=
 =?gb2312?B?dWFrTFhsQkc3VXF4NndFWHpUL25uWHE4QXRsYitRVEk3OUhOZTVPQUxqMmxR?=
 =?gb2312?B?WnpZbHVLVlhNM0E2ZjlMRE1wTkcydWZIZjFsNG0xcTNuV1ppcFdoa2JKNlIr?=
 =?gb2312?B?aXdFWW1nR0g4NXZuVU9xdmxMcXZMbVFyZUk0bTNtT3RUbGdWdWNJb3g0UjFS?=
 =?gb2312?B?VkluazhpZUZIdUh2emk2bG1xSmNoZXlYUnVGVjhhRkZCREVtZXZtK0M5YW96?=
 =?gb2312?B?cXFIRFRHMjcyUjJNY3A3ZnN5VnJiak40am5qTW5RNVlTSDk1ZjFiMWhYUHJT?=
 =?gb2312?B?b2lORmZkQU0vL1lMUit2ek56YkNKVG5lQVRKc0RFSzhmSDRZbFF2a0tMSlhX?=
 =?gb2312?B?cGFKOFcrQ2V0WVMwQnhlL241Umg2eUR0cE1zR2xoVERQUDlnMngyMjZudDFK?=
 =?gb2312?B?UGg2Ynk5QVloTGJpd25qS2RkejFRSkRnNDc4akNLcGxCMHFGVzNzSW03UGVz?=
 =?gb2312?Q?NkAUYvQf7LCok88m2989Rmlht?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dfba1c-73c3-4e27-ee6a-08db8dae3431
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 07:59:14.2050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVx6lGqzcnskY8d1qZsCHlFhbjpts1e5tW4+yeJVSvzI112EoDRLwhIW1BmVkZSSfSWLglzGIpzbEbRA97goGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjPE
6jfUwjI2yNUgNzo0MQ0KPiBIaSBDYXJsb3MsDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LWxwaTJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlt
eC1scGkyYy5jDQo+ID4gQEAgLTIwOSw2ICsyMDksOSBAQCBzdGF0aWMgaW50IGxwaTJjX2lteF9j
b25maWcoc3RydWN0IGxwaTJjX2lteF9zdHJ1Y3QNCj4gKmxwaTJjX2lteCkNCj4gPiAgCWxwaTJj
X2lteF9zZXRfbW9kZShscGkyY19pbXgpOw0KPiA+DQo+ID4gIAljbGtfcmF0ZSA9IGNsa19nZXRf
cmF0ZShscGkyY19pbXgtPmNsa3NbMF0uY2xrKTsNCj4gPiArCWlmICghY2xrX3JhdGUpDQo+ID4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiANCj4gdGhpcyBpcyBhIHZlcnkgdW5saWtlbHkg
dG8gaGFwcGVuIGFuZCBnZW5lcmFsbHkgbm90IHJlYWxseSBhcHByZWNpYXRlZC4NCj4gDQo+IElm
IHlvdSBnb3Qgc28gZmFyIGl0J3MgYmFzaWNhbGx5IGltcG9zc2libGUgdGhhdCBjbGtfcmF0ZSBp
cyAnMCcuDQo+IFV3ZSBhc2tlZCB5b3UgaW4gdjIgaWYgeW91IGFjdHVhbGx5IGhhZCBzdWNoIGNh
c2UuDQo+IA0KPiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiwgdGhvdWcuLi4gSSB3b3Vs
ZCBkcm9wIHRoaXMgcGF0Y2ggdW5sZXNzIERvbmcgaXMNCj4gT0sgd2l0aCBpdCBhbmQgSSBjYW4g
YWNjZXB0IGl0IHdpdGggaGlzIGFjay4NCg0KT24gTVg4WCBwbGF0Zm9ybXMsIHRoZSBkZWZhdWx0
IGNsb2NrIHJhdGUgaXMgMCBpZiB3aXRob3V0IGV4cGxpY2l0IGNsb2NrIHNldHRpbmcgaW4NCmR0
cyBub2Rlcy4gU28gSSB3b25kZXIgaXQgbWF5IGJlIHdvcnRoIGFkZGluZyBhIGNoZWNrIGhlcmUu
DQpJZiB5b3UncmUgYWxzbyBvaywgZmVlbCBmcmVlIHRvIGFkZCBteSB0YWcuDQpBY2tlZC1ieTog
RG9uZyBBaXNoZW5nIDxBaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KQlRXLCBwbGVhc2Ugc2VlIGFu
b3RoZXIgcmVwbHkgZnJvbSBDYXJsb3Mgd2l0aCB0aGUgdGVzdCBsb2cuDQoNClJlZ2FyZHMNCkFp
c2hlbmcNCg0KPiANCj4gQW5kaQ0KPiANCj4gPiAgCWlmIChscGkyY19pbXgtPm1vZGUgPT0gSFMg
fHwgbHBpMmNfaW14LT5tb2RlID09IFVMVFJBX0ZBU1QpDQo+ID4gIAkJZmlsdCA9IDA7DQo+ID4g
IAllbHNlDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K
