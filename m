Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19D87B63DD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 10:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239213AbjJCIPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 04:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239309AbjJCIP2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 04:15:28 -0400
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06506A5F
        for <linux-i2c@vger.kernel.org>; Tue,  3 Oct 2023 01:12:29 -0700 (PDT)
Received: from localhost (fx601.security-mail.net [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id 03BF9349E48
        for <linux-i2c@vger.kernel.org>; Tue,  3 Oct 2023 10:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1696320706;
        bh=ao/oMi93VK2bOMHnLSBscEElfMHKMxbZkhSl67JDLI4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Cawh3i7pyejTw3E6EMDTFtNntgRZYoKpL2xBfc3i0HgWG8LHd8QahyVQn9Ki1YA0F
         UNyjXD/Io0drPe0uxYggOKDv/4XqJyhGmhdd9iKf8hTQkET3HiV3FdxyX9+myDg04u
         inNaYRAFh6idoZsU5cIDzsGlqxd5LXdMMIW0oHdk=
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id C1C66349D52; Tue,  3 Oct
 2023 10:11:45 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx601.security-mail.net (Postfix) with ESMTPS id C0288349D2E; Tue,  3 Oct
 2023 10:11:43 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MRZP264MB1944.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 08:11:40 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dcdd:d6bb:ccc7:a854]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dcdd:d6bb:ccc7:a854%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 08:11:39 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <15006.651bccbf.bde9d.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+qM8vWKvUv6+uUuu1ehjlFRNTQRvM8i5HXfSz9bLu1qqD8wDqjKFFaYF6dLe5FUi5gWxc/vRv0rRfIqHQuSM/CdFQZg4BLIUNoK41BOkMrWknRUG24sfSEIwPPJCcdM5ALB90EGac3GhSadnMM4tawouJ5y8T/SvAIVtaBUdUxx70kFBvvtNu1yCSvgQ5QFJV0mwWPKnFx4q2EfsShhWj1pP52AKqzU+TsLEsQIoBOCM8nk4SuqjuGDcnkr9AWMZHwgXgUIxGSO+bAiyEcvJplLxwOY+FWiXFMlhBIh4yHQiYNji19YWUkn6wK01iB/KD4Auf0vsxvfCIJHUA50vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGCsTMEbPj7aEFZYWvlpSxoieBZc9V2RoWK6wa8CuHI=;
 b=RjEGxB3rloW7wpvegWkpR+5KmnHZMNh7hMi+FBao6NIi4B0hRBusnBArwd4zP4Dgm0up5pDeIUSmt985Q72cvQM0mhVyitotVEu0kKQNlgvr0ZyIFFd6WpDaYWcK4trBXxMTfPizkQGdnov2RjeqO+65KIXh9wqzZxyzC5zOeX67NfW90J8m8PAgTsuc9FUSCwXGpCGYNNL++fPSdJcgU422trhL9wLz8VjRc5bL04U64a5oLAYNcRxbT0V1pmbipdBKL5bovT0Xond8scN26ZV5aDl5w2Ar4fG/JQmAAgHBPly5+85ffLP2J7QRXRo22SBKuwOatHSBKEDPUwghJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGCsTMEbPj7aEFZYWvlpSxoieBZc9V2RoWK6wa8CuHI=;
 b=OeYyg0A0Uyiur+qEpfsU42656ftXXqURkGHshVCsnyx5fpqMXCrBsLp/hg3cDx3g2/ULNvBW6Y1bz2jeYc3IhfWCMPQqlIXgzJFonTzBiRWko5NTlwhLCFbzP67pzTlXTTmoSdx4bEDmTobdTyuXoMhOmmcJ80Pc9YqiHjB7TL6SHSM1KH+FWKOzZHbgSFe7jtmjhHxdRJEdhd/urvwO8HHI1ZX4dPVs/vrdUgUgHH1Nxuz4wC/XeyhrAlAmhBI/i/FpXJtGbqxD/RxvdkhhXLYCh0/nYY6LcUx4DElfdmZ5Hri5hOc8/ujkb76GdbRnaDoyZf6NaRknxcnlubhMEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <9e737b85-95bb-66cd-301c-3a2d1d41f4c8@kalrayinc.com>
Date:   Tue, 3 Oct 2023 10:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Content-Language: en-us
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
References: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MRZP264MB1944:EE_
X-MS-Office365-Filtering-Correlation-Id: cc887e50-7a23-4885-5514-08dbc3e85e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZbY18OSofxHYRsg0nNgj5IIfxfeU3j9EkG8k2EOGmN9rUn3qZBTeQHXC4yprl1LVHuInxlefExYfb6bwC4GgkNnJDSRHQsk6sm31cUBRhh0RoGmi+RdSpfnNUrZZht7aOcYu98bhRt9TkzTee2vArVLuPwwmRAPU+Z3C2Z2ZSTRXnXQy/3QdU4lfJaM08LONlkfrIvQujTPikUj7Bo0bTEX0LrDcRbhMqFu/seOkBagW3VBoLGo9BpNRrUy3qPEGSBbh4dHSvKIIEBV0cGM0mmZhbwvxZK9ghP9r+2ntQeJcCo65O+Md2dMOQj0vvKn6+lAk9w0E6cVEit+C3G0b1yu/hjl5LMomLLZ1q3eo/iIlt3nKg5gOC+RxT/0QeCq5UDBgq5O9z576QoclEyFaLvWUz8SgHGXhmm0bOVoCm2BKllYbXH4TCCfI69NWQ/thhMxrFzUyLu40kIphtmuyEYWiFJCiHCARvhS82rT41gKzAg6n+1cHTmIeQhxBrkNjoDpvSceHHRaDGLrGrETH9MQADzMt90xwEct9LJG2f5qdek8iBKE3YeFHdndwDLcU/nNHvqoSgbdYd33ihheG6G4fApyi10P84E+AHxm+7ZcpXbRI5NbNWuxYt93mPY+fwONTe6df+3Rg/WTcgFurWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39850400004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(41300700001)(6486002)(2616005)(53546011)(6506007)(6512007)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(5660300002)(26005)(6666004)(478600001)(31686004)(7416002)(2906002)(83380400001)(36756003)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZgVmLvbJbq+TC3zopfsOrQoQaGXn5xJvi28IWHD0/pcH9Ych0IhTsnpHvVfcP539ebYVIolK0PGGiBJdRjl/BDwgM1F16F6GuUmTM3hbWoJHFnA1DclwKYOLqJvdSo31AJM0wMrca43Odk7vuZEALF/YtHSa5dvSIB7hBFnR/jtAA/5+czNlUjOZcofDEFKLzOSDpW6JxIdmMKtd47bSclNs2mNfVShOHwzj/QYoewV2YIFtgPlfITT97x2TXCl7/h44YcoJxMMh7msa+r/FdnAXui4El3u8T/yYoqqMR0V+PGIf5y7tGPRCyRBXC8mL8XgfoxOA+DSUCX0q6cP0raYJ4EnVgKU1bPJ7SX+bbPNZuOox3VBD3sR4sVuslEiyuqP0Do4OKAGUsPL5pBmSQ7k2lRbKWTPH5mFo7eBDBYiOMzxMp/Secm/x5dAnnzgwk6VqHVcSX9SVSFCvPM4QFSj8piKJVsUAX4y930UofPELHf8t0+oEWCg+vJl4Gsnzsx010cLRgnkFuuekIJN4sSeAE8gDOWgco03ivUiOuZA6fB9ILDzLhwwgCINbfRz0ghRc9Zsp+87clXtDGPIKKhuCtwHRnQT+FOBTAB62Ue5ANVNeYFIfGrQs8Nh/BsfPeoph9u1s94+QQ7coBUBtWIB6DzXIE/L4JjKWc7vQSH1UGf9kDBAQoFgvZhGBhpDmUZzj6AKMRA99p6wDu3PMcPao4cp+jVEdHs2bpnpNzuqgmbcM2Xp4opxKQ0n/oKFNkWOBxWnmuxkpHtTtIv/z4nkf62ffEmCh50x48s1BIQWlPDOL06nY8yfQXWJ3/7/OiqhBVTdlM+wVP1SgN1DSk546acGedPkJTmjbD4ZLZMeVbOb5hYdVdrYtHmCIJGkTYSRd7t0tlN/w5K5Q8zS2u2m2z1PPGVlHLj2G+VjlnsJhJEYxgdGR82nxGIXxlW2g
 Zl7q8LjHUE7ukYZ0vIPZ2mP+tXjp7Oo1O7uAsQ0QM6joCGzJmHpnVsxXB1qO1c3X1hCx4GSM2RvuvvMPS4wZtigOwh13uLEiWWQdIoskpTo7eOeDNXyoohIxMgs4xsMyEGFJL73F4//jefsvdgKqdWES9wFyEaIqlKWFK5yxa3WyGyVZKENcuJVH1k5Zg2wHCcBw6zDemu4bFcx2ZQ18VPm2Ph6GzCx6SnqekR0gKZflUkRkmlGsN0CIhBQ+RRywAZ1AkyXSvYuOX9fdSAsso9cvW9gHYAMbQArzjE0SPbaISXXIGRrYEElR4LvcQGoh732430ZnGuQvlx9JEM9xq8mqobzcSM+oZZ4AqJWG0exFrdbn4tH5mVK/CyJ8VlgQrUDNS6CFF+O9Rt3aOFeXoHdpx09BcH8iDdRUsMrQj9w60ne/5yI4pwxFA3zRtOVNIqyeHT9H+JwEzsgno72wquWVXxV3BBOiKukupQr6Exyr+b/4IKXfO9igt2h4P3JyhMffbcz4HmnC4/fUq6hte5Isuh55tb4TkqDAZAlfdBG++a+0pL5Z+HzbNkZvCgKml6Y7edYzqZYgCcj653j5mrpor8EK0AvOEZoA4AntTsaKgCFE+APRDaKHR3i6UsfT2T2v2PMH5fsFZ4SFyAVh7A==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc887e50-7a23-4885-5514-08dbc3e85e51
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 08:11:39.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBiDeMd9NuuePeZ5LZD2xzWL9PHYCFFxuL1p2VhDLumEAli9BP4X/qG66r9pkCVqt84vcVNtn2EJgJSDg0DNoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1944
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tam,

On 9/29/23 05:53, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
> Hence, we should disable TX_EMPTY irq until I2C DW receives first data
> byte from I2C device, then re-enable it.
>
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.
> And it is none after applying the patch.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 55ea91a63382..2152b1f9b27c 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -462,6 +462,13 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>   		if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
>   			/* more bytes to be written */
>   			dev->status |= STATUS_WRITE_IN_PROGRESS;
> +			/*
> +			 * In I2C_FUNC_SMBUS_BLOCK_DATA case, there is no data
> +			 * to send before receiving data length from slave.
> +			 * Disable TX_EMPTY while waiting for data length byte
> +			 */
> +			if (flags & I2C_M_RECV_LEN)
> +				intr_mask &= ~DW_IC_INTR_TX_EMPTY;
>   			break;
>   		} else
>   			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
> @@ -485,6 +492,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>   {
>   	struct i2c_msg *msgs = dev->msgs;
>   	u32 flags = msgs[dev->msg_read_idx].flags;
> +	u32 intr_mask;
>   
>   	/*
>   	 * Adjust the buffer length and mask the flag
> @@ -495,6 +503,11 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
>   	msgs[dev->msg_read_idx].len = len;
>   	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
>   
> +	/* Re-enable TX_EMPTY interrupt. */
> +	regmap_read(dev->map, DW_IC_INTR_MASK, &intr_mask);
> +	intr_mask |= DW_IC_INTR_TX_EMPTY;
> +	regmap_write(dev->map, DW_IC_INTR_MASK, intr_mask);
> +
>   	return len;
>   }

I tested this patch on Kalray k200 and k200lp boards (Coolidge SoC, kvx 
arch). With this patch all our CI pipelines are green.

Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>

-- 

Yann





