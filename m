Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D283C5958FE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 12:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbiHPKxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 06:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234278AbiHPKwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 06:52:45 -0400
Received: from vsp01-out.oderland.com (vsp01-out.oderland.com [IPv6:2a02:28f0::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD99857C9
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:20:11 -0700 (PDT)
X-Scanned-Cookie: 267db6f8f9a97f6a9e31a6b4b0d50f1894f1cfd3
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
        by vsp-out.oderland.com (Halon) with ESMTPSA
        id 01450667-1d4d-11ed-956b-cb16337fe68d;
        Tue, 16 Aug 2022 12:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=67arQAyAyajrrm7hSqevVYj/6faYuHzkCalPvGU3llU=; b=sINgSQooPIqm6l9ZrNFTXAAL57
        rPnYiJMOQ/PKkUw7B/qebpegt3tK4NU4ikNnheNTcEbMO8RKPwqxLeFV8vMRWLsxmE8X7gzTfW5fp
        sV5Tq+qke3wBNYJr9RtsUnaPn9JKnA4qgj0IJTtfnvPNAugE9+w5mTHWdo8Ux9PLKUqntR69spxtw
        ercLDvFWMm1hwkqpWE6E5tn4PLLjl7rsginaPJXl/qSkiorwg5rFcYkcdSS6dmoR2Wg9WpkJ1xDt6
        w4LlBTvfxY54lfKZrLDzLj37V2FXdMDTApnetCEzA7g7ETJHmBa3k6hZ3IabpPz+pKoPuG6Ccok0y
        BDE3hcpw==;
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:52648 helo=[10.137.0.14])
        by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <josef@oderland.se>)
        id 1oNtg9-005xUz-VH;
        Tue, 16 Aug 2022 12:20:08 +0200
Message-ID: <3877967c-5bea-d930-be36-23cc42613e34@oderland.se>
Date:   Tue, 16 Aug 2022 12:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH v3 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org
References: <20220708120958.74034-1-andriy.shevchenkolinux!intel!com>
 <4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se> <Yvtu29D/LkoMzubP@shikoro>
From:   Josef Johansson <josef@oderland.se>
In-Reply-To: <Yvtu29D/LkoMzubP@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
x-oderland-domain-valid: yes
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/16/22 12:18, Wolfram Sang wrote:
> Hi,
>
>> I tried build Linux 6.0 and run under Xen 4.14.5. I got a kernel null pointer dereferenced while booting. Reverting this commit allowed the system to boot.
> Thank you for the report and the provided information. I will give Andy
> a bit of time to come up with a fix. If a fix is not easily possible,
> this will get reverted for rc2.
>
> Thanks again,
>
>     Wolfram
>
No problem, I'm just testing out tip.

Not verified by anyone but me so it could be me just having odd kernel 
config.

Regards
- Josef
