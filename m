Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600A662F748
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 15:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242320AbiKRO1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 09:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235311AbiKRO1l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 09:27:41 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3233EE36;
        Fri, 18 Nov 2022 06:27:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKIYq+4MYEd8dg2Jo/XY1WzTGgPT1mEelcHpJ6kaMFWiT7RZc5qzNNBmzudR8ewMACsS0V/AM0H1rm771HxOrXGT6R2C4YYR0VFSeGKM+jeOqoQQLEV7ZTGmMikhrI+LgE+vtBUsoNzLEG32nOUj1qlgfj8PUFD7kdcwfW8wL/Ctl0eEJuFyikAbcnouiFo0cbMyEVzowv62aTSB5IgH32Wlo6RvFIJTtaiE43E7P+BzkseHqATWrvf/kJkjqjNhxoOD7PbH6l/isRG6OubLl9Qzuno+L2YOTWFCkMVtcCqah8lZh8osenf+Bd8cZ5xiQdsGr8dRjVkfTeLJXDGD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBUf5v/IBusKmvrsuCSNbCIH3jR9rVjozPOrkiA0b4k=;
 b=E0+TP2iv1Hls+hCuZO1l2AuXpB7GST2qZnLDjRbOMyCeYiPqbz2dmCkWlY8+aed2SjEn6TRByZWWmb5DPgToVmb5T7Wpvc/SaccEy9lfdg1uBPy6I3IduBW+hz50DwYWAW7Zef3yA0TNdvdaJm1gpGeOkCKb9BAHUoPBikRfx5yssqfeOJ+HM5MuUSiS8niEGHIkbhY7UulysLEz/NIZlDS5kXP7fqUkWaU6taDvW7OQYe4rm7xuw/KtbT146UjmEB1w5p3Z4MLe6GthWekS6eFbc6mlPtTOAmBVxs9C6DQsLBLI23Qq1BJSkMAgHHHZjLc8XDXk579nmUjqb0yskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBUf5v/IBusKmvrsuCSNbCIH3jR9rVjozPOrkiA0b4k=;
 b=Bi13vwIyyO6EZyNwp2zaO7wlGFW0Mz4Leir8tdlKECdPfG1C4wf1t+9Y8Y8iZEbgqHlTpInJZxX2AeGa6r6ri388mJZxZ4+VlZbJfNj2SuDtag+3gxGHeEZdklaEYVsLFve9Ks59TNjd+J340LsnL0+ZZBPDbmdN+B/pRNKbNceUw4sFYZZpEE+ZKD1JJ/bUKJiXbdcuWpb8igfM/py2DmPjPMMRN/dEKdWEgNI+XkKBGdtQ5XRFjSeefMbApedCpMQWfhcUtVoG5g7YcP6zhvsTnGCshBueXA71sCbauOl7s5VJchvZQYD0iEV75YHHo+kJ81lo52JLnk1D9FNBcg==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by BN9PR12MB5068.namprd12.prod.outlook.com (2603:10b6:408:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 14:27:38 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::244a:447b:4e36:690a]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::244a:447b:4e36:690a%3]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 14:27:38 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "digetx@gmail.com" <digetx@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        Zubair Waheed <zwaheed@nvidia.com>
Subject: RE: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Thread-Topic: [PATCH] i2c: tegra: Set ACPI node as primary fwnode
Thread-Index: AQHY+mwKxS/l0UqdfEGsFVE55UjPoK5EbkoAgAALLQCAAA1mgIAANvgA
Date:   Fri, 18 Nov 2022 14:27:38 +0000
Message-ID: <SJ1PR12MB633990D5330F8D320A08BC71C0099@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20221117100415.20457-1-akhilrajeev@nvidia.com>
 <29db0e24-4f7c-e3dc-91ce-2decf6a253a5@nvidia.com> <Y3dcDCgC42QcMX3k@orome>
 <1edbceed-e5a1-460e-25a7-08f299e11c35@nvidia.com>
In-Reply-To: <1edbceed-e5a1-460e-25a7-08f299e11c35@nvidia.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|BN9PR12MB5068:EE_
x-ms-office365-filtering-correlation-id: e3d5c93d-67a2-4b72-89aa-08dac9710b56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Db7xYZTwkUbWNnx297TUeGrbhbVc2VFsjMDjAQe4HIpu19w3hYKqcOPFDgbUPYiBul/YZ0M2Aj55Hn0al4VdPkzXYH9ibXvC+G1QGRl099OFJMnsnzbyad6N+HG35n8sn2zRrBAD49CuQ4xKSc46hxILY7BMi1pEvSbUMKS0ezajVg0JpavUbzacPlUL5CXZRlpLdbI/2+oxFWc+XqBc7nuoR3M1pXmyDNEr6PIG+aMZa1m0sTV3PmSArpk38J+MdeTb0tAyaE77mA+4X3BbSTg6Kaeo6Q2PrI0nMObd4ymQh6PFXEpBtfm3VnmGBNjmce+tmFLfJlEyk4jPs2avT+nWucy9K6OhCBdJj/ugpeJjjCsfCFvG8RzHRxwhUXafSLC1w9U8qp3fuZpPB+Qt6+8DaKTUdIqzpJqivdC6jAqmDd2awpj4Jb2ZafvXyAmnChhSL/TkK4f7K1tj2JOtJtoEAQBnyvobY8ACCrv8DhEwNfgUV2mODy7orzyedYGgIwqxEQgsen7t6ig4vW93qRd0ge9lR8nBfnUe9dmBIqFIxVmlaaqbIPMSMyL2YmBwaZRsw9mP3iXu+gTiaQviNaaOGOwbcHxuB/++G1y7toj0cNamvjPE93WhWv5AgEPdkuwXYbpxA1owl1Jmbg9GRhYJRRm/DGmc+EMrlgtA3lE9YBN/3wzLIu2JulQ1dBaHQfbVwD2hGjJjEy9URxdlmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6339.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199015)(86362001)(33656002)(52536014)(122000001)(8936002)(5660300002)(2906002)(83380400001)(186003)(38070700005)(54906003)(66446008)(110136005)(4326008)(8676002)(76116006)(66476007)(38100700002)(64756008)(55016003)(66556008)(316002)(478600001)(7696005)(41300700001)(53546011)(66946007)(9686003)(26005)(107886003)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2txdDFwS24rekdoNkQ3RjV2OW1yRUpqRFJQdnJWWUNiWTBFVjZhOWpVdFJp?=
 =?utf-8?B?WmtEVVpia0dwNW1wZ2x4azA3eUpVU0tobjhKN2w3M3VLeDIrV1ZjZ2NHN3Ro?=
 =?utf-8?B?M3diZ3d0akpocWFHSjE4T2FEeWk1Z3VCMjFtWGk4TTdpbjhRM2ZvVmpoVG45?=
 =?utf-8?B?MDc3cmpkaC9YS1M5aWo1UENMV3NxOGZoZncvYU0rbENvY1dTa2FVUzJ2K2tp?=
 =?utf-8?B?aVA4QmNabWQ2UkliZk5zV083NFZ4OFlyMERUWmpxdmpGeVJKQTV1UWVjUFRv?=
 =?utf-8?B?OXM4UC93WFQ4SXkzWjI2RFNnUEZ2eGVBbFFYM0EvQzZGdERaejZQbnUrK0lo?=
 =?utf-8?B?RWsrQlVBK2ROc0JjMEZaNjFtQS96ZU43M2lvWVhKNFUvTnZ0WmFVSjJwNHJP?=
 =?utf-8?B?OWJwNjJ3Z0V1dTk4cWU0MUo5N2ErUkN4Syt2TS9JRW5lclJZNHpiUXJ1MnV6?=
 =?utf-8?B?RytqZzFXQ0tYa2FHVHpYRDRteVBSSHJoK1hxaUNpN1gydnZKdmQyekc3UjBX?=
 =?utf-8?B?Z1FnOGhTd2wvMmlodWpHVDZrdGdKUDJkTjh2d3kvU0JZYlp5Wmd4a3I5VFRY?=
 =?utf-8?B?TlY3VXpNS3RINTNPQzNHUW84M3VYUGxWek8vUjJLWm1oTXZkVElxbExidnl1?=
 =?utf-8?B?dE1makZZU2FZWTJiNllKQmVaS0xXZTRacWJWdkkvVFpTdVFDM1IrL25ycEFR?=
 =?utf-8?B?dWgyQ2IrVUZoUXAzalNoaWVHem1qaVBzTE00bks5dTRDdFVQdWc3ekpMN1lO?=
 =?utf-8?B?ZGxJUW5XSjdxcit1QzY1Wk8yN2FhSWc0TXJqK3Y1UDlyTmNuWk8rUEtERzZm?=
 =?utf-8?B?Y1Jld2NCTWJVZHdGVjRTWmZWZTh6ZVVxaFdCRDU1UjBkcHBpOXVEajBoQ3Z0?=
 =?utf-8?B?Y1ZuWUxLSk0rL2VQN3pkTHJrSG9IZHlGUWdQS3E2YjVsMDZyY2JnUGdEYUFO?=
 =?utf-8?B?TW5GRTJaTHg2enNxenZxdnNqaGN1Uy95TThhTXF3ZjV4STJJa1JvQ1RzMjdU?=
 =?utf-8?B?eHRuSFRySHFiZnZaejdaRFlxS05SemMvNmVLQndyNnBpM244Y2dBUWt0a1dj?=
 =?utf-8?B?dEl6aUNSaDRxTkJhTVBNMERvdlF4TzNDSlhtNWFlbDlmM3hhUTJXVGZ4YjZD?=
 =?utf-8?B?ZkR3NDVzcVE1TDAyd2dFRHNOUWdYMDBJMXg0YzliUU1La0dBTld3SE5zVlBG?=
 =?utf-8?B?RTYvcHBzZERRcnZQWHdhQXpXakRJWksya0VtSGFKTUJ2OTZUN0RMWnNWZjhT?=
 =?utf-8?B?aU1qcWxWUnNRdXdBL29VM01KVHZSU2pPQ2dOQUs5Tkpjck9lbHh4V2tERVhT?=
 =?utf-8?B?OVkycUdUdnBDL0ZScVFtZWd1anFDdzFpcmIvLzRxWVFRWTJGQklPUEpsZ2ZR?=
 =?utf-8?B?a0czWEZ2STViaFBpS21MUUw4Mk9zekdMVlZJYndNMXM4eCtla2ZRcHJmTkNm?=
 =?utf-8?B?UEJ5eEwwbXB4Y2kyOW10bE9RM25NbzBLWjMxT2FHcGlCaUs1ZWpuMjdvMTlM?=
 =?utf-8?B?R2FXNUJ0Vnc2ZmMxc2E1Qlp1MlY3ZGd6OWwvbzJQZ3V5ZVl0QzhEUFVjUzg0?=
 =?utf-8?B?bk1ZL1BzQVFaTncxQ1dONW5sMDlxRzgzS1huZGVVVU1mS3g0bWl4akxLM3hj?=
 =?utf-8?B?T2tpOU13MStLa2pUMElYckxid01BT2ZoMkJKTGpxTVBBeWNRcXorcEVwcGh1?=
 =?utf-8?B?bGY0ekR5eWhNNUNtVDlaRG52VjNHSTJwUGZldGVDcXB4VTZOZWhscDdKQzl1?=
 =?utf-8?B?L0JvRFJZdjU5Q0xnVkhyUUxtZEJsOWo5NFF1Q2RlRWhtMjV3OG1zdzhENzRp?=
 =?utf-8?B?ellzTkdwRDduWWV4Q3FMdFR1dlUzR2RIbVk2OTc4aC92alFhV3FlSkxYaGY0?=
 =?utf-8?B?dXBTWWk0RzBFdnFmS25Lb3g4KzZQTmR3ZGdoZlRIVWprbnltYkhMQ0ltSmRq?=
 =?utf-8?B?RjU3em9VSkQvOEJYK3phNXZEY1BLbmErL09mb2xHamFkK3QzT3NUOWJBMGhJ?=
 =?utf-8?B?Zyt6WklReW5SWkppQWZiOXFzT2lpbUhUSGlpOExaajBia0ZxckQySGxpdGVa?=
 =?utf-8?B?QWdTcmJoL1AyT3l0YWNZWE9HSDZjYnpCYUxIUTVrTkdwck1rNEtYSjYyQ0pO?=
 =?utf-8?Q?Z1u2CQS8chzScpkNrxGJaJxe2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d5c93d-67a2-4b72-89aa-08dac9710b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 14:27:38.4898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYCOQjQjk2C3FRS4dqa4Es6f1dXYgBdfn5WH/d0O/sUSqTDDReD7k9A3uqA24FxEMZRMDeK5j8Gx5tD5b+5h7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5068
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiAxOC8xMS8yMDIyIDEwOjE4LCBUaGllcnJ5IFJlZGluZyB3cm90ZToNCj4gPiBPbiBGcmks
IE5vdiAxOCwgMjAyMiBhdCAwOTozODo1MkFNICswMDAwLCBKb24gSHVudGVyIHdyb3RlOg0KPiA+
Pg0KPiA+PiBPbiAxNy8xMS8yMDIyIDEwOjA0LCBBa2hpbCBSIHdyb3RlOg0KPiA+Pj4gU2V0IEFD
UEkgbm9kZSBhcyB0aGUgcHJpbWFyeSBmd25vZGUgb2YgSTJDIGFkYXB0ZXIgdG8gYWxsb3cNCj4g
Pj4+IGVudW1lcmF0aW9uIG9mIGNoaWxkIGRldmljZXMgZnJvbSB0aGUgQUNQSSB0YWJsZQ0KPiA+
Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFp1YmFpciBXYWhlZWQgPHp3YWhlZWRAbnZpZGlhLmNv
bT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIgPGFraGlscmFqZWV2QG52aWRpYS5jb20+
DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDEg
Kw0KPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4+Pg0KPiA+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+Pj4gaW5kZXggOTU0MDIyYzA0Y2M0Li42OWM5YWUxNjFi
YmUgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXRlZ3JhLmMNCj4g
Pj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiA+Pj4gQEAgLTE4MjYs
NiArMTgyNiw3IEBAIHN0YXRpYyBpbnQgdGVncmFfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UNCj4gKnBkZXYpDQo+ID4+PiAgICAJaTJjX2Rldi0+YWRhcHRlci5jbGFzcyA9IEkyQ19D
TEFTU19ERVBSRUNBVEVEOw0KPiA+Pj4gICAgCWkyY19kZXYtPmFkYXB0ZXIuYWxnbyA9ICZ0ZWdy
YV9pMmNfYWxnbzsNCj4gPj4+ICAgIAlpMmNfZGV2LT5hZGFwdGVyLm5yID0gcGRldi0+aWQ7DQo+
ID4+PiArCUFDUElfQ09NUEFOSU9OX1NFVCgmaTJjX2Rldi0+YWRhcHRlci5kZXYsDQo+IEFDUElf
Q09NUEFOSU9OKCZwZGV2LT5kZXYpKTsNCj4gPj4+ICAgIAlpZiAoaTJjX2Rldi0+aHctPnN1cHBv
cnRzX2J1c19jbGVhcikNCj4gPj4+ICAgIAkJaTJjX2Rldi0+YWRhcHRlci5idXNfcmVjb3Zlcnlf
aW5mbyA9DQo+ICZ0ZWdyYV9pMmNfcmVjb3ZlcnlfaW5mbzsNCj4gPj4NCj4gPj4NCj4gPj4gRG8g
d2UgYWx3YXlzIHdhbnQgdG8gc2V0IGFzIHRoZSBwcmltYXJ5IGZ3bm9kZSBldmVuIHdoZW4gYm9v
dGluZyB3aXRoDQo+ID4+IGRldmljZS10cmVlPyBJIHNvbWUgb3RoZXIgZHJpdmVycyBkbywgYnV0
IEkgYWxzbyBzZWUgc29tZSBvdGhlcnMgLi4uDQo+ID4+DQo+ID4+ICAgaWYgKGhhc19hY3BpX2Nv
bXBhbmlvbihkZXYpKQ0KPiA+PiAgICAgICAgICBBQ1BJX0NPTVBBTklPTl9TRVQoJmkyY19kZXYt
PmFkYXB0ZXIuZGV2LA0KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQUNQSV9DT01Q
QU5JT04oJnBkZXYtPmRldikpOw0KPiA+Pg0KPiA+PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGtub3cg
d2h5IGl0IGlzIE9LIHRvIGFsd2F5cyBkbyB0aGlzIGV2ZW4gZm9yIGRldmljZS10cmVlDQo+ID4+
IGJlY2F1c2UgaXQgaXMgbm90IGNsZWFyIHRvIG1lLg0KPiA+DQo+ID4gQUNQSV9DT01QQU5JT04o
KSByZXR1cm5zIE5VTEwgaWYgdGhlcmUgaXMgbm8gQUNQSSBjb21wYW5pb24sIHdoaWNoIHdpbGwN
Cj4gPiBjYXVzZSBBQ1BJX0NPTVBBTklPTl9TRVQoKSB0byBzZXQgdGhlIHByaW1hcnkgZndub2Rl
IHRvIE5VTEwuIElmIEkgcmVhZA0KPiA+IHRoZSBjb2RlIGZvciBzZXRfcHJpbWFyeV9md25vZGUo
KSBjb3JyZWN0bHksIHRoYXQncyBlc3NlbnRpYWxseSBhIG5vLW9wDQo+ID4gZm9yIERUIGRldmlj
ZXMuDQo+IA0KPiBZZXMgaXQgZG9lcywgYnV0IGRvZXNuJ3QgaXQgaXMgbm90IGNsZWFyIHRvIG1l
IGlmIGl0IGlzIGEgZ29vZCBpZGVhIHRvDQo+IHBhc3MgTlVMTCB0byBzZXRfcHJpbWFyeV9md25v
ZGUoKS4gSXQgZG9lcyBzZWVtIHRvIGhhbmRsZSB0aGlzIGJ1dCBteQ0KPiBiaWdnZXN0IGdyaXBl
IGlzIHRoZSBsYWNrIG9mIGV4cGxhbmF0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSB3aHkgdGhp
cw0KPiBpcyBPSy4NCkkgc2F3IEFDUElfQ09NUEFOSU9OX1NFVCgpIGFzIGFuIGVtcHR5IGZ1bmN0
aW9uIGlmIENPTkZJR19BQ1BJIGlzIG5vdCBzZXQuDQpZZXMsIEkgYWdyZWUgdGhhdCBJIHNob3Vs
ZCBoYXZlIG1lbnRpb25lZCB0aGlzIGluIHRoZSBjb21taXQgbWVzc2FnZS4NClNoYWxsIEkgc2Vu
ZCBhIHYyIHdpdGggdGhlIGRldGFpbHMgYWRkZWQgaW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbj8g
DQoNClJlZ2FyZHMsDQpBa2hpbA0K
