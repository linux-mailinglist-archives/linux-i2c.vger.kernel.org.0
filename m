Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE015817AF
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 18:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbiGZQmt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jul 2022 12:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiGZQmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jul 2022 12:42:47 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB65EBE;
        Tue, 26 Jul 2022 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658853764; x=1690389764;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4MHFcZ7NNRql69emoAyPLzXczyFxJkru42TqbLt7wLU=;
  b=P2rwQ4VsB0xfQKgQhQxzvIMehyUYp1j9kkC4gY6aubr6sXyPi9Slqn0A
   1rhsUXyQVqdG0i//W5fXRn5gqvm8L/WuTvLyVJ66kn7YBdUwCnEmYrxQS
   e6pGvRDTQXixh7IsBKlIWK9SRHrkK97RJ4E1odnUBqPiIT9W0ZxyoMfuD
   gVGHHI94reINAmIby5JjIc7wXKNFLPQXI7PdyqcpEb9i30ditO/+qw1/Y
   OYSmpXTGnMUnrMONF8oyRF0ytZtCKaaM6yuQ9N0iY+5e8aUMonXdBgH6Z
   7lTZSRUSpzaIR5h4iLVOviatjJEgzCN9/zPRih1Ae05Bbx6tIQhk9pE66
   g==;
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="106225894"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 09:42:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 09:42:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 09:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/omlp1GVhI74bmAFPRGSd93STtzZ+Vo55bk7EHHTFoSo4WC5eFOcSkaiPNrbxDspf/2HOlIWS0hJ7U2F6cUep8JZPbvQloissQgoquOSn6HhMIpQGM9fJdy135ggRgbIPLPJtNi6/jMpUwvpMSR/o3DB003HfB+yDza4aBpLab6OQ+6zcBxU7B8S5wbRbX+0dULVnkTfCqKEX6nLMeBGuo7jZH1lt85LXuTp6iUB8avpCn/snwQVw8/1UCXTIN7kdUdOTxXMaLMbpIvxIQ65yD9JjVUfNpI07XF1e/+r9cN2XtJFO7XtrEH3n7uyWOtJgmNs92zUUK4l4u/mNz3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MHFcZ7NNRql69emoAyPLzXczyFxJkru42TqbLt7wLU=;
 b=YrSfNA391060x4m4/xnk0Pxb+XsU21mNHTdtH7bqY6os9ipSQRpr0+VGSf29vAx92CNIv7LjfxpVZR1XanlxEPeryfjfWHE1vuhOIQEN8+FGCweUkUaeUmWDLVEYDVK7ckYFuqstdefYVnPak6OdvBLkMJs2qD+e70IF/fRO/HZUSKVn7CGF9YvbKLdNP4veHHclK8KA1F4GFb81iPRooryJ5CJnhjQDrtcOsMOsTPeqLympLukMPOytNRNn2zMQbJKg72saQiDKh/vIxcrorcc0JoMlp6CC/9b9vinXC1hC4hoiGUIpMpG0WTmUebhrFVWQGnA1YOvj8xTMA4V7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MHFcZ7NNRql69emoAyPLzXczyFxJkru42TqbLt7wLU=;
 b=AAmyQ6nV/9lCpulhytSnZsgcUmBb+Q2ZsLzH2f7I35NA8LY0oNdP5DU2uq9fKP07z/JlAmGp+xYjYJy8XtehGYTJLZF1CxlFEDY6cDzatkmKWA4a0Qy31T9iRj9EbKzZCJ/bZXanbSFl87tGvU6rm9N7ooOgGZA/rYne11jKEVg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1338.namprd11.prod.outlook.com (2603:10b6:3:b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Tue, 26 Jul 2022 16:42:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 16:42:40 +0000
From:   <Conor.Dooley@microchip.com>
To:     <atulkhare@rivosinc.com>
CC:     <palmer@rivosinc.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Topic: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Index: AQHYe5EWlaN9eJ6DkkaWySyozCpPXK1VKhaAgBTmLgCAAAMkAIAnEuWA
Date:   Tue, 26 Jul 2022 16:42:40 +0000
Message-ID: <dd128dec-6092-7aeb-6e66-eb45cea3b0cd@microchip.com>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
 <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
 <fb861221-2e9d-7d4a-dd52-b16b3b581fd6@microchip.com>
In-Reply-To: <fb861221-2e9d-7d4a-dd52-b16b3b581fd6@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71949bb3-e6fd-473a-0c8d-08da6f25dafb
x-ms-traffictypediagnostic: DM5PR11MB1338:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iqp7rMCzrq19IQDTp/pe2UR55iy6ttMiW62zawyLIu2G8F2Z4VxqbNMKe8FNiIxM7fEFKn6+gTCsZ48LuXbYBjwDcXDQpTWBhx4pKdqp+KJVWKce39U7MHHk5VugL7XlL6ZBAZ4ZAmofcVOtyBjbDCmtWC00A3B5jcSwHRJsaTWitI5eZLrZyGHat5ujSBtV0boleIHWPsgdR3qIJZ4QIoL8ASJBwjpCALzhPpFkEDWDNpHHIP4u7ns4jZ07Hi0wNZNPIaE6eun7CtyDTALBin88PrK87Ajn08Dtu2fQxsFdk7OtRofXJaetbUHWfm4BZcY5tQi7Abl99+HLDaG1jQL55hy9i1k82V1uH2yjA1V6kUMnc0Oh6I/Kl0hR8kQLmTBLI0UsS8PaCCV1+BLhFt+bj2fJIYys8vAsc0m2S9oeK9hg6vkPL9vKczRECQlGD3yD/wWXcXCJyiG3VeD9i6CE6qkOjt2x0eB0VRgOa0bNKfqFCe82SbPoxmVYJ+pk44housmN3GEiBqepMvC15A210FUN7UB9tNdUQfoP1rv7mLZTV2DQ0g9ATbvvSU3JHHfuVZBfPoTr8ENKvWaeSsLN0FMRgYnb/Yif6tLpIbMwsll2rVqNGZ3WVQvrq5NIOnu7VrPRkda0velZPqcps8DYDlC9DrlWQ+AQm/0pEPY4rK5q3yZYITzdrQre8G+TE9DxGHSjFsSa+hIH+TtIFtEa1GdNIbbA0U/5lRA5aL1NdQA0jTo9YM80J6MMaiuiUDA5gJNDdEi6OtY2SsZT+RlUvGnP2ihBCad8WHvllpKTgt8MMQo26Muatf4w5sfS5gGBmJ3YUGuAV6HrGRedhkJPbVylEY49Lh4VOYH/Pmg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(39860400002)(346002)(396003)(8676002)(4326008)(76116006)(91956017)(64756008)(66476007)(66446008)(66946007)(66556008)(5660300002)(4744005)(36756003)(122000001)(38070700005)(2906002)(8936002)(6486002)(38100700002)(2616005)(26005)(31696002)(186003)(71200400001)(41300700001)(53546011)(6506007)(6512007)(86362001)(478600001)(6916009)(31686004)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3lMSjAzYVpLU01TRXZMRy9SelNSbk5VSllEaTJ2MFh4M3JENGpFeko2UUg2?=
 =?utf-8?B?c3h1U0t4TndVRVcwMVRDUUFvZjZVVnRScG1nUHBBcW1SbWZpa3RIRWdZUUlE?=
 =?utf-8?B?S1lOOXhqRkIzcEpTMWRMaktFKzJ1VUdTejM4K2NkNGQvdHBZbWM1TTd6UEE0?=
 =?utf-8?B?VFlpT0FSYnJWbmNQVURJWUtTRXIzMVZLbXgvNnpya2V0bVRtYkpkcTJjd0xT?=
 =?utf-8?B?MmtxdklRYTF1L2lqM1BiZ2NUdm9GUmhFeUV3WGFva0hCSHlRQkQvVTlxd3p5?=
 =?utf-8?B?OUV2VnBsY1llam1JNlpwb1kxNWpDcG10aDVMYTZrbGIrQnFGWHhkTFhjN2VO?=
 =?utf-8?B?a2tvYXNTWWQ5MGRYTmp3UFF1SmpXS3UvQzl0Y0hNMTF4L0hvMW9kWGJQSTM0?=
 =?utf-8?B?SHdrQUZlV2t1MjJ6eUU1eUNnM0FPNzJpZFRyNEtwWlV6UzJuL0h1QkhkRG81?=
 =?utf-8?B?bzJJV0hzZjVNQXcwdVZFVmRUdm4xM2h4TU1EUkR3Qk5WM2piZ0VlN040MGNR?=
 =?utf-8?B?dzVHVzZmZk1DRjU1eTY3eWVYYUhPaCttbVdJQkxVa3EzcHlkcHlqbWdXVFVn?=
 =?utf-8?B?U3l6RG1FSVJiU1V4K003WmNNTkY3b2M4S1dFaStaVGxZU20yRCs3ZFV2bHFu?=
 =?utf-8?B?OGUreTYveWpNYzdDbHJtbGJ5VjZiaFo1L0w4a24yVlN0TEE3emxnZTJkM1NQ?=
 =?utf-8?B?aHpFYmlCU0JVd3ZQaEY2bnQ0T3kxRGx0YU1HYlZibWhHNXUydVE0UnVJdDhI?=
 =?utf-8?B?aHp3Yk9VbDhBTEQzWGh1Y2FES3R0QS9Rd3Y5bCtTUm1MMnI3QmhRK2pveDZZ?=
 =?utf-8?B?QmJncWl2M2d4cUlwRlQvalptbFdoZTlCY0tMNXB0WE81V21ITWJjOWkrMWtT?=
 =?utf-8?B?K1ByTVJrQW5EY1kyWFh5ZGRLNCtpTEFIVDhVR0N4bkluaU0yZEpFd0dyL1Z6?=
 =?utf-8?B?Z2tzUzFoRGM2cDBGUzg1anFleHNrc1drd2RiL1A1V0ViTnF1RVVFamJENUNR?=
 =?utf-8?B?WklvRHgyQVh4eExOdEdvcUhrS2ZYK1Y5SER6SENtMnhOK0hoUmVQTEFibklC?=
 =?utf-8?B?djlsMjVNOFd3cmoyRVo2YVZTTnBDQVpKNHlKTmhIY3dFU2hJUzYyVHliZDVx?=
 =?utf-8?B?dWJTUnl5Y21zYnd5TkxMQzZONER4aGZMZ09lNVBoRXFnMEFQOS9rQ2F4Z3Ev?=
 =?utf-8?B?SGZnVi9heUVNZ3JYK2JOaFQ4SDduaWR2N1JCQ1hvVi9UdlBxazZmY1lVWEN3?=
 =?utf-8?B?cU1qN0hKM3pMQ1E1ZEtTeFVWT21JMkwraFZyTmJyd1JOUUYxSUU0ZkhPRkIy?=
 =?utf-8?B?bERxbUJDOWI3VGtDTDVPOGwwWngrdzJsdTN5akNOZWFybTJIRlJYSWRMMkxx?=
 =?utf-8?B?dVZEdDVqYm5tamNEYmNEWDJrMlY4OXpMNXZ6OXNNYzlyR3VoSHUza1lqUUFk?=
 =?utf-8?B?TzByaXZMbjdxT1dSdFV6WStOa29TeEVwdTN3c3IvelJTY2RoUWhhNzEwYUdq?=
 =?utf-8?B?L3YzSGd2S3RScFhLQnFkN2gvaXFrdWxFZnJkTUM5WnlCWVBIa2hYaDBrWTk3?=
 =?utf-8?B?NU1FYnAvRnJmdC8ybUhFVDVRZVFhTXZDbDg4ZU9LNkpiZVZXUGVnaHVYSS9B?=
 =?utf-8?B?QW1UV2hqNW1zdW8rWmd2ZWU4UGxueDRMT3c0MGtqOE9naFRodFZvRDRjQUNF?=
 =?utf-8?B?VXNGT2ZwdzNOVVJkREVtVXVqS3ZCTXYydEFmNTRLd2p1MVB4N2xVWVFjMlQy?=
 =?utf-8?B?QVZzWXN0TWlGZWNubThicW82T0FTWXZmSmRwTFhqS2dvbEpkSENOQlNkbktC?=
 =?utf-8?B?VWxDSTdUbkVJa2hZOVlldTRZUGs5cWtkbUZMdWcxNHFhREpjZzFRNVVRUVJZ?=
 =?utf-8?B?Z0tmQnVDeTRJRHVzaTRKR1loOVdtNFFhczBzVHg4WFJuVXIzUmZhU1ZQaVMv?=
 =?utf-8?B?WkFHR0F4aVNWMWpKeTc3REVjK2JOR0ZqLzZXajI1ZlcxdWxaSmdQdnlxNm9W?=
 =?utf-8?B?TTZVY0pBUmVOUGQzVklwbkp1VXRBVnZISndDN0wyZWtkZmkrcFp4bGdtV1Ny?=
 =?utf-8?B?YjdnY25hU2NZcHR2UGNEU09nRXFBcExRVy9CQ0F3V1p6RDdyaTVJNG9xeW9u?=
 =?utf-8?B?UWR3RnZKN29WdzQxekpCbGs4UzZYaG04Mk9OdUVscTdHazk4ZHRrS01sRkZO?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFF42B842A5AB147ACB5C964F806C2C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71949bb3-e6fd-473a-0c8d-08da6f25dafb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 16:42:40.4394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gTIQLqT/g/PXqTni0fSeCV+fJF8U9YCQNZIjedfVlqKXycovPhZzMqjy0pDN0YoI1e+qRe/zP95TPlQE7X+tmWJBKMttjSw7gaNZ0NJSQRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1338
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDEvMDcvMjAyMiAyMTowMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiAwMS8wNy8yMDIy
IDIwOjQ5LCBBdHVsIEtoYXJlIHdyb3RlOg0KPj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBp
cyBzYWZlDQo+Pg0KPj4gQ29ub3IsDQo+Pg0KPj4gQXBvbG9naWVzIGZvciB0aGUgZGVsYXksIGJ1
dCBteSBsYXB0b3AgZGllZCBhIGNvdXBsZSBvZiB3ZWVrcyBhZ28sIGFuZA0KPj4gSSBoYXZlIGJl
ZW4gc2NyYW1ibGluZyB0byBnZXQgdGhpbmdzIHVwIGFuZCBydW5uaW5nIG9uIHRoZQ0KPj4gcmVw
bGFjZW1lbnQuIEkgd2lsbCB0cnkgYW5kIGdldCBiYWNrIHRvIGl0IEFTQVAuDQo+IA0KPiBOb3Ro
aW5nIHlvdSBjYW4gZG8gYWJvdXQgeW91ciBsYXB0b3AgZHlpbmcgOikNCj4gDQo+IA0KDQpIZXkg
QXR1bCwNCkJlZW4gYW5vdGhlciBjb3VwbGUgd2Vla3Mgc28gSSBhbSBnb2luZyB0byBzZW5kIGEg
djMgb2YgdGhlc2UNCnBhdGNoZXMgKGFsdGhvdWdoIHdpdGhvdXQgYW55IGNoYW5nZXMgdG8gdGhl
IHYyKSBhbmQgd2UgY2FuDQpyZXN1bWUgZGlzY3Vzc2lvbiBhYm91dCB0aGUgY2FjaGUgYmluZGlu
ZyBjaGFuZ2UgdGhlcmUuDQpUaGFua3MsDQpDb25vci4NCg==
