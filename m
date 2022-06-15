Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154D754C392
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 10:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243045AbiFOIeR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 04:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241977AbiFOIeQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 04:34:16 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20CBF02;
        Wed, 15 Jun 2022 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655282055; x=1686818055;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=+Y8TkQ79/jIe7oaCJMN4LYYfwMO0kh+4OrytdRFejfE=;
  b=hgMM9mgSMflQcdhONQEyrFMPN2TKYVDOK61NgNKg1M3xdYqiz0PRAysS
   dNZsfOE22NuxaLY4yBsM1bDV73xteCwf+UKyvnA7mnd1Ecj5O+gpMkCJG
   Nuq6/0dICrBIjhOmbVL8gfL7grZrBC2+NJka/tprCXBQ0wtGSN5ojPi2p
   vvcuj++CGLD9F5Ak5tDi36Bs2CAmKkS/skNKsCRcKHAIZNkNzGcmJJXjI
   SPUUNsxkBt95vhQjWfDVKyABijMPgb6M772V20Tx36SQqNcZQKZc2eVWs
   8FIfLLJH0RX5TnSLlTyPSulTNCNq8lS7nNxnEStwRYPyLi6NAPcVxdelt
   w==;
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="178025988"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 01:34:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 01:34:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Jun 2022 01:34:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWZGXbLvyh/zrIJovskpFmuYfXtdr6PxOhlxLdRPzJcXHwOtVAJT87rxzzFtvCnq2Hh6RJZlB0UfaU8gThseSGfTKyxZS7EGEdTaUTf14PsuXFpx8heG4qAqhvXp30XP96ENS5zEv9A+gQGNGCJ4Wm0ANqs1ibTS6NORT2/Hrafl1b6WZoXQtMD9tLj/tAuFL9YMYWwBxihgnfjc1Ltqr/ttoSZWZEFm7A+eyh7CSFr7wuUl9g/Id0XUm7KFTG6WYUP8eGns5fvGNeYf2LUEaf3TJ/BwexHsgeYaNe7xrJh4bWbId4EVYigYqFWaeZoZgXIgSvHVMKuXu9AFSTA6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Y8TkQ79/jIe7oaCJMN4LYYfwMO0kh+4OrytdRFejfE=;
 b=a3PITtfKRrJzPDVojyVlH0eynL5mQWUph5CV/o/klVRK2sK5H2awtip+E23ffWw9aj+MdzsmMN1jS6l+OnlThA/h+bmsV++iiCIaAYXpXf9QKqdgI6hQbY1f4WKKO4fvirL3UKHRYkzwwWxMUcnX3kd9f5xu/wR+QntsKefaAV/6Bc7IGnm5/G1no3r3jlxgtdUJkI/qEpIyo4rF0BvZiDZQOywKQMyfQZBtn1oGm/ijkoqAM85GVbIYEa+CYJ0Jt347eCuk9EoshHz6akkk20kG7ddu5MjTomhsRUzmn5OabH0N9PaR/6tjcdnW1NTtO29PWIiYtdKTcnLJ9fAuUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y8TkQ79/jIe7oaCJMN4LYYfwMO0kh+4OrytdRFejfE=;
 b=B8dKeAvNGewqm7vCp0LrpkNB9q4ZA2WUlRuWbW9VsORt38l8yfJ67iKUHwIEKErx7QAtNZmW7N8TJYUaL7aS/L3xhBZHRvqDTKZ1TX/ngYwQSep/sJf+XSwJl+N8tMaVzKWMJJHxW0iUie0RrSEzsuoCx+BcmLDoJXB345G2SeE=
Received: from MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 by SN6PR11MB3150.namprd11.prod.outlook.com (2603:10b6:805:d1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 08:34:09 +0000
Received: from MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::ddf6:11cc:3391:d4e9]) by MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::ddf6:11cc:3391:d4e9%6]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 08:34:09 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <Conor.Dooley@microchip.com>, <peda@axentia.se>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Thread-Topic: Regression: at24 eeprom writing times out on sama5d3
Thread-Index: AQHYfA01c45T/mrWhU2n/5J6R8aiEq1IQRKAgAUy9QCAAAyngIABF+EAgABbgYCAAAklAIABMAwA
Date:   Wed, 15 Jun 2022 08:34:09 +0000
Message-ID: <0e7faa1d-a26e-d00a-9d66-a48a232d8bb6@microchip.com>
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <YqdQoJbsgwjQ9PYh@shikoro> <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
 <ebadf90a-066d-1cbe-b15a-3a99e3ab2bd5@microchip.com>
 <0dd2fd90-07c1-f693-1782-e68a7b2efbf2@microchip.com>
 <c26cb513-9cd3-6e87-9345-21d57e5a207d@microchip.com>
In-Reply-To: <c26cb513-9cd3-6e87-9345-21d57e5a207d@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abe5a9e8-0b2b-473b-afb1-08da4ea9d143
x-ms-traffictypediagnostic: SN6PR11MB3150:EE_
x-microsoft-antispam-prvs: <SN6PR11MB315055B446E47ABD4E622E24E7AD9@SN6PR11MB3150.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b63EZsy/JGhT4T8A3QEPjMutoY5F5kYklUL+nCAuu3SUlnL7qfzlrwyiu5RLZHaZqb1xkU1xvVzzM+gTcN9gfzSG2hNAj43TQKXtXRwK7pNnrz1pJyt2FI4fRjIEw7EdQYsLi58cgtZ9DYuXyqP0cVz2y7ADyYf/rZH7Mp4KqPd7dW4rCQD/whaHOzMiaj0pz4YKmrMo79nOZNAoRyMWlyunnq2PJBXjdLBqeiJrFiBqqT9U+iTRMUzBb8a+RKG72dcWJGdM/iv87qdnvnJ8ZFKLuK3+gP7p9u3kw5kOkHC03FwxuB6o0NkoczN3KNce73BbPO2FM0rE8HpWlexLw2GuWbZxhRE6pzh6Fm9ilZTKtLzNO4xAzkCBhvXFI4A2ChyGGSEDyVh9UrI4Upf/sJtMdi6QSdakJ3oIBQ6aGa/O6JARi5AsboC0Bu5MMA0+qtciAm8Kq+8TdWPMXlOzJ61K7ZWE4PEZFJF3qFtVBRU1MRfb0I/hTn4+3EfskGUg/h7zfiLBLkuSZYHrk5/X7j/GHelLjFMpJVPLy7rEV0Ge33bQ1sTcAzMEEYAnhhmO8gCWa5N4doa4NodPk0dSSJLGnF2PII3lnDg7eEJBQVEu7AnD3E6TvfcILX99yl0JkEXbftJCy3+XjL1/ptXOeL5yy6u+h6vzM+iaz3kdkRewMD12Oa1ntHTlyVHCySmTwSNVzSBe6HwSBqtY0S7pzt4yyakP9nZnXBn8owyRwLYwMIw+nEbL8rUTi+wCSLXisvluP6WnZID+2quPvvIAyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5936.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(8936002)(53546011)(316002)(91956017)(110136005)(8676002)(66556008)(66476007)(66946007)(71200400001)(66446008)(64756008)(5660300002)(31686004)(36756003)(508600001)(6506007)(2906002)(6486002)(122000001)(38100700002)(76116006)(38070700005)(86362001)(921005)(6512007)(2616005)(31696002)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N25Qd1pxemROY3lyT0greWppbDBLcTFCcStnNkpTUXl4ZmpoWWQ1dGxWSk9l?=
 =?utf-8?B?QWlNU2g4MEZDQ09yYzY2NHNvS1oyZ1dxQzhaK2VmMjlxWmVuN2VPVzE5QXNi?=
 =?utf-8?B?R2lDWWtrdXRwQXBZZmVWMkx2QWRoNUVHT3BENjBXRDBEcTBENXZSTi9SSDRs?=
 =?utf-8?B?LzZOakNla2Y5WENJLzZiTnd1N1pXRklBRkxRcFBnV3F1QWpYZ0VUcmtRSWFp?=
 =?utf-8?B?YnF4ZlF2TjM3NXZLc2hhMmgrMGJaV2tKWm81M0EvY0JjS3dRenkrWHFFYmFu?=
 =?utf-8?B?L25MU3ZkRjVBenVXVTEvSDRhZWNxVXdXYzZCc0FneGhtZ1VGT3Q2K1FmcXFa?=
 =?utf-8?B?dmVVVzBHaGFiUkZkL3cvTndiY3Naa2NBZ2FHb1k1Q2h3SlJCcmthd0J1RFV2?=
 =?utf-8?B?L2hwWUlDVUJ5aEhLRkpJMmxKWExqRFBMU05TcEFobXZDdi9IekFGbXRxZHU5?=
 =?utf-8?B?V1hjNVh6WFQwNW9BNTRvK2FXbkVpMDgzcnR1YWJpV0lCa0hZcnZqVm0vWXhN?=
 =?utf-8?B?ZjZKMGVtU3F0bXpwN256dlZOaitQWC9hZDEzTERneXVvUVJ4K05LZU9rUjZ3?=
 =?utf-8?B?L2UvVjBxV3pSSUx4NFFTZktoeXhIUEt2UDF1MVJUamFHYThYTTluRDh2MDZD?=
 =?utf-8?B?alMzWGY1Sm9yT2o1MlJPTE1CMDRHRElkNERWell4WGpFMko5ZXROTG85c0Rl?=
 =?utf-8?B?VjhBTUp5eElST2cxLzZLTTNuMVJ4M0VIeW9FSXlsdkZUSGlIVzhLZ3V0MVZQ?=
 =?utf-8?B?NWwrZ0pLb3FVbHFmdWtIUXkzakV4MVdGeThyVkpLbkZBWXBYeDN4Sm8rcS9N?=
 =?utf-8?B?QTJ3SEM3dGNEZUZ0UFhnZjdkWitSVkhscUVJb3ZOaTlRVStSMnMyenUzVUoz?=
 =?utf-8?B?dVBSSDNNNUNJMkNMemg4bTdLNDhjK0hvZXdReFhxMERuUjZxZzc1NGpudnpz?=
 =?utf-8?B?L216OWVZbXVhVnR4cnVOOTBkdHpYV1dQOFg3djZYTU9QRzBpMTZoWkZUVk9n?=
 =?utf-8?B?UTFDZjk0OElIY2RicUxlSEhMUkVydHNXUGlZU24wbmYwNUFQK1czQmhvM3VC?=
 =?utf-8?B?NGYvZ3hrS1BMYTRPUThzcDhTalNuSjg3dHl6Q1BVWEwrNy91ZjlzZFpQcmI1?=
 =?utf-8?B?RWpPdDFNUG9mSkRwTmdobk02VFFmTXROUFNoYkNUNnpKcjBxc1VWK2Vlb3Jv?=
 =?utf-8?B?TDcvcXJzRC84Mjg2VlpBODZsUlhjbXZmelo3bmRjSHordGhZN25Zck5XZlVG?=
 =?utf-8?B?SjVoQnlmSG0wR2MzaEs1V29rdkx5d3NpYnR5VWo2bkxpNUhENkd6dXl0SFIw?=
 =?utf-8?B?RzdsM2dLSXRMMVdqdk5rdWtBVkY1djBIblF4VXVXNmtyMXNUZ2dGUDFTZnhl?=
 =?utf-8?B?RFc3MnlUZmh3WHhneFgrVEt5L3U1TkFBQTlUczNuQTYxQjBpSjhLa1NWVGt6?=
 =?utf-8?B?cnNKQklRNGZjYUVYaWlVSTF5dzRQVnpLYW9BQm1DQkhQcjd3STVUSFhTN2hQ?=
 =?utf-8?B?ZG96enB6MTE1aFVwQ3JHMkpCTnhtcFQxeE91WXZpaHVtcmY3OUM1cHdvQVZ0?=
 =?utf-8?B?L0hrR2FYQ2dIalB0dXJlMGx3RDhhTWNYVkh4VjdNZEcvNU12NXJpWVNSdW93?=
 =?utf-8?B?d00zY1lUeGVTZklzL1JqYUJ6U3J6MkVrSlNtanorQ2tZZzRCaFQvNHM1WFMx?=
 =?utf-8?B?em90ejBYSG11U1p6bHpJQmFHUEVyQkliamx5R2hNMWZuQk5YQmFQb2g0VE5a?=
 =?utf-8?B?NEpFUVQxQUNTTVYybVd1REErRWh0M20vc0FoMmh2SGhKblE2Q0Nwb0VvVkNV?=
 =?utf-8?B?WUxsVm9WYWhhcnkzaG9LWS94T2JraTgrRW1EWGRMV2ozWisrRmVXaWxEaktp?=
 =?utf-8?B?YzNJNmJkVkZUTzltSFRKZGJGWC9IYmtJTit5QXkybUo0WFJmV1Rxbzl5bkNO?=
 =?utf-8?B?ZkpEdWt0WUdZK2RONkhzZ2RNclpIU0FtVHRYQkJJU2tFK3hTdkg0V1Y3alVo?=
 =?utf-8?B?eHRmZzRpYjdiYmVJalluRjJDUDBQenU3MWNualJUak1oZzhJdmZic2tBWXVH?=
 =?utf-8?B?Wno4dnkwU0J1M0llMUdHdHR4ZHYzR2FHWUJrZVl2QTl4aTd3L2RlRmJkUTZn?=
 =?utf-8?B?S1laeVNhSjl0bGJBaXlQUWljT1g0YUJVUE56c0FTOEdjTTBaR1d3SENvRXFl?=
 =?utf-8?B?V0dqYTJPeFFGeTc3QUV6MXVQU21KalVBZ0RnOVZxRmtCQUZUWnB2cTJvRG5y?=
 =?utf-8?B?c3VwQVZaZmE4STVPQkV2REVnemdsb2NSTlB4QUFKVmpmYnV0UnVjbkszNU5x?=
 =?utf-8?B?b3ZYb2JoSWswUUd5NWpRVXFsNG93OWFvemh6QWd5MHc5dWJ3SFh6ZU5BSWw1?=
 =?utf-8?Q?Q5sErMnCYQ+jtVOE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A1A4B46C5D52429DDB8702A2167276@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5936.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe5a9e8-0b2b-473b-afb1-08da4ea9d143
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 08:34:09.3503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFd3B1NHOXDGzuowGRg4LHukLSjNhK/R7pmbRDf2poFod7YZ3fTc8uYC7kUNeiuAJxDpgyGLDj8ZMkhZb07JEvJkLeJhT9QlsWipoBzhi0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3150
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTQuMDYuMjAyMiAxNzoyNSwgQ29ub3IgRG9vbGV5IC0gTTUyNjkxIHdyb3RlOg0KPiBPbiAx
NC8wNi8yMDIyIDE0OjUzLCBDb2RyaW4uQ2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tIHdyb3RlOg0K
Pj4gT24gMTQuMDYuMjAyMiAxMToyNSwgQ29kcmluIENpdWJvdGFyaXUgd3JvdGU6DQo+Pj4gT24g
MTMuMDYuMjAyMiAxODo0MywgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+Pj4+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cN
Cj4+Pj4gdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+Pg0KPj4+PiBIaSENCj4+Pj4NCj4+Pj4gMjAy
Mi0wNi0xMyBhdCAxNjo1OCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPj4+Pj4gSGkgQ29kcmluLA0K
Pj4+Pj4NCj4+Pj4+PiBjb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHRoaXMgcGF0Y2gtc2V0IFsxXSBh
bmQgbGV0IHVzIGtub3cgaWYgaXQNCj4+Pj4+PiBhZGRyZXNzZXMgeW91ciBpc3N1ZT8NCj4+Pj4+
DQo+Pj4+PiBBbnkgY29tbWVudHMgdG8gdGhlIGNvbW1lbnRzIEkgZ2F2ZSB0byBbMV0/IDopDQo+
Pj4NCj4+PiBJIHJlcGxpZWQgdHdvIHRpbWVzLCBidXQgaXQgbG9va3MgbGlrZSBteSBlLW1haWxz
IGFsc28gZG9uJ3QgcmVhY2ggdGhlDQo+Pj4gbGlzdC4NCj4+Pg0KPj4+Pg0KPj4+PiBJIHJlcGxp
ZWQgdG8gcGF0Y2ggMS8zIGFuZCAyLzMgYnV0IGhhdmUgbm90IHNlZW4gdGhlbSBvbiB0aGUgbGlz
dHMgYW5kDQo+Pj4+IHBhdGNod29yayBhbHNvIGFwcGVhcnMgdG8gYmUgaW4gdGhlIGRhcmsuDQo+
Pj4+IERpZCB0aGUgcmVwbGllcyBtYWtlIGl0IGFueXdoZXJlPyBTaG91bGQgSSByZXNlbmQ/DQo+
Pj4NCj4+PiBTYW1lIGluIG15IGNhc2UuIEkgdGhvdWdoIGl0IGhhcyBzb21ldGhpbmcgdG8gZG8g
d2l0aCBteSBzZXR1cCBvcg0KPj4+IE1pY3JvY2hpcCdzIElULCBidXQgaXQgbG9va3MgbGlrZSBp
dCdzIG5vdCB0aGUgY2FzZS4NCj4+Pg0KPj4+IEkgY2FuIHJlc2VuZCB0aGUgcGF0Y2hlcy4gSG9w
ZWZ1bGx5IGl0IHdpbGwgaGVscC4NCj4+DQo+PiBJIHJlc2VudCB0aGUgcGF0Y2gtc2V0LCByZXBs
aWVkIGFuZCB0aGUgcmVwbGllcyBzdGlsbCBkb24ndCBhcHBlYXIuDQo+IA0KPiBUaGlzIG9uZSAo
YW5kIHRoZSBvdGhlciBvbmUgbWVudGlvbmluZyBJVCkgd2VudCB0aHJvdWdoIGZvciBtZS4NCj4g
QW55dGhpbmcgeW91J3JlIGRvaW5nIGRpZmZlcmVudGx5Pw0KPiANCj4gSSBndWVzcyB5b3UgY2Fu
IGFsc28gYWx3YXlzIGZhbGwgYmFjayB0byB1c2luZyBzZW5kLWVtYWlsIHcvDQo+IHRoZSBjb21t
YW5kIGZyb20gdGhlIGxvcmUgcGFnZSBpZiBmb3Igdy9lIHJlYXNvbiB1c2luZyB0YmlyZA0KPiBp
cyBmYWlsaW5nIGZvciB5b3U/DQoNClRoZXNlIHJlcGxpZXMgd29ya2VkIGZpbmUsIGJ1dCB0aGUg
cmVwbGllcyB0byB0aGUgcGF0Y2hlcyBkaWRuJ3QuDQoNCkJlc3QgcmVnYXJkcywNCkNvZHJpbg0K
