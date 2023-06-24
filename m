Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA7673CC4C
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jun 2023 19:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbjFXR5h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jun 2023 13:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjFXR5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Jun 2023 13:57:36 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FD71BE7;
        Sat, 24 Jun 2023 10:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXeESJaY2VjC5LpJa2OC59eQWVt4sfyySDpTQ+qly4G9m2I9butuSxeW6iZaK/3Ww3HM/olfb/dwvmeYjsR8b0b38594IRktzlcd6enpEOqhaHln3qexVJwuKOyL6n4HtvG5vhou1nGNk2xSFsomRdW0yHvm6LdSgiP19y2FyX9p4xisn8bdxD5c0mQeaaxKT9h7a2iqdogvGs6laww4KT7oPPK+/oqwTP48qgcwzB41FnapvLVhCkil5iOdaulMekQXNpZHO9kZkZzO/5mQL7bXDWgJyy3AQwsOLYgb+siSz4REIM5o3Fk3XhmETIHJt+l7mb5rL9OUs5loK5Ub6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE6pdX/Qj3NUgPOcEN/3Zw3NprSQzXUYxc/P39eEbww=;
 b=LSNLTjGAbw2UTGdYEohXhg4tjq2CR58JZSynqT5JgcJfu6y6ot0cy/kAb300hxnfyVbzYooGcUH+1Q8qNrwjL1kQChxLgpInE9dVsGaYyBCcq5DCQ9/U+hJyHuuJuzfzQId6UFG/2a7ct1osb9hyEbNDw+w+kt4Pp5p5lEFTRhlUp5hZCXqz1VoLbyWuqp/+Lu7nrVTudEfq6NNjalBVMUg7X8ouWZZ61xnahNnV8cfOM5KvRsNFs6gxqVEu5QvYuwU1Zv7MxnsHzz6C22PhhvHlzoUhphVBX0lmaGiF1p2bk0661fCZuqHTeSddN88/8WKVEA4Tl/PMgeQAtV0eRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=connect.ust.hk; dmarc=pass action=none
 header.from=connect.ust.hk; dkim=pass header.d=connect.ust.hk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connect.ust.hk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE6pdX/Qj3NUgPOcEN/3Zw3NprSQzXUYxc/P39eEbww=;
 b=2t+iVZDXJxCnCm6yCkB+MnUIeL9pi+cgHNlDAJFaZ1J8zMM2dZ3n5S8OwdyLKIjuoEmaI0AgyXFX55NmZ0NvXxjWmjpxuXxdEsrXH+wP25qE3cThJnTBbLBy5RR4mf3BYehGJSh4MrVizRL5aPvRQGmRg4Weg6SSRhFboJVniM8=
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:b7::8) by
 TYWP286MB3079.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2a2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Sat, 24 Jun 2023 17:57:31 +0000
Received: from TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8]) by TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b429:5aa3:12f1:6b8%4]) with mapi id 15.20.6521.026; Sat, 24 Jun 2023
 17:57:31 +0000
From:   YE Chengfeng <cyeaa@connect.ust.hk>
To:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: img-scb: Fix img_i2c_isr deadlock issue
Thread-Topic: [PATCH] i2c: img-scb: Fix img_i2c_isr deadlock issue
Thread-Index: AQHZpsQP/YQh8VnFn0SL502Cj6ksVw==
Date:   Sat, 24 Jun 2023 17:57:31 +0000
Message-ID: <TYCP286MB11889AFE709804F40DBC62AC8A20A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=connect.ust.hk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCP286MB1188:EE_|TYWP286MB3079:EE_
x-ms-office365-filtering-correlation-id: bc231109-7130-40b0-0fa8-08db74dc7b86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YM4yE3Jhr9qU1xBSlD7PQFyAL9WTLrvUmO+MRQaekjjDOUzQeRXgIMC9uQeYs6U9wiSTftf9UsNZCL/rGoHC/YhF7bwIsqAORu5ZKZFMzxmBBgfxnRef9CfnLHXaTP/Orhxyux7OJSJJp0iIc7Dx/sIXm+DHu3ZT6UUEJi0N/xOKCZEJt1e5qwCicZljw4KDEphYwz0CNgv6zDKxSDoYvYQAKpO2fOuBU+KcgStq73JZPbAXZyHOpiKzwyv8c/i3z3fBWlO4rHHTPIPE+VneWhtjWBMXY/Ix59OglPYQoyQHM3gUZtffgX0shiz/twcF1nE0PhMHtXgoIdBu4C5aQTmajdkxhpi6AnlfVg1cA4uhUhnYSi9+lgy9ROLaxMCzYzZqfY0YzeCAC+kkSYV4zea8Ktc3WEIajGUQ7PxOv4rN7Od5ubW+3BAWI4qmMr/lEPsGG3ybBESf+iEMpdOcwJ69IAFBxkB7We1h4wDwMnHsTErs3e8eZiAGLSQEUw1s97CD5/V6BVOR2kFPkqrR4m868PPrbORQwXY552UwuwpxyVhowD+VhUd2QxYYccwn0jyE03V1Z2AKyEvRdwSSeGpz9YgJ+TsM0U2M1UO4i1XJE1FQHwqTRBNQZJcNo2Kmh/Gr5jrjP6Z03A1vb7IucA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(71200400001)(478600001)(7696005)(54906003)(91956017)(76116006)(4326008)(38070700005)(83380400001)(33656002)(86362001)(2906002)(55016003)(66556008)(6916009)(26005)(186003)(9686003)(66946007)(6506007)(8936002)(122000001)(8676002)(52536014)(38100700002)(66476007)(316002)(41300700001)(64756008)(66446008)(786003)(5660300002)(70780200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Y0ZzZFRvTkxQRTdzaGFlWU15Q0NoVjgzRE5RS0F3TUczUVBnMlI1SkFZR0Vp?=
 =?gb2312?B?dCtNQXJ1NEdXOFpwSXlUUHF3RVQvSE1ZNGkxUS9GS2dKeUk2MjhRTjdhWTRB?=
 =?gb2312?B?T3RSRlBUeFRkcWZXb21hUU9LNldQeDF0YnJZNC9nNDBQWkFXTW11VHNiOEoz?=
 =?gb2312?B?aXVsNXhQT2VBZzM0SGl0YTllMVZyNWpwRHduaFpkKzZZeVNBV2RsTEZGTnoy?=
 =?gb2312?B?THFrNUNtM2QzV3o1bjZmcU93SzlSNjNHMHk4UU5EdDBoRHd1VXg5SFluRTlk?=
 =?gb2312?B?L3FFaXhOZHo4dE1YQTBYQys5Y05MTXdaMG9ITGNqM1k3NWZzd0pRbVk4bWh1?=
 =?gb2312?B?eGlMRXllek85ekkySHNjZUtnMFU5b1YxNS9kZmRSdWJRS2FZVjhJaWNha0Z4?=
 =?gb2312?B?Q2lORnEvWGwxTlNsMG55dDQ3RHh3MTNpN0JlRFV6alNPT0t2blREajcyaitM?=
 =?gb2312?B?K1FDWURHZWgvN2NVWFBGczRsVEh5K1d2VnF5bWh2Y2xjSE5nSjdydXdkSTBD?=
 =?gb2312?B?NlhhZzJRRmZ2UEdtYlc1NWNoN1A0ZmlaRjhwQ1JFbUgwM1BhREdNbW5uSjg5?=
 =?gb2312?B?K1V2bzFrYlgyb3NCbGhWalBtWjR5KzI2VmFqd21kYjgzZjBobFFGWFk3SUtS?=
 =?gb2312?B?ejNpeURVbTBEMndpM3U4UElrcWtmeG9sU2FYd04wdDdGWllSNHNzVmVuSWpz?=
 =?gb2312?B?Ui9aRXBsRHlIRnJqL3JBTUZKQldNdVZMK3BRZTJUWERqOEgvZjdaYmFvV2Ur?=
 =?gb2312?B?bXhLcW5qNGNRMTRGMXhOa1ViekRhWUxwdXdCd1JRdkFzTlRzblgxbnBoaHNx?=
 =?gb2312?B?UE1QRHMrNDNuYWhMUTN2TjV0SzlqWnpUbmMrdmM0M3B1SjQ5YjQ5VkFUTFF2?=
 =?gb2312?B?SGM1clV2enZWaEtFRW5obWw4aEhOYURuNlBXU1dLYXBDT1ZxN3F2cXlVbTRl?=
 =?gb2312?B?eGhXWnh6QUFMUzJISERBbE1OUkRPMXJVU05LSmluZExDTGdOVmlqZE96Um5p?=
 =?gb2312?B?MWkxd1JiRHpuRnZyUytyVjFSVTU4dCtuMGpMcFg4cTBUYmVZekZwbEpkc21a?=
 =?gb2312?B?WEZZOUc0OXVDWU9nZnMvZHdaVUlmeWRwa2duakRta3pLVENMQVJQM1l4QTlL?=
 =?gb2312?B?SnNWRC9wenlqOThoK29ydlk0T2hYY0grcko5amxkNHhuYWJ3ckpjcmFHQjhj?=
 =?gb2312?B?N0VuTi9vQUdsWHRnSFphamlhamJqVlpyb2tHcnhES3BFNGFtUnBFanFiQUll?=
 =?gb2312?B?MUhZWjNXTWl0eVMrcFZHSzBOZWNGMUE2SkFYSUQ3a0FRYVk5S2M2bS9HbkUw?=
 =?gb2312?B?aGQvb2RKajVUMGJpOW44b3VwU3cxdEY1MS9BQncydmZBNmFMeURVTnNuZlZZ?=
 =?gb2312?B?dXU5ZEhTSTNjVzZ0M2p1SnF3UGtmalBFdy8zQytPRXNUT29zaWk0OHR4ZlpJ?=
 =?gb2312?B?V1VNM29uS3lYcTlFWUNnS1ZzWFRUdmhZL3lhWUNzV1JFa0pwc09NeitLNVNm?=
 =?gb2312?B?Q2FyUkh5aGJkc3dFL09TcFBsak1QTHI1ZDFQN1VyMzFBU0Vyck1zaEtwL0d1?=
 =?gb2312?B?cnJHTmdHTm10Vnl4VzNsRC9LVE9zc0hUdXcwSU5zOTV6Qk5NeGFlcWE4U0Rh?=
 =?gb2312?B?SzEzZU4rNkpRc2VOWEJWV2VralJtOTJzTnR1NzNiTHc1QWNzQnhJTHpURWZr?=
 =?gb2312?B?TzFHYnRURDlPOVM1UDY0UUcvbXF1dDZyaFlXaUNNR2hxQ0J1MHN5bTV0M21O?=
 =?gb2312?B?UHB3SWN2TStzYXlMUEVEK09LbzdNU2VBUlYwek9lWlpxNGVQU212VTNYQnNJ?=
 =?gb2312?B?MUw3dlNZYitIclZqMExPZ0tmc08vZk44Ui9GSUtCRit0SjZzRVI0UGkwQnVi?=
 =?gb2312?B?TkdRM1FJQkJwc3RSSHNmRHZXdWF6Yy81RSt3aVA2M2dtU1JOR3lHMyt6R0xO?=
 =?gb2312?B?bWRVbHBZV3BUbmhUV0l1UVJiZTZ1S0FOSFkxY3U5VGlTckY0TGdnS2xJNnd2?=
 =?gb2312?B?aGVhNWMveWtPc1hVTjBGQjdWdmRjYWQwUDgyeXVFQ1NGWDJpR0xrYU4xQXF4?=
 =?gb2312?B?TnRTcWxvQml6Tjd1L3NvQ2JuNWdtNGtROU9adDBMN1AzVERjNEFOTkZ0U1FM?=
 =?gb2312?Q?IHiU=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: connect.ust.hk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc231109-7130-40b0-0fa8-08db74dc7b86
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2023 17:57:31.7044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6c1d4152-39d0-44ca-88d9-b8d6ddca0708
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52fz5XPzPLlGnKNdNrigz4hA4yNati02oUaICuspDkbyaMBO+Veg/oHxoTQH9QSQvPPE8VvPqe3CybLzQvH7Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3079
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhlIHNvZnRpcnEgaW1nX2kyY19pc3IgYW5kIHRpbWVyIGltZ19pMmNfY2hlY2tfdGltZXIgY291
bGQgZGVhZGxvY2sKb24gdGhlICZpMmMtPmxvY2sgd2hlbiBpbWdfaTJjX2lzciBpcyBwcmVlbXB0
ZWQgYnkgdGhlIHRpbWVyIHdoaWxlCmhvbGRpbmcgdGhlIGxvY2sgJmkyYy0+bG9jayB3aXRoIHNw
aW5fbG9jay4KCkRlYWRsb2NrIHNjZW5hcmlvOgppbWdfaTJjX2lzcgogICAgLT4gc3Bpbl9sb2Nr
KCZpMmMtPmxvY2spOwogICAgICAgIDx0aW1lciBpbnRlcnJ1cHQ+CiAgICAgICAgLT4gaW1nX2ky
Y19jaGVja190aW1lcgogICAgICAgIC0+IHNwaW5fbG9ja19pcnFzYXZlKCZpMmMtPmxvY2ssIGZs
YWdzKTsKClRvIHByZXZlbnQgdGhpcyBkZWFkbG9jayBzY2VuYXJpbywgdXNlIHNwaW5fbG9ja19i
aCB0byBkaXNhYmxlIHRoZQpib3R0b20gaGFsZiBpbnRlcnJ1cHQuCgpTaWduZWQtb2ZmLWJ5OiBD
aGVuZ2ZlbmcgWWUgPGN5ZWFhQGNvbm5lY3QudXN0LmhrPgotLS0KIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtaW1nLXNjYi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW1n
LXNjYi5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbWctc2NiLmMKaW5kZXggMzljNDc5Zjk2
ZWI1Li5hMmI5NTdjMzg5OGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW1n
LXNjYi5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW1nLXNjYi5jCkBAIC05MzUsNyAr
OTM1LDcgQEAgc3RhdGljIGlycXJldHVybl90IGltZ19pMmNfaXNyKGludCBpcnEsIHZvaWQgKmRl
dl9pZCkKICAgICAgICAgICAgICAgIGltZ19pMmNfd3JfcmRfZmVuY2UoaTJjKTsKICAgICAgICB9
CgotICAgICAgIHNwaW5fbG9jaygmaTJjLT5sb2NrKTsKKyAgICAgICBzcGluX2xvY2tfYmgoJmky
Yy0+bG9jayk7CgogICAgICAgIC8qIEtlZXAgdHJhY2sgb2YgbGluZSBzdGF0dXMgYml0cyByZWNl
aXZlZCAqLwogICAgICAgIGkyYy0+bGluZV9zdGF0dXMgJj0gfkxJTkVTVEFUX0lOUFVUX0RBVEE7
CkBAIC05OTgsNyArOTk4LDcgQEAgc3RhdGljIGlycXJldHVybl90IGltZ19pMmNfaXNyKGludCBp
cnEsIHZvaWQgKmRldl9pZCkKICAgICAgICAvKiBFbmFibGUgaW50ZXJydXB0cyAoaW50X2VuYWJs
ZSBtYXkgYmUgYWx0ZXJlZCBieSBjaGFuZ2luZyBtb2RlKSAqLwogICAgICAgIGltZ19pMmNfd3Jp
dGVsKGkyYywgU0NCX0lOVF9NQVNLX1JFRywgaTJjLT5pbnRfZW5hYmxlKTsKCi0gICAgICAgc3Bp
bl91bmxvY2soJmkyYy0+bG9jayk7CisgICAgICAgc3Bpbl91bmxvY2tfYmgoJmkyYy0+bG9jayk7
CgogICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKIH0KLS0gCjIuMTcuMQo=
