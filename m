Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447FF79E2EA
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 11:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbjIMJEZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 05:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239209AbjIMJEX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 05:04:23 -0400
Received: from smtpout30.security-mail.net (smtpout30.security-mail.net [85.31.212.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B721999
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 02:04:18 -0700 (PDT)
Received: from localhost (fx305.security-mail.net [127.0.0.1])
        by fx305.security-mail.net (Postfix) with ESMTP id 38D5830F44A
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 11:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
        s=sec-sig-email; t=1694595857;
        bh=NbieujmM9AHMOSHkv73hMP2Yjd2prVovJcBLg0nt/G8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=NsQpsXjOZEdQN2LIUKCpcmuCKp6LK0Ud5P70T3kB7sAwvd3dEC4yhyUMslv0MJgKU
         w6rG7GZNZ9eZAy2KZgf97zBfMZkyiuTqJ88e7fL0CabbChqjg5hhGU9xhFHEuhYy8h
         Du93WLgZMZA2dsUGUfi9JlNDzs+YHIu5CRGxjXaI=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id 76AEB30F380; Wed, 13 Sep
 2023 11:04:16 +0200 (CEST)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0101.outbound.protection.outlook.com [104.47.25.101]) by
 fx305.security-mail.net (Postfix) with ESMTPS id 0B54830FB79; Wed, 13 Sep
 2023 11:04:13 +0200 (CEST)
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::5)
 by MRZP264MB3049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 09:04:12 +0000
Received: from MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9]) by MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2a88:7ccc:780c:c9f9%5]) with mapi id 15.20.6792.019; Wed, 13 Sep
 2023 09:04:11 +0000
X-Virus-Scanned: E-securemail
Secumail-id: <354e.65017b0d.1a69.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0OJwSJnxtvo6OTxIkpFMnMcjp+x7VW1ji4dVZjPRW18SQIv/BAP4vQuvPgv3YNmDvJ/luyxatpMVL0JNHNMTZQLcOLxdlH4KJSabxVayqlu0qRh3sa3XYdGPNCimxdbPmDvmG4TM3mUhHvBh8E0KYpPWKrqm3a1VQOgejriGu38B97EOODVb1Z4quGegLoOnfQUl8ln1MqsfSQmqfeg2+SSUXQluxbSJ14Iqm1URZbNlR38aCQutBViUVxTfRFArssiDAt4COFR25USfcnI6WAQZSWDmM4kSAkYNlw7MO/ujAOBttKupiw8BPKh0UN/izpI+p+M3avKPmPWoKtNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tudSzXbq78fS0C8rMCd+8JUP2CbhXH5bXG9NP8UHuRc=;
 b=MElltCIhLBNObuiH1r2c3ZXXw1BJG7F2lTR9Ho8EwgwV8eIeubFLmCWa0dOGgMnf7+gLxAAZPLriNmoHoXz9t9uSXPHfr6Z+gedIOET9DFDmSIzAm/ZFGhTF/pzKXqqLjMMXCF6AQA5set/uAU64s1/VkO+Rn6QHXywfSnrFpDyDPVf/INntPgkmXH2sC/G7q2dVWmls9Jq15njSTJg1iZDse1Uu+TryMTzUOH8RSjX1zoRrn23Y3xhbrV8jq5hpJjc46xOYH/l+Rg31GHyAQtB07VtZ2UZiqku90rJafEQXKu3sZP/CkRGqL2vVq9ahjQoQBneytJsBShEdfnurXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tudSzXbq78fS0C8rMCd+8JUP2CbhXH5bXG9NP8UHuRc=;
 b=KlHawRF3Qu4FTlD5npHPnwSkn0QNUGHZzcUl4Xx7DwtuVyBHWhKFzRig+iBmZHpG0SC1mK25YaDdKjF6Aqdk/42kbbwE9KI66P+s1IsgxD91P/RznLdPg8YdnGkZ1gvGAZyv+HNe+rHZ7KdEJKgKdJAXeSvC84JxhuidVWqEHTy8idxVgcneaBY/CdQRgz/xo5JitcDCB1xZstxfBAxnUpv4zMWhumqTX7D0CzVWYbMHaZwrwqfCJFwGSJB1jolNAAWRrOiygO9D0awxM+TGnttqasbyONlV9rwqIGybUKOODZPxwZGyfzHBdvjwHDsO9nUNTYc7HEo213Y2PQMU9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <4537fa1c-b622-674c-026e-8453eda0a4d1@kalrayinc.com>
Date:   Wed, 13 Sep 2023 11:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: designware: Fix corrupted memory seen in the ISR
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913010313.418159-1-janb@os.amperecomputing.com>
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <20230913010313.418159-1-janb@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::16) To MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:13::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB1890:EE_|MRZP264MB3049:EE_
X-MS-Office365-Filtering-Correlation-Id: 638b07f5-8250-40ad-ceae-08dbb438657a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gif5ZBcyEydBEfsbLn8bDHpWyBHRdDLyZXkQmwbu05zaV8h8Ix3qB+DTpFSOmpqw9t9PirOWwRV5iTW5ywJ/opCmIIUD0N800neO0yAmfeqZGOqYoADLTHopjJTG7vgtUFYs1+lNKo3nkuBGKZz9M0qyLWDI2VBFhxUuP2S+6Jvvc98MsB8UqjtFq+V0wPRLPJESRgGqTq8d8dHexJ8ba2xhulOyhucG/3CnKM9TcEsdN1/g9kcSWD/Se+wupQrF/2kUcvzDNibOj1RSVdc8PaYV+pL7b1L/UarHhqQU9j2OyfMVSV5ddqtEB5oA0IU1q5bp6mISDR+boV/CURFXzhkgqhJWSkDgaoYHMluClyxZk9LLurzHL7fJy/s9VlCfPqFjMZf7sfk0+06RPuVxCZ+F12Eb9zimolTEB1oRbk1lkjeGZ//SElybNooSLYkFotfBIh6+1GsfsJ70SXjHuU/972XJ/MGNOCebVCqSBBvEZVqjP4kz9h231HETEqNjV+8AuyvSnDBKBHMwlDVtZ3De1a+CbBs7H6CoVkIFwaN5U4Q2jFzubSK1QRo+7idGnqz6Jwt0VPMZM1Jrp0e/tXoGU3A5pcRUiOVrv1qr58DN4mEDTwvmt1UIF2ukg0Dvxv1OCwFmIBPfZ2D9WLk2og==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(5660300002)(31686004)(36756003)(8676002)(8936002)(4326008)(41300700001)(478600001)(66946007)(66476007)(66556008)(110136005)(2906002)(6486002)(6506007)(6666004)(53546011)(6512007)(2616005)(83380400001)(86362001)(31696002)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ocr2VbArVOJfzMdKmIwvq6KAwadAr2QZ/pGytG/a2pi5uZdhCgal8lSM+/wWoqGC7rOIMg3n/nHwUKcrrouBfuS8oa3VRAzV9HbsdJGA1aH0tGBiurDqkGiAJWS2znrMhKQVKpIEYtXcxrDi+om0e+mybQJbSeJSMmxt+rAKM/oqw/+0xu1gzOny0hNQW6OTpi/zPcE+O0vv2HWk3+ji/zAmABbNqHPc7Kx6B1NPPrlQf6m7/5oY7VW3a4NEzkd/f/Xt+P/EUcVA2KdrVfLz5a+ADWB/Hxs8awjrUir5Xxdk2AVORXquwH8HGFV6L8jluI0BmCCzsECxHMTTm2vJPDfFmJmFFoh8N5pvzpaorfLop8oE9fJv3aoAYAQQmvu3EjJZqC8zyhQIO8fQH1j/FAi21zYrXfHnKqSghONCsdavt3kvoOz6H2BRXtSArPrVkERHYVFwipwogwNWjC9hBr+FT3CsXXZMxDDcKSCfszcixgwkAMHOqEazxu/BUKo/PUy5kURQ2dk6QgaiQxoIdGxF6bNw/JuT3sB1aubTwTO7zTsm6bhWnkTmoOodhgy2dvTSAfFi8ObyjVF5BE0x9abxaqgnkR6GJ3uCyIIKKUrV197MqUqJgy3zdsdH+bIJZYy4qxB59vbx30QLw3iFiwnJMFqtUjpntZ0f7OtcGVWSs+8cC2UJ133e0A9yfYCvUh2vk1EaRnBm4tirzZjjxQHsViw1vvX/LDTG1TEWi23L9LqPXfHNqy3f5zFHvYskT4KXhSnypQrf/iyr8ItbI4oAHKBB7MwBVnvxsmICiiC2u0j/+FycgXYmHYrRq0IDtTtBho0KjUSYVrhg/9SavZqj3WlNI1JzH4vtOYPDx14GaOujI23/IWFBcRUw1rzJNFGJEVt8+3/uZ000tXB/uyRZhXDqoQmWhCwULLDzAMpN02FVc5TPJmPLGxRSwgcR
 br1tAQNtdiooAmBP1faY+/tLjb3F9JP0KjGTSgv8nfLnbDVd0bS10SEkJqoh2Ea7SrBDKKhNa8UagXjYfHW3nSwAQ0gWJNzo0LkaMNWjUEfHcCb0cRQmcOpuViahQdXFsswyWbgzloTLgDZZaUO+psYY00YzL/NC5vKsyg9JZfD0wGV7xZsZDXFfiAJ5nlZfdHMW02W9PWXG4K5Q27M7bwNfaHkN8uiXkzKYIEAXDr/pWclnczz35c3l9sp44kP0W9xRN10uneb34wYpnPmXWRe1GDxqPzBPpL8WD4O13lRrjkst3ZdWorufXUM9dz45WteBMNxAKV5hrHEdcw4qiGx97NQCRmDfbiYG07oh71nAuCgzZ3iWw6GgH6ujA1tgkUNI+VnTYAFjUrBA6KCT60K2NRKrXYLxRu7eMsVPGeUuDD/rtQ35kW25Y4lcSpSHMgMqeGRcBLg3JAt/C3Ef+nh2fgqjtZLJZ8lak5cl/TfPKSQjFp2Kfr9gdT6mLv7kjVsfVuI06zxgPBJpbw1Q9GDKU5bYewFd/i/8xH+ZOJe0D523wl/JNvVQiUvuz9PDPJWIm56twp7NfxQQ9mmcpN6/+ZuJm3yq8zfz531X/EUIlmbKlQDnVwPtdYgiPW/Qrg1hVPn8T7DYmpPFgwnaCvQWpYyCkRAD0iR5BAC984u6he278y8Dq3kDe7bFN9MHEtTeyLq+HRh0wD5S4QJfGg==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638b07f5-8250-40ad-ceae-08dbb438657a
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1890.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:04:11.8349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMMm2qkbbgr/10Qj/OlXSxDsXHLbM6uGP4Ss0t5rv5fDhAoIof+0wFJ3jETQlbFhwadaC1ZwxhPWDXrmuVIzNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3049
X-ALTERMIMEV2_out: done
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan,

On 13/09/2023 03:03, Jan Bottorff wrote:
> Errors were happening in the ISR that looked like corrupted
> memory. This was because writes from the core enabling interrupts
> where not yet visible to the core running the ISR. A write barrier
Typo where => were
> assures writes to driver data structures are visible to all cores
> before interrupts are enabled.
Maybe rephrase this using the direct style describing what the commit 
does like "Add a write barrier before enabling interrupts to assure [...]"
>
> The ARM Barrier Litmus Tests and Cookbook has an example under
> Sending Interrupts and Barriers that matches the usage in this
> driver. That document says a DSB barrier is required.
>
> Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
> ---
>   drivers/i2c/busses/i2c-designware-master.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index ca1035e010c7..1694ac6bb592 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>   	/* Dummy read to avoid the register getting stuck on Bay Trail */
>   	regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
>   
> +	/*
> +	 * To guarantee data written by the current core is visible to
> +	 * all cores, a write barrier is required. This needs to be
> +	 * before an interrupt causes execution on another core.
> +	 * For ARM processors, this needs to be a DSB barrier.
> +	 */
> +	wmb();
> +
>   	/* Clear and enable interrupts */
>   	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
>   	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);

Apart from the commit message it looks good to me.

If I understand correctly without this wmb() it is possible that the 
writes to dev->msg_write_idx , dev->msg_read_idx = 0 etc would not yet 
be visible to another CPU running the ISR handler right after enabling 
those.

Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>

Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>

Thanks!

Regards,

-- 

Yann





