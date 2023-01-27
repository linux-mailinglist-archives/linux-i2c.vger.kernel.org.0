Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897DE67F12D
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 23:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjA0WeY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 17:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjA0WeX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 17:34:23 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F019668AD7;
        Fri, 27 Jan 2023 14:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=dZ0yoI1EYq5VvW98U5aa31PACmLs8B3+1hTJZcF0jRM=; b=i7weQH0caDwnGvyTl9WiMTLxTe
        8dcUW9q8dUU29PgVe81Ovd1dIHJ1kb/vy8FCuMlHj0cqW6IUpct+oRHu5McksCmiwTVH/Vj5IsHgn
        goZZ7CYDcQ8zdNH+wIrlEe43/igko0xm6x4d0yIskCIx8p1C0OKviYJDnKSVyLbKMWNp/3jQFH2xz
        xUQiUrjW2KKm0B/L4yId9myJiE2YRTyyyf829OSgsez+QqmG8ubuGJd4Cz1WbmU941qXnaO931FTe
        SOA4gK5UCpXPekPQdcenMlFsll7/VHIqe33zi6vetMwCZ5A6tW0UrpZq2fFBXGNrxyvlQ1yQQtfic
        D0QK7L4A==;
Received: from [2601:1c2:d00:6a60::9526]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pLXIW-00GihT-Ou; Fri, 27 Jan 2023 22:34:16 +0000
Message-ID: <ce18988a-775d-cb74-0ee3-acc24ee45c70@infradead.org>
Date:   Fri, 27 Jan 2023 14:34:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/35] Documentation: i2c: correct spelling
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20230127064005.1558-1-rdunlap@infradead.org>
 <20230127064005.1558-12-rdunlap@infradead.org> <Y9N55pFZc6TRD9S2@shikoro>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Y9N55pFZc6TRD9S2@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/26/23 23:14, Wolfram Sang wrote:
> 
>> -  client->irq assigned to a Host Notify IRQ if noone else specified an other.
>> +  client->irq assigned to a Host Notify IRQ if no one else specified an other.
> 
> I am not a native speaker, but shouldn't the last word be "another"?
> 

Yes, I'll correct that. Thanks.

-- 
~Randy
