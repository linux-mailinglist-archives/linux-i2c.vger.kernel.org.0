Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 017B0783C83
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Aug 2023 11:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbjHVJKG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Aug 2023 05:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbjHVJKF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Aug 2023 05:10:05 -0400
X-Greylist: delayed 317 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 02:10:03 PDT
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273B8189
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 02:10:03 -0700 (PDT)
Received: from localhost (fx408.security-mail.net [127.0.0.1])
        by fx408.security-mail.net (Postfix) with ESMTP id 06BBD3228AE
        for <linux-i2c@vger.kernel.org>; Tue, 22 Aug 2023 11:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1692695085;
        bh=gahz54q5N+9yhtXarsSPCHJGEfX243DvVjSctNwbVho=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Sst9cRqBE5lWa9f9kNceb+9RZYNPpgeOb1KPtodB7oHf54YmbPXSoT4EoTSnrolde
         MMZ9TGZlT2xuNrXeIU+1id3J7hiQbcAPC6MpaSbOG88Ce8tWeoS4cS6JuoknO6OnMy
         ut9hy+OAVPrVnI0XIJ3gv3e2LEqsXp7MdW4YOgHY=
Received: from fx408 (fx408.security-mail.net [127.0.0.1]) by
 fx408.security-mail.net (Postfix) with ESMTP id D746A322887; Tue, 22 Aug
 2023 11:04:44 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx408.security-mail.net (Postfix) with ESMTPS id 4A3813228A2; Tue, 22 Aug
 2023 11:04:44 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by PR1P264MB2231.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 09:04:43 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f704:3b18:55e0:64ca%4]) with mapi id 15.20.6699.022; Tue, 22 Aug
 2023 09:04:43 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <cc64.64e47a2c.4997b.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C21RX8QnkNqjMPAhxo37FyM1krOGCGg6wPZtLcogILLFADWj0qgQBz5OfHryzm/UyQZpJCnD5nZiOLCT87ysuvwBRFtLEb6v4gjO6K0w0MqLYiIm41rVYEfAePdAHB6jJlgwZiryCb8Y6QydPYEq9/9euuYhFTDuwAqW8E+95V/Sh4568T2FCUBBgKIgBDuti9NRRHVBOgPSp/2CaY7CQNpsGUZf61ND7bkYUXlyDxuGFGD+24t33MNFIbbCkmgCkBzQqN2KxSkVcRYVIahSizrm3zoXqbmBG0k9Q+dj38cxP4cX9/JQTS1qUHWxLvHaqBp1MqFGRuxMUJGHm6hADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iPTAkKuxberwhCiHuXEt786bAISHvfwv5sRx7XZUUI=;
 b=iM7xzJGWsPfh3B8fpCkB9l64YYZv3gjIVMZQv0YvMXrd92RBW8/81skFywcWUTfEZ3TAmbxzSbCahAkGPPvwgQAlarfCqkapLtTvemnP40p8MpoAOe8umd+Deb6E7SKIVlrpbItddVrmQp9kGNyLU5WY14UmtwixhVO4IWFRmeiMrWVNOpmvv0/xDgZcN4NasUuCm3FGE5ZBO8GO68f4FIVSiz3oZk+EghVc1H6nk9//RfNVtdPjemFBY5TuOB2hACu1bVpAFN2lOlE+WD5tIXcpukB9l/6Au6CAlgGIv1hapz0LeyqHu6oz/zrEsJ4K+qxXK0jGZgN1W+kn9JdCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iPTAkKuxberwhCiHuXEt786bAISHvfwv5sRx7XZUUI=;
 b=N7o0PUQgOw2KvIWTxsfcwE7desl7ow3E18yaEhtaK+hy7e6+WXIBigawhJRoS9x4uuZbB3mIrcztNi/NxKXM0ToGBejVQN60Vyp/Ak+Gn/zOgQp009uG9FgGy8aoxTfArL3d1vHEdfevzWko+iNkFybnr4C3eIC8PUauzn8CpjiVdlGUzRQQJZXl6KcGmrDkSFzYWJBA9s+OcHv124IFRQ3EgwTyTyulNVCvIuSn4Qzyx0+3805rVmRmyJwBRzutRPgXx16iSYWpNoLBy3hmG6hzsM/l+6Rzh77HMp8ymkUh3dpsN5m1tyF3xDGTtEv+v9sIzDOcAg09VC5xCqLVjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <512b124e-10a9-4ef2-38e4-2eafee4e83bc@kalrayinc.com>
Date:   Tue, 22 Aug 2023 11:04:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] i2c: designware: fix __i2c_dw_disable() in case
 master is holding SCL low
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
References: <20230821140103.5272-1-yann@sionneau.net>
 <ZOODfgHq5BXDZnzG@smile.fi.intel.com>
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <ZOODfgHq5BXDZnzG@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|PR1P264MB2231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f98b35e-2764-43cf-618f-08dba2eed31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wjaoJWxRAPvEyTxb2zsoyrdGCAOHc2F6lSKM8igvCNtPGjNyi1rapwrURWkul+uREkiV2GrR9uFwUTG3cTOhola/yBISkVyMKe4T/SbbBFU9zLuxFLCNBaRYMtjEEeelRLyCyUE8UwtSy/w1K4YH+wwMOBAtjH5FRelpxSfdYW0e2qHZ0CA7WA6VV8+JPA9bzU/51h1+orTjfBmit5yfCQ86/vXoWYyQdPWS+x/+0RqlhZuhm0K2Q4d11tvpSWRRFuhqOx+xNRgYlef7C9vP6mV1NJS+DLO0cu1GypkI3qdO2l1xrexAHiLSuLTLnEvwnDfyyHZza8f41Xq0qzGwSB3JNcYNM4vU6kpilTiFCnc1Fpg+lyGeWAAOXLRD6rme2GC4U2ZFylHH0vBLame8VaJ1A93V5Mz24v08IHo5TQIjF1+XUVpVOYlMSbTqMmIkcubD3LfhwmxFWgBzKwZyuuKYt4NEpTqPmGLB3VjjZkvLgDLpDeLVlS1NWjHU0vA3poyyPFygUTzzuuYZdEsjq5sGzzxOu0T1twbNbRoywdTmHBEP35w5XevwqINlAAnZbw6//y9a3dxiGKMlcIcuh5I9wN9MgM2dJANLmKQ/I5ch8/OdV/O12Gahz5dwBJFvkVVdRkiYWy89UCUX8Pnibx3bMArflXiiUzsb3CPGicJL1SlarhQnQQA7hTWnmuGI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(107886003)(4326008)(36756003)(41300700001)(478600001)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pKiqUbrpNaZwOZexFmZjrrmQKoIUT0QtAX5g19ujLNfzJWOLyqFIFwxWXJpImsmeB2eaRwJvdbWjzFyNTLMub0rqvj/20FiDTNRqsTLCENj4pt3My1ludgedsV/qd9VDw/PUE3U0O2+lFgcLmFV4sQJgM7c7qNMpFzGYcSuE8Ntg3umZXaMujbKu8J/Vb3BgBkUQopRmaGdc8xSKu3hEWYecB/98Xs82o0+L66McbEGoc378a6xjfl1DdY0qNZpqutamGCDYGtFswc4U7IY9cLnkZF3R5sZxevTO195i/Kkhw9Y1nlO/+1AD+fKYLpG9ZzXhkCsdgJVnEgIRIC2vQ4uGQF5Zp8lSLPpSM5KLFvHX68MpOtB7g6hkwzIjRHNSAQfPvzg0jIVIJkngo6q9yJ2Ru/2ZgqrLP7qFd9494b/FuO3vKW9sUQVBlzOee983MwRnPQ0Z0EyKJPAvBL9zBlmxzGnQC3Ci1CpvDPfukduqxhj8Cv3KIfHPW1X5cF6GOJfoZVBbLUeKCNc2sPkyyCtr5IqXJ9d+C9hXo+VwD/KY/c4FfhE8aQewdaLEJmTllmxAIitragLSiGthf5K6/dBWohkQkCgrLjRJpGAuvRIMHJAWzCaB3+GcwGSbdEqHFdR3+xYuRLKPydDWIOKLGbXO31iKssEIlhajlbuj09WH6oQeAXmQ+zyVdyuJQwXWo5NHEQHAMwSpYQ/F1IkjYx+mNud0gy91Y70OmeJj0JclvFJU6V9F6HnBMUCg0h2uHmmrF7qBtseByQIwwJ5fZaBQmaeP5sreZzZB8GFOGUhpBP2L5Uu/wWhNVcl0X1/b5VZ3jQz2DtZuTPs1Ytdy5vhC9RuHD1/k1bxhBDweBCLcv8eqN2fjNo9rAdBzb7s28eayXAC/EWz7C9svb2+owVvdaDbHUA8EsEUV9F/vvp6DsbfuFroEbvLhx9yrZb4k
 SyOt0Bk6SrirE5yFLp/dxnF/ZYS65y3bOEuKiCxFgyQO0h7Ar90MW09vDgXB4uhyVd2rkU6HCpqNI/So11euF15NbBIonGKxqSHdu18OZdbQcanPj+yRa6O3W+wyj/bzfAu7dA1MPtRQkDe4VWstwaVxtmouGX2Xu/bxBUxEKvCmD+3cvtgIK7GmEMvIq880OrKvBzgKVV5RRRv+ECcRii1ZEkTO56eNXQ1LkCqwESLDYPO85YYrBl04LfdCFQ9cMvGTEn1Nz5d5d1kRUMcyNCB6vq8+l1mjUC/NsOyjfSN9ARMoFEPUmvhJh94juvZxUmqcxD/NDPo5+U+Nu9sAJuMKpW0pfQkSKOuelnhwMghvXGHWRh9K1OTyp7EhVW9661bpfdudkcqIv4SGdRnxBCqoSx20aoNEMkaKFgMz8vR1ag+syQxLn82yiek78nrYyfqMMZXY1IAGBMm6If1oknZKw23fRjua+dLPmVPvXTtZv7f1+Nf/2rQCeZM/RWW9ZscR6xmde3O9dzL/jyHnX6jU6LMS61eABw4w71YdSQmdmFHrIl57d8m1xTK7oBIBfuxnn6yS/7wPFsSHoObJ7P0dmmNkdUavKtolphHXotFEc67t111JHDt6C9YrVjrazU6ogywu5FByQ0Ce6RvQuA==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f98b35e-2764-43cf-618f-08dba2eed31f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 09:04:43.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxjpb7t3V95RgnEo2tymn/YRD+Z8B+ipU7UJegSr0/nhHz4XSxAYeME7e8MlKq8UZOEHML6BC1vDreJOXWtGeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2231
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 8/21/23 17:32, Andy Shevchenko wrote:
> On Mon, Aug 21, 2023 at 04:01:03PM +0200, Yann Sionneau wrote:
>> From: Yann Sionneau <ysionneau@kalray.eu>
>>
>> The DesignWare IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
>> parameter.
>> In this case, when the TX FIFO gets empty and the last command didn't have
>> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
>> a new command is pushed into the TX FIFO or the transfer is aborted.
>>
>> When the controller is holding SCL low, it cannot be disabled.
>> The transfer must first be aborted.
>> Also, the bus recovery won't work because SCL is held low by the master.
>>
>> Check if the master is holding SCL low in __i2c_dw_disable() before trying
>> to disable the controller. If SCL is held low, an abort is initiated.
>> When the abort is done, then proceed with disabling the controller.
>>
>> This whole situation can happen for instance during SMBus read data block
>> if the slave just responds with "byte count == 0".
>> This puts the driver in an unrecoverable state, because the controller is
>> holding SCL low and the current __i2c_dw_disable() procedure is not
>> working. In this situation only a SoC reset can fix the i2c bus.
> Thank you for an update!
> My comments below.
>
> ...
>
>>   void __i2c_dw_disable(struct dw_i2c_dev *dev)
>>   {
>> -	int timeout = 100;
> I would leave this untouched to make patch less invasive and
> easier to backport.
Ack
>
>> +	unsigned int raw_intr_stats;
>> +	bool abort_done = false;
>> +	int abort_timeout = 100;
>> +	int dis_timeout = 100;
>> +	unsigned int enable;
>> +	bool abort_needed;
>>   	u32 status;
>>   
>> +	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
>> +	regmap_read(dev->map, DW_IC_ENABLE, &enable);
>> +
>> +	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>> +
> This blank line is not needed.
Ack
>
>> +	if (abort_needed) {
>> +		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
>> +		do {
>> +			regmap_read(dev->map, DW_IC_ENABLE, &enable);
>> +			abort_done = !(enable & DW_IC_ENABLE_ABORT);
>> +			usleep_range(10, 20);
>> +		} while (!abort_done && abort_timeout--);
> Now as you split this loop, it may be replaced by regmap_read_poll_timeout()
> call.
Ah yes, good idea, thanks!
>> +		if (!abort_done)
>> +			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
>> +	}
> ...
>
> Other than above, looks good to me.
>
Very cool, thanks for the review!

-- 

Yann





