Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDB059FC6D
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 15:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbiHXNzT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 09:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237446AbiHXNyv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 09:54:51 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFF67E337;
        Wed, 24 Aug 2022 06:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661349165; x=1692885165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9Uf0g8hLnoxGq3nubXfNa3BJ3d/X/5iCQnyFDuLUBcc=;
  b=ZyVWxrvbi1qQFUQhjA6f9p556vm6XhFSMXx3OKqDco6NYv8hERNUboE1
   EeAqxz29dBVh22lp9ss6Km+NT6HGtDGO7V8aDhlvIe8T003EedixZ8ySn
   oAZXUEsVZDwwNzDmRKjBzmYUewqd1iaX6AoIk7M+7WIgX48BDaRtPxrTd
   Go4iGORbku7k267Ex7Fk3f20nAux1niQ9BVcAHKTXu56rdHDp/79wWmsa
   Wl98USeLe/9u6veMsEN46DLyj+FXSUVX1CyjOLwgsk+S7R4ONBwQNhHqk
   EqUQU6T52XtLYtevN4moceZyGO/eYqcaRhzbzkpf0F4nV4MA5h+9/K3q+
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="170746312"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2022 06:52:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 24 Aug 2022 06:52:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 24 Aug 2022 06:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApgOsONXdVT1bOmZhQw1WYf4dGH8ADzhuKUz5YyZzzng0X8burAwTkcmwScQdbis2ddsxFCxxhzJnfDsnz7wTw6Q1LXwAOQ6dbMniuhemc5DSzOnkfufKtK8SYX00JV39rMjc3xNgRYtcjgvHjxvFTrIzViw/9WNk+VekzCBGqCkqurTsFQ2YqF1Vq8L65Dyo+l9v0ZiqOjZL1m8NxpbDfSkfF6Q4UH/vFpPBFHrrrzbFYgX5PH7VwEy1FrP7LXp4aLdfsp6Xf2ztBpiWCDqtmZeNCTNsRXZ0/RhXZe8J2gYxYUd1KW8APKgUR7NR9AIqsrWXz4kji3mHeZM2pPvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Uf0g8hLnoxGq3nubXfNa3BJ3d/X/5iCQnyFDuLUBcc=;
 b=HQpzxu1hSs9Y8ZGtP5LX8b3bxHWuDjZ9/4azxECTdkWtcqX8Oe3jCjtu2zOAj26A8mZw1lcOAEGwP4q45z42d7DeE7uOb2sz/QDLAn5hV6fFuWE+IMHjIx6fCjK2GDSlVNz9gBwjf4zo9SvkWSCaDDDPoU8wu+2gbE4rSG6AYRZ6HXlFs0AUScbbfNiR4TpGe48J9heH92x9Bsv119+gRtW7ISZwo0M4EfGjDpWGHzzdVjZ2yFeJoC3jUSWoEL/UFaY5aPQnoHT3/5gHEA6U9RqLq7+/rkdsB/v3JHCvBlHWMhzZDq/IKEhjvOw9wfdkch+KNgzXMjKKqAEi/Eyujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Uf0g8hLnoxGq3nubXfNa3BJ3d/X/5iCQnyFDuLUBcc=;
 b=TOUm4pao7Oys7S5aIhB12bYawK8bt/0I/08UdcTN23o7yB7er6aDoa7ZJAoa2i9IZJEV0esDx89woxawTbS/lrhDOw/pjI73B5FOyek8346FFeVAKE/hG4hIpZgIEgdf2IKv66gUMerj0O9n6v8uydrfoGsx5HIe30gfDYMOYSM=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 13:52:36 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::b9d5:a00c:517f:8454]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::b9d5:a00c:517f:8454%6]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 13:52:36 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <christophe.jaillet@wanadoo.fr>,
        <linux-kernel@vger.kernel.org>, <wsa@kernel.org>
CC:     <krzk@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <sven@svenpeter.dev>, <jsd@semihalf.com>,
        <semen.protsenko@linaro.org>, <rafal@milecki.pl>,
        <UNGLinuxDriver@microchip.com>, <olof@lixom.net>, <arnd@arndb.de>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHYttI9ItE0vA92WES0jroLXsIOYq28XuIAgAG1XgA=
Date:   Wed, 24 Aug 2022 13:52:36 +0000
Message-ID: <972a65f01b0077940cb4728e1fbfd3ea28860176.camel@microchip.com>
References: <20220823145603.2606475-1-tharunkumar.pasumarthi@microchip.com>
         <667f1658-cf29-6b19-fd57-0c62f625d536@wanadoo.fr>
In-Reply-To: <667f1658-cf29-6b19-fd57-0c62f625d536@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d81f2948-669e-4c09-77f7-08da85d7e6c1
x-ms-traffictypediagnostic: CY8PR11MB7012:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XCw9RixMMftubJIl6sflM3gKh4+9AyFRbAOD2PoxUtv2ZTpkgzc//etUbOJgAJnyrzMTtOPFliaOcgF4EsGOFdNdDmXKNA6/vT14Yfk+UiCjPOpbl/s3PKPpwVquv73AOhXj7GSc6PJz38Pd37sYUCRJu9OCREvz1m0eV29wqr8VeqRvAOZXvQV+ccRVzENINYqHOmQR/d7Fh63NvCSSlZJO+VVcA4PsSOhKnzMLwPe2sIZVRrncHZqHSfAHsFMggiTPWFifDAIkeom8bJnBgXKVshvXvLfEEz/gnd9HLgz//7oKgVRYuu9R5t2CrEc3ZWof+VDkTEqYhLrGmn2UJumV62KmV6ai6A1HEVHS6i5WCZYJWUX43WpvKxUhU9fa5c9KOrZ7/5Ez3tDtJ7MXVTDNQtfJrllw/b/KVRawuQiXLTNgjTHCtYbeiZbWHzK/xe3Cv5yUJkiRozvhG0Pic+sB/YiO1GHuxbwoaOGbfi5HiR28BvVAXBFQWEm2Noak9VZpBhoEo75YrqqTOIsmnLlI0XGt7Ao4YTMbgnx8GgaU9i4XdDgjm5byTGUdRCvkq8rbHPIUlGuRxEdOW2RgzdXBxUneln42oFg55kwgZ2x2RSpKkplkYSLawizYlAsPlX+vU6NIi6UGinxT+1of2C/ISxpWlnfY338HVR6NpkjJL/EWjrY4jWCefmIfRq0LuNltG9KaQhe9f/vBjJ/DlHm78vwx4XnyNMz04VIE2tAc54j8D87tejtgYj1S0rvUbAGwHOF8S9pLaxkwZt/k/pHANbWggdvuWyVNNY1VfwbN5H99zpJvlrbuIVBfKFUU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(376002)(346002)(366004)(39860400002)(4326008)(64756008)(66946007)(66556008)(66446008)(66476007)(8676002)(91956017)(6486002)(76116006)(5660300002)(41300700001)(7416002)(8936002)(38100700002)(122000001)(478600001)(54906003)(71200400001)(316002)(110136005)(36756003)(26005)(2616005)(6512007)(66574015)(186003)(6506007)(2906002)(83380400001)(86362001)(38070700005)(32563001)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFBHcXYyZThnUjREbkVnNlFlSU9ZRnErWU5xUG9PQ1dDMHlZNUYwT0E3VFkr?=
 =?utf-8?B?cDN0Vjg4NnBDWE4vK1prVHpEbFhBMGpIOGdSZWJmUkxNUmxzYXJqeXVlcWIv?=
 =?utf-8?B?V050WW1adjZEQ2xaM0pNTlRxd0lGV244cWExMXZ1ZFgwUXFMMnhRekdITXYr?=
 =?utf-8?B?WHR3eEtJQ2laZ2htUGxtd3VOczlKc2wrY3JYc0k0bTZFYUM4ME9EbktMcjdm?=
 =?utf-8?B?Z1FmQVNxZjJxRkxjRU44cHF1bTc0V1pEN0dNM2F6ZFVZeTV4Q056UGhKVE5R?=
 =?utf-8?B?ZndEdi9zOFZYUTh2cXBGTUZMWWJqZko1TWNRcVhVeU5kNldNZTdmeUlVSnZk?=
 =?utf-8?B?dVRhOWtnOGswK2d6L2YzRWJFY3JHNlEyVDVGM2JnMUhHU25vRkdXeTI1d0hi?=
 =?utf-8?B?dXB5ejZ1ZnNRU05BeGtadnBXck0xS2xoc2tkS1ZodnNrY2VMcU9ZaVFhZlpu?=
 =?utf-8?B?QWJVM1k5NkRUaG5PWWN3OGhMWGs5bW5oaDZ2dnlwYzF1SzRLUXRlQXdwWVV4?=
 =?utf-8?B?Umtab0xGZzZMbWRyWE5SQ0dLM3UvWkpwZ0xnTlRTVnVibFN3ZWNoenFtcGNk?=
 =?utf-8?B?S3FuN1ZtaWRDY2ZiM1M2Umk3b29qcGRHRDl0Vy9qYzZzNTkxSjFLLzV1endk?=
 =?utf-8?B?NnVnOUtzQXVFS1gvdmltNm1TNnZyTHcyYlIvc2crWDJtWENlOHJtaEVPZGhq?=
 =?utf-8?B?QmVDeHZCNzhsOEtoRkx2V2dvYkJYTGNaZVhzR1M2YVpqeit4cUkrR3cwYjFR?=
 =?utf-8?B?L2MvS2pNMk14MWh2b2FQSVZaR3Bhc0JxMHUzNng2TlRTNzZmVGIrN1laMkd6?=
 =?utf-8?B?aFJNNXk5RTZCWnI2SEhkMHpiWnZDMmx0dVVhT242WldodVlHZ1NmME5ZR2lF?=
 =?utf-8?B?aHI1R2F6eGpvblJJOW51QnJMSHhNQVFSTGtJUHdvOFUvWFJWaGloblJFWE9U?=
 =?utf-8?B?WU1uSjEveUpSaTU4WmtxbjJITnlZcEU0ZGdIQTJ6NWQ3eGV3WW5PTkgzdmlY?=
 =?utf-8?B?RnB0ZEtlVmtKTDNXcXU0SkF0azVlVWhGMktKODVIUmRvWFNKRTZtUTFxd2Q2?=
 =?utf-8?B?N1prL1dMT2k5bDN5ejk1eHo4SlJHbktoTUpMM1dweHF1ekJPQVpEVElOTEdy?=
 =?utf-8?B?TlZLcFphUjk3RDk3QUxURkQ2R21EYUQ0ZzFNcDZGWFpmTnA4Tkplb3EwSm9t?=
 =?utf-8?B?aituMk5JMDhydTRxVkdJeEZ2empwc1FHZU1Na0wxQlZQUkJxNDZHeFRsdEM2?=
 =?utf-8?B?VThiWS8wa210RHVDWkJZNVZzUkh2NnIvdThvU29Vbi8zQ2lGZDIwZkFKVWVm?=
 =?utf-8?B?OTFzU2tmZ0FwK3JaV3BBem0vcmkrYzlpa3dHT3ZiTWw3dTNEUkxwZnY3Z0RV?=
 =?utf-8?B?SVkzWW0zV2dFdU9FdHR0ZEhhYXZRUyt0cVZJVG1DUU9ha3NrUCs4ak5zUngv?=
 =?utf-8?B?TXdtYWUySTl4bVZ3ZjdQV3JSTzc0ZERkZUpIcjhLT2lHWVU0TWJzTTRsQnBq?=
 =?utf-8?B?WFpvZkpZb1lyYlhSV3lGR1FJM04wTy9xNWg3SW0zcU9Xd0ZhOGQrRm4wZity?=
 =?utf-8?B?cGViaDdGZzE3RVRhRmNIbDBYTVoxVmZCWlBrS0hYR2VWQXJEdUxPUUtRUFNW?=
 =?utf-8?B?MWVjSXNEc2pEUU16RzNXV2t3M3RiTU9HdzJ0eWZDWnFtNEVlb2IrNURNK1N6?=
 =?utf-8?B?K2d3VjdMYnA2bnZBM3ppaDluNllabWtQbHJhUS9IQUV5dGNCdzdCK2xYUXFk?=
 =?utf-8?B?cW8yYVR5a0xsRVpDTkdZeE41bE1MTWp1RzJFTkJmbTk1TkRiNlN6aHh3SUVq?=
 =?utf-8?B?QXVuamUwc21YWWRmeTk3dnlndHNFWGQ3OUlMWXR6Y0UyTGt3SG1XYkd4U2lM?=
 =?utf-8?B?a0t0S2V6QklnV0puSWdCY2E2UUpGTU9ZTkR2eEhzWFd5VEJJZ21CK2Nqbnlh?=
 =?utf-8?B?VWRzMmgrbWUvNEJJcFlCaTRJWitDV21rMlR0M1NDK3hvTDdFc1p1ZE9MUmFo?=
 =?utf-8?B?Mi9jckNlVi96MmhMSFowajJCY3pYRTZGUHdoeGVNR2dzTkh4VjZvcXBETWVu?=
 =?utf-8?B?OHB2aEk2emZvUzA2Si9YMUNlQU1jL3d1czhZTmhyazVOVGNmTS9JWHAyNzNr?=
 =?utf-8?B?V3JjVEFVYTZhN000ek9ERXU1SVMzSzZkN2R3aXg2OXRHckN5d1h1WitXZGUr?=
 =?utf-8?Q?PYoZfp1SHpWKsgfaH1NKyHvnHkOaGhVTMSQ7cVmnsB6h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0470F129EE43FE42AA0157C671CC9ABE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81f2948-669e-4c09-77f7-08da85d7e6c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 13:52:36.1623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cVfSFMRXBDeqPH0yxKRJseFB2eqciS+zctVQqhS8WYNcLoTruWqIhWlPrQT8DLdIuhNAteGzgFwGjUKgp9qkJneEC96U+4821jSEL7zqgrs9MQEOMEFxWPT8EDVbWc3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIyLTA4LTIzIGF0IDEzOjQ4ICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gTGUgMjMvMDgvMjAyMiDDoCAxNjo1NiwgVGhhcnVuIEt1bWFyIFAgYSDDqWNyaXQgOgo+
ID4gTWljcm9jaGlwIFBDSTFYWFhYIGlzIGFuIHVubWFuYWdlZCBQQ0llMy4xYSBTd2l0Y2ggZm9y
IENvbnN1bWVyLAo+ID4gSW5kdXN0cmlhbCBhbmQgQXV0b21vdGl2ZSBhcHBsaWNhdGlvbnMuIFRo
aXMgc3dpdGNoIGhhcyBtdWx0aXBsZQo+ID4gZG93bnN0cmVhbSBwb3J0cy4gSW4gb25lIG9mIHRo
ZSBTd2l0Y2gncyBEb3duc3RyZWFtIHBvcnQsIHRoZXJlCj4gPiBpcyBhIG11bHRpZnVuY3Rpb24g
ZW5kcG9pbnQgZm9yIHBlcmlwaGVyYWxzIHdoaWNoIGluY2x1ZGVzIGFuIEkyQwo+ID4gaG9zdCBj
b250cm9sbGVyLiBUaGUgSTJDIGZ1bmN0aW9uIGluIHRoZSBlbmRwb2ludCBvcGVyYXRlcyBhdCAx
MDBLSHosCj4gPiA0MDBLSHogYW5kIDEgTUh6IGFuZCBoYXMgYnVmZmVyIGRlcHRoIG9mIDEyOCBi
eXRlcy4KPiA+IFRoaXMgcGF0Y2ggcHJvdmlkZXMgdGhlIEkyQyBjb250cm9sbGVyIGRyaXZlciBm
b3IgdGhlIEkyQyBlbmRwb2ludAo+ID4gb2YgdGhlIHN3aXRjaC4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogVGhhcnVuIEt1bWFyIFAgPHRoYXJ1bmt1bWFyLnBhc3VtYXJ0aGlAbWljcm9jaGlwLmNv
bT4KPiA+IC0tLQo+ID4gwqAgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCA4ICsKPiA+IMKgIGRyaXZlcnMvaTJj
L2J1c3Nlcy9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEwICsKPiA+IMKg
IGRyaXZlcnMvaTJjL2J1c3Nlcy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oCAxICsKPiA+IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbWNocC1wY2kxeHh4eC5jIHwgMTEy
MyArKysrKysrKysrKysrKysrKysrKysrKysKPiA+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTE0MiBp
bnNlcnRpb25zKCspCj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1tY2hwLXBjaTF4eHh4LmMKPiAKPiAKPiA+ICtzdGF0aWMgaW50IHBjaTF4eHh4X2kyY19w
cm9iZV9wY2koc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkICplbnQpCj4gPiArewo+ID4gK8KgwqDCoMKgIHN0cnVjdCBwY2kxeHh4eF9pMmMg
KmkyYzsKPiA+ICvCoMKgwqDCoCBpbnQgcmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgIGkyYyA9IGRl
dm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmkyYyksIEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgIGlmICghaTJjKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVO
T01FTTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBwY2lfc2V0X2RydmRhdGEocGRldiwgaTJjKTsKPiA+
ICsKPiA+ICvCoMKgwqDCoCBpMmMtPmkyY194ZmVyX2luX3Byb2dyZXNzID0gZmFsc2U7Cj4gPiAr
Cj4gPiArwqDCoMKgwqAgcmV0ID0gcGNpbV9lbmFibGVfZGV2aWNlKHBkZXYpOwo+ID4gK8KgwqDC
oMKgIGlmIChyZXQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4g
PiArCj4gPiArwqDCoMKgwqAgcGNpX3NldF9tYXN0ZXIocGRldik7Cj4gPiArCj4gPiArwqDCoMKg
wqAgLyogd2UgYXJlIGdldHRpbmcgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUgU01CIGNvcmUuIFNN
QiBjb3JlIHVzZXMKPiA+ICvCoMKgwqDCoMKgICogQkFSMCBhbmQgMzJLIGlzIHRoZSBzaXplIGhl
cmUgcGNpX3Jlc291cmNlX2xlbiByZXR1cm5zIDMySyBieQo+ID4gK8KgwqDCoMKgwqAgKiByZWFk
aW5nIEJBUjAKPiA+ICvCoMKgwqDCoMKgICovCj4gPiArCj4gPiArwqDCoMKgwqAgcmV0ID0gcGNp
bV9pb21hcF9yZWdpb25zKHBkZXYsIEJJVCgwKSwgcGNpX25hbWUocGRldikpOwo+ID4gK8KgwqDC
oMKgIGlmIChyZXQgPCAwKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVO
T01FTTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpMmMtPmkyY19iYXNlID0gcGNpbV9pb21hcF90YWJs
ZShwZGV2KVswXTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpbml0X2NvbXBsZXRpb24oJmkyYy0+aTJj
X3hmZXJfZG9uZSk7Cj4gPiArCj4gPiArwqDCoMKgwqAgcGNpMXh4eHhfaTJjX2luaXQoaTJjKTsK
PiA+ICsKPiA+ICvCoMKgwqDCoCBkZXZfaW5mbygmcGRldi0+ZGV2LCAiaTJjIGNsb2NrIGZyZXE6
ICVkXG4iLCBpMmMtPmZyZXEpOwo+ID4gKwo+ID4gK8KgwqDCoMKgIHJldCA9IHBjaV9hbGxvY19p
cnFfdmVjdG9ycyhwZGV2LCAxLCAxLCBQQ0lfSVJRX0FMTF9UWVBFUyk7Cj4gPiArwqDCoMKgwqAg
aWYgKHJldCA8IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4g
PiArCj4gPiArwqDCoMKgwqAgLypSZWdpc3RlciB0aGUgaXNyLiB3ZSBhcmUgbm90IHVzaW5nIGFu
eSBpc3IgZmxhZ3MgaGVyZS4qLwo+ID4gK8KgwqDCoMKgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEo
JnBkZXYtPmRldiwgcGNpX2lycV92ZWN0b3IocGRldiwgMCksCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaTF4eHh4X2kyY19pc3Is
IFBDSTFYWFhYX0lSUV9GTEFHUywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpX25hbWUocGRldiksIGkyYyk7Cj4gPiArwqDCoMKg
wqAgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfZnJlZV9y
ZWdpb247Cj4gPiArCj4gPiArwqDCoMKgwqAgaTJjLT5hZGFwID0gcGNpMXh4eHhfaTJjX29wczsK
PiA+ICvCoMKgwqDCoCBpMmMtPmFkYXAuY2xhc3MgPSBJMkNfQ0xBU1NfU1BEOwo+ID4gK8KgwqDC
oMKgIGkyYy0+YWRhcC5kZXYucGFyZW50ID0gJnBkZXYtPmRldjsKPiA+ICsKPiA+ICvCoMKgwqDC
oCBzbnByaW50ZihpMmMtPmFkYXAubmFtZSwgc2l6ZW9mKGkyYy0+YWRhcC5uYW1lKSwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiTUNIUCBQQ0kxeHh4eCBpMmMgYWRhcHRlciBhdCAl
cyIsIHBjaV9uYW1lKHBkZXYpKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCBpMmNfc2V0X2FkYXBkYXRh
KCZpMmMtPmFkYXAsIGkyYyk7Cj4gPiArCj4gPiArwqDCoMKgwqAgcmV0ID0gaTJjX2FkZF9hZGFw
dGVyKCZpMmMtPmFkYXApOwo+ID4gK8KgwqDCoMKgIGlmIChyZXQpIHsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAiaTJjIGFkZCBhZGFwdGVyIGZhaWxl
ZCA9ICVkXG4iLCByZXQpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2kxeHh4eF9p
MmNfc2h1dGRvd24oaTJjKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJf
ZnJlZV9yZWdpb247Cj4gPiArwqDCoMKgwqAgfQo+ID4gKwo+ID4gK8KgwqDCoMKgIHJldHVybiAw
Owo+ID4gKwo+ID4gK2Vycl9mcmVlX3JlZ2lvbjoKPiA+ICvCoMKgwqDCoCBwY2lfZnJlZV9pcnFf
dmVjdG9ycyhwZGV2KTsKPiAKPiBTaG91bGQgdGhpcyBhbHNvIGJlIHBhcnQgb2YgdGhlIC5yZW1v
dmUgZnVuY3Rpb24/CgpZZXMsIEkgd2lsbCBpbmNsdWRlIHRoaXMgQVBJIGluIHJlbW92ZSBjYWxs
YmFjawoKPiA+ICvCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
dm9pZCBwY2kxeHh4eF9pMmNfcmVtb3ZlX3BjaShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+ICt7
Cj4gPiArwqDCoMKgwqAgc3RydWN0IHBjaTF4eHh4X2kyYyAqaTJjID0gcGNpX2dldF9kcnZkYXRh
KHBkZXYpOwo+ID4gKwo+ID4gK8KgwqDCoMKgIGkyY19kZWxfYWRhcHRlcigmaTJjLT5hZGFwKTsK
PiA+ICvCoMKgwqDCoCBwY2kxeHh4eF9pMmNfc2h1dGRvd24oaTJjKTsKPiA+ICt9Cj4gPiArCgo=
