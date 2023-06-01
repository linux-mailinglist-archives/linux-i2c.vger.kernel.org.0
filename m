Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0151271A2F1
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Jun 2023 17:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbjFAPpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jun 2023 11:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbjFAPpU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jun 2023 11:45:20 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AD0E73;
        Thu,  1 Jun 2023 08:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9QjEpODMTMtH6HEjkuJK31HjTAeMu/iB3FwKbEG7w63RhFKUOKjM9yLneyk1qXiz1ah/s8Y//FvAaVeeq68z+zufJHjH+3Ja1jECsJgUFOoUoV/Rq5KvfsFH+PwCsGhrHc9Uz0VqPyzPjBRjnHVFJKFpBHaepIdjWe9vo0FzrAC2BOry45yKEDAL3rqxak6qavOxX/1Pe7YEB7Ly4ohSyjziykxVDuJLYgvpkkhJ3je0i0pQjMPqOz4KLCMzsS2Pj+tD/gmzJsQ+sIxFDV3WTAAKqpjhRv0qFx6iSLaUzAIoG/9BmLAKsmxMX7F46ihXFrICsvuG+3eXsj3rfWfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAPLhbVPommqz4FKh4v0YWkDrZsOSJda5vszA88oDnQ=;
 b=DD2pXqHzjZCM4cNZVuOwsOIt9GHE5unWFw2UsoUIbiDtNIVSsZpy+htjXbk2t/EX60F/6sgHg5yLEedUNtWEjqpaRC0C8ATwAuBwmZXTCPLUoJ8axMFL1SO4WVUMjIZKiXqIZ3PllLbeXFPTRKmU7onnzsoSsPfm67bNaBPisnQxmZaF4t0JMTtgdJXQUw3ONuwZsfK7IvPy7kioJFnyYZH8Ir1B09gAKNVD02RvV4GlPS5wSGN2pSJOutx6Ge6gVqSXC183nFaZlugqhKQ5Bnuzm/APBTCsAp26civK6tLF6Up2CAO65hbqrb7SizkopX+D7kmGmiLC96S9kQi+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAPLhbVPommqz4FKh4v0YWkDrZsOSJda5vszA88oDnQ=;
 b=kKQgop8WAJ3zVCyyuI9xuan2PuuIKerDoRJ5a2Z57Civcq08ogeOqMZPTmtNSxgNoM6+869WsJJTPazZaw2f72VQw/sBlEUHbGRb4MHp6X7wLvjR3mB6IAE2YelYM4P/2uTydrQ1MFBstZJ4ihRoRKAIa4LXki/z72JPeO2bJFY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11819.jpnprd01.prod.outlook.com (2603:1096:400:3e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 15:44:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 15:44:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH] i2c: Add i2c_get_match_data()
Thread-Index: AQHZjJoMdfR+x3Vj306EK7lrI8lBfq9mJ/OAgAARV0CAAANVAIAP523Q
Date:   Thu, 1 Jun 2023 15:44:58 +0000
Message-ID: <OS0PR01MB5922BCFBF56C4A7711AECBE786499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522104157.333217-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWPF8SvJ=OyPBFSwTD65ic+KB-um0zYWVL6imO-ddgC6g@mail.gmail.com>
 <OS0PR01MB5922DAE12A85AC045B6222DB86439@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXBoazJtsZ89zv1_xG9CtJ+hnasZLrW_13xtoVKANN+cg@mail.gmail.com>
In-Reply-To: <CAMuHMdXBoazJtsZ89zv1_xG9CtJ+hnasZLrW_13xtoVKANN+cg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11819:EE_
x-ms-office365-filtering-correlation-id: 1894fab4-b40a-4513-2a03-08db62b7279a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XmK6eh1N+ioWTGCBit+1UwMryTMc+IyMzzn11J+3wnsz+eqL6mH9nEt05002OfEPJi/bOSXspT60EHsTeSvg16f+nONozLazOgnJC5q+6JKg2v6kRY289wiFWIEeN8kdfRMmBKsAzDYaYZR1TxM94O2OLshsOr0nniuBU2vFU8lbblddfr7jN6+a4Bb+9xwunPzP6eCUWv7BKgBzcnB+rMVNZ6pO72nOHylgdYE/qaeeKdNuAlBqRB4KbiAcGKHTcsRRO5ndEG0lyIeB6np/iNNOAxmIKxZtP9gmfQbbU89hbHn9p4CZReIxBBMMWPIBJMm4arO8Irb0gdNUYH1amV0PBOdUtknTw+d2Dt3mDyesCiH1vQte53Hss1ioJDt+uxJZEzJ1awgVEbs4Ch0Hra16PUVdLxabRKHt+76SiHH1AYl/FkKStDue0+3sTDu8Fk+CXSwBbBoYUh6C+tx3qq0DYcDuUFgVGvqab9pn2hdYL0Fj+IGMJ85lVRDlPo1GPe33szHJG56C0HFPvQQvScae+r0A2LbXtX0ls9sS/X0BvMkgPM54behfKsUeA9OMwS0KBVdZ11Sn4weZb+a/rpoqymIQ2tUCJU4XekqTg4xinS/iZ6dnJP8q/P/w5ffi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(71200400001)(478600001)(7696005)(33656002)(186003)(6506007)(53546011)(9686003)(83380400001)(38100700002)(86362001)(38070700005)(122000001)(26005)(55016003)(316002)(6916009)(4326008)(41300700001)(66946007)(66556008)(76116006)(64756008)(66446008)(66476007)(2906002)(8936002)(8676002)(5660300002)(52536014)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTQwZ25zRnRKdW1YMVBid0tDdWpPb2dRN0lET2pkSlhRUE13Ym9KcDl6UzVB?=
 =?utf-8?B?cUpvYWIrVjlpRVVVRzZvY0ZTUjJrZ2cvWmFSWVovcXpZcjFnNTByRUZ0RTI3?=
 =?utf-8?B?b2k3Q29HdjNvMVBmOHd0SmorVW9lYVo4TnZmRFI2ZEVrN05SQTJFak9uOW00?=
 =?utf-8?B?R1pMdDh4RE1HZzdvQTRsbXJVMEMvTDR5bzI1THdZRExBY0d4ZkQ3MStJSklZ?=
 =?utf-8?B?bHRiMndiblRaallYa014UmNUeCt3dHZiNjk1S1J5cTYzaGdZSko4WWFqb1lC?=
 =?utf-8?B?VElqaTFWL0dva3FNNWJZVG1weUExbTA0RVk0K1dNQVBHZWRUVnZQZ3NCOFFN?=
 =?utf-8?B?anEvWVpuem1vcmtSeDIrTmF0Q3M4T255d25vRHVsbkdQMWJ6QTlaREJYSXM5?=
 =?utf-8?B?dnlScXJ5UVMrVXJyMXpOVWp1N3N0U0FsMytLSUxaU2RCczRpcjNLK1ZaMmtl?=
 =?utf-8?B?RmtVY09uRURrUWNnNWlaZUtzTXdJMHdraTBMQ0RuNkpTMGtscFgwM1BqSlNN?=
 =?utf-8?B?RXdXQmJIbmVHSDhKZUpTaTVoM09BVjZ0djV3Z1dydUNrc3M4dklBcEtoS3hO?=
 =?utf-8?B?eUU0Z2puV3Aza0JaK2sramR4T1prUzB6Z0dpenV1MklmSFErN3Y1TjFqWitl?=
 =?utf-8?B?TUNZV3VUNG81MzliSnVZTDhlYmJtL1VPWmsybFlHblNBWXdyQkZmRzZlaGMv?=
 =?utf-8?B?Zmo0Tk0zRkJPMnd0K3ZOdEZoajhzVGJWalRFN1hRd0Fmb29rM3NteDJoa1B0?=
 =?utf-8?B?Y05Ga3p1MkRJbkhrbjY5MitZU2FDN1ZaalJxbjRnNVhuVjVibnpac0RCNE5L?=
 =?utf-8?B?eU9uVG8zTkdYYWFLUGhmcTBTWkV1REQwWkFHNzl1a3AzcjZ5QVNjUjVTanBi?=
 =?utf-8?B?WW1IeEk2VVgxaGlwNktQa3pDTkcrcG1aRW44SndiRWFhSUkvaGY5MjBBYTBm?=
 =?utf-8?B?QzdSbloxTzNnUWxncWM4bzRJY0xWQWplQW5oSHRDeVU4MUNBdWcrZlZrUmUr?=
 =?utf-8?B?YWZmOUNHbmNYcHovUHBsa0VicjBUaWlqSXpNcDV4Y2t5TG5keks4YWEvZzdR?=
 =?utf-8?B?dUFFcHlKVDM0eVVTQ1o0blppVG9hbGV1U0QwN0lyNzlNRGhZaVdFdjRDQXpL?=
 =?utf-8?B?NWxjUkxWdFg4dVFwaDlZa0JJZHpnWXV2TUJXQTdURHNRNFJLeEVueE5vWjU4?=
 =?utf-8?B?K3dHckFDdGloSFdiRmt1REdkT3ZDNzh0ZVlZRWVEenlKYjJtaFVod1JwMlJZ?=
 =?utf-8?B?SmZHRXAvRDE1OVRiRGJEcit0RUp0T05MSnU4bXNhMHRiT3JPMUV0OEoxNzBo?=
 =?utf-8?B?QWRGOER1L25uZ0RObGkyT0hwbHFUMVZVRGF5THRmd0l2YnNEVHVUYWgwNTc2?=
 =?utf-8?B?eDdzZWZ3MVFOeVNHWC80MTBqaVRjdVRtWkRUU2xHSVo0ODVyM0k4V2xXZnFN?=
 =?utf-8?B?Z20zNzJKdGJvTXRwNTU3K2c0Y0tMdDU1K3l4TzlnTDk0ci91TjRyaWlMRWJT?=
 =?utf-8?B?eXBtNWFlVXd1elZTS0Z0bVVpQVJ1MmR4YitRakZMSFgzejFIMkF1bzFmMlQv?=
 =?utf-8?B?TWtUZ3MwakJNT2FNejNrSFlFVklJaFZMZitMMW5zMW43UlVNZ2IwRHIrU1Fn?=
 =?utf-8?B?SlRqNFRuelZCckppQ0Zyb0IyK0M3MUlZWk50MWtpL0dRc1V2aXJuZkV1ZmFr?=
 =?utf-8?B?Z2p6MFI5bDQ0OXZvTHlpQXMyWlhOaE9LMW04WnJSUUs0NWQ1SnY3RnBDNG52?=
 =?utf-8?B?dDJYbFBscjd3SWZOMGhRc0lDT09aNm9ybDhNK29KektVRnRkUTE3emhIaW5F?=
 =?utf-8?B?MTNtcHFyb2x0ajJ2SFB2bnFWUDJKNDdUVUdPalJBRE9nMVJVN2NPdXB6UC9T?=
 =?utf-8?B?TnU3OUM2VW1ZZ0FZM04veTBETm1taVY2aVFKMkFSeTFqZTZCWm5wTys4dUpI?=
 =?utf-8?B?L05RalkzZE9UVmp6NEhLR1RNdWVtb0hheWFEd2E1UGx3OGZBblFTMnFGdkFO?=
 =?utf-8?B?NnBVVk9Na0R5UzY2OC82ck9hU2xHUWc0VzNYSFd0WGxKQStjR0pqT2l3ZlQ5?=
 =?utf-8?B?YWhKcVNuOExaS0hGd3F3SnlXNGptdGxjZWVWR1RYRFc3MEd0UHNSOGhTQkR1?=
 =?utf-8?B?NjlETFYrYzdnNzljRll3OTZMaW1PcnV3WXhXK1o0ZENVTklPZ1FJWmYzUTI3?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1894fab4-b40a-4513-2a03-08db62b7279a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 15:44:58.5958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1B5wauna61fyHi5J1v0kiWrClHUjuLoXpWs8BdBchBLxGa8GstZ3mY8xA/UsckVtWRIcJG0sZrJ8VAP+Qxjg6WaIXcQkbX0OqfHjTY1GG3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11819
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGkyYzogQWRkIGkyY19nZXRfbWF0Y2hfZGF0YSgpDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgMjozOOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgTWF5IDIyLCAyMDIzIDEyOjI5IFBNDQo+ID4gPiBUbzog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gQ2M6IFdvbGZyYW0g
U2FuZyA8d3NhQGtlcm5lbC5vcmc+OyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4g
QWxlc3NhbmRybyBadW1tbyA8YS56dW1tb0B0b3dlcnRlY2guaXQ+OyBBbGV4YW5kcmUgQmVsbG9u
aQ0KPiA+ID4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgUHJhYmhha2FyIE1haGFk
ZXYgTGFkDQo+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsg
bGludXgtcmVuZXNhcy0NCj4gPiA+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGkyYzogQWRkIGkyY19nZXRfbWF0Y2hfZGF0YSgpDQo+ID4gPg0KPiA+ID4g
SGkgQmlqdSwNCj4gPiA+DQo+ID4gPiBPbiBNb24sIE1heSAyMiwgMjAyMyBhdCAxMjo0MuKAr1BN
IEJpanUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiB3cm90
ZToNCj4gPiA+ID4gQWRkIGkyY19nZXRfbWF0Y2hfZGF0YSgpIHNpbWlsYXIgdG8gb2ZfZGV2aWNl
X2dldF9tYXRjaF9kYXRhKCksIHNvDQo+ID4gPiA+IHRoYXQgd2UgY2FuIG9wdGltaXplIHRoZSBk
cml2ZXIgY29kZSB0aGF0IHVzZXMgYm90aCBJMkMgYW5kDQo+ID4gPiA+IERULWJhc2VkIG1hdGNo
aW5nLg0KPiA+ID4gPg0KPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNl
LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQo+ID4gPiA+IEBA
IC05OSw4ICs5OSw4IEBAIGNvbnN0IGNoYXIgKmkyY19mcmVxX21vZGVfc3RyaW5nKHUzMg0KPiA+
ID4gPiBidXNfZnJlcV9oeikgIH0gRVhQT1JUX1NZTUJPTF9HUEwoaTJjX2ZyZXFfbW9kZV9zdHJp
bmcpOw0KPiA+ID4gPg0KPiA+ID4gPiAtY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmkyY19t
YXRjaF9pZChjb25zdCBzdHJ1Y3QNCj4gPiA+ID4gaTJjX2RldmljZV9pZA0KPiA+ID4gKmlkLA0K
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QNCj4gPiA+IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiA+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaTJjX21hdGNoX2RldmljZV9pZChjb25zdA0KPiA+
ID4gPiArc3RydWN0DQo+ID4gPiBpMmNfZGV2aWNlX2lkICppZCwNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0DQo+ID4g
PiA+ICtzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ID4gPiAgew0KPiA+ID4gPiAgICAg
ICAgIGlmICghKGlkICYmIGNsaWVudCkpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsNCj4gPiA+ID4gQEAgLTExMCwxMCArMTEwLDMwIEBAIGNvbnN0IHN0cnVjdCBpMmNfZGV2
aWNlX2lkDQo+ID4gPiA+ICppMmNfbWF0Y2hfaWQoY29uc3QNCj4gPiA+IHN0cnVjdCBpMmNfZGV2
aWNlX2lkICppZCwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGlkOw0K
PiA+ID4gPiAgICAgICAgICAgICAgICAgaWQrKzsNCj4gPiA+ID4gICAgICAgICB9DQo+ID4gPiA+
ICsNCj4gPiA+ID4gICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiA+ID4gIH0NCj4gPiA+ID4gKw0K
PiA+ID4gPiArY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmkyY19tYXRjaF9pZChjb25zdCBz
dHJ1Y3QNCj4gPiA+ID4gK2kyY19kZXZpY2VfaWQNCj4gPiA+ICppZCwNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2NsaWVu
dA0KPiA+ID4gPiArKmNsaWVudCkgew0KPiA+ID4gPiArICAgICAgIHJldHVybiBpMmNfbWF0Y2hf
ZGV2aWNlX2lkKGlkLCBjbGllbnQpOyB9DQo+ID4gPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChpMmNf
bWF0Y2hfaWQpOw0KPiA+ID4NCj4gPiA+IElzIHRoZXJlIGFueSByZWFzb24gd2h5IHlvdSdyZSBh
ZGRpbmcgYSBuZXcgaW50ZXJtZWRpYXRlPw0KPiA+DQo+ID4gVGhlIHNhbWUgY29kZSBpcyBzaGFy
ZWQgYmV0d2VlbiBiZWxvdyBmdW5jdGlvbi4NCj4gPiBBcyBkaXNjdXNzZWQgYmVsb3csIGl0IGlz
IG5vdCByZXF1aXJlZC4NCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gK2NvbnN0IHZvaWQg
KmkyY19nZXRfbWF0Y2hfZGF0YShjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQsDQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50KQ0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgdGFrZSB0aGUgaWQg
dGFibGUgZnJvbSB0aGUgaTJjX2RyaXZlciwgYXMNCj4gPiA+IHBvaW50ZWQgdG8gYnkgY2xpZW50
LT5kZXYuZHJpdmVyLCBpbnN0ZWFkIG9mIGZyb20gYW4gZXhwbGljaXRseQ0KPiBwYXNzZWQgcGFy
YW1ldGVyLg0KPiA+DQo+ID4gWW91IG1lYW4gY29uc3Qgdm9pZCAqaTJjX2dldF9tYXRjaF9kYXRh
KGNvbnN0IHN0cnVjdCBpMmNfY2xpZW50DQo+ICpjbGllbnQpPz8NCj4gPg0KPiA+IHN0cnVjdCBp
MmNfZHJpdmVyICAgICAgICpkcml2ZXIgPSBjbGllbnQtPmRldi5kcml2ZXI7DQo+IA0KPiBhbHNv
IG5lZWRzIHRvX2kyY19kcml2ZXIoKQ0KDQpPSy4NCg0KPiANCj4gPg0KPiA+IEFuZCB0aGVuIGNh
bGwNCj4gPg0KPiA+IG1hdGNoID0gaTJjX21hdGNoX2lkKGRyaXZlci0+aWRfdGFibGUsIGNsaWVu
dCk/Pw0KPiANCj4gRXhhY3RseS4NCj4gDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAgICAgY29u
c3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKm1hdGNoOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAg
ICAgbWF0Y2ggPSBpMmNfbWF0Y2hfZGV2aWNlX2lkKGlkLCBjbGllbnQpOw0KPiA+ID4gPiArICAg
ICAgIGlmICghbWF0Y2gpDQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHJldHVybiAoY29uc3Qgdm9pZCAqKW1hdGNoLT5kcml2
ZXJfZGF0YTsNCj4gPiA+DQo+ID4gPiBPbmUgY2FuIGRpc2N1c3MgYWJvdXQgdGhlIHJldHVybmVk
IHR5cGU6IHBlcnNvbmFsbHksIEkgd29uJ3QgbWluZA0KPiA+ID4gImNvbnN0IHZvaWQgKiIgZm9y
IGNvbnNpc3RlbmN5IHdpdGggb3RoZXIgc3Vic3lzdGVtcyAoZS5nLiBEVCksIGJ1dA0KPiA+ID4g
YXMgaTJjX2RldmljZV9pZC5kcml2ZXJfZGF0YSBoYXMgdHlwZSAia2VybmVsX3Vsb25nX3QiLCBv
dGhlciBwZW9wbGUNCj4gPiA+IG1pZ2h0IHByZWZlciB0aGUgbGF0dGVyLg0KPiA+DQo+ID4gVGhl
IGFkdmFudGFnZSBvZiB2b2lkKiwgaXMgdXBwZXIgbGF5ZXIgZG9uJ3QgbmVlZCBjYXN0aW5nLg0K
PiANCj4gRGVwZW5kaW5nIG9uIHdoYXQgdGhlIGRyaXZlciB3YW50cy4uLg0KPiBTb21lIGRyaXZl
cnMgd2FudCBpbnRlZ2Vycywgb3RoZXIgd2FudCBwb2ludGVycy4uLg0KDQpGb3IgaW50ZWdlciBh
bmQgZW51bXMsIGFscmVhZHkgbW9zdCBvZiB0aGUgZHJpdmVycyBhcmUgdXNpbmcgbGlrZSB0aGlz
DQpjaGlwX2lkID0gaTJjX21hdGNoX2lkKG1heDIwNzMwX2lkLCBjbGllbnQpLT5kcml2ZXJfZGF0
YTsNCg0KPiANCj4gPiBlZzogd2l0aCBrZXJuZWxfdWxvbmdfdCBhcyByZXR1cm4gcGFyYW1ldGVy
Og0KPiA+DQo+ID4gaXNsMTIwOC0+Y29uZmlnID0gKHN0cnVjdCBpc2wxMjA4X2NvbmZpZyAqKWky
Y19nZXRfbWF0Y2hfZGF0YTsNCj4gDQo+IEkga25vdyA7LSkNCj4gRm9yIHRoZSBpc2wxMjA4IGNh
c2UsICJ2b2lkICoiIHNpbXBsaWZpZXMgdGhlIGRyaXZlci4uLg0KDQpCdXQgd2l0aCByZXR1cm4g
dHlwZSBhcyAidm9pZCAqIiB0aGUgYmVsb3cgZHJpdmVycyBjYW4gbWFrZSB1c2Ugb2YgaXQsDQph
cyB0aGVzZSBkcml2ZXJzIG5ldmVyIGNoZWNrcyByZXR1cm4gdHlwZSBmb3IgImkyY19tYXRjaF9p
ZCIuDQoNCmRyaXZlcnMvaWlvL3BvdGVudGlvbWV0ZXIvbWNwNDAxOC5jOgkJZGF0YS0+Y2ZnID0g
Jm1jcDQwMThfY2ZnW2kyY19tYXRjaF9pZChtY3A0MDE4X2lkLCBjbGllbnQpLT5kcml2ZXJfZGF0
YV07DQoNCmRyaXZlcnMvaWlvL2FjY2VsL2FkeGwzMTNfaTJjLmM6CQljaGlwX2RhdGEgPSAoY29u
c3Qgc3RydWN0IGFkeGwzMTNfY2hpcF9pbmZvICopaTJjX21hdGNoX2lkKGFkeGwzMTNfaTJjX2lk
LCBjbGllbnQpLT5kcml2ZXJfZGF0YTsNCg0KZHJpdmVycy9paW8vYWNjZWwvYWR4bDM1NV9pMmMu
YzoJCWNoaXBfZGF0YSA9ICh2b2lkICopaTJjX21hdGNoX2lkKGFkeGwzNTUsIGNsaWVudCktPmRy
aXZlcl9kYXRhOw0KDQpkcml2ZXJzL3J0Yy9ydGMtcGNmODUwNjMuYy0JCWNvbmZpZyA9ICZwY2Y4
NTA2M19jZmdbdHlwZV07DQoNCmRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtbHRjNDMwNi5jOgkJ
Y2hpcCA9ICZjaGlwc1tpMmNfbWF0Y2hfaWQobHRjNDMwNl9pZCwgY2xpZW50KS0+ZHJpdmVyX2Rh
dGFdOw0KDQpkcml2ZXJzL2h3bW9uL3NodDN4LmMtCQlhdHRyaWJ1dGVfZ3JvdXBzID0gc3RzM3hf
Z3JvdXBzOw0KDQpkcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzLmM6CWRldmljZV9pbmZvID0gKHN0
cnVjdCBwbWJ1c19kZXZpY2VfaW5mbyAqKWkyY19tYXRjaF9pZChwbWJ1c19pZCwgY2xpZW50KS0+
ZHJpdmVyX2RhdGE7DQoNCkkgd2lsbCBzZW5kIG5leHQgdmVyc2lvbiBiYXNlZCBvbiByZXR1cm4g
dHlwZSBhcyB2b2lkKiwNCg0KQmFzZWQgb24gd2lkZXIgZmVlZGJhY2sgaWYgbmVlZGVkIHdpbGwg
Y2hhbmdlIHJldHVybiB0eXBlLg0KDQpIb3BlIGl0IGlzIG9rPz8NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQoNCg==
