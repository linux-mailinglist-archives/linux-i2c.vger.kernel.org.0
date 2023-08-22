Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5222C784092
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 14:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbjHVMSx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 08:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235638AbjHVMSx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 08:18:53 -0400
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF1119A
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 05:18:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx403.security-mail.net (Postfix) with ESMTP id E6717961901
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 14:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1692706728;
        bh=MZCM71hR7+ShGvpxFA5R42WhAg1k/ERhgsixBnrm1+k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=SrFZKJniTJYyCyq+yz3qkAilA4R8tePt68c3OrYTG0oTK8waKzKtO6URMhmR00zYx
         QKTUMLtjTHCxHBl0l/p6yRhP4VZWUvPAxIU8Kg8QF4lx3ZkPZPSYosrRw70yZceeGH
         ETxx8zK64ksp14tDCLnRDAgrmLf4QmlXZUzbxbEY=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id C78F5961803; Tue, 22 Aug 2023 14:18:48 +0200 (CEST)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0104.outbound.protection.outlook.com [104.47.24.104]) by
 fx403.security-mail.net (Postfix) with ESMTPS id 0621B96160D; Tue, 22 Aug
 2023 14:18:48 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:18:46 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6699.022; Tue, 22 Aug
 2023 12:18:46 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <b52c.64e4a7a8.4f2f.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjWECGKhasXXdAtSoaLEzW9qcJ0pIL5uQH+lOL05AAY5gtJLlljgCT8VtV9Mvo5zK9IeXbRzxZ9AeVDYa1Gf8ORb1hcBwyUDstq3vp7GBOjLEc+gJto0nQEtAwL9BZKLQGYrBDLgOfRswrjCqmxACu1qtNJE6jeWdD/6Ez+pWlnUxWtI3UStKjKkMCRGRdcMRYxCIvmfAi4e51HH3uzj9df4HCVEVN3iv16VG/WeN93v3wLN+5XdUh+zEow3e87IEFJgb6fouQNl1Klr3dd5gnXLAsOGdEQSdA6IQ+jiYIg2PsKn6XmfTG3yXLUg0x7j551ixRiRCHvIicamz19GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZ/rEVcaTGoBfeLU4NinEj2NE4ZxWax015YZO+CwZUI=;
 b=FNUZQpgR8Rl2TSsa37Bg5d+QyuONluti3OEdIjnsYhal0PhihwAUyKgCrp+kp03AJ9u86Dh8sbSiyfK7ehTqA7FrtvyvRA6xUBAZJOMIKs5s4t/84F1ia7vaLxuZLiJcjq6SR9VCNe4cpRPCh1hvTIZrv2jHvr+Q2yw81L3xx8NYLv4y4MFsT9qG50BxRD5gzooEoxWGBhuQExK28Zds3zPoa7JewGbM5u8DL7+j6GOIH6ItuZjvnT4K5MCU0EZF7uZ+BZUAHSq0GyIIiFrSaNgHzj1Y8TCOcRZOXv7dCkxBQWU4sgxsaWmwz9IYkhH+/4MxRhawdwfNQuOn3kcblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZ/rEVcaTGoBfeLU4NinEj2NE4ZxWax015YZO+CwZUI=;
 b=Cs0DkxfewOO9DK4BZR28qMHm38RkBrp7Rmg7nM/TIEfyD9P8icFO2ntvJoL0ZIB6sHeb1gYFFXPU4FRFfjVlcQgYU0/ZWNtN9NmUF5KV6OgzGZ+EUH+Wx4C4KagKJZeyA/gc2lXB/zWakxhQ1qjOKjTEzZz2BajMpYjqDk9Kf0QfLhJLZYG+P2l7gIOm7JrhqFjkqYPGvnpl5xRsqbenRo0FL4lqg6bAld1o2GJKYHSeC82PeNa+yPCTv3Hl/VWp7dte7Gk8J1PKVXZlAXC2rQF0NEAP3sYyfXWKOdIEhkMj8Gj7M5UFmBs1hvmMjpBuzKBMxWfmmIQXwZS/drBSOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <22aa8679-7f08-fc82-3262-db1cfc953b36@kalrayinc.com>
Date:   Tue, 22 Aug 2023 14:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] Currently if the SoC needs pinctrl to switch the SCL
 and SDA from the I2C function to GPIO function, the recovery won't work.
Content-Language: en-us
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230822091555.18015-1-ysionneau@kalray.eu>
 <ZOSj6C+4q/xUNyhA@smile.fi.intel.com>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZOSj6C+4q/xUNyhA@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::12) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PAZP264MB3150:EE_
X-MS-Office365-Filtering-Correlation-Id: 82922034-d9c2-4eef-a3bf-08dba309eee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2ZMVdfAFiAnUBr9/Mbe/4OtDV3EWxtazeypjbOZWeN+yvPiz15rpgV3a/DupUYxR5abUqrNc3jgGLvDaFTAAit011qFdoL0ecemrk75pVr2hKIhaDSI/Vl8pb5aVRWjJj2FORxLQqJqCqopb0FBCR1SUiCOvM5ptXJkaf3WDy2658KHvYX6bYy3MkfFk9ZeV/it9rbJhapXSfiGavkMgQ7dHzuDxaxEm7Zg4goykVhnDFxo0G5l2Q/dEzO9k6KkzCxwn57bTInuOMsyxWDhBrJRNx1aQ73TmFgEzrxeWiEy8XCix6VGdMS35BxbXWNpVc/mC16kavTs5+fBMXHAV+y6dRTaSKO8FoLoQBhrv5gXIGqkNrw2lzoqnkwJaoOtYQlkg//8oVxp1cgBEbmmAszWi6V9lE3onXGBttrMk+Qa8ZApzQmQeMq9CJ0onzmw4KlXLuPWD4Le0I6N2thwQJvfvIi9jkdgi3Ow6tN8Id7f0lQHkNgoTG0HpT/PT5Q/eUP/yQN7VbaI0GCJMtKcP1hFyGjQX0UmuL6W/0SrLrPqhkkSgiLlGPmtYFUstXue42DsDx2qsajniB5p60SJWt62t5ybEJHnq9+Hn/NlYkxXnYLEsa3eyb4LnX3Jxji7kMu+kGr64LdpINoo1cYPbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(53546011)(6506007)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MkA5KVBZQXpaERJ5IPHxjOXlhuWppC6/9jo0MoLRdlPjxe8cMocnngo3NI6Zsfx6cxfNtSbdykepzKAPF5PNBYLnunwIRCrYrch+H96NpcDo6rPbwq+0jWEmXRESDP+7SMhU6SPwl81lihp5aZl02UiV9taMf+GzPa6KIfo9nA4Sach//bLBEoj29JvmXnXlDtdkpaJlniuwFCMCNeP4KJv7O1nPpGsmYjdaTUARlv32SiKvsKmhkXqPapWDlQtZh5U0Kj4j/JXKnbfa9F3Qh9p3Sj+JP9kqsLtg/zgWiW0inPaI7gA+11rJkHHSVBfZ+xznhDrXxB8R3DsdoHcfG9YVA1NdEm4OgNaOcy2DuSiJK/RVQTV+PDfYavCldmlkIkTRqX2q/ZcRGbXiQsMskthTrj5aRlpKp2jCYksqZwH0h/RXsQNgMITSD8+27Rgk4J152wd7PUl+gq6hO/uHlLi229mz0A+mvV8yQAfMdEqCTwt9/KON1jSyrSAsk9M/aBmK0FyF8o9umyasTNrPd3IKHFQxWFIJZjKs/b82ufw9MHcG49nPxmCyE9cv9hOc0hQ3XwGRvDRhiLQc/S+I6BchrqiBkwRH5z+CD+mxmKcvsq7lQpF0PoCRqQgwURkU5u02SwOkayNPkqhZVCp2lUsWTYT4v++fhVYaa4BGxMsuUVkqGqQmKKrR9KYjoYs1AKztKRERPRz3/GaVhPf8f23XkWJ566A4RSHlmJk/lBHCmqOI4Z9mrckuZ47kPMz4DMB5zwr6hky5YSKcrNrN1j+aMFg0MjhQ/ZYXYYyyXPpjJuBEEi1iw4F9GnSnan8UvcRXF+LlkASHzlk7auPw07/75iAZae1QSxOzPZeVFMwi8qf+THGRhg8/5PnVbRtj3F583eWByuM8hSE3mJ00W5PCXg/QDmS2CAZ3308+aLT8GCBgA9cbOkWDokwkvXo7
 g+hdLk9rka1OqE7p+wjM7SmlcyF8zvhRFhQ9rUzugaTFeaZmWu9XHEEURm63Hq8sZqc5LoW9tvYftXmEDq2LVW+2nIwnMTw6v+Hc5rODvJQeL6dhG96khuKONvX9E1XmVbE0sdABxQAPYk6EptIon8gZMXGJ81ETM3fdldMKHsZNTEWSR8HIT49HPFewpM4pMmJ2xiQGXxTtxQXTLRT8ONRFesNn17eyoNwtv6KRq9/YaoUa17QkAAyfSi+TQwRpD+KNy5N/tkRPijiEKXJLNC/XZJaapJnscafroWR8HBIlim/ioAn+6AZf3XuLcwFpPSK7E+zqu9lWq6KgLan4/7dqmWcksdp7ToTPIa5NZnBNgnb/8DuRkN0SLgI+7Um8PzIuwk+XZKvIFIRQUD9BXPUFsR4CyMkfftET4RgR1NG8ocKP67gIvaBlJJPzODyoo4+Rk13zwJAZmwhdWsxvmCGOxIg5ooKdkcHhO2iybOQjeS/l0y6p5pt3WpI5X4iu8ytJmnmHscHjdHa2tgdEjtwkisiM7drm40zH4q4EKiF8oBuGTE3ev+oyuHEpmpdhXz/ztFl4/+Dvaje0WM5Es7UhtGfWPj85ITZT8COj6SCriAYpZUT8gICSUoOXcAKAjCIndgdp9kkABRSd3SnWpA==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82922034-d9c2-4eef-a3bf-08dba309eee7
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:18:46.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhLiaeWIwhX1kVec6I5t4AOedWkX1qNjyM9X0ZrkBE2Zl/TvymNNvZePqb9lsDI24L6UKc4myPSq2R/Bjg/BBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3150
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/22/23 14:02, Andy Shevchenko wrote:
> On Tue, Aug 22, 2023 at 11:15:55AM +0200, Yann Sionneau wrote:
>> scl-gpio = <>;
>> sda-gpio = <>;
>>
>> Are not enough for some SoCs to have a working recovery.
>> Some need:
>>
>> scl-gpio = <>;
>> sda-gpio = <>;
>> pinctrl-names = "default", "recovery";
>> pinctrl-0 = <&i2c_pins_hw>;
>> pinctrl-1 = <&i2c_pins_gpio>;
>>
>> The driver was not filling rinfo->pinctrl with the device node
>> pinctrl data which is needed by generic recovery code.
> ...
>
>> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
>> +	if (IS_ERR(rinfo->pinctrl)) {
>> +		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
>> +			return PTR_ERR(rinfo->pinctrl);
>> +
>> +		rinfo->pinctrl = NULL;
>> +		dev_err(dev->dev, "getting pinctrl info failed: bus recovery might not work\n");
>> +	} else if (!rinfo->pinctrl) {
>> +		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");
>> +	}
> A bit of bikeshedding, would the below be slightly better?
>
> 	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> 	if (IS_ERR(rinfo->pinctrl)) {
> 		if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
> 			return PTR_ERR(rinfo->pinctrl);
>
> 		rinfo->pinctrl = NULL;
> 		dev_err(dev->dev, "getting pinctrl info failed, disabling...\n");

I think the dev_err() message change is not very clear because one might 
think that "disabling" means that the i2c adapter is getting disabled.

Maybe we can put "getting pinctrl info failed, disabling recovery..."?

> 	}
> 	if (!rinfo->pinctrl)
> 		dev_dbg(dev->dev, "pinctrl is disabled, bus recovery might not work\n");
>
Ah yes, I like the getting rid of the `else` part. LGTM I'll re-send 
with that.

Regards,

-- 

Yann





