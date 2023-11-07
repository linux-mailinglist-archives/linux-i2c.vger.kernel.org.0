Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D49707E3399
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 04:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjKGDI5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Nov 2023 22:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232978AbjKGDI4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Nov 2023 22:08:56 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2055.outbound.protection.outlook.com [40.107.117.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DFFD6E;
        Mon,  6 Nov 2023 19:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdGucYIcL0AkQEL8P23Ms4R+APQA5WaGxjB35eZ3kVXKzI4aYgv6cZmXtuJ+pJne/u1IXdaWmifadjKWVjkifeCdF6ioTVJM0uETUsxt/OzX5cbnlTi4CPb0pERfEMWM4eAwiXZMJMe4sATcXXYKVQVC/eupvFD3CeheDHjjGlPq9AJdd7gvnOmtUXOLbnW0AZARu/QMl93mwaqFO9hW4kgAQv/9e5VLB+1ffOjD6E2XPkNWEYorfAFLj1zI1jT4iQu9VUnUqWzJcxPG9+zEFMH6Ej+OJbPId0Z7M7r1jrEQL73DrFpSN+9Ou/p5l30CX+0BzAGnHn9q5NGa1ZCDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Af+BL1p1gcXZw2cV/LSa6A3k4hUSQvD3UA1FZDa78Q=;
 b=MI7qBXf/edI0SOtUgP2iiblIRYFj373F7jPW0QrKTGYwDU6txrwbMt3AGU4Zuu9zVb0XDuoJ/OTjSRntetXMTmSoDibHyc9rlNrD2xD8aV8dozEFbSmr6UxxbuTDql7mlRwA3eaLNOL24hgYq3ZRg+vsE4SecrvY1wPNSD3JzPrdFKfwYuwqUpL/pu6YLrsRR7YaWQPDasvq7rvkBJWNUCV/Q126pPbx2QRQ767qf6qV51k6Z/zwn9vr3D+vR0iaCm/PYnVF0IWZsOLwdpQBtQYIg/i5rvDBpypsriWjTc1bQLWWe2Ap4ABp6qyx3hlWxY4XGYzekHTWtIjTckZNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Af+BL1p1gcXZw2cV/LSa6A3k4hUSQvD3UA1FZDa78Q=;
 b=lc47Fa5xE3qc4c2TqwF0iLfksvYDJydmiPS9XW231O8z7K7VrMpS4LMpIbANz7G8J0nvF99F815vUR8iZuECWZ26urXTZWR13KDnQPp6E6LKccNFxDopJo38N846trBWsGsrvQSij52c9gx+SNRZ9800DRiySKkjKo6EwbfD2T6mpEQKVfm7CPOGV+6mVBK7Zuz51d80mJMOaE2e50IXAyBm317bTqzN9/+5VwjGsGk3QY9KDGFXwEiCz91u9Nu8iPFQutW3bUrX3QCiHWVyUcNwWQMZK05aYsbVuVKRctBkKHPk3aTlS0aJUPOdlyrL89rV7dfHjx4twNQvJ0xHpA==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by TYZPR04MB6714.apcprd04.prod.outlook.com (2603:1096:400:33f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 03:08:48 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::4c7a:8fd8:1527:9287%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 03:08:48 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index: AQHaB+TGZscXMUpHJES8eSDx4MdG9LBcQtiAgAczeDCAAHtcAIAKS76g
Date:   Tue, 7 Nov 2023 03:08:48 +0000
Message-ID: <SG2PR04MB55436CFA902895FD5472838AA1A9A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
 <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
 <SG2PR04MB5543FEAFC1777ADE29239AC9A1A0A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e223764a-c081-4634-810b-56886a29804a@roeck-us.net>
In-Reply-To: <e223764a-c081-4634-810b-56886a29804a@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|TYZPR04MB6714:EE_
x-ms-office365-filtering-correlation-id: b3bb1682-4d32-4ee9-28d5-08dbdf3edca5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zRAfVBn/Qr7U5J3wzxKErFbtgSx6y9wzPk0yERJsq6CSvnEec9/7ZGzLkKLXY0Z21tMlCa7vLmzIpTB4F+8jvFXAauElk3Rx9ncW8FP8MBuSYgkYYdGsh/mbnCipObvfVn1si9QRjhMsQheHwBfJbFHXhKlBlIdmBXPCRoC1pAL6mdb7ihMHa9CVOjuvj5vrzrDed/SUWEseE3XiVkyCngnVMJOZz6KTg9bMDUfg2BwmnSHZSS3PGg9Zu56kNc7kiVyiMn+G6pnkzhViLz9UBHR8+VpKvxFimA8f0lAltGYT2g5WkXdtdZuXHLALSpEp10ACKr4LhNex/3TKy9gMGgUDTEY6LiVT3mqyF6BMDAfRo1J87hk/Qj/JBsP3t3m95AGHtHZidvJZ2RTpdMQ2MkA7xwrO1tjmqLUZ418EZEpXYLY6I7oxJl4OpqQxHETXouTHyxIbASNYKcRTq4TQt7XyF0JTQs+qSTHW41ZG9JTHurD/ZuQLhBPs7Jt8SQ0TOBVQWFI1sfb3wGXwrFHnV1AWNQ1+q4EVixA1Fpq6ynfBcjFD9gts+ZZaV+v9QmJ6n1qyTktTQNjXPTrqMs3Dqd3lWoSlUo0z0aZYm1jF9gqwVGxmfchof8/Ct2z2835a5sB2uK3jTL82IsW8V6eKkQKv9XgTYXUeoN5zo5vWlzY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799009)(451199024)(186009)(64100799003)(7416002)(55016003)(53546011)(7696005)(9686003)(6506007)(26005)(52536014)(38100700002)(122000001)(41300700001)(33656002)(86362001)(5660300002)(71200400001)(2906002)(8936002)(4326008)(8676002)(83380400001)(38070700009)(478600001)(66556008)(54906003)(66946007)(66476007)(76116006)(66446008)(64756008)(316002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjBnMS9CTUxPRVhGMzNlbDFkNnJZMFFXbHhZWWhwOEw3UFZ0bW54K3RGR0tW?=
 =?utf-8?B?YW84ZlJtUG05YW5SdUt1TzdKMDg0WWxwcSs1K3A4amFFS1RnRGFzUWRzQVRu?=
 =?utf-8?B?MkVoYkpEN2NRb0R3MlZjMVlTbzlZQkRYbUdZZmg1alUwN1d6N2Yrd2RzQVVj?=
 =?utf-8?B?WmFNcHpta2JubWxEd2I1N3dZdDAveTZIdmFLNzh5NEkzcktoWUZzZDV0SGJp?=
 =?utf-8?B?VVhkdTdraFNHaGJ1NkpHMFlJNEJjb29maVlZMFFEU0wrS0hmbFVLdFlJN3Vn?=
 =?utf-8?B?SllHbzhLYWFFdHA4MkZ0RHFxa2x4UFYvenE0eG5KTVlyK01xVjNLMFAzZTBG?=
 =?utf-8?B?MTZlV2dBekRFZkpmS1h6NVVONG5qOXIzZHZZekdvVjhPK1IrREpzR2RRYlBw?=
 =?utf-8?B?d0RrVUpVMkR3ZXJEeVcxSWRoUTVtVkU4WURrVEtMTXl3dkxzK2pPQ0NzeVVR?=
 =?utf-8?B?MnBBMjIvTHpFdllBYUtSZmZ4d0c1dlNkUENqY1JLRm52Uzk0ZWNXWllHbTZJ?=
 =?utf-8?B?V2picWdqeVhPMVdxZ1RteFpubUppL1BpakFaRnFJa3lmOUFBL1VGdnZFU1JO?=
 =?utf-8?B?eGNZcVRQNVdYellpUG05MVFDVUt4MlBHQWo5cWthS1FTMUJwYmk2UFRMbTNF?=
 =?utf-8?B?c2VXNCtVbnY1bU5MT1RjcnNnTnEvYlF2SFk3SExnMytDeUdQd2xCdDBTZlQ1?=
 =?utf-8?B?R25lTndxTnlKWlRzdWtpdnIwL2NYUW5RMU90OTRTcmFLeXEreFA5VjZSTW9K?=
 =?utf-8?B?L0F6MXlTSTlKYUpRNDhJNmR6Z1U4Wml5eHllZGtqTWlLUHovaUZmL0FvN0JF?=
 =?utf-8?B?d3JZb0IxMlMraDh5MklrQks5TmluRFdpcVVZYUxkUUV6ODhZcVhGUE1NQXU5?=
 =?utf-8?B?Tmd0OXVJSHJvYkU4NHlRZ2tiMU9EVUFQT3UrZkNNa1d2M0EwR3JnVnJ2MVJu?=
 =?utf-8?B?NXdVZXc3d1VvUzlBdVh4WkQrSWppcDdQS1ZnWWhkUWVwVFJTZWRBUWNVblht?=
 =?utf-8?B?ekI0NHpOemlFUmdvTGl1bTBVRk9RbXU0ZWk0QkJBcVU0d21XQnNqdUdqUENT?=
 =?utf-8?B?eFN0akM0THhtaEhjYkE0NitlY0R1cmFsVlZmeE1MRmNhTklkelBrQ244NWJD?=
 =?utf-8?B?TTJ5MTE3RjBpc2VGMHlIdGNvMFVhV2x3bnFyb2pZNFMzdlh5U1NvQk9rRDg0?=
 =?utf-8?B?NDg5K1lBSDVKS2ZTRGZWWEtGUHJkVVVEZG1OR0dKSmtZQXZCWmo2TGFEWURC?=
 =?utf-8?B?N0wwZ0RJZmlkMFo1Ui84bUlKZ3hUdHdhejg1anpKaW9tc3g3S3ZsaEJMS1Zx?=
 =?utf-8?B?UmxNS1BlVlN5Vittclo3Z0lRZlBBdFFjb3ZVaEVRZ0U4bnNDbTVsWGs5UDV3?=
 =?utf-8?B?Q2p3cjhlZEdMR0htSVUxRUhiM1VVajlHckdPaTg5L2JuVEk1dXhyU2Q2YmNa?=
 =?utf-8?B?d0ZoeG5zZVVtMFZ5YTdEQzlSdnh3djdlSjN4cktSYm1TQ01IVTB6NnhmZlpT?=
 =?utf-8?B?SDZFVkdReXY1djROOVpCZFQya0NHR3BPa053UnNVaXJxRWNSYXZ2TnVZNFZu?=
 =?utf-8?B?Q3FiYUxaVDNNMEJOUHlwOXBsL2RibFBqdHFQZE1ZemI3VGZXdmRHMGIrbWU3?=
 =?utf-8?B?VlczZzExL1NRN1N2NXQxVEtuamFIYkg0QmQ0Si9DWEFzQUVIS0JEZVpPWDBj?=
 =?utf-8?B?NTFnR1dURVdZa3N5K0tKTWxyOW91Q29Oa2JTTHUzOWR4MU9zN2dRZmcvczFI?=
 =?utf-8?B?VHNLRStGVmlBWHBFaXFnWkZFMkdjbkd3cUFSbWhLcnNTV0w4Z0phWUVxeWdy?=
 =?utf-8?B?MUMzMlhMalV0NzZqbU9PMGdjSTV5UEpjNGxqblRtMkZiUmMzazN5ZU5UYTRE?=
 =?utf-8?B?UnlBNTNHY1NWSWg1MGN6d2tnWlBMSlU3NVNjaHo5QTYwSnAxcmlPTzZrejFH?=
 =?utf-8?B?QU1zdkpSZGZ4YVJiSkJjQ2FEOGFKMDVGbktqWWpxRDNtNnY2Z0w1S2hzUXBq?=
 =?utf-8?B?TmYrT1AvRlhBN2FMbmdwcC9VYkR3THdwV3ZwWXBYbXIxeTNTM2JHa2tCSll1?=
 =?utf-8?B?ZVR3ak5SMWdZSHMrdHdsaXFKekZYdHFPUGRtTjQ4RDFxVUdDSXBnVnlnbTBi?=
 =?utf-8?Q?GhnQhRV8F3/H8/xtnKr97WFcj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bb1682-4d32-4ee9-28d5-08dbdf3edca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 03:08:48.5423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3iReToqB5zkM8wujyPCwd7AHVeQkC/SKTKZ//E5K8b95uvk4CzBttYr/voyCm4S8+GBZDVbiXR59zIm5HLa2Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6714
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVHVlc2Rh
eSwgT2N0b2JlciAzMSwgMjAyMyA5OjQ3IFBNDQo+IFRvOiBEZWxwaGluZV9DQ19DaGl1L1dZSFEv
V2l3eW5uIDxEZWxwaGluZV9DQ19DaGl1QHdpd3lubi5jb20+Ow0KPiBwYXRyaWNrQHN0d2N4Lnh5
ejsgSmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmNvbT47IEpvbmF0aGFuIENvcmJldA0KPiA8
Y29yYmV0QGx3bi5uZXQ+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsg
S3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3Jn
PjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsNCj4gbGludXgtaTJjQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtZG9j
QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gaHdtb246IHBt
YnVzOiBBZGQgbHRjNDI4NiBkcml2ZXINCj4gDQo+ICAgU2VjdXJpdHkgUmVtaW5kZXI6IFBsZWFz
ZSBiZSBhd2FyZSB0aGF0IHRoaXMgZW1haWwgaXMgc2VudCBieSBhbiBleHRlcm5hbA0KPiBzZW5k
ZXIuDQo+IA0KPiBPbiAxMC8zMC8yMyAyMzo0NiwgRGVscGhpbmVfQ0NfQ2hpdS9XWUhRL1dpd3lu
biB3cm90ZToNCj4gWyAuLi4gXQ0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzIoY2xpZW50LT5kZXYub2Zfbm9kZSwNCj4gPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJzaHVudC1yZXNpc3Rvci1taWNyby1vaG1zIiwNCj4gPj4g
JnJzZW5zZSk7DQo+ID4+PiArICAgICBpZiAocmV0IDwgMCkNCj4gPj4+ICsgICAgICAgICAgICAg
cmV0dXJuIHJldDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIGlmIChyc2Vuc2UgPT0gMCkNCj4gPj4+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4+PiArDQo+ID4+PiArICAgICBpbmZv
ID0gJmx0YzQyODZfaW5mbzsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIC8qIERlZmF1bHQgb2YgVlJB
TkdFX1NFTEVDVCA9IDEsIDEwMi40ViAqLw0KPiA+Pj4gKyAgICAgaWYgKGRldmljZV9wcm9wZXJ0
eV9yZWFkX2Jvb2woJmNsaWVudC0+ZGV2LA0KPiA+PiAiYWRpLHZyYW5nZS1zZWxlY3QtMjVwNiIp
KSB7DQo+ID4+DQo+ID4+IFdoYXQgaWYgdGhlIGFkaSx2cmFuZ2Utc2VsZWN0LTI1cDYgcHJvcGVy
dHkgaXMgbm90IHByb3ZpZGVkLCBidXQgdGhlDQo+ID4+IGNoaXAgaXMgcHJvZ3JhbW1lZCBmb3Ig
dGhpcyByYW5nZSA/DQo+ID4gVGhlIGJpbmRpbmcgZG9jdW1lbnQgdGVsbHMgcHJvZ3JhbW1lcnMg
aG93IHRvIGZpbGwgdGhlIGR0cy4NCj4gPiBUaHVzLCBwcm9ncmFtbWVycyBtdXN0IGZpbGwgdGhp
cyBwcm9wZXJ0eSBpZiB0aGVpciBzeXN0ZW0gaXMgMjUuNiB2b2x0cyB2b2x0YWdlDQo+IHJhbmdl
Lg0KPiA+DQo+IA0KPiBTdXJlLCBidXQgdGhlcmUgaXMgbm8gZWxzZSBjYXNlLCBtZWFuaW5nIFZS
QU5HRV9TRUxFQ1QgaXMgdW5tb2RpZmllZCBpbiB0aGF0DQo+IGNhc2UuIFRoZXJlIGlzIG5vIGd1
YXJhbnRlZSB0aGF0IHRoZSBjaGlwIGlzIGluIGl0cyBwb3dlci1vbiBzdGF0ZS4NCg0KVGhlIGVs
c2UgY2FzZSBpcyBpbiB2MiBsdGM0Mjg2LmMgbGluZSAxMzMNCkl0IG1lYW5zIHRoYXQgdGhlIHZv
bHRhZ2UgcmFuZ2UgZm9yIHByb2dyYW1tZXIgaXMgMTAyLjQgdm9sdHMgd2hpY2ggaXMgZGVmYXVs
dCB2YWx1ZSwNCnNvIGRyaXZlciBkb2Vzbid0IG5lZWQgdG8gZG8gYW55IGNoYW5nZSBmb3IgVlJB
TkdFX1NFTEVDVCBiaXQuDQpBZGRpdGlvbmFsbHksIHdlIGhhdmUgY2hlY2tlZCB0aGUgYmVoYXZp
b3Igb2YgVlJBTkdFX1NFTEVDVCBiaXQgd2l0aCB2ZW5kb3IuDQpCZWxvdyBpcyB0aGUgcmVwbHkg
ZnJvbSB2ZW5kb3I6DQpbT3VyIHF1ZXN0aW9uXQ0KSWYgd2UgY2hhbmdlIHRoZSBWUkFOR0VfU0VM
RUNUIGJpdCB2YWx1ZSB0byAwLCB0aGUgdmFsdWUgd291bGQgcmV0dXJuIHRvIGRlZmF1bHQgYWZ0
ZXIgd2UgcmVzdGFydCB0aGlzIGRldmljZT8NCk9yIFZSQU5HRV9TRUxFQ1QgYml0IHZhbHVlIHdv
dWxkIG5ldmVyIGNoYW5nZSB1dGlsIHNvbWVvbmUgY2hhbmdlIGl0cyB2YWx1ZT8NCltBREkgcmVw
bHldDQpjaGlwIHJlc2V0IHdpbGwgZ28gYmFjayB0byBkZWZhdWx0LiBUaGFua3MuDQoNClRodXMs
IHdlIG11c3Qgb3ZlcndyaXRlIHRoaXMgYml0IGlmIHRoZSB1c2VyIGZpbGwgYWRpLHZyYW5nZS1z
ZWxlY3QtMjVwNiBoZXJlIHdoZW5ldmVyIGRyaXZlciBwcm9iZXMNCg0KPiANCj4gR3VlbnRlcg0K
DQo=
