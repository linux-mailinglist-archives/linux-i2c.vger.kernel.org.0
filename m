Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8A756934D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jul 2022 22:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiGFU2A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jul 2022 16:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbiGFU15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Jul 2022 16:27:57 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5436322B3C;
        Wed,  6 Jul 2022 13:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657139274; x=1688675274;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=LwVTSewbqAqEEyXXzTWYMDNoZ+pyplZ6Q+XPmRfIpMs=;
  b=X8EVpEyzT3AHgRll17WEnkvYl4FvubzarRAX8HHsWGnnhBQCyhxxl/00
   ozr4bhIVrSH4xHDwuzRpJ2srGybRdr+x8PIqyr4Kk2Gb1WViHFdqa1XEU
   tAjqbpj4n3zFOa/g2MbypQtAqLjNlW8eFL2j7uf3eEiAhS8N6HeiLT7QW
   NDHlQyxcKqii/d7R+j2/199kix/XZ9MAqe5RoF+ZESoJV+0hhno20i/mz
   Ax5Rnv3NVQY5QqoYLKOLlN5mks2Hyc5ZZL317R2cuJC5gNr0I6m+Ym+wl
   u/kus4OmSGhGcqDzfoItkmxx1DINRXk82I5Jhtd7CffnfMdAdkKnGVUyk
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="103355036"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 13:27:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 13:27:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 13:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhws4UnARREVFE8i8gXE/Uu/tTojotuBrLqvXcZUp2nv6UsSQJfPNC9dBgNSEkSVKvi+Bjd74lto7C3iVT231DUxsZFs7CtjuvrAxkio7v5CpR9+yno2npPjO/GsHTR6wDsEFvvjNbwtEK9xpl3Jym5EgLIZ/yRyeKLzaDcTMZe9QL/5nT1s6RS+n/RkiqnCjMzuzjh8CF6Y/nM2FQ86/2nN4IgwHBMYY9xMkdF4KfanwvxrSq8VgLCNdUxj03P/vMWwEbAG7ZK/HMP/q4ph/gQ0+8CsMJ8HUXaLkJxoIykaO0NPLLK660x/sd6FS3UJS4JQcxVBU2kIfkGu7NItXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwVTSewbqAqEEyXXzTWYMDNoZ+pyplZ6Q+XPmRfIpMs=;
 b=bWhmfKcbm3ofRbQWwylLlIDPsMwSrm4yD86UpGhrBckvWsRgFzhHwApl2vXkHxfgK4EnQu9sPLzT2WhYYdsxV+47QppLjlv4cfH8ExW1inBl56xB8KHwZpbnR5CguD2m7/YTqWCmvwllO23H9kZl+Z6CA8CKBQbmcXb84us2QLLkMiCWVU+yRd3MXSO08aVgtcJ98H6r1vxGiLjiL6a4gy3KxbAVnpl30JZJHrMtO1zQcu2T7lcR8XE6dg2+L41Q3Ih6x4CPFJqBfXStrDg0/BCMZMFRIz2XwM+cXKOllpmrHRM/ZubXpBS3XC7tuncw+Z7iJPxovddNKilPELj2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwVTSewbqAqEEyXXzTWYMDNoZ+pyplZ6Q+XPmRfIpMs=;
 b=hKVsgcgsq/l1TORgETz6xC+Z+ycRQ8tOTcyK6av70G1SlGeuEjo8S547iger1QQKMf3yx7mNotnqxMx3mn/YWPVZuRZGcnqVkyWZPwesvq/CskKRqnHtl90YAxq9TPdykytyaN3vX0ii4OIvnaJM2v9Ih/qiOOgT7rABfVj/B74=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3084.namprd11.prod.outlook.com (2603:10b6:5:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 20:27:50 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 20:27:50 +0000
From:   <Conor.Dooley@microchip.com>
To:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Topic: [PATCH v7 1/2] i2c: add support for microchip fpga i2c
 controllers
Thread-Index: AQHYkUKZtonGGLssTUOORFtF0KSp7a1xue0AgAARRYA=
Date:   Wed, 6 Jul 2022 20:27:50 +0000
Message-ID: <0e28e644-a25a-173b-caeb-826cc4fb4537@microchip.com>
References: <20220706141313.2504237-1-conor.dooley@microchip.com>
 <YsXhyB9GrfUQjy4n@shikoro>
In-Reply-To: <YsXhyB9GrfUQjy4n@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6bdf090-3b34-4cc5-a294-08da5f8dff22
x-ms-traffictypediagnostic: DM6PR11MB3084:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/0oQlDERGS0E4U3tznH0s19XFMThc5nfM0FVdSbodywpmk+/vhCfGxd2sPYtFkKXi18OW0kG8TaX5hthb8uH+TrUsNbK6WVvUllrjlxzy70eztGNL7sp87tBEgSVR9h8P8lYvCsjVilnaV+CDwwFcJegc7hIb5Ex9SpMDVUBulROLNFBpaPoDvclxI+K6mCQAAuVsNx0aS6Ah4vNtIrLNL5qcPt0Nx8SLM/I1CCu/KYDMyJQBuEJhNIYe/q/BdjnuCrHIcrxq40M45DntYu9PY0IoX97f01PoR1u068HxPgZjGR/RuAyzP471kv0w0QGSSPSgnWPFT7ci2R0qD86OL0R7LzpedKyr5AT5naNxR2riB7YMnMpjEEg4+CPqrxEziY+jf7gZbYmFO43wogiRpeeuT0QuRGesjW1mhuMkFIUxtOOH//73CjJy/Lg2DIGQ5EUE2SSaqz84/NPJ03bTCC55/+4hYz0uJUPefipAWfbmzsyYicCuT6hoOVZNB1N/oR+bC9WrmWvAfdrtL07KShwc7dJ1xBFWujmlCcdu4f/0a4qvrIQO8SX5b1NWWYm2bghKO2YLl/m0l0kNVi63SU4fQoX0nvM0Qg09wwidC9zaBin+gBVVlohXSESVYP5FLbihmX7X9dDQuQSAq9h4SY8CEhdL3iGIeXDywpcxucZrDX1IuzEbVwwPftfcoBDaYx90UCAFrxojs1WCN/2Hg761TCgHXX/22gj92fQUdjRX4gOco8shb18CbShvp7bqWb/f3OTLgoRv9GTAnH20Bbk/i/VmhlAX6iVnjA8g48d+5e7SFpijDT+IfBUcPgWffHWFhwGGcpiWVHzTsYz75iboUCC4plspBJ8di/bwhBquX1VIC7G+Teo6wiCxON
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(39860400002)(376002)(346002)(38070700005)(122000001)(38100700002)(110136005)(4744005)(316002)(71200400001)(6636002)(31686004)(8936002)(91956017)(76116006)(8676002)(64756008)(66556008)(2616005)(66446008)(6512007)(66476007)(66946007)(5660300002)(26005)(6486002)(478600001)(6506007)(53546011)(41300700001)(2906002)(36756003)(31696002)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3hsYW9oMllzQmFka3ZrS3orOW9lUFNLME9FWjhqNHNPV1o3emNDOHhXbFhE?=
 =?utf-8?B?U1N4MGtPQU52dHRGUmJ5SHZiL3E5YjcyaHJRcmFFcHh1MDJrWnRIYUhNU2xR?=
 =?utf-8?B?czJZSE4wT2pRM2w3N1hzclYvb3JkcHFqVjZ5SlBscmVqWGNzWVVrcFlPcFZo?=
 =?utf-8?B?WkdzdFlaTmE3YmNHV01WMWxYVjFTblUydXYvTXltcUd3Rk9JUzJGeklmVzFk?=
 =?utf-8?B?dlJjNVZBdTlmdy9sOEtBOXVyWiszdkx2Wjdxd2x0ejRxbkh0VFlyc1dZQ0ZG?=
 =?utf-8?B?L2FDUTFmaUR5QkF6ckQwQ2UzV3pRV2wxMy9qaEJTWGNsL3RMVmVwbm1FNFQ5?=
 =?utf-8?B?dUFJbEZpcnFaU2ZCaEdTNTI4VnNmTnF2RUFLTGZ3ZU95VXFzUndMM2JUeG9r?=
 =?utf-8?B?cTB4aUNvMk1SYXNwNXkrdWY2WGxKd0ZBOUdoK29meUc3bjlqZ0syN2IvR1hD?=
 =?utf-8?B?d2g3b253L1BvVitqV0Y5b2VFTVBZUVpqNnovN3B2aWJtSlVFQ01KWWRYSmVx?=
 =?utf-8?B?Nm1KeXRUUE9UZ1N0SUhmL2wxQVh5RFpwSXY5VGo2NCs5aVZSbU5oMEEwSnlT?=
 =?utf-8?B?SXZxT2FSZTd4dEFrRzh4eFdmdUYxdDQzMU9vMzJ2Tml3cUJYak9UeXV5Ky9T?=
 =?utf-8?B?WGZRZXRLa1dQd1VrQ3N3KzlaQkdjK0pyMmIxaGFYYlhSSktjZWYyUlo2cVh1?=
 =?utf-8?B?ZjRLNVJYUEhkS3NOb3l2LzRSeXNpWDRKNTBITXZVK1NlV0JQZllHWDFNYjV4?=
 =?utf-8?B?Q3BzTFIrSHNONTl2L2VBYzBrZlF2TG5PQmFwVmNHOUFmcTZuNjIyL2xiWmt3?=
 =?utf-8?B?MXhTQWdwWlJLYlpSWHFMWkdrVFdLdEU2Q2VMRWE5ZzZWMitsSHQzaDVlZjFk?=
 =?utf-8?B?QmNVZ0liK3BIVkl4cTZYQldBNU9uSXBiK0VuSHpEMlNIYWU5QmhDd2hPc0FF?=
 =?utf-8?B?a1RqUGU3b3JNR2laRUlKQzlmZGZPTU5WWGhsa0NXSjg0T2ZoSnBiNjZNaytq?=
 =?utf-8?B?S2MwVXVGcUNnczBXQWdwbk1Mcm1nTFFodHBIcnJnREJEbHZrbk9oSzRSdTFn?=
 =?utf-8?B?MXIrTmlRR2N0dUExU1RFVlkzZ3VOMGtYT1BvNnVFSHBUTnh3b1JUNXFGaFFT?=
 =?utf-8?B?ZWZiTUtyOEJuaDhBYmdCcTlSNXY3WVBldElJb0g3YkZwYkxmdHNKbDVUUWtB?=
 =?utf-8?B?TmhEV2RwZWJiNnNoSEpzL0pDS01yT3RNQ2RaVCtpS094YmlXdlZWQ0JQa0ZJ?=
 =?utf-8?B?VHhmbGcrcWRNZW5sRlVUUTZ3eDFxU1YvekRNOERKRHVDYVNiZWt0UGZuNnBH?=
 =?utf-8?B?SFRac05TbTFrZncySjZld00rR29zeDNlSUlnQXRDb1N0UEtNMFFJOC9ZNmJ5?=
 =?utf-8?B?V1d0Ukd2N0pGL0FMTTMyaUIxc09pcnhWbDF1ZWdZdU1IOXJHK1pEN0VmdFFL?=
 =?utf-8?B?V3M4d3JlVmlLVDFUaHVZUXZxZTZpM1A2NG5xT3NNVnZncGpSY0FYWmVCc25k?=
 =?utf-8?B?dU1uM0w4VFhCb3pUUzkzUk91SkhYK1pDblVNRHpRRGtyRnVJV1FTQXpMWFFM?=
 =?utf-8?B?N1pCMzFvbXpPSUdXSTcxY0pRQ29kYkgzcnBZSnphb2d3T29VV3VqekVJblpQ?=
 =?utf-8?B?aThSdVFhcmFocXJPc0EvcFIrdHB2NmtQdE5JQUFZMjJCZUt4QnFDV01nUzQw?=
 =?utf-8?B?M2JnVUZ0TGpkSWZuYWdIVlNtQWQyUTBCOUVQa0txV2diMEc4WlozQmJTTzk5?=
 =?utf-8?B?V08rNS93VGlTb1pQT0xpUkFqWXhlb2VGYzV4WFZkZ2ljRVBqeWZaV3lPbWZH?=
 =?utf-8?B?V0lnSG5FYkhzVTAxbFJNSWVUNFoxTTFoMXRhZEF0ZEFteTB3aVg5SkZoU1BD?=
 =?utf-8?B?Q0hScDRlUTlJYmxaR1l4ZHhMN3JHczVVYWxPL3B6M2pkMVhBK0dnRWtXTzMr?=
 =?utf-8?B?bzJFMDNJamcxVFZyT002QkdIcnJZRXgwZVBNR0VUVUs0elRRa2JUYk45RFhk?=
 =?utf-8?B?bndXT2ZoZ29RSldYczRQNjJzTi9pZHZBSVJWQmVtNFFsUTBoYW1qSVY2Rm5N?=
 =?utf-8?B?R2poMFJXcXpSOXJWUkpFT3lyTndLQW8xZVpVRkozNnBjeFNYemVLN1Uwc1Rm?=
 =?utf-8?B?eEtkaEMwU2FDL1pmK1lxQW80QmRwNHZXNWE3ajVRdXFYbTFINmJWMk01ZjVU?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <122748633B252E44B268E92D2E5D0942@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bdf090-3b34-4cc5-a294-08da5f8dff22
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 20:27:50.1677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adQvxET8SJRnUTXkaDmCCQOspA77ZeRRH/WZW1TiyxqIzNKET6ZLioSlewqn+p8u9aKtyrxpj3DZ1jvDJVQOEQ1XWkLkChIFeP2jyjmKmEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3084
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDYvMDcvMjAyMiAyMDoyNiwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFdlZCwgSnVsIDA2LCAyMDIyIGF0IDAzOjEz
OjEzUE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToNCj4+IEFkZCBNaWNyb2NoaXAgQ29yZUky
QyBpMmMgY29udHJvbGxlciBzdXBwb3J0LiBUaGlzIGRyaXZlciBzdXBwb3J0cyB0aGUNCj4+ICJo
YXJkIiBpMmMgY29udHJvbGxlciBvbiB0aGUgTWljcm9jaGlwIFBvbGFyRmlyZSBTb0MgJiB0aGUg
YmFzaWMgZmVhdHVyZQ0KPj4gc2V0IGZvciAic29mdCIgaTJjIGNvbnRyb2xsZXIgaW1wbGVtdGF0
aW9ucyBpbiB0aGUgRlBHQSBmYWJyaWMuDQo+Pg0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBEYWlyZSBN
Y05hbWFyYSA8ZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6
IERhaXJlIE1jTmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gDQo+
IERyaXZlciBsb29rcyBnb29kLCBidXQgd2hhdCBhYm91dCB0aGUgYmluZGluZ3M/IEkgc2hhbGwg
bm90IG1lcmdlIHRoZQ0KPiBkcml2ZXIgd2l0aG91dCB0aGVzZS4NCj4gDQoNCkFscmVhZHkgdXBz
dHJlYW0gOikNCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbWljcm9jaGlw
LGNvcmVpMmMueWFtbA0K
