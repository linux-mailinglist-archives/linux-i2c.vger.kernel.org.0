Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DB653E6F4
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239853AbiFFOlm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 10:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239849AbiFFOl1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 10:41:27 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A6C2875BF;
        Mon,  6 Jun 2022 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654526482; x=1686062482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+vnH7fKq2vV0hKNGnn/1YWOs57LMg8QuJb2YRTB5v60=;
  b=BwOJNPZUdGHZWDSbkobN47Zn44OWwxueSXaiQxHHbK3MXyHsQlhumCvs
   iMoejzBnuwN98b/oVMTZ+y9ltbUh1WA4ItfYH6En+trRIB7I+s4g/YM3r
   Rm6OzeaJ6RRwFO+jo4GMliVj0OwCPjpdDFErisE616MLyEGWlCL5K7wGP
   pfNNLVF15x/oucj5MeUV+7Z5eTFUB/IcrfNOCqBaZMC0m3ndLd3SiSFb0
   tTZFtKDXHKZFpZJo215ihL5E3xdmtBru0W5/1MIl0i79WfTsSu5sWBic3
   y+PYQYlFvLP96YljrIBZQbcIAq7jxVVdEa2o1JbB97pv+T8Bb2wzyKBJP
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="167256912"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 07:41:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 07:41:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 07:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MauDhJO2siZ7+GdfeQufC3dDqaXfNuRdRRAO7tnciqPL2ecZJHMgS8AUwzMlkO3/dVezmy4YITIM7xlRBwwSj3qvKLyASzkDL/1sz/iGT4yuRpkWdRvqbBAqIp7wswV6RfXGb23WLpoRTq8mD6urwsiMrvCtKYqP1vq7H7FheE+CdhXa1H6KxfDdqQ65E/rUaVFpRQjrzDJaAzRQcNQVVVD8djysYXtKZg0LfwA1SGBJzGoxInorz//j8M9NngEhA5e9YwQNRamJQErCCuAn1xar0ar1A8p+55gAHb262xIHlqwBBJB9mT60VO/FzydauzU3hyZqBTzdO2HFdeqYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vnH7fKq2vV0hKNGnn/1YWOs57LMg8QuJb2YRTB5v60=;
 b=R9ji2O8mLTe0490sqpYZAFu1VO+6y+9Vgk860T673T04TyFxwV/E4xpsCGqdwFL2VtJTGlrnPoOiroqCAfW8qdabZ5HvHZsIuHWxaiFSMHEXWi+Qa+79vgu51jHUjmO9Bk9uQp1GV0hDXHepekoa1XAxbAf1N0aheyUn3kJUFgOQ0sjHi+fJjKByDN4H8xFvq0bEQu7ujoflC0XiMqyXf5y+ucqMQxTbkSUqya+b9DKZH4ufRepumggHzmXE/9Li+zi7gQ/ORDT3PqUsMc8rh9D5SAnNwevpW9Gd1WJplBujZsKDBbI0kYqPvz7adNxFZCpUwMIHV8AeEnJUyLmtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vnH7fKq2vV0hKNGnn/1YWOs57LMg8QuJb2YRTB5v60=;
 b=ihXzsxwnK4Hf+Upk0yWgRgkaTkq50lpmCoqqXW+tkgFxnaipRQxmrbQv+pHqMCFhrGheriXEG3QVnhZoBLGNqZKwjX1mYsUU3B3sndnde9t+J9Kxc2gCY1r/NgrUlhxnafD+XLsTfGKZaINsTr82kC1rtSyp1k8lePcwpq8QgZc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR1101MB2273.namprd11.prod.outlook.com (2603:10b6:405:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Mon, 6 Jun
 2022 14:41:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 14:41:16 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andrew@lunn.ch>, <support.opensource@diasemi.com>,
        <lee.jones@linaro.org>, <ulf.hansson@linaro.org>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <stwiss.opensource@diasemi.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <atulkhare@rivosinc.com>
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Thread-Topic: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Thread-Index: AQHYeODhWt1cxuRBKEiR4wocm9c1mK1CBa+AgABvgoA=
Date:   Mon, 6 Jun 2022 14:41:15 +0000
Message-ID: <32934e96-cd37-0ddb-0e4d-1bae7f964549@microchip.com>
References: <20220605133300.376161-1-mail@conchuod.ie>
 <20220605133300.376161-3-mail@conchuod.ie>
 <7ed076fb-ee3d-a7ad-7b15-add8c5ffee7f@linaro.org>
In-Reply-To: <7ed076fb-ee3d-a7ad-7b15-add8c5ffee7f@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32d620f4-92c7-4b92-c156-08da47ca9c77
x-ms-traffictypediagnostic: BN6PR1101MB2273:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB22732CDF5EB1F418591E4D6398A29@BN6PR1101MB2273.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkfeRA4/t1N387wvUNpIIx06frrHnQF/zAtUIZhxZQLNe/gt8ko3QJiD3GuyoFJBqLnxpmNxQpE7AxcM/Orc71JSDHjpMM7Vw23WseMyWG5L5gOS1oi0XpAX79oqYHFzoR0RM+mFtNDss+g9LNTm4/ZKfSZEFf69/QX8VluiPz082GvPFi9P0HcjlF4NdlR29y3MPLzKKjFt2tzQvZGAuWlYBbDlUaHNJ3eJHhgEYumiyLQuoCNyjN7ujUzXq6VR3HmqtpDHahEkFT6gxbndESZ6GlfvawqBCmSZ30DeyXMU1PKIn73fuC38FmRnz0y0+sJj5il93PA7PS8Y4GKj9CrnhXQuNSzzyQ5Nd7ISo7jsM4Tmt1VYk2r7PUJ2dL0HBnw2tD0lU2H40XTqhqn8fAmzYgdB0d5zLM8bctBvBPbt89DgBq6svrzAXu9QakDI7wONVYJ+Vjw03ol95mAdcHDpgLly1WzUm8MmYaR84DyG1/P/ItSPPw77Dqg1qCc/FUZ9muiO5q0lsk3J1fmUcVzWsSQsrcDf5IbwdZDc4WoaF9ZX3Oaq5gc7GLi9WcWmFuIWFGw6PBXD2YXrBl++hfhBO/tzm7yZXInb24yQbyIGsrrB6s2v9USbr0GzoAjNuG4AoUEZ/IYcneGDm8W8PKbkQ+4pH/69vjhioLEzBfswa20975ut1WfVRQ9TbU91ayilJlqO93I1++FBBzQR44qPNCdTjA2ZjKXxvFEBqHeQImo9M+9S4Q5UXZpn1XIkGCYmaZsG6BjOTFIw9zmPQZKi02eO5yLFtjzFLyqsDl0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(7416002)(64756008)(38100700002)(66446008)(66556008)(66476007)(31686004)(4326008)(31696002)(66946007)(71200400001)(8676002)(36756003)(921005)(5660300002)(2906002)(76116006)(508600001)(122000001)(91956017)(38070700005)(26005)(316002)(6486002)(2616005)(8936002)(83380400001)(53546011)(6506007)(110136005)(6512007)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEpMY2dSRk9NWm9mM1IzU2ZPT0Q1MFc1bWNPbUFSRGxHeUZpU1pHMFFxUzV6?=
 =?utf-8?B?UzNrTCtQTFFLa3BPY3Y1cHc0cDVtcmdkWTV2emI1dFcrcWhjaUF1T0JuYnJm?=
 =?utf-8?B?aXV3eUg4MDdMWmxoVGFMcE51aWRJRzdYVUZWUy9oZy9oTE9qZzVkWlNHbFFB?=
 =?utf-8?B?R3RYbGswRjVHSURRcWc5a1AySW8vUmxWc0M4em1WcVVDQWNqOFV1Q1lFOUxD?=
 =?utf-8?B?WEx4T3FjcWllaEZlSjlRWWpWNEQ0L1Y2S0VPMkM5UG8waTBTL1o1Q2Jwcmp1?=
 =?utf-8?B?bVFycmV3M3BMR3ZuT1NkYjNsM1VIVGovV3FqNkdVT3doZUJ5V2QzN3lUb0tS?=
 =?utf-8?B?ampqa2pNdGlBcWFBaVhYTmdCdlRKUnRMaGtJZFl0U1M2NTQxc3hySkRYMnRL?=
 =?utf-8?B?QUVlZmdJQ1NlTUFacTN0RmgyU3RsUk1OeGt6cXhuU1Q1VWFRRjlmaHNLZzB2?=
 =?utf-8?B?R3VXVnhlVGh6bk91SFd5bVRnamZTNnZ1bXVrNEdvNVZzeTloTWRrRVZDYUFo?=
 =?utf-8?B?aTV0OU5wSFVSTEpvc1pkVUM2NzNVdHRqMytIWVRNT3g5TjJaRkhRRjAzcGRC?=
 =?utf-8?B?NHdzOUlXbVptWU5VSjljc0EvalZhbjlnQXUweEFPTFFBb1o0WStNOUVBZWtW?=
 =?utf-8?B?VUlQSzA2Ylk5b2RhdHhCOWwxUTk0enRKdnpkOS9kOW1BZE1qaFZOQ01GdFU5?=
 =?utf-8?B?TUo2ZjhMbG54aVNMeml2MHBEQXpFSktmc0FnUVpQQVYybENEcE50Rm83WXNh?=
 =?utf-8?B?T2lZTWFweWZtODhCTHVKSktBT1AzVm1tWjcyanVxZnR4eEpzU1FEWXUrZ2ZD?=
 =?utf-8?B?K1FvUFBKTXZ3ZjZxZ0J0REVtaVNPQnNPWE5QcHNMQzlrSW14TGpLWXBQNklU?=
 =?utf-8?B?Qks4RHdWeW1uak45ZExFSjJpZGpQa1NPeW1xMDRaU09iVGhCNjh5Ym1tQzJF?=
 =?utf-8?B?SDdQd0IrNTl0QnpCeDk5MndQTzNUTm5lcnVML1o4STJiKzZseXQ1M2pPazNG?=
 =?utf-8?B?TlllTFBwVVkvRm1GVnhFWm5laXhZQjlkeEQ5U0ZsSE42TTZiT3FwWDdvR3E4?=
 =?utf-8?B?NlVwYXdxM2tnOWc1S1BZUUM2U2R2SE5tY04xcFl5ME9MOUZFNEVWM0lmdWdM?=
 =?utf-8?B?RFdQK0pmVllRMmlxU0t6TEF3ZXcwZmRVSUpBaTZ0ODZwajZmSThoQ28wdEZK?=
 =?utf-8?B?K1NyT3U3eldEU1YwbEtXaWViN1NzTlkydzB3aVVNOTE1aGxudWxFTUVlY2oz?=
 =?utf-8?B?LytsMjBuWi8yZXZJVnZrbWRxanlyMHhQTEFUbUkyK2M3dU5oa3hHYlJwcmFj?=
 =?utf-8?B?MFVLOGZ3RGNlMytsWVFESCtxaDBFTWxhK2d5b3NiZkF2bkRjbEQ3L0dkYXNo?=
 =?utf-8?B?dGtQc3RPbHFTZ29adlBXYlZIRG5DN0s3UE0yV0Q2N2xWY2tGYmNvRVloRlBj?=
 =?utf-8?B?OFkvNERJcWpPMFRKODFoMVhNVEpNMVEvaytBVVJDbmZ1L2VWU0c4WEZhY0NY?=
 =?utf-8?B?Mkppbk1tRGVseGF3OVVoR2F2VkhKZnkyVWlOMktNSlRkQ3drMEdTc1RpcXNO?=
 =?utf-8?B?eFc3ZlIvTVJ3SmhXcko0UmlrZFE1U3g4emt2RHBsdGNYSHpuQ055TmEzcUVP?=
 =?utf-8?B?VFhUckd3b2hjMlJrZ2txcXhNbXhabTlzQVh1ZXJBd0lqWXhnOGRVTmR0eXVT?=
 =?utf-8?B?azROazM3R1BlUi9KeUVpdXJtdGRVY2FCd3doNmgrVmZYL0dOWGFRTW5VR0Fa?=
 =?utf-8?B?cTVlekFsSUlvdzBOODBBM0o5bWdnNUxOWFRhVGlrRzVUUGF5NE5ESzZGYlZG?=
 =?utf-8?B?YVd0RzFtbDdpRnZFWU1FR3BKTVdwV2lDak44YlREMXNFYS93eXp5Z2xRVHpD?=
 =?utf-8?B?ZW9vMU9LcEJGMFlRajZwUlNJY3RQZWZsQXZEVmdNenM4eEpkVGEyM3BQd0Uw?=
 =?utf-8?B?Ujg5Y3Rsd29NWWdJVDg5Q1NPNk5SczcyMDUrTE1xMnNJV3dFREV0V3Z1dkF4?=
 =?utf-8?B?SkJYU0RydjVIUWNLSmZBSFdZRXZyTEZpU3FiSkx2aE1xYUtidndWVlBZUzZQ?=
 =?utf-8?B?WSt4SVhrSjZGaHVkbURKWWtVZk5aczlrZS8rdlhKbGJNNjdlVFFhL3pabFQ1?=
 =?utf-8?B?THpoRmxMM0dCWTVOS3dsMnQvN3BGSmlDVWpHMEFKalZFK3F3VzQzVGtrTHZ1?=
 =?utf-8?B?VmJlVjV2YjF5RllOWDNkdG5wZlJ2K0JjcTMzdExra3E4ZndiOUdvWEVFMmZK?=
 =?utf-8?B?VktycklMZThsTWxvc09yZ1FQVUVoN215N2J3VDMxaGVTdHBMb1hDQk9RWnBG?=
 =?utf-8?B?cDJObW91QWs0QzRzWEhVSTlXcGg2Q2dOMFN2cFczVzJnUk14ZXNFZDQ2YWMx?=
 =?utf-8?Q?oRJMfbQYOwKuXgsY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <220E5608A248264EB3A8F15E895C17B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d620f4-92c7-4b92-c156-08da47ca9c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 14:41:15.9937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9pTIHcQflqbt6itSpWYu24we34ZBUiSNVSz4mhx2hSmBGUZjKp5FMs0xIX1+9ZSCGcZeV9OqRZBRhGzpvZbxABedhhnWgGHJL5Nv0WLS/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2273
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDYvMDYvMjAyMiAwOTowMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwNS8wNi8yMDIyIDE1OjMyLCBt
YWlsQGNvbmNodW9kLmllIHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBDb252ZXJ0IHRoZSBvcGVuIGNvcmVzIGkyYyBjb250
cm9sbGVyIGJpbmRpbmcgZnJvbSB0ZXh0IHRvIHlhbWwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtb2NvcmVzLnR4dCAgICB8ICA3OCAtLS0tLS0t
LS0tLQ0KPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtb2NvcmVzLnlhbWwgICB8
IDEzMiArKysrKysrKysrKysrKysrKysNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDEzMiBpbnNlcnRp
b25zKCspLCA3OCBkZWxldGlvbnMoLSkNCj4+ICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtb2NvcmVzLnR4dA0KPj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1vY29y
ZXMueWFtbA0KPj4NCi0tLTg8LS0tDQo+PiArICByZWctc2hpZnQ6DQo+PiArICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiANCj4gTm8gbmVlZCBmb3Ig
cmVmLCBpdCBpcyBjb21pbmcgZnJvbSB0aGUgZHRzY2hlbWEuDQo+IA0KPj4gKyAgICBkZXNjcmlw
dGlvbjogfA0KPj4gKyAgICAgIGRldmljZSByZWdpc3RlciBvZmZzZXRzIGFyZSBzaGlmdGVkIGJ5
IHRoaXMgdmFsdWUNCj4gDQo+IEkgZ3Vlc3MgMCBpcyBkZWZhdWx0Pw0KPiANCg0KSSBoYWQgYSBs
b29rIGFyb3VuZDoNCnNpZml2ZSBhbmQgdGhlIHVzZXJzIG9mIG9wZW5jb3JlcyxpMmMtb2NvcmVz
IHVzZSAyDQphZXJvZmxleGdhaXNsZXIsaTJjbXN0IGRvZXMgbm90IGV4aXN0IGluIGEgZGV2aWNl
dHJlZQ0KDQpGcm9tIHRoZSBkcml2ZXIsIGl0IGxvb2tzIGxpa2UgaWYgbmVpdGhlciB0aGlzIG5v
ciByZWdzdGVwDQppcyBwcmVzZW50IGl0IGp1c3QgY2FycmllcyBvbiB3aXRob3V0IHNldHRpbmcg
YSB2YWx1ZS4NClNvIHllYWgsIEkgZ3Vlc3MgaXQgaXMgemVyby4NCg0KPiANCj4+ICsNCj4+ICsg
IHJlZ3N0ZXA6DQo+PiArICAgIGRlc2NyaXB0aW9uOiB8DQo+PiArICAgICAgZGVwcmVjYXRlZCwg
dXNlIHJlZy1zaGlmdCBhYm92ZQ0KPj4gKyAgICBkZXByZWNhdGVkOiB0cnVlDQo+PiArDQo+PiAr
ICBvcGVuY29yZXMsaXAtY2xvY2stZnJlcXVlbmN5Og0KPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4+ICsgICAgZGVzY3JpcHRpb246IHwNCj4+
ICsgICAgICBGcmVxdWVuY3kgb2YgdGhlIGNvbnRyb2xsZXIgY2xvY2sgaW4gSHouIE11dHVhbGx5
IGV4Y2x1c2l2ZSB3aXRoIGNsb2Nrcy4NCj4+ICsgICAgICBTZWUgdGhlIG5vdGUgYWJvdmUuDQo+
PiArDQo+PiArcmVxdWlyZWQ6DQo+PiArICAtIGNvbXBhdGlibGUNCj4+ICsgIC0gcmVnDQo+PiAr
ICAtICIjYWRkcmVzcy1jZWxscyINCj4+ICsgIC0gIiNzaXplLWNlbGxzIg0KPj4gKw0KPj4gK29u
ZU9mOg0KPj4gKyAgLSByZXF1aXJlZDoNCj4+ICsgICAgICAtIG9wZW5jb3JlcyxpcC1jbG9jay1m
cmVxdWVuY3kNCj4+ICsgIC0gcmVxdWlyZWQ6DQo+PiArICAgICAgLSBjbG9ja3MNCj4gDQo+IFRo
aXMgaXMgY29ycmVjdCBpZiB5b3VyIGludGVudGlvbiB3YXMgdG8gcmVxdWlyZSBvbmUgb2YgdGhl
c2UNCj4gcHJvcGVydGllcywgd2hpY2ggc2VlbXMgdG8gbWF0Y2ggdGhlIG9sZCBiaW5kaW5ncy4N
Cg0KDQpDb29sLCB0aGFua3MhIEkgZGlkIHRlc3QgYWRkaW5nIGJvdGggYW5kIGdvdCBhIHdhbGwt
b2YtdGV4dCBlcnJvcg0KZnJvbSBkdF9iaW5kaW5nX2NoZWNrLCBzbyBpdCBzZWVtZWQgYWJvdXQg
cmlnaHQuDQoNClRoYW5rcywNCkNvbm9yLg0KDQo=
