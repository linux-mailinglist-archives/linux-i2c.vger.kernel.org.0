Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 422D15EA912
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 16:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbiIZOwm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 10:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235108AbiIZOvy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 10:51:54 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEED1C124;
        Mon, 26 Sep 2022 06:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQZor1BeclLxLxgcTcBBGBS5175L6WSKWBcp3r9GswE9zOpCtyGLBiDblo1CuUOaUOXOMmLzac5hT0LXkAN/bUJXsrIOi6bpdAY8k5OqDnJTh9vg/BAHC1XTH9eWuDpybABSztnwDT5j/CKh10G36Rv3GwQWL+JVHGLFvKI9aXxaZ08KBLS+iFW7ShHsO9rHel+WSm6ovnKfBpj3dtwa+Qv57TI0LAH4bdSdBszHgieCIqxtegrE4Fy5migh50a0ww+xmSHWgBvCQ/IJvVhZg26/DfkOrP3jZkJ24MQDiaCx9UI9yW8bffHjUz3Ps9opByErprfO/zr5j+H5PrySmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AINkQC6xoeIVAh8iJ6tfgHEL4uaPI+hLzxcrka6E/VA=;
 b=GHl5ByN0ff73omMgixOYvF6KQhTBUkJ63SLwybTCdzo6Gqv9B0BIP3sUfn4TRBk/OZ6ZEULSSBnTL3IIenZx+ksqeMn1XbNfH6WrPnhyym7QFFOS8hf/CrxD6wmuxG2i/S6hIa7KWzdfckXJJeiHVhyCRi0vm8JD2TCEXmtW7vz+J3Sh4+tf2k42W00wif7pUx6IjNzwj24klqfYOxOSmtz6ZSF2nEXSNsa69YH622xAIkJVi1uvcvZPw0iQBjOghqlDQ0boHqzn0nE/AiUAcXGh322fHvufP1FHnp88a32XNBZvrC6tKu69xS7Su/zHMSBOS1+fFJRLKl4BWdR+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AINkQC6xoeIVAh8iJ6tfgHEL4uaPI+hLzxcrka6E/VA=;
 b=spxokJ+W5G28JGo+oB4CqbFu0oO37CBONu7QUWuvHFUhTn1ytXWoAt05XIiC+eu4YFrn/8RtL3W6N+TIJi1jtKaOMPVL2fUAmy3qAkRoIA4KFKNKmYdEgF8dVoOBS0pwu6ylCBKgZPVkGGLxeN22hUtw/pPyKYOWFyVo97LuW23m1IUUKMqT91RXR6znhp6X7MjSwrLcYWM5+pWWTitRvr215wUAi0ottk7YmXkCW6gHrL8deBlyoZPfzL7mmYLcm5HRKq1mPXknbAko1H1GqIsZwAcu+SOEbeSf57xBaEAtCwqm/OxAIuWJUHhsDCsZFkObYcWVFLaV+Gw3DQ7zAw==
Received: from CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 by DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 13:18:54 +0000
Received: from CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109]) by CH2PR12MB3895.namprd12.prod.outlook.com
 ([fe80::7129:e05:131a:b109%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 13:18:54 +0000
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: RE: How to remove DT support from a driver? (was Re: [PATCH v5 8/8]
 i2c: i2c-mlxbf.c: Update binding devicetree)
Thread-Topic: How to remove DT support from a driver? (was Re: [PATCH v5 8/8]
 i2c: i2c-mlxbf.c: Update binding devicetree)
Thread-Index: AQHYzfUF4sHTA+d1NEqXr8XeY0T7cq3u2waAgALP8dA=
Date:   Mon, 26 Sep 2022 13:18:54 +0000
Message-ID: <CH2PR12MB3895753865DC9318CE61A131D7529@CH2PR12MB3895.namprd12.prod.outlook.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
 <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <Yyttt3DiQpMZYejA@shikoro> <20220924173125.GA989070-robh@kernel.org>
In-Reply-To: <20220924173125.GA989070-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB3895:EE_|DM4PR12MB5392:EE_
x-ms-office365-filtering-correlation-id: 2cb08bd8-d844-4fe5-370b-08da9fc1a93d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wjl41cD9sxFF4hoNJGC9TheA2sshUmMI+i1RaX0awGS5yaI02CDng4bBs6gzXi3Upp87ieeH5KOjAkd+GP9BVq69gTN57OA2UKnnxb9UbFgoPWeVpmCR3/GEEAAX3gJ/tv1q9hNkecmKczK3SbWh5kCtFnuykrkQqcTTwVmRhdIojWqHF6S/eCVSf4ixKdMGOCxEt/KVYg2kZn6QAxjJ9CPgDi//GPReZgQdYczFA0Jo+ml3QpLVDGPoSi8nARqyprE5eHHHVFJORjScsBib7quSV58PERJAT8bxpJwPGnB0UXCmXAEUYJbTBOeUbBaygBqwsd2b3qqx9MXrpzC5npp1lG3wZ4rGinxSqLnRLOnvqrq2N9SP57kkOPSFwWVRbwmBi0qncUXW5gcs589DF0UobEQC+ZiipfQEWC3Mr1ZnxCmpd55BnUkXEXwJ7zoUYl+8uxv61JiIrJPa6p5z0noFcx1e9TDzgGKI6SQclg1jAFLJ8L+764woZr0X7YK5pvI112C0IWPDbJrrC6fYsdTqajOcvyfB1NM1l5Fe3c8fpYZtLqYsHg+tfuAmTx22AyfrQJUccLXZe1Czvv9W/GdusRwezLednWuYhh7dbkiXV8WmZMVS2TLrY/oN+p8nBHVu7V8yXEwDWPwOQ2yRDloB3LxB0+yazlivV5rPibuST2X0CgsXmhmv0UKONivVV7ERa+6ZvLb38OZOjk0w6n+8g4sbgb/M9tNi7HHBkKjwch5dOo52+wwUEgqCMRGmtnLplfR3EBsHO2jY0jGyKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3895.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199015)(6636002)(110136005)(33656002)(86362001)(38070700005)(5660300002)(38100700002)(122000001)(83380400001)(186003)(6506007)(9686003)(26005)(41300700001)(76116006)(478600001)(66946007)(71200400001)(66476007)(316002)(66556008)(7696005)(8676002)(66446008)(64756008)(8936002)(55016003)(2906002)(52536014)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW5TeEo3U0RZZGx5Wm9GdXcramU5bFBFT1BsOCtkblB0ZXBJdmdsNGFZdXlQ?=
 =?utf-8?B?NENrRGIwU00yTmpZSnQxRjF1cEVWY29McE9TOHdOOVNPQnJVaFFrdnk5RXlU?=
 =?utf-8?B?bTA0QUdTS0NML0hOZE90ZVZGUXJNRW5DU2RDdDVkdjV3eVBhT3A2emdKOFNs?=
 =?utf-8?B?SExmYVZydUswQTJFd2E1YXZqL0MvZ09DVmxZdm1Fa3hZblpTQlJIc2U3cEgw?=
 =?utf-8?B?dmJHTklaYlFnaGRCVVc4ODVnV1AwWXRQRFE5QW4vZnRmM0tDTCt0am5YNmcz?=
 =?utf-8?B?b1lWZWV1VERhUHByOFByUmkwWUt6a2ZqY28xUFRXeDVGd3RkYzREdDVuUVJk?=
 =?utf-8?B?ak0xaE50RmxNbDN4eGdYdkprWE1jWWZGdXFIb3BYbHFMTDNGbFNaWWtQYUFV?=
 =?utf-8?B?SkE1aGpEQmlFL3NHOVVzRkd6aGROVjBKUXEzZ0Y5Z0syRWYyelJGN0x3ZHFZ?=
 =?utf-8?B?aG5Ub1Y4UUg1VHF4MXc0K3kwUUZMRFdzOG12RG1PU2l4YjlCL0t0K1R0dEtp?=
 =?utf-8?B?ZzJkRVNmUjViajNrNTEvWmFKa09TNGM3MW5sUzVUYURTbTR5UFQ0Vm9RQXZZ?=
 =?utf-8?B?MlB0ZXZsc2ZoVnRmQVc3UmZ1MUl6Q0NFaXhGRmFpQWtMZGRnU1p2dFE4OEFr?=
 =?utf-8?B?OVlWL2ZTb05iMGg4SDFSK3Q1RzdMdGQyRFg4Zk9idnd2a1lJRFdlVTl4NTVR?=
 =?utf-8?B?dC9Kb3RlTC9NS0FIWjlNYmFnZ1lodkxJbSt4MTh1RllmTVVJeEVoSUg3eUxN?=
 =?utf-8?B?bXd6VHNNYVphN3I4cHY2eEJSNy9pSXNuVG5TcVVwSHYrc2U0c2loNzdQWC9O?=
 =?utf-8?B?N0xBMHlhR1hDblFXclJia2Z0eGRXVHllOTBXZ0tTVnF0VmtjbFBCRGhzRVBK?=
 =?utf-8?B?RG5qam95eXFqMms3SHJYWWVnVGNnVlJ4TjhqbHUvNi8yMVFQcWN2UEZoYWVH?=
 =?utf-8?B?WnJQMDlKdlhpWFJHK1VJWjlzWUxCRnJzVElsc3UxRlhVSHJhUFNxd1pUTVE0?=
 =?utf-8?B?SUR3bzJVTlhIUmVydURyY0JJOUQxRE91SGRhUE0zcWtCRUFVYWVJaXNmK2dE?=
 =?utf-8?B?QnpEMkNtRWhwY0NPMnpsNDh4UnYzL2N4aDNHM0J1MEFBQlg4aXF2UjVFclRK?=
 =?utf-8?B?ZHFuL09IZUJ0SmFLUXpISi8zdUI0aStLdjEwa21jNzBIZ202cnljR0tnelk4?=
 =?utf-8?B?YW8wL0E1VHJ6ajAraFZ2cmxCWUVtckRrY1pzbjdKVEExbjBPNHJSd3g4U0Qy?=
 =?utf-8?B?Z012VnI1U0xjUitJbDVyOGlWR1k0UnhMVTZJWG94bVF4cHNNMysxZjFhQ2pP?=
 =?utf-8?B?K3ZLZVIvY2h3YXNjcVFncWk4Yi90WllrTUhnUkxXR3RRQmhSb3JHZmRYM1lr?=
 =?utf-8?B?L1BsbnBSdm44SFc4TGVva0QzUThvT2VOTGxjaWJpNEZyQmRXRWtYSyswazZj?=
 =?utf-8?B?S3g1akVmTW9mTlVzZVNHNllUaFkxVFRnWFhsTjFicHJaK0t6WTl2Q1RSUHdP?=
 =?utf-8?B?NFROM0tSVkRMWTFSRU1NZWtkYkJuQTdsdDZnNFVkQXQzbHBJRW5xMzkxaG52?=
 =?utf-8?B?OTFFVnpxb3J4cTJMTzZJdW1QNlF3dXoyMTljQ0R2MjJsVlVCUjc2OGNjU0RJ?=
 =?utf-8?B?UWk4cjN3VG5HdlZVcXBWK0pIQWpCRStkc0g3c3dPZ09wcklTTDJoSlB2Mk5z?=
 =?utf-8?B?NEtFbnF4TFdTVlFwMUxNMVJDMzV2SGJXa1ZKVjE0eEg4UHRKRi9aaU1CQVhO?=
 =?utf-8?B?dkpFaVI4cngvZGxWczNNbG5LOFZaOTRMTGhtSXBQY28rc28vTzgwK25WaU5q?=
 =?utf-8?B?N2VVa1VxblhJR0dZMVZMM3hzOTlkajdmS25rVkFRKzgzaWh5a1prWW44Y0RQ?=
 =?utf-8?B?UjVHcEdLMmR5TGNJTzB1NkFOWWJ1VXJxNDRjNXozUWJva0lpYURzMzg5bEpM?=
 =?utf-8?B?S05EMlZZUUx5d2pkNk5iRFdBYmsyQmRaclBBVFlUMjh2VzhwOWpZSVZJd0ZV?=
 =?utf-8?B?TDZpbmhqZWFnOUxxMVVPOVJucERpaU1Wc3I1ZTdNUmtWOWhkckZPd1RiRC9T?=
 =?utf-8?B?ZUpQVCtkay84TG5Gc1NXWU5kOU1YWXp3RHcvR1ZKUXVkemErRHpMUHhLc3Vl?=
 =?utf-8?Q?FKBc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3895.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb08bd8-d844-4fe5-370b-08da9fc1a93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 13:18:54.2587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hu9urCmaZWaU9s7xq5gvhWmOmFXxCTZxYdGD9oXgFGJEDUa3r/Z4Vs3avPwirzk5LC/gLK9B6KnObxu5Pkcgaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhlcmUncyB0aGUgd2hvbGUgdXNpbmcgRFQgYmluZGluZ3MgaW4gQUNQSSBiaW5kaW5ncyB0aGlu
ZywgYnV0IEkgaGF2ZSBsaXR0bGUgaW50ZXJlc3QgKG9yIHRpbWUpIGluIHN1cHBvcnRpbmcgdGhh
dC4gTWF5YmUgdGhhdCdzIHdoYXQncyBoYXBwZW5pbmcgaGVyZT8gSSBoYXZlbid0IGxvb2tlZC4g
VGhlIHdob2xlIGNvbmNlcHQgaXMgZmxhd2VkIElNTy4gSXQgbWF5IHdvcmsgZm9yIHNpbXBsZSBj
YXNlcyBvZiBrZXkvdmFsdWUgZGV2aWNlIHByb3BlcnRpZXMsIGJ1dCB0aGUgQUNQSSBtb2RlbCBp
cyBxdWl0ZSBkaWZmZXJlbnQgaW4gaG93IHJlc291cmNlcyBhcmUgZGVzY3JpYmVkIGFuZCBtYW5h
Z2VkLg0KDQpIaSBSb2IsDQpJIGNoYXR0ZWQgd2l0aCBLaGFsaWwgYW5kIGhlIGNvbmZpcm1lZCB0
aGF0IHRoZSByZWFzb24gaGUgYWRkZWQgdGhlIGRldmljZSB0cmVlIHN1cHBvcnQgd2FzIHRvIGZv
bGxvdyB0aGUgZXhhbXBsZSBvZiBleGlzdGluZyB1cHN0cmVhbWVkIGkyYyBkcml2ZXJzIChldmVu
IGlmIHdlIGhhdmUgbm8gc3VwcG9ydCBmb3IgaXQgYW5kIGFsbCBvdXIgY3VzdG9tZXJzIGhhdmUg
dG8gdXNlIG91ciBmaXJtd2FyZSBpbmNsdWRpbmcgVUVGSSBBQ1BJIHRhYmxlcykuIFNvIGl0IGlz
IHVucmVsYXRlZCB0byBEVCBiaW5kaW5ncyBpbiBBQ1BJIGJpbmRpbmdzLiBIZSBhZ3JlZXMgdGhh
dCBpdCBpcyBiZXR0ZXIgdG8ganVzdCByZW1vdmUgdGhlIGRldmljZSB0cmVlIHN1cHBvcnQgKGZy
b20gdGhlIGRyaXZlciBpdHNlbGYgYW5kIGZyb20gdGhlIGRvY3VtZW50YXRpb24pLiBTbyBpZiB5
b3UgZG9uJ3QgaGF2ZSBhbnkgb2JqZWN0aW9ucywgSSB3aWxsIHJlbW92ZSBpdC4NCg==
