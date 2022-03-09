Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE95F4D2FB9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Mar 2022 14:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiCINMj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Mar 2022 08:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiCINMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Mar 2022 08:12:38 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26EB128DCC;
        Wed,  9 Mar 2022 05:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646831497; x=1678367497;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j7VdN+2X6lvvJjZT4T7zCKIQyrV6Oo6yDIxUnukH/60=;
  b=FdyuHupb8UR+1YXq5xnNikfEsZcinES7w13wv1CVFGhwLXAwMUjk2I5F
   itshRq0YQtMFjsJSzziIywFyLqzgVKdKlJFkqU7O2zUj3qP3FoHFllZ8S
   LB3kIhlkCzhH/wl2+IF7QNp12zJyFNhr8nyhINSsBv4zUmN0jojwV3nh4
   vslE6mRJc+o2BpTtgsTsyPhIjlcvnPQVdJwiyW02MCuyoQLhic+4pRqcw
   JOXYljroQ+THyeKI3/Sk4WQNnTsKiHRiUoPu40r50E2s2+5SkHqEJ8/Uc
   iNg95Y69qXKGD4adkta6sSNEM2VXuY0CozbHU5bUFQgpdxbX9DZhhW7/O
   g==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; 
   d="scan'208";a="156258471"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2022 06:11:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 06:11:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 06:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8LYoTV1pAPwBdXjCfWuY6UUx90pgpYrX+yApub192VqLBYttTwku9gorO1zKohHuvt0nPztEJBYoW598NoQXZcAq0Y7FRpmgzRe5qcvP41kBm44gLObGTjx3WCgLhIgoiV7jf7pioGslVrc0h1lfyx31nJCkX5awMKZKaXkF78HWnndAu2sKP8tflI/WxEbTo9Qeg30dIvNZuufmekjlYYXowdKrA2izvYrPtSFmW721qo9Lg/34Ew/ZI//yDZzwh99ZdUvh2k/8BjqQ6Y6ZnB1pu3k9CkJiQXRK+9+6YJ9deUn1qx/3lqYiFZrsCdIxv8SfhlEsZxYpw6kUqmjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7VdN+2X6lvvJjZT4T7zCKIQyrV6Oo6yDIxUnukH/60=;
 b=eGVNWN0UVMbF7xZ2COrl3C5b2hKButka3yKRDLorN8gUaNGz0A9Uy5bnjadHVKnc4a+/hUfjOIKxaUs7L/ablSjzPpHdbxYx7VHsdMzqIPpvLCoDgLL6bc8YJU97Vv/RL8MMc3D2gtS/F787DThGNQdjZLgPLGdYgsUTPc3lmNtO5FS2cTfqq8+B66tTjpJ/yq0dkRHPWxUMhO8zxvmcg77WhxCUfkgexqQsmN3cATyxGoILev+nmwWNmELsrViwwI0Atknldkv4Wy33BU5Yjq/gNtE/gN8lbR+zAGy5q+2mev81tZqzRFb2GQfcEoNIeAI7ZMjsAXqMotSwZ/TFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7VdN+2X6lvvJjZT4T7zCKIQyrV6Oo6yDIxUnukH/60=;
 b=mpvPq+sVWec8wI6y7O76VzzSguX+xZ6jVg42K5SIHJ1JUhZyKZOJsVb5e0UxC6+ep8uuGwsVz1cMkXLbOpimiagbvvBTypF1AaZBJd2iBAXJp3VyK0KqN5S8b5kFVEg/R9BJVFYwWWqrj1w0tE1AAfUdCKwxyfLYqBLDFQSa7Y4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BY5PR11MB3896.namprd11.prod.outlook.com (2603:10b6:a03:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Wed, 9 Mar
 2022 13:11:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 13:11:12 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <Sergiu.Moga@microchip.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Claudiu.Beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: at91: sama7g5: Swap `rx` and `tx` for `i2c`
 nodes
Thread-Topic: [PATCH 1/3] ARM: dts: at91: sama7g5: Swap `rx` and `tx` for
 `i2c` nodes
Thread-Index: AQHYM7cmzBrXcW4RLkOaOCtEH4u7zQ==
Date:   Wed, 9 Mar 2022 13:11:12 +0000
Message-ID: <03f0c9de-578c-4f4f-b67b-3eabd930d8e1@microchip.com>
References: <20220309120714.51393-1-sergiu.moga@microchip.com>
 <20220309120714.51393-2-sergiu.moga@microchip.com>
In-Reply-To: <20220309120714.51393-2-sergiu.moga@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfd91a13-6889-456c-1f00-08da01ce48f9
x-ms-traffictypediagnostic: BY5PR11MB3896:EE_
x-microsoft-antispam-prvs: <BY5PR11MB3896CE1040BC93E79896D38DF00A9@BY5PR11MB3896.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jY8BGnuIsRiUyWQjaNVWWjsBQ6uTmDR54FTcyjNw/RF2yGgOARP6KnZNFQVgqh11uYI5+ndGiBFYhJE5/KVShrrUGMgu3FMHkmaKX+Bh9w6p87L55/17XzNAsR32+PD8maM0aiCh6WoXqQ1ATPIVor8lUy/ycVDV6fsHn2e6WN4GDOw56Jkoo/ic16ckQHThT4GCr8Q20V3179dteWu6XJmI2nFqvM+0X5EkAAyG5IKBqxm3o72Qz8pHXFHX60R5AfTxmORCW+8C/4n2X8a5DFbR9xWtE6adfaw3q/fXRhHsfM/9D0hOaNs3P+rfoPG7B4AJ0h62T4blMgM4zpT+pGuBPkF65e1uMQYoNzSbD2axoX0cI5Qo1R6q0AU54ytg+jo77O4jjSgeNvsssRybnFxyqbvlPku343XIkRuvm478YF9tWmjBujLg5yN2Er8c5IaW6Wthr+bkc9VQPq7ITI12GitYfJF6HmQSj0Wv8p1p8E1VHGOKRZUyjKjOTZIF+DyAwmL5S4/67BaDiCotzRQTywL3gkG3p35T0DXHvyZEiZB17/NEJj+1bFTJ9x25vBBytn63xzRQie/04CIxTuqK230QODNsbWeK3zWHBIU8U7pJg4MGiW+W3zO4wQsslH3KJZ5bZ1Ql1FPPI9GFuqiNHVQXXwXvfj9JW1jMSrZHlsWDiH6YbSW0l59fnI/oVbivurcWjUjQt4EzM8+aPDOpDC1I2rgq/1xcR3iJ8oGrO4MoBpHDQXEVsnxNX0EPILsbw7abT8mIyrlT8b1PMzLJv6g1dGaLiF22zRzLEof1bJAt3VV8quy4J6aeuPgFHjhc7iTybWIp2ca6xFuB6cTuEAPLHqm3wdsDMN9GV7I0NvSwmwPM90j0jCFAslvz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4874.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(91956017)(966005)(66556008)(66476007)(66446008)(64756008)(122000001)(76116006)(6486002)(66946007)(186003)(26005)(2616005)(6506007)(6512007)(110136005)(316002)(53546011)(6636002)(54906003)(508600001)(71200400001)(38070700005)(86362001)(2906002)(5660300002)(36756003)(8936002)(31686004)(83380400001)(8676002)(4326008)(31696002)(81973001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGhtdUJSU25TblZFNkJiS285WGF2WDBmaFhuT1RCNEtqRXdaVEYzQS9KdGpK?=
 =?utf-8?B?dGxDV0FoWklEOHZZVEN1SnNEL29WZjZ6OW5xWDgzMEJMaDRPdm53MTJDN2pI?=
 =?utf-8?B?eThKcCtZV01TRGVxRGtqZHpBU1dBc1BtQWpYaEZubjMwS3RpVnJTVFJkcnUw?=
 =?utf-8?B?VjNhbld5QVdpdzdLTUYySjVWL3ZoZXFwMTRxUWcvNFZ2ZXhmaDlGbUtiR1Q4?=
 =?utf-8?B?ZWJqRUNwUGVOTm93WXVBWFVsWGV0NnB1RHo5dUhoRzg5OWFGanpGVjJuWXdG?=
 =?utf-8?B?eUdhT20ySlhuNkIvY0JMaGVSU2swdFFlTUNMUm1oa0F5QzNTTkxGNEl2QmhU?=
 =?utf-8?B?aXNOcXFFRnBsc3VVQUoyM20vWU1OTk5XMnM2Rmc2MDd2MlR0L00xSkVkL081?=
 =?utf-8?B?ZDJoTnZKZGZUV0RNY3U2enlnMHZHb2JzN0dkQkJLeDBXR2h5MmZoNFplVU45?=
 =?utf-8?B?cmVlSEJtdkdiMkt5d3RjeDRXU3BoNGV4eUI0VzJ3cHhsdWwrZHhidFRrd2t5?=
 =?utf-8?B?VEFmUitSZ1JRN3krbkQ2Vm5JOVZFZmtBbWhkYlh5ZXNVK3NTVHJTT2tWOWty?=
 =?utf-8?B?MzVPaUZYcE5LRjkrR25QbnVOdFNhbGx1VXRPQmdTZzI1elpRUVllNkl6YTRI?=
 =?utf-8?B?bEZSU21hN3ZqUm55S2dFbXlyYjJLSHVqQWk4NS9ITmZqK0hzYnN2UHp6RmZK?=
 =?utf-8?B?RUlEWlZpTm42cUtKWGlsNWN0dGFDVDd6MUhjZlV2OGt5c3pTbjdzc014QTh3?=
 =?utf-8?B?L2lCNnNkTU5NRnlQTTlPcW9XN1c0cC9TRE41R1NWWWVWOWJjbi91VFFnLzdy?=
 =?utf-8?B?RmpBSWY5L0gxWUpPbko1RCtZK2pBWW84c2NHL1pCSXFPVy82UnY0K1ZzV3Vw?=
 =?utf-8?B?a2JkVGtqRzVLdk8zM01TbitkYzlkbHlFSjdsMFRkZC9Tc2NERTZ5b2p3MHZS?=
 =?utf-8?B?V3oyb1ppWno5WGtyeHFXcHJkZ1dYQUZhZ3pIWEFzMFEvNGFSakNBZnpsQ0hy?=
 =?utf-8?B?SnNhK3pVcmZlMUNHaW05QTB3dHg4ZmRzU1hySlNNbktzYWd6VENTSm05a1Vy?=
 =?utf-8?B?ZkI0S0g0eFh0R2toaStyUU5EYmhlNFNOQW03QWxkZkU1OHZqMVJ5MzVXdzl4?=
 =?utf-8?B?ZGxQNC94UFRqTXFBdzZuNTFRY3ZOMGpVUVdCRGZKb0QwamNXZ3BHL0xpZzJS?=
 =?utf-8?B?M0dCdzB2V09MR1dVTU5tUGsybjNhQkNkS0VaTER6K2NYZEpiMDRsemhtbDRy?=
 =?utf-8?B?Z25Va0dTa3lDblV3dkxQbXFEdUJDQW15QS9QTy9TQ2xkK0xTWU9OZmZwTmgz?=
 =?utf-8?B?bGRjbGFUNWxremgvWW50T3BSV1hwUytNSFNSTjdQTlRVeWFLMmRCQmxSZEVP?=
 =?utf-8?B?anBIbTJVRGxtUE42Qkk4OXdiK2xyTFdRaHA1aDlHUHlQcUpCZm1yVE9ndERC?=
 =?utf-8?B?UXFxNWR1aXVhS1VpNjE1NjN3dWI5ZmZ1WUk1a080UkozK1prUjNPMTA5OGRQ?=
 =?utf-8?B?T0E1TlZZWXBlMVp3dDhXa0xmL0VQWlh1bWdMQlJNOWYxbkZqdUUzYitFOVNZ?=
 =?utf-8?B?Q2ZqS1VkRGw5R0hEZHFOUU1BYTJSa1ByaTNwUEZNeCtON2R1Tk43NkpaNDdL?=
 =?utf-8?B?QkpvN0Z4T1JMdDlmRzNJNjFBTUc0NmxBbWtvMkR6M3NuMVJEbjJma0NVTDIz?=
 =?utf-8?B?WTBTcjRDUlBKOExubXRPcFl2bGhqaSt1Y1dmWDF1WWQvZktrWDFnYzc2VVNw?=
 =?utf-8?B?aG5UWUlOSTVFQ0lKQnY2bjVqOWlKRHRwWmNYQjluYUU3MUIxYVlGR1Y0YzE0?=
 =?utf-8?B?aStJdkdEVFVuckh6aUlUUmxwUlBLRDB2cEVLeCs3UlNCODRtWi9YL1RsS2Zl?=
 =?utf-8?B?RnRwNnd6ZkdqeWZRK1pDY0lPWE0zWitxU0w4bnBoZUJBNHo1OWl4TzJrYUln?=
 =?utf-8?B?SnAyVjRReWRyUFljaUNOSjRHbVhnSGNBb0NtemwyaERuR1RLandNbGtHK2NR?=
 =?utf-8?B?aENuUGl3ZS93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94DF76FC17D3AE43AF4DC4893A01626A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd91a13-6889-456c-1f00-08da01ce48f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 13:11:12.4416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+YcVMJa89mX4cLX9GX4etoHokH1OvK5B1kU+Ebt4Ba3p9ZG/uyH9WC7DlvWH40qBU0PWgLDqrnUTb7JOlgNf4C2faj39gCN+24nyyh0nGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3896
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMy85LzIyIDE0OjA3LCBTZXJnaXUgTW9nYSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlDQo+IA0KPiBTd2FwIGByeGAgYW5kIGB0eGAgZm9yIHRoZSBgZG1hLW5h
bWVzYCBwcm9wZXJ0eSBvZiB0aGUgYGkyY2Agbm9kZXMNCj4gaW4gb3JkZXIgdG8gbWFpbnRhaW4g
Y29uc2lzdGVuY3kgYWNyb3NzIE1pY3JvY2hpcC9BdG1lbCBTb0MgZmlsZXMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTZXJnaXUgTW9nYSA8c2VyZ2l1Lm1vZ2FAbWljcm9jaGlwLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCg0K
PiAtLS0NCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3NhbWE3ZzUuZHRzaSB8IDE4ICsrKysrKysrKy0t
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zYW1hN2c1LmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9zYW1hN2c1LmR0c2kNCj4gaW5kZXggNGRlY2QzYTkxYTc2Li5mNjkx
YzhmMDhkMDQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3NhbWE3ZzUuZHRzaQ0K
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zYW1hN2c1LmR0c2kNCj4gQEAgLTYwMSw5ICs2MDEs
OSBAQCBpMmMxOiBpMmNANjAwIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwwPjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9j
a3MgPSA8JnBtYyBQTUNfVFlQRV9QRVJJUEhFUkFMIDM5PjsNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBhdG1lbCxmaWZvLXNpemUgPSA8MzI+Ow0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRtYXMgPSA8JmRtYTAgQVQ5MV9YRE1BQ19EVF9QRVJJRCg3KT4sDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmRtYTAgQVQ5MV9YRE1B
Q19EVF9QRVJJRCg4KT47DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hLW5h
bWVzID0gInJ4IiwgInR4IjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFz
ID0gPCZkbWEwIEFUOTFfWERNQUNfRFRfUEVSSUQoOCk+LA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPCZkbWEwIEFUOTFfWERNQUNfRFRfUEVSSUQoNyk+Ow0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICAgICAgICAgIH07DQo+IEBAIC03
ODYsOSArNzg2LDkgQEAgaTJjODogaTJjQDYwMCB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY2xvY2tzID0gPCZwbWMgUE1DX1RZUEVfUEVSSVBIRVJBTCA0Nj47DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYXRtZWwsZmlmby1zaXplID0gPDMyPjsNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFzID0gPCZkbWEwIEFUOTFfWERNQUNfRFRfUEVS
SUQoMjEpPiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmZG1h
MCBBVDkxX1hETUFDX0RUX1BFUklEKDIyKT47DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZG1hLW5hbWVzID0gInJ4IiwgInR4IjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkbWFzID0gPCZkbWEwIEFUOTFfWERNQUNfRFRfUEVSSUQoMjIpPiwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmZG1hMCBBVDkxX1hETUFDX0RUX1BF
UklEKDIxKT47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hLW5hbWVzID0g
InR4IiwgInJ4IjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiAgICAgICAgICAgICAg
ICAgfTsNCj4gQEAgLTgxMCw5ICs4MTAsOSBAQCBpMmM5OiBpMmNANjAwIHsNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnBtYyBQTUNfVFlQRV9QRVJJUEhFUkFMIDQ3
PjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdG1lbCxmaWZvLXNpemUgPSA8
MzI+Ow0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8JmRtYTAgQVQ5
MV9YRE1BQ19EVF9QRVJJRCgyMyk+LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPCZkbWEwIEFUOTFfWERNQUNfRFRfUEVSSUQoMjQpPjsNCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkbWEtbmFtZXMgPSAicngiLCAidHgiOw0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8JmRtYTAgQVQ5MV9YRE1BQ19EVF9QRVJJRCgy
NCk+LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZkbWEwIEFU
OTFfWERNQUNfRFRfUEVSSUQoMjMpPjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbWEtbmFtZXMgPSAidHgiLCAicngiOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+
ICAgICAgICAgICAgICAgICB9Ow0KPiAtLQ0KPiAyLjI1LjENCj4gDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBsaW51eC1hcm0ta2VybmVs
IG1haWxpbmcgbGlzdA0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2Vy
bmVsDQoNCg==
