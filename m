Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1648847E540
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 15:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240026AbhLWO47 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 09:56:59 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:28717 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239935AbhLWO46 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Dec 2021 09:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1640271418; x=1671807418;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=In3HGj64CPzrkpvBGYGeI0iZIrZ3qGCaOe5XXg/8wKc=;
  b=Fh4VsocREGjfKZgcy+Gi2dmFb8mXh9IxUk1ajIPQo4+z+CtCgwybKBRI
   vKZWusYjYDL/kclDsQoqE6mHU17WdXVKgu4XtjMYqMX84E8ujOWQGVZfq
   p/QE/Uvlj9U9NGkh6oix6Vs58jm8BZUUHtfaR09zCGbW5HXMOSNUySrCO
   a63eeFDul7Z2bqkYgD+gZK/RNi4fUb099ezS8Ig1cwJNBzoRu7Syx4Rhb
   ah/Os37caVz5tAJRXwVLwUQA1qIDh7vBtrsszU33LpTG/Yd7eIU8NjDqH
   deHwmTiCsaq6qGZ0AfLlHmJdtYLOOw935g8WF+Y+CHjj+fWo0Fyv36YhX
   w==;
IronPort-SDR: wQ5n9WGj4wIDpN04ZusOghZzgj9F3S5v2kENTzSl+wZEtCszoecDkFzRjSWUa1B9j3NHO6tBr8
 M8TCJ6tD7DF4wS8yk0kZSqyVIY0M7pRixtlYThPetXTrSxyMDoTq/EbVitzOkr9IISjYH5jVTY
 I78aSWcBWE17+S9O/wjAT7eIBhihntd+GAlVhTnEKFuF/fUy6Xl7oNOAiSJ3fIo/rBvaN3kJJD
 CSRbc1YZ0bwecuR8Qbv/23FKre0IDhSGJteYtL9a0rIolyK41dHBfxbuauoIJ16scXqwaWlnFd
 PMMPmjNTavxuTVczBcEdn7e5
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="140717891"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Dec 2021 07:56:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 07:56:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 23 Dec 2021 07:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyDw6ccFCcWdfSPmczosCySOjRDq/4Anp5QKw0BjwGaiqmsAGq0mLqT8cRHs1HohSNFb4B59BpaGvZ3VBj3qCjAhOdqPgd3+c2QwzLFIp/FCE9KYSa5yrQXm0tMefAK2k9LXkorFKeuUwLEL1agw+hxgr3Wufn4NCpyFyqc0Krs8sj2zqYN0JeemhT05WuA9vuG1l8U/aDR63zgaoG8jB2Ed9Q9GQeAsbMyOUXAPEzFxXBMb3nFHGR+UCagdWkv4TP1uJ74/nPgE379I3FpGqjyTK9Beplk28ZoWljdBw35xm/xQ9W22noiwm3omen+XcJpALE4Dyu3u3dRywHJtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In3HGj64CPzrkpvBGYGeI0iZIrZ3qGCaOe5XXg/8wKc=;
 b=L+WsOr30mD9UsJkMCJfLHeNeAAKPSOelZ7gl1gj1FRSmkL89y79AoB1nL/gWTDB/jhDWmw0iUOD4mRih0MhQ9GhDR2jcXZ3k+4GL4lj/DdGKCS0g7akHJSRWyhc/OfxEqidV7omkLar92Otz5biwM/SeJytyiwFQMT08mzDq7RRrk3RitM5QDJw0AtekXl4AS0XzFVqjnhhdhJ7gTSWp42JXa53Xsl333CYGAKa6XbPsFvDWYUfCPhfylfi5DWws0CFra+S8emDeVmSDHZ3Aq+xPweISs7myF4BiQP1W5tPS0gueYLN7UOd1fFVKPmHw5MN4ifDl191kwWnQtR/Yig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In3HGj64CPzrkpvBGYGeI0iZIrZ3qGCaOe5XXg/8wKc=;
 b=CMPx84UI0aN9lx9ftCtadWjwwdQ0vwh1ddgLVjl4tJS450ce9xivBDVQTXVcF4JxvWkVJEf+aN+Nux8e5EeGobMf4Tlha9IHUtjvpKxTpUkzyFLW7ikQLyHNsygnw3/DvDVJ5nGgzJ22VMvXisJSxJnk/qHeSpGNnLk0wnRon30=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Thu, 23 Dec
 2021 14:56:46 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 14:56:45 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
        <lee.jones@linaro.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <geert@linux-m68k.org>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: Re: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Thread-Topic: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Thread-Index: AQHX8ylGa0v8JYrVdUWVLgWvsdOtaKw2yceAgAlrFYA=
Date:   Thu, 23 Dec 2021 14:56:45 +0000
Message-ID: <05d6a273-19f6-2147-75ba-1fff726a0f70@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-18-conor.dooley@microchip.com>
 <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
In-Reply-To: <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cf516ad-21df-4561-80a1-08d9c6247091
x-ms-traffictypediagnostic: MW3PR11MB4571:EE_
x-microsoft-antispam-prvs: <MW3PR11MB45717350E07925E2EF8D34C3987E9@MW3PR11MB4571.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F8hltEhFn6QG03iy3LFukzaMYqOhO0Mv1aE7zNpc8HsX+taxhCH0Yc015rWs/Uyu3VRmhPleoEC87+HY3CZUobNb2JzLmqOuPy4Md7SrrLtuFPRZXYBlAZ27Z5dwrOetgMkzKIrn/LeYZv9nIMZqaWHsmkZu6Xt4AgrZkdBOSyXY2n6lsB+baDzhJ4Fl8QaJ1W3sff3HbxIh7ysPSSYVv+zThFzId2XEbNg7n1QNf5dspDYkVUI02+R647QYJVXJe7recZYhpBBmg6wEFzDo2KHUsHPp54pUjPGFwK+yg3/gpDNU7clT9+RY0jcs5GMD9cDf0M3MgR+UhDvfcT9RBHcm391VjEYXjgV7sTQdO5jLXTfwbV9uBWLWEIi1U2sMvk4Q2NTxjvvRQM7/Yzj5uyUfcUvl0gCKhPS958e7kp8FsdiCrGvE4tyNM1Ztu7xpcIk/r5Egrtb/83TqdK/AQuGWWtPsVkpbsdfrBJ/Dqbh2nrNWf1Et5FO8/6Zhi0/irX5tOGOLSJOUiZYfCeyMFPRQDH8C8Swn/WAfASkCbq9MjQ4CdWHwGqT8LTzgK3YKbIJ5DUdwxhi5gdhzbkWdExmW2hLIWqRc+JFQUFNJ9vbqswrnc9CAaySCD6luN7N8g4t0qitOucZavbT/uHNZypnWjK9oX+1dAeNOLFqKrTF/Iyq+nAv8orzlapI0mFmn1ebj7NTlcHhm5g32/zRCgkcGiXA4Pk8MedK4AGw4Kj2HjLA7mPEfvEEMhkVbD3Dz71pn0Sp6b2/gEuIaVW4taS85LVI0r4HYBHZ8cQLMm20=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(921005)(86362001)(15650500001)(31686004)(6506007)(36756003)(38070700005)(53546011)(5660300002)(6486002)(122000001)(186003)(71200400001)(7416002)(83380400001)(31696002)(54906003)(4326008)(66556008)(6512007)(64756008)(76116006)(316002)(8936002)(508600001)(26005)(66446008)(38100700002)(66946007)(8676002)(2906002)(66476007)(110136005)(91956017)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dldHVDEvVUhoN29hc1A3N3NCUkYzcFE4WmJrbzNENzhaa1c3TUV2LzA0bWNx?=
 =?utf-8?B?ZHJSeUN4SUJsTVYwZC81R21sbUczWDdVNXZPWExGQ2xZWFVad1dYZDNTZ2lo?=
 =?utf-8?B?Z0YwVVR6KzFqU0tucmgxR0J3YkVhS2pxZE43RFV5bDBvcHVpQVBKOUdzRlpi?=
 =?utf-8?B?cWRwYlhlck1ZSkJld0V4ak5Gb3V3dGtyNmNlNmFIekRISlpLOXBkWlVtUTBi?=
 =?utf-8?B?SytPdWdkL0l4SVo2clFZMEJYczJmU24vOFRRUnBnNndPczlkeXE4b2UwUWRQ?=
 =?utf-8?B?czd0NlFuVjQ1dk5yY2p4bWNwdDhxSTdDcmxoQnlIRFozYlQ0eEtrMktlZFQ2?=
 =?utf-8?B?MUVQb1owVjlaeFI0N0pERWdqWnhaWUNqYVV4MFQzYmtWMWcxUG9rdXpBK3pq?=
 =?utf-8?B?YTMvYzNXa3dtNTY0SVpaSEp3NEgrSXlBOUFyV3pJY3E1YzNqdWo0bTRycXAy?=
 =?utf-8?B?YjMxd0kxeGtYTG9EMzgzdEhZWityL3pMMWxYTGpRa2tBS25rV09NZSthNTRx?=
 =?utf-8?B?alFqNE5pVjVRWWFmQXpCc1gxZE83enRORE1xaVZ2MEJ0bUd5RkdZYVU5MjhD?=
 =?utf-8?B?Z1U0UjlMWGFkZ0t4Zm5yZ1hRUlhPUlg1dmwvdGtHOVU2ZXB5dTZ0TkRwaGM1?=
 =?utf-8?B?L2h1dVc1MVgzMEN4TjROcDV6a1U5SjB3Yno2VmJJWVhrMHU5MzduZmhXd0xO?=
 =?utf-8?B?L2NGOTZoZ3J2aHFJRk5XTUN4enQrZWdYWkNWMk1FaFZwMFVuY3Y4NGNFQUJv?=
 =?utf-8?B?N2NuQzJxMWtlZDNLWW1vUTR4bTBHN1Z4ajhuRlpSTitsamZCSndON3k1ZFYy?=
 =?utf-8?B?S24xRFpmZXg3WkdjcG14eFBSS0p2aFlnNGlWSUlHV2ZSOUcwL3lSNlJST2NQ?=
 =?utf-8?B?L1gvRmp6T0x4SGpvamtFQXhvZ1pwQXJUK2FVSUlWNUc4T2ZtbTRUQXNnVExD?=
 =?utf-8?B?bnp1SkFZNmRKdUEyY3o3ZklOZCs0MU9lN2pWbEdHSGRLc2pWQ0J5U0x0VFFp?=
 =?utf-8?B?bDF2djJ1TlZ6RFN5NGlJay84OUxEL2RkOW1WdkN0K1hmODBBbEY4cXUxajhS?=
 =?utf-8?B?elEwOUEwaXc1c2JLMFVTd1FLYUxZQUlYZElpMzU1RHU4clR0Znp3TkFmT1RE?=
 =?utf-8?B?ZEl1RGw5ZHZGb04rZWplWVNMTUh0bnArdDFORFNNUVBhVUJ5akJ5ZkxJMjdn?=
 =?utf-8?B?eWpkZmVncVprcnYwUnQ3NUlla3I2ZDlnV2FmRVBjdnRWdWROOW4xK2kvdG54?=
 =?utf-8?B?a21LajBXS25mcURrcm9YT2tCTmttUlljN1p4YWFSWlJXQXBadUVYM0I1c1VG?=
 =?utf-8?B?MW03K0lJMHk4RVhYWE4reDZ3YjBlOEtjTGVpTnE1TmJBTW93TzJOM2JEbU9D?=
 =?utf-8?B?NHlCWFY2RmsvWnlJQWllRHV5TWdjdlYxWFRNYkxIc0VDZmFONm9Ha2tDNHhG?=
 =?utf-8?B?MEI3azNOVzUxQm1ZNTJRT2ZtYkM0L3dnL1BMV0VZdExybnRwV1BabS9pMWhF?=
 =?utf-8?B?U1gvMHRxT1lUWTV1Tnl0TU84L0RZQWFBM0FuUDl3MGprRlFuQXFjSXdFQ2Zu?=
 =?utf-8?B?M01WK1JhdHRVTmtjSmdlNDlOQ1dKOXFtenVYeHBEbWJtM3NlQjI1N21kS1hi?=
 =?utf-8?B?MnlIdGd4NTVlakxEV3plbE5DcXZTY3VqWUk2NDJRL3M5TmNJSmZEdDBwTDEw?=
 =?utf-8?B?Z0IxQzFJWGZSOHR4aktWS1FKNlUydTNGMU1GcmdzVW5tR0ZRRHNId256RlRa?=
 =?utf-8?B?QTI0VjB6V2ZKV01rY254eFFoODNnbUxuYlFuZXN0eE1ORCtwTE1HbHBFSUJ3?=
 =?utf-8?B?NEoyYlEvK3UvL0xvZnNXZWU4VTFsc0UwblFSWnozV3loV2FjdXVhV1RPTGM3?=
 =?utf-8?B?SjAwVUszWWwxY1JiVWVyc0l3R1k5a1NpbzRVZzI4NkE1R3h5QmlacllBMmJW?=
 =?utf-8?B?SEhQN0psaU1nNStodjhyZ3hTOGQvd3BOb1krVm50Rk0xM0tVbWV3Z3N1eUNl?=
 =?utf-8?B?Tjd3UmdST1dMc3QvL2U3OEw3WE4zaFNwT0JUOUVxanMvSjVtTnNrdnd5UE9W?=
 =?utf-8?B?d0liWmpWdlNDYVR1anRiUU1sbUhHWDJGcWdRVk1xZTBvTURITVRuK0NkSkFj?=
 =?utf-8?B?d3BiNnZzMVBTd3RKMjZqNGU1TjFZVi9jNUJJbUFBV09HZThzek5JUWpaOS9w?=
 =?utf-8?B?Y1lpOHRWeVZUMDNHMXRyQkJKV1VsYnpNK21MdWduaUg3b2xPb0RjTGxhZG5y?=
 =?utf-8?B?UmJEbE8yNlNXRDFOM3NoeExhaC9RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DCDEE4DEF46AF4D89C8096190384E36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf516ad-21df-4561-80a1-08d9c6247091
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 14:56:45.5748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgLmJHD33WNm3V6skrfJYqCHzp8TfWwbck4WlfCpekE4Q8KbvfuG8YptptExXhiuyI2Vrt4aiHdC6CSVarO85LjkfyGUXuJx03xa3Oha2cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTcvMTIvMjAyMSAxNTowOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxNy8xMi8yMDIxIDEwOjMzLCBj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gVXBkYXRlIHRoZSBSSVNDLVYvTWlj
cm9jaGlwIGVudHJ5IGJ5IGFkZGluZyB0aGUgbWljcm9jaGlwIGR0cw0KPj4gZGlyZWN0b3J5IGFu
ZCBteXNlbGYgYXMgbWFpbnRhaW5lcg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xl
eSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgTUFJTlRBSU5FUlMg
fCAyICsrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPj4gaW5kZXggN2EyMzQ1Y2U4NTIx
Li4zYjFkNmJlN2JkNTYgMTAwNjQ0DQo+PiAtLS0gYS9NQUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJ
TlRBSU5FUlMNCj4+IEBAIC0xNjM0OCw4ICsxNjM0OCwxMCBAQCBLOiAgIHJpc2N2DQo+Pg0KPj4g
ICBSSVNDLVYvTUlDUk9DSElQIFBPTEFSRklSRSBTT0MgU1VQUE9SVA0KPj4gICBNOiAgIExld2lz
IEhhbmx5IDxsZXdpcy5oYW5seUBtaWNyb2NoaXAuY29tPg0KPj4gK006ICAgQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+ICAgTDogICBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnDQo+PiAgIFM6ICAgU3VwcG9ydGVkDQo+PiArRjogICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL21pY3JvY2hpcC8NCj4+ICAgRjogICBkcml2ZXJzL21haWxib3gvbWFpbGJveC1t
cGZzLmMNCj4+ICAgRjogICBkcml2ZXJzL3NvYy9taWNyb2NoaXAvDQo+PiAgIEY6ICAgaW5jbHVk
ZS9zb2MvbWljcm9jaGlwL21wZnMuaA0KPj4NCj4gDQo+IEdvb2QgdG8gaGF2ZSB0aGUgRFRTIGNv
dmVyZWQsIHNvIEZXSVc6DQo+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBZb3Ugc3RpbGwgc2hvdWxkIGdldCBM
ZXdpcycgYWNrICh1bmxlc3MgaGUgbWVyZ2VzIGl0KQ0KQXllLCBpdCdsbCBiZSBhbiBhY2suIFdl
IGRvbid0IGN1cnJlbnRseSBoYXZlIGEgdHJlZSAmIHdvdWxkIHJhdGhlciBkbyANCnRoaXMgdmlh
IHJpc2MtdiB0aGFuIHRoZSBhdDkxL3NhbSBhcm0gc29jIHRyZWUuDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPiANCg0K
