Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7444B9805
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 06:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbiBQFMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 00:12:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiBQFMb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 00:12:31 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1903E119410;
        Wed, 16 Feb 2022 21:12:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcLOx3tu+5ZwaGyWCJjSSqcIWIdHtZLJ1x3IhFGHEMRbkVpPVAkPHkPND9AQZ4bwQ+6dlX3ZkZsNrZfyIHNhZ5f2NpgWZOWcoura+IDt/XpQkLADu3iDnh9Z5LVRJXahX7onFHIXx/Wp09RuXyb27w+doHR9O6RYX6wcI6clkmoVl70ENmNIn4Au7O5QrU85J8lPeCLCtD3cOAGuNLsq+05ign4cWqXKBa7K8ylJNMZVJvVLr2RYWmCBKd5SKFdbIRulZ+CwcXVo77v0jP4LefslafmL0qPi5QNro43MwDuxMnAWPa1+FiHmdfSmW32MBLCT9dFMufMWVG9gYmaAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFRdHBEvuiR/+q4/jO80+42UyFoxc1pVrRqJeCCUabc=;
 b=UahJ8VJtJCy1xc0m8I4GRdYWFGjlsydTVdOJ9aYaePJOVGJzZlBMtvwpzqitNv1tb4r0S3iBwL7isupZcQe0u573vqhVqbnoUO7pWLpuEsLGw2lfYRt9LAedjcX9XcziSeH4riQAhUkJ9UxwWRU2kzah+1gQrgAZ/ZEK61ZbHXQ9W4jQUpzYjriOYIWNUMQ1znNpuf6edDt8qo567+SGGF6tqVz1802OHtd8tZMtlSu0MoXk9j0lGg4cJ2QLcU0Cr/oZ0GAKKSzpOhWhNSABrbesuQePEjnGd++nEfsmsR6ZyhH3jo8zd4m1T6glwSK0bfmpz1yH/Gu7485K8A+YWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFRdHBEvuiR/+q4/jO80+42UyFoxc1pVrRqJeCCUabc=;
 b=q45NnZRJ728PjTXrPnt5H5xYOmVEHnlLJ02uXdpXimDGaWGkryC1Gvz2z7cdItMB19HyFe7yEIZ5Hz7iQB/I43xZNfKTWbfGjXocUnXzZhHAhMhtLvLyBbN6SUMZ6L5OWccOsjef5+WdNBNCPNhMv0+tAraAHSLAAN74rZWM/zg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 DB8PR03MB5962.eurprd03.prod.outlook.com (2603:10a6:10:e9::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Thu, 17 Feb 2022 05:12:14 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::fd01:86fc:2baf:1ac4]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::fd01:86fc:2baf:1ac4%6]) with mapi id 15.20.4975.012; Thu, 17 Feb 2022
 05:12:14 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
Thread-Topic: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
Thread-Index: AQHYG1EY4H87Ne8uH02ywQ7La/LVCqyJhBcAgAxm7QCAAVgygA==
Date:   Thu, 17 Feb 2022 05:12:14 +0000
Message-ID: <9327df42-a4db-e2dc-b02f-0430310d551c@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <20220206115939.3091265-3-luca@lucaceresoli.net>
 <CAHp75Vejw86kLUJfwXR_kUn+=UCaixbcy=epO8Foe=9S2LqXTQ@mail.gmail.com>
 <f412980a-4e41-54c7-f000-f826e015f6d2@lucaceresoli.net>
In-Reply-To: <f412980a-4e41-54c7-f000-f826e015f6d2@lucaceresoli.net>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8691d16-3016-42a2-bf95-08d9f1d40f6e
x-ms-traffictypediagnostic: DB8PR03MB5962:EE_
x-microsoft-antispam-prvs: <DB8PR03MB59622749A985E300478AC633AD369@DB8PR03MB5962.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z9dmzqjUrvU9GBzUFpPwrujssH17Tek49Y1D5VEBLr3ix4ltkKenoKOrhZNzYJ/BpWAn/4+DyBiAsgxGEqF8EVig0o14dNQbZUeeX6AMKoDl+KQ5X5QUwAR+Lvrs6LhjjJYSVnFIVgvVgoYzb36sQy13gRdZvTQAtW4IMps9ydjXldtWsiQd8C6i0aT3ou1yiRfDaMzopTTbciMr78j4E9QRM1KIxsgWfG3JyeqoMeQwsD1amsm9gYMstmRnn5az5EPTmliHzGX6FSii12BUaBiSoAlHlx0Sn3/TxJacQ8WIAk5WRQOvYyXEzMrVZBG+EBeZkUbRsbK0FMaNKedEKvES0oC+ECjsLmA1dNX2f948SpXWPHxl3z9z6KmJqHlJRsFJgjChib5jnr3U6uVBQ4QuqfQe7xX7aHXzp/Ndz/+wyyI2rObykTQjW5Teloe9KNwNYmOQVx5HHXORHVoUag/rQDBhGkT2+C2Izh+OWClOZEJMt2ijFStiiTI5+QzpfqjAgw7qZHYFZpSmiDsLuHXaNtkZe8ydQSB8xjmgrc9ScaDavvzFUdob2iozH2tLDvaV8KPLbExNcWfhAV988N4LD5uo8+mSIWSaCPUcs2vJ5vhu/VttqINCftBt/wwySpyW6X53P1HM48YRhWL1w/lj50LGfF/unuJU4G1Fc0c0a9993GBZd+CVQPG/1/53Lm/tm8FqDE+uGoUmceMy1qOON9F76sbHd74X8ehhZRzcSxxi592zTY3hV6lRDp7kqqY0xi2yzqSwca0FkM7vHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(83380400001)(8936002)(186003)(71200400001)(316002)(7416002)(2616005)(4744005)(8676002)(76116006)(4326008)(66556008)(64756008)(66946007)(66446008)(66476007)(31696002)(38070700005)(86362001)(2906002)(122000001)(54906003)(31686004)(110136005)(5660300002)(53546011)(6512007)(6486002)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlNkY1NzYnNMaHJuQTJKaGN6OG50TW1RSWh3aVNnaXQvVE1adW4rYU0wMDA0?=
 =?utf-8?B?MWI3VFNYYlhUQ2VuaUIwc1QvcjJCdXJMSDNCRWtVQmpsYjJ5dVBNL0kyR0h3?=
 =?utf-8?B?b2RmdDVNTzMzQ3J4Rm9mSDNUbnpvNVBad0NUYUE3M3VvcHBFc04zTmg3di9l?=
 =?utf-8?B?MERRT25VbW15MWdIUHNKckhpN1lxNWdqNVZJQ1VMUXQ0eWhKTzZVZlc2SWM4?=
 =?utf-8?B?YTcyNnRTK0t5Z3RFT3hXeW01VFlRT2xwNUFscjN3Tjd2U25OOG1CTjdmam9n?=
 =?utf-8?B?VkdFS2drU0ZtQnRSYzhERlN3dUFKVU5udEl5VERQOGRqeVBTYTBvY3R1bE96?=
 =?utf-8?B?V1p2WDZ6SXUvRE1saDlMditSV2FFMS9oSzdUMlYxQ2dwUFB3VTFCZEJla0Vk?=
 =?utf-8?B?TXNSc0MvV3FvcmhHSENIQ3pudTljVWl0a2FjajhiUWc5SWRtenVMeDN2U3lM?=
 =?utf-8?B?bUpBV0x5ejNvR3M0eUd6QmhMSXE1OGNQWFRLQU03S1JzbHIvRUc0MnIrbmJv?=
 =?utf-8?B?VFJTeWwzT3hwb1JCY1lXaFUwdmVkQzBvT3NnQXlhR0IvRTcraG9YN2ZtQzUx?=
 =?utf-8?B?eE9INU11enUyQW1qb0UvNUFJcG9kdnVScERnblNIMVpqc04rTExvb1UwRlUz?=
 =?utf-8?B?anJVRWJGVTdJaDZSdEdvTXU1VUhaKzhCVCsySTdKb0swWDhVVGU4UVlhYU5O?=
 =?utf-8?B?bkYraTNCazNUWjF3WW1XZVdYSmpvcXArUlYwVUNONmQwZE8rS2NpUXpRWnd1?=
 =?utf-8?B?QmpSVnRTYUpUU0NMUEU2RElZdmN2SEVaUnNXUDBaaXhFV2NGbkcrYjY4b1Rl?=
 =?utf-8?B?MXEwQ1oxVkVBMnBWbytCUmFCV0RBZlFCaHlmS28rd0JjcXVUZGdBaVYrb2s3?=
 =?utf-8?B?Rnl6OFZ0dlYrSHRwaFRSYUI3Z3UzdElyRVhQMXpDdFRaYSsyQ1NQR2VDSWtx?=
 =?utf-8?B?Vk5oaE5Sc2JTTHVPTEZBOGlIa3Q2RmxLRWZxZHVpejBueEVhVkNXM0R1SVp3?=
 =?utf-8?B?UlZaVE11R3BBN1pvMXY5NVE1dTRZc0tiWnNMMzZPM3RSd01COTBET2k0b3Uz?=
 =?utf-8?B?cFAxVGZ1bFZFcUE0aEtjdGZ0YjZTeTFXWWRiNHBub1RCZ2g3MDJjWURLZ2FM?=
 =?utf-8?B?N2pCVHBHWGVMbmJlQkU3NndoQ1Zsb0IrWi9Cem1OVS8xb0VXcUFVTC9CU2JD?=
 =?utf-8?B?ay91Mk5LakN6OG5JNm40QS9sbVRBOWh3MUhqUlNiQlpjQTh5SHVGcXl0WVVt?=
 =?utf-8?B?anpaN1ZHU3loN1FJYUNBQ2o5R2p0NFZ1Z1FQYzdOR0xiZTBIeEZ4cThCdmc0?=
 =?utf-8?B?VHZCa2JHa0pSYVlRL3VKR0wrazFhYW4wN09maE1QRE1wK2Q4NURRcFYxRDh1?=
 =?utf-8?B?M3VldW5wcnlCQVFCeHVMZ0RwWU9ySklqU2JveEltTkNBak1aMFdWZmpxU2Q0?=
 =?utf-8?B?R2MyN3dwKzg2ZGNyUlJNVUpaS25vMDMvVnkyQ1E3NHI4NXc2R0xBa1h5Vmh2?=
 =?utf-8?B?M200NXErc3NLeUR1ZlRoa0dKWGlyVjdvbWlyWjM5R3hDNzJBSXBGNDNpbGh1?=
 =?utf-8?B?NzJpbGR6OTAvSGxVMnVuTFVna0Zab1NnMHFjbStSU1k4a0lMOEp0VXh0Zlpw?=
 =?utf-8?B?S0RRM2VJUnc4QnNubXljWmQwVjdJWHFHcktjWU4za213ZUtVRE9xTElsRWRY?=
 =?utf-8?B?QmoxN3J4YjFIaFRPdmVPVGNqQzZnbENPZ0g0QjUvaFEwVkI5UldXdjJsclFl?=
 =?utf-8?B?Y09GWVBuM1R4eTJrc3F4VTVEbUtiaVJUUWRNSzlTWjUvRHpDL0s5QmdmSXBk?=
 =?utf-8?B?UTNRMEpMQmc2WUF6RmRmSm4waUlpZkRqeG1haUJrRzdrZEJleU0vdzRHdWE0?=
 =?utf-8?B?L3g4UTcxbzk3amFJNisxM1h3Rk1wTHpkcnJWK3B6MzYyWldicVBja09uMVNs?=
 =?utf-8?B?ZTR4MzdmanhNakoreXFTR1VSZHVIRnluUUNsdnJ2cmpzWTJxenExRUR3Y3F3?=
 =?utf-8?B?QjBZK0U5WUtIT1NjYW56MmtFMStSc0s5dk15VWdmbVJxeWNRb1JabTI2VVNr?=
 =?utf-8?B?TTVJSitoRmVHUEFIVFFnejlJY2Y4dE50c3hLWXU4ai9YSnVOUXFQTDFScXkr?=
 =?utf-8?B?N2RNYlM3SnFaM09lbjZhOVpucWNkbCtPZUJyVTF6NW0vdXRjaEVPYnNLUFRp?=
 =?utf-8?B?VldiQjFFNmVrZkdaaGw2ZWZ4ZmoyMTN3UVJ1a09TOTdvMGJKcGQ4Vjd5amJl?=
 =?utf-8?B?Qit0VkU5Q0R0Q09ldU1rQlpTQXNlZmdBV282N2hLM3M1ZlBhY1lDVWxDT3lz?=
 =?utf-8?B?c1EyWDU2ZGx4YjIwaFhraXJaRVN4RlVGbWI3b2hKb2FvQmFTcmpVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB72978407EC2D46AA84CFF4B67ED32B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8691d16-3016-42a2-bf95-08d9f1d40f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 05:12:14.2506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xd31xuX+WhON1nSksZPYXApUgS8GVf9PCzTQcwnC54ZeCXlGmoChRi5fq303/gF6bXYYc/VX201W1LxO5XCgLRJw/ixYJXHJ97ZC3SvM0f1VQNaJZupyiUXRt+B7tvfg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5962
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMi8xNi8yMiAxMDo0MCwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gT24gMDgvMDIvMjIgMTI6
MTYsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+IE9uIE1vbiwgRmViIDcsIDIwMjIgYXQgNzo1
NSBQTSBMdWNhIENlcmVzb2xpIDxsdWNhQGx1Y2FjZXJlc29saS5uZXQ+IHdyb3RlOg0KPj4+ICtj
b25maWcgSTJDX0FUUg0KPj4+ICsgICAgICAgdHJpc3RhdGUgIkkyQyBBZGRyZXNzIFRyYW5zbGF0
b3IgKEFUUikgc3VwcG9ydCINCj4+PiArICAgICAgIGhlbHANCj4+PiArICAgICAgICAgRW5hYmxl
IHN1cHBvcnQgZm9yIEkyQyBBZGRyZXNzIFRyYW5zbGF0b3IgKEFUUikgY2hpcHMuDQo+Pj4gKw0K
Pj4+ICsgICAgICAgICBBbiBBVFIgYWxsb3dzIGFjY2Vzc2luZyBtdWx0aXBsZSBJMkMgYnVzc2Vz
IGZyb20gYSBzaW5nbGUNCj4+PiArICAgICAgICAgcGh5c2ljYWwgYnVzIHZpYSBhZGRyZXNzIHRy
YW5zbGF0aW9uIGluc3RlYWQgb2YgYnVzIHNlbGVjdGlvbiBhcw0KPj4+ICsgICAgICAgICBpMmMt
bXV4ZXMgZG8uDQo+Pg0KPj4gV2hhdCB3b3VsZCBiZSB0aGUgbW9kdWxlIG5hbWU/DQo+IA0KPiBJ
c24ndCB0aGUgbW9kdWxlIG5hbWUgd3JpdHRlbiBpbiBLY29uZmlnIGZpbGVzIGp1c3QgdG8gYXZv
aWQgY2hlY2twYXRjaA0KPiBjb21wbGFpbiBhYm91dCAidG9vIGZldyBkb2MgbGluZXMiPyA6KSBP
b29rLCBpdCdzIGkycy1hdHIgYW55d2F5Lg0KDQpUaGFua3MgTHVjYSEgSSBoYXZlIGFsd2F5cyB3
b25kZXJlZCB3aHkgcGVvcGxlIGtlZXAgYWRkaW5nIHRoaXMgDQpzZWVtaW5nbHkgdW5uZWNlc3Nh
cnkgYm9pbGVycGxhdGUuIE5vdyBJIGZpbmFsbHkgZ2V0IHRoZSBwdXJwb3NlIQ0KDQotLU1hdHRp
DQoNCi0tIA0KVGhlIExpbnV4IEtlcm5lbCBndXkgYXQgUk9ITSBTZW1pY29uZHVjdG9ycw0KDQpN
YXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmljZSBkcml2ZXJzDQpST0hNIFNlbWljb25kdWN0b3Jz
LCBGaW5sYW5kIFNXREMNCktpdmloYXJqdW5sZW5ra2kgMUUNCjkwMjIwIE9VTFUNCkZJTkxBTkQN
Cg0Kfn4gdGhpcyB5ZWFyIGlzIHRoZSB5ZWFyIG9mIGEgc2lnbmF0dXJlIHdyaXRlcnMgYmxvY2sg
fn4NCg==
