Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95EE6FC0C5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbjEIHwv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 03:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjEIHwt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:52:49 -0400
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2044.outbound.protection.outlook.com [40.107.11.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942511BF9
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 00:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gi2Zwxgj9/gcfiKpjZBU5IfvEvB+98TNFESJkE3yB4Klwkj3sUr65w6tL4+SfsNlzj9r4Up9hj7uwFETpMzgr6Suxs5JebWiOsGJsnZDifzQh0u6FZ2QZvK2dn3h22mskA/sJEoEIHyWoGOgtln9LmHMEPlHEwmYpTrytTMT3NVJP2kaZFPm0T/+VZVa/mHCCSi5BsrMf+RQBzbXU75m/NBnGnRSVgN/s7eZudyqRC3EjvfcUn8a4uGFQztrWYMQAPgnHRdLgbHIuSBcNLQIxltWxuvkXh6IU79D0YScBP1N99DYE40eS1FV+sbZqRWwyLOkD6zxQDdxWhgZvyYcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKJh8wP9uFiQ/4+8FsTBRREOy+S4CiH5EgfMN24AoWA=;
 b=amKheE/DyalcudJqkMH1nB7SqywhZ4on50ofx4F7eqPA/mqz9yWn2gsk7p5BO8fMJFKATqh/kdevNWfw6rfeYYRs+02gGKcVDXnnL8zkekf2BA2rLu2QebThpKD1Vm7T7OqhH+etgAQDCNtsd/MDX4P+2KduAbRx82JmGt8wYZ8P3s1J+KJr8DgDhMT6E0IvBrvQ6H+dxL+QSEIQHVEAO6hwCEdPp7RIh3sHEO3dO+4Q/LxSAUXfUIoziBjmkk2tQLyCdZcwNliXLh5Cbv0bQ22T/fPznvBBq4Tf5t0TSXNp/DjhoX4mwlng0wXXDlD/ucv2OvWRz5AZXmw9fJYNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phabrix.com; dmarc=pass action=none header.from=phabrix.com;
 dkim=pass header.d=phabrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phabrix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKJh8wP9uFiQ/4+8FsTBRREOy+S4CiH5EgfMN24AoWA=;
 b=gLQWcoCFRi/EMScfFjs1lDdRYRSzdjpgl6BQXsywTWLPuUKH2jCDrsr76ygiCA3+tCTBomHacI4OdfJ8nMdjJM5I2bvmikYVd8A1l/Ac7VqC7GkIJ4URJhytT2uDlDv5TH08tUrttW8vRH130C4Dcx/9sW9lUg1gVWBTigLP6uc=
Received: from CWXP265MB4508.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:179::5)
 by CWLP265MB6067.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 07:52:44 +0000
Received: from CWXP265MB4508.GBRP265.PROD.OUTLOOK.COM
 ([fe80::5963:85ea:d327:772d]) by CWXP265MB4508.GBRP265.PROD.OUTLOOK.COM
 ([fe80::5963:85ea:d327:772d%5]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 07:52:43 +0000
From:   Chris Pringle <Chris.Pringle@phabrix.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 34/89] i2c: kempld: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 34/89] i2c: kempld: Convert to platform remove callback
 returning void
Thread-Index: AQHZgks8cK/EgvBJwkSbxTFjUZxiHQ==
Date:   Tue, 9 May 2023 07:52:43 +0000
Message-ID: <CWXP265MB45086C06937CB03A391936BEEB769@CWXP265MB4508.GBRP265.PROD.OUTLOOK.COM>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-35-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-35-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phabrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB4508:EE_|CWLP265MB6067:EE_
x-ms-office365-filtering-correlation-id: 9b64baec-2a36-45ec-dd83-08db50625f56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cdsuJ6tMyzbLJmJCMh9ycfEPzOzQsOA+7rz4dfFsATCLCg5W/s/4Zd73O3hgoLM1XOalYPGKGwcx0OOk0OTquiUZV22F+GZ9lxRbHd2mfNHaw93m1I/oABoVDMnpjoGzFIBgEm3scmDRU1iEJipqUP4XRt6vA7xWAMML2DYjunQj06A5gm+LGyYKKi0pwqNkqwylzAfxpO43WMk+8nEKnKhUSNkd1mfL6br1hOlrVh/EdN7hF9yyiU7F/qtfivmvplkTZIPdVCVy4JY+iedYVyqYnAQDR/DuT7qL9EPW8OEInrcMIL11mfLWmPPsb1QQ4rak+Eh2zArSMouq8wiQPlHGRqAdf/AB0LNmcdtENYSBEM7ZdoAnLKGU8wJZkH8cxLOEm8MFWThl9FDKhqxMmVBBJ6uWh93MMABmVYM5MggtXJS+JQ4klfNLkq/4dF2LOcAByw32JU1+tq7wxIKUMYLOecmARCRzMesYxTVxv3ZwvOISm4J3XTQPnAlMeU7+tT1SSZDIJfEupEkuS1KDGGKPwFHf8/CfOl8vdujb/tHMHDXTqw7hmSIBrhthP1U7+umXUa8ORK+fnBlJCQ2avgUr0uLrB135J5g/sJLHSOYb1Wlqea8YXt9V1C3CcL3u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB4508.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(39830400003)(136003)(396003)(376002)(346002)(451199021)(54906003)(86362001)(110136005)(38070700005)(316002)(66476007)(7696005)(66446008)(41300700001)(4326008)(71200400001)(66946007)(76116006)(64756008)(66556008)(8936002)(5660300002)(8676002)(52536014)(478600001)(53546011)(9686003)(33656002)(6506007)(26005)(2906002)(186003)(4744005)(122000001)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2J5NjFWRjVBRm14eXMzZSt0WHlZbUNvSVcyVmJtZVI2UUZmYnhWcG00TVBT?=
 =?utf-8?B?NE5QczNXZ3VQcGxNZWwrZERyNXN0R2xmc25YaTJPdFNzRXJGSHFQUUpzS1Uw?=
 =?utf-8?B?d0NmRW9YTmFUczlaZVhqdWVBS2tkWEUrcXV2NFErZUFXMzFsb3NXeDNzczhj?=
 =?utf-8?B?eVp3eStBL3RsNCtWSnJjU2hPeEF6cGduQnM1Y05pb0FySnBQVFBkSWdTaXlw?=
 =?utf-8?B?bFVuZk1XdVBHczY0MFFST2J4bUtXR28zKzJ6TUJSM2hTNFJpcFJIbU1sRGgy?=
 =?utf-8?B?UjlCWE1WTXNLVCs1bEJtaStHTXNETU43ZVY5c0dYREVTVXprVFhkTUgrUGY1?=
 =?utf-8?B?bHd1SnkzZG15dEdnSHdLTHBWWHhrZW1mWHZiYmFZL0J4aWZUaEFFV0xId0o3?=
 =?utf-8?B?U2ZhOFk4SzZCZXhCYWFvcGx1Sjd6a25LQzlGdjhHaktrU3JkMEROaGt1Zzh0?=
 =?utf-8?B?ejJ4TWQ0VDZrWU9UMjYreWNQaXl3ZEVUeEM2bHhSMitkQnBKMzB5aFZoSlkx?=
 =?utf-8?B?OS92Vkx5MGZyTmRJbDdvMDgrUi9SaDB2ZEh1MzRSZS9PSjZubVlFVDFqM2tU?=
 =?utf-8?B?M05iM2VENzBIOUpLdFltY1hhZE0yaDZwNjJuTDkvclpDREE3eEo4YWh2UFQv?=
 =?utf-8?B?YWJWUnRRczBSRGF3a1pCbFN6Qk5SQ2FNTDVybWhvL09aVVlBR1A3N0kwTVE2?=
 =?utf-8?B?WldLbk8xWWQrSlpHeko5dXl2eFBDcHMwNlNXVWJvYjltbUdaNzZ2MllPODdl?=
 =?utf-8?B?RXdrZHR2aFlNZ1hlalFBeGRQK295a3h3c25hL3BrK3JQWllxakdBcERSUG90?=
 =?utf-8?B?Z3FlU2QydjhYWmZTZ3o1RC9mWGp6eGJobXpLQ1d0eHFBbHZUNlFNZGNwSENX?=
 =?utf-8?B?MVpzSXU1UzVPNmxlVXhXb3BqbUdUeU5VYmxkN0lRTm1oTXV5RUlJY2drV2ZK?=
 =?utf-8?B?dysrVnVpU2cwbWFscUxENCt1VEtpZ1hKT1RUc0piTlFRTmR2WHdpTjNIZWwr?=
 =?utf-8?B?UktWWmg0MkppdWJrbFR5RDNEaTlFMlpaNjFTeFVkTzZodnNoaG4waTRvdHdE?=
 =?utf-8?B?MmxESzhIUEd6WTRTZzZLOHdzSDlDUkV6RmdWZk5DSlhGNmEyY1hBUTM1dGdG?=
 =?utf-8?B?Q2tkUUlHTHdSK3VlWDY4YUtFUGFsUGx1ZTdjMUJDdjhYd08yTVE3dlF2RTlh?=
 =?utf-8?B?QWwvdFE5RFg1L0NlTk9HTDlyci8wSTJ1SVl5Z1JjUkRnL1VPVUJPc2NBc3Ft?=
 =?utf-8?B?Uk1XZFhKZXVnZzdZTEJvSnA3azdlVUVNNkhGVHBZeEt0dnM3SEJHbUdGenhq?=
 =?utf-8?B?RlA2bGo2cGFQK210cHFJMkwzQ3kyUUZrekFxeW9CRmhJQ0RlZS9WZlhvNUVH?=
 =?utf-8?B?UWtCcUVmbWZ5ZkNCbjVyeXd0VmlpeTJaSVNJOWJ2TjVCYzcxbTArdnRsMlVP?=
 =?utf-8?B?TWJhNkhYTHBKVkhGdmNMU2pnQTVORW1EUjdhY3ErSWdyNnVtQTZScTMwK2xF?=
 =?utf-8?B?cTFKdXliYUs5VFJ4ODRRSU9ScVZuS1UrUUpJZnZ3T2JmVGlTdjl4ZGxKRHVu?=
 =?utf-8?B?T0JieEdTWS9nd3hiTWZuTVFwbnZYNVNodEJPdksxVUZGeWFkRC9ETVlsTzRJ?=
 =?utf-8?B?OGlqQ0w3MXpIQXlJZFV0d296VXdzZFFyak9Gc3VSdTV5Yi8rTTRUSm1GOFYr?=
 =?utf-8?B?RzFYRWtaQlU1amI4aVhBQ2w3QlhHcVlSdFV2b2QxUWc3NEpTcDFrYTlvYzc4?=
 =?utf-8?B?MW1GQ28rUXpncHVocGhnbmt3ZXNDZnJuQUx6UFJZZGc4Y3F5aFBYMGxNU0Iv?=
 =?utf-8?B?Q3d4UVRvWS8xWXlKYW9XTFBwcmJuQUU2K1RDTDdQSVVRSzBpUGFBSkFjVDh4?=
 =?utf-8?B?MHdhUXA0V1ZJY2VlUmtEbWhUMDRIVGpYOGI1R3MvY0VRU29taFZRMUZ1TmFR?=
 =?utf-8?B?NEZQdEFPWklDV3g5S1Y3L1pldStaL3R1QXJacnZwemVkN0pocVpNbTJoVVly?=
 =?utf-8?B?eDZ5VHRVWjg2MEhrU3cxcVZjUm9HaGExek1sQXhPOW5FaWJzNzdjYURuY2k0?=
 =?utf-8?B?NHowVzNBVWRuTFNjRDRkVGRNcldUMVlnMHBKS3ZsSzhCejl2dmt4RGlBdTNi?=
 =?utf-8?Q?ZB2cgPvFniQI7zf7qjlK8opdC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phabrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4508.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b64baec-2a36-45ec-dd83-08db50625f56
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 07:52:43.9499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20a0d659-dc6e-4307-9c1e-97f93b0e3d90
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fth+pH6iaSX0r48VFLqPp950gj5LOmXdf5yuj1L8r+b+mQMVhEMScKsmIeDFTfI0acu7B2bvUdUwwkiAX7j7U9c5t3oQ7PuGU2d7idoiKyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6067
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uZGF5LCBNYXkgOCwgMjAyMyA5OjUyIFBNIFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFj
ayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMgbWFueQ0K
PiBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9y
IGhhbmRsaW5nIGJ5IHJldHVybmluZw0KPiBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkIGFuZCB0aGlzDQo+IHR5cGljYWxseSByZXN1
bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0
byBtYWtlIHRoZQ0KPiByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBz
dGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRyaXZlcnMgYXJlDQo+IGNvbnZlcnRlZCB0byAucmVtb3Zl
X25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucyB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZSBj
YWxsYmFjaw0KPiB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDaHJpcyBQcmluZ2xlIDxjaHJpcy5wcmluZ2xlQHBoYWJyaXguY29t
Pg0KDQpUaGFua3MsDQpDaHJpcw0K
