Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9126544EF6
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 16:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241077AbiFIO2O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 10:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243173AbiFIO2N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 10:28:13 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140134.outbound.protection.outlook.com [40.107.14.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759B41455AF;
        Thu,  9 Jun 2022 07:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXgjO56GYMIbtYehmoyqc7BRlKqTMlhnPh9kkInBFTrVqgrtHSETHsrRWg8YWtzb7cD6sf04qjAsdwrpBBx2o/ifeF/MF1gXppm9JAJdeHtk6rThVQGH4UsdoojzPH5valEbJsO6hJueiSwuL9OQDkRV7zDzfYboQY/PvfYFWPM/FcGApBpVV6uRxhcKvVjVpCD/voBhHCDTXV49iEBJu9Dn36Q5nJKRbjEZq5GIg8cB4VKPD4VfYzKkv/B+h2POKdv1hzIvmGdM7WT0nTFTySIf2c3ei8oQ22pM0X0xKhi25QV6C8iyWAnkdUUpbbFGUELn6kT84gUCAu2maLX2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rtk7T/OlZgK74DQgDYV0F4gCLVpyCEWDknuPccyHfQI=;
 b=RIIsZEkWiPi4apbN5NZL99l9pubEChYhcY3fS82CrymXqIVSbv2+j6ir/NcF+29zLZL4J52Mocld1WY6v9PtbXyxDL8+5kOZU3vtkyR0GOItaiXBDZRwFyzi0G9+mRiN4tGnX9DnSfdnTzogtQnfBtEKHdImODbWjzO2b6BafE/Kt92GsOwhTTV/556/0v7r/2asOeuv8oQ2TLaKHq0ZBCc33DEJg9nJnshlWeYrBSGxvaIrAZ9oQJX/s4iQIN1gUR8GK8XJjNwsU8K9Qn9NkluYc/2fvnL7x/ZvHiRx6ouBOx+33DoHKVNv5cIEncHXQTwoFc23EzayJv8dEuls1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtk7T/OlZgK74DQgDYV0F4gCLVpyCEWDknuPccyHfQI=;
 b=bR6CNekIjqYqsR6csCqcSQKM0jMuLtoglDYGj5CJEABAYD+sbydk1TIxeLHIardZo1ni8m91MH1XhwiOiQ80QGCE1CykCtkgCrzlyJ/lAGkg7eghW+6QVaXgvfNYa6/hgPTY4G+SAQuz2L/y0NOMQy6mSYJpdzH1jbSjjIm1YBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM4PR0201MB2050.eurprd02.prod.outlook.com (2603:10a6:200:48::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 14:28:06 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::6c12:cd95:b34:7dde%4]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 14:28:06 +0000
Message-ID: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
Date:   Thu, 9 Jun 2022 16:28:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Kamel Bouhara <kamel.bouhara@bootlin.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
From:   Peter Rosin <peda@axentia.se>
Subject: Regression: at24 eeprom writing times out on sama5d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72ad6224-162a-49b6-a6da-08da4a244518
X-MS-TrafficTypeDiagnostic: AM4PR0201MB2050:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0201MB2050765F2839BFE859E5BA58BCA79@AM4PR0201MB2050.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMrqqVNvaciglA9jbVZ4KBUoEtib+N6Hs61zO8h6x+KnOOOH583FQlgtbGcQ3xNBJRjKPdqxBR47hYvYB0/vmiA2pjsI75QkZGJCdJw/gWRVZBEntZKh0aCUov+EPY8vi2e5xwrLxzeiSN6PIifuIwh5jmF2DIMbVn9SLzkweHbOWFpOOwkdsztiS+2f1fKZDnCJja1myJ9GVz1VHQAgiuNpsi4XgmqhsNnyd9/ecrDOi8YtHOQOSwA6nziaOExfGErOykWSMVL4Y82PKXec2cIE7bZ4j7SNFlHaFxxXmM4ROprYpCLgByWNAdKTcB/Ml6c3th/vQvJJwsqEIQkt6T7pyNwD55OMRgkQpw0UkRLhtm179SYGlOPhfl4IvWkBjaSVZN9ePTnyG/PgBxGG0tSyGfOv0eax/J6+tIxvBg2TgF2jxq6Ebs9SI6RBD2GhtMh1zO1LN1OpsC5mW88F4GR9pj6W15uvODQGjdps93zEAVj2rG1LGQjFS1ks4F+vOe2fQjYaVguIo709qv887vHPYAjzTb54WNYGaxY43pAtQaig3lZVPXiAAwnUh/afzql2AeRTT/x23Evc7gl2J72rz6cpdfwHJy7RMeViHMnajJLv3XpKvecrsBKkNFBVkNfbM7B27NJwJ/YPTK3aoQHuItMIOOBRSEOAk90TM+t/TCTxR++z/ptjKuOZa+peeMyahmcxGJlvQpJcHV/XpqNPzkf7WfQCEFWONAVtQ04=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(346002)(39840400004)(396003)(136003)(366004)(2616005)(41300700001)(316002)(31696002)(83380400001)(26005)(86362001)(6486002)(6512007)(7416002)(508600001)(31686004)(36756003)(8936002)(5660300002)(66476007)(186003)(38100700002)(2906002)(8676002)(66556008)(4326008)(54906003)(6506007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3U2YkhkWTIxRC8vSllJWnFPTS9OK1Q2amdaTVljM0svWU5BeFBFYSsyaFh5?=
 =?utf-8?B?TG0reUJjNFFLUU8xM2M3eXFxK1Y4SUE3dW9mWHRCaEl5Zis1KzUvMWdVaE8z?=
 =?utf-8?B?S1FLNEhSMnRyWkN4TXdqV1ZsdkJ1Y3VZd1M0NFlJMU9ZZTBpalF3V3JjZEhZ?=
 =?utf-8?B?YXpzR1ZIdUpralUwaFQ1L09zbTVrZjRSWkV1a1V2M2l3TVVtTHhvdmZMbnQ3?=
 =?utf-8?B?azNSd0ZNMXM4UmJ1OEdkWUliWVhMeDdKaDFwRFhlMDgzNk5TbzZ4bVY3M1FF?=
 =?utf-8?B?U0xJcjRyUWlNc0xUUVVXWnFvWFM0eWl1cElIMEV1VzlPejNLbUJNV3Z6SG9o?=
 =?utf-8?B?NmVodHowNU40bEdwcGY1ejV3clVtSUE0b3I4ZzNJVjFKOVJIaXg2SXhUYUov?=
 =?utf-8?B?Q2IrekE0V1Q4WDh1S1F3RXE1citYN00wSG5FVkpVa3U2RW9PVDkwM1JRSHdS?=
 =?utf-8?B?VCs5aVowaW1jWEVtS3pWNElPTnFqeVBINTIvb004WFVsWVo1d3cwc0F4bXht?=
 =?utf-8?B?SEFDc1I4RU0ydWpOdzlhenNKc3gzaFdrSHlIcktKTjdaejZ6TnpCeVVSOEdQ?=
 =?utf-8?B?azdoYkFXSGtsajR5b3RwOVBxalkxR2hXcWdMWExBLzNOdFl3aitIUmZHM1RF?=
 =?utf-8?B?Uzk3USs3SE1vbFJoWElGWnN5RkVsbmY5L21vNitsRFFyZUNRMHJkcGRjY2Vv?=
 =?utf-8?B?YXpyL0RZY1NzcTQwSEZ3TytFOUUzanVPQU5NVDdSNUFsMTdGN1c2RHdCNXRr?=
 =?utf-8?B?WVA0c2RyaE1ZSHNzejVMTXZDRlJZakJzM05YenNmNDlabTNPZXdGdG9DUExz?=
 =?utf-8?B?ZDVWcDRWaGQ3UDZkRUlyNHYrRU9tMTdWeHdWVnVyV2o5VkV1VWU4WTBJWnp1?=
 =?utf-8?B?bjMvNDdYc29iQlJCK1RCWmQ5UFJPYjR1RHRGZWEyOXdDUTRuTlo0UjJIdnNM?=
 =?utf-8?B?blN5dWo2L1VkOHBlQkRsSnd0TTl4bHk1VUVUWlQxLzBTVmJDRFl3YUYyNkhT?=
 =?utf-8?B?VDljWmdSN0xkZzFFVFplazYvRFJDbmQ2TnpxdWZyd3MreW1JWjdDNTlUc21K?=
 =?utf-8?B?QUJEdzZiQWdmVVFDSWpQWUlMVVNxOUtlSFFyWnh1VENhREdmeVlKVVhod2t0?=
 =?utf-8?B?RFFaT3NZK1FEMk9hK3hObWwrc2x1WkNlVzlJckNDaFNIeGJVc1poNUZTcGVy?=
 =?utf-8?B?KzRjaTRISm5aQ0xRNkwrZDdRK0dpOTBXZFlwQ1Rxc3lIcHhWK0pBbk9UeEs0?=
 =?utf-8?B?YmtidWtjKzZIdW5yS0R1VzhJVitwU081S3NGc3kxbFA4K2VCK2YzbXVVZUli?=
 =?utf-8?B?Q1k5TzYvbDljbUp6ajZnbGZWb1AvaVZRSEQvVDlVTWdpdmJNMHdQTzB2UDZO?=
 =?utf-8?B?dTl5N1h4RVpsYzIzY1BMeXhNQkdFVkU2bnZUR2FUaU1JMGN5Z0FXSENVb0dN?=
 =?utf-8?B?dllxUE1QcGMxbFBmbmM0cm12OHhrTVNpQzlyajlJOFIyYXhDM3ZvUWhOTVFa?=
 =?utf-8?B?WHROeTZPS1Zhb01KRU1sQ3FqT2RlbmtaNEtNbHJUODA4N1cyU0dPUndicEti?=
 =?utf-8?B?SWZjN0lYcWRkZlpLZm53WmdqOG9IcGQyb1FaWncvUmZhVVkxTzJEVkFTRVRw?=
 =?utf-8?B?UlJEL3BPUmhURC84c2xzMk1NS2x1Q0NsR0xPNmkyTCtGUGFrTWlyTjQ5YUIw?=
 =?utf-8?B?eVNSS0lRdXA5Z1NobGVnVk9kOHJYR3dPOVFDMHlPalh3R3I4NFdYZmxBWFdO?=
 =?utf-8?B?SndLUHVWMzRVUm1obFJ6QUlUaEt1WjVqd0I0TzVvNllCTmxuaUpyTmFUQmdn?=
 =?utf-8?B?a2hsMGltZVRsYm5WQnBEbHQ2dm1nTG9STWJyclplN3ArRHYwZ3Evb3g5SHNj?=
 =?utf-8?B?MlNkd0ZEdU5JSmM5ZVpkNlR1cXNZTXE1MnR5VEprUmJPKzFJT29kcnA1cWFG?=
 =?utf-8?B?bGw2SGlCM1RUUGd1bVplZ002MUF2Wm5adkcxUlR6a2lOZHVyQzJrb0U4ckxE?=
 =?utf-8?B?ZFo1NTVvcDNPRTBBcFp1eU5TNVBtWjl4K3Zrd1UvdCtTcmEwY1k5aXRaZW03?=
 =?utf-8?B?MUFCMm1vdkFwMm1Jb1NEN0RNdkpFdERlSHVEVmRndCtYeU1URm5xSkdSbTNx?=
 =?utf-8?B?eFA4cmFsNDlrTUZMRFBKbDdRVXhvR1ZiYlU4am81SlVWZThqWGpyb01xMjl0?=
 =?utf-8?B?dGlpRXl3cDlZV1E5M1RrWDlWZkVFSVdjUFlKcGtSa3VOMDFpRVR5ekd2cUNw?=
 =?utf-8?B?K0dsc0prRnoxWStPUlVPcGtUckcwZlcycUFVd2xvMk1JMnZkRHp5MVA5eTd6?=
 =?utf-8?B?S3lnU1BwZ3VMMnBUbEJhVkdmOHpQSHBxNTdja2loV044WTBqUzhtQT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ad6224-162a-49b6-a6da-08da4a244518
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:28:06.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q23Ce1M2mjWbiPo7flaBBWat2qx3xQr05MAKYmc/6QnreOsVCY9NJKdQX/Yln1Ef
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0201MB2050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

I have not actually bisected this issue but reverting the effects of
patch a4bd8da893a3 ("ARM: dts: at91: sama5d3: add i2c gpio pinctrl")
makes the problem go away.

I.e. I need something like this in my dts

&i2c2 {
	status = "okay";

	pinctrl-names = "default";
	/delete-property/ pinctrl-1;
	/delete-property/ sda-gpios;
	/delete-property/ scl-gpios;

	eeprom@50 {
		compatible = "st,24c64", "atmel,24c64";
		reg = <0x50>;
		wp-gpios = <&filter_gpio 7 GPIO_ACTIVE_HIGH>;
	};
};

for multi-page eeprom writes to not time out (a page is 32 bytes on this
eeprom).

For reference, the current defaults for this SoC/I2C-bus, that I modify,
are:

	pinctrl-names = "default", "gpio";
	pinctrl-0 = <&pinctrl_i2c2>;
	pinctrl-1 = <&pinctrl_i2c2_gpio>;
	sda-gpios = <&pioA 18 GPIO_ACTIVE_HIGH>;
	scl-gpios = <&pioA 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

I suspect that the underlying reason is that the bus recovery takes
too long and that the at24 eeprom driver gives up prematurely. I doubt
that this is chip specific, but I don't know that.

I can work around the issue in user space with by writing in 4 byte
chunks, like so

dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom obs=4

but that is really ugly and gets slow too, about 20 seconds to program
the full 8kB eeprom. With the above in my dts it takes a second or
so (a bit more with dynamic debug active).


If I run

dd if=source.file of=/sys/bus/i2c/devices/2-0050/eeprom

with a source.file of 8kB and the upstream dts properties in place, I can
collect the following debug output from at24, i2c-core and i2c-at91:

Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@0 --> 0 (-23170)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> -121 (-23169)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@32 --> 0 (-23168)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> -121 (-23168)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@64 --> 0 (-23167)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -121 (-23167)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23155)
Jun  9 15:56:34 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:56:34 me20 kernel: at91_i2c f801c000.i2c: controller timed out
Jun  9 15:56:34 me20 kernel: i2c i2c-2: Trying i2c bus recovery
Jun  9 15:56:34 me20 kernel: at24 2-0050: write 32@96 --> -110 (-23143)

And then there is no more action. I.e. only a couple of 32 byte pages
are written.

With the above mentioned dts override in place I instead get this, which is
a lot more sensible:

Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@0 --> 0 (753629)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> -121 (753629)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@32 --> 0 (753630)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> -121 (753630)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@64 --> 0 (753631)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> -121 (753631)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@96 --> 0 (753632)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> -121 (753632)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@128 --> 0 (753633)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> -121 (753633)
Jun  9 15:48:53 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:53 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:53 me20 kernel: at24 2-0050: write 32@160 --> 0 (753634)
... snip ...
Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> -121 (753883)
Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8128 --> 0 (753884)
Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: received nack
Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> -121 (753884)
Jun  9 15:48:55 me20 kernel: i2c i2c-2: at91_xfer: processing 1 messages:
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer: write 34 bytes.
Jun  9 15:48:55 me20 kernel: at91_i2c f801c000.i2c: transfer complete
Jun  9 15:48:55 me20 kernel: at24 2-0050: write 32@8160 --> 0 (753885)

Cheers,
Peter
