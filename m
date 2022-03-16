Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAE74DB235
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Mar 2022 15:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345972AbiCPOMr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Mar 2022 10:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236990AbiCPOMp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Mar 2022 10:12:45 -0400
Received: from APC01-HK2-obe.outbound.protection.outlook.com (mail-eopbgr1300130.outbound.protection.outlook.com [40.107.130.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800CE66F99;
        Wed, 16 Mar 2022 07:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfESjssuUhsPAcWnevjQpjK/aEydZOnwvoTY20wf05ogexWK4R5cOjJlAVBNKw+/ECE9idSMAknbaGIE8DSrQEs2NtcBgFXfa7CnOmHlmzoCtR7dUj0DZAEwknCeVCzD9i2gD7gto/wNfqDG5XIQplAgld2dBrDAyzH2BVgRQ7A3gtU8aQ2skDj4uIz6t/OtNDHyhxwnSvw1QTUGYsLEyDlqk4wc7BAOsdamFJawjkEaFnSnF92xjJNsIyESAYsoLXaAVfa6Zu4QDVkhixRSaY3TfLMroewyhAwbbNDelM1taXBHOu/biAuPST4SpM4+UQ7vvdnndEQrBGJO5fH9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGOCbSHYa8W/5GQPo6+OkDNZVXgkDUD8NYaSJpRZkuM=;
 b=dpu22PATsYVhcUHtipJzJWC0agv+brwSIXbiQ2FA9EokVXb7eFgdaQpvMpo81NDSkz4kknQSeZyMJTzN1D44SHiCFF5zlTaNLwAS6gGDY66D3XP0lNmoMsRD/lxAUOAQWpLTkrAZrfUnirivZeqMN2dBGTLnriVHf0Kg5st/px4vU90KFRNb1/wSfcWFd3L6Xyz3i4y/SiEkgRaF0WXLfgQNr8S7jokGq3Qrgklah7HSTc12FnUndpLlvYIAFJ0mkLj6aMunpFC8a1/MmB/J27iKZ/teJqAVUvh+FYeM/wbDC9/0YpDI1+w97kzQELecz80e/Mqvd1dA/EQnjLMSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGOCbSHYa8W/5GQPo6+OkDNZVXgkDUD8NYaSJpRZkuM=;
 b=byP1lSQzrPKeJMOv1J9Aly8m32K9aEjHeNFEpRezSeVTFaIajco2no34/8PPqTwGVM+FtljWg3VgfspntR6J29/31cpnjSDf3wcb9XSde35CwSy2B9Cbn6ohf6h91QoxoayvxC0llxc6fAQQaV9X8QhxlyQkM9CIroMmYiHmHas=
Received: from TYZPR06MB5074.apcprd06.prod.outlook.com (2603:1096:400:1c6::11)
 by TYZPR06MB4319.apcprd06.prod.outlook.com (2603:1096:400:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Wed, 16 Mar
 2022 14:11:27 +0000
Received: from TYZPR06MB5074.apcprd06.prod.outlook.com
 ([fe80::ccc2:4496:1d7a:5aaa]) by TYZPR06MB5074.apcprd06.prod.outlook.com
 ([fe80::ccc2:4496:1d7a:5aaa%8]) with mapi id 15.20.5061.026; Wed, 16 Mar 2022
 14:11:27 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>
Subject: Re: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
Thread-Topic: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
Thread-Index: AQHYG1EY4H87Ne8uH02ywQ7La/LVCqzCSNGA
Date:   Wed, 16 Mar 2022 14:11:27 +0000
Message-ID: <a8796cde-e97b-7157-33ac-1b6020053c5d@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <20220206115939.3091265-3-luca@lucaceresoli.net>
In-Reply-To: <20220206115939.3091265-3-luca@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75119875-33f8-4b95-64c3-08da0756dc7e
x-ms-traffictypediagnostic: TYZPR06MB4319:EE_
x-microsoft-antispam-prvs: <TYZPR06MB4319E8B100338AE1668E746DAD119@TYZPR06MB4319.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: es5mCuWymjW8QeuDl8VQusiWEBs/4QEqtvBGgrHlnLU6ZsYkZcV3qody3FAONmnuqbYWAs0x4znlayXoYkD1ySfJkFUxcWvqoKfawAS/hdpF8EvJS3NcFxogheEra9NAHq7EmcgdyDUBU9xykQP2OEUuWkIYdLEvajSIQY+mMcXZ3rUFKY3ozNyc85viqoMoAfgak19INnCDjnlL3369u4XBQmaiM+3uHn9RFZb2DGr5nMtGX2UuJ696wvB/NK7T6kAJ3r+7zZjBj+ivxQtAC48kMSrS1YKIh2Dt/OWSpPIUnBNGiLpJFXrIZD+wUD6wCzlSrzMFzM3BswItfz1WvMKRqyjkPLPfN4S7k/yi4iKsxwrvKx6UT76TkHQHfd3hiHXPJWRwWtZzp/+zaLozN1/cBMht9OxcnfgLx23tU2M0Qs7STYh5UMa95bmFPQBv0i/O7ku6IDqIJIzDd3TwtSCy+KGz4KIL9ZD/dLCisePNSiixyI1vbxTm6PFw0YaE5WjHGOg6OJGxAbwVlO+NTVfbWQyBmjVrK3P7+SmTnBG27LWIDbIpVv4KUry3LEiokWK7VASatZG5C7pfaRujYJ5G/2G5vAQCULOz51owYznmhoS7jw5yqNjSQwWV305uYqQtJRBYXDHFrsu0GmYmmsbZaRhikEVSbxNlO6pM2P53Q7W36yZukbxHwYGMhFnhuqMETE21y771EXHtmZXBwJHmBiBXAmuMCXah4j09cD2P2pDvb0Tlz0Y+dE5aUpi7305Pa1eiD8gSCUAi0pFlkD7TvYgmYCChj5RrCTbSxM1zR5YjYkmPe/iw9uJ0Yrfq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5074.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(53546011)(107886003)(2616005)(6506007)(186003)(2906002)(5660300002)(6512007)(508600001)(71200400001)(7416002)(31696002)(83380400001)(86362001)(8676002)(38100700002)(122000001)(316002)(38070700005)(54906003)(110136005)(64756008)(66556008)(76116006)(66946007)(91956017)(31686004)(4326008)(66446008)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M056QzE5MUp5QlhPT25QWjFqb1p6VTJ4REN2NVZwSUhVSUMvQnpMUnd3WE1V?=
 =?utf-8?B?eTE5by95VXRUSzZLcVhKUkpLOGJueFQ0SXU3bE16SEdoSm9XanFGN3RDR1I4?=
 =?utf-8?B?bGwzbkdQb3BXYjZYczVOU1JrMFhFL0RJWTFSektnV1NPa05uUmJxVHcxTjdM?=
 =?utf-8?B?czNjZkxUZG5RNnRhelFjQThZN3ExRXpDeTVFNXk1UUl4RDlsa0V6MHJYNllo?=
 =?utf-8?B?eFUwZUpwN2xBa00xUDhYbUpRRjQ0UDFlcG1USEZ1U21RV1ZuWkE0QjdDMEhy?=
 =?utf-8?B?S3NhZUVtd3hITVA1RnV6ZUtkZ2JKVG8xQ0dBem9wcHpNcUZwanhsR1NVUlhU?=
 =?utf-8?B?MWdrRWxpRU5YTkVST3BVWllrTEtZVEE0Ukc3Rm1WZVJrcG9IY2xZay9KVFFM?=
 =?utf-8?B?RkpuMlE3Mk5kSWl1Uko4Q0xJRFc1TnI0RkY5YlNUbk1MNFpMRGxRS1RzZExL?=
 =?utf-8?B?cU40REl1THlraElYY2tibThuMkxPWk1CWWZmc0p5VmF0MXpUYVlVOEJhSVMy?=
 =?utf-8?B?cktidktwRjdFbXkrSzN0WHhab0VkZkpoaW0vZkY5Y1M5NU5CWUhEdUEzTlc4?=
 =?utf-8?B?MlZuV0kva1dSMis0cVVPeVFDRmtEZUcvK0dhVWlaK2MwcmpiQmtlcjhuU2RC?=
 =?utf-8?B?TWlQUzUvb1FnQTByeWE0a0xoVExrTk9wR2ZMVGZjak5sWWd5d0tHWVdWd2I4?=
 =?utf-8?B?eFBjTlZmd2M3T2pweFQ2eVN2Q2RBdUI4UEhlWFloSUpUOCtSYko3YWlUK1Nq?=
 =?utf-8?B?cDI4K0JEaENHQW5maU8xVnlRQStxN1NxdHVxdnlLQ0tNRGVhcEU4b0NBYVFz?=
 =?utf-8?B?dlFEMlpnNzRqN0dWMDd6VDIxbTY2enIybldwWStEbkl2YWIzaVJCMU5Gelpq?=
 =?utf-8?B?YU16VTlleHhoNEk2V0E3SElZVU9DcWNTNDBrL05TRnl6N21KNThVeFh4K1h0?=
 =?utf-8?B?b1ZqVGt2MGdMbjgyMHlTT0F2TU1xeVFKTngwRFBER2hCTUlVQ09TcVBPQk9V?=
 =?utf-8?B?OVpWWXc2N1dEQkJJdnZ2ZXRMSzJDMG8xNTRnVEVkSEx3VXJQbnd5cmlVQXRq?=
 =?utf-8?B?bDhWVE9BMmNKT2tyKzN6YUdTMmJQaS9sRXczZG9HQSs0U0dyV3FVVlZzbWJQ?=
 =?utf-8?B?Wi9oc3dVUWdvekxZd0VJbStKMkNlcmNEcnNkUnV5RUVXMTU5N3orL2NKQ0FC?=
 =?utf-8?B?QUFmblF2N0swcTFleTUzYmlPNEJBOUdLRVRnZnVUOHB0Z00rSWlObFVvby9j?=
 =?utf-8?B?ZkV1elBRajBIWWRLVnFDMmFHSHMxc2hFdHpTZVduOEtVWHJMeWt2UGVHdGdP?=
 =?utf-8?B?V0FnZ3h3UnFUMkJQN3VoRnAyVjlLTzI2OGJhSEFEYlk1MHpyUzMxdDcyYjB4?=
 =?utf-8?B?a3cxTFFwU0c0NW5qREx6Tmthc0hSQjJpR01lWmZaS0ZuK0doYnZydzV2MnFr?=
 =?utf-8?B?U3R6M3FCVkhZendQWHJxZHArV0FwUzlpTUJxM1NvMHpHdmIvVVp5S21YVU0z?=
 =?utf-8?B?T3Y2NTkrQW1MTlFQQjN1NzBMNlJ2VTl0TjVhSi92TDBSNWx0S3JxMmdsU0xx?=
 =?utf-8?B?L0xYR2FkZVQ3d1FvcnJCRlhlSWdjeDkwQlVDUXhWbVdiZ0RHZGJRWmdpWVlk?=
 =?utf-8?B?cml3MXlCbjFaZTJHaEQwSHBHb1BVcVBmSW5mZ1FuRWI2MVBhaDZWQXVDb3lw?=
 =?utf-8?B?dUVEY25XMzRNY2lHajVUVnRkUWFRNWVTaGNhSjg4UlFMaHBtcFMrVXpocUQ1?=
 =?utf-8?B?TndtU3JzbjRBTEpCYmpvY0pnZ0p6dEFBRWRndCtmT29mRVJzclp2N1JxUitM?=
 =?utf-8?B?K3NwMDJUQk9CU0E1VUk3UnRmY1RKYkxxb1UvcjdCdVVieEl6dy9YZUlGOVNh?=
 =?utf-8?B?QUp3bEtiZXZpbmFqc0k3cmFISXl0aXlRYS8wdW1FZHIxMi9KbnR5TGRENkho?=
 =?utf-8?B?b1Z5RUIxellpK3hha1BRRHpkV2Z1N3RIV2xMa2hrU2dqUGovSE52WHgzODhM?=
 =?utf-8?B?eVFpc3FkVXJiRGR1K1hEZysvK25kNU9id2R2ZVNXLzB2Rjc4VnE2b1l3QVZh?=
 =?utf-8?Q?aDRh+1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D872D3D70467D94F8F8B3ED0A1E3FD50@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5074.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75119875-33f8-4b95-64c3-08da0756dc7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 14:11:27.3574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbX0nqQ3IzkztuzdKQVtAJTo6Ak4FSsMUB3WmDmPUp6c0lfsso/drMF8ViqqQFRE8hwo0NbrKWY9vd0j72rT2KWf4ghg7hl+oFiORriCnTmr2c8OiKN6iypaGchGPJ9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4319
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgZGVlIEhvIHBlZXBzIQ0KDQpPbiAyLzYvMjIgMTM6NTksIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6
DQo+IEFuIEFUUiBpcyBhIGRldmljZSB0aGF0IGxvb2tzIHNpbWlsYXIgdG8gYW4gaTJjLW11eDog
aXQgaGFzIGFuIEkyQw0KPiBzbGF2ZSAidXBzdHJlYW0iIHBvcnQgYW5kIE4gbWFzdGVyICJkb3du
c3RyZWFtIiBwb3J0cywgYW5kIGZvcndhcmRzDQo+IHRyYW5zYWN0aW9ucyBmcm9tIHVwc3RyZWFt
IHRvIHRoZSBhcHByb3ByaWF0ZSBkb3duc3RyZWFtIHBvcnQuIEJ1dCBpcw0KPiBpcyBkaWZmZXJl
bnQgaW4gdGhhdCB0aGUgZm9yd2FyZGVkIHRyYW5zYWN0aW9uIGhhcyBhIGRpZmZlcmVudCBzbGF2
ZQ0KPiBhZGRyZXNzLiBUaGUgYWRkcmVzcyB1c2VkIG9uIHRoZSB1cHN0cmVhbSBidXMgaXMgY2Fs
bGVkIHRoZSAiYWxpYXMiDQo+IGFuZCBpcyAocG90ZW50aWFsbHkpIGRpZmZlcmVudCBmcm9tIHRo
ZSBwaHlzaWNhbCBzbGF2ZSBhZGRyZXNzIG9mIHRoZQ0KPiBkb3duc3RyZWFtIGNoaXAuDQo+IA0K
PiBBZGQgYSBoZWxwZXIgZmlsZSAoanVzdCBsaWtlIGkyYy1tdXguYyBmb3IgYSBtdXggb3Igc3dp
dGNoKSB0byBhbGxvdw0KPiBpbXBsZW1lbnRpbmcgQVRSIGZlYXR1cmVzIGluIGEgZGV2aWNlIGRy
aXZlci4gVGhlIGhlbHBlciB0YWtlcyBjYXJlIG9yDQo+IGFkYXB0ZXIgY3JlYXRpb24vZGVzdHJ1
Y3Rpb24gYW5kIHRyYW5zbGF0ZXMgYWRkcmVzc2VzIGF0IGVhY2ggdHJhbnNhY3Rpb24uDQo+IA0K
DQpzbmlwDQoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL0tjb25maWcgYi9kcml2ZXJzL2ky
Yy9LY29uZmlnDQo+IGluZGV4IDQzODkwNWUyYTFkMC4uYzZkMWEzNDVlYTZkIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2kyYy9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvaTJjL0tjb25maWcNCj4g
QEAgLTcxLDYgKzcxLDE1IEBAIGNvbmZpZyBJMkNfTVVYDQo+ICAgDQo+ICAgc291cmNlICJkcml2
ZXJzL2kyYy9tdXhlcy9LY29uZmlnIg0KPiAgIA0KPiArY29uZmlnIEkyQ19BVFINCj4gKwl0cmlz
dGF0ZSAiSTJDIEFkZHJlc3MgVHJhbnNsYXRvciAoQVRSKSBzdXBwb3J0Ig0KPiArCWhlbHANCj4g
KwkgIEVuYWJsZSBzdXBwb3J0IGZvciBJMkMgQWRkcmVzcyBUcmFuc2xhdG9yIChBVFIpIGNoaXBz
Lg0KPiArDQo+ICsJICBBbiBBVFIgYWxsb3dzIGFjY2Vzc2luZyBtdWx0aXBsZSBJMkMgYnVzc2Vz
IGZyb20gYSBzaW5nbGUNCj4gKwkgIHBoeXNpY2FsIGJ1cyB2aWEgYWRkcmVzcyB0cmFuc2xhdGlv
biBpbnN0ZWFkIG9mIGJ1cyBzZWxlY3Rpb24gYXMNCj4gKwkgIGkyYy1tdXhlcyBkby4NCj4gKw0K
DQpJIGNvbnRpbnVlZCBwbGF5aW5nIHdpdGggdGhlIFJPSE0gKGRlLSlzZXJpYWxpemVyIGFuZCBl
bmRlZCB1cCBoYXZpbmcgDQouY29uZmlnIHdoZXJlIHRoZSBJMkNfQVRSIHdhcyA9J20nLCB3aGls
ZSBteSBBVFIgZHJpdmVyIHdhcyA9J3knIGV2ZW4gDQp0aG91Z2ggaXQgc2VsZWN0cyB0aGUgSTJD
X0FUUi4NCg0KWWVwLCBtb3N0IHByb2JhYmx5IG15IGVycm9yIHNvbWV3aGVyZS4NCg0KQW55d2F5
cywgdGhpcyBtYWRlIG1lIHRoaW5rIHRoYXQgbW9zdCBvZiB0aGUgSTJDX0FUUiB1c2VycyBhcmUg
bGlrZWx5IHRvIA0KanVzdCBzaWxlbnRseSBzZWxlY3QgdGhlIEkyQ19BVFIsIHJpZ2h0PyBUaGUg
STJDX0FUUiBoYXMgbm8gbXVjaCByZWFzb24gDQp0byBiZSBjb21waWxlZCBpbiB3L28gdXNlcnMs
IHJpZ2h0PyBTbyBwZXJoYXBzIHRoZSBtZW51IGVudHJ5IGZvciANCnNlbGVjdGluZyB0aGUgSTJD
X0FUUiBjb3VsZCBiZSBkcm9wcGVkKD8pIERvIHdlIHJlYWxseSBuZWVkIHRoaXMgZW50cnkgDQpp
biBhbHJlYWR5IGxvbmcgbGlzdCBvZiBjb25maWdzIHRvIGJlIG1hbnVhbGx5IHBpY2tlZD8NCg0K
DQpzbmlwDQoNCj4gK3N0cnVjdCBpMmNfYXRyICppMmNfYXRyX25ldyhzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKnBhcmVudCwgc3RydWN0IGRldmljZSAqZGV2LA0KPiArCQkJICAgIGNvbnN0IHN0cnVjdCBp
MmNfYXRyX29wcyAqb3BzLCBpbnQgbWF4X2FkYXB0ZXJzKQ0KPiArew0KPiArCXN0cnVjdCBpMmNf
YXRyICphdHI7DQo+ICsNCj4gKwlpZiAoIW9wcyB8fCAhb3BzLT5hdHRhY2hfY2xpZW50IHx8ICFv
cHMtPmRldGFjaF9jbGllbnQpDQo+ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiArDQoN
CkkgYmVsaWV2ZSB0aGF0IG1vc3Qgb2YgdGhlIGF0dGFjaF9jbGllbnQgaW1wbGVtZW50YXRpb25z
IHdpbGwgaGF2ZSANCnNpbWlsYXIgYXBwcm9hY2ggb2YgYWxsb2NhdGluZyBhbmQgcG9wdWxhdGlu
ZyBhbiBhZGRyZXNzLXBvb2wgYW5kIA0Kc2VhcmNoaW5nIGZvciBmaXJzdCB1bnVzZWQgYWRkcmVz
cy4gQXMgYSAnZnVydGhlciBkZXYnIGl0J2QgYmUgZ3JlYXQgdG8gDQpzZWUgYSBjb21tb24gaGVs
cGVyIGltcGxlbWVudGF0aW9uIGZvciBhdHRhY2gvZGV0YWNoIC0gcGVyaGFwcyBzbyB0aGF0IA0K
dGhlIGF0ciBkcml2ZXJzIHdvdWxkIG9ubHkgbmVlZCB0byBzcGVjaWZ5IHRoZSBzbGF2ZS1hZGRy
ZXNzIA0KY29uZmlndXJhdGlvbiByZWdpc3RlcihzKSAvIG1hc2sgYW5kIHRoZSB1c2UgYSAnZ2Vu
ZXJpYycgYXR0YWNoL2RldGFjaCANCmhlbHBlcnMuIFdlbGwsIGp1c3QgdGhpbmtpbmcgaG93IHRv
IHJlZHVjZSB0aGUgY29kZSBmcm9tIGFjdHVhbCBJQyANCmRyaXZlcnMgYnV0IHRoaXMgaXMgcmVh
bGx5IG5vdCBzb21ldGhpbmcgdGhhdCBpcyByZXF1aXJlZCBkdXJpbmcgdGhpcyANCmluaXRpYWwg
c2VyaWVzIDopDQoNCkFsc28sIGRldm0tdmFyaWFudHMgd291bGQgYmUgZ3JlYXQgLSBhbHRob3Vn
aCB0aGF0IGZhbGxzIHRvIHRoZSBzYW1lIA0KY2F0ZWdvcnkgb2YgdGhpbmdzIHRoYXQgZG8gbm90
IG5lZWQgdG8gYmUgZG9uZSBpbW1lZGlhdGVseSAtIGJ1dCB3b3VsZCANCnBlcmhhcHMgYmUgd29y
dGggY29uc2lkZXJpbmcgaW4gdGhlIGZ1dHVyZS4NCg0Kc28sIHBlcmhhcHMgcmVjb25zaWRlciB0
aGUgS2NvbmZpZyBidXQgZm9yIHdoYXQtZXZlciBpdCBpcyB3b3J0aDoNCg0KUmV2aWV3ZWQtYnk6
IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KDQoN
CllvdXJzDQoJTWF0dGkNCg0KLS0gDQpUaGUgTGludXggS2VybmVsIGd1eSBhdCBST0hNIFNlbWlj
b25kdWN0b3JzDQoNCk1hdHRpIFZhaXR0aW5lbiwgTGludXggZGV2aWNlIGRyaXZlcnMNClJPSE0g
U2VtaWNvbmR1Y3RvcnMsIEZpbmxhbmQgU1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAg
T1VMVQ0KRklOTEFORA0KDQp+fiB0aGlzIHllYXIgaXMgdGhlIHllYXIgb2YgYSBzaWduYXR1cmUg
d3JpdGVycyBibG9jayB+fg0K
