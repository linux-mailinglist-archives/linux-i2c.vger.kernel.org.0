Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1EB5A1F95
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Aug 2022 06:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiHZEAX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Aug 2022 00:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbiHZEAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Aug 2022 00:00:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B782497E;
        Thu, 25 Aug 2022 21:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661486418; x=1693022418;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bcVcQ7njaGScGnereP7oFDPmzLHnUguJ2A2dokxUWsQ=;
  b=hSKNQlFblDsvw+f4gG1HsHS+2j/JCBIXY6Xs68aEWqTn5jxsrHes9RZ6
   OA6TmReZN0J1f2ylwh12Tys7ZBMY6/TU32kTwiqjDBu8uwvvsV+05/dqI
   RYSlqMYBoxJZkEYv8IHjYoRwuV1Zet2ZKcoMA1/eIvf2zIonam8q+k3co
   VpMYo3W27lxnLGZotFNXzECABW3IuxJkP1MiIi7Ky7AXj2wX+QdvL30EZ
   GdnRSjQdE89/zKECtaqDPX3SL8s83qL7Aza3TSb22mN5K3xeW0WrjAFIc
   R7lCEM3Qtjl+sQz2UxA4KAQ71vIlyGAJ+Ujk0E5Ohl7AebWGmZ9PlOE8W
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="110832565"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2022 21:00:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 25 Aug 2022 21:00:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 25 Aug 2022 21:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1+HgI7S03Qzw1CpqghT9qpWfTxrsaoATl2jmbdS+Yh15eX5XK5g6sR0tI3J8kKe9vlJ3jDndGQZ/qy8JpDwyyjmtPTx0TO/HYs1i3xhWct2Cg6Zu4dixVnlQgH6gZiVl9WbO8q89Gs0n5Z86kC2IQOJzkPnIMr90DGVH2W7kx+rb6oNvam2L+tD7zrXPFghU6G+kMBIihEqP11VC+jNEhFnBNNpRRsfJqNQ3ElgASD8BCEItYCKx9nfu0Xf0zQhl9tAMfeuZjp+E2gbVNEhtRqEvlXqP8/DgmeWmy5L4wpHIpvnqWCtJb3ZLrF1tvuB+m59R/1qzAPE+mKBFPKHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcVcQ7njaGScGnereP7oFDPmzLHnUguJ2A2dokxUWsQ=;
 b=DJbxU2WsQMrIN0Q35mWRY1C18NqMfEBeo3qCBnpboGYp0haUnbXXmZA7LJgFhoEUp6d/i0l4/T8zZoOffYhRteTXOywkdCKO7UGmrqh+tti/eNL9YU03bSS06iRWfHrVa3mfLkbRYIpQHxssL+QfhvMU8HgJ/9EakO1OMuzpy0l+Bx1MIzTnl22trx76NLSP23e1g2kJTs3uAUkfD03GO1FNXS/N1Gn028CfqXCP64EjcrrdoF/nbCgwl5fSHtyva2x066cYgzaopK36PMDAhK60lgd66x0nMGcZWBtEuEz/ytWEc91Ej11fTdryFXm64buzeAgpq08PjBADeB4bZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcVcQ7njaGScGnereP7oFDPmzLHnUguJ2A2dokxUWsQ=;
 b=Dud2DEuIYve9IaYPUX/lSaxG4sAu50Eqsy198mIqoBolkTJb93kyYFqOU8BlWQPc2Co7+QQrg14E3b6c4iQANBcDE8J3w7Z8oAd24sj19j0SGsDXf4ZI3GJLRA9c2OBFAAluC9uw7++DcU1BVYr8f7/Kw7VAJBh+iFNclGjGgEs=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Fri, 26 Aug
 2022 04:00:10 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42%5]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 04:00:10 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andy.shevchenko@gmail.com>
CC:     <rafal@milecki.pl>, <wsa@kernel.org>, <krzk@kernel.org>,
        <sven@svenpeter.dev>, <robh@kernel.org>, <jsd@semihalf.com>,
        <olof@lixom.net>, <jarkko.nikula@linux.intel.com>,
        <semen.protsenko@linaro.org>, <UNGLinuxDriver@microchip.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arnd@arndb.de>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28lckAgAGLSYCAAEDGgIABOm4AgAASYACAAOS9gA==
Date:   Fri, 26 Aug 2022 04:00:10 +0000
Message-ID: <8f9e8be7084ad78671198f03313058809038a3f8.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <YwTsnCdxM5I6BoJu@smile.fi.intel.com>
         <80debd4bbf819cbfa16681172919436df476558a.camel@microchip.com>
         <CAHp75VevAifCp_Bz5HN1MmGm7UEJWFR017kngzARfBh+Z8aAAA@mail.gmail.com>
         <787644272b3b260980ff8b9efc317ce3194b0acc.camel@microchip.com>
         <YweFttaSE2GOoW83@smile.fi.intel.com>
In-Reply-To: <YweFttaSE2GOoW83@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c57521bc-da2e-422b-feb2-08da871778b8
x-ms-traffictypediagnostic: BYAPR11MB3750:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XC7EhkZkJwPuZmzaZ8HG0vUyM8KOWa7kKaFibiViHOc+iP+tkuzxrGOhaQO5/uTYxhTL3bWzCgU3u+2Uvi3I4ZPyVmh1UdgrZ30BrFPERksKR0SGz1Z12KJ3lFkth/wbr7x84z4POLXs2d9Xs73wIzoFuvLHG1QI9OXYeimVRqBrAhwZIriHNpZI7nLIJsqNE3Fhr7+vfNQruFfuqmodL0Pb6VkV1rY8kResJ+syFaW601YpQSG+TNFT0+mZmlgMHLXg4ek2fJXsCigmvRp443o/h4pWKc7AnSt/xQxtVI56bK59aGVSAIYdq//ha5roTyGoYv/JM5w+98An8pSMlOgmDd2J/085QNS+meHfBabHB5I3/9dbErO7GdbPkvMbYbP6hsCJexprxgbpA5E3Z2lXXz3HsFkbjirBfyk7a9LiTyEMUBrTPw4ALFFa/oiEFUtj78pq0+CNFptpbaHG8a6cSMOFPsw+kuZwwejzisPgbSLvg8JIfpTtqs7bMC/LyL1FU7pZoKwc1FG6uifZYYug+f78HTaaFvdsNAtSflZU3NsJG35y2q2cJA+MrQYvR46dRWUBSvUlRaB6nSQBanlcVGGTKAMS3bq4kM2QyLRtI9fH5Jnxlsx8+r+ROTEoYCTAOa6ZnPSnV7YkPCbbTAyhyLwFB0XNoRpR8tUXPgWHV4dR/MZ48RTKR6a+eb2GZ63PRJi3YI50O3f8ryi08UxGZVgt0MgjmO5yhd7A0sDnrf7+pgqu0FS1hUwIq+t7kkpYsdreRoTuwomjiZbAas17cuoOcb+Mu3UCK5o5GKpBSvqMIO80LWblP4kqkmoX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(396003)(346002)(366004)(39860400002)(478600001)(6512007)(41300700001)(2616005)(6506007)(71200400001)(38100700002)(186003)(53546011)(6486002)(26005)(966005)(4326008)(6916009)(66556008)(76116006)(66946007)(64756008)(66446008)(8676002)(2906002)(91956017)(54906003)(7416002)(66476007)(5660300002)(122000001)(316002)(38070700005)(8936002)(36756003)(86362001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2ovbHBSc0s5RHhJUEQ5RnlFY29YSlBFN3pqM3FSc0xqM0JEa0V5aXhuQktI?=
 =?utf-8?B?VjB5MVk4ZWp5TzZpWU4reXZXRCttSHdrZjl3aUtSYzhYdlM0Y1BkUlIyaDZW?=
 =?utf-8?B?UG1vZ3JBbHVCVG9KTGZ3Vk1BZW1CeklVV0M2azBtVjYyWHBSaHdYZmlvS1l1?=
 =?utf-8?B?aFFnRWJEeGpoUG0xN1ZCWmR1aFRtbW1Pa0pSUURaZWZSMkRqcVlHSjVhZ2F4?=
 =?utf-8?B?OGtwUHhhSzJucmFuZDJ6ZTdIMnFuck9XUVl1bHZ2ZXF6L3o4QmpMaFUram1E?=
 =?utf-8?B?ZVNlQ0ZZck84LzF5aXRhYjZwYmFwV010S0x3WmhpV1FMNzNjMlBZVnRVNG1Z?=
 =?utf-8?B?Z2puRmFCd0tCanA5c3ZabUw5TWhDWEtGaUFIa3NvSzlabEk5R0I4VTlabUts?=
 =?utf-8?B?YWkxY1N3QWJOUDd0bmdIbFk0YWJ6UkRRR3hLVEhKbDRPdEZ0dkdVVlFFbmpL?=
 =?utf-8?B?VnEybFJyZFNIU3ZLZDZtM00rakFjYlBTLzdWU0J0ZFRPcDFKU2ZYeXRubkdJ?=
 =?utf-8?B?cjdwM1ErUWpEU0NyUFhtWGdYSHRld0VmQkpCWE02ZlJMZngyNVc0cktSZGhx?=
 =?utf-8?B?MEdXVHFtcUplS1pYVVl4NVcxek02NDJweUxyWkdaSlROeUxhVEVOczdycmh4?=
 =?utf-8?B?V0dKMDh1WVA4Z2lmeVhNbHJDditJdlZ5cGRuRTkvaFhkd1ZLTGE5NVk5RzhM?=
 =?utf-8?B?TTNoYWFQYVhEby9vK3psbWZsNWJQTTRHUmZmeDU3VjJvZFpaVm9hZHNTZWdm?=
 =?utf-8?B?Y0xIbmxUdmhweXQyN1B6UnZkVzN5ZE9ZY1pQSnFFRFpTbDhCZ2s1NDBUTXNv?=
 =?utf-8?B?d0cwSitmRmtCOUpkbVFSOGhWSmFZWTE3T1VnVUVSNm9aS1dQVm5uUWRaTmxy?=
 =?utf-8?B?dzZkUFR1UG9yQmM4cDVhT0IvK1Y2V3lLMjBlQ1ptSk1DWDhWTzk1S0tpN0FE?=
 =?utf-8?B?RVJQZGFXZ3A1aTNseWt0NGZUWSt1dlJjcmVUeGh0dXRkQWgwMFJUSVR6UkpN?=
 =?utf-8?B?bmhFMjczUjdSK05pSHhIclRMSUpiaDhIdWpjcDFXdUZlK0dIRzk3a0luRnZP?=
 =?utf-8?B?SUhmaDlBYkNiMDdlZG1aMlVNVmp5dURNMFBUelNwRVpHYXNhRzlKUGhWS0VD?=
 =?utf-8?B?bTQrUUluSlhyQ01ha2crVWRBYTFZTElGRGVpM3A2R2lYU0paUmRiWWtPVjRv?=
 =?utf-8?B?WEJUaGlhVzExdnEzYzBxVFUrckxydUVlN3U1a0htTFBlSkxrOElqQU5PYjZj?=
 =?utf-8?B?TXhsbEpiYkhja0kxSFRIemJLTEJiRGF4Rk15emNIa3pLNFFTc2V2dTJkQlp4?=
 =?utf-8?B?QjgxTGQ3dy84cThFeXdyZXVuWCtab292VE1wOUN5a0kwbFZUSTkxaytUcFZk?=
 =?utf-8?B?V2Y3MFlaL2hHa2VpdGNPMnltakFkMEdqU0krdU1KN0JYVHFlcDVwQ2VSUVpF?=
 =?utf-8?B?djBiT2RsSHZzQ2ZGakpYUmh6aGRzMFhZRTVIUVhXamNMeWZHRlh0dlJ6R2ti?=
 =?utf-8?B?eDZzZk1wc0lmZTNkM3BLKy90ci9UTkI4VjROQjZKL3NHU2s2ejFaWVdzRkpw?=
 =?utf-8?B?TmFJeTQ5U014VGZYbzdnWVp2VWtNMkJDbGJRRTd5TW9QZ1oyZjZsZ2hHZFY0?=
 =?utf-8?B?RFFwcldEWGlXbVJ2OFZBd3hBMDArVlVLamVLMTVNQXRqUVlTVE5sRmc2WXo2?=
 =?utf-8?B?d0lWcFNwZnZWU1Y1NzFRRDh1bDBUQmY0L1pIRTAzMlpBK0RSN3NYTTBNdkVN?=
 =?utf-8?B?cUhOS0FERG5iQ1VpVk8yUEtkYnF5azErMVp6SlRrTHJvYnh5ZERicUZMT2VG?=
 =?utf-8?B?dFVGa2pJVUtPNlV6MVhYeCtqcldQY0ErUzU1bTFwTEFwajBsYXdiUlBSa05U?=
 =?utf-8?B?YWpzVDVtcGxzSnJsRlhFYnRnVllpaG01QnpVb1JsQ1ljb1dWaEdQTXBLWmlV?=
 =?utf-8?B?MkdPQlNBb05VdTZjL1MyWkt6Q1lDSTY5SkdrYjR1bDhJNmJnWGZIWEFjRGU3?=
 =?utf-8?B?RmwzZnBpc3FRUzZFTUVtS09RUmJwN0tVRzVHWUhzRWtKaUFNb1czem0wL2J6?=
 =?utf-8?B?R25yV094cVdQbjVpeTVFV3Q5cHlVNjgxVGtZZERZcllwWUJMeUtWWCtRaTg3?=
 =?utf-8?B?V0JiQ3RaeGN3WUwxZ2UrQUt5cWFsSlNBMVR2Y2tYcFRrMTVMaU5lZk9PMkht?=
 =?utf-8?Q?ekUlWQvqQSxyeKOjS3fhTC8PWDpbe3/7gwSkVltYWMQW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57231E7E2E8AD244A44FD5E52F15AF0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57521bc-da2e-422b-feb2-08da871778b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 04:00:10.5108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFGhyVqfbHscGNJJ6EBnrB1Bx7PVLxe2J9/F1AUV0WYhvAHJk1JhhabdsrVSJM9OO3yZ4efTUzQb9llSFSfxR6kHNoF0MP9ZrvVvvx36If1Oax1gr7h6TEC/6JLTmnjX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVGh1LCAyMDIyLTA4LTI1IGF0IDE3OjIyICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IA0KPiBPbiBUaHUsIEF1ZyAyNSwgMjAyMiBhdCAwMToxNTo0MlBNICswMDAwLA0KPiBUaGFy
dW5rdW1hci5QYXN1bWFydGhpQG1pY3JvY2hpcC5jb23CoHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAy
Mi0wOC0yNCBhdCAyMTozMSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gT24g
V2VkLCBBdWcgMjQsIDIwMjIgYXQgNjowNCBQTSA8VGhhcnVua3VtYXIuUGFzdW1hcnRoaUBtaWNy
b2NoaXAuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgMjAyMi0wOC0yMyBhdCAx
ODowNSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgQXVn
IDIzLCAyMDIyIGF0IDA4OjI2OjAzUE0gKzA1MzAsIFRoYXJ1biBLdW1hciBQIHdyb3RlOg0KPiAN
Cj4gLi4uDQo+IA0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgU01CX0lETEVfU0NBTElOR18xMDBLSFrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDAzRTgwM0M5DQo+ID4gPiA+ID4gPiArI2RlZmlu
ZSBTTUJfSURMRV9TQ0FMSU5HXzQwMEtIWsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDFG
NDAwOUQNCj4gPiA+ID4gPiA+ICsjZGVmaW5lIFNNQl9JRExFX1NDQUxJTkdfMTAwMEtIWsKgwqDC
oMKgIDB4MDFGNDAwOUQNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaG91bGRuJ3QgdGhlc2UgbWFn
aWNzIGJlIGRlY2ltYWxzPw0KPiA+ID4gDQo+ID4gPiBUaGlzIFEgc2VlbXMgdW5hbnN3ZXJlZC4N
Cj4gPiANCj4gPiBUaGVzZSBtYWdpYyBudW1iZXJzIG5lZWQgbm90IGJlIGRlY2ltYWxzLiBDb25m
aWd1cmluZyByZWdpc3RlcnMgd2l0aCB0aGVzZQ0KPiA+IHZhbHVlcyBpbiBkcml2ZXIgd2lsbCBz
ZXQgdGhlIHRpbWUgaW4gZGV2aWNlLiBIb3dldmVyLCB0aGVzZSB2YWx1ZXMgZG8gbm90DQo+ID4g
Y29udmV5IGFueSBtZWFuaW5nIHdoZW4gcmVwcmVzZW50ZWQgaW4gZGVjaW1hbHMuDQo+IA0KPiBI
bW0uLi4gTWF5YmUgeW91IGRvbid0IHNlZSB0aGlzLCBidXQgSSBzZWUgdGhlIGZvbGxvd2luZzoN
Cj4gDQo+IDB4MDNFODAzQzkgPSA2NTUzNiAoaS5lLiAyXjE2KSAqIDEwMDAgKyA5NjkNCj4gMHgw
MUY0MDA5RCA9IDMyNzY4IChpLmUuIDJeMTUpICogMTAwMCArIDE1Nw0KPiANCj4gUHJldHR5IG11
Y2ggc291bmRzIGxpa2UgYSBiaXQgMTUgZm9yIHN0YW5kYXJkIG1vZGUgYW5kIGJpdCAxNiBmb3Ig
ZmFzdCBtb2Rlcw0KPiBzaGlmdGVkIGJ5IDEwMDAgdG8gaGF2ZSBhIHJvb20gZm9yIHRoZSB0aW1l
IGluIHByZXN1bWFibHkgbmFub3NlY29uZHMgdXAgdG8gMQ0KPiB1cy4NCj4gDQo+IFBsZWFzZSwg
ZGlnIHVwIGludG8gdGhlIGRvY3VtZW50YXRpb24sIHZlbmRvciBjaGF0LCBldGMgdG8gZ2V0IG1v
cmUNCj4gaW5mb3JtYXRpb24NCj4gb24gdGhlc2UgdmFsdWVzLg0KDQpTdXJlLCBJIHdpbGwgZ28g
dGhyb3VnaCB0aGUgZG9jdW1lbnRhdGlvbi4gVGhhbmtzLg0KQWxzbywgSSB3aWxsIG1vZGlmeSB0
aGVzZSBtYWdpYyBudW1iZXJzIHRvIGRlY2ltYWxzLg0KDQo+ID4gPiA+ID4gRGl0dG8gZm9yIHRo
ZSByZXN0IHNpbWlsYXIgc3R1ZmYuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGVyZSBpcyBubyBkaXJl
Y3QgY29ycmVsYXRpb24gYmV0d2VlbiB0aGUgaGV4IHZhbHVlIGFuZCB0aW1lLg0KPiA+ID4gPiBD
b25maWd1cmluZw0KPiA+ID4gPiByZWdpc3RlcnMgd2l0aCB0aGVzZSB2YWx1ZXMgaW4gZHJpdmVy
IHdpbGwgc2V0IHRoZSB0aW1lIGluIGRldmljZS4NCj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gPiA+
ICsjZGVmaW5lIEkyQ19ESVJfV1JJVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMA0K
PiA+ID4gPiA+ID4gKyNkZWZpbmUgSTJDX0RJUl9SRUFEwqDCoMKgwqDCoMKgwqDCoCAxDQo+ID4g
PiANCj4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAtcmMyL3NvdXJj
ZS9pbmNsdWRlL3VhcGkvbGludXgvaTJjLmgjTDI0DQo+ID4gDQo+ID4gSTJDX01fUkQgaXMgdXNl
ZCBpbiBkcml2ZXIuIEJ1dCB0aGUgcHVycG9zZSBvZiB0aGVzZSBNQUNST3MgaXMgZGlmZmVyZW50
Lg0KPiA+IEkyQ19ESVJfV1JJVEUgaXMgdXNlZCBpbnNpZGUgYm90aCBwY2kxeHh4eF9pMmNfd3Jp
dGUgYXMgd2VsbCBhcyBpbg0KPiA+IHBjaTF4eHh4X2kyY19yZWFkIChmb3Igc2VuZGluZyBzbGF2
ZSBhZGRyZXNzKS4gVGh1cyB0aGVzZSBNQUNST3MgYXJlDQo+ID4gcmVxdWlyZWQNCj4gDQo+IE9L
LiBOYW1lIGNvbGxpc2lvbiBzdGlsbCBzdGF5cy4NCg0KSSB3aWxsIG1vZGlmeSBNQUNSTyBuYW1l
cyB0byBhdm9pZCBuYW1lIGNvbGxpc2lvbi4NCg0KPiA+ID4gPiA+IE5hbWVzcGFjZSBjb2xsaXNp
b24uIERvZXNuJ3QgScKyQyBjb3JlIHByb3ZpZGUgdGhlc2U/DQo+ID4gPiA+IA0KPiA+ID4gPiBJ
IGFtIHVuYWJsZSB0byBmaW5kIGFueSBleGlzdGluZyBNQUNST3MgZm9yIFdSSVRFIGFuZCBSRUFE
IGluIEkyQyBjb3JlLg0KPiA+ID4gPiBLaW5kbHkgbGV0IG1lIGtub3cgdGhlIE1BQ1JPcw0KDQpU
aGFua3MsDQpUaGFydW4gS3VtYXIgUA0KDQo=
