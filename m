Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 761E6707E5D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 12:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjERKqF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 06:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjERKqD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 06:46:03 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D90410D8;
        Thu, 18 May 2023 03:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns9SK9wL30wTOCqtYqSkspI43Zt3BD8EmBGTJd3YKsCzNFgBSyeSjJ9Wrt6upy3ng4Qk6DtKykIA0243lUGM3QNwSHABSLl+PhkiHWlYEt/hmm4WO9Oj3Vcme9jOuYbFWQv/jWPW8x1bqKj3PYYFnwYccmG6LjfVBdNTuKSZSXFY5N6JhC1aFY/InChsRkQtkpGRWYFLN/ia9ASCCmBDaY4X3dR+wTlpD8LdA18Pzv/HVhlwbwH8pZBFvtHBLUlizZkZGDjFi+8zKigW0D9FjPoSQY88koQ2UmKlcICpM4ZedtA2isbI+7LapXWp979rE6w0B6QqZjgpKlhBgEF0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgG52cfylsN99bm4Vj4x3TNKL1ezCzLg8m+LQg9FHFU=;
 b=I79Yotpw+EdyKryhgVKYxdTCoqq4S24QH88KdbdIXH5TYZ+o1eO3vxENEkr+X7tycKtE0j6IOyVRypIjMbz13UFPnw3qcV7x+0/9MI/6oAHnV5/83XQgBAX6TttOGSdQSWPF0CP9I1COHvLDQ9CQ+XJLy7fYaNxq6bgVXWbdLGTPXTOWDiTTmKjFYSwRlb2/WAu11AsHHCcLBUuhqvuxDPxo9vghjGKBveabegUrhklfPCSi5d0MZsFVD3hCR4VCmmVYGHt4to53KblMdG343srLzr+HoEIrQAL40BY7mgWcSCXm/RzwzA0eruuER07Oe6kSNsYlqx9QUKIlZoLO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgG52cfylsN99bm4Vj4x3TNKL1ezCzLg8m+LQg9FHFU=;
 b=Sg2mE75qykbR9+ZgDLRZee2+yups9B70qdAw9pcUZ6kdeEPsgWjGwCIMNf4DJJf26pXCZnL5D7zf/31Ubfumi2tu8XG3QN+TYshy7S1GDZFs5hRmL/E4p83G/yjUDS022iJVA3Xa885tvTrbKvQaGAYEo5ef+rskCd1Sva55HlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4758.namprd12.prod.outlook.com (2603:10b6:a03:a5::28)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 10:45:57 +0000
Received: from BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::e78e:b7da:7b9a:a578]) by BYAPR12MB4758.namprd12.prod.outlook.com
 ([fe80::e78e:b7da:7b9a:a578%4]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 10:45:56 +0000
Message-ID: <fe90f121-3e7e-7071-f654-6d77a7a8102e@amd.com>
Date:   Thu, 18 May 2023 12:45:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
Content-Language: en-US
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     piyush.mehta@amd.com, nava.kishore.manne@amd.com,
        sai.krishna.potthuri@amd.com, shubhrajyoti.datta@amd.com,
        vishal.sagar@amd.com, kalyani.akula@amd.com,
        bharat.kumar.gogada@amd.com, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manish Narani <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
 <CABb+yY2JaC8b-HFEU_WnSBSCr2edgEezXJkfMUYqjeLBA1MvYw@mail.gmail.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <CABb+yY2JaC8b-HFEU_WnSBSCr2edgEezXJkfMUYqjeLBA1MvYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0099.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::28) To BYAPR12MB4758.namprd12.prod.outlook.com
 (2603:10b6:a03:a5::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4758:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 139c61e8-0e11-4501-c53b-08db578d0eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNxcxbO1ZyA8v3QXLrLu1RZCAhkAg5XTPt+/NpY2K9pd0a7iedl6t0bIWl2fAKhfpCdB6kXY3vy24R32C8mvSL5HWebPqi1fpxgrhZBtQ+tw6zY8TjYVvVi+jF0o/WE/FvGm5CgRILU/uE8jteJoQy2YXfhJmhs2Jus4A97zvGzXtK/CYJX47unLpMFH3BLDq6iAi1qdVcLGLEGpQZSK6EYSIW9DfhMrnw3+IGegRBthtPNJnjlLfY8e5+XxahA4j7eGtYMfOg7EikxA4VfJriXXPzX9lDAjFtM3/BlAyt8LwQrdgdGoFMgFDRCHbXpaeDpIGBrN7KKsNodPddc2abXvW6O6lNz7HjxOjjE8LeuT34jAHrbE5k8hxpmGvASUrmR2opIJqNQqeuzzztu2tEjDSF5GbZ7K0FeXzeMhFK0T/PDJq9uxcEokNOPZL+1A+vqcKXuoo6F71xwiCGJD7Ah90VS2BOPUgfaFwDdRHq1ouGh9nK2g9jb39k4NJSLrC1XQgHPdqpSqTp0rDAOZVqR1YsPgAJcCRfUlBbENAFMwU8AX9OVgk28DoXsfVFb9pEK4hmaoy7VlJ0yM2/FGtKvaljAnZavCwjtNJ4bWffQlKUVBgbc4ZlSpO/9ZPgr+vvo5tg3YTDP3AHmR0xGNsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4758.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(26005)(6506007)(6512007)(53546011)(36756003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(186003)(6486002)(54906003)(44832011)(7416002)(7406005)(7366002)(478600001)(2906002)(316002)(31686004)(8936002)(4326008)(8676002)(6916009)(41300700001)(5660300002)(66476007)(66946007)(66556008)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThMaTdpK0VaRjd6M3BWbkNPYVJocmo2OFJZdEMvVThBazZqR0sxN2tMeUxT?=
 =?utf-8?B?dk4rcG1SV0pmeWcxMlhVdUxRdEhFUFVuNzkwVTJwRVFJb2FGd0RpamtwWjZy?=
 =?utf-8?B?Y2dBQVc4NFMybmNBMmdRWGJ6QWZ2QkRydnN2anBCcDYwQ2dRY1VhSXBBZitW?=
 =?utf-8?B?aGN4d2FGejB1eFhRWHQ3V0QrSkl6Y2hrNFU2RFFOY0NUSDFRMzcvUURBbW9R?=
 =?utf-8?B?MkN4cWkvejRQL2JINXJia2pUOG1TQVVyS2dxSVZtVnVSMTBxcFcvTXpPTjZQ?=
 =?utf-8?B?dG5MWFpUOTh5aDFnaXdDc05Pd1lVcUxaZTZOU2s1TlhhWVdLUENDZ3gwSzY0?=
 =?utf-8?B?WE5GYXEreHhLMTNYdmRtOWIrU2JqVEs3S3JTcTRBUGxmam1XRjQ3Qjh2d0JH?=
 =?utf-8?B?NlEvdW92WE9hK2pxZGpLN1lRV1g2MG94WVpCMWhrcTJGd1IzamRXc0MyakZJ?=
 =?utf-8?B?dmlGOGhOWnJ6d2JkS2tKb3JvZnM2TGpnVEJWamxqcXV4RTFhVVY2MmVGY2wx?=
 =?utf-8?B?aW1FVk0wYkFySnIxeXEwcUl5UkdsU2JGWEhIdS9ISEhvWDFETUp2dklCcWN5?=
 =?utf-8?B?Z25jeFR4YktLUUp6Rm5oUnpPSndKSERmL2xTeTArTXd3K1pkWjE1RVlpSXNt?=
 =?utf-8?B?N0M3VFZNQTZFK0Q3Skd4YkhzSlJ4OWFUK1JNbFFmSGp3WC9XTTYrdVpMQ2lm?=
 =?utf-8?B?bmV1STZzUGNwSGVjUkcwbjU3NjdGZmRhYit2ajZjdHFIZ3BkS3BQRkY5WHRs?=
 =?utf-8?B?czYvZHJJbFBrNGZ0YTJPbHlMdTR4dUViMGdaSHZaVEZ2ODBIcllIK0Z5NGM3?=
 =?utf-8?B?NG5zdytRY3JydXRlVjhvVTd0QzZId1oxazZGOWhzR3ZCQ0pSaDBrblRRNTdU?=
 =?utf-8?B?Z3dMd0M3L1NsbzVuRnpQWUo1R09lMTZ1K0tSTzdmdi9BNG1nVTFza0p0cFJ6?=
 =?utf-8?B?QWxualNYS3VzNjFIY0c4QTd2VC9wV3Urb3R6NzIzUnFIU01wc1hJai85Q1Ir?=
 =?utf-8?B?RjRWY3pmTXUzazlWdm5sTUs2TlNtVUtURVdXT3JzdC9RalhzaW00MnpVcGg3?=
 =?utf-8?B?bGt1UTA2aDdFdGhFQlNKbnRHVmcxMm5KcHRUYmR2dDNGbUVZN1cwSE9xL1BI?=
 =?utf-8?B?LzVzaFY0UkFZMjdUWG1xRkpJd2RFS1JXN2F6WkhlNHhzWU9pM1llbkFCb2lk?=
 =?utf-8?B?TW9OTG8rN0hQT1lFTU8yN1pYemQxcC8xcmd1Z01aNFg0MkpET1U3Mk5WcTVB?=
 =?utf-8?B?aFJjSnNIcE5zRndSZklUa0J5Njd1WC8yZnAwa2dBT1FvSEhCNDRyc1VBYUpl?=
 =?utf-8?B?RGJxMTRGWnRhbjArbnc3d2ovc2dlb0Jpa2tXMDB1czdSVVE5eFBFWFpnSTdt?=
 =?utf-8?B?cW5rbHJ5STErcHYwOG8zalZ1d3V4SUdwazhUazZGTjE2anIxRzZQUjJMVFA2?=
 =?utf-8?B?Ymw4N2hOdk9hSnk5aHREQ3VWWER1UlJiQ0NrSkg1QlFiOEloZXdSMi9LTnFK?=
 =?utf-8?B?U0JmeVhDRkVJbGNlVlVqNk91UzJabnZMWHZjN0U0Q1RxK0V5c1VobWtUdHZB?=
 =?utf-8?B?WDNjaldtZ1F4UVJkZXIzcVk0TW1KbGp0V0QxbklBS1pEeldxV01aUnNUWVZw?=
 =?utf-8?B?Z3RSWFRGYWlDb0k1b1JOUjlxWks1Ykd5V21xTE5zdlNCc1gzelViTldsbHlB?=
 =?utf-8?B?K3JXRXE2V2NETWd2VXgzb05ySVo5Mi8reXljSXlGVjVWRENOY2tzOE5sUjVR?=
 =?utf-8?B?M2sxVFdKa05CSkRjUnFaMlkrYjNJSDk3Z2ZuU3I1QlJLRmVvcFJlM1psRWNZ?=
 =?utf-8?B?T1pxQ3A2aGNnUHFmMytUVHd5VjRtSWF6eThMK1dFYUtkY1hPeXduNEQ3eHhy?=
 =?utf-8?B?NHN5Q0h3RXQrMGljMnlTUjUwQ0g3MGpnbmNHbjRWcllUQklsMUNJVUN1ZmZj?=
 =?utf-8?B?Q1VLOGM5aGt4eFMzbFM3YkJZdTluZ0wvYzNiTExydFZib1lzY0t3TEk1SEFY?=
 =?utf-8?B?cmR2b2VmQUErSVlIOS96TnVVM2F6em1sUXpmTFp1NlBobFI0d21MTGNxZ3Aw?=
 =?utf-8?B?K3UwV2JnbEpOWHlpd1E5MmhpVmYxWTlsSnh2RU9LM3F2cnVLbDQyQlNVcG9k?=
 =?utf-8?Q?OAEqqTVcjKJxC4XXXeR2O6Ti3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139c61e8-0e11-4501-c53b-08db578d0eb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4758.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 10:45:55.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uZrmYD6r6sRW89Dt84pAx+OxwD6OlCnhivy0DFHHJjHbPhyEpwOrBfXE7lpxyRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 5/17/23 16:16, Jassi Brar wrote:
> On Tue, May 16, 2023 at 8:51 AM Michal Simek <michal.simek@amd.com> wrote:
>>
>> @xilinx.com is still working but better to switch to new amd.com after
>> AMD/Xilinx acquisition.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>>   Documentation/devicetree/bindings/arm/xilinx.yaml             | 2 +-
>>   Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml     | 2 +-
>>   .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml       | 2 +-
>>   Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml  | 2 +-
>>   Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml | 4 ++--
>>   .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml        | 2 +-
>>   .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml        | 2 +-
>>   Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml  | 2 +-
>>   .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml       | 2 +-
>>   Documentation/devicetree/bindings/gpio/gpio-zynq.yaml         | 2 +-
>>   Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml  | 2 +-
>>   .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 2 +-
>>   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 2 +-
>>   .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 2 +-
>>   .../devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml       | 2 +-
>>   .../bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml      | 2 +-
>>   .../bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml       | 2 +-
>>   Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
>>   .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml        | 2 +-
>>   .../devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      | 2 +-
>>   .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml    | 2 +-
>>   Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml    | 2 +-
>>   Documentation/devicetree/bindings/serial/cdns,uart.yaml       | 2 +-
>>   Documentation/devicetree/bindings/spi/spi-cadence.yaml        | 2 +-
>>   Documentation/devicetree/bindings/spi/spi-xilinx.yaml         | 2 +-
>>   Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml    | 2 +-
>>   Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml     | 2 +-
>>   Documentation/devicetree/bindings/timer/cdns,ttc.yaml         | 2 +-
>>   .../devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml   | 4 ++--
>>   29 files changed, 31 insertions(+), 31 deletions(-)
>>
> .....
>> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
>> index 374ffe64016f..aeaddbf574b0 100644
>> --- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
>> @@ -33,7 +33,7 @@ description: |
>>                 +------------------------------------------+
>>
>>   maintainers:
>> -  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>> +  - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>>
>>   properties:
>>     compatible:
>>
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> 
> Just curious, some developers' ids are left unchanged, and not all
> devs have S.O.B.

I want to go over all xilinx.com emails and move that bindings to proper person 
if that current person is no more active.

Thanks,
Michal

