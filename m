Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C1249500F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 15:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345649AbiATOXx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 09:23:53 -0500
Received: from mail-bn8nam11on2065.outbound.protection.outlook.com ([40.107.236.65]:56097
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343826AbiATOXw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 09:23:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXCnsYQQme2JJH5I3ih359u3tiFn6YFMbnah3dhk0RY/f/zePcKMLHy8NJaPNqOdX9asVsPUHL3YG2w221PNy5LrL6baRY07c/YgrRkV9bAPKjiod0bnj6/AjfDETEy9Ipw6gA4hHBLBpTJf5wtZzVuiCmOvtw1AxGI+Bw2XrFGgYwKZqdUO1dNbPG0o0rgwhAQPm/3r6WsRi5xW4Gelm8MuzRjlgmS4RBQulfVNHi8ZtoH/vwXLDONtnC3fTBgdKqbE6eed+oXyAwwcaqNA8fOebvqPsf4xq9LY9WKyJ8pP/v8MtomreWtSMKOzSnafrH3DU/HmkF6RmwkcI1um1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fRvNhQgeorMAmdWkIOUHuR6aHE6syYSWJHv/BIhO6M=;
 b=E3JXkDV7cWZyrU4b3DrDm0e04knhxOZ3RJ0AK2i1rXBVbX+4i7Q3ebfESI5mFkms9AtIiX03PdXznttfTfI4rKmS3Nyj6a0tgR/cUlPV/786YlUIj4Ia9ivysBH7cgGqhgG4D0DLHyBOTWQHzZ9WBabYvbq69lJErzEjdQ8BZDBMNPP548ENH/HRN4YzysH9DwpvzW8sm9TofyLV4qpeLNaF9njUNYqxpE14jvTgb+kkh3tDkBdFSJbIFBVjYCkBU05jvxfDOYD4wc2V7mw2pI3c7PU3AXOFbSwv8+uCQFPmt9llN14ZkEVn7eeV2fehdCV0iqpX67Fhg4Nr/x/VPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fRvNhQgeorMAmdWkIOUHuR6aHE6syYSWJHv/BIhO6M=;
 b=ZtFa5/BxcvLk50WmHiV567FpK6TVmE//whRuPsx7tqthEA0OIy9Q3ca5JayptwiHeckIUl8ilCbIDcbS8XsCFbJZ0VrkkkB5cqECODZf4O5GPLVjjTn7XoZLuzhP5qtzpOQI+D3b5CJ6IVwTMx0AYbUyo6CZvqDY2og3Ql2eWpDu3LlQDEDSCA7ppC7skN7xPoGQC3pYXyiQXmphTYwZxj+jXTysnoG2gj5T2mWnJZtMdU5SzgvuK+k9FMe1cdNqpa5E5b9ESSeCpFweCBcHAbrHPLYirRaTBYqn9Pbk89d8nMp2wAWudiuz0qHQv93BzeSKMCy70UzwWGhkgJ0v6Q==
Received: from DM5PR12MB1850.namprd12.prod.outlook.com (2603:10b6:3:108::23)
 by CH0PR12MB5073.namprd12.prod.outlook.com (2603:10b6:610:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 14:23:50 +0000
Received: from DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851]) by DM5PR12MB1850.namprd12.prod.outlook.com
 ([fe80::880d:1407:db31:5851%11]) with mapi id 15.20.4888.014; Thu, 20 Jan
 2022 14:23:50 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Petlozu Pravareshwar <petlozup@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Subject: RE: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Thread-Topic: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Thread-Index: AQHYCIHac1H6WD0+TEykLyGIHAPGEaxpShYAgACuXxCAAFRygIABroKg
Date:   Thu, 20 Jan 2022 14:23:50 +0000
Message-ID: <DM5PR12MB1850C40F3ECF34D30AEE3D83C05A9@DM5PR12MB1850.namprd12.prod.outlook.com>
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
 <1642080623-15980-2-git-send-email-akhilrajeev@nvidia.com>
 <d9a21970-b403-4674-dbd6-5dfab0a83a3b@gmail.com>
 <DM5PR12MB1850237ECA6C115AD776635EC0599@DM5PR12MB1850.namprd12.prod.outlook.com>
 <a7a33c29-427d-5e82-f327-aa4701d51898@gmail.com>
In-Reply-To: <a7a33c29-427d-5e82-f327-aa4701d51898@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b8a0fd3-cb81-44ef-707d-08d9dc207ad4
x-ms-traffictypediagnostic: CH0PR12MB5073:EE_
x-microsoft-antispam-prvs: <CH0PR12MB5073CE4182C73345A15A120DC05A9@CH0PR12MB5073.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UXEYdCqaxc6gEoQ5i4ujtalZ4x/rNobPw+6Q0UPyyJBMxG87wmscvMU5ZkXDao59F8laF4+qzkt/B2nAOjRIn7PThVdGCoY6SXTjzmZJpP77qfDKSYE40OO+YCp1KhHK1j6KEJ6HuIFd9lj0WeDdDglAEwN3pcKXTPGfMehEp9VtRcIEkHhdX+X/ULZVsFwtRgP1ZOFrAlI5V7/Yi2hp2dIp8pZz2oTknM2W6hqVkGVHEdQL2HAQqTz3Q4XPE1x4BFGIx4oTP4jQ+Gy56uNoPswkjXIY4ooeZ4NzSwcErHFWzRWm6oiCqgPPCk7xmggX/MOUcz+xhVaQQqmbrQxxPpR/8KuYN30oZCW4+1qoj+a6tkE7NdtDpOaawfgbZIuy4GY9fa9lHE07zGc2/fAoc6TJ3EWiha7QxW9R+rb4zxDGIbLt4OBQ8cjwgu9YSWo7qdIUgIEr/gdr/xnpNU74NrCnLTNFi2ZGqRffxTBAkUL3H1VDhH9mBOhFGR5j8kFg0VrktM6Ugn+uFZOs3svzrLzzgAKv5yCe3PQNf9QVRA1ENwhl5kHfghWsrmoOH5Kdjrq2g3bKO5hk6gEMm5evd5N6NKRivhCgfxYY3o9Mnpioj1VQ1beytXSr/fN4PY+6q+aa7gHrRDVRQWMNwHYYVr62uAOOo/n3NKereEjq4QJh6QgZeTaXPHLvjQK3u00QWHiyZPDsb9Pn6Mu/AhEY2k9zszbCkNxQ3Gfe2bBBgj4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1850.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016003)(83380400001)(5660300002)(6506007)(921005)(508600001)(9686003)(2906002)(86362001)(52536014)(316002)(76116006)(6636002)(8936002)(122000001)(71200400001)(38100700002)(64756008)(66476007)(66946007)(8676002)(66556008)(186003)(66446008)(26005)(7696005)(33656002)(110136005)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkZYKy9zaHFHMUFSb2Z4SEFESW8za1BMSGZDWXVlS1haRkhZR1hMakFFZXFn?=
 =?utf-8?B?T3IrRVVWdWhzRUNacnpmb3FSS0VHSEl5MHpETEdGZG5xdzVkWU9aZmNvMTBp?=
 =?utf-8?B?NGtJeU1WSG10KzExRW1ZMDg4c1hIUUFIeGRZVXRXeTY5eVQyaUZBV2FNNjZs?=
 =?utf-8?B?SkdkL3gxVkl4TVNLd3Y1YVNWbTNkaDBkVzZ4elpYQXN4V3FHNW5EdTFUcTBn?=
 =?utf-8?B?b1VvY3ozSXNCbHk3ckhEVzFneVF1RGI0ZUtSWlRTUlpDWW83bGltTG4veTc3?=
 =?utf-8?B?eVlYTW9wN1Z2RTBFOFZ1b2hNdmg2VTA5RUltOXo1U3cyQlplaUx0MG9jRGZq?=
 =?utf-8?B?L2pxVlVTOStYVHRobEg0blYxMFZub1FWL1hKYnBnUW80cXNRVG8rOU16d2Ix?=
 =?utf-8?B?NlZvVXNYK3AxQ3lWR01jamNWMU5XL1pLeTJXTFlKTU9FMkVnaWFuSHZ5SmlB?=
 =?utf-8?B?c2kvNmZHaG1lc2s1OEcveVpSeFB5Y1dSa2tNV3l1VEE3dHkzYjBsQnBiRlJ6?=
 =?utf-8?B?WlFsaTNIOEFWSkErRURSOFNZNnlRVURyOUR2RTF3WDdtVDE3M2lHK3RTQzJa?=
 =?utf-8?B?ejNoZXl0dmJDbHUrNUpzRU9BVUh3Y0k1S3dMazdWNks4b2RYSiswcXpTTms1?=
 =?utf-8?B?SnpCVEREK1dwWE10WGdab1krSWx3N004V3RkM0xQdm0xbmEvbzBSZ3dkd0w4?=
 =?utf-8?B?NDdLZXRoTEZwZi9mZ0RLU3Y2VG5QcjNUcnBEZ0dZamhFMWRxZkNwMFhnMm92?=
 =?utf-8?B?bFhOQzV2Ui9WTlpPbkxPekpxR0JjT1hoZDYxeWo3VEo0SCtENU9ESC8rWkFS?=
 =?utf-8?B?dmsrWk1ia0RlTXNnNGVLY2FVemxsUGt1Q0hRdkFDYXhHOFgrMXFPTVh0ZFJN?=
 =?utf-8?B?RFhERVJ1SlAvL0ZMYllRUzRmYlFMM2JqWTlEQXpwdXFxYlRPQWV0SEtXQ291?=
 =?utf-8?B?d2hYU1NrR1ZIdGlDZDZqcjFoV29laEVudGlrVGVXWmlDSFhEUGZHRG1wMWVV?=
 =?utf-8?B?UFhwQ08rZHZPK3V4Z05qR3hLNTZqaTQ5YUhhaGpOOWNZRDF2aUpVNzJQR3dX?=
 =?utf-8?B?QVBMM2hhbFJuUDY4ZGZ2UHVuY1FxK3dVNUVYVEdKa3BMRmFHMWl0ODFFZzM1?=
 =?utf-8?B?MWNpMGJITE9LVlNGNTh5SFNPQldBelJVekpUWHg4bGQrOHZ3THhDd0MyU3Yy?=
 =?utf-8?B?RmRJTWRISnhsY3UvdWJvdFI3RUNEU0JsK0tWQTJSeGhoRFNZNmNCRUxFUlpk?=
 =?utf-8?B?RWxwR2Q2MkwvUnBVWkFRNC93bkpRcWUyZlEvcjBVOEU2WmxWeHVFeUEvMGJn?=
 =?utf-8?B?azFXOVU2TjczbDY2ejFCY3NsQ1lkb09pdzFOMnFla1hUQnpvYkRYQ3psRGxZ?=
 =?utf-8?B?R2RhY3FSL3JqMEV5cVpqNmd4YmNhd3NzdTMvWEdZK1ZaZlhtWEx6MHZGRkRF?=
 =?utf-8?B?dEZTMXNuOWVLaENUbEg3dlNlWk45U2JyRFV2R1V5QnZCSTIxdmNNcEJBZFl6?=
 =?utf-8?B?ejZQeGNtcVpXTlg5Yy9DdnkwcUx3WXhKek1WNi80MG9zYzFsbExKTWhkUlQw?=
 =?utf-8?B?NWtBVERLd3ZlSGlaZ1k1cEtCN0o1dGRXT2tjanRPL3NjZGcxK0pWeDdLL3Vi?=
 =?utf-8?B?YWNaendvYzZEUjIvZkpXbkRnU0JoWUxMOTZJSTJ1d2VhemR1Mm1hbWNkVHc0?=
 =?utf-8?B?R0NwMWx1U3FiYU5Wd2NHVkozTzE1QklSdVgzc3RDMzlQNXNNZDFiVkVTZVRn?=
 =?utf-8?B?MWdrZVRxVDRhQW1tZnRsT2tyQ0RxZ2U3eHF6OGJGOXFqTG5xR3A1NWxvakRB?=
 =?utf-8?B?YVh1WGZNZjR5NldBSjRDMW1WaDZET0pNMUFJbm9vMVFnL3l1b011WFFIRDRR?=
 =?utf-8?B?aG00ZVltcG9TdkIyUzlzUWRmdU1kZkhXYkdBRWNHQ2JHTnVXUEZlcldaZkFn?=
 =?utf-8?B?ZTQrSlNYVVh0dStwNTRDMWhlNm9mYW4wSU94MDdXNldkOVBlc0x5THVkOURN?=
 =?utf-8?B?RkZmVFFNOUxXTHJKbnVyQno3OFlJeUtrY3N2K0lTUWZIaTNHY2VQQjJodXZm?=
 =?utf-8?B?b08wVDdDd0dvTnU0cjFGOHZ5cjlOcEVCek5hUWh4eW5ZTEt0ekwxOTN0RFRi?=
 =?utf-8?B?SEFWa210SEh3bUp2eXVzWlQzN0s2emNkZTdwYVN3L3VzK01TU3Q5QWp3a1V3?=
 =?utf-8?Q?+tniXJnMDJ5YpwIC6c/KjVs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1850.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8a0fd3-cb81-44ef-707d-08d9dc207ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 14:23:50.6974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVxjlZ8UsAGaHxOvoMpvi7fDZjXaEw4ZQShue3BBhghv2fECi4LxF0YqdabAVu5s8Xq87urmsW0untKuOHmY5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5073
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiA+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGVncmFfaTJjX2h3X2ZlYXR1cmUgdGVncmEyMzRf
aTJjX2h3ID0gew0KPiA+Pj4gKyAgICAgLmhhc19jb250aW51ZV94ZmVyX3N1cHBvcnQgPSB0cnVl
LA0KPiA+Pj4gKyAgICAgLmhhc19wZXJfcGt0X3hmZXJfY29tcGxldGVfaXJxID0gdHJ1ZSwNCj4g
Pj4+ICsgICAgIC5jbGtfZGl2aXNvcl9oc19tb2RlID0gMHgyLA0KPiA+Pj4gKyAgICAgLmNsa19k
aXZpc29yX3N0ZF9tb2RlID0gMHg0ZiwNCj4gPj4+ICsgICAgIC5jbGtfZGl2aXNvcl9mYXN0X21v
ZGUgPSAweDU4LA0KPiA+Pj4gKyAgICAgLmNsa19kaXZpc29yX2Zhc3RfcGx1c19tb2RlID0gMHgy
NCwNCj4gPj4+ICsgICAgIC5oYXNfY29uZmlnX2xvYWRfcmVnID0gdHJ1ZSwNCj4gPj4+ICsgICAg
IC5oYXNfbXVsdGlfbWFzdGVyX21vZGUgPSB0cnVlLA0KPiA+Pj4gKyAgICAgLmhhc19zbGNnX292
ZXJyaWRlX3JlZyA9IHRydWUsDQo+ID4+PiArICAgICAuaGFzX21zdF9maWZvID0gdHJ1ZSwNCj4g
Pj4+ICsgICAgIC5xdWlya3MgPSAmdGVncmExOTRfaTJjX3F1aXJrcywNCj4gPj4+ICsgICAgIC5z
dXBwb3J0c19idXNfY2xlYXIgPSB0cnVlLA0KPiA+Pj4gKyAgICAgLmhhc19hcGJfZG1hID0gZmFs
c2UsDQo+ID4+PiArICAgICAudGxvd19zdGRfbW9kZSA9IDB4OCwNCj4gPj4+ICsgICAgIC50aGln
aF9zdGRfbW9kZSA9IDB4NywNCj4gPj4+ICsgICAgIC50bG93X2Zhc3RfZmFzdHBsdXNfbW9kZSA9
IDB4MSwNCj4gPj4+ICsgICAgIC50aGlnaF9mYXN0X2Zhc3RwbHVzX21vZGUgPSAweDEsDQo+ID4+
PiArICAgICAuc2V0dXBfaG9sZF90aW1lX3N0ZF9tb2RlID0gMHgwODA4MDgwOCwNCj4gPj4+ICsg
ICAgIC5zZXR1cF9ob2xkX3RpbWVfZmFzdF9mYXN0X3BsdXNfbW9kZSA9IDB4MDIwMjAyMDIsDQo+
ID4+PiArICAgICAuc2V0dXBfaG9sZF90aW1lX2hzX21vZGUgPSAweDA5MDkwOSwNCj4gPj4+ICsg
ICAgIC5oYXNfaW50ZXJmYWNlX3RpbWluZ19yZWcgPSB0cnVlLCB9Ow0KPiA+Pg0KPiA+PiBXaHkg
dGVncmExOTRfaTJjX2h3IGNhbid0IGJlIHJldXNlZCBieSBUMjM0PyBMb29rcyBsaWtlIEkyQyBo
L3cgaGFzbid0DQo+ID4+IGNoYW5nZWQgYW5kIHNvbWVib2R5IGp1c3QgbWFkZSBhIG1pbm9yIHR1
bmluZyBvZiB0aGUgdGltaW5nIHBhcmFtZXRlcnMsDQo+IGRvZXMNCj4gPj4gaXQgcmVhbGx5IG1h
dHRlciBpbiBwcmFjdGljZT8NCj4gPiBUaGUgdGltaW5nIHBhcmFtZXRlcnMgYXJlIGltcG9ydGFu
dCB0byBnZXQgdGhlIGRlc2lyZWQgZGF0YSByYXRlIGZvciBJMkMuIFRoZQ0KPiB2YWx1ZXMsDQo+
ID4gdW5mb3J0dW5hdGVseSwgY2Fubm90IGJlIHJldXNlZCBmcm9tIFRlZ3JhMTk0Lg0KPiANCj4g
RnJvbSB3aGVyZSB0aG9zZSBUMTk0IHBhcmFtZXRlcnMgc3BlY2lmaWVkIGluIHRoZSBUZWdyYSBJ
MkMgZHJpdmVyIGNhbWUNCj4gZnJvbT8NCj4gDQo+IEknbSBub3cgbG9va2luZyBhdCBUMTk0IFRS
TSAoWGF2aWVyX1RSTV9EUDA5MjUzMDAyX3YxLjNwIDEwLjIuMy4xLjENCj4gRXhhbXBsZSBTZXR0
aW5ncyBmb3IgVmFyaW91cyBJMkMgU3BlZWRzKSBhbmQgc2VlIHRoYXQgYWxsIHRoZSB2YWx1ZXMN
Cj4gc2hvdWxkIG1hdGNoIFQyMzQuIFBsZWFzZSBjaGVjayB3aGV0aGVyIFQxOTQgY29uZmlndXJh
dGlvbiBpcyBjb3JyZWN0DQo+IGFuZCBmaXggaXQgaWYgbmVlZGVkLg0KDQpUaGFua3MgZm9yIGhp
Z2hsaWdodGluZyB0aGlzLiBUaGVyZSBhcmUgYWRqdXN0bWVudHMgaW4gdGhlIGRlZmF1bHQgdGlt
aW5nIHZhbHVlcw0Kb2YgVDE5NCBmcm9tIFRSTS4gSSBhbSBjaGVja2luZyBpZiB0aGVzZSBjaGFu
Z2VzIGNhbiBiZSB1c2VkIGZvciBUMjM0IGFzIHdlbGwuDQpXaWxsIHNlbmQgYW4gdXBkYXRlZCBw
YXRjaCBpZiB0aGUgc2FtZSB2YWx1ZXMgYXBwbHkgZm9yIFQyMzQuDQoNClRoYW5rcywNCkFraGls
DQoNCg0K
