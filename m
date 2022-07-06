Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE665680B1
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 10:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbiGFIDe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 04:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbiGFIDd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 04:03:33 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8250BE7;
        Wed,  6 Jul 2022 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657094612; x=1688630612;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=p2FvH4NYrS1BBnpcXVmDx9xPS4tiABNp7L/X6I1DFtA=;
  b=VtxF8PHfODVrf4sCQdhmHNH7qr3memlH0mbPGrOA0VklQ8twqx9Hpf+L
   3r2+mudSvSS/reFsFCUmdlAP25vU34NpkVxOA51sx0US4DMgukOuOdNti
   9ZTGUXjIUlFx7qS3VdfQSBaIwVAqGIBaniROMHVx2a9LmOl+PBvszhcvg
   DbAWU1vGa2vfabjODHGQ+tVu4A6tPt1lgZvZ94NR0In24cdL3EPJkCqk8
   ez+E2vARh2e4sZaHATKlCFNJN3XMIw1pgtrTrdNGLwW7JpEtkFpj1BtaH
   LoAnMXwHjbHRHZVP2ecp8IUbThuXkDe3SVIZtf7CTcj18zGVghal5PvH+
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; 
   d="scan'208";a="170964620"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 01:03:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 01:03:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 01:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zukenwt0cifWXSydwjaPnxs2hg2kSBw0G64nvNm4wL7jMT4VxYLRqm6at+ENFWgkTqz4FL4thFUMId9Ti5VAEmG8q3bSMSuNtkmIrmTNly1TDm0ummbtnmc1znt22My/yEOISKSHLt52ILFGBmZDZKqiHPNf/KPzqkkm/HN57JubYIxwiuELZ5Wv2IQjmWAIncFD7c+HMRRMSKThE41eYq8xiXPF/FPPRF4Jnp9WgEnJhIC3bwqdGhPggDv2RJOOS6uAZu31ILejLe59nfLeFe3UFCOHOVhoY1oOVwst+Oio4rg3I3MCmnRc7DfINkmtpXBiN0QCpoR12bYBNSz7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2FvH4NYrS1BBnpcXVmDx9xPS4tiABNp7L/X6I1DFtA=;
 b=HYFMsSLCwDNEXa5CeiaTUj/vRS536CfasZzb75V0V89Lm73+4OZwrHxYhTnMM8ssMGzjlgGBbsddBgBfx1Oc+jmlmvWlwzu+IocXwgXsfCQN0Z/gyQs2oOxFh2gsKH/szSVWj0uinSGgv7TgBx9ogRs22fxkpcReLzc1Pp67S4t00smWqkBAn2tV38dDFwjq//iWSsSphX4www+CpRfBSCKWVZZMfbOKB1kMZKbQ2yjs2VHufBELsoKyTnuxpfXW5x56Qh+PGthoQOwvq+Vw8NfVKgaueVO4tLehuMkOGQk+14SwhR0mIjkhdFk0x9Jc5sUGgY1BKoehcRNupHlXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2FvH4NYrS1BBnpcXVmDx9xPS4tiABNp7L/X6I1DFtA=;
 b=A6iVhBE71tMIhL0Qno6GxQ2iQKUCJO5LoQdnnnF6rbTAYA3a5/riRs6V6ueuGeo4A7gyIh/IblYlUGVuxrbmzoRtBoZRsp1CfH//YTZ9llo+vi4VHZaDUD0g9Gj6ScIoHo9i8zihWMrZBjRKvpYxAxBQ9hZfiS8EkMUH86vHfjs=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 08:03:26 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%8]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 08:03:26 +0000
From:   <Conor.Dooley@microchip.com>
To:     <wsa@kernel.org>, <Conor.Dooley@microchip.com>,
        <linux-i2c@vger.kernel.org>, <ben.dooks@codethink.co.uk>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Topic: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Index: AQHYhULLtFIyC/B0MkaOYq8wqk68lK1xBuUAgAAMVoA=
Date:   Wed, 6 Jul 2022 08:03:26 +0000
Message-ID: <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <YsU3eLA3PrceFS65@shikoro>
In-Reply-To: <YsU3eLA3PrceFS65@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5be741f-1dfe-4a78-483a-08da5f26017f
x-ms-traffictypediagnostic: PH0PR11MB5032:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tEm1cw3l8MBWpa43eqJPBMRTueWni6B6dbu3gB1d7BapDvoyiImM7hbPfJNzgm179w1RIBvdxG0tosx63ZxzQZ0u7MveDcNs/VUlwNKJHYPxcIN5bJ9caxNeyjn7IPkTmv13/QeE/DjxH88M4rYzh1WU20VGfs2Jzys8v9eMeJhTWmhLWbK8dTAoP2U5N5ze3/UAsxXiCgi9RxldKUe4p4cGMNx1iz1vfJXGfYLZEtAynXF13rYU7EEmyJSpygRdcxmZ0torfaJ1lkcVOf55phmThlJEAw5hrzPK6UheLxUaAYIAX1b3/n6BLl0b1CkurHs39i4SkkQwDEXyH0DTfHnzfbZGX9//4R+6kpN8crFuP9/DO99euJ2uQcDYe/FMtaj6/kGUHSAPqyCN0ejZHFkEO9Hrho+0cuWMjUgJ5Koioi/jRmqvXQ/v6FBakeZcCULtVP18eYTaKCAMTztIiHfKedbA2iASIxnkgRWU6Tzx1Z22g3cIneZ1qoaD0uwfXvkGxaAGMRuCGoWFECTXyFVkqfiDc5aiQ8R7K9QE63oRBYfeWosJeLZGMqdK6nHkHFIB7+ilkaZTeijKL2KictxNgqWQ7a+xO9yLyg7KFKgkzRpZcpNGrNA56wuYef0GRNOOIvVVZRVweG4o/8glG9d8EW71EzmdXsmjN/GpsUmErjFrDYORbOu8leSsU4V2lD2vKiiTBThb1AS5DF0qdJjkKBHufIOJIEKNhnaTZKrTQO+MHtioB0Ytffu7t1oTuPS51o+9V/kRTP9eATaRRgUjax9u/OMmUSyXMoArXRfaH+ITgs3BlSW3OxCajfceYktYL8J6CGwHGaiq8UzP9/6Y4thJsWScQsjxxSMy0e0F+uxtbl/jzMXVFQDdb66J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(396003)(366004)(53546011)(26005)(91956017)(6506007)(6636002)(76116006)(110136005)(6512007)(8936002)(186003)(31696002)(6486002)(83380400001)(86362001)(478600001)(2616005)(316002)(38100700002)(2906002)(41300700001)(38070700005)(5660300002)(71200400001)(66446008)(66476007)(66556008)(66946007)(64756008)(8676002)(36756003)(122000001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TndkNVpFTkY0ampkY0RsSlZvMUZuWCtCS0pGK1Z1M2FpS2F2ZVh2aWZmaGFJ?=
 =?utf-8?B?NmlwaEY5SHdaMXYyVkZUVXVObCs4M2tLTGtSUTloc0RXVy9UbGwvZ2xCQkdF?=
 =?utf-8?B?ZVhMRnNzMTVabko4TGFsTlpzR05KWVdwZnNPTXJqNGgwNWdrTGw0aHZ4Y09Q?=
 =?utf-8?B?WThYN0p3QTNkTFJ0bGxpSzlLNHBvWExEWko5eEVjclBQdHcyTENoWEdmaDdD?=
 =?utf-8?B?dnZWUFc4ZVdyS0JhcGo4cVhtTkgrc0lLRzNSbmhZcExCVFNGSlp2MUJ6MCtG?=
 =?utf-8?B?bmlodWRYRTUwaVVGS0xOS202RnltUWUvbFV2ZjBXdHp2ZXl5a3dVRnVUUzBW?=
 =?utf-8?B?eEw4OEoxNmxiVXpRQnVWZkZsdm41QWliZ1RlUjY1b3kzYmV2MFdSUUdINVds?=
 =?utf-8?B?SDJMUkMxbzNXa2UzbU9XMysvS2dEaFJCZ2k2UUVITFRGQmI4aFFzb0NPLzhz?=
 =?utf-8?B?a3JsUGIyMGRWRTkwWXVraTBoOU8rVWR4WDk2VkxzTTVJWTlLYU5IOE9uRFgw?=
 =?utf-8?B?Y3Y2emhrWVJ1Zlp1VG0xM3N1UGc2N1J1LzFxSWtZMnhRbDZuMmZtR3ZoYWF6?=
 =?utf-8?B?d0FrRnRkMFpCSjh2RjF5b29mbFRpWEUxYnpHYzR0c0hEMXdrWTNkNzdjUGY3?=
 =?utf-8?B?aXNkNzV0R1g1QnJtYTVsOVEvQWxFUmg0MlloMHF3N2dBOHB3Uzh0RUlZYllY?=
 =?utf-8?B?ZVJ0TkVmS1RpMmJmSGZPbzVyY0FCS2NhNG9XRzhWNnMrRlJCa1ZEMmU0Yk5w?=
 =?utf-8?B?RWlwOVBKNEJaMUx5VTZzbWdWL3lvK2ZjdXBPZlNWbUlnWkVPeklZTlMwaVBT?=
 =?utf-8?B?aVQrR3RQOFpkVGppL2JpLzZFNGk1U25DcTJvNGxtSTA4MVBBUmRHMGJlQVlj?=
 =?utf-8?B?OWpwWGh4eUQ5VFBmeUwxS3lPdzlIOHRDV1ZLWXlvUkdOdE5yMUdyWEcrMmlK?=
 =?utf-8?B?UUdhRXpDZlRYNlc0QnNCUnZGaGptbGhsbkVXcnhWa1pjN04ybDVxNUZka0pX?=
 =?utf-8?B?RGsvVERraGJTWHJhdmlOUGh0bTc4MlNVQTFuUGZDYkZ4SFBkTUs3RUQ1VlUx?=
 =?utf-8?B?TnptWmdUek9YYXZhakRZVFY4dTBLOFRkbjIyQjJSbDM2TmYxUVU0K21YSVFW?=
 =?utf-8?B?TWNpMVc2a1NvczZySnV0NFF1azgzTk9VRjVRL0ZlNmFYTXM4OVBBb1lyQzI4?=
 =?utf-8?B?TWM2K2NWN2FiajBmemc1djFMb01hLzRWVkFURXgrZUhaMnlTcVBObFVoOVJB?=
 =?utf-8?B?bFZVSVZpSUZoQlQ2aHpaZjRETWgvdDZoa0luSjhrNnN6aFVQRHZwL2lwM1Iz?=
 =?utf-8?B?N0tXNE1YdDk1TWZLQS9VaXkrREwwdzk2OWJmOVNVeDYxMTczOG1VeSt3d2lV?=
 =?utf-8?B?MVVCc2ZMZGhlbTNXWkc3MWw2L090cjdaZTBiZlJiaHZUaCsrbWFFTWJNQis3?=
 =?utf-8?B?NEJzdW53RUQvSk5ySnh4cGRHOGJibUNSTTU3VWxSUXpkdE9waXZmTkI0K2ZQ?=
 =?utf-8?B?K0VoaEp2NVl0Ukc0SW5vU09LeVc0V1A2cmVLbElsWlhDUGQ3MHROVmdycnRa?=
 =?utf-8?B?ZFI2aHVRdzJZK3d5QXprcUdDTWtTWitlNDhvYXRCaWRqSWhsY0JjZlFDVzZu?=
 =?utf-8?B?QjRWWUg3REhNSTV1Z2ptUXduVXpxbGlueTRUQWtYR3ptZjRFQ3FTeTl6bE54?=
 =?utf-8?B?SzVkUlFmR3NmL0JQSFZhMzdOeEhXelFlUnZWWDFNZWZZcEkzSy9FRFlYSGli?=
 =?utf-8?B?R1hUNUh0d3VyWmFIT0RKRm96UEJQZDNINGZURHErQXlra09lQ0duLzdpV1Ay?=
 =?utf-8?B?Y1FpY2FjZWxrSGdzbExQcnZXUitSK3Fjb205Q29weXFVRHRKNHpZblc0Q3BS?=
 =?utf-8?B?Znd1RVdUeFpOTlNNc3puRHVvNHB2cDlSUVdUU01zQkU4YUVubUU2R05TcXFM?=
 =?utf-8?B?NTUwTWxPR2ZGM2ZSd2c2WHV0T3NickJENGwrenFkZGQ1VXhQWDJyTzYvamU3?=
 =?utf-8?B?N2lkd1ZwWnBGN1doTHJpcHd5OHhPTk41SXlPQ2N2M0tiUlhMcnFqVGJMT0tp?=
 =?utf-8?B?VlRIOTlxM3o3bXdBL0E2cmxzemFadEk5dXMwd3JBcXlTTFBCT2dxWEVUQ003?=
 =?utf-8?Q?Xv9/pF+OspGVgffl+koys3oNV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CDED4299474E14E91CFAAE5D71C9606@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5be741f-1dfe-4a78-483a-08da5f26017f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 08:03:26.4392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+57wbbieJ50lfHecR9XCIKYmxsG5FvekbUo9/MTEV2iFTP4ojrlEeMivD2oKNXHnDZnLullUGXnqvHVAvWnR7ItC97VnkClFhPDTkZO4/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDA2LzA3LzIwMjIgMDg6MTksIFdvbGZyYW0gU2FuZyB3cm90ZToNCj4gSGkgQ29ub3Is
DQo+IA0KPiB0aGFuayB5b3UgZm9yIHNlbmRpbmcgdGhpcyBkcml2ZXIuDQo+IA0KPiBPbiBUdWUs
IEp1biAyMSwgMjAyMiBhdCAwODo0MjozOEFNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
PiBBZGQgTWljcm9jaGlwIENvcmVJMkMgaTJjIGNvbnRyb2xsZXIgc3VwcG9ydC4gVGhpcyBkcml2
ZXIgc3VwcG9ydHMgdGhlDQo+PiAiaGFyZCIgaTJjIGNvbnRyb2xsZXIgb24gdGhlIE1pY3JvY2hp
cCBQb2xhckZpcmUgU29DICYgdGhlIGJhc2ljIGZlYXR1cmUNCj4+IHNldCBmb3IgInNvZnQiIGky
YyBjb250cm9sbGVyIGltcGxlbXRhdGlvbnMgaW4gdGhlIEZQR0EgZmFicmljLg0KPj4NCj4+IENv
LWRldmVsb3BlZC1ieTogRGFpcmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5j
b20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWlj
cm9jaGlwLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+DQo+IA0KPiBXaGVyZSBhcmUgdGhlIGJpbmRpbmdzPyBBcmUgdGhleSBh
bHJlYWR5IG9uIHRoZSB3YXkgdXBzdHJlYW0/DQo+IA0KPj4gICBkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW1pY3JvY2hpcC1jb3JlLmMgfCA0ODYgKysrKysrKysrKysrKysrKysrKysrKysrDQo+IA0K
PiBUaGUgYmlnZ2VzdCByZW1hcmsgSSBoYXZlIGlzIHRvIHJlbmFtZSB0aGUgZHJpdmVyIGEgbGl0
dGxlLiBVc3VhbGx5IGENCj4gIi1jb3JlIiBzdWZmaXggbWVhbnMgdGhhdCB0aGVyZSBhcmUgb3Ro
ZXIgZHJpdmVycyBsaWtlICItcGxhdGZvcm0iIG9yDQo+ICItcGNpIiB1c2UgdGhpcyBjb3JlLiBX
b3VsZCAiaTJjLW1pY3JvY2hpcC1mcGdhIiBvcg0KPiAiaTJjLW1pY3JvY2hpcC1jb3JlaTJjIiB3
b3JrIGZvciB5b3U/DQoNCkknZCBwcmVmZXIgdGhlIGxhdHRlci4gQmVpbmcgY2FsbGVkICJjb3Jl
IiBpcyB1bmZvcnR1bmF0ZSBhbmQgSQ0KZGlkIHRoaW5rIGFib3V0IHRoYXQuIGkyYy1taWNyb2No
aXAtY29yZWkyYyB3b3VsZCBoYXZlIGJlZW4gbXkNCmZpcnN0IGNob2ljZSBidXQgSSB0aG91Z2h0
IHRoZSBkb3VibGUgdXNhZ2Ugb2YgaTJjIHdvdWxkJ3ZlIGJlZW4NCmRpc2FwcHJvdmVkIG9mIGhh
aGENCg0KPiANCj4+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4
L2Nsa2Rldi5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4+ICsjaW5jbHVkZSA8bGlu
dXgvaTJjLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPg0KPiANCj4gRG8geW91IHJl
YWxseSBuZWVkIHRoYXQ/DQoNCk5vcGUhDQoNCj4gDQo+IC4uLg0KPiANCj4+ICtzdGF0aWMgaXJx
cmV0dXJuX3QgbWNocF9jb3JlaTJjX2hhbmRsZV9pc3Ioc3RydWN0IG1jaHBfY29yZWkyY19kZXYg
KmlkZXYpDQo+PiArew0KPj4gKwl1MzIgc3RhdHVzID0gaWRldi0+aXNyX3N0YXR1czsNCj4+ICsJ
dTggY3RybDsNCj4+ICsJYm9vbCBsYXN0X2J5dGUgPSBmYWxzZSwgZmluaXNoZWQgPSBmYWxzZTsN
Cj4+ICsNCj4+ICsJaWYgKCFpZGV2LT5idWYpDQo+PiArCQlyZXR1cm4gSVJRX05PTkU7DQo+PiAr
DQo+PiArCXN3aXRjaCAoc3RhdHVzKSB7DQo+PiArCWNhc2UgU1RBVFVTX01fU1RBUlRfU0VOVDoN
Cj4+ICsJY2FzZSBTVEFUVVNfTV9SRVBFQVRFRF9TVEFSVF9TRU5UOg0KPj4gKwkJY3RybCA9IHJl
YWRiKGlkZXYtPmJhc2UgKyBDT1JFX0kyQ19DVFJMKTsNCj4+ICsJCWN0cmwgJj0gfkNUUkxfU1RB
Ow0KPj4gKwkJd3JpdGViKGlkZXYtPmFkZHIsIGlkZXYtPmJhc2UgKyBDT1JFX0kyQ19EQVRBKTsN
Cj4+ICsJCXdyaXRlYihjdHJsLCBpZGV2LT5iYXNlICsgQ09SRV9JMkNfQ1RSTCk7DQo+PiArCQlp
ZiAoaWRldi0+bXNnX2xlbiA8PSAwKQ0KPj4gKwkJCWZpbmlzaGVkID0gdHJ1ZTsNCj4gDQo+IEhv
dyBjYW4gaXQgaGFwcGVuIHRoYXQgbGVuIGlzIDwgMD8gV291bGRuJ3QgdGhhdCBiZSBhbiBlcnJv
ciBjYXNlPw0KPiANCj4gLi4uDQo+IA0KPj4gK3N0YXRpYyB1MzIgbWNocF9jb3JlaTJjX2Z1bmMo
c3RydWN0IGkyY19hZGFwdGVyICphZGFwKQ0KPj4gK3sNCj4+ICsJcmV0dXJuIEkyQ19GVU5DX0ky
QyB8IEkyQ19GVU5DX1NNQlVTX0VNVUw7DQo+IA0KPiBIYXZlIHlvdSB0ZXN0ZXMgU01CVVNfUVVJ
Q0sgYXMgd2VsbD8NCg0KTm90IHNwZWNpZmljYWxseSBTTUJVU19RVUlDSywgYnV0IEkgZGlkIHRl
c3Qgd2l0aCBoYXJkd2FyZQ0KdGhhdCB1c2VzICJ6ZXJvLWxlbmd0aCIgbWVzc2FnZXMuDQoNCj4g
DQo+IC4uLg0KPiANCj4+ICsJaWRldi0+ZGV2ID0gJnBkZXYtPmRldjsNCj4+ICsJaW5pdF9jb21w
bGV0aW9uKCZpZGV2LT5tc2dfY29tcGxldGUpOw0KPj4gKwlzcGluX2xvY2tfaW5pdCgmaWRldi0+
bG9jayk7DQo+IA0KPiBZb3UgbmV2ZXIgdXNlIHRoaXMgbG9jay4NCg0KQW5kIG5vciBkaWQgd2Ug
aW4gYW55IHByaW9yIHZlcnNpb24gKHByZS1saXN0KS4NCkkgYW0ganVzdCBnb2luZyB0byByZW1v
dmUgaXQuDQoNCj4gDQo+IC4uLg0KPiANCj4+ICsJaWRldi0+YWRhcHRlci5vd25lciA9IFRISVNf
TU9EVUxFOw0KPj4gKwlpZGV2LT5hZGFwdGVyLmFsZ28gPSAmbWNocF9jb3JlaTJjX2FsZ287DQo+
PiArCWlkZXYtPmFkYXB0ZXIuZGV2LnBhcmVudCA9ICZwZGV2LT5kZXY7DQo+PiArCWlkZXYtPmFk
YXB0ZXIuZGV2Lm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4+ICsJaWRldi0+YWRhcHRl
ci50aW1lb3V0ID0gTUlDUk9DSElQX0kyQ19USU1FT1VUOw0KPiANCj4gU2ltcGx5IHVzZSBIWiBo
ZXJlPw0KDQpTdXJlLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcgOikNCg0K
