Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB294A71D4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 14:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344427AbiBBNqn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 08:46:43 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:61407 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344406AbiBBNql (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Feb 2022 08:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643809601; x=1675345601;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2FXtXxYBfbW9jBV2WPIX6CmGrPn+xktOOryWjujB9Gg=;
  b=08rzc5utW86doI9ZJGTiUOK8F0vI1gd45QdOaTU4t5qHb2Sbop+RUp1Y
   InEOfEpdPahyXwD1dPNErb/s6rTsD20w5M5Wq1/45UIHxOtoOO+O/4nP/
   lKjtFoC+crs58tAlDU5lh2yLybb0ijuq+SZelkI1N/F0ZH7N2nxwsYxUa
   EeqZigwIsjnCx45RbWD4trxzjT6h2C72S7wK9X67HWr9W70RN86m396Gj
   P1fZK55bRQnZyWnVmvzFvmTzTpF6wYusgaqBmvg/b8qaUrFn8BcbnVGSc
   YdKXXGwHh/prqYm9SLFRJuz+vCqvptydmbxYeFIV3HrRUyiLRnhZ5yWz0
   w==;
IronPort-SDR: flnyY7X6hsEHYtn0ADc7xCl647Anh9sODScvDLFoEUqRUne9Yp/UxkXftRcJxl0ZcLrrmgajxK
 /pwu/BFz2mpAeebKZtqtF4LzDxxkM69k2u6Xuc2o9OnaBFK30iRHGHKF4dhVdZm1+nQgV9oJrN
 NMphreEFnVUZzZN4KiUnjUApmBl8ntdIZGmUPqYIedyo47vxR7SuUSLCA0SY1p5vsMMq1qhgFH
 EIADPk84xRm1X7fa5/usaA+0w6H0zr9zXZADK/lVYwSF5/tG8l7pyDF66WZ0pKjC2FP5NGkfgk
 GE9f6IrfokpvS/6hMoa+70Rr
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="152235024"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2022 06:46:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 2 Feb 2022 06:46:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 2 Feb 2022 06:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPvZ0yWqWwomaXNVB88rnxs0qG5QDVbStNZ7AITCoAEBI1ZITdp9qidZnxapJHK2ueygxpTapJ9RiurS6DtBbxZ8qp4mschvocVV1Rv4Fb1yL96D3sIdf6VLd4Jk7+b7UALNhMUgRf6/dm4GL+DUd+adgJhRyrM+6ENZrongXPaVLl42iM+656crbz7B14+bWG490SymxPutbD+YNkcEmaEDQQgRCHG3nTo/CJIZHBEC7WiQCpT//AKNT3dx3NAYBwcb0v8XiKJL1DhoF4HPPvmcuaBytB8B/3QUu72g8zCe+0GmDQQZ8nm6QCfHFBb5eYrNWI8OCeCkAI+hTjYenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FXtXxYBfbW9jBV2WPIX6CmGrPn+xktOOryWjujB9Gg=;
 b=aBpEs2Jk3mHnaYyS+NU3ZggiFJahG8dX3fG80HX9sefMyf6KiE9dvUpB43NemSfTDn/Qovyclc9BgjxnRXg0UC6rbt30BnhJs5VZ4j96HH70MUs2GLwiNidIKZvgiEOhBsl2xzFQkwdsNPDT7Ruj6Y9vQEt/C66+0RzxCQ87e8/yrACX6kwLOzLHgtH53VJVoNet64qYXdDGcz7QyJXIrxZuhS3HFSBVwMBiPtwxhahyzZuyACPSkvv0wELes0z0jDFTqH5Yzbc0qXk/5taNxLJ3RAjhndQLEjbuVp2tEc4fJmDAvSQXCi+i8Ldc4uOgxrjhrmyIMB8tWmURcNqv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FXtXxYBfbW9jBV2WPIX6CmGrPn+xktOOryWjujB9Gg=;
 b=mtiv8QSQxB1sj78POy44t4Z7ZkPX1l8iXOrvYlQb5jSpuC9oJERavKtzzKmnGte3qv0UB7ZVxRkXQTXena6pUArSqBu664Ptfp008HmdLq+VHY3M8tzCByqDonl0oeXlRaQrMtKZEXJVmmi7MMuWBM5kKD5vbDD8JANjyc1Oc5c=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:46:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d174:473e:7192:543e]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::d174:473e:7192:543e%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:46:34 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <u.kleine-koenig@pengutronix.de>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <aou@eecs.berkeley.edu>,
        <atishp@rivosinc.com>, <bin.meng@windriver.com>, <brgl@bgdev.pl>,
        <Daire.McNamara@microchip.com>, <devicetree@vger.kernel.org>,
        <heiko@sntech.de>, <Ivan.Griffin@microchip.com>,
        <jassisinghbrar@gmail.com>, <krzysztof.kozlowski@canonical.com>,
        <lee.jones@linaro.org>, <Lewis.Hanly@microchip.com>,
        <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
        <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Thread-Topic: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Thread-Index: AQHYFpguO8Zyz/xVrEiGcM08rif7Sqx+VckAgAHf0QCAAA7TAIAABcsA
Date:   Wed, 2 Feb 2022 13:46:34 +0000
Message-ID: <3862e358-901c-e848-71af-01eceed26f74@microchip.com>
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
 <20220202123542.3721512-1-conor.dooley@microchip.com>
 <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
In-Reply-To: <CAMuHMdWrmuY7pwY8U0t9LumEvUTBEA06uV7hNyKFAPMQtE98_A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d65c87a4-90e0-4428-8234-08d9e6526d61
x-ms-traffictypediagnostic: MN2PR11MB4741:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4741C742FE4ABED4175096B298279@MN2PR11MB4741.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rkas1olniS8bmAODlYxXGkTnIkjBPOVK7NvpxYTyh2OXF1gmIFhTf6A4avKNsQjbYvj8UVR5XfuTP0fqtIdJMaYIxpfmSwaoCGHjC9GPOHrPT7CC5KiAEt5kDuWwt3wKBhwc5VLMpGrHuyAmfz9xafLDm0VX1dILjhBa4dRUE0RnUnxgQM4KyjjdSMhdSXsZR93/nFg0XIkEIHYgDmTFNOJU0xE7lSV1yGjvOIZNFq5026REYF0lLAINsPa0/ajaojsnxwP2cMQXUCj2MBLjmQBQ0Oqls38vJ1N1o3RcRNWPdsTaeJWMMtEokbzK7XQmi+NKRIZ+oLcyL4WmtcFB/4rYya9aNb90q3OBbAeVwJMd+podqsI9N+oh0Cu56Pak/i7oSeeS1A8+0XuMJUTUNL8jPSPu4dLhKSTRowp2Bzd9XzGgRhQDTaWR7mGsiLP9qIr35rH/ZHY+pEZNHBbH8Us3HPPhobmtL7ibRQHL/PWYfh7oWN5DA4BzF3bYebfJki8ZBfBYYC8/7zTCckAUil0eUH7dk/J9UgFTq1sg2CPFzbYiIuYOZsx29P64oa7M8gJuOFHVvL+015JliMgFdU12NOE6zmwZUG5da0oi77NYaOQVuXrmrGw0x0nE/J0lvE53+fip6HAHsfpVuX8NQCthU0gn1nZLYRXZ0zM0ykgQeZ09XQJ7H9Aq4QduITGkBnJ99PokBnEGvyjNOR1zRld6gbpcWU4X4Fsag9SINesThFpZnkDevpiNZYMgzlO4eGm1pc8uUB+D33HEHMhhaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66574015)(54906003)(6916009)(83380400001)(5660300002)(7416002)(316002)(76116006)(508600001)(66946007)(6506007)(71200400001)(31686004)(6486002)(26005)(186003)(4326008)(8676002)(64756008)(66556008)(66476007)(66446008)(6512007)(2906002)(53546011)(8936002)(2616005)(38070700005)(31696002)(91956017)(122000001)(86362001)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFhrWlB1dTN6NkhEUS9vRVNzV1BtTkR6MHFQVG8wa2tqblJudytkeS9tRURO?=
 =?utf-8?B?RC9MVUdpWFVCYyt0dkgxNWd2NGlISkZ6eUdtbVVIWUd3cld2RjNaeXkxQ1NI?=
 =?utf-8?B?VEtEYUxZVEhTQ1hSaFBBWHJ6aG44L0oxVGF3YkZYb3RGdUY4bGtldUI2TUlD?=
 =?utf-8?B?L1lTSWswc2JyMm9zOFU0MmJ2bU1QNFdMVkl1RVBuZFh2M2ZqNk51bWxWOGM5?=
 =?utf-8?B?ZDZWTWdmVmhOd1NqcGpGNVdibExwTGZkNTdtQ1FROXBzcy93b05lUzM4SVdK?=
 =?utf-8?B?elRRTmQ1YlJtZTZKbGVzVmduK0tWWkFYOFFuSG5FNjdCalFSb1Q1NzdiTmt6?=
 =?utf-8?B?cDEvY0krNGRwbFduYzhlMXNBTFJ0QlNnRkFudS9CT0RxWExnR3F4REx0Z3h3?=
 =?utf-8?B?SDFuczUvMTNjU21GRHJZMkNqa3h3cDRPYnBrWXAxNzNHdXFKU0p1VjlleGxa?=
 =?utf-8?B?cDJkQ1A3aVpua3RXeE5KRDFXcHErWGE0b292TS9wd3lubUtVN2pHK21adldH?=
 =?utf-8?B?K3lBektZUzJSbjlVY1Y1RndQYlgrUENqdy93ZkJlMEpSNDJHcGdONUVqZENB?=
 =?utf-8?B?NWhHTDd0MTNWWmFxaUc1cFkwN2ZoQnFpWUh3T0p1QytxZDFtc2Z1VVQrT0JN?=
 =?utf-8?B?ZlYwcVRuQWRjbVRlRDRrdFVISm5VSjFSWkJJSDRGeURrWHFMSkVXZWZoTWRv?=
 =?utf-8?B?VTJxdkhudkptNW9DTHF5UFBtOUZWYXIvVGVDa0xCVVZSUDZNVmtQeHppM3ZV?=
 =?utf-8?B?Q3BGWmwwR2NqN2xLSGNLODBsS3ZtRHJVb0duSWhTVExVR2hBY0R4UElJb2xx?=
 =?utf-8?B?dnRVSGkzTXY4eVF1dTJnRHFBMkQvMHdKcytjRE5mZlFneU84TTBJVGRDRzZa?=
 =?utf-8?B?TUZRR1FVR2xGdStwTlg3eG1ET0loT1kxWGRrK0RUTTl2bzBGRzZ6Zm9ORUFH?=
 =?utf-8?B?MmcycWd6U0hvUnQ4SmFvTUFHbkNJaGRFTDJUNGZZUlluWXVVVUU0TDBUMGJK?=
 =?utf-8?B?dTNaQnJobG02VldGU212amc0am9uNVNmZUpkL2NQZlRyMWpxME5pc29IaXdQ?=
 =?utf-8?B?eVlRSlpnVVEveTVzd29ZblNiVFNBTkVOaXZUNzNrY3RsTnlKU25FaXlyU2Iy?=
 =?utf-8?B?cFYzY1VPOWhaYUd4QTBVc3EvR3F3MDhMZ3N6TWhvMDk1SVg2dndhaGkwRlpy?=
 =?utf-8?B?U0l1MXJpUVZtVWtHeUxEMDc0VkZyRmVmSVZselZ6Ri9sNndaRERTbXlyK2x6?=
 =?utf-8?B?MzJvN0NJRjR0aUlZeGJqOFVudGN5VlJwQXNhK0dvRDFUa0NzSmdXc3lwbU1k?=
 =?utf-8?B?aUpqVmFNSGEzQnYrK3N2dzFudUdqZWl6VFN4Ui9oVGwyMUN1RmJ5NTEyNllG?=
 =?utf-8?B?dVlpc2R5K2haNEZhcG5YeGRIbTd3NUdzRDRLS21tZ3ptdHpUTmt4NTJDY0Qy?=
 =?utf-8?B?YmpBcW9hUWw2Y0R4ZkN1TVl0MkV1RTdrWnRRNkl2WExlYkNISTM4Vk1wM2dz?=
 =?utf-8?B?N3F6OXViQUpwMHFaRlplc0lIQnRocGRSYmNNUlpoeGU2SXVId0ZibmM5NjU3?=
 =?utf-8?B?NndQOFcvL3pwdndUWGM5MWp2RGtvcFRXVnZpTzdhWEkzdHhGNlJDSVJBWlBR?=
 =?utf-8?B?TjZGbzF4b0dpdTNML2hRQ3Ewbm9vWVNaQ0prQ3l2T2dkWmdaQzNxdnZlZmFK?=
 =?utf-8?B?MTBMUm5pVGs3VXVCMzhkend6Z2p5TVlWZXdKZSs4em92MDBQek8rNXR6UUxM?=
 =?utf-8?B?bnk5VVF0TFRoKzNpekttcXdTdVdmMStJTDRKRjJYeC9tMTRtaTJMTTJoakpi?=
 =?utf-8?B?RWhRNDMvcEFiVWlUaG9QeExQMTlOMVUvNzZCc0xNRm5vbG9zZFd1TFU1aVIr?=
 =?utf-8?B?T2k1UWgwSzkzdGxDSVFMZjM3T2pReU9VZWxTLzI4N0xBOFprVzB0eGowdE1y?=
 =?utf-8?B?RHVyQ010bkRPaWVjY21iNG95MG9nWlZCNjFxazhTem43Myt0WU8wem9La2tI?=
 =?utf-8?B?Z1RoZjRTY1doRm9EOHVnbXVhemRINzBoWGEyRXRmNDRNU0twU3pMemRsT0ZE?=
 =?utf-8?B?Z0d5a0R2L1hiajFkK2JyNWZES2hRTnppU0c4Zktmb2l1VzFwdkYwa21sQjhL?=
 =?utf-8?B?QzBHaUdkaDBzQUpYc2ozNVJJelREaEk1VFlnYUMxVFJIa1BKRkU1L3k2OE5j?=
 =?utf-8?B?c21qVXdaWnNOQytTd2VaMjBvNG5LMjEwc1lpZ3QzRG00YzlBekZDS1FTTC9r?=
 =?utf-8?B?b0p4amMwMWx0Ym95TmQrNlFER1NRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80C95DB4A8464544BC6B79BF1FD268C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65c87a4-90e0-4428-8234-08d9e6526d61
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 13:46:34.5512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0Xu2BD879M3SxDYheYfUJhxr2eQ5P6kMKAu7ffOJCk5LM32HWE5Pqf+ZdXUJjzsFsgJfA7XnS9dmamQKP2TWatkNTf3G4bb0oIn7kqgJVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDIvMDIvMjAyMiAxMzoyOCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gV2Vk
LCBGZWIgMiwgMjAyMiBhdCAxOjMzIFBNIDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6DQo+Pj4gT24gMDEvMDIvMjAyMiAwNzo1OCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+
Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+PiBPbiBNb24sIEphbiAz
MSwgMjAyMiBhdCAxMTo0NzoyMUFNICswMDAwLCBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3
cm90ZToNCj4+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4NCj4+Pj4NCj4+Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgTWljcm9jaGlw
IGZwZ2EgZmFicmljIGJhc2VkICJjb3JlIiBQV00NCj4+Pj4gY29udHJvbGxlci4NCj4+Pj4NCj4+
Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+Pj4+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
DQo+Pj4+IC0tLQ0KPj4+PiAuLi4vYmluZGluZ3MvcHdtL21pY3JvY2hpcCxjb3JlcHdtLnlhbWwg
ICAgICAgfCA3NSArKysrKysrKysrKysrKysrKysrDQo+IA0KPj4+PiArICBtaWNyb2NoaXAsc3lu
Yy11cGRhdGU6DQo+Pj4+ICsgICAgZGVzY3JpcHRpb246IHwNCj4+Pj4gKyAgICAgIEluIHN5bmNo
cm9ub3VzIG1vZGUsIGFsbCBjaGFubmVscyBhcmUgdXBkYXRlZCBhdCB0aGUgYmVnaW5uaW5nIG9m
IHRoZSBQV00gcGVyaW9kLg0KPj4+PiArICAgICAgQXN5bmNocm9ub3VzIG1vZGUgaXMgcmVsZXZh
bnQgdG8gYXBwbGljYXRpb25zIHN1Y2ggYXMgTEVEIGNvbnRyb2wsIHdoZXJlDQo+Pj4+ICsgICAg
ICBzeW5jaHJvbm91cyB1cGRhdGVzIGFyZSBub3QgcmVxdWlyZWQuIEFzeW5jaHJvbm91cyBtb2Rl
IGxvd2VycyB0aGUgYXJlYSBzaXplLA0KPj4+PiArICAgICAgcmVkdWNpbmcgc2hhZG93IHJlZ2lz
dGVyIHJlcXVpcmVtZW50cy4gVGhpcyBjYW4gYmUgc2V0IGF0IHJ1biB0aW1lLCBwcm92aWRlZA0K
Pj4+PiArICAgICAgU0hBRE9XX1JFR19FTiBpcyBhc3NlcnRlZC4gU0hBRE9XX1JFR19FTiBpcyBz
ZXQgYnkgdGhlIEZQR0EgYml0c3RyZWFtIHByb2dyYW1tZWQNCj4+Pj4gKyAgICAgIHRvIHRoZSBk
ZXZpY2UuDQo+Pj4+ICsgICAgICBFYWNoIGJpdCBjb3JyZXNwb25kcyB0byBhIFBXTSBjaGFubmVs
ICYgcmVwcmVzZW50cyB3aGV0aGVyIHN5bmNocm9ub3VzIG1vZGUgaXMNCj4+Pj4gKyAgICAgIHBv
c3NpYmxlIGZvciB0aGUgUFdNIGNoYW5uZWwuDQo+Pj4+ICsNCj4+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MTYNCj4+Pj4gKyAgICBkZWZhdWx0OiAw
DQo+Pj4NCj4+PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LiBUaGlz
IGlzIGEgc29mdC1jb3JlIGFuZCB5b3UNCj4+PiBjYW4gc3ludGhlc2l6ZSBpdCBlaXRoZXIgd2l0
aCBvciB3aXRob3V0IHRoZSBhYmlsaXR5IHRvIGRvIHN5bmNocm9ub3VzDQo+Pj4gdXBkYXRlcyBv
ciBub3QsIHJpZ2h0PyBBbGwgMTYgY2hhbm5lbHMgc2hhcmUgdGhlIHNhbWUgcGVyaW9kIGxlbmd0
aCBhbmQNCj4+PiBpbiB0aGUgc2ltcGxlIGltcGxlbWVudGF0aW9uIGNoYW5naW5nIHRoZSBkdXR5
IGN5Y2xlIGlzIGRvbmUgYXQgb25jZQ0KPj4+IChtYXliZSBpbnRyb2R1Y2luZyBhIGdsaXRjaCkg
YW5kIGluIHRoZSBtb3JlIGV4cGVuc2l2ZSBpbXBsZW1lbnRhdGlvbg0KPj4+IHRoZXJlIGlzIGEg
cmVnaXN0ZXIgdG8gaW1wbGVtZW50IGJvdGggdmFyaWFudHM/DQo+Pg0KPj4gQ29ycmVjdC4gSWYg
dGhlIElQIGlzIGluc3RhbnRpYXRlZCB3aXRoIFNIQURPV19SRUdfRU54PTEsIGJvdGgNCj4+IHJl
Z2lzdGVycyB0aGF0IGNvbnRyb2wgdGhlIGR1dHkgY3ljbGUgZm9yIGNoYW5uZWwgeCBoYXZlIGEg
c2Vjb25kDQo+PiAic2hhZG93IHJlZyIgc3ludGhlc2lzZWQuIEF0IHJ1bnRpbWUgYSBiaXQgd2lk
ZSByZWdpc3RlciBleHBvc2VkIHRvDQo+PiBBUEIgY2FuIGJlIHVzZWQgdG8gdG9nZ2xlIG9uL29m
ZiBzeW5jaHJvbmlzZWQgbW9kZSBmb3IgYWxsIGNoYW5uZWxzDQo+PiBpdCBoYXMgYmVlbiBzeW50
aGVzaXNlZCBmb3IuDQo+Pg0KPj4gSSB3aWxsIHJld29yZCB0aGlzIGRlc2NyaXB0aW9uIHNpbmNl
IGl0IGlzIG5vdCBjbGVhci4NCj4gDQo+IFNob3VsZG4ndCBpdCB1c2UgYSBkaWZmZXJlbnQgY29t
cGF0aWJsZSB2YWx1ZSBpbnN0ZWFkPw0KPiBEaWZmZXJlbnRpYXRpb24gYnkgcHJvcGVydGllcyBp
cyBub3QgcmVjb21tZW5kZWQsIGFzIGl0J3MgZWFzeSB0bw0KPiBtaXNzIGEgZGlmZmVyZW5jZS4N
Cg0KRWl0aGVyIHlvdSBoYXZlIHNvbWV0aGluZyBpbiBtaW5kIHRoYXQgSSd2ZSBub3QgdGhvdWdo
dCBvZiwgb3IgSSd2ZSBkb25lIA0KYSBiYWQgam9iIG9mIGV4cGxhaW5pbmcgYWdhaW4uIFRoZSBi
dWZmZXIvInNoYWRvdyIgcmVnaXN0ZXJzIGFyZSANCnN5bnRoZXNpc2VkIG9uIGEgcGVyIGNoYW5u
ZWwgYmFzaXMsIHNvIGFueSBjb21iaW5hdGlvbiBvZiB0aGUgMTYgDQpjaGFubmVscyBtYXkgaGF2
ZSB0aGlzIGNhcGFiaWxpdHkuIFRoZSBzYW1lIGFwcGxpZXMgdG8gdGhlIERBQyBtb2RlLCBwZXIg
DQpjaGFubmVsIHRoZXJlIHRvby4NCg0KQ29ub3IuDQoNCg==
