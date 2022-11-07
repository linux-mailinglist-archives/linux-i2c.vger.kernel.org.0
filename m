Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5167A61F0E1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 11:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbiKGKhc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 05:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbiKGKh0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 05:37:26 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E46FBC1C;
        Mon,  7 Nov 2022 02:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWA5cPw7138dDriUeJJEA/0Uj48GKATNhSuqfA4GN5mzBraHUH0mmVnRyXUknZx71WwS2f93zM+fzh8Y+zsMCir5QwBSDuXHI6nRvs6qxqFiuG+Fnri+zBRsZEVJqhtRzBDp1/UI5W1HShblF4mSwPhjdl4QT3+Gv5//0X9ObeduBUa7PL7dPdZRun4W6i8Bn9Rbmd21DnR2S3bEkicUUxJR9XIPV7nbJ33MQ7BoNY0JEe7kIa8U+hg9e0pe//EFSno+kVm2ifkA3yt+M1m7lusLthK3mC6BI8JPHVjGL3SoBESmpTpfP9sYWp5TDNLBWx7bToE8dnvJQFeyv5/zqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/ksKtxMJGxHmr7ws2kzE9FR5kvtwcMn4aBBn+ivn1k=;
 b=CuL0/iYlo//dyu1voDO6ITYpbiJgpHzDhV5x7TnpidSNERIzEWG/H1svF4SZ7knjW45EyTzObO36xS4sBl1D+Jgfk/nNLM8yXFme8dpzhxR6l9Aj3lC3Cn6TGo2fUScHju70F+vqJKysFGdqBrhAXGZG7ejRNSr0YCzt5MhiRgWOp11+yt177i7sGdJxOHt3gLfZqwO7veMTwfe2771ynfD+KfZp4VIHRfLv8neuy2zcZb3cU/m3/IBXBObbNr+T44YiRNhGpWo0Y4zkDcthNRMzjvkfd+if0dD91wOR1fr9lfCWaS+XDl3n/vgZVqBAKzo/HC3dXxRaSFQM8Yq8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/ksKtxMJGxHmr7ws2kzE9FR5kvtwcMn4aBBn+ivn1k=;
 b=A3VPC5Btbz+4X7gJQwXNLeTLT+CUTtrppBXvo4AS2Rjhy4JRuu/YLRy2ooE3KyY1g1QwE6AYDH7vfMiLKYRL8rh4ykQgGps9J4fR1y23bnTZspn3UJqZSo8WCDOM/9s6WCJFkhhqY5CsxV7zbdYJprD0eO9awOPz0WXSasgW/+g9XUXhNztI8KwZsoFo64QnASo1jR6LUolboXZf+TAMJFVj+VnhEmRuEfVIVZFDxUNAqGe/2P8X+fSPCr+SFkIp/3iSrzfa7hI84gz1jDP53fXYK2BNL0JEiHyYfJ76lLAyBUjcPtR5Az3a6g1TDcaV30PGM3pUWwqjNDy7KPihyQ==
Received: from PH0PR12MB5500.namprd12.prod.outlook.com (2603:10b6:510:ef::8)
 by DM4PR12MB5309.namprd12.prod.outlook.com (2603:10b6:5:390::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 10:37:24 +0000
Received: from PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0]) by PH0PR12MB5500.namprd12.prod.outlook.com
 ([fe80::ac8c:eada:77a0:e2f0%2]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 10:37:24 +0000
From:   Wayne Chang <waynec@nvidia.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, "kishon@ti.com" <kishon@ti.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        Jui Chang Kuo <jckuo@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sing-Han Chen <singhanc@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 08/11] phy: tegra: xusb: Disable trk clk when not using
Thread-Topic: [PATCH 08/11] phy: tegra: xusb: Disable trk clk when not using
Thread-Index: AQHY53wmctHnk5VjgESBQkiad0Zfaa4wfy+AgALbr4A=
Date:   Mon, 7 Nov 2022 10:37:24 +0000
Message-ID: <10ebde49-2729-4950-a770-97ef026030f0@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-9-waynec@nvidia.com> <Y2Z6Gzd3RmmxMaXO@matsya>
In-Reply-To: <Y2Z6Gzd3RmmxMaXO@matsya>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5500:EE_|DM4PR12MB5309:EE_
x-ms-office365-filtering-correlation-id: 8f36b501-4c2b-4829-2fb2-08dac0ac0ef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qvNDUU76wqaPkbLzq4MqMzaUPgFxiyKvPUY6/r97NPzAs9eVce9NiegG/PhiZcfZ4ttiJsHN7OwCVap9i/3PdligsGpjw88eZ4uAaRxqLg7/BsaGyXjjXsUAuHgLTd1W5DNMihojWoyqhh0cbTNPEjrm4OOeRSXuFaY64LaYPf03oA8I2c1p4/fd0pzXS+RmnROdN3P091DFQK40TNy+gSPlYERGDCzjT7HDFxGmsX17p+HOc6FdNSmQFfLlhGSzEsJfmVtVs7D4BRvrpDa8Je7U6O2k/r3/RdT7TyKnyOouZCcKCr+shd3Opj3ycFLQCOOLIteQsjlNCnUF9f3z0TM2x4khR0GunwwDLc+iSmsCgfGaFGg3+UKI7q0xNR9QGTHlIme4NA9DqCCzXs4eFu2mQe+hgcWAlccMCOgd/U01O/SSpP6RYzeybGN8/6drFwyroTXT/MPfbF1wpB4eLXDEbKxlp7D1vtQrLA20uQXIktwjTY9EfRrQ63NC+HkvZL9IqYVHoixBKXv2Ew6BQN1ggS1No35w6lo2LivXlWJxR3irzPGeS3m3pshIXj2M9WiZ7B1awqLn4htdGJ6ogaCDw4i8+EsJoP+V3tYliGwVTGR9V/R1Vq5doG2vlmZhbFc/K4T2EWGQGzCtZltqK9ZEwUitWauHv2Sxm/X9wfGnzgjHwTCpugtXHEukmNIIbejznHH/ijLLPCBbBQD3HltR2meiF0TwDlqGulQyOaWY4v0qQsIiQ8PzsiSEWUoG4l0sAFGbTV7cdbMLhZQayMHRcWgsf5eYkjxaHGsN/+IA/cV+XplsbLKxs+MkK6Go+AR1vgQXhN6PrbiVGSV3AA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5500.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(36756003)(31686004)(86362001)(31696002)(38070700005)(2906002)(2616005)(53546011)(186003)(6512007)(26005)(122000001)(83380400001)(6506007)(4326008)(66476007)(66946007)(66556008)(66446008)(8676002)(64756008)(54906003)(6916009)(478600001)(316002)(7416002)(91956017)(8936002)(76116006)(71200400001)(6486002)(5660300002)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qmk3bXY3RmdHenFDQ3hkcHV1c2syeFM4TXBWZ3ZCZktnWHV0MVhzMGtFSXd3?=
 =?utf-8?B?Y3h6SFNyb3BvZ1J6K0sxVFZuNEpES1daK0d3Z0xFUHZPYnEwMk1qRnFHUWlY?=
 =?utf-8?B?SzBiU2ExdUhuUHlxaWViaDZGc2Fjdm5hZXpNZ2NSb0lmdDJLMGtpNnV4OSsy?=
 =?utf-8?B?bkhmbVFZVEdsakV2Nk1PcCtUa1FmTndvbXhlVkJDZWxUc2RBL2R1TG9iQnYr?=
 =?utf-8?B?aVVPQ3BpWXNPcjFBTTd6V0h1ajVOT2I5U0Q5bWFjekUxaDZWOGVRamVLdk03?=
 =?utf-8?B?YTFVdjdHQTV1Y3A5bmNRU2FtbkliekJpdzBaQ2FCdFFYb1BBbkl2K3BCUXFJ?=
 =?utf-8?B?RW1HODZhQ2w5OER0ZU13Z1V6NjJBNDVoSW5BRHlOMlcwMS9qMEhTMXZKTmEv?=
 =?utf-8?B?SzB4b0FPTXJRa21McXV5VnJOT3NKQStBdHNod1ZjWTUxcGdMVjdoR0RnbTlL?=
 =?utf-8?B?QkFiZWJhVFAxeHZKNmtuWVRQL2JCQWZDU0tUVnlPY1ZTcDJUcTB1b0I3VFZJ?=
 =?utf-8?B?andKc3dMNERvZVRmWG9rZXdxbDhERThHbFJkZGYweXRNTGt1Q3dXWXRscFZo?=
 =?utf-8?B?VGVOT2QrZTA3WXVsSDE4ZzM1a01BVllUZG95ZHVCdmwvN09QTFh0aGdhRzd0?=
 =?utf-8?B?WElEMEhmNXBLMDNwdXVDRnZLMVBSVWVYRjFna0trMDBhZjFPSmNzcU9NcUFx?=
 =?utf-8?B?R1ljT1ZBUjNCSWRwSGlMSC9POFVFS2RLSFNFRTNFdnZzbWdkV1U0dHJCbTht?=
 =?utf-8?B?VE10WFJwZVZGcnRiUHRRbkpVWEZjTjV2a0pXQnFCckxwT2NiZnJXMDNzUnE0?=
 =?utf-8?B?Q1prR1BsUzl5L0Z6WVJKRk9OL0xHbVl3MFRXNGZ4a051eG9kOGUrck1YTVJG?=
 =?utf-8?B?MFFkR3B4dmo1RWpvem9iUGJreG1kVXhld3A5ckh5Y0IvMnczQVFBTkw2QjJR?=
 =?utf-8?B?azcvRnlXL0dYK1BzTzRkU1E3VEswUThlaWlsVm8vbGF2V3FQOUFoUmlNSTdY?=
 =?utf-8?B?S2xCOHlCR1dKU3pyMldoYzBwZnBDNERraVl0ZlY1U1RSZ2VXR3N2ZXNScHI4?=
 =?utf-8?B?UW92TGI4RTh3Uy92TmVhNkNMRVN0OVBKWkg4N29QMENYWkkyRC9GSVBxOHo3?=
 =?utf-8?B?TnVKdmpqRWxaVnpDaHdydjB4dHVaZmdJT1ZoZEQvay9Ydm9UZnd5RmZOSFQy?=
 =?utf-8?B?STNIN0xjdWZwZ2tmZHJsTW01SEJOajlmRjBaMDlTOWhLeU0va2YwbmRjVkJQ?=
 =?utf-8?B?bVpxSnQ5L2lHUWJhV2ZIR1RDd3JWM3Voa1g0QWMwejZRaWpQOEJSOEF5dXow?=
 =?utf-8?B?OGlvT2FkczVwWktucnVZcjZLSkNGanhIbU5TM3AyUUFyMmNpalVzai9FS3JI?=
 =?utf-8?B?Y0Zxa0NUaFdvV3pQaW5IZGRLdnhsYlExNWEvSjhmbkhDWWNielFOOWRmY29o?=
 =?utf-8?B?WkhGZTRUYTlMenFTaUdqVzU2WklxL253c3dwL3lNUVlPWkp6K21tZU1UQytH?=
 =?utf-8?B?QnQ4bTIreDlweTlEYWxSQmRlQTBCeG12endkUklib1dJZXB2NllVRnFyQU0x?=
 =?utf-8?B?UjQxb1VYamF5QysySUdFZ1A3VFg1OEg1RXhUZit1dTB3cWd1Zk5UWXNHSDV2?=
 =?utf-8?B?dUZTSlBPcm9VbE1ta2szV3Y2bXF2L1FURzcrbVRxbS9JTnZESUJueitweU5N?=
 =?utf-8?B?RzRUMTM2RkwydDdKRGljdHgrTUxsWm5UUFk2cDF1UkZFT21FaXFuRzgyMy9o?=
 =?utf-8?B?bnplWDR4YzYwbGlkYVVvbHo2bkREaFJDbUo4cjh1UWdxY1RoOU9LR2p0WFln?=
 =?utf-8?B?NXdXMUpGaWh2R0cwcC9UZHBkN0ZBT0xlSWNWMWFqU09XM0dWUkpNUUtITTFh?=
 =?utf-8?B?WXg1VTVBSVkzMFFVWk9KbFJUSzZ3Q3VOWFVKZkdsY3c4R2tMUWVYNEtSd1Js?=
 =?utf-8?B?bTBxNCs4N1FjU3U2bE42N1hySmlIamtXTDdRNkNRaXFDSGpUNGlKS1JiaUdZ?=
 =?utf-8?B?Si9xVWJOSFRlajRES0lwekgvVXI4WHllVzZoczlPL3FGWVcxWmsvcVBRNXEx?=
 =?utf-8?B?T2I5NEFFd3c3YzdkMlAyNzRWTG0vUmJqL2kxK3kxL0haZUM3a1JIc20zaUJB?=
 =?utf-8?Q?PxlFKIqebC8sl4OgWV6sVkmTs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <388539951E8A7F439083CBF7B924D6EC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5500.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f36b501-4c2b-4829-2fb2-08dac0ac0ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 10:37:24.3578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xMlXxu/ZGmcWgasinKCn3O36H0cgFU55rAxCHlsyt+6vJb2GkDuhFyYqNKzWkVMWJS/r3mlX4Us9HL7GoG4Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5309
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCk9uIDExLzUvMjIgMjI6NTgsIFZpbm9kIEtvdWwgd3JvdGU6DQo+IEV4dGVybmFsIGVtYWls
OiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzDQo+IA0KPiANCj4gT24g
MjQtMTAtMjIsIDE1OjQxLCBXYXluZSBDaGFuZyB3cm90ZToNCj4gDQo+IENvbnNpZGVyIHJldmlz
aW9uIG9mIHRpdGxlIHRvOiAiRGlzYWJsZSB0cmsgY2xrIHdoZW4gbm90IGluIHVzZSINCj4gDQo+
PiBUaGUgY2hhbmdlIGZpeGVzIGFuIGlzc3VlIHRoYXQgdGhlIHBhZCB0cmFja2luZyBpcyBhIG9u
ZS10aW1lIGNhbGlicmF0aW9uDQo+PiBmb3IgVGVncmExODYgYW5kIFRlZ3JhMTk0LiBXZSBzaG91
bGQgZGlzYWJsZSB0aGUgY2xrIHdoZW4gaXQgaXMgZG9uZS4NCj4+IFRoZSAxMDB1cyBkZWxheSBp
cyBmb3IgSFcgcmVjb3JkaW5nIHRoZSBjYWxpYnJhdGlvbiB2YWx1ZS4NCj4gDQo+IENvbnNpZGVy
Og0KPiANCj4gInBhZCB0cmFja2luZyBpcyBhIG9uZS10aW1lIGNhbGlicmF0aW9uIGZvciBUZWdy
YTE4NiBhbmQgVGVncmExOTQuIGNsaw0KPiBzaG91bGQgYmUgZGlzYWJsZWQgYWZ0ZXIgY2FsaWJy
YXRpb24uDQo+IA0KPiBEaXNhYmxlIGNsayBhZnRlciBjbGFpYnJhdGlvbi4NCj4gDQo+IFdoaWxl
IGF0IGl0IGFkZCAxMDB1cyBkZWxheSAgSFcgcmVjb3JkaW5nIHRoZSBjYWxpYnJhdGlvbg0KPiAN
Cg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KSSdsbCB1cGRhdGUgdGhlIHRpdGxlIGFuZCBjb21t
aXQgbWVzc2FnZSBpbiB0aGUgbmV4dCBwYXRjaCBzZXJpZXMuDQoNCnRoYW5rcywNCldheW5lLg0K
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgQ2hhbmcgPHdheW5lY0BudmlkaWEuY29tPg0K
Pj4gLS0tDQo+PiAgIGRyaXZlcnMvcGh5L3RlZ3JhL3h1c2ItdGVncmExODYuYyB8IDYgKysrKy0t
DQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3RlZ3JhL3h1c2ItdGVncmExODYuYyBiL2Ry
aXZlcnMvcGh5L3RlZ3JhL3h1c2ItdGVncmExODYuYw0KPj4gaW5kZXggMDk5NmVkZTYzMzg3Li5m
MTIxYjRmZmJiZmQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3BoeS90ZWdyYS94dXNiLXRlZ3Jh
MTg2LmMNCj4+ICsrKyBiL2RyaXZlcnMvcGh5L3RlZ3JhL3h1c2ItdGVncmExODYuYw0KPj4gQEAg
LTYwOSw2ICs2MDksMTAgQEAgc3RhdGljIHZvaWQgdGVncmExODZfdXRtaV9iaWFzX3BhZF9wb3dl
cl9vbihzdHJ1Y3QgdGVncmFfeHVzYl9wYWRjdGwgKnBhZGN0bCkNCj4+ICAgICAgICB2YWx1ZSAm
PSB+VVNCMl9QRF9UUks7DQo+PiAgICAgICAgcGFkY3RsX3dyaXRlbChwYWRjdGwsIHZhbHVlLCBY
VVNCX1BBRENUTF9VU0IyX0JJQVNfUEFEX0NUTDEpOw0KPj4NCj4+ICsgICAgIHVkZWxheSgxMDAp
Ow0KPj4gKw0KPj4gKyAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPnVzYjJfdHJrX2Ns
ayk7DQo+PiArDQo+PiAgICAgICAgbXV0ZXhfdW5sb2NrKCZwYWRjdGwtPmxvY2spOw0KPj4gICB9
DQo+Pg0KPj4gQEAgLTYzMyw4ICs2MzcsNiBAQCBzdGF0aWMgdm9pZCB0ZWdyYTE4Nl91dG1pX2Jp
YXNfcGFkX3Bvd2VyX29mZihzdHJ1Y3QgdGVncmFfeHVzYl9wYWRjdGwgKnBhZGN0bCkNCj4+ICAg
ICAgICB2YWx1ZSB8PSBVU0IyX1BEX1RSSzsNCj4+ICAgICAgICBwYWRjdGxfd3JpdGVsKHBhZGN0
bCwgdmFsdWUsIFhVU0JfUEFEQ1RMX1VTQjJfQklBU19QQURfQ1RMMSk7DQo+Pg0KPj4gLSAgICAg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPnVzYjJfdHJrX2Nsayk7DQo+PiAtDQo+PiAgICAg
ICAgbXV0ZXhfdW5sb2NrKCZwYWRjdGwtPmxvY2spOw0KPj4gICB9DQo+Pg0KPj4gLS0NCj4+IDIu
MjUuMQ0KPiANCj4gLS0NCj4gflZpbm9k
