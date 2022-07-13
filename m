Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B08572FF4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 10:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbiGMICY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 04:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbiGMICX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 04:02:23 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13178E9213;
        Wed, 13 Jul 2022 01:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqXkEZ8dNiYgnb4qkdXo6o0optYwlpqWPzUiUcVGClgoWQybSKrQlAuiaLWg/MXB1E3wdy4LwMu7ifrszrXa6wqMh3n1CeOLTEVBJq22yYVRGpRYe2XqJ43GBgiRYcAWd9sWh4RkRJVtgS2U8VMmoxt4fu4MfLCxRs+hfyFaYH+nmVZgtetki7BqUUOH/RnIYYxZ1bt9X8c2jfbPA2HrgpP3G5Xk4acgdtPMdAw6L6lsf6nDJIsf2kldsYFLQcvkjL92tGH57PuwMg46MHrUpdy3dyV/s8ANEqSQ43AFwAKpMVChCnRDr2AY53QqpETZq0V/K2S9G+ulJcdVnHDjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7awTudDVZ0XD922gE+6MKlDFdzrcvjjvY3LNOnDfhU=;
 b=fbGm6lET/batFbHk7TjmSYB6mY4h9mDUtHT4xzWPWmatsMOoYmVa1Qagj60KlWde8+GxBnbIoCiVOMxNG6SqpWt9Vizp0Ng/78KR21tltINGmtlfOhREGpaKe6GjoMu+BzeQrXAK8Q8Dd+gXz0foW2f3A4qqPE+5Mv/PvSDkWI5yGDPbsys0NNejh7d9gQmSnMx1iSPs09OTGTKXuKZkwMHDNGN1A3y5RW4GzKOTqOF7Cn73vHowSWy+6Q//5d2ZK/yeMz9UxBy16gfXYnvP92BggVrIviVy/XGKHIOVT54zIvaGjvUcwG3MFMBod2eexmY3yTTkSfXDFzZ8Hupumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7awTudDVZ0XD922gE+6MKlDFdzrcvjjvY3LNOnDfhU=;
 b=e+lNaVoDCXVjmlyTYw2R0M6K862O5vvZXdYGasaPEmd9VGSdoBYcnvoQveMGXKNJT2frAqhK/pnNHdU02kvIiw5gGbF4Ka97uMJkmWxlVcQ8bG0n+eorqh6geysetNkmVPsp5E0QuLlRJtavbyCrXljwebCQevRvxb8TkMVmjFA=
Received: from DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24)
 by DM5PR12MB2454.namprd12.prod.outlook.com (2603:10b6:4:ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 13 Jul
 2022 08:02:19 +0000
Received: from DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::c065:99fe:41:cef1]) by DM6PR12MB3932.namprd12.prod.outlook.com
 ([fe80::c065:99fe:41:cef1%5]) with mapi id 15.20.5417.021; Wed, 13 Jul 2022
 08:02:18 +0000
From:   "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
CC:     Srinivas Goud <srinivas.goud@xilinx.com>
Subject: RE: [PATCH 12/12] i2c: xiic: Correct the BNB interrupt enable
 sequence
Thread-Topic: [PATCH 12/12] i2c: xiic: Correct the BNB interrupt enable
 sequence
Thread-Index: AQHYh8McjLGQdhEGyUidZTLotQ5Kva1mZJoAgBWpKNA=
Date:   Wed, 13 Jul 2022 08:02:18 +0000
Message-ID: <DM6PR12MB3932349AFA8E8A9CCBA898628C899@DM6PR12MB3932.namprd12.prod.outlook.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-13-git-send-email-manikanta.guntupalli@xilinx.com>
 <6a0df607-3d60-fd8d-54d1-3eb849d9c035@nokia.com>
In-Reply-To: <6a0df607-3d60-fd8d-54d1-3eb849d9c035@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44400231-c0ae-49f4-9551-08da64a60225
x-ms-traffictypediagnostic: DM5PR12MB2454:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p99nbd2nu7ur8+3kYw8E1IhlJAV6NjM1CwF5qkdiwtL+P9EUCqKlzl/EL+4Z+Dy0eNB4RFeFEWxhrgClqOLuxKjJMEF8HX2ErduZMJrh4v9pJA0IAtpmq/hUo4twj0F8cmVIVdFNkAYvoT3tF5Yh5oCorsGWEuKMja15bQ7jIXWuvbgpRfkodrG49V1+caYG1ADu8W6miuEsOzKylfsQWO9Il87qfdWgHbJividu9tth0QAIXWgxkv6oVCm0TZMhM0p8aA63woetaa0B6UzvDFw8pfZrw4ugUIlrZvM+RMz2+qNqB+fiDAtKUDFt72skRTocS7JP/6rO1pwlmb0uQgbIVVWC6Hwg6TVI0kLL8d6tjb7uZ5SP4RDHNBU3TioqGbzjWjCUFRMZ/+1nQ9xY3dKN/HfFPD5o83Qf63NgFrCbn0Z+/UIMSIjda03uRyCI9tjpI3HAVHrsrErF53BIFS+MbT80V9pdo7sjjeUSbOiWEMoKmgowYafnlo+C523+iJUj3pxm1WTAow6cmjH67n0qosMb3A9mxk0ezp+UEtaR+5OtC8fobLZjpysanzl6oxzxAjk81XoxO6Kyb5uVvtyLe8wYBhKvcXhxA2gpY6DobvrzuGJpuAiMdFU3OuXeBNI/6zvLHCNP4l+AIul5XX0IEhWqBSGM7EcGyezdby1QYiyQDNHdK5qEFcbi0YC7qhM7yXCdE3YICYadlEeA7rmuHJLquL/Jh2XvDCT11rnnrphcOfxr+XELVZKKEOj+5/FD1bMQaM74Fn3rj1DFF/1bl5OfdAuPvcdizP0gY8Ur0Jnor0OR3LWMfmGuPVV0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3932.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(110136005)(6636002)(107886003)(2906002)(296002)(38070700005)(5660300002)(316002)(86362001)(52536014)(33656002)(71200400001)(55016003)(66946007)(83380400001)(4326008)(76116006)(66476007)(8676002)(66556008)(64756008)(6506007)(478600001)(7696005)(26005)(53546011)(41300700001)(9686003)(186003)(8936002)(38100700002)(122000001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXlobWY1b2tBRXJudURnMjdFSEFuV0pPR2QzR2NpazM3RDl6V1pCQjgvUG1D?=
 =?utf-8?B?OGdKZU02ZldubTFRYjdhTGQyNFBqL09MTHc3UnpiZk5VR3R2RFlPYjVZSHdZ?=
 =?utf-8?B?WmJ4R09ZRXhNeWRHM1VlMEJoYUFjenY3M1FiajZXNFpib2JmTW9Fd3c0aXdV?=
 =?utf-8?B?UXNMWjR1dVJGbm92L0RNNk5pZlZ3NHFrd1JBMkFIU0oyWkx4K3RsL1lWb2NI?=
 =?utf-8?B?VWFSL0pVbUkybDJ6bmxYT1RVcHpoUmlNeXpuMzAwSGN1c3ArcHFPMWJxYUh2?=
 =?utf-8?B?cGphYWNoUnNwSG4rdHZHaTRoTHplTE1qWjJSeUdkaUR2SWRRb0RhQXJLeEJD?=
 =?utf-8?B?ajZ2RTA4WUYwNGlCbWNPcGkwYjY2bTRtZnFEVG1hd1V6d0IwNEFOdmxieXJs?=
 =?utf-8?B?dDZabXRZUXZraHE3aldSZUZPRFpPL3lKZVVKM1Qxb3RSenI4TFZzdFdlSGRt?=
 =?utf-8?B?Q3F0bmZoeHZET2VUOGwxTlEvMXFQSXBJc2k5eWpPd0FEaWkrY3hwZGI4MDBj?=
 =?utf-8?B?aGtVWFNnazVFQVVqNm9RR0FiQnlzZ2lxeEg5SEhMYWlpYXNqSWo4L0ZXQ0xw?=
 =?utf-8?B?dXRFeU5td1lCL25QZUhqYmFad2NnMGpZQXhndHpSSXZpNmo5ZzdWVlhWSUZQ?=
 =?utf-8?B?Zks1NHM5aFV6NS90S3dtNjJTbnAvWTJQWGhaaUhHN2dNTVlYcTM3R05VdGhC?=
 =?utf-8?B?UFkrWUcvK2MxK1VuM2g1eDFZeUZhNE5GcnBLN2czV2s2N0JpUXprYitNcTFN?=
 =?utf-8?B?dHZLZFVoNHkrT0c4Tm5iOUVZNWRnQ1RKV25pMWNuWEl1WmF6QVVqa3g4c3dU?=
 =?utf-8?B?OUc5aG5EZ0dzcG9WMmdKSUdIdU1mWXY5NGwxTlpQQWZDUnYzdUFjMmdIb1M2?=
 =?utf-8?B?VTZJcDhXaTNuTXZLVGY3ZVZSOVV1Yk5KNmhseUJxUUIvWXMvTUo2ckp2dHNB?=
 =?utf-8?B?M1NicW1DNUJudHdDTVc0QmlZZjNhMm50OWpnSTFXaXUzM0xJYnRvWlQ0QTZD?=
 =?utf-8?B?TitDZFBoNVRyWEtacVFUN3lUdUNHZU8rK1p1U0NTMmFXbERnU0NXZHczYUZw?=
 =?utf-8?B?aG9jcVgvbENOeUozRUR2WEN4YXQvQVNhSXhLamlvN0NkMVdZK3poYTJBaVVN?=
 =?utf-8?B?L3dnNjFydW1YZXozZjFhTXRBTk1jbGFzcGxqc0pseTBGT01hdXhzQi8rTmhJ?=
 =?utf-8?B?WG5iL0RnMnN1SkQrcThYdyt1eWVSa2tWVDZyRFVWd2xMMVZqOG1RT3pucThJ?=
 =?utf-8?B?QTdnd3F2NUVRbHFtblVVS3d6WEtqeTBZNzJDN29VNXBBTzkrazdmL0ZCekxD?=
 =?utf-8?B?MFZoZ210RnNhMFRyNGJGajg1TnRVSnkvVWJVRkp1NUlSYTJMUHJUK2ZTUE1D?=
 =?utf-8?B?UXhaVngyZVMzZU1ydVZ2Z05lT29mV3JkRkI1K1d2L0JlZk1xZ0wxdGVSRW1p?=
 =?utf-8?B?YXkrc1o3MlRvR3Q5Y2JPWms0blhmcllVbkk4NW8zai9ZZW5qOGhXS0VhallB?=
 =?utf-8?B?NUhydmJIV1hkYk5lQlFXUlFxdDgvVFBnYUFpeHFoaEZyNGs3a2c0azI1L0h3?=
 =?utf-8?B?MzN6SFlVVjA5WTA1cFdjVE8weWc2d1pZWXJKN0t4NzN6c3NOQUFvanF3UkpI?=
 =?utf-8?B?QVlpUmM0U05JMkt3TnY1dUVYRTExSmN1bTUvb08ydzd3VmczU1dDZmFJN3Fr?=
 =?utf-8?B?MmlGN1NENE5PdWpUOTluZWwvYi9iOEQ5MCtEY0t4S0J0OGpQWXVlYktQaW9P?=
 =?utf-8?B?QVFXL3VkWjcrS2RtelJaOWtsRExjMCtBckNlQi8xSHc0cUpENW5WSWhCeEVi?=
 =?utf-8?B?TU82QzUrdU8vaWpQdUJVWGpSQ040ZGVGbFBoUytkQUVnSUVSMk01Y1k1YWZn?=
 =?utf-8?B?UzhkcFZyWDE0eWh5REY1dGFCdTJoN28rU0pPOHB2czdzMGxkT3hQeUZvemlu?=
 =?utf-8?B?cHpHeEUwSnZLNVV0Wk5LSSszc3VwMXc2UUowbWJKcTVYMk1rWGxqSWc5UVU1?=
 =?utf-8?B?RndXTHREZm1nWUtRald4NFJJUTlYUjJPUUlST0hML3ZMa0syTWxVUWRxT255?=
 =?utf-8?B?bHZ6NFNobGFDVzBxYTM5UjdRWDZTWTJtNDcwRmpKRG9VZS9FWmVSbEZJemsv?=
 =?utf-8?Q?6spc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3932.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44400231-c0ae-49f4-9551-08da64a60225
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 08:02:18.9087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/3MRZxgTNHvymhBu1PjPA/JIbuMtnqVePK9p8mUWPIbi3N55LajLMGdUjx400wCmyLbkG0VIDt7cxzU+j5HEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBBZGFtc2tpIDxrcnp5c3p0b2YuYWRhbXNraUBub2tpYS5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVuZSAyOSwgMjAyMiA2OjQ0IFBNDQo+IFRvOiBNYW5pa2FudGEgR3VudHVwYWxs
aSA8bWFuaWthbnRhLmd1bnR1cGFsbGlAeGlsaW54LmNvbT47DQo+IG1pY2hhbC5zaW1la0B4aWxp
bnguY29tOyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IGxpbnV4LQ0KPiBh
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBnaXQgKEFNRC1YaWxpbngpIDxnaXRA
YW1kLmNvbT4NCj4gQ2M6IFNyaW5pdmFzIEdvdWQgPHNyaW5pdmFzLmdvdWRAeGlsaW54LmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxMi8xMl0gaTJjOiB4aWljOiBDb3JyZWN0IHRoZSBCTkIg
aW50ZXJydXB0IGVuYWJsZQ0KPiBzZXF1ZW5jZQ0KPiANCj4gQ0FVVElPTjogVGhpcyBtZXNzYWdl
IGhhcyBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBQbGVhc2UgdXNlDQo+IHBy
b3BlciBqdWRnbWVudCBhbmQgY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNr
aW5nIGxpbmtzLCBvcg0KPiByZXNwb25kaW5nIHRvIHRoaXMgZW1haWwuDQo+IA0KPiANCj4gVyBk
bml1IDI0LjA2LjIwMjIgbyAxNDowNSwgTWFuaWthbnRhIEd1bnR1cGFsbGkgcGlzemU6DQo+ID4g
RnJvbTogU3Jpbml2YXMgR291ZCA8c3Jpbml2YXMuZ291ZEB4aWxpbnguY29tPg0KPiA+DQo+ID4g
V2l0aCB1cGRhdGVkIEFYSSBJSUMgSVAgY29yZSh2Mi4xKXRoZXJlIGlzIGNoYW5nZSBpbiBJUCBi
ZWhhdmlvciBpbg0KPiA+IGR5bmFtaWMgbW9kZSwgd2hlcmUgY29udHJvbGxlciBpbml0aWF0ZSBy
ZWFkIHRyYW5zZmVyIG9uIElJQyBidXMgb25seQ0KPiA+IGFmdGVyIGdldHRpbmcgdGhlIHZhbHVl
IGZvciB0aGUgbnVtYmVyIG9mIGJ5dGVzIHRvIHJlY2VpdmUuDQo+ID4NCj4gPiBJbiB0aGUgZXhp
c3RpbmcgeGlpY19zdGFydF9yZWN2IGZ1bmN0aW9uIEJ1cyBOb3QgQnVzeShCTkIpIGludGVycnVw
dA0KPiA+IGlzIGVuYWJsZWQganVzdCBhZnRlciAic2xhdmUgYWRkcmVzcyArIHN0YXJ0Ig0KPiA+
IHdyaXRlIHRvIEZJRk8gYW5kIGJlZm9yZSB0aGUgImNvdW50ICsgc3RvcCJ3cml0ZSB0byBGSUZP
Lg0KPiA+IFNpbmNlIElJQyBjb250cm9sbGVyIGRyaXZlcyB0aGUgc3RhcnQgYWRkcmVzcyBvZiBh
IHRyYW5zYWN0aW9uIG9uIHRoZQ0KPiA+IGJ1cyBvbmx5IGFmdGVyIGl0IGhhcyByZWNlaXZlZCB0
aGUgYnl0ZSBjb3VudCBpbmZvcm1hdGlvbiB0aGUgYWJvdmUNCj4gPiBzZXF1ZW5jZSBjYW4gbGVh
ZCB0byBzcHVyaW91cyBCTkIgaW50ZXJydXB0IGluIGNhc2UgdGhlcmUgaXMgYW55IGRlbGF5DQo+
ID4gYWZ0ZXIgInNsYXZlIGFkZHJlc3MgKyBzdGFydCIgd3JpdGUgdG8gRklGTy4NCj4gPg0KPiA+
IFRoaXMgaXMgZml4ZWQgYnkgZW5zdXJpbmcgdGhhdCBCTkIgaW50ZXJydXB0IGlzIGVuYWJsZWQg
b25seSBhZnRlcg0KPiA+ICJjb3VudCArIHN0b3AiIGhhcyBiZWVuIHdyaXR0ZW4gdG8gRklGTy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzIEdvdWQgPHNyaW5pdmFzLmdvdWRAeGls
aW54LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FudGEgR3VudHVwYWxsaSA8bWFuaWth
bnRhLmd1bnR1cGFsbGlAeGlsaW54LmNvbT4NCj4gPiAtLS0NCj4gDQo+IFsuLi5dDQo+IA0KPiBE
b2VzIHRoaXMgc3B1cmlvdXMgaW50ZXJydXB0IGNhdXNlIGFueSB0cm91YmxlIG9yIGl0IGlzIGp1
c3QgaWdub3JlZCBhbmQgdGhlDQo+IG9ubHkgcHJvYmxlbSBpcyB1bm5lZWRlZCBleHRyYSBDUFUg
bG9hZD8NCj4gDQoNCk5vIGZ1bmN0aW9uYWwgaXNzdWUgd2UganVzdCBjb3JyZWN0ZWQgdGhlIHNl
cXVlbmNlIGFzIHBlciBJUCBjaGFuZ2VzLg0KDQo+IEtyenlzenRvZg0KDQoNClRoYW5rcywNCk1h
bmlrYW50YS4NCg==
