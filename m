Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5445A6624
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 16:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiH3OVZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 10:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiH3OVW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 10:21:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889F3979DB;
        Tue, 30 Aug 2022 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661869280; x=1693405280;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rjwIVGsdxHy5+YyoJ770LrZUeVdLx2t+acz27CFaO8Q=;
  b=1F0hkdywvbJoYqsl1wRxwVXHu0FE5jwIsp+/0pO2wrGVCqn2INRWuJPI
   M/fAGL7Zkt9Z9aCDCDWchXlO58ERE8GFwaxJK12b/X6gzbPqyPqtyhJFT
   NnVf+4is4F2iPKOrWHXSHSqwV4kiIaalV8MYjoDSatUV7iTpkuh+AW78m
   Jav8Q2P0iXc4egqZ0MVO7GABjuRfojyzDAqc2MgH3lKGjht7ejXvI06PN
   lG0W8dAfbS2QOXSbUIRdx1N9FrW402J2z7A0eVKmpS2ZoSNqaBw5hTd4b
   ELlv0PyiwWwz3zl37i3HrB5u/E4D0Tm6mVyPStsa8ODmlel7jxSfJvrPm
   w==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="174821305"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 07:21:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 07:21:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 07:21:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ7K2//UNUtYCd18JArWNjuvegviwI5wEvXOCm11vfkz4bBMeV1PSyL/Va7TDKAznebPiWGu7JG8nzskk/lwk8Et/2iP/jE7zegFucClPZEEIpfGGFwQ3/yWG7mn4IUDdtJ8Gsnv98adeInhL/+DT0Nx8BYSJePOKJ0VjFgIUZ0nxmHqS42ty+7xh/fMrW4Ywye2yWrP5B7LwsCGBymH7b3xrtPyuwNLAtClHGiKEoMZBb+XE6T1BrwS3XEKvpHhhmeXbHbOA4UcqQ57B7+TDOpAS73U8W3r/tKOSdOLgOPBehPZSW/FB3CXhtXS9UowEU2AOMRHccj3/PupDHySHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjwIVGsdxHy5+YyoJ770LrZUeVdLx2t+acz27CFaO8Q=;
 b=fhz2SK+qR/U17uBBmtJ8iPA3RLoMROxXrGxKJxLCQhD4pNVKxL3u9TNxHKtYmiKsG40gCLlLECtqc8+H9liY85Re20cFqnoZnTE9Nc84QcEa/tv8TKET0SUUnrx5BqUO+Ntjvp+q7X4IsRiNnea+zJ3kzmW0Dp+gXNniHSyiC+Hkpra59dBXlGNXHTaym4keo5jFHxbBbHRXkbP2xkVLlB9HGGe1qGQq05AgxYMwoqRHN39iI41aPKSW9ScvyGJhCiK+6V3CW+Oq8IYTgf0C5b7eJjprSuB1Mvx80hLNhYcFwVTAwR80UWICgxpUvM0PapM/2zxqJtChm1/Rr8pveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjwIVGsdxHy5+YyoJ770LrZUeVdLx2t+acz27CFaO8Q=;
 b=j40lo/gib0y/45DYjgxCyLvJqXRko3du+QNfQP2USz+EVmcxe2xqoX16MisrU7dGCS+zMUid/W5NNmrWv96Zkf/0RkziI/mCfS37xvGNcqMIcRl3sy3afkqwJmLIz4axEjxlDzStTPDxQg4t2xhHn9wHXjrEbz/Ski+AcNUrzl4=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by DM5PR11MB1673.namprd11.prod.outlook.com (2603:10b6:4:c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 14:21:14 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::ce2:c2e7:3373:fd42%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 14:21:14 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <wsa@kernel.org>
CC:     <UNGLinuxDriver@microchip.com>,
        <andriy.shevchenko@linux.intel.com>, <robh@kernel.org>,
        <jsd@semihalf.com>, <olof@lixom.net>,
        <jarkko.nikula@linux.intel.com>, <semen.protsenko@linaro.org>,
        <sven@svenpeter.dev>, <rafal@milecki.pl>, <arnd@arndb.de>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28ST0AgAtA/AA=
Date:   Tue, 30 Aug 2022 14:21:14 +0000
Message-ID: <3e23a746cd0819757cef648e0320db6b680ffd07.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <8712b866-af22-d9ac-fd84-7d77c2628682@linaro.org>
In-Reply-To: <8712b866-af22-d9ac-fd84-7d77c2628682@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a653e13-5375-40ff-3053-08da8a92e542
x-ms-traffictypediagnostic: DM5PR11MB1673:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Yd2Eyx21QFydMzmwo3mak50EBKHCQhj7zGiJckO6KHHVFlShT4rgggfUWJ/rsPlpHMet5JL79kDjqbCd3mp79kEa/EU8kO+nGjEhfvN0o6ZEkAvKNWkTp0lhJH7g2nbfqYyYftaXmoKTu67X0iWhdQ7SvkUa6UXj3gNBgk071DuHdf4UFTUbNEYJRbzo7SENwM2AVDkygs9JFjzVdLqUVNO/+YbPfBz7AoZIhPdzIvO2wUtQsuzX2aewC9ZMJHn+RxWeY1OsTJihDXHW0chMG0uO7OgLTqs2w2EoMdMoruDqIPXF56lvHPkf58xit3rs46nLaJYoOKgMhgxYHQqqqDVqXU1ZGHMC1B+20LaFEsVNbA0OXhavnvIm4qNJQdaHRqdFLv5+mnuC+2y7YcMuXqJkg1ksgb7aH4pvwq/SOk8MGb0DCS4UUHN4Kkso+TnTnfm8gwUjRJqWdmsiUOING8KdZt0xQdgnDg/F4r3AFsnFwq3Mp9S3SVmkqVAhpz7f/omE8iWcShAs17FWO3r0Gm/5pOAq9614I9e/N4iynnMXEw1+lK5DYGXGZNYTQZxE8HlPIbI896KS2T2B+SalbYOBvpzdtRKuJPWde7MsdDjqfXeP+kTjSyTvlRsRAXGW1w+qke+L2yJsf60Rl0njYK2fiw5ZQMOJRfLmgRAlR6j5QXGKaWk7YNwERFrRG4BYiGLb+OcECt5qZ8LxLocRMtYZdYvKG9P54Z+mEJMNk4jESvukLJTrvdsg/9Qwx3NC9umbbQT4ihYDAphoyz5iamBNMlPo8nQlfL69yFOEUc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(39860400002)(376002)(346002)(8936002)(38100700002)(6506007)(36756003)(122000001)(2906002)(66446008)(5660300002)(7416002)(186003)(91956017)(478600001)(76116006)(6486002)(6512007)(4326008)(4744005)(316002)(64756008)(66556008)(54906003)(86362001)(66476007)(110136005)(41300700001)(38070700005)(66946007)(26005)(71200400001)(2616005)(8676002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enNoSlJWNFAzZGhKTzg3cjZNVWNPSkdGd2kvK09Ga0FDamdodFFGeVhUdEdT?=
 =?utf-8?B?S0F3dWovdk5sTE9qVEFySzNIaWFtcEhSVlRNTHFmcUJkNHZ2UnhkUG5HcURF?=
 =?utf-8?B?UHJ1UmYvOHBNazIrYmFFVVpjUDcxOGd1aWY1R0dZUkJ1N093WEhWQ0VBTDlW?=
 =?utf-8?B?OVFSRDRVN1JsYXpXTFhkSm5ZTVJHSG9MOTVjUXBTbkhpdUZWTDczNWc5OVFn?=
 =?utf-8?B?N2tUVU5yS2lLWTdqck9BSG05QkRrSUp6cjRXQ2dncWFzVU1ZVTZjeHRxTEt1?=
 =?utf-8?B?Vkp2N2QvV2QvdlBzaG42VVRzR1YrN3BOTDd6cUwvS2lYbmJPOUJpcXAwdnZR?=
 =?utf-8?B?MmV3bUdPZGhFa3JadUZTc3JOaFd2ZXVJY0V5dmRwZU5Icnl1SHRtejJsL1dx?=
 =?utf-8?B?T3Jad0VNZWhCYzRlL3dFd0swMThLT09xL2VBUzN3MnNmVTlzUzFremhlRm05?=
 =?utf-8?B?TC9DL20wVjFoODY0VFl6SW92SC9RTXd6QXBoSlhsTVh6R0IxQ1NLSXlNV1RI?=
 =?utf-8?B?VnN2S1RqSCsrTHRjeC91YVlLa09OVTExdk1XbHd5VEszTW5JS1JiUlRiVXRy?=
 =?utf-8?B?NWVsOWpFRnNQSkkyOVVIOFJqS3VhWkk0amJETDhrejRzOFM3UnF4b0xLZUor?=
 =?utf-8?B?VU04MjA1ZkQ5OUpaRnFWalRnVWp2bGZETHFNV0VLR0RRQWNBSUlnRDVmVzVp?=
 =?utf-8?B?eis3RHJZam9ZK2haSDljWENaUEVjZ0h5cjFwdEFGMXh0NlFCZUY3b3FtQnhj?=
 =?utf-8?B?V3lCUFZLQzFpQkpPTXRFVXU0TGRVQjY2WU03dW1OY2JmV3hmcXI4OWJxN0hw?=
 =?utf-8?B?N2cyOGhRei9jSEN1TE9ZSysydCtvZUhkNGxFOWtsWU94R2YyMmtCSHpIdzUy?=
 =?utf-8?B?UkdTaGlFSUx6YmRDbTNEdDFjN05DYUllbWZXc2drSURBQ1Q3VVNDS2dRSjlh?=
 =?utf-8?B?N0hHUEsxa3lXZ21kUkV6T0FxT3Aza0d4RWl4Z3RZUCtxNUtraUxiSEtoVm9Y?=
 =?utf-8?B?dWpyU3BlVThQc2lkTWtSdWNIbmdZR2cwOG1WWFpEamZwcktCTGFBaGxESTRs?=
 =?utf-8?B?Sm1vTHFCZkxzdllCZ2N4WG90aEFJQnVnQW1tQmQwRGQ5RHNGTXZlM3QwL1Uw?=
 =?utf-8?B?NElabXdtVFRLa0tiRWcwT29oNDFSTWVnVlFXVGQvNFBnNUdBMTRVeDU1S3Jn?=
 =?utf-8?B?a1RmWWpLZUJYZVI0L1FyaDZyZjVQSkVtV1ZIZVVjOEdjVE9vQ2p6YTJreE9a?=
 =?utf-8?B?cTQ0SXBWZ3RaZUJleFkvQnN1bklGeko2UlNIcWpNZGNJZ1hqWGhWOTFKUEx5?=
 =?utf-8?B?M2VYY0lPYXBzN0FOU2V4eU44QWdmM2hJeVRtWDVZaFB0d21uM3JVZGV6TzJY?=
 =?utf-8?B?elA2dmVjcWtCaVcwZWh5V2Z5T0VLa25aK2VHSHFaNGdDa1o2WHNxOUk4MzhR?=
 =?utf-8?B?RFBmZ0tpbEtsSlh6SEZHbHFvVTZxNVB0dnJxYzBVNFg5azBUWkplY2F3QWt2?=
 =?utf-8?B?cmxkME4xNHdGd3gxd1VCNHgrcDlUT0ZHQjJZSXRrZE9FalVWU1lwd2hIY0dV?=
 =?utf-8?B?aVVNOWxQZElla2JWMEd0bUFyaVZCMkF3MVFXaEVISlBkZWYyNUpQU1VVSXNo?=
 =?utf-8?B?citOeXRWTUhzRmJwWkQxblVTdm5QR2xycnJFSFJhbzE2K0NILzJPNVBvS29O?=
 =?utf-8?B?YU80bGw1YXdjZHk4Qkg0cEx0blYrNTRFOUtyK1pHOXc0cG5HaDZjUFdId3FN?=
 =?utf-8?B?dElGOElTUWtqMEFkcXNNb3U3Q1RmOHU3cEppTGtxWWpiTGtxYUZyZ3lCZm5Q?=
 =?utf-8?B?RDFWeDR1anQwNW1MK1ZBKzlUVmF3THVlY3pEaStadkx2QTVWZXNxdElSVk8w?=
 =?utf-8?B?L2RTcnRINHRJcDdIN2JxSU5kZVpENHJ2UTZlQzdRTWJkM2tEYzRvNWhlV09j?=
 =?utf-8?B?MW5kbVU0L2NPdmZzd3N4U3F6aVAxYVlyQUpPNmxiMHBSZVFIWCtBVXgvRG1Z?=
 =?utf-8?B?VXdWaGhMcDRhTjNwbnRKcHFIT05jL1BUcjVwRkJreGIxbVcva1RSQzZsNXcy?=
 =?utf-8?B?SldESkdoR3NuM2lZT1VIZTBIV05ER3dKdjhlR3B2VDN2VVRER3BrNkhkL2Jk?=
 =?utf-8?B?SHF6cWtDS0UzejRqVk42Y0gxK0NDN2V1SG1JeU14aEZGVWpzcjNHazFLamZI?=
 =?utf-8?Q?TUMYiqPUF/IEVTvZnEle6D11ECrH0hZDjeXDFyUPY5hC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BF177DC53D28C4AB391E90A965B887F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a653e13-5375-40ff-3053-08da8a92e542
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 14:21:14.1900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KhCup9pI9Yu87mEyH4p45ORo0qE/ubKSX7LZudM0wdq9KVcTqimXR9ABuENuigesEhpJDQGVU1wMHxwhxXFJn/eZ0kbQUPHhTXmb49A3zNvQmTm2JP1bRONpvbFN9jSr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1673
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIyLTA4LTIzIGF0IDEzOjMxICswMzAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiA+ICtzdGF0aWMgdm9pZCBwY2kxeHh4eF9pMmNfcmVtb3ZlX3BjaShzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4gPiArew0KPiA+ICvCoMKgwqDCoCBzdHJ1Y3QgcGNpMXh4eHhfaTJjICpp
MmMgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7DQo+IA0KPiBObyBuZWVkIGZvciBwY2lfZnJlZV9p
cnFfdmVjdG9ycygpPw0KPiANCg0KcGNpX2ZyZWVfaXJxX3ZlY3RvcnMgQVBJIGlzIG5vdCBuZWVk
ZWQgc2luY2UgcGNpbV9lbmFibGVfZGV2aWNlIEFQSSBpcyB1c2VkIGluDQp0aGUgY29kZS4gSSB3
aWxsIHJlbW92ZSAncGNpX2ZyZWVfaXJxX3ZlY3RvcnMnIGluIGFsbCB0aGUgcGxhY2VzIGluIHVw
Y29taW5nDQp2ZXJzaW9uIG9mIHRoZSBwYXRjaC4NCg0KVGhhbmtzLA0KVGhhcnVuIEt1bWFyIFAN
Cj4gDQoNCg==
