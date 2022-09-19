Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B185BD78D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 00:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiISWk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 18:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiISWkz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 18:40:55 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24084D4ED;
        Mon, 19 Sep 2022 15:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7iBaCMPYQZyvBxt2nRkME7N9qfIWWBovKMpSWBtBp5hx8B/AIkeOr2/8c086TsKruO69mV0bQUkyaDXAH6GtBEpTiG8b5rzFWtq/s8ckpBldHZa67fJx4RnZc+kWW98KkwBwQAGcaWznfC/poV7ECkcNhFPWPlEBtavXjfyToP/Vm8kbVu+VWGSKqne3w38ZhvoJjVXiw4S2furasjqE4tlovtX47pxMRuFWBHmMuD4tImprrnSXoPbo0jq9pNNv5y0nPaydqsGAmxHilcs6RBDUbWNgjw7g8nHcDT3b9g9zx30dAwakdOMIos6ez3ABpxUImT5LSFR5hyrPBJ1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tXAwx8Tf8/6uWiWklBmMe19w/AsNyh7uDDf6Q8Sb6A=;
 b=DnI10YBWUNmkuYtKwml07w6uGMQXvfdCccGpAZiYMHpV/oeG8CK/1/wnMiCkTnrAAVq71k7o7BKe/uEOQnNvuFdTaTF3UmXtjh2qkTjxHRn+zEGmc+WsLPPCX4HElWIjWZ2iVn/sDjt34SH60VIopNcv+K9XPDS/k+2/shUuC+wYWJnQIRfZSe7PpWTDnsEWx2W1S8p110N+yJXq1muEwF6d32UCtUpNUbuNNrhRpFLpS48SnS3XTyqGWytHK8W3phtEXYdNIxnGXCE5Gfk2MPdpcGj2VSzg/8XioGh3L9vuEONZfcyfpECrvgohXRDN4Hp7Wb0ROm9dwTzNlVX4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tXAwx8Tf8/6uWiWklBmMe19w/AsNyh7uDDf6Q8Sb6A=;
 b=RisdwihJT5qp/bU/h46fHhE38AQ+Bk98/MDpZINyQNqkH4hYpeU85IFrIh4hMU6lZezLIvl9Y2ip2l5/2FFWjFaLjIuecqyFxAWAbip1klL6OqoD3HM+LA1Mz8iQBqm3JZhaahHNS+gX7fo0atvWAlSvYAMQyHMpa1Sqp+jqDH0=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 22:40:51 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7d0b:b02:69b9:a3b4]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7d0b:b02:69b9:a3b4%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 22:40:51 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Sean Anderson <sean.anderson@seco.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Vinod Koul <vkoul@kernel.org>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
CC:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Joy Zou <joy.zou@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: RE: [BUG] ls1046a: eDMA does not transfer data from I2C
Thread-Topic: [BUG] ls1046a: eDMA does not transfer data from I2C
Thread-Index: AQHYzHaN1LN2T6ZYUU6MBMqKWnOJd63nV0RQ
Date:   Mon, 19 Sep 2022 22:40:51 +0000
Message-ID: <AM0PR04MB62895815596165791DD59DD38F4D9@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
In-Reply-To: <38974aab-06d0-f5ff-d359-5eedd2f3bb3e@seco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|AM8PR04MB7249:EE_
x-ms-office365-filtering-correlation-id: 320d0bf3-d052-44f0-57ea-08da9a90018a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9jx9c4xLmtDAc2ZxADT3bBzqGQmMQlzbcqNdBZ/vCUwrmVNobi5BpVwECs8VmNym1mEKCEF4xdfXEPtCmAg3bBvQtjVt7rQr5kmbTtYYIU66hNLlvSudU4ZNIIk8Q4KRQTmkLZVXbh5Gs9qrDzyBIwROxW/EyLkcdmJhA8HagbBmuHM06woDh31Uz+0wtuboqKLEtETQoZe1CHgZsy52IsRN2EgFRz6Gd2Ne0kEXD+BckMNLElzjABwKUAjm/lSXIL3lBxW5+K5WrLz26VjV+zZVsKGS9HzLftP1Hwg7VqUZIgxdfIq8kcOOld09LDyLp9GgvDYzJOJbdNhV9dvJyL1cBrYWbZCBYRmAKY2j65C8YUkQKRoRBpv5sWUxdLqP6CQ6naHTeJZsf56OMSWPtyqj3IY6D9g3nw5fxlm8Wpd2yt+1begiXJHPMlD3Nl9wIATnhuRvqfBmajYew3390FLB5mB0hklJbYPxvM8XuF9aL+ifGmbwObOR6covP7k1m4886PdpRs5VBE1qp1XuuNcgFzmxkr4btAEn+YM/kL14SJlaCvdctTgT4YsGPUXN7C+33uU8j6a3NS7lhp+nmPaCe270JODVoZ1FoI2gIErdNmapqCtSxDmYGROQq9Okn667yRpEgZNkTo3QB97gKxr2z5qrGqvP3xOz45QQ2JN5b8iC/2fXhCUPjECv4kEqQzgNdOAREcO80bORKLCNA9EvJrziNNvN4a0buQqQgkvRj3bn+3maNORHMd8oiaBkQzjUw2HLLSKjRwK4qcReCA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199015)(8676002)(38100700002)(9686003)(26005)(55236004)(7696005)(6506007)(53546011)(478600001)(122000001)(71200400001)(110136005)(66556008)(38070700005)(316002)(54906003)(7416002)(83380400001)(5660300002)(186003)(66574015)(2906002)(4744005)(8936002)(76116006)(41300700001)(66476007)(66946007)(4326008)(64756008)(66446008)(52536014)(55016003)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHhHUzMvN2tXSzQ4VVN0c0svb3Z1OUlLWVFmalZPdFl1dlh0TFgvRitpb3BN?=
 =?utf-8?B?Z0R6eVlndFpSdGlQWjlPWGd0SEZKVllPM1NWQmllQXUyNFBQcGgxYnBTaXdN?=
 =?utf-8?B?cUxxcnRpV1FXbHYvdGFJOUpPSXQ1RzBjcXVPdVhZNnhBNlpBdElnL3ZPY3ZV?=
 =?utf-8?B?aFBwc080UUp2SmxuR2ZPbDdWUi9mVGl1UGdhVlN2V0pqb0hCNFZJUTZoSXl3?=
 =?utf-8?B?RG5hWjVDNGd3UDBWQW83NDJ3RGp6NndxZC9uTmpqOTJZQmZrbnp1RlpJZDFE?=
 =?utf-8?B?L3FRbXJmN0VjY1FyOXVvM05peFNRNHlDNkgzbm0zYk9aUm5ONDlzZXFPQ2NE?=
 =?utf-8?B?R3hsekRvTytXcmxhdWhsOGNCRzYxUjFsblJsdzlsdmJKaVFjeEVEWDZ4RkpU?=
 =?utf-8?B?eHNRWVVqVU9lTHEwaWgyVTJpckd0QXFmOGdOLzdNSzNVWnI0RWRTY21zUlZp?=
 =?utf-8?B?SkNiS2JMSHQ4WG1sQ01PTHFpUS9lQVhBVTZCNzYvZzR6ek1aK3c3Q3JKeE5X?=
 =?utf-8?B?UjhaQVNOWHpZTkVJTkdOWUJKaE15NUwzZVFON2EwWjd1Y0VIcmk4YWJnaGZs?=
 =?utf-8?B?czJqbnc3bk92eWx3M3ZhWDJvRmcwOGkwRnYvQ1lwK0I4Qk0zQmhlT0RGUVdF?=
 =?utf-8?B?Q3FLUHQzRG5OUEJQV3huQTRUbTFaOHYrdGFheVM4aFdIK3kra2txRDh6bEJn?=
 =?utf-8?B?Z2VlTUZvQnhoZSs3TElNalZrK3FrWU13dndsQ05XSTIzcDlQQXg1UVFzeVp1?=
 =?utf-8?B?Yk5MelZvSXdMZEswUzZIMkhlTXB0dEFpUFp1Si9Jd3RJTXFyeTNSK0I3aWQr?=
 =?utf-8?B?KzdaV3dNMVpZZitlellucEJEMVhNQVFoK1diYWVqSUhHcEJiRkFUbElyblZw?=
 =?utf-8?B?ajBqL09XSmFkL0hUOStUTmpUZ2ZlNk1KdGh3TVJuMlJsUVhTMUJXd1d6TUVB?=
 =?utf-8?B?ZitaRkRJalVQWWN6RFZsUEtXdFdsQjRPVnpUVFdBUUs1WENYY1JjbnRteTRz?=
 =?utf-8?B?SXVDYjdUa0hYd3BUMFp5M3RxQUNpY3ZpWDJyeElNUVIrMFhvTDBTT1h0Ukdm?=
 =?utf-8?B?eGZHTFY5bEM4NHJIeGQ3ZzJvWkpXOWwwMVhaS0hrcTFYLy9POFU5cU9XaVNS?=
 =?utf-8?B?cVNMRXREL1pPc1F5R0EwSjMvdTJOUytzOG5NZGcvVnl4aDF5WWpENS9IQ2pG?=
 =?utf-8?B?di9vSlh1eldVNUw1SytTL3FXTDQ2OTRaTEJ3NFp3bXk4cTNBcFNMQWNnejdl?=
 =?utf-8?B?aEJ2ZWhsb0tLbk0rMjhxeFFlN25UT3lSWWw4R0NWSkxXQXhHcG1jSmZ0dTRQ?=
 =?utf-8?B?SnVLM00vZys3U2lwRFhZdGV6cENxckM4QlNpTTJDNGJ2NkZ3aGw1Q1RSM3dX?=
 =?utf-8?B?K1N0V1B1bHpWOTQ1cmc4dFliNXgzR0lxVndWdkEvZmRDMTd0d1c0MEg1bUNB?=
 =?utf-8?B?NVkvVFhLT0h5SmRqR1FxN3czR0dFR0lJMXZ1Mm1SMU9QZytjeVF0K0dMeEtM?=
 =?utf-8?B?WXMvN1ArK1YyVWUyWlpqTmVmenB5QUQ1RVlVUng1eDBnTlV0Z2FGck43dWxI?=
 =?utf-8?B?MThMWGxuWEF2Rlo1bjY5bVFLL2ZUTkVsYTBJK1F2YStWeUM5dTNmYitmRjR4?=
 =?utf-8?B?cVpmZnQ1Z2JvL081Q0dmQmc0K08yWkVFUEkrSmhlUTZ5MlZIWXIxTHAyeW9k?=
 =?utf-8?B?amh2UW1lOEozU0thckM0WndOYVBvQ2pmT1RSNG1lV0ZoYmtYcDZwSzB2VXRn?=
 =?utf-8?B?Nm1IS3pkaVBWVncwT1g2dUFYSVlvdm14aWZNU3BKV1FYeGpyT01kTG5vWEJn?=
 =?utf-8?B?VWVoZW5kdVNxRitGbndUdGc1b0FBdDVmVUdwZTExRFlkajBwMWs2dS9VTU81?=
 =?utf-8?B?eGlkVWFCUzNwUlArZ3JJc01VVzg2OXNvNG16N0RPWU5sRDJId2hpNjJaMnc4?=
 =?utf-8?B?cnBhV0Q2b0FPa0ZiZXBMTlpqRTZMZHZ2b0FJVjBnaHBWaXNDYmYzYWJwaVFn?=
 =?utf-8?B?dUlCejBQSFNtdUd2T0F5OGxZVmVTeEgxWTU2T1FHdmoxWk9lazh3MzdxZFdw?=
 =?utf-8?B?VGRLQVpGZkEzbFVZRVFjd0VsUHhwTnZ4Mk1uQTZQbDk2RUxxVWRHQXdLYjFt?=
 =?utf-8?Q?zmbrn/tGVxtTf7Z27drqIXdNs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320d0bf3-d052-44f0-57ea-08da9a90018a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 22:40:51.7845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKkGBUXzLeKuWWckqVvol4Me2wyB02139ahbVR80lbFFGuVU5tW80so+codWnoDJCkYIEQdYjRqJCJtMGNjtGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VhbiBBbmRlcnNvbiA8
c2Vhbi5hbmRlcnNvbkBzZWNvLmNvbT4NCj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMTksIDIw
MjIgNToyNCBQTQ0KPiBUbzogT2xla3NpaiBSZW1wZWwgPGxpbnV4QHJlbXBlbC1wcml2YXQuZGU+
OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgbGlu
dXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbA0KPiA8bGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz47
DQo+IGRtYWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQu
c2Vtd2FsQGxpbmFyby5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC0NCj4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZz47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPiBkZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZzsg
Sm95IFpvdQ0KPiA8am95LnpvdUBueHAuY29tPjsgUGVuZyBNYSA8cGVuZy5tYUBueHAuY29tPjsg
Um9iaW4gR29uZw0KPiA8eWliaW4uZ29uZ0BueHAuY29tPjsgU2hhd24gR3VvIDxzaGF3bmd1b0Br
ZXJuZWwub3JnPjsgTGVvIExpDQo+IDxsZW95YW5nLmxpQG54cC5jb20+DQo+IFN1YmplY3Q6IFtC
VUddIGxzMTA0NmE6IGVETUEgZG9lcyBub3QgdHJhbnNmZXIgZGF0YSBmcm9tIEkyQw0KPiANCj4g
SGkgYWxsLA0KPiANCj4gSSBkaXNjb3ZlcmVkIGEgYnVnIGluIGVpdGhlciBpbXhfaTJjIG9yIGZz
bC1lZG1hIG9uIHRoZSBMUzEwNDZBIHdoZXJlIG5vDQo+IGRhdGEgaXMgcmVhZCBpbiBpMmNfaW14
X2RtYV9yZWFkIGV4Y2VwdCBmb3IgdGhlIGxhc3QgdHdvIGJ5dGVzICh3aGljaCBhcmUNCj4gbm90
IHJlYWQgdXNpbmcgRE1BKS4gVGhpcyBpcyBwZXJoYXBzIGJlc3QgaWxsdXN0cmF0ZWQgd2l0aCB0
aGUgZm9sbG93aW5nDQo+IGV4YW1wbGU6DQoNCldoYXQgaXMgdGhlIGtlcm5lbCB0cmVlL3RhZyB0
aGF0IHlvdSBhcmUgdGVzdGluZyB3aXRoPw0KDQpSZWdhcmRzLA0KTGVvDQo=
