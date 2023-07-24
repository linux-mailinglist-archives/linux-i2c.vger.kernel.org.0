Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5145C75E991
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 04:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjGXCNd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 22:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbjGXCNV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 22:13:21 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::626])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A765448E;
        Sun, 23 Jul 2023 19:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZkSyJYevYR8MAoORPkmu2WuXVvxdndeFJYh7YxWU4k9WwAbox4741JwUEOjAIaYWhLmy3argNw0HqgrQ96caDU4dmm6f8+2uhZZYsVoxDGEKQm2t1y+HpA6KRyPWcWIHg5s9/R+qtGjYhBZupxiP6vRoQDyEmxzdtdOEcvmLJ3K7pNZWDLYC2HUtD7Hm0DGxzRL2bYd3QuWPVqx+s934zPw8/HufJiX16HY8LIsVivu4hG4xc9ZNGvhiIuIvXBH/CX11nCUY7xuiHQKCkK+6iP0vqdYbhVJXHZKRMc44/lwUa3Wgq8g1znaSRVIniiqyrApvbi50RXEtuhq/DzBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pamcQ9TxFrPQGMOxxIDcDQXFAmM6WSKR8pd3YmVpJTs=;
 b=KIkBFecfRUn0fCHi/KD41bqm0IFm6gHdmuyLjbaQWJ1sjgW6zkxstr5cGjYyD6DufiiLMXjsCF0L1067ZQvLdrtWMVPOCASJIhIwfhd8lUlBMr8si6skWFoqLIIQ7pWUOfAM5sMs5NKZ5KsC9o9F/zJKu3pX+N8pBoMrVozm5Ml39gu5WRDNQ2bN2uZGZZWOU/3dAjP2W/7Tg+Aj8Cz9fCyuaswjlB7OO05A+nXymhP/4Erv4lSZVQDktGr4v9eS2vrO3q7C3Y5r8zosUKfW4wQLEdXBYxr2jEq85qNYNr+cIWWRCScDnQgHE/javwlbJd2zy8pAkw0fjLgapjWBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pamcQ9TxFrPQGMOxxIDcDQXFAmM6WSKR8pd3YmVpJTs=;
 b=Vt99U5Ks2Bcx24OQcdEvJBbFyCmyyPYYl496nJvS+m01UZLphNB+RR5DqiehngaQKHYQGaVzpsb50MsMXaqtwWQYYcg+m6nPyCibZ3ize8z3QzsAWM5pfRpJ+7BAOK34szGT9fj9K8WIwC97Wuwk0f2qbKTDVDkk8NYLfagxXnvj8dypdB2sXMjqLIJs+LhAYLe2494TPW2FyaaxhbgJFXVPBf9d17C01FsHMcaT4BcR8RV6lLG7P4hj9jwrYvDUXy2nSs7xkdKs2x84ApPQrUXAFkhjZDPp0Il1yyzYwrunIN4t3vv+GWDDJAAGLUepMI4Ks+VkEKtCyWxV35O9oA==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by TYUPR04MB6963.apcprd04.prod.outlook.com (2603:1096:400:344::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 02:07:30 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 02:07:29 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Andi Shyti <andi.shyti@kernel.org>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Topic: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Thread-Index: AQHZdpWEijeHFPfanEysOeJB2LsOS688C0OAgAAGoACAjKchkA==
Date:   Mon, 24 Jul 2023 02:07:29 +0000
Message-ID: <SG2PR04MB55437958DA809DE1B23970DDA102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
 <20230425134537.pzsplcpkrog2552r@intel.intel>
 <ccbced2f-0258-cfd7-2f91-e246dadae8fb@roeck-us.net>
In-Reply-To: <ccbced2f-0258-cfd7-2f91-e246dadae8fb@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|TYUPR04MB6963:EE_
x-ms-office365-filtering-correlation-id: 0b36a004-4483-408e-1d33-08db8beabbe7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H80OoMTy40P5Zwbt1Gvy/Ed+S+etbZqfuuZlJ1Pex0JVn/J55ib+hp6iMS57jvVEomYQzmQCdALT0dS6c73+dD17HvbL8RX9nKkyxIuNIZGE3uQqy6Hv8cfVWNfTzeXrO1/gL71QaLEfh3Hnct35QkJoTZVetT3puHJqh6VF2F5TeDbTU4bFUKm7WR9mEqBgzOMjDGrRhPX15YgehPbkmOE6n63UzfEuainIMfpyvhFaHpVTLF84mvKKQeebDx4Nwwkp20pkv13jTUNRY2878Aa2hCEYpr35KMZgdBR+yKsR25XwR1edfWVhfYBB5wJI4srHwUXugE7VSIgvMcBB+T6dLeKAEx1nRD5HgG5ahWYSkIC5MenDN9WzvObBMSNtso4ahqGglStK96XmSNhj85rSCFALxBbvoCvfNREqxBOmUZ4sYpcAHAohrttHMb5FBYSoZJx/IhYmwBOwJDIYgVJTo82r8jr6TdE6slYXvNUNlVOHCybmLD2A36n5kvoVlYcglME5jsJjZUV9gjVd/hpSkvEJ7W0yvorQQIV1SOQbmP2cvKY+cD4mGRs4wrCeyA6eeKFIlMhchgT8oFCSveUQPwm4tjjJoK3HSXGEH38T0d6fYV2M8XUum1R+TyuS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(451199021)(2906002)(64756008)(66946007)(76116006)(66446008)(66556008)(66476007)(4326008)(7696005)(33656002)(71200400001)(66574015)(86362001)(9686003)(83380400001)(110136005)(54906003)(478600001)(186003)(122000001)(26005)(38070700005)(6506007)(53546011)(38100700002)(55016003)(7416002)(5660300002)(52536014)(8936002)(8676002)(41300700001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkhDbHBkdXlGaExHaHh6WjJRTkt3U0c2VG1TcWE3ZjJFTjNhbFBQT1Jvdy9O?=
 =?utf-8?B?M3cyU2NzNWZ4YUh0SHFyYzBoaFZiM05kdDJsc3Bjb3RCNTYyMStEWGVVT0g3?=
 =?utf-8?B?Q0FWWnFCYUo2S3ZlVlhyQ3lmWHJmM3FXMzkrTktybWwxMVJiTGQwckd1YTZI?=
 =?utf-8?B?VTlDM2FQcGJiMklSRDJmeHovZjUvQ2Q1UEp0ek8rVmI0bmVtS0w2bFJyY080?=
 =?utf-8?B?VXN3UjYwVGdINkRmZVgvdVlmQmtOcHJzMzhrTUlSYmhKSkU1OEovTFVuZnp2?=
 =?utf-8?B?akx3Z01ZdjRWTm1QRHhXTU1Ta296SnF4cnhEODVHeUE4Uk9TL2EvM1BiTUF3?=
 =?utf-8?B?ZGxGWmVBVmQwTE55c1lUbkhJNlIxT25KejhiRzRwR1lPS3p2YTR5cFVqYUxr?=
 =?utf-8?B?RXRwa2V6QlZzWHc5bDd1VTlsMUJJNnUrRjNjdGNTZkhKVDFqcEdyajBYZ29E?=
 =?utf-8?B?Rm9kbUdZZEE5OFdzRTVYZ1ZyZVVXTXhadENBcVJadGJsTDBzVks2RUJjQzEz?=
 =?utf-8?B?QkMzWUFBeXhwcysrbCtjTXBrdjlmdzYwWnhQczczdFNORm9oT0UwZm5hcUlE?=
 =?utf-8?B?dTMyWldGeFUyVEFMbURIVVh2dzN4RGZ2MWdmRzBHeTdFQURxN2FJb0tSYnQx?=
 =?utf-8?B?QktDcEVSUHlzRkY4ZVREaW0yM1pOaGN4NFNPM0oxVU50WGcrN2IyWkJPY3hQ?=
 =?utf-8?B?UEsxVHB4RE1LU3hFQ21PTTdydHZKTG1RU25PK1A5Rk1RTkd4eFN6Z1VhN0k1?=
 =?utf-8?B?R053cHJQYlRyTWFkWFVIbHRwQWxMN0pHTkFWaDFjbFp0eUZlMFFHcjJvcERw?=
 =?utf-8?B?ZTZEbG4zSHFWYkpoQkFGRHFJaGtucG5ROHlaMkJkYTN6d0ZqVkVqelh2czNJ?=
 =?utf-8?B?bUp5a0Rwem8wQVVXRGNMUlp2TkROU2ZURlJPZHd5ay9mblFwMFl1aUFBbG95?=
 =?utf-8?B?c05DSWJKaXAyVTV0UnB2U1JwMEVoNjNncGRUTVRDVXV1MzZ2bE11VjJqODJF?=
 =?utf-8?B?QWhlcjJIeFF5TVVQaHFORk1iRFlsbHpqdFRqN0l5Zy9XUDZzN2JOcmxERzJn?=
 =?utf-8?B?TGVBQ21WN3o0cUNUUDdlT29ZSHlPbkhSdmVpVTNrK2d0dTQvYWtqekZVTmRD?=
 =?utf-8?B?bUJjYWVWRDBWcy9wbG5FRTRsaEFpV2dXZ0xnUTg0M3JYNHlZaWtEbDJUZktn?=
 =?utf-8?B?eTU3am1POEZoUVBndWx1eFdLeVR3YU8wV1VkR2MwRWtmR3dTNllRT2JpeEZJ?=
 =?utf-8?B?Sk0vVGFFbk8wR3E3cnBTQW5leHZJMUVVTWFTWjdaWlpWL0Rwb0xtTmxzbWRu?=
 =?utf-8?B?eHFEQ2NSNnV1ZGJYZjAwT2FyejRKcTdZekhuSENkMzBhMlBzVS8xczJLVFdJ?=
 =?utf-8?B?MnlWVVl2bXdZTTlzcy9JakdHd0lRVG9QZ3FWMU8zazVTdnVLUjVKSlBYU3pR?=
 =?utf-8?B?T1FwSHRkdDhNVzQ0M00xMjRMMlNraWk4ajVub3J5UkE1M1d6MWxUT2t4dEtm?=
 =?utf-8?B?dWU0Vmh4cDdTNWk1b3hSRi9kcmRKUEVJaGFCcERxalRGZUJxTC8wS3pVWFB0?=
 =?utf-8?B?Z2xqMjFSa1V5cURTbGpYcGZCb0gyR05OZzVQMWtSdUFEMVhSUW44alFuV2Jk?=
 =?utf-8?B?NkhHSmtMZmhNZ0xDQTJmb25CNWNPcFVuWUlBK0w4ZTNYajZzYzZqV09IUXVU?=
 =?utf-8?B?OUZtaVlFUlVhWldadTRBcGJ6OWJOcHhiZjRldmJHbmJDdklzMGtOR3crTitJ?=
 =?utf-8?B?MlhiQy9NU3E0OGVCVWs4ZXJLMmpWWnNCWk1xTUpTbkFYdmd4RDNjNE5ORWdp?=
 =?utf-8?B?N1FHZTVvejBSNHFNRVE1RHZ0UkRDRGxjQllSUTFEUWdSdThnMnE2SC81S1Fs?=
 =?utf-8?B?YTNleWtZdzMvWGUyL3ROWjh4eGhiZWtBL05GaGM0S0JLU1kxU3BXb0ZvS1pG?=
 =?utf-8?B?dHBaaUJzSFhxeEtsRzh0VCtoVlRpeit4TDBtYWxUUGN4UThEcGpTNGdBdmUv?=
 =?utf-8?B?S2tVUUdwTnYzalFZVGFZUUxDZnZNK3BSZW1iVDgrV1p6WkhlVit6QUZSWnl6?=
 =?utf-8?B?aGs2MUhqdlF3Sjhaa09MdTh2WjF0QUpEUkVka1FNa1J3V013VjZ6b0YyRWpv?=
 =?utf-8?Q?hhC73iGXSMqRbHRXPbtZkkWLc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b36a004-4483-408e-1d33-08db8beabbe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 02:07:29.3664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJQ5+8uosq65d79JIDU+sB1nkJqTO6onoyBSpGdvh06GIOmPq+TqvEkcjqedj/nCP7XaGO/eR9x0kIfX/Z//tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR04MB6963
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gU2VudDogVHVlc2Rh
eSwgQXByaWwgMjUsIDIwMjMgMTA6MDkgUE0NCj4gVG86IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlA
a2VybmVsLm9yZz47IERlbHBoaW5lX0NDX0NoaXUvV1lIUS9XaXd5bm4NCj4gPERlbHBoaW5lX0ND
X0NoaXVAd2l3eW5uLmNvbT4NCj4gQ2M6IHBhdHJpY2tAc3R3Y3gueHl6OyBKZWFuIERlbHZhcmUg
PGpkZWx2YXJlQHN1c2UuY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2VybmVsLm9yZz47
IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9y
Zz47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWh3bW9uQHZnZXIua2VybmVs
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAyLzJdIGh3bW9uOiBwbWJ1czogQWRk
IGx0YzQyODYgZHJpdmVyDQo+IA0KPiAgIFNlY3VyaXR5IFJlbWluZGVyOiBQbGVhc2UgYmUgYXdh
cmUgdGhhdCB0aGlzIGVtYWlsIGlzIHNlbnQgYnkgYW4gZXh0ZXJuYWwNCj4gc2VuZGVyLg0KPiAN
Cj4gT24gNC8yNS8yMyAwNjo0NSwgQW5kaSBTaHl0aSB3cm90ZToNCj4gPiBIaSBEZWxwaGluZSwN
Cj4gPg0KPiA+IE9uIHRvcCBvZiBHdWVudGVyJ3MgY29tbWVudHMsDQo+ID4NCj4gPiBbLi4uXQ0K
PiA+DQo+ID4+ICtjb25maWcgU0VOU09SU19MVEM0Mjg2DQo+ID4+ICsgICAgYm9vbCAiTGluZWFy
IFRlY2hub2xvZ2llcyBMVEM0Mjg2Ig0KPiA+PiArICAgIGhlbHANCj4gPj4gKyAgICAgIElmIHlv
dSBzYXkgeWVzIGhlcmUgeW91IGdldCBoYXJkd2FyZSBtb25pdG9yaW5nIHN1cHBvcnQgZm9yIExp
bmVhcg0KPiA+PiArICAgICAgVGVjaG5vbG9neSBMVEM0Mjg2Lg0KPiA+DQo+ID4gY291bGQgeW91
IGFkZCBhIGNvdXBsZSBvZiB3b3JkcyBtb3JlIGhlcmU/DQo+ID4NCj4gPiBbLi4uXQ0KPiA+DQo+
ID4+ICtzdGF0aWMgaW50IGx0YzQyODZfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwN
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICpp
ZCkgew0KPiA+PiArICAgIGludCByZXQ7DQo+ID4+ICsgICAgdTggYmxvY2tfYnVmZmVyW0kyQ19T
TUJVU19CTE9DS19NQVggKyAxXTsNCj4gPj4gKyAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xp
ZW50LT5kZXY7DQo+ID4+ICsgICAgc3RydWN0IHBtYnVzX2RyaXZlcl9pbmZvICppbmZvOw0KPiA+
PiArICAgIHUzMiByc2Vuc2U7DQo+ID4+ICsNCj4gPj4gKyAgICByZXQgPSBpMmNfc21idXNfcmVh
ZF9ibG9ja19kYXRhKGNsaWVudCwgUE1CVVNfTUZSX0lELA0KPiBibG9ja19idWZmZXIpOw0KPiA+
PiArICAgIGlmIChyZXQgPCAwKSB7DQo+ID4+ICsgICAgICAgICAgICBkZXZfZXJyKCZjbGllbnQt
PmRldiwgImZhaWxlZCB0byByZWFkIG1hbnVmYWN0dXJlcg0KPiA+PiArIGlkXG4iKTsNCj4gPg0K
PiA+IHlvdSBjYW4gdXNlIGRldl9lcnJfcHJvYmUoKSBoZXJlOg0KPiA+DQo+ID4gICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoJmNsaWVudC0+ZGV2LCBlcnIsICJmYWlsZWQgdG8gcmVhZA0KPiA+
IG1hbnVmYWN0dXJlciBpZFxuIik7DQo+ID4NCj4gPj4gKyAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+ID4+ICsgICAgfQ0KPiA+PiArDQo+ID4+ICsgICAgLyogUmVmZXIgdG8gbHRjNDI4NiBkYXRh
c2hlZXQgcGFnZSAyMA0KPiA+PiArICAgICAqIHRoZSBkZWZhdWx0IG1hbnVmYWN0dXJlciBpZCBp
cyBMVEMNCj4gPj4gKyAgICAgKi8NCj4gPj4gKyAgICBpZiAocmV0ICE9IExUQzQyODZfTUZSX0lE
X1NJWkUgfHwNCj4gPj4gKyAgICAgICAgc3RybmNtcChibG9ja19idWZmZXIsICJMVEMiLCBMVEM0
Mjg2X01GUl9JRF9TSVpFKSkgew0KPiA+PiArICAgICAgICAgICAgZGV2X2VycigmY2xpZW50LT5k
ZXYsICJ1bnN1cHBvcnRlZCBtYW51ZmFjdHVyZXIgaWRcbiIpOw0KPiA+PiArICAgICAgICAgICAg
cmV0dXJuIC1FTk9ERVY7DQo+ID4+ICsgICAgfQ0KPiA+PiArDQo+ID4+ICsgICAgcmV0ID0gaTJj
X3NtYnVzX3JlYWRfYmxvY2tfZGF0YShjbGllbnQsIFBNQlVTX01GUl9NT0RFTCwNCj4gYmxvY2tf
YnVmZmVyKTsNCj4gPj4gKyAgICBpZiAocmV0IDwgMCkgew0KPiA+PiArICAgICAgICAgICAgZGV2
X2VycigmY2xpZW50LT5kZXYsICJmYWlsZWQgdG8gcmVhZCBtYW51ZmFjdHVyZXINCj4gbW9kZWxc
biIpOw0KPiA+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPj4gKyAgICB9DQo+ID4NCj4g
PiBJcyB0aGlzIHJlYWQgcmVhbGx5IG5lZWRlZD8NCj4gPg0KPiANCj4gSXQgb25seSBtYWtlcyBz
ZW5zZSBpZiB0aGUgcmV0dXJuZWQgc3RyaW5nIGlzIGFjdHVhbGx5IHZhbGlkYXRlZC4NCj4gT3Ro
ZXJ3aXNlIG5vLg0KPiANCj4gR3VlbnRlcg0KV2Ugd2lsbCBhZGQgY29tYXByaXNpb24gaGVyZS4N
CmZvciAobWlkID0gbHRjNDI4Nl9pZDsgbWlkLT5uYW1lWzBdOyBtaWQrKykgew0KCWlmICghc3Ry
bmNhc2VjbXAobWlkLT5uYW1lLCBibG9ja19idWZmZXIsIHN0cmxlbihtaWQtPm5hbWUpKSkNCgkJ
YnJlYWs7DQp9DQo=
