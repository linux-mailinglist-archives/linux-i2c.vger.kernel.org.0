Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F905A2832
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Aug 2022 15:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344132AbiHZNE3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Aug 2022 09:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344003AbiHZNE0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Aug 2022 09:04:26 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3917CD7B7;
        Fri, 26 Aug 2022 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661519062; x=1693055062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2QuUQ8Fh0zybpNhnaSZMLtp0StaNMWRO4WMS3rrxrjU=;
  b=Q4OhZ8o6mA+Lt+cQOr+XufsD6wUqNs8fXN5ts83Wa3N8QYOyKIfDRjtq
   b/4lBPFzB6be6p/+Kk/rihyisP3lDbrXvfKsJ2LLATKktdOxEYyQ4raPQ
   iMy7KDIv50PuqXrROYlHG123T2TdBBs0IX+RmqYwdp1vHsWJWfU6FxPjA
   C9XaYO7VT+JxqrG4OpFN4zFL9zpQ4BJacLvcQtPSNk7hGRj6BguArTuNX
   x8HeZonnKgjgEfHiPI/SheP1SXywVDXrTTQFz1sPtdUPpj/yF1NZCq1kQ
   o44RCsRX2ShiDlHecWNFGkAKV5A1Y8yT7yq5fXQ2pX/PWDuTwg9E2Yg+u
   A==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="178012429"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 06:04:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 06:03:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 26 Aug 2022 06:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVnbBOfCsU4SU5rzmLGEmeXmW7zbX8bxeqezdOXNm1Sdygl38cgyzWKPqBvp+ruY6UMlDvSJ1UJBfq10tz6EeMAj+SENTrYgZ6qEBMxRvVPHt65AkZ2xLEvqc/bOyALnMFWhMfDz+z/kVJzc28+6YHFbjEQPxsPWjYsZuX3Wyz8vID62jLnAoAQnk+Z/Iauf4Ccnl+HNW92HklOdRsc76OE/NvhICcUyghrP27u6ICrGf9cIUuT0Rb4EMTswJXSh/bF3GXEcS95Zodz67YSaAq3WTBPUxmFU9tKjXNJDSho0z0P4dL9vpgy994UK9RHgI/tByOBWeCLHK648U75XvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QuUQ8Fh0zybpNhnaSZMLtp0StaNMWRO4WMS3rrxrjU=;
 b=eBjZOnOEO6vO7FEqSiUFDxHDLZXMv5mmvNECCD0WEPgcwmHO1trl9iiXSM93risF3+pKciEU8NilDHVLl8s2IE8t8dF+8UZj9n4lFP2aO0p9MS2egwSfd+DsmY1JwQXbn1dh7Zrjh9KPOzIZF8xZmYS2AtHSHYJae10q6qnFbj4Cp74dn3ojOJ+fV1S9ICXvEq3NWu2oVLAIhjlGPaSwUzltBmc3hJ+QEh9rbMEN661SBGiSzJI7oLIA4EhiYGDDmJv+XkvGSq5X+qkqEHIQZhizwbMJ+OFWbjF7WBkHHF21aOwMDeVHCkGjn7JmKSPxClT9G41MxFQj56bmV6LExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QuUQ8Fh0zybpNhnaSZMLtp0StaNMWRO4WMS3rrxrjU=;
 b=JuZHbE4BglIF7O65mgIfuaPwPU01yt7IN41+Vm7ieSSRbXB3jyQfs1W0rb/UWoioYOgF5cNjsmMYqflDXbIVt9YK3/rYXx/jV/mKHOaK6HKGw2bYQ2N0rUt2jBhgq0TdGo31R8dz00hK1kW16XXbSWrixmVMOP3nANXghKi+Daw=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by BL0PR11MB2932.namprd11.prod.outlook.com (2603:10b6:208:78::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 13:03:53 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42%5]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 13:03:52 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andy.shevchenko@gmail.com>
CC:     <wsa@kernel.org>, <krzk@kernel.org>, <arnd@arndb.de>,
        <sven@svenpeter.dev>, <robh@kernel.org>, <jsd@semihalf.com>,
        <olof@lixom.net>, <jarkko.nikula@linux.intel.com>,
        <semen.protsenko@linaro.org>, <rafal@milecki.pl>,
        <UNGLinuxDriver@microchip.com>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28lckAgAGLSYCAAEDGgIABOm4AgAASYACAAOS9gIAAl+iA
Date:   Fri, 26 Aug 2022 13:03:52 +0000
Message-ID: <a1d8278eb7e94c26de1022eec480a22fced120f0.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
         <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
         <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
         <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
         <YweFttaSE2GOoW83@smile.fi.intel.com>
         <8f9e8be7084ad78671198f03313058809038a3f8.camel@microchip.com>
In-Reply-To: <8f9e8be7084ad78671198f03313058809038a3f8.camel@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f8b7a1d-4725-4e2b-9f7b-08da87636d1b
x-ms-traffictypediagnostic: BL0PR11MB2932:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nBxOeasfjXFOw6J4E+3FHmTA6VFJ8SwjxtFPnYx1i9z7OeOrWPm/MunxkLEE++xtHraK5nRJmr5GQYJI9oZEA82j9+tDrFu23UtaqyDBxMO2i/XqkyedlZUR0LWFOSGtFfayhrSNL3gEmVvtKyZJ5AVsjzQC3N873vP7KixpQscIjn3bZUq+ch4TOza6slH7ZCXADSByYyvEjKfiIYUK7lDXivi3OGzGNX7+oNt8ErhuSFcWL6uNTs8FA6zRz0XEGJzhW6P9BRim1DGc8hZQzayLtJEJjP4EA9TIS09w6aW1GgaDieO1A1PbU+gJl2YNTHw4V0UONkMYy6wOjEUTAtQIzPL0Olqa5lxHSghzCB7dxI2259MNMPnOldWrYGUaQ1QirMH07xYrqN1/B9J4nrAUjY0un0S40gdAo2qrwCEWKFfb4ZPgB5BUE/V2wnxmWqGmn9cHxJQ2j1H7Pn83KJtfeJjs/Nn4LmMV9Hze8i/eHSsvx9NMhGj07BTDiOnUQ4y3HKvuE5S9q0qdOibA5qzbkodMsf7ss11f51oY3F5nk6BFGb2xtGF9YbWaKyEl0B1HUZARzhlwrUuzZCPzmfeXuR7yhkyBfFg+Bn++mQl0R1ZVN5oNWYTq0rFHbdGIDs5tZ/9Ubaq953r7e7tvblkPXpHSZO6RXtOV2/lyES1n9USJJ57UY614VUWK+kAeEz6fTOwTwijstVu0qCZatebkNPUCOw5P8dp+YeVz7IFloqCIQl5C4GM0UtJn8KfvZc5cduvEx3xC0aKpWVb3/US4yDkXZ7FIoP2RfJoZw3I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(396003)(39860400002)(136003)(83380400001)(478600001)(186003)(2616005)(6486002)(5660300002)(4326008)(54906003)(6916009)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(91956017)(8676002)(2906002)(36756003)(38070700005)(38100700002)(8936002)(7416002)(122000001)(41300700001)(71200400001)(26005)(6512007)(6506007)(53546011)(86362001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWc4VkRmVWk4cG1qUGc3V1BXbmY0MnZoOHd2amd6bkJXNk5KajB3S0VLUm10?=
 =?utf-8?B?N3ZNdnFCbEpLS3o4M0pZSWFyMGxtcHJpdXVjaFN2dk1ZQUhzcnFtWVNMK2Fw?=
 =?utf-8?B?TlROcUVSVndyWnhpeDVEanJUR3AvTlFBc3Z4Y3doM1F5VXErazQyQ2JVbUty?=
 =?utf-8?B?QW03L0RxdFY3dHREMXBpMU1maGtYT1o4OCtadEYxaW1uNytQQnlYbVdJUWMr?=
 =?utf-8?B?WUgwWitUYU4zOC9YdlVMVmtvVXZLZlUyU3FSazA0bzR6K0hIS2lGVk1tdjZQ?=
 =?utf-8?B?bHJXckZMRjZlOVRvcjJaRDRuUUZzUVQ1QzNUWWgwT1B1VCtQazZtM3gxL3hT?=
 =?utf-8?B?WTJVU0ROZFk0TzNCcEJ2OVU1ckdKd24vQmU5KzFvZkVrejJQcm5CVHJ5ZUps?=
 =?utf-8?B?VkszbmlIY3U4OWhXNE8zOHZPdmw1c0ZlWWEwRkh5ZHdPbWNGWEMzSzVTd2Rx?=
 =?utf-8?B?dU1PMW5oSlVsSHRJTm0vS2dSSno5SDhKSFJGY1Qwa1kwckQyamdBSi9YQWNt?=
 =?utf-8?B?MUZJQUt5Uy9NdUV6bmp1M1k4SCtPZ3dxS01ZeWxOMXFzUlNuYWJVell5NHhM?=
 =?utf-8?B?SUpFdkFEbEM3TUxZUngvMW1tdnUrcTAzdTBILzg2UjFaMkE2aFBtcnBSbGFa?=
 =?utf-8?B?NjV1SXNiUW1mKy9MKzczclRZTGg5NHAyMFVlczZkaEtwN21XL1k5VkVpWndz?=
 =?utf-8?B?WFoySHlyQ0V4RDF6Qm1kOHZ1aVlucUxtSDQ0WVpVaU9BQmRLUnV4eWg0ZkdN?=
 =?utf-8?B?d2VPb3JUQzNlWUlQTDZkL2N0ZDR4ZC9SVnZaNVJPTmdEaUtlMmRWSzJscUtz?=
 =?utf-8?B?by9QRmJMc0ZXYzZlZ0djSUY3ZHB4QUNFZHlORmhldEpoY1hNb2ZORkxWY2ty?=
 =?utf-8?B?SnBTTkM2RUdmVUVqU2pvWjBBa1BoamZsb0pQTkU0ZjdwMExlU3JTdmdLdHhy?=
 =?utf-8?B?T0kzM2RvMnIxSXY0alZDUllLd3NlU1pOSXd2b3dGRVp2bjBtbEhELzFqMkZO?=
 =?utf-8?B?dVBzVWtZS01WNDQvdVVta0hkbTVpWTgvTXAxUlJxcW1BZ0pobTNMY21uTVJq?=
 =?utf-8?B?VjF4VzJUWktwNXIydm8zWDl2eFVjWjUyYU5jWXNqUEY2NkRMNm5OaDdZcUI2?=
 =?utf-8?B?THZ1ZGpFelcyT05lNmxsSzFFQmk4aGNkRVFKVEF2cERVMG9NNFl5NmxNRnlB?=
 =?utf-8?B?cFdsOEk4RkpOTmxuOHZIMUt2VnZadXU0Z09KcUhZV3J5Q2EySzYvVVFEa2xS?=
 =?utf-8?B?Qk04eDFETHFHSmRoUlNZVHp0TUxnbnorbGFueDgvOVlDVUNENTRQMnY0eisw?=
 =?utf-8?B?NHZjZWpzenFmdlAwZHRzQVNDYWlyQlp2dkRGc3lNcThuSnpSaWQ3TjErKzRG?=
 =?utf-8?B?S3hkWFZLMnRuWjgwbnNLYm1JdERKZVNHU1dtQTgwZHNJbi9LblNKOHZab2t0?=
 =?utf-8?B?RnBzVUNCSE5UdnM2SzB6V00zMXNyMm1RV3dWOHZsZGdOckx3aTBvRW10ejRF?=
 =?utf-8?B?UElQQVE2TXlORHJENWZPRWFvNjlqWkE2NkpLaHc1bVIwM0NBYk1hd241MW5q?=
 =?utf-8?B?c1hzdXdVWjllK1dWMm5EcEtEcEZGWjdiQnlEc0FKVW5mMERIbkcxWnNXZ08w?=
 =?utf-8?B?STJ0bFhXTWY0TUZIcDBaZnI2cDVpSXBmck1sR2Q0T2NkM29Fa3dDaDZ0SjMy?=
 =?utf-8?B?OHlMc3hwN1F4cnhhblI4NkczelV0SnpFVUl6Snc3OFNSWTFVRmV6MTE2VU5D?=
 =?utf-8?B?MEk2azE3azlPbCs5alkyVnZKeGxILzc4aHNpdTVVOTRVSTh2VkloRW5ycTg1?=
 =?utf-8?B?MFB1R1o3N2tJc0tkSkh2OWkySFh4aDQwTkVoL1RBVi8ySmVHTXlEeEp3ZDhM?=
 =?utf-8?B?KzlHbVJHMWY3Unp2enFNNVFPbWxQQ09jeVROZldrM0t6M0R2b2VKaFIxalkr?=
 =?utf-8?B?RkxST0xuVjI5S3dqUG8vWGJTR3Q2a0RpV3ZNWHY1M09UVExiMWpVNFN3dTFU?=
 =?utf-8?B?V3cvZkNJOW9qUUh4SmxqSnVtR0tkeEhvZit6QXZEZFJsSVd1akM4YTRmMHI1?=
 =?utf-8?B?VmxpOXRRcnlKMngxOG96Mk9VMDVVVGp6UnlLVHZBdGFyL3VQMTFQQlNrTi80?=
 =?utf-8?B?TWdGajFmU1loMmdqUkI5M2I5M09RakpXNWtqWkNOMHNSaVA4RFdOYXBac1FT?=
 =?utf-8?Q?4lmDxi+yHfQffORa/Z+1yqf5JEeXOJ4C86vYahz4efpa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC4EA08E7975434A884A9254510C455B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8b7a1d-4725-4e2b-9f7b-08da87636d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 13:03:52.8073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GD49qsLijW/8bEGvGALiBVD4HTnNpozS7VoQ6rO0x3WIC9uYi25saqP+FDhJeM1aR0sGwXYZgMLPobe0dM2jTGT+xgiDFnRlU9q+ClMBFHe1qwKXyEr7WP2Yv3rp6GwN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2932
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIyLTA4LTI2IGF0IDA0OjAwICswMDAwLCBUaGFydW5rdW1hciBQYXN1bWFydGhp
IC0gSTY3ODIxIHdyb3RlOg0KPiBPbiBUaHUsIDIwMjItMDgtMjUgYXQgMTc6MjIgKzAzMDAsIEFu
ZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiANCj4gPiBPbiBUaHUsIEF1ZyAyNSwgMjAyMiBhdCAw
MToxNTo0MlBNICswMDAwLA0KPiA+IFRoYXJ1bmt1bWFyLlBhc3VtYXJ0aGlAbWljcm9jaGlwLmNv
bcKgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjItMDgtMjQgYXQgMjE6MzEgKzAzMDAsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBBdWcgMjQsIDIwMjIgYXQgNjowNCBQ
TSA8VGhhcnVua3VtYXIuUGFzdW1hcnRoaUBtaWNyb2NoaXAuY29tPg0KPiA+ID4gPiB3cm90ZToN
Cj4gPiA+ID4gPiBPbiBUdWUsIDIwMjItMDgtMjMgYXQgMTg6MDUgKzAzMDAsIEFuZHkgU2hldmNo
ZW5rbyB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDIzLCAyMDIyIGF0IDA4OjI2OjAz
UE0gKzA1MzAsIFRoYXJ1biBLdW1hciBQIHdyb3RlOg0KPiA+IA0KPiA+IC4uLg0KPiA+IA0KPiA+
ID4gPiA+ID4gPiArI2RlZmluZSBTTUJfSURMRV9TQ0FMSU5HXzEwMEtIWsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDB4MDNFODAzQzkNCj4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgU01CX0lETEVf
U0NBTElOR180MDBLSFrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAxRjQwMDlEDQo+ID4g
PiA+ID4gPiA+ICsjZGVmaW5lIFNNQl9JRExFX1NDQUxJTkdfMTAwMEtIWsKgwqDCoMKgIDB4MDFG
NDAwOUQNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU2hvdWxkbid0IHRoZXNlIG1hZ2ljcyBi
ZSBkZWNpbWFscz8NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgUSBzZWVtcyB1bmFuc3dlcmVkLg0K
PiA+ID4gDQo+ID4gPiBUaGVzZSBtYWdpYyBudW1iZXJzIG5lZWQgbm90IGJlIGRlY2ltYWxzLiBD
b25maWd1cmluZyByZWdpc3RlcnMgd2l0aCB0aGVzZQ0KPiA+ID4gdmFsdWVzIGluIGRyaXZlciB3
aWxsIHNldCB0aGUgdGltZSBpbiBkZXZpY2UuIEhvd2V2ZXIsIHRoZXNlIHZhbHVlcyBkbyBub3QN
Cj4gPiA+IGNvbnZleSBhbnkgbWVhbmluZyB3aGVuIHJlcHJlc2VudGVkIGluIGRlY2ltYWxzLg0K
PiA+IA0KPiA+IEhtbS4uLiBNYXliZSB5b3UgZG9uJ3Qgc2VlIHRoaXMsIGJ1dCBJIHNlZSB0aGUg
Zm9sbG93aW5nOg0KPiA+IA0KPiA+IDB4MDNFODAzQzkgPSA2NTUzNiAoaS5lLiAyXjE2KSAqIDEw
MDAgKyA5NjkNCj4gPiAweDAxRjQwMDlEID0gMzI3NjggKGkuZS4gMl4xNSkgKiAxMDAwICsgMTU3
DQo+ID4gDQo+ID4gUHJldHR5IG11Y2ggc291bmRzIGxpa2UgYSBiaXQgMTUgZm9yIHN0YW5kYXJk
IG1vZGUgYW5kIGJpdCAxNiBmb3IgZmFzdCBtb2Rlcw0KPiA+IHNoaWZ0ZWQgYnkgMTAwMCB0byBo
YXZlIGEgcm9vbSBmb3IgdGhlIHRpbWUgaW4gcHJlc3VtYWJseSBuYW5vc2Vjb25kcyB1cCB0bw0K
PiA+IDENCj4gPiB1cy4NCj4gPiANCj4gPiBQbGVhc2UsIGRpZyB1cCBpbnRvIHRoZSBkb2N1bWVu
dGF0aW9uLCB2ZW5kb3IgY2hhdCwgZXRjIHRvIGdldCBtb3JlDQo+ID4gaW5mb3JtYXRpb24NCj4g
PiBvbiB0aGVzZSB2YWx1ZXMuDQo+IA0KDQpJIGhhdmUgd2VudCB0aHJvdWdoIHRoZSBkb2N1bWVu
dGF0aW9uLg0KDQpGb2xsb3dpbmcgaXMgdGhlIGJpdCBtYXBwaW5nIG9mIGlkbGUgc2NhbGluZyBy
ZWdpc3RlcjoNClJlc2VydmVkIFszMToyOF0NCkZhaXIgSWRsZSBEZWxheSBbMjc6MTZdDQpSZXNl
cnZlZCBbMTU6MTJdDQpCdXMgSWRsZSBNaW4gWzExOjBdDQoNCidCdXMgSWRsZSBNaW4nIGZpZWxk
IHdpbGwgaW5kaWNhdGUgdGhlIG51bWJlciBvZiB0aWNrcyBvZiB0aGUgYmF1ZCBjbG9jaw0KcmVx
dWlyZWQgdG8gcHJvZ3JhbSAnYnVzIGlkbGUgcGVyaW9kJyBkZWxheSBhbmQgY2FuIGhhdmUgbWF4
aW11bSB2YWx1ZSBvZiA0MDk1Lg0KJ0ZhaXIgSWRsZSBNaW4nIGZpZWxkIHdpbGwgaW5kaWNhdGUg
dGhlIG51bWJlciBvZiB0aWNrcyBvZiB0aGUgYmF1ZCBjbG9jaw0KcmVxdWlyZWQgdG8gcHJvZ3Jh
bSAnZmFpciBpZGxlJyBkZWxheSBhbmQgY2FuIGhhdmUgbWF4aW11bSB2YWx1ZSBvZiA0MDk1Lg0K
DQpTbywgZWl0aGVyIHRoZSBlbnRpcmUgSURMRV9TQ0FMSU5HX1JFRyB2YWx1ZSBjYW4gYmUgaW4g
aGV4IG9yIEkgY291bGQgZG8NCnNvbWV0aGluZyBsaWtlIGJlbG93Og0KDQojZGVmaW5lIEJVU19J
RExFX01JTl9USUNLUyAgICAgPFZBTFVFX0lOX0RFQ0lNQUw+DQojZGVmaW5lIEZBSVJfSURMRV9E
RUxBWV9USUNLUyAgPFZBTFVFX0lOX0RFQ0lNQUw+DQoNCiNkZWZpbmUgSURMRV9TQ0FMSU5HX1JF
RyAoKEZBSVJfSURMRV9ERUxBWV9USUNLUyA8PCAxNikgfCBCVVNfSURMRV9NSU5fVElDS1MpDQoN
CldoaWNoIG9mIHRoZXNlIDIgYXBwcm9hY2hlcyBkbyB5b3UgZmVlbCBpcyBiZXR0ZXI/DQoNCj4g
U3VyZSwgSSB3aWxsIGdvIHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24uIFRoYW5rcy4NCj4gQWxz
bywgSSB3aWxsIG1vZGlmeSB0aGVzZSBtYWdpYyBudW1iZXJzIHRvIGRlY2ltYWxzLg0KDQpUaGFu
a3MsDQpUaGFydW4gS3VtYXIgUA0K
