Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D7D6921F5
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 16:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbjBJPWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 10:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbjBJPWE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 10:22:04 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC84199EA;
        Fri, 10 Feb 2023 07:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676042511; x=1707578511;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LmSNEV8esOSMvDjVtqmDJTDWfJjJwFsykmECFC1tmc0=;
  b=ScKv17vqO/JiTnj1Px1rdJvP5JZ+PIRibE8wNQS49uJu9h9uYbQXXy4X
   f2SxHIluZu1F+rS4/lu0yqdQCWDz19xJAlfgcNlAOiQ5H9bjKVfw3VpvA
   QL7qV/GaMWG88dCxc949OeXpzWPbmlfvEZDBP4qWWWLi876fVw0cmjzEi
   v1OwxxSTaRuRwR7DaqSdUPPlhwicVrN43ONi2cq8GS1c1XnzV0iqfiGaK
   ATtAAia2Fxde0SXaylQO9jKSnhL/G2c0Ew92WZ2ttkAlVrr7clSVKktRw
   BYd08yWfHN75A0qqGv9TzgplazSleZzMraCm8d0Btgm4S/PM6V494CVGS
   g==;
X-IronPort-AV: E=Sophos;i="5.97,287,1669100400"; 
   d="scan'208";a="200157217"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Feb 2023 08:21:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 10 Feb 2023 08:21:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 10 Feb 2023 08:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrmFGWhb5PzMn1oIkIV8KL4pQfoGBzN2DAuG4AZE+SUPypgV1M3I63WOZnFDcY3uZLi6d86D9p+GigQWMVbkdc0QIvt/zZ/pwY0rwj+pCS5qZqcHYIVfJdYlaErfzFXcqO24POlSPgskDvPoXMdQ/nfWCWRXbob75h4ZHhWJiiaey04pUECA+mhqc4Cg0HeP5ZmtVvub4iL3KwuCibyvSDGDEVyUH2W20AtSBPOxuxAoh/KCJaE1ddNAvqwBXfdzjxR0T7ftvAr5vSHhcMv49xbqhPVl4DwErpY5rvAVsRh58r0hegh1kAvFHNhXh1q19dA+CfMYt6ws6iZsL4nTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmSNEV8esOSMvDjVtqmDJTDWfJjJwFsykmECFC1tmc0=;
 b=QqL8M2Pddr4G0q0BrGBFONgN4kFqXtzrD3XiHEDmEaiU/CeyOu8lw6oKMT7EcZfzGbKcFAXHu+5S5/qVruzg4yLh9ErP7qLbiQcix4O2mbxLCCTS/HwsYXJz3OIXGnWrsCyG0iKnnhfv4jDIqwAhVmaCpCqubaBFdXxoAyIKxICfS03CpvR3nBjBcBiEhi+csa+oWnJGFScgqynFgE1aoyMS9DHL+dWaS9FcGdsFjOAYzlvtuoTQljhi/FoX7QnsdmxUapNXfJFHWspuSNAEoTH7B7Hrzo6QPqyOcE2f0yImfCBfSBmHwABrqJLOa4hbd5IXPiPNVfKEKuqP3wtcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmSNEV8esOSMvDjVtqmDJTDWfJjJwFsykmECFC1tmc0=;
 b=qAo8Ynoxthu5ssPcSLjn9DWVYdcZSzX7QUonwVagyI1PwWgJkP8z7Un2J3BkMXarJER2bqijheTZj2vp0ZeN32E7jw/ildibenjVs8Hm5y6UmpunWWv+a8LdBfoLLN3VOV5r86Bg7h4GeBP69c5zLElnz2D5K9zGdN10mj5Tx7M=
Received: from BN7PR11MB2657.namprd11.prod.outlook.com (2603:10b6:406:b1::19)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 15:21:48 +0000
Received: from BN7PR11MB2657.namprd11.prod.outlook.com
 ([fe80::5785:c616:dbb7:5dbd]) by BN7PR11MB2657.namprd11.prod.outlook.com
 ([fe80::5785:c616:dbb7:5dbd%7]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 15:21:47 +0000
From:   <Ryan.Wanner@microchip.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: I2c GPIO Recovery with pinctrl strict mode
Thread-Topic: I2c GPIO Recovery with pinctrl strict mode
Thread-Index: AQHZOx16zGlzhrQDN0+TB+zF+/Sngq7GbWGAgAHjgAA=
Date:   Fri, 10 Feb 2023 15:21:47 +0000
Message-ID: <961a2164-640a-86b5-980f-73668eb161e4@microchip.com>
References: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
 <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
In-Reply-To: <CACRpkdbK8A9X4nCZEc53-wXU0Vgkc53j_r5rLQiSeoNbmvm8sg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2657:EE_|MN0PR11MB6207:EE_
x-ms-office365-filtering-correlation-id: 000af2c9-62e5-431f-c88b-08db0b7a86c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ra368qfLVRsL3QLglykjmNYSgg1RS6RIOyv3IGiDhPak2elGBDR0AYtMp5TqHY4WQaGOz23SAIzvlxsHj2P7IqC/W6TNey4rNBRxACvY4GEtz9KuloWtlOG2rVTnm0VDNiXPeFs83bL8XQe5oEtJfyQSM15dxSlKkRKb69pcGGE/u9GAmyBUCJBp5VSAoBe+/V7JgjwMnXouImmKL2N5v9uqla2HMVkAM797FSmcHYAs2lYYQDQyY0phKM9B8QfypYLuJP+d1EHsuqY9QK2rlH5pjzVBUarQnqioFydxSNRWEhxByvvva9+9/IH4s+CX9dFEVXVP8oN8CJq/xrVGVI9aN3JETS0Awckyl46H7+VtVnf8pOFhluMFn9FeZhbgvdceBHCu8MbDu9gEYGT6zJ94vqePi89PpaDyouzAkQXvANI8C+GbqNCWOyPDWK1MIoNXZ5DnLkodr8Aqbvt0r8guP4FmGgECLnNZo3DhhdpOixOTB8RpbKvwDJeoiwg1SDlIdtQo0ViRKRH59UorTnqNF+hkl6aG36o9y0YklDYU9T6/IsMxX47dXKDb1Xt0VUu7lrJlPbkmtP37PvQppHXA43doqERndv9zK5CmOvcwSQIfxunevCRyvqs0xNi4ZWb9rv+792ClNwCrIi2uV72WYRtF/Ehi/PFsCkbnFEJnyc49rIq6VioLsn59b9dbCrJTvPzfPLDXFo2HJ1P1J3OFTMdqJHIcrSabfY34bsQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199018)(36756003)(38070700005)(31696002)(86362001)(64756008)(91956017)(4326008)(66446008)(8676002)(6916009)(66946007)(41300700001)(66476007)(8936002)(76116006)(66556008)(5660300002)(6486002)(54906003)(316002)(2906002)(83380400001)(38100700002)(6512007)(122000001)(186003)(26005)(6506007)(53546011)(478600001)(71200400001)(2616005)(107886003)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDZ1YkhkMFZFdHF4UVQvOWNxQmlyMmV6eStDbkVCa002QXJNWGN5eGk4Y3Rp?=
 =?utf-8?B?eXFSS3RYRXFyMTVJdkFRSVNENnlRSG1WWFArUGgzcEJmZWF2UWFBdU1zcURY?=
 =?utf-8?B?Y0R0Q2NjQmRGZTRHRUJmR0dnbGRLV2NwK1JGYlpxUUpaOEk4NUN3RUlxTUtm?=
 =?utf-8?B?OUdpRjdCb1BSb0dlMGhWMFoxK2RFc2czamJGbnpMOXJ3RVB0NGtvQVhab3dW?=
 =?utf-8?B?Y0dLZWl0dFFvOFRFQmFwSFFqdjNjYlFXN2pCT1JJVVkwSXJveExIVzRUbDZJ?=
 =?utf-8?B?RlVxY0FkMU5PSkZEbGxHL2lha1VyYThXNjZUUHI2b29HY2hBUGlQQkxaYVlW?=
 =?utf-8?B?THpkTS82YVV0b1FzUUZsK2Fha0FrSWdlWHB5c1RyL0FEdmhvTUtjd1VtS2dM?=
 =?utf-8?B?cC81N3BSOENhTVhWNmhLR3Z2cFlHNVdQRk1RQlF3RWJFV0ozMUFVcDluOWtP?=
 =?utf-8?B?czRrWGkyYVdWRUFIMXJtaDQ3Yy95TE10R2FzMWRpM3ZpS3JWZGdwOFNxVEFr?=
 =?utf-8?B?NTdERTQzMGNJRUh0RTJEZFNLd0kwOCtxYnRNSTYwL2R0MVYrVnQ1WHNHMGo5?=
 =?utf-8?B?eWJoY0xKbDYrbzZzVTQzUDRYOC9uNVFjTmN3NVFyaFdCY1h1Vi9OWFE4eXhE?=
 =?utf-8?B?aVdpSWJPeTY1NVBYQTNyT3d1cW5PYUI2RGJtcC9nZ0ptVzFFMFArUnBxMnBN?=
 =?utf-8?B?L0ZKaTh6UElDNHRWM09ZR3NXck54ekJVdGJTYzdKMnJZK1RTb2dIQlJ5MEtC?=
 =?utf-8?B?RnFLdkFaanFNN0FRY2FXUUxmczRGT2duNmRLb1lxUUlZMW9SZ3YzZms0djdU?=
 =?utf-8?B?T3dIckYwcWozOFFEUVZKQ2dlNEZDQjFRY2MwS1B6aStVQThSWjBMSXV1OHpB?=
 =?utf-8?B?TStVcFZDSVpFN2NNdERGUlQzczFpbnIvRGVVTE1zSGtPSWVpaEQrcXZ1VW9r?=
 =?utf-8?B?azdNZ3ZvTGNVY0NtdmZsbnU5eGVZOWlkOURJTVVtaHU5bXBjYkptcldCK2hp?=
 =?utf-8?B?TlFsaDhCWkVpb3ZlR3Z4R0hyanlqdURCLzBhWlRiald3bFZGaWhMNloxSlds?=
 =?utf-8?B?RVQ1ak9lRFY5SmNuaTA2STNtNXhhbDhlczhsaVJYV2h6eENla0VDbjNEWEoy?=
 =?utf-8?B?VUF1d2V5RlE1V1VheG05RStLN1FlMUlGd3lUY0NKOXA1ZVJWUm5UZ0xveTls?=
 =?utf-8?B?NkxLTkg5cUQyVEtIM0dvM09lUlFYYVpqWlpXenMyZDZUaU10V29Pa2hRNjJZ?=
 =?utf-8?B?bnJXMTlYei80YlNEdG1xL3ozOThDNTl3Rzg0OEJTTHMxaDk3QmIvYWhmVlNV?=
 =?utf-8?B?TEZQRW9ueVhPNEZWd0tBR04vSUtJRVZqempJY1h5WXpFTjZ5Wnk4WUZmVllV?=
 =?utf-8?B?MWM5azVuaVVrVXVHOTNwTGJvV3czOTU1TWNrb2FSNTJ3WG5KYi9WUnAyU2tO?=
 =?utf-8?B?WE5hYzNXMGNta2Z3TGxxcTM0RkVsQ0ZUVnZJS3lyRXlveVRvOFZKcGFLTUgz?=
 =?utf-8?B?Ulc4eU1MOVkvUDlub2t6ZzZYbStPZ05zNEtIRlhCbjFuQmpFUXVVUVgvN3dt?=
 =?utf-8?B?dUc2VUZ4UjA5WXg1T0I0SnpnLzM2S0JkR3JJY0JidjBTMUE5MXFtTHlTMjZo?=
 =?utf-8?B?Ym8zeVBER2RIYnFNUFBtVlZ1QngrSEE0dk90Q0x6TVl6akQ4MWRyRkpNaUVk?=
 =?utf-8?B?TkwybjdrTlpscVRVMUpSVEEvaU95dlB5eENVVlBYeXdNTWtuUGhDaXV0VE5q?=
 =?utf-8?B?TzlFYXJ1YTgzY090alZHRVk5Q3FNT1c4Q1Vjd3lQSExPQWtRTkIyRW9aWlZX?=
 =?utf-8?B?UGcrbEJCQUVLWUFwNHBQQ0N4Y0k2ODMxR2xXL0NkdjNZdU9OQmdjcm5wdE4z?=
 =?utf-8?B?R3hWKzNkaE9Lb0hDb3MzeHd2NXlUNTRUbkdUVzdQMThBWVBIN2s2SE9aS1U4?=
 =?utf-8?B?Ty85bWpWencvSzRicHMzYklsLzUzZHpkRUJ0MW9RNEhCUHNMYngvTXNZeGpI?=
 =?utf-8?B?ZmtFRWZPbmxjeDZ6VE9GNEtnUi92ZmRzNC81REp3MzFjZzRPcEc4dTBNbCth?=
 =?utf-8?B?U0U5cHo4ay9FNWdhZnU2dGk4YXpDOHFJdjc0a3JUVGhUYTRIcCtHOUtRMytu?=
 =?utf-8?Q?alYj09P6aZm5A2FvZFxScjFmB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31041DFEABE5284EB98E00DE0DBA5E52@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000af2c9-62e5-431f-c88b-08db0b7a86c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 15:21:47.7718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GewKeNbCuHkl+zN7gJYubUk+8N4AxpjG+TPxW/nL/qYFrt71WKyA+x2fCp4JK/LwiG/4hRyAOoq1gYhkGZXuijcsJOl18NH8VLZ2q4raOqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMi85LzIzIDAzOjMyLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFR1ZSwgRmViIDcsIDIwMjMgYXQgNjo1NiBQTSA8
Unlhbi5XYW5uZXJAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+IA0KPj4gTXkgbWFpbiBpc3N1ZSBp
cyB0aGUgcHJvY2VzcyBvZiBmcmVlaW5nIG93bmVyc2hpcCBvZiBhIHBpbihzKSBoYXZpbmcNCj4+
IGFub3RoZXIgZHJpdmVyLCBpbiB0aGlzIGNhc2UgZ3BpbywgdG8gdGFrZSBvd25lcnNoaXAgdGhl
biBmcmVlIHRoYXQNCj4+IG93bmVyc2hpcCBiYWNrIHRvIHRoZSBkZWZhdWx0IHN0YXRlLCBpbiB0
aGlzIGNhc2UgaXQgd291bGQgYmUgYmFjayB0bw0KPj4gaTJjLg0KPj4NCj4+IEkgaGF2ZSB0cmll
ZCBjYWxsaW5nIHBpbm11eF9kaXNhYmxlX3NldHRpbmcoKSBhbmQgdGhlbiBjbGFpbWluZyB0aGUN
Cj4+IGdwaW9zIHRoZW4gZW5hYmxpbmcgdGhlbSBmb3IgcmVjb3ZlcnkgdGhlbiBkaXNhYmxpbmcg
dGhlbSBhZ2Fpbi4gVGhpcw0KPj4gY2F1c2VzIGxvdHMgb2Ygd2FybmluZ3MgYW5kIHNvbWUgY2Fz
ZXMgdGhlIGZ1bGwgb3duZXJzaGlwIGlzIG5vdA0KPj4gdHJhbnNmZXJyZWQuDQo+Pg0KPj4gSXQg
c2VlbXMgdGhhdCB3aGF0IEkgYW0gYXR0ZW1wdGluZyB0byBhY2hpZXZlIGlzIG5vdCBkb2FibGUg
Y3VycmVudGx5Lg0KPj4gSXMgdGhpcyB0aGUgY2FzZSBvciBhbSBJIG1pc3Npbmcgc29tZSBleHRy
YSB0aGluZ3MgbmVlZGluZyB0byBwcmVwYXJlDQo+PiBmb3IgdGhpcyBhY3Rpb24/DQo+IA0KPiBU
aGVyZSBhcmUgc2V2ZXJhbCBvdGhlciBpMmMgYnVzIGRyaXZlcnMgZG9pbmcgdGhpcyBhbHJlYWR5
LCBmb3IgZXhhbXBsZQ0KPiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+IA0KPiBUaGUg
aWRlYSBpcyB0byBoYXZlIHNvbWUgZGlmZmVyZW50IHBpbmN0cmwgc3RhdGVzIGFuZCBtb3ZlIGJl
dHdlZW4NCj4gdGhlbSBleHBsaWNpdGx5IGluIHRoZSBkcml2ZXIgdG8gbW92ZSBwaW5zIGZyb20g
aTJjIG1vZGUgdG8gR1BJTw0KPiBtb2RlIGFuZCBiYWNrLg0KPiANCj4gVGhlIGlteCBkcml2ZXIg
ZGVwZW5kIG9uIHRoZSBhYmlsaXR5IG9mIHRoZSBpLk1YIHBpbiBjb250cm9sbGVyIHRvIHVzZQ0K
PiB0aGUgcGlucyBhcyBhIGNlcnRhaW4gZnVuY3Rpb24gYW5kIEdQSU8gYXQgdGhlIHNhbWUgdGlt
ZS4NCj4gDQo+IFRoaXMgaXMgZHVlIHRvIHRoZSBpbXggcGluIGNvbnRyb2xsZXIgbm90IHNldHRp
bmcgdGhlIC5zdHJpY3QgYXR0cmlidXRlDQo+IG9uIHRoZSBzdHJ1Y3QgcGlubXV4X29wcyBzbyB0
aGF0IHBpbnMgY2FuIGJlIHVzZWQgaW4gcGFyYWxsZWwgZm9yDQo+IGkyYyBhbmQgR1BJTyBhbmQg
Z3Bpb2RfZ2V0KCkgd2lsbCBub3QgZmFpbC4gQnV0IHRoZSBBdG1lbCBkcml2ZXIgZG9lcw0KPiBu
b3Qgc2V0IHRoaXMgc28geW91IHNob3VsZCBiZSBmaW5lIEkgdGhpbmsuDQo+IA0KSSBhbSB0cnlp
bmcgdG8gZW5hYmxlIC5zdHJpY3QgaW4gdGhlIEF0bWVsIHBpbmN0cmwgZHJpdmVyLCBhbmQgdGhh
dCBpcw0Kd2hhdCBpcyBjYXVzaW5nIG15IGlzc3Vlcy4gSSBoYXZlIHRyaWVkIGEgc2ltaWxhciBh
cHByb2FjaCB0byB0aGUgaW14DQpkcml2ZXIgYnV0IGl0IHNlZW1zIEkgY2Fubm90IHRyYW5zZmVy
IG93bmVyc2hpcCBjbGVhbmx5Lg0KDQpCZXN0LA0KUnlhbg0KDQo=
