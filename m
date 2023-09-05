Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC85A792720
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239055AbjIEQT3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354325AbjIEKmj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 06:42:39 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D449E199;
        Tue,  5 Sep 2023 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693910556; x=1725446556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zO2TeH8W3nTQN2K4xypPfMjPyTwaLw7830e0zs26Sqg=;
  b=EDxxQaCyiBf3CAy8jQwOLCAsLR0vdGgsONG26XYxHlyRyGBvLqxd0F55
   Kso8zxzdR7SPIdX1u4x9u8NUQnxQKifwZ5NaBDd7PUBv0WSWlYSQbHECZ
   AbsY2nY463hprmivZfR8nF79yQlSkWxP4Pc7VG1zWywaDtmo1SUOrXgHX
   JvAc//xU++SMYhKjfb6z61YlexryAZzEXWc9/boD6tNAHUhx1t8hd5Nek
   i3wYaEajITpEDsxPPTokJsA3VAvD+BZSpNj6yNcoc3hpzis9ved/ozirA
   8kl3hR+WY9bvi1K79YM1WR5iy21Mfz8F7vvzVmrYVd4t/0yvajm8Ts2sa
   Q==;
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="233450714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2023 03:42:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 5 Sep 2023 03:42:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 5 Sep 2023 03:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3P7NymUylUJwL4S0QcB/rRFH18Zob0aPGNUtxeqn8fO72CtxgOHd5pQZquNT7yaoOERG0eyhPi+wuV1EytLRadDtUf6/hbp8LUCBYQwIbmRmxiNcqpV1AzM3bvbDf69STtARgSEfwVrsjR3Pnfd/NI9uugPSnmeCkzrY8cGWKf+ztgoJv7s+umCZ8mYbgLMfD4azTzHmu5K66gUZdDyeC/3B6WclObv6AY/hKR5z2nrYLEShkZIumnQ+9TGPXPj1bcaKEiV5gOIhMqq0zI/trzTgxNGogphl+4zEHT/vWctnyGSdUGEQ64QfcPsWhh8SPek3uFOQQDKJ1baNNeGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zO2TeH8W3nTQN2K4xypPfMjPyTwaLw7830e0zs26Sqg=;
 b=bV4Bw2LWYWkoUPUW5BMMi54g3c4m/umfRcehO0QSEGWtJRhqAX9pI1j3emESdAeTo3VqBYRGyYHgZoPW07gltIGbzxdBg6+NfRRCAJP27/pJfV5GgPEeRaD5EsWfqQgQlxSFim0zgFjvSJJ2NZrdC+tZGqdnAlChv0B98DVpJ6DOO6Q3g19V/CpeTP8NEaGZyAMOlcRWnj7+Zays2BdcukUacRkTvtA1o9YUj5hYGw7gGkSQbY8pvRs+kYQfefV1uDD153hRcqlau5BsXuOpZ2kZUDrDOtdGAhdcwYB5YwvHia2fLNiwVLeW3Lito9U260MkcLKV5OJwwpDbwa1iwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO2TeH8W3nTQN2K4xypPfMjPyTwaLw7830e0zs26Sqg=;
 b=OKAJ6i+zhZ13bsGIME7cPx1gtj3pIsJrYhF9igIcxJhVLY19cRIvju4NawoMOlAxIZjuHJ/RXc7Zl5R+A6MLeX+bzwUuN10SevG7cer1XPW8n42sg8Y1DUCazlhwpjHcYK5PKqoZS14z4jjttT5u6b0Iedu6sA37mPL7X6bqdJM=
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 10:42:15 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::591f:32f4:3319:e1f8]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::591f:32f4:3319:e1f8%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 10:42:15 +0000
From:   <Hari.PrasathGE@microchip.com>
To:     <yann@sionneau.net>, <andi.shyti@kernel.org>,
        <codrin.ciubotariu@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <michal.simek@amd.com>, <linux@rempel-privat.de>,
        <kernel@pengutronix.de>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] i2c: at91-master: devm_pinctrl_get() cannot return
 NULL
Thread-Topic: [PATCH 2/4] i2c: at91-master: devm_pinctrl_get() cannot return
 NULL
Thread-Index: AQHZ0H3qopD8VIs6bUqG4/94XB7wXLAMKkcA
Date:   Tue, 5 Sep 2023 10:42:14 +0000
Message-ID: <d7b08ce2-fda4-fd6c-5ef0-14d1a9c25e14@microchip.com>
References: <20230816200410.62131-1-yann@sionneau.net>
 <20230816200410.62131-3-yann@sionneau.net>
In-Reply-To: <20230816200410.62131-3-yann@sionneau.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|PH0PR11MB4839:EE_
x-ms-office365-filtering-correlation-id: 4bed34f9-2fa8-41eb-3826-08dbadfcc4ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Ak05uXx8Bbhr9pJkBdpdMCJ6rPNeY485duGNsMpZWI2T7t1ectYD8NqPd5RUGQxkKdp4hkUCkx9ORKDGqStQMdk/J8B+fMnqCvH8EAFg9gQ+wTWSlTbvm4KYlT6i0xxtJmp3y+t/yFhF7dPnMocIBsNxHubSAk2CjeTITM60UG+fjPuMVqiTGUd9HKfUWVanMPIqm2/F9hqepc2ksyP0m951k+rZOPqz54MbwInjxdipm/03yU/uYOA+5twltSMkYxcQy/j0aKyRsByYTGjUXHA9l6bRkkwDlGKsuH73a8nyWwoe2PTL/rREZwWYH4wC3PhjVdMZGThJCOB4SndEQxeDRS0qjyRvrf/87YoyY2EXg8j9mmAn+dtNO23PtZlXMQSov4oyDZwa3rSTvUBKX0xyNOjXiZLmskFHji0xGvqZ9TVI39gKMdU+ni4t3zHPWILPn4gTwug1k84lfMrb2WX5aucv/54hRQREUYcidBZBFC7gMXtqQKjthbWwG0AdcifoeFPJMuwadx+c20VxB3+PrMqboG5GDSxiq/jj/yMg9HDAOPjLFk+lhVyyXcce5cxcdV2Q3mMTKIjid6ajgKinAtOmAr9dp999nWCNTT3+rktrLRm/3kzvtc3SGivRyC9uAHo2eoLgknhxFfILimck65aPxub6tshd5HbNPI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(53546011)(6486002)(6506007)(6512007)(31696002)(86362001)(966005)(36756003)(7416002)(41300700001)(5660300002)(8936002)(8676002)(4326008)(316002)(66476007)(2906002)(66946007)(76116006)(66446008)(91956017)(66556008)(54906003)(110136005)(64756008)(478600001)(71200400001)(31686004)(83380400001)(38070700005)(2616005)(38100700002)(122000001)(26005)(921005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXJHNnA4cGZXdGdheG9GZlJHMUxEZkpRdDFHdVhlenVNdmVqRi91VzdDMm4y?=
 =?utf-8?B?VGo3aENRSUVhY2UyL2pzbDZlSEoxUjhwaG00TkJiZEJxQStkNFZEem5mMVlJ?=
 =?utf-8?B?eDJaZ08zdVo3Ym13N0k5TkNpUGg1Q2NTTzhKN015dEV3dlZtbHRtd0FkQ1Va?=
 =?utf-8?B?cG9lNWtSQ0Z5elozWGp1VEg5dEk0eTZLQVM0V1lId2pERzk1eHZKUnZ4cHpH?=
 =?utf-8?B?Qk0xLzFyWThKOGtMNWUrcW16V1c0WCt3YmplR2IxMDRJRnJ3L2Y5Wm5DeUhh?=
 =?utf-8?B?bm4zeXpaT1Jxc3hzUlQrOEg4eTNvZjI4d3ozN2lsZlVEekRPb0N0NXFCMmdE?=
 =?utf-8?B?dWUydjMzbEJsZmJ2bkQxaDc4eHNYMTQ3eXQxUXpJNTVIWjVaanErYWZBWnZJ?=
 =?utf-8?B?a3ErK3NaMTVKQXNLWGNYejVkMnRwZU5hZUhWblVpcEJNa2VseDczTGwydFFW?=
 =?utf-8?B?Tm1jaFlubUM5SEEwTnRjeThSOFZOcVFmYnNSRCtMa2UrT3oxbDRNUjBpQlRB?=
 =?utf-8?B?eXlhS1RxNU1ZeGh1TVYyL2Uwbkh0b1AwTDNTZzZ6YjJodWs0QXRqWkpOVE51?=
 =?utf-8?B?WWFkUm4va0xneWFoTFhCMW4zUUFudHRVZ2M1bGNqalZ5dmZScUZFNmtIQk9y?=
 =?utf-8?B?enNQUld1ME5hVUpORGUxK0tZSDl5UExqdm5xSE5xVzVXMVBKOWZEV0pKS0VT?=
 =?utf-8?B?d3B5c2lNaEdqOWVrVnN0RlhYQzB6QVQ1K0ZJOGlndzBWeGRIamNtUCsvUlNw?=
 =?utf-8?B?aGhDdTNsZnNPWXRzcXhZaDZVTXdFTG5namdSM3R5azhrUU52REVySGNCektj?=
 =?utf-8?B?MEt1anNDMkYydHZPY1hiNk5YVEpPM0pqenlLNU9xZzloSFB2MU5keXpEMkpv?=
 =?utf-8?B?WVlkRFJRSitTSDJONkJMbzR4WVpyWTdoWVdDeUdiWmhnc0RTV25qY2pSYUZP?=
 =?utf-8?B?U0F3SEwveUh0dnVyRCtteGpTd2pPcFdJaEFjZmpzZVZaYjlTUStybENrdEMv?=
 =?utf-8?B?cEMvMXBnbUJKa0RYOTNIWUlYbDFHTGlIWWNNVkduYXpVL2xIUzVSWXd2aUQ2?=
 =?utf-8?B?MkUxSXkrdEtPYUV5ZGM4M3dBZmRDcGlzZmRwMm1WZHhFeVFFWTNEazk4ZFA0?=
 =?utf-8?B?eEYza1Y2QktKSmVVOWNHWXllNkZnbzQ0M0RCSFhZTm9naGhzdnYwcUJXSDJV?=
 =?utf-8?B?SkxjK2lZWmNSWGtqb1V2NE5kcXpIV2Z0L1RxVFVmbG1wVGNhUXZiZFR3c01m?=
 =?utf-8?B?a3BxQmtnWkM0bmZ0d2dESDd6bVpzVjJnOUs4NFlvRThjajBNdmwvNXplV1Nq?=
 =?utf-8?B?QUpNZ29CN29wYzdUVHVxWEZlK2wyalE4RWRvcDBUbHh4dC9UQ0VidmZ6RSth?=
 =?utf-8?B?SHhHZU5UTXN0c1pSTU5HSlhJNlNBWVNOaDQrdFNmUVRkd2EzVDRUWXF5SElM?=
 =?utf-8?B?eDBFMlp0cVdPNlZHenZyNTd5a0NUeWdVTnhSMTRrL09hTXFkbTE3ZTVDT0NN?=
 =?utf-8?B?QTlnMmk2OEwvMDQ3TUpyRENHQ3o1QTZ5Z25kMHYrRVROQU9DemQrV043dG5I?=
 =?utf-8?B?MDA5YjZaMGFwVDNVcEVSbjVuWENjR28yVmI0U2piZ0JZelNuSGswUTlEamUx?=
 =?utf-8?B?eDdxVW13U3JFbDhBbUE0SCtMUm8rTmhDT3h5UlhvczlRdWEzWDNuUURxR002?=
 =?utf-8?B?RktjajJjcFF3SmpDV2RKOVZGMk01VU1NUFBJMnNwQXduSVR6QzNJWEJxMHFx?=
 =?utf-8?B?aTIrdEVmU3BDd1dWR01xb2F6VjlvOWxSaEhZekhndXUwNUc0aUFZMDkyRVVs?=
 =?utf-8?B?QUZQYXVFblFZdytjVjdvYkhQRlY0d2J1WStuYU9ZcmZGcjJVMHR3dmNQT242?=
 =?utf-8?B?QXA0WTV4bGFBelF3Wnd1cGp0YkhqRU5qdVM3RUduWlZ2aEtOa2JJWm9tZmo3?=
 =?utf-8?B?dU1tenUzeExISFRLTzNHdlk4b2xMZ0JGWWVNSkFZMm9JQW5DL0Z0azFpbUFy?=
 =?utf-8?B?VWM2VGtjSzhHNC9udklndnMrdldDK3NabUhkUk1uR0Q2YllFVEpKNUhlbFRm?=
 =?utf-8?B?WVZNZmpSNWFiTWJFcjVlTDlKMnVEcm1Rd0dQb2lMTExDVTRFa2xHaU5JN0J2?=
 =?utf-8?B?cFA5cmtaQ0VpdlhIUXAzeXJIOC9jbmh0aUtnUkdZcXdkckZwekhuLzQrakFa?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <686E7BEC06169249B9672E94F63431C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bed34f9-2fa8-41eb-3826-08dbadfcc4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 10:42:14.9833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEa7BUcMT0JA1nnzQW8N58Kv/kJsH6VlgNBWWPYzcAlY//VyMf42GnED0ZdUJ1Yab5s/aQn6MCinHV4WSJkf5pj+MP86pqhptHfyRaoMXqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4839
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzIGZvciB5b3VyIHBhdGNoLkxvb2tzIGdvb2QgdG8gbWUuDQoNCkFja2VkLWJ5OiBIYXJp
IFByYXNhdGggR3VqdWxhbiBFbGFuZ28gPEhhcmkuUHJhc2F0aEdFQG1pY3JvY2hpcC5jb20+DQoN
Ck9uIDE3LzA4LzIzIDE6MzQgYW0sIFlhbm4gU2lvbm5lYXUgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20geWFubkBzaW9ubmVhdS5uZXQuIExlYXJuIHdoeSB0aGlzIGlz
IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRp
b24gXQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBSZW1v
dmUgdW5uZWNlc3NhcnkgY2hlY2sgYWdhaW5zdCBOVUxMIGZvciBkZXZtX3BpbmN0cmxfZ2V0KCkg
cmV0dXJuIHZhbHVlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWFubiBTaW9ubmVhdSA8eWFubkBz
aW9ubmVhdS5uZXQ+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0
ZXIuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFz
dGVyLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCj4gaW5kZXggYzBj
MzU3ODVhMGRjLi5iNTk4ZDI0MzllYjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtYXQ5MS1tYXN0ZXIuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEt
bWFzdGVyLmMNCj4gQEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgaW50IGF0OTFfaW5pdF90d2lf
cmVjb3ZlcnlfZ3BpbyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiAgICAgICAgICBz
dHJ1Y3QgaTJjX2J1c19yZWNvdmVyeV9pbmZvICpyaW5mbyA9ICZkZXYtPnJpbmZvOw0KPiANCj4g
ICAgICAgICAgcmluZm8tPnBpbmN0cmwgPSBkZXZtX3BpbmN0cmxfZ2V0KCZwZGV2LT5kZXYpOw0K
PiAtICAgICAgIGlmICghcmluZm8tPnBpbmN0cmwgfHwgSVNfRVJSKHJpbmZvLT5waW5jdHJsKSkg
ew0KPiArICAgICAgIGlmIChJU19FUlIocmluZm8tPnBpbmN0cmwpKSB7DQo+ICAgICAgICAgICAg
ICAgICAgZGV2X2luZm8oZGV2LT5kZXYsICJjYW4ndCBnZXQgcGluY3RybCwgYnVzIHJlY292ZXJ5
IG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJp
bmZvLT5waW5jdHJsKTsNCj4gICAgICAgICAgfQ0KPiAtLQ0KPiAyLjM0LjENCj4gDQo+IA0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdA0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsDQo=
