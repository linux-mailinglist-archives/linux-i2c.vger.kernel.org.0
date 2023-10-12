Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0733F7C702B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 16:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbjJLOSP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 10:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjJLOSO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 10:18:14 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C1791;
        Thu, 12 Oct 2023 07:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFB+89MtwXpYV0+xlrpT1R7Sdlh1fb6Fs1CrDFeNrt9FFO+nW1Z1DjOsTFgN/UlLlvfKT3eLtPCoLQiiulj1L9EANTCDPWvwbIOgfxoHiy9ihXC8/XVzJGJhUz41UiBi8W+jduEH3AGdxGDfaD6Ff2zNVMmOfNZmsf4GOtnm94qq1QhzGiUId99z8fVlYmYJszFUiLrDKZvb9cvGVcJGEyckR7awJsFkUv7PimqLnPPZTp6+x+ZB08ejK7TnowHpjKXp2FsEqCh3XPOG5TIc9sSkxO65hWK5Y+z6vDVxMwsXng1L2z9OEcQSyx3+gDSzG6l8gTAaWPajgbytSxK6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnp9tDgopSL741e9o3xpR12fNbL5YwDtSJrN4x1x7P4=;
 b=PFlVr/6C7fXDSXgkh+VHwWU48DmBi/OmhXxbXoGrJL8OS6phm7MkvxM3nt7bwQrMXb3BNLCfxfo37hXPGCWhAI4llKypz/Eub7b/p3Ne2GkiofwnYFdqQvtZdxcVyaJVXGC57R6OxkegzhCRRR+WrdYGCEe00n93yIdciIJPhUvqHOcl/8xyNn1U7G7/vCZFtB7izB75J6Yyk6Tct/0wvLzGS2QT+33SSiwOpth55p7scqJVvb1920ZZLrBJDPEg0KIJxphQThSMqijEoFlUV6e+8mrtvNydoyTo+5nibzaFRW1CUaeOFMCO5/AnJ/DtC9Ujhe0QavfFO9aKuMEeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnp9tDgopSL741e9o3xpR12fNbL5YwDtSJrN4x1x7P4=;
 b=Q/nVUo7MW5fsJpklfdlVzhf0ZamD8x/BEFKue0SziTyaA1ykUQt2+Dod/6JIH/a+D3V+BkgTeh8UwIMUqfIrAfNHgQShGRcupmeG3rr8Ar3VFwxGtaVkaOtWLU12huYk9Fv7RL8eE0KwsVHLyWfskLoi8rwD5JGZKX8K/3VMSdpFxwsQGeHX4LaqHAkROCUf6DsmhV1ntXHoDczXLdrK97+lyuRqbWs+rs0wgNPK+FGwmnPytXqSp34GlLtWDIHeCg/Vad+/HfyrZzKcE0Bftvcve/G8WNbCLII5Mp1IQSrA+Ykff5nJhhcVAbw5MjBm3/Iz+2xFIzDFBg/o9cXuQA==
Received: from DB9PR04MB9476.eurprd04.prod.outlook.com (2603:10a6:10:366::11)
 by DU2PR04MB8968.eurprd04.prod.outlook.com (2603:10a6:10:2e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Thu, 12 Oct
 2023 14:18:10 +0000
Received: from DB9PR04MB9476.eurprd04.prod.outlook.com
 ([fe80::fbfc:dc11:f951:1665]) by DB9PR04MB9476.eurprd04.prod.outlook.com
 ([fe80::fbfc:dc11:f951:1665%7]) with mapi id 15.20.6838.040; Thu, 12 Oct 2023
 14:18:10 +0000
From:   Jean Delvare <jdelvare@suse.com>
To:     "lakshmiy@us.ibm.com" <lakshmiy@us.ibm.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "ninad@linux.ibm.com" <ninad@linux.ibm.com>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] i2c: smbus: Allow throttling of transfers to
 client devices
Thread-Topic: [PATCH v1 1/2] i2c: smbus: Allow throttling of transfers to
 client devices
Thread-Index: AQHZ+vW1cWNDUbRyxki9mDjkT198L7BGN+6A
Date:   Thu, 12 Oct 2023 14:18:09 +0000
Message-ID: <bf0d71383958e7cc88bc84c7e2378f10d3a486f3.camel@suse.com>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
         <20231009211420.3454026-2-lakshmiy@us.ibm.com>
In-Reply-To: <20231009211420.3454026-2-lakshmiy@us.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9476:EE_|DU2PR04MB8968:EE_
x-ms-office365-filtering-correlation-id: 68837fc9-af02-4e09-1257-08dbcb2e0fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aM8sy2AoyL9Yea9jpQXe8pFCnNWLQqKRJZ1Qc8R7yic0y/O4uMExx4rmb5bTyXLLAGANJ3Xsc8fJpOwq9U2ydiRJmCz6tUrjB+k6NDo0soDOE3VkHZ3hogrtDT7xysGLtIFUB04VoweVYd6q5noEt2ifHqvQ+kyhJicFBmK0LrB234h+LHIVXdhJGT0sDdSTy2dWIbn5n/a3X+wLu5q8pYPVuEZ5n/uebSrhc2NDqhiiHzOQddc9nlE6Arm8IiI3Wy6t/XCc00n6J8/OStcwWMczf0Ll94u/eEIQE2LsPGTIdVmB+hj/WQGoR9DJTY+/J7s+7pfTUtyKi2stjU46ocYntBcmePYznxUYEW4hj1Q1EJSChs5mAfl47zbJRq+YrbRz8f+2T9QVTMhWOP9TbLiSFUyawRnapJ5e+1FMn9vSxAN58fx4zqaPkS1VAnd7S9joY28++8T6bE2g1AvZ3tEAOh5DIVYlXuaU0NLIhZ0lRyaq1rcv8UOzfJPz8UNpY17ivxoj1lDa/aXQFSZo23fLm2YFdMhsgXLsW+reR3fBcTyNtoLig3rtRcDlld1JGfWxuf54ylbjFFYyXL+ZJjgQk2uRKrwkY6b0YgfyNflSmPExmB8TAdPVgreYW74T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9476.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(110136005)(76116006)(54906003)(91956017)(66946007)(66446008)(66476007)(64756008)(66556008)(38070700005)(2616005)(316002)(6506007)(71200400001)(38100700002)(2906002)(4744005)(5660300002)(8676002)(4326008)(478600001)(6486002)(8936002)(86362001)(7416002)(122000001)(41300700001)(6512007)(36756003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUg1RkRaQkN1ZW5PNW9Jdk9XTDlGQlNsVlFLRHRnQzh0azBwNWw5bHZaSnY3?=
 =?utf-8?B?L2NVaWNCcHFjTWpKdWlrMFdFZnBDVEs4ZHFWVXZWbjZEcnc3VmZWVlh0QUZF?=
 =?utf-8?B?ZHVHVnBtNTk2L2xLYVh5ZzBDdDhCVVQ3ampvVDU1NWJiV2poQW9ZWGFDeitz?=
 =?utf-8?B?T1VOejRpeW5FQ21oaXpKQkxlV3grWldvUlJWT0dJa1pFOWlwL0lZMU4rT1pB?=
 =?utf-8?B?dTYwM2FmVDBjN0hneWZxY3VaQ1FhL2dYSGJVelEweUZlTTR3bHRTV0YxaUJV?=
 =?utf-8?B?UmtGRncvVUNXWWNMalRpNTRObWdac014d1ZWK2o2d09na0pBNktaTW1FVWQx?=
 =?utf-8?B?cTdMYU8ybmdGa1M2Y0JYN1hpTGIySTNqVmF3VjNJSDJTNGo4VENRNFplcW5W?=
 =?utf-8?B?VjFlbS9pNmp4d0IrZWR3RGJyK1pCb1NkOWkrZTc1SDd5cHJYMFU5SURmRWFy?=
 =?utf-8?B?Q1lTeVNVSmdod1EybTRSR2lCYXpDUGIvTjI2dWkzVVJjeG1lK3NkYnc4Y3Qv?=
 =?utf-8?B?aFQ5aDBUTFhFRmlzdENkakp4QUdFV245bXYrelJTWU85a1drR05CR1JnMXl3?=
 =?utf-8?B?Q21SNEFGdVdMWlMrQWlYa1BvTkZHYjJTS1FVUXI4ZHJyMzNkM2NoRjltNDhq?=
 =?utf-8?B?NTZaczI4S1duUWN1dkgyS3Q3S2xQdlBSdDFQb2J2T3hobTJXaTJkOVNBVXlr?=
 =?utf-8?B?b1BnaVhIWnl6Yy9BTksrWklxTWVkWGx1UGZrRGdEN0NydWxaM1B5QVN5STF1?=
 =?utf-8?B?dFFyZHFTbHBxNkl4b1VFNVFsSDAzUzVkV2YzVkliNHNRYzB4L3JCdXpBL05J?=
 =?utf-8?B?Q0xMTVdobGtVM0JpRW9XSEQ1YjlLcjhsMllwMWVTNTRSWFVCRW9Mb1NoY0dq?=
 =?utf-8?B?SXVuVkwrYUJnUDJoWUFESG9Ra29pYWJSVFQ5SW01Zkd3Z0ordWdSSUdYOG0y?=
 =?utf-8?B?WWlzbkw1Z1ZsZEc1Ulk3Z1NpYjZRSjdOUWN3OTNzSEZJdlBkT2RXOWxNWDFn?=
 =?utf-8?B?SThJbnVGbEVNWERaRVN3SFNFZ2poT1BZczh6M1dwNkh6SUluRUl3TFYzdVVk?=
 =?utf-8?B?eXhTQUVaUGlxaFRka0dVeUZjTENsODV0UWZQNFpIK2NEcjlGdGRuMDNJTmxR?=
 =?utf-8?B?RDNicFdZWE1CNXBFR0xkbVZ4dXpUMmRZVjUvNHl2SjhPQU5vTHExaVYya1h0?=
 =?utf-8?B?WmIvWEZ2VDRtL3VCbkttRmxLSnBTblNMM2JjWjRRY3ZDclNEaFliSWZ4MW9r?=
 =?utf-8?B?c2M3N2ZUYjBjaWNRQVQwU3pSUkxmL0RycGd6VFpRcDhwd2F0TUsxZGh1ZDB2?=
 =?utf-8?B?YXlNcEpDaU1CWkxOdmMxYnNuOENTM1F0WW84Y2FieXV2bE5XTmFtT1kreE1C?=
 =?utf-8?B?L2t2WkpqcHMzZkNESVZEZTZUWDJOTHIrZUMrand6QnJwMUIyM1hqQWIxZnk5?=
 =?utf-8?B?RGJmVU8wdDZOeS9YVHZjMHhWK2ZuNnNFYmE4ZjlBTklUbXhlb09FMW1nbEkw?=
 =?utf-8?B?WXBVYWFzQm9UWDNRcVNKTHV1dnhxUURyOUkraGdtWGxUSmZEaUI1eUxhc1U2?=
 =?utf-8?B?WWtTc0ZTL1VHdm9YR1FQUkw3NWN3VXczeVlnT2hBeTl2MHNJTmQ1YmM0c1g5?=
 =?utf-8?B?bDhkb3F4aDlFbXZRNFRNTlBzTGJ6NWZEbFVTYUdjdU43QVBTVmRtSmk4R1d0?=
 =?utf-8?B?VlFjR3Bjc1VidEVFeC8wcnVCRVZXcVdFNjhURTBzazBHN1JzcjIzZVhRVW5Y?=
 =?utf-8?B?Q3NPM0hKaU1zMnhkUTN0NUpqSDkySzBYanZCY0hNVFNIdXhNdTRxSjBaQzEr?=
 =?utf-8?B?NHZ5USsrRkF3NGxWRHVpKzBPL05oeThVSU9uaGNBRGc5aUZ5c2ZLNnpoekJu?=
 =?utf-8?B?Zk1sdWNGRVluV1FIRjZYSHhaLy81aktUT1VOdFFqNUxlT2x4NGg3SjhvdDFi?=
 =?utf-8?B?NkEySE02c0lrUzZPem5jZnB1Ri95ZWNqRGEva0JTYlJJQnkzZTluRDFuMjZp?=
 =?utf-8?B?OTAyalp4N1NKejdSdFZmQ0hSRGNxYms0aG1na3RKTWpTQnBSaEJ6c1c0UzlS?=
 =?utf-8?B?SjhGbHhzc21zR0hMeHRxZmxCRERDTUIyMmxaRHFPQnppNTdwV0VlZU5nRmxh?=
 =?utf-8?B?TTBiQjduTUdURFBWRnBsbmk3alZ4dk5GMXpidWVHa1NPNXhlamR4TWMraVU4?=
 =?utf-8?Q?vs3BQYSXgnRnC0JCzLt9ylqghvEQ31gGT8XSumVk0Wb3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D716FAD5F46005459B6F5FCF2C7A6381@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9476.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68837fc9-af02-4e09-1257-08dbcb2e0fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 14:18:09.8327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oxeg1c1bsvFtUsiGD2pmDHCGezlH2VncpnNtKcofh5BHp7hLI3lxg5VvUImVkaSshL+UpZJMXnl/JwKhAia+Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8968
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIzLTEwLTA5IGF0IDE2OjE0IC0wNTAwLCBMYWtzaG1pIFlhZGxhcGF0aSB3cm90
ZToNCj4gU2lnbmVkLW9mZi1ieTogTGFrc2htaSBZYWRsYXBhdGkgPGxha3NobWl5QHVzLmlibS5j
b20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuY8KgIHzCoMKgIDggKy0N
Cj4gwqBkcml2ZXJzL2kyYy9pMmMtY29yZS1zbWJ1cy5jIHwgMTQzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tDQo+IMKgZHJpdmVycy9pMmMvaTJjLWNvcmUuaMKgwqDCoMKgwqDC
oCB8wqAgMjMgKysrKysrDQo+IMKgaW5jbHVkZS9saW51eC9pMmMuaMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAyICsNCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDE0NSBpbnNlcnRpb25zKCspLCAzMSBk
ZWxldGlvbnMoLSkNCj4gKC4uLikNCg0KTm9uLXRyaXZpYWwgcGF0Y2ggd2l0aCBubyBkZXNjcmlw
dGlvbiAtPiBub3QgZXZlbiBsb29raW5nLCBzb3JyeS4gWW91DQpjYW4ndCBwb3NzaWJseSBwcm9w
b3NlIGEgY2hhbmdlIHRvIHRoZSBjb3JlIG9mIGEgc3Vic3lzdGVtIGFuZCBub3QNCmJvdGhlciBl
eHBsYWluaW5nIHdoeSB0aGlzIGNoYW5nZSBpcyBuZWVkZWQgb3Igd2hhdCBwdXJwb3NlIGl0IHNl
cnZlcy4NCg0KKEFuZCB5ZXMgSSBrbm93IHRoZXJlJ3Mgc29tZSBpbmZvcm1hdGlvbiBpbiBwYXRj
aCAwLzIsIGJ1dCB0aGF0J3Mgbm90DQpnb2luZyB0byBtYWtlIGl0IGludG8gZ2l0LCBzbyBpdCB3
aWxsIGJlIGxvc3QuIENvbW1pdHMgc2hvdWxkIGJlIHNlbGYtDQpzdWZmaWNpZW50LCBub3Qgb25s
eSB0aGUgaW1wbGVtZW50YXRpb24sIGJ1dCBhbHNvIHRoZSBkZXNjcmlwdGlvbi4pDQoNCkkgd291
bGQgYWxzbyBzdWdnZXN0IHRyaW1taW5nIHRoZSBUbyBhbmQgQ2MgbGlzdHMuIEkgY2FuJ3QgcmVh
bGx5IHNlZQ0KaG93IGxpbnV4LW1lZGlhIGFuZCBkcmktZGV2ZWwgYXJlIHJlbGV2YW50IGhlcmUg
Zm9yIGV4YW1wbGUuDQoNCi0tIA0KSmVhbiBEZWx2YXJlDQpTVVNFIEwzIFN1cHBvcnQNCg==
