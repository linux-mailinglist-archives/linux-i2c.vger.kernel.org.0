Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17A9051A00F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 14:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350061AbiEDM6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 08:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350089AbiEDM6U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 08:58:20 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554663B023;
        Wed,  4 May 2022 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1651668882; x=1683204882;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/pFusvp5EXlIdjskrEJqO804DdEcrp0yoCr0c0aBW4M=;
  b=jgWAjeFk0iBSTtidQ87d2dyt+g7MNnIw/J+BPIMtmNXfwwxWBJ5keD/l
   SWiYYYFHk+aDWldQoBcudMwtxw5px7E29+dv4zzqK2qHgJnrYtdhtUgN6
   zlEnGkGAG7slKzQ4GR4/ISV3FM4vh5m3T1haWLoh8qYJS/rHaV568GJDP
   vgbsBbE/6dUkbcELNlJ23R6GTDBvrDlwi519S/5VMd3YOZskXofbhq5oV
   WpuUVoe/BVhzhXl/jOGki8sL/M6ZTCHDhblrsY0PJI3uKIEcMB4QAvvUv
   tDvjFR2InUQ2uxX+WHYw/YYDYOlwQYdIHGr8SFBXYz4/PRqgRc9iXvSGM
   A==;
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="162695802"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 May 2022 05:54:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 4 May 2022 05:54:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 4 May 2022 05:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIXEoAcPAZxtj8zuKEG4C+RJdmqR+lYy1d9COf/V3yWIll3C/SdWRcex0ysKdV6llvXr1iBU2AEtnIzC8WOX6R94j5QJunQb6JwkyhkmgZ2sNXFvxXNezLzi9GkdtH0hN9AkX1kmlTz0FH3WGoQiH9N/7W3bbHS3ZqbDx2ECOOHqTJPwqhPzs1bpgJzWRJemgOa6pXVv4iKEnwPSNGh/C1qLlVIRl3CRtYraB5AzS8cS9g5c4RtStVdyIgQ3Cx6QS5IqBuWbQ8mf0vXK+Q5Q2nKt+c7ZDxJicOQhx2nywzwEr3F7SFq+D7dbt5c+jHCb/VM5fG3+sbkRdvsCY9Gn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pFusvp5EXlIdjskrEJqO804DdEcrp0yoCr0c0aBW4M=;
 b=fA/QVfFObCp+5pjp9oC2lbGsiw7kAHQglMhr0z/1dmBvUZtRh/S4RBK3sohqTVFubiI7oqji4fiOs8j1u5zVTmXwrfIDRpRPUWiauG8R3ObQHAM+bxiKgxYt3fwhK7fC3t9Ph8w0MVL0HlGfDX13nxWMDPxC5ChvHRer1kOd7ovkIlR9WtC1UGb3sfxaR7UxYYEJquouFAEJNMLsmXYBRSeOjO+SSAQHGdqvQAG5/1yUFiavTKBVWbUPRO/8nPN8CTBz5SfZRzllACjdpp2EJZ4x1SRoPMi2VxPFhxu1vNtGJjomyMhRKGtBToOnwQ+E2IYwDJAdgPUfFp7S6RCZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pFusvp5EXlIdjskrEJqO804DdEcrp0yoCr0c0aBW4M=;
 b=WNQfvpk+3dah8Smd3Sgw+667BfsSyXWJn31YmhSBCIbYkU82P7hpe7daovfY/xTUVBRhBmEgy+f8yLVK5znYLnV92FyQalxp/Ipc38fl7SXnIV/7X0j/PUBDpbRObgdeTEyLlXL7BBSQCjFr7GSgcmqrUHK2GlHI0sAqXGDzYUo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM6PR11MB2667.namprd11.prod.outlook.com (2603:10b6:5:c1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 12:54:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::fcd4:8f8a:f0e9:8b18%9]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:54:36 +0000
From:   <Conor.Dooley@microchip.com>
To:     <hdanton@sina.com>
CC:     <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Thread-Topic: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Thread-Index: AQHYPSMB0fElgzWzO0GEtW3rBppjp60OtPgAgAA84QA=
Date:   Wed, 4 May 2022 12:54:36 +0000
Message-ID: <c4ccffe9-9892-2e32-45fc-7028f9b92a7b@microchip.com>
References: <20220504091622.5024-1-hdanton@sina.com>
In-Reply-To: <20220504091622.5024-1-hdanton@sina.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcbcf0a4-c7a7-4f52-cd23-08da2dcd3e2b
x-ms-traffictypediagnostic: DM6PR11MB2667:EE_
x-microsoft-antispam-prvs: <DM6PR11MB26672215F18C12A90A646D1798C39@DM6PR11MB2667.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O3obu3P++PrW9GBhlrBQ7sjYGuheIHaRG1sUDG1HEY0U6qRM2tNbIpV3PBquI7TOp2ZQ29IB1ck/44EO+kCki0aJeOrmldOMvL5fJMtTm1AehAGHDEYvN1+IjqBkIcEpb9mNg+0DrQz0qJBvU0fNF6h9rwILq4rVABJRVU5blOWUjE17D+JXvgURU81iZewDs8a5wr1LQHOjoK8hfdLcacuaShxIdbW7Lck0ulnAQKFnEY01E+YCH/VoXzxIc2hrh86jeL3S40F7U6NEbQJfSv91Alty4i3ueqLRMI1QtDWLH3k40NLgQW7F5XvBlWE219Nh3CoRh1hRn0QLPumD0HREJ2Jt+qQtZkCP7GEJ1an0NYyM33LTD3DK5sH7t7431B1RMPDYQUNIpncggniflI2sQMXyPNbeWyeEzoGst4PZleF5GH1gPw4/LTbbp+LKgKQQbmikeysQkPfzk62SELUoAGH2hIkCg0vS54aNusoGvA6k6n/fCARLhPvcSBIurMSCqup6+IoBM+nwyYAJUiiv5vFMc/VPphiQ2c1z3Am5Gbmg8y+BNA3ZSgiINv/vzniYt85tuoiU1eo2uUlMngrGia2a7FtHbcwqIw5R+ILPo0TA7so5E3kZRZ9VUldbhVJ1+QYu8SlQPWrD8q8ezG9Zra+m59VWASFCBEmAT+gdRldTUNdoaFKUuOBvQ4I64cE6Re+pUQyN7XeXGWG6lMyIZziXoq7ExZyk3+W7t5WtOB7UUkZegLGEPTVttH8kxHM4R9J4LOwi2mTX4pBo5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(38100700002)(38070700005)(6512007)(86362001)(31696002)(26005)(122000001)(186003)(107886003)(2616005)(66476007)(66446008)(31686004)(316002)(5660300002)(64756008)(66556008)(66946007)(8676002)(91956017)(4326008)(76116006)(36756003)(2906002)(6916009)(8936002)(54906003)(71200400001)(508600001)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXBuOXMwYTFNZE51WGZwTEUrUjduTXVOSWNxT3pZcXQzNVpINUlweWdsZWRG?=
 =?utf-8?B?UU1TU3NHZElNeEs4OWlXdC9aS0pNcVFGdW1rZHVmajVROXd4TFRiMWFvcjJ6?=
 =?utf-8?B?QUZCYk1kR2VGMDdmeDdwd1ZEanh4U1I3V1V6THZleVdQalZhZVNETHVuQy9u?=
 =?utf-8?B?T2pPcDVDVXBzUytzZ2RqaU84Z3BGZzlmZ1RRNFExUldNTmJGOVdoekQzd1R4?=
 =?utf-8?B?b0Roc1FLamhjNVliMEMyR1kyaDNHZnpxMlV5bXhTd1Y0MFd5MkdCUTMrNFJz?=
 =?utf-8?B?WkxGaUowTEJ2RE95UlU5Y1FOWDEvOEMrTGhSdWc1WS9OaUR0RGNoQVBTZ0RB?=
 =?utf-8?B?bnRjbmozUXpKZlhSWVNEU2NWaVdYT09nL1RldjF0YXF0ODFEdHRMdk9xd1hX?=
 =?utf-8?B?MW1VU0xObTM4YnFzZzNReVpST0EyamU1TTh4YWNmRkRzcjlKL0E0VUNKV0Nl?=
 =?utf-8?B?bDl1ai9NRzhNTkVCaFI4UmlIS2FweHlZTWdSQ1EyZmJxcDJQK0E0R2JnckVO?=
 =?utf-8?B?eU8vaGpsS1RzeWxMR0pnRzR6Vm40clduVk1DTmMzQ1JpTUVOb1dhRUp2c2dJ?=
 =?utf-8?B?dk1ldkpZK3pNcE1ibVZueXgzVjVZOHNaaGJweXlWZWhhY0lGUHQ4YjdqSHNi?=
 =?utf-8?B?NHJuTjR0Y1Z1M0RlMWRkRHZqbUhpSHkzZzkxY2tNRkFRUDQyWUZXT0hlKzBG?=
 =?utf-8?B?TjljNFRzTHJESnNIdm0zUnVyZU5zbUxnQ1creXhmWFkxczBKUEtrTTlYaE16?=
 =?utf-8?B?Unlmc0dOSldqcVk5QkJjMUVHR2dROTBJVVp3Q1JrbEcvbzg4a1BIUnNwTUVa?=
 =?utf-8?B?WWVKNjl5aVNZVnhCRGI3YzYxNHFLRkZUSFFqVXZ0NHRJdzBrSGJqMHdVL0NM?=
 =?utf-8?B?VTNDZit0RTFCeTFtemJFSW55VHRCeWRkN0xWR0J4RXlQMHBlOG95UGR2MmMx?=
 =?utf-8?B?L1poYVhlUWkyREhXcVF1TGxJNzAxUGRSbEp4VzZsdjk3dHlMY3Y0ZkZDSG9D?=
 =?utf-8?B?RlExT2JuQkhYSmg2cWRvbUdrRER0U0hPdXZ4cEJzZWRpZ1NGMjFQQVhRQTFj?=
 =?utf-8?B?NnRVZDZJK0thSXRwSE9lcDdlT2lIZmM1alZlZTJ1R1ZtMHRLc3lCcWs5a1Zk?=
 =?utf-8?B?S1BwNGh4bklEcHJ5MURBOHBiRGpCNEYyYzJYUlhYY1VDbmE5OUR1cktTTU43?=
 =?utf-8?B?N2dYMlRhbkpWc3JVNGgzWEZ1aUlpV0oxNURqUGJuU2RZSFU3MWNESGlMM3Ux?=
 =?utf-8?B?N2w2ZXI1QW45UnRXbWxuWHFQTlh2d2tNeUFBeGNXejFsV1ZsMVFvWEppUFFV?=
 =?utf-8?B?SkFrS20vTGdBUVg3ZGt4TW1vN2VWaThUeGFhN2h0QnRBSVJGYk9XZ3hhQjhj?=
 =?utf-8?B?RE42TmdJOXRtbEE4QjhQWG1qbVVyQU52NWtGdUNJWThyMnZET3RPaXo0WFNa?=
 =?utf-8?B?M0xwOFJKcS9QSlFzRW9PZzkzRXBpRDlsaUdQclplMGl4ajZvOW9Kd2hqVmo3?=
 =?utf-8?B?UGl1VmlMUVJ0RFZUc1FsSHo4MlBsTWhnaXVVbnhKZWJ3SVpRZWRiZGd1TUJC?=
 =?utf-8?B?ZlFuMEdmRjFySEdnSk9GRGlIQUtVQ3VKTGIwS1lWNE5GcFc4SDBOcVZ4Ykgy?=
 =?utf-8?B?RGF2YlJTVmhkdkFPNjAwRjBXU0tqSktSUjFiK3RKR1p5dEp2Qno3WU5NckR6?=
 =?utf-8?B?bWVwaVFNbGRMbXRsWmI3bmNNWTkycDVrblBHUUxiMDdNNWRaQS8ySWpUSzNI?=
 =?utf-8?B?LzUwKy9WVG44NzViZXpodnBVZHBZV2VKNjkxUCtWZldBT3NPM1pnMFBocEJm?=
 =?utf-8?B?RVBMNkE4QW1DOVpxazFscjN2aHI2VjRBYk9ZOXQxbmo5Z2E5ckYyVittcU8x?=
 =?utf-8?B?U1h0bUpseVlxUWJtRkVvVHltd2gwY2RxN09PNXVLMnUzU1MrcXNFMEkxZUtI?=
 =?utf-8?B?Ujc0MFRoemRvZWpnbzFPZzMxZDl4VVdRalJrSHFkeHgyeFo3ZVF4Rmw4Z1Jo?=
 =?utf-8?B?L2RiSDhETWd5MjdmYm9lU0Q2blNsUHRzbkc3OHhiTUY4endIU0hOZTFmeG82?=
 =?utf-8?B?OWZoWFZTZmVtalFMZ2VhSGNjclhqNTZzc21tTllobDZ5a1lPRFptd0llYXlC?=
 =?utf-8?B?WGJ1VUlweVhseVF4RVRFdG0va242bUsyenZBYWZtbUVGdFRNUFVYUG5halln?=
 =?utf-8?B?T0tvVHg0Z0NXV1JIeXhnRGtnRytlTExuRUhqcG9KOUcyT1V2aVhpZ2wrbzBl?=
 =?utf-8?B?c3pmSys1ZlZYRFc3VnR6SFVEVlNuVWRjdHVJZGVwY3NVcU5SQlpmQ3hCWFMr?=
 =?utf-8?B?cVJRb0NsWEh5WHdZOUNCNXBYNmhoQUdHM3phSEd6RlMwbktjRitRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <287BACE2B289B84591F94BC1CDC7BE63@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbcf0a4-c7a7-4f52-cd23-08da2dcd3e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 12:54:36.0793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUhoq/VT2/62XcQK/PWM4q9H8LwuwH1JYUS8lAQlU7NPTT0dkXPK4Xm8ZkLCE08ngE5AraWokyv+E4PAGe083MVNbbtuew+PvsimZBz4Mgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2667
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDQvMDUvMjAyMiAxMDoxNiwgSGlsbGYgRGFudG9uIHdyb3RlOg0KPiBbWW91IGRvbid0IG9m
dGVuIGdldCBlbWFpbCBmcm9tIGhkYW50b25Ac2luYS5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGlt
cG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24u
XQ0KPiANCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBNb24s
IDIxIE1hciAyMDIyIDEyOjU4OjU2ICswMDAwIENvbm9yIERvb2xleSB3cm90ZToNCj4+ICsNCj4+
ICtzdGF0aWMgaXJxcmV0dXJuX3QgbWNocF9jb3JlaTJjX2hhbmRsZV9pc3Ioc3RydWN0IG1jaHBf
Y29yZWkyY19kZXYgKmlkZXYpDQo+PiArew0KPj4gKyAgICAgdTMyIHN0YXR1cyA9IGlkZXYtPmlz
cl9zdGF0dXM7DQo+PiArICAgICB1OCBjdHJsOw0KPj4gKw0KPj4gKyAgICAgaWYgKCFpZGV2LT5i
dWYpDQo+PiArICAgICAgICAgICAgIHJldHVybiBJUlFfTk9ORTsNCj4+ICsNCj4+ICsgICAgIHN3
aXRjaCAoc3RhdHVzKSB7DQo+PiArICAgICBjYXNlIFNUQVRVU19NX1NUQVJUX1NFTlQ6DQo+PiAr
ICAgICBjYXNlIFNUQVRVU19NX1JFUEVBVEVEX1NUQVJUX1NFTlQ6DQo+PiArICAgICAgICAgICAg
IGN0cmwgPSByZWFkYihpZGV2LT5iYXNlICsgQ09SRV9JMkNfQ1RSTCk7DQo+PiArICAgICAgICAg
ICAgIGN0cmwgJj0gfkNUUkxfU1RBOw0KPj4gKyAgICAgICAgICAgICB3cml0ZWIoaWRldi0+YWRk
ciwgaWRldi0+YmFzZSArIENPUkVfSTJDX0RBVEEpOw0KPj4gKyAgICAgICAgICAgICB3cml0ZWIo
Y3RybCwgaWRldi0+YmFzZSArIENPUkVfSTJDX0NUUkwpOw0KPj4gKyAgICAgICAgICAgICBpZiAo
aWRldi0+bXNnX2xlbiA8PSAwKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmluaXNo
ZWQ7DQo+PiArICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgY2FzZSBTVEFUVVNfTV9BUkJf
TE9TVDoNCj4+ICsgICAgICAgICAgICAgaWRldi0+bXNnX2VyciA9IC1FQUdBSU47DQo+PiArICAg
ICAgICAgICAgIGdvdG8gZmluaXNoZWQ7DQo+PiArICAgICBjYXNlIFNUQVRVU19NX1NMQVdfQUNL
Og0KPj4gKyAgICAgY2FzZSBTVEFUVVNfTV9UWF9EQVRBX0FDSzoNCj4+ICsgICAgICAgICAgICAg
aWYgKGlkZXYtPm1zZ19sZW4gPiAwKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIG1jaHBfY29y
ZWkyY19maWxsX3R4KGlkZXYpOw0KPj4gKyAgICAgICAgICAgICBlbHNlDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgZ290byBsYXN0X2J5dGU7DQo+PiArICAgICAgICAgICAgIGJyZWFrOw0KPj4g
KyAgICAgY2FzZSBTVEFUVVNfTV9UWF9EQVRBX05BQ0s6DQo+PiArICAgICBjYXNlIFNUQVRVU19N
X1NMQVJfTkFDSzoNCj4+ICsgICAgIGNhc2UgU1RBVFVTX01fU0xBV19OQUNLOg0KPj4gKyAgICAg
ICAgICAgICBpZGV2LT5tc2dfZXJyID0gLUVOWElPOw0KPj4gKyAgICAgICAgICAgICBnb3RvIGxh
c3RfYnl0ZTsNCj4+ICsgICAgIGNhc2UgU1RBVFVTX01fU0xBUl9BQ0s6DQo+PiArICAgICAgICAg
ICAgIGN0cmwgPSByZWFkYihpZGV2LT5iYXNlICsgQ09SRV9JMkNfQ1RSTCk7DQo+PiArICAgICAg
ICAgICAgIGlmIChpZGV2LT5tc2dfbGVuID09IDF1KSB7DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgY3RybCAmPSB+Q1RSTF9BQTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICB3cml0ZWIoY3Ry
bCwgaWRldi0+YmFzZSArIENPUkVfSTJDX0NUUkwpOw0KPj4gKyAgICAgICAgICAgICB9IGVsc2Ug
ew0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGN0cmwgfD0gQ1RSTF9BQTsNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICB3cml0ZWIoY3RybCwgaWRldi0+YmFzZSArIENPUkVfSTJDX0NUUkwpOw0K
Pj4gKyAgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgIGlmIChpZGV2LT5tc2dfbGVuIDwg
MXUpDQo+PiArICAgICAgICAgICAgICAgICAgICAgZ290byBsYXN0X2J5dGU7DQo+PiArICAgICAg
ICAgICAgIGJyZWFrOw0KPj4gKyAgICAgY2FzZSBTVEFUVVNfTV9SWF9EQVRBX0FDS0VEOg0KPj4g
KyAgICAgICAgICAgICBtY2hwX2NvcmVpMmNfZW1wdHlfcngoaWRldik7DQo+PiArICAgICAgICAg
ICAgIGJyZWFrOw0KPj4gKyAgICAgY2FzZSBTVEFUVVNfTV9SWF9EQVRBX05BQ0tFRDoNCj4+ICsg
ICAgICAgICAgICAgbWNocF9jb3JlaTJjX2VtcHR5X3J4KGlkZXYpOw0KPj4gKyAgICAgICAgICAg
ICBpZiAoaWRldi0+bXNnX2xlbiA9PSAwKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8g
bGFzdF9ieXRlOw0KPj4gKyAgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgIGRlZmF1bHQ6DQo+
PiArICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgfQ0KPj4gKw0KPj4gKyAgICAgcmV0dXJu
IElSUV9IQU5ETEVEOw0KPj4gKw0KPj4gK2xhc3RfYnl0ZToNCj4+ICsgICAgIC8qIE9uIHRoZSBs
YXN0IGJ5dGUgdG8gYmUgdHJhbnNtaXR0ZWQsIHNlbmQgU1RPUCAqLw0KPj4gKyAgICAgbWNocF9j
b3JlaTJjX3N0b3AoaWRldik7DQo+PiArZmluaXNoZWQ6DQo+PiArICAgICBjb21wbGV0ZSgmaWRl
di0+bXNnX2NvbXBsZXRlKTsNCj4+ICsgICAgIHJldHVybiBJUlFfSEFORExFRDsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIGlycXJldHVybl90IG1jaHBfY29yZWkyY19pc3IoaW50IGlycSwgdm9p
ZCAqX2RldikNCj4+ICt7DQo+PiArICAgICBzdHJ1Y3QgbWNocF9jb3JlaTJjX2RldiAqaWRldiA9
IF9kZXY7DQo+PiArICAgICBpcnFyZXR1cm5fdCByZXQgPSBJUlFfTk9ORTsNCj4+ICsgICAgIHU4
IGN0cmw7DQo+PiArDQo+PiArICAgICBjdHJsID0gcmVhZGIoaWRldi0+YmFzZSArIENPUkVfSTJD
X0NUUkwpOw0KPj4gKyAgICAgaWYgKGN0cmwgJiBDVFJMX1NJKSB7DQo+PiArICAgICAgICAgICAg
IGlkZXYtPmlzcl9zdGF0dXMgPSByZWFkYihpZGV2LT5iYXNlICsgQ09SRV9JMkNfU1RBVFVTKTsN
Cj4+ICsgICAgICAgICAgICAgcmV0ID0gbWNocF9jb3JlaTJjX2hhbmRsZV9pc3IoaWRldik7DQo+
PiArICAgICB9DQo+PiArDQo+PiArICAgICAvKiBDbGVhciB0aGUgc2kgZmxhZyAqLw0KPj4gKyAg
ICAgY3RybCA9IHJlYWRiKGlkZXYtPmJhc2UgKyBDT1JFX0kyQ19DVFJMKTsNCj4+ICsgICAgIGN0
cmwgJj0gfkNUUkxfU0k7DQo+PiArICAgICB3cml0ZWIoY3RybCwgaWRldi0+YmFzZSArIENPUkVf
STJDX0NUUkwpOw0KPj4gKw0KPj4gKyAgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiAr
c3RhdGljIGludCBtY2hwX2NvcmVpMmNfeGZlcl9tc2coc3RydWN0IG1jaHBfY29yZWkyY19kZXYg
KmlkZXYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGkyY19tc2cg
Km1zZykNCj4+ICt7DQo+PiArICAgICB1OCBjdHJsOw0KPj4gKyAgICAgdW5zaWduZWQgbG9uZyB0
aW1lX2xlZnQ7DQo+PiArDQo+PiArICAgICBpZiAobXNnLT5sZW4gPT0gMCkNCj4+ICsgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgICBpZGV2LT5hZGRyID0gaTJjXzhi
aXRfYWRkcl9mcm9tX21zZyhtc2cpOw0KPj4gKyAgICAgaWRldi0+bXNnX2xlbiA9IG1zZy0+bGVu
Ow0KPj4gKyAgICAgaWRldi0+YnVmID0gbXNnLT5idWY7DQo+PiArICAgICBpZGV2LT5tc2dfZXJy
ID0gMDsNCj4+ICsgICAgIGlkZXYtPm1zZ19yZWFkID0gKG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCk7
DQo+PiArDQo+PiArICAgICByZWluaXRfY29tcGxldGlvbigmaWRldi0+bXNnX2NvbXBsZXRlKTsN
Cj4gDQo+IFdvdWxkIHlvdSBzcGVjaWZ5IHdoeSB5b3UgbmVlZCByZWluaXQgY29tcGxldGlvbj8g
SXMgaXQgbGlrZWx5IHRvIHJhY2UNCj4gd2l0aCB0aGUgY29tcGxldGUoKSBhYm92ZSBpbiBtY2hw
X2NvcmVpMmNfaGFuZGxlX2lzcigpPw0KDQpJcyBpdCBub3QgZmFpcmx5IGNvbW1vbiBpbiBpMmMg
ZHJpdmVycyB0byB1c2UgYSByZWluaXQgY29tcGxldGlvbigpLw0Kd2FpdF9mb3JfY29tcGxldGlv
bl90aW1lb3V0KCkgaW4gdGhlIHhmZXIgZnVuY3Rpb24gd2l0aCBhIGNvbXBsZXRlKCkNCmluIHRo
ZSBpc3I/DQoNCkkgY2FuIGNlcnRhaW5seSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IHRo
aXMgaXMgYmVpbmcgZG9uZT8NCg0KVGhhbmtzLA0KQ29ub3IuDQo=
