Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65C85BA8F0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 11:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiIPJFQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 05:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbiIPJFN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 05:05:13 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029F823BFC;
        Fri, 16 Sep 2022 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663319105; x=1694855105;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nQbFjwffTB/w2IGN1T93OlJ02YpMQJKl+rLilDhnrHw=;
  b=lRW9QaX0bsD0pTNtrqTw1Loh1Gbj1IKv3OgzxJh3rLHWOEcXI9d2ndAA
   3QJBMsKOdhpA+NTdameT6to6P2CO+zJ0ce+rPWHv34flPhy+/uD/MFJhQ
   j7oElsnjLAlEeLAwCGCTmKcJ/MDoBZYRDF+C3en7ge+aeoW7IrfaqJrRP
   J3Iy4twjPDeOhT7IYaEDJmu1HQmxiNrzV79dTxmJc4HWNJbxUzHSmGlKU
   +ROtA5q6bPnwxFZJ9gXoTIiYnWGV2HYq2aw9rUUT3TyS03/IqhK3vnSoo
   J4Rrgb+FK/pG/gvoSIuTMomekIK1Wp+hH3lFvK1tu1m1u961lPVXGgRw/
   A==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="177466766"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 02:04:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 02:04:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 16 Sep 2022 02:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL3y2fmoRQE6WgIWyOHtJTc9htlvSCmXR2AuRNGOo+R3eMy2tNjN2Eybt/WNEIfLtVzx4uwFhUMFlaVsqIkgEt4F6XpoQWsljWFq/LbKFWoKh718I5zgPa8locPymiOxCP3viPVoWb7ZtQtUiFmiq//tSftrtFU/fvA/ksbxD2ukQBGIJeXG2LlehYieCGhCf6Rk13BTjN40Jci7dedmX2OsV3itU8R5UlL9bV0AfZOzIKhSUciSOxrMxmaVwoF7NfGGKxqmCoKe3BIuTGNbJc9V1LltDKMFQ8ijCHIZcUVqb/2XyrfwQlo77S0LFRMKhiCTY75+vMwPcaHsOOQaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQbFjwffTB/w2IGN1T93OlJ02YpMQJKl+rLilDhnrHw=;
 b=PPFNLM8yezMEPbNO3azJ2FcCuBDzhvXTuMHy9ESScR2KtJGOJx38VaLJ2UyNJCG/8lCRD5lZLhzQ8uFPMD9YpyFdQMG24qDLcgLnWVCqhwjHXM5d7BlPBv1JVDnQSgxCNZe9/pDl9eUsuT6lnqCfx8bDwQzymOtTJbCxb/EgxBzjKt9lVCzc6WIHfzaSdeuzYvN18v7+0o00pqZNULP3IcPsRIdg65cNDFk7foYmZBIFKN1rmCr2H2gPT0+JnKMRiXSOZ6TNP0Qu7Z1w8UYsxF9P6B3z/7S9Yl33OnO15EoTKpXufFm9z6bm2hxs16FH6rik5ONS5o554vFa4PS8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQbFjwffTB/w2IGN1T93OlJ02YpMQJKl+rLilDhnrHw=;
 b=t53EiB7vpWYvdJiBJAJWndSCV+enDSRgcF+6c8jtrdOSOhSNhq+Crah+yshGOdY0ndP321WujSfpxCFx/3fxZtTezHOmtUZys50AoTlqs8jYtBtHj3D3S915D7Yf6QAR7WcujxbZZbu4omzAMV/UJ4j4QSSzvk85IK67ab17lpw=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Fri, 16 Sep
 2022 09:04:50 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::61bf:18d5:c7e7:f89c%4]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 09:04:50 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <UNGLinuxDriver@microchip.com>, <wsa@kernel.org>,
        <krzk@kernel.org>, <sven@svenpeter.dev>, <robh@kernel.org>,
        <semen.protsenko@linaro.org>, <linux-kernel@vger.kernel.org>,
        <jarkko.nikula@linux.intel.com>, <olof@lixom.net>,
        <linux-i2c@vger.kernel.org>, <jsd@semihalf.com>, <arnd@arndb.de>,
        <rafal@milecki.pl>
Subject: Re: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH v4 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYwtRuLt6yI1LWVkm57IwqsE/vHa3UKQ4AgA2odQA=
Date:   Fri, 16 Sep 2022 09:04:50 +0000
Message-ID: <47d6cb2f0701177d02621e10fdf506ab9d05fe4b.camel@microchip.com>
References: <20220907161143.897289-1-tharunkumar.pasumarthi@microchip.com>
         <YxjHgiqrGauhg1oS@smile.fi.intel.com>
In-Reply-To: <YxjHgiqrGauhg1oS@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5096:EE_|DS7PR11MB6013:EE_
x-ms-office365-filtering-correlation-id: 4785f275-92b6-4f81-be2c-08da97c28300
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mv7itOcBGFgOcdy7ESrtt0ivDlpjM8r87WIpJ3iTfisfihH2/X+3wdvuwTQI/VquCi/XaWDQFj92XqT97JvAfZZIprNso9gcZCWVfwP4ioExSXJNPuntGTnttXvgg7iQu9OXwk3bKmYHIq6d3EVNedQXla08L+vMY1TOzBUZ7MN1D05EwxzRW7naKHS8cc+/SNe9YWczQQQIyYTNO+5pph8b4I4OCkZJXR9MBMbj8K1jkDfGa4/Jg6OCVpabA8uC/l6D9GTGYhkipRpgfukSy6vYAyPvhSbRaFb08yAtaa2tea4XUloIBTrAc2il7v0yoYWQ8GUUh+/HLdI1/PQ2DLueUuEPH8/N6CdPnE6SItKSvUQ6ZGbZaMY/Mco6H3/PYTdBFzkVUp3E19SDwwJchvI0ri5IpAaaACm4pc4EE/Rn7Knpg4DlB84yDKt//zAL5+IC2kSUsiaR/jAEOJV3RylJrZMFP5lM162lqoHKb49nqo0Q1qQOjGn92TtZKTM5BBk2a8O8Z+pITGcOK8czpoIRY3nU2SwNzfC9jrSvnmRtKLlSOmH8HyEXBmEySL7suNtp81cQZkiuDMMW8pfZZGd4zwls/MQ9lmbLUo+bfYXGIWEKR4nGBXyqW1sMjg2vVZsM/fJLYMU9B1nzuSDuU2xNoD3CqnJG3uyQpXCcxK1AHaehXhGZ8Fdr+znXQkQmme5JMeYo6tmOEbwQvdkHMr9CSss5k3yorcI3WTwTJ9YRcCAdTUCbuj/xCtmqRBqxAk98d53dltULzg/TxCpr2UUuDlpar5EJ3iWrTKT62Lg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(6506007)(4326008)(66476007)(66946007)(8676002)(64756008)(26005)(66556008)(186003)(316002)(71200400001)(122000001)(7416002)(76116006)(2906002)(6486002)(4744005)(478600001)(41300700001)(5660300002)(66446008)(38070700005)(36756003)(2616005)(86362001)(91956017)(6916009)(8936002)(38100700002)(54906003)(6512007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWozSVhEeVhzOHhOUUNJZ0JlVEVTMUFmaUt0czR1ZGZqYlhEeFlteWdkMkZG?=
 =?utf-8?B?SXQ3a3lHcDNKTEovNjVhMHRzV3M2U0VCZ090cTYvaGMwRUxjcGtjR3FkSkEw?=
 =?utf-8?B?b0tUa09kWGdvemE0OFpsbXBpSGNiWnpRN1ZBeUlMWlovVVpyT0hXYW4vS2RQ?=
 =?utf-8?B?NzdqKzBNY0VZbEY0WExmdmlLNm1vMXZNNjR1V05JTS9QUGl0Wkw0aWN2SWk5?=
 =?utf-8?B?NFpRWThXR1J3WHlLcFAyd0NzNmtrdk1ucDhhSU5FMEp5VXNza1VXbkJ2TjM2?=
 =?utf-8?B?cVZsdDlEVjk5UjZQcTZsK09SWmFZemtTRUkyMFYzVHdZZndVd0Q3dGdLVEM3?=
 =?utf-8?B?c01KNjdoQTZldzduQ2NhQjFuSXNtYXREMi9CcXlKNThEZDdTczBEa1EwNnFW?=
 =?utf-8?B?VlNuRTU2SWRLZW1DVlp1WkdpKzVaT3pWV2daNUdQOVFWRHVHTjhIZUEranNR?=
 =?utf-8?B?L0dxWUMzZFVJN0tlQjBrQmhLNHJWOUpwRU1lazZQa2ZWNkUvcC9CRUN2dGRo?=
 =?utf-8?B?WEJmZ2RJUjlPRmtpajcxZ2ZTZzlIL044WjFlbFFlV3g5blI5aGxZeWZlVWNr?=
 =?utf-8?B?WDV2MDdlSE1wK1lDSklwcEorTFpUTDM1dUxzaElMa2pBZm0veE9VczJYc295?=
 =?utf-8?B?SkRvUkdjSnF3ZFR2NWU3Nm50WlMrYmhJNExRZXFYNGtKOFdWQStIWTYzVDhv?=
 =?utf-8?B?V044ZHFBQWFWRElxN2RUeENvdmJWMkdXZGc2UFZmcGFjZFZRdnVLQjlRVlIy?=
 =?utf-8?B?S0I5ZnVBd3ZMYTd2MG9sbnZYM2prdkRoWEUrbEJpWmtqYXpHcStzRGhCYVpY?=
 =?utf-8?B?OWJCRTdyN0NOWFFtanI3b1JiS2VWU1dWaGFHVkJCWjl3ekVYcUFIWHRXQW9P?=
 =?utf-8?B?R2srZ0VjVHNaSzA2TnRmbEFjTUZaZHhjNkNVcXB2cUkzclVsL3IvalFNNXJl?=
 =?utf-8?B?T25BRmphd2kwTXRhVHpYcElLbFJBS2oxSUZtL0t2WEppVXR0NmZadTdSRUh5?=
 =?utf-8?B?RDUzbGwwVC95aW43ZXV1NnRDUG9MdVFxK1JjS3FhbjFaeGdMSjcva2ZXODNY?=
 =?utf-8?B?bVArV1AwYlRhWndvTlUxRmFlZ2R1Z1NjK1dqQzZTU0xiOXJVZVpSN2JQVUdZ?=
 =?utf-8?B?cHc4eXk2QVhZc2hDYjVjaWd3MXVidWJGN2JaeXhNMzRTRFEyRjFxekg4RU1H?=
 =?utf-8?B?TDdGYzYrRXRhSW9haWY2bUxCUG9EWEtzZldNdEZHRERiOGgvcS9ZU1ZTb0Jz?=
 =?utf-8?B?UHQ4Ry9kem9GQ3RKODR4U1RJcENpVkEvbHNKUnVldzV0TjVKVEhZaVlMMkI0?=
 =?utf-8?B?WVF6TWVjbFUramFPR21MRG9qY3dNc0phZVZzNzhJTUJzZUVCeVpEdUFSMm9l?=
 =?utf-8?B?cncyVWpGQzBseFhEMWhaaVVtbUN1SVp2N2haN0NRdld1eUVUbzEwM0tDenh5?=
 =?utf-8?B?UnlPWStPTGh0U1FyMVpGditoR1RGaG50THpBZUpMZjRwZi8vdlhlUHJ0V1ZT?=
 =?utf-8?B?dm5oVmo1Uml4ZEJ6dWdKd2pkVnk5SG1QSjZOTVlqRWRBWGpNUlJLTGRMZE14?=
 =?utf-8?B?ZEVHNjY3UHdnRWNOZklGOWdVb2sybzJtR0tZZzdDVU5selRuQkFFaytmTTNl?=
 =?utf-8?B?L2JLazNUTzJEMWtXRnVqa1l0M09oQXdrcnZ2bHpETkErTUg0Znd4ZDlUbloy?=
 =?utf-8?B?TWxiaklBTWQ4REw3cE8wSVkvbVFONkhQQ0JsbFNuUlNiSGlKK1E5R3pxOEEr?=
 =?utf-8?B?SWdIdE83dkxqMFBOMWZ1MXRINWZKR3lNMWNLVmdpMDFwUkI2RlNOOG03c0th?=
 =?utf-8?B?QnZJbGJkTTZBZE9CTjJPT2hPQVFFYWljNXU1U3lYdko2YnRtUDJpMDhLSnkz?=
 =?utf-8?B?ejdXenZZVEtZeUNaOTJiMVQwWmVCSWxEb3JjcXF0SzN6bUdNYk4wUE1jTThG?=
 =?utf-8?B?OW56VFhFQTMrN3piOG1VUVhRbG1POG0yTS8rdzdETXVEYVR6bHFJSXUxWEJs?=
 =?utf-8?B?Z21adEtGVnIwVHZMY3k1NzMwU2VIcktXZjdnZi9QbGpQRzQ1Y0kyU3ZKWS9H?=
 =?utf-8?B?c1FkMW0xVmMrTXJYLzZLbUxJZjR6bXdVN1hIQStlTmt2SW1nOEtWNGJObWFM?=
 =?utf-8?B?OFh1RVdkb04vMWJ6azhwY004OGdMYTh6R2Q5RkErczVWTjdCeFVTSThoL1dP?=
 =?utf-8?Q?5ocAo95Li/acLoQ9h57HXA7F0Fd5r+2gY5aJ04N70cfZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02F69F53E4080242AC48B359FD899307@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4785f275-92b6-4f81-be2c-08da97c28300
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 09:04:50.3347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sla8rmWaxvWwbua91AYBfck/SM/Y+mfdpK90SQqwbCHKND0y2XWO4xh4Rw97MjcKmlwduKhwjevCaYtKtNopSloyOFXjwrusSSs28xGn4SmpBWlZtXra6htuKPlpkIMO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gV2VkLCAyMDIyLTA5LTA3IGF0IDE5OjMyICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+ID4gVGhpcyBwYXRjaCBwcm92aWRlcyB0aGUgSTJDIGNvbnRyb2xsZXIgZHJpdmVyIGZvciB0
aGUgSTJDIGZ1bmN0aW9uDQo+ID4gb2YgdGhlIHN3aXRjaC4NCj4gDQo+IFRoZXJlIGFyZSBzdGls
bCBwb3NzaWJsZSBuaXQtcGlja3MsIGJ1dCBpdCdzIGdvb2QgZW5vdWdoIHRvIGJlIGFwcGxpZWQN
Cj4gYXMgaXMgbm93Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KDQoNClRoYW5rcyBBbmR5IGZvciByZXZpZXdp
bmcgdGhlIHBhdGNoLiBXaWxsIHRoaXMgcGF0Y2ggYmUgYXBwbGllZCB0byB0aGUga2VybmVsIG9y
DQppcyB0aGVyZSBzb21ldGhpbmcgd2hpY2ggbmVlZHMgdG8gYmUgZG9uZSBmcm9tIG15IGVuZCBm
b3IgdGhhdD8NCg0KDQpUaGFua3MsDQpUaGFydW4gS3VtYXIgUA0K
