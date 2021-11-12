Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FE844EB8A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 17:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbhKLQqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 11:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbhKLQqI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 11:46:08 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FDCC061766;
        Fri, 12 Nov 2021 08:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=ZJr7h+aiUJaGofCFppdFarePecaKlzFMCXf5qGKbWtM=; b=RU82OzPk/fSguZ+uwDMcWgvHPO
        HgB2Q21AvTXvWu3+NgiwEQ5h7B+1m5tVmnzf1EipFpboQS8YWlRd0DO4IV1oQJog0uumD1t5diy8m
        lGFcKat+W77CnSBp8fBq+sNBKZrXmJKsyc6Dls1K+VuvtrOq0/MokcTfUGcqcARX0hJ9XWnqUR+9A
        fnX6co+GSbTTy0Q4g6fPE+izT9Wrx5G7JSpkCC0QU/FRK9gsg9NQlEtEIoZm38WtD7y/A4V02lK8R
        xFqCNoxVnlVsI3FqQwUnPQi6m5qKORTQcD37L0YthwvWK+5NR+v28uPxzBaV5WXC6M32QjPFtNtwO
        VSdPZ9Lg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mlZe0-00BFtt-Rk; Fri, 12 Nov 2021 16:43:16 +0000
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
 <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
 <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
Date:   Fri, 12 Nov 2021 08:43:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/12/21 8:26 AM, Andy Shevchenko wrote:
> On Fri, Nov 12, 2021 at 6:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 11/12/21 4:34 AM, Andy Shevchenko wrote:
> 
> ...
> 
>>> + * @rinfo: I²C GPIO recovery information
>>
>> Preferably:   "I2C"
> 
> Why?

See below vvvvvvvvvvvvvvvvv:
>> like it is in thousands of places in the kernel source tree.


> UTF-8 has been established for more than a decade. I prefer to use the
> proper form of the abbreviation (*).
> 
> *) Check UM10204.pdf.
> 

Yes, I am aware of what is in the spec.

thanks.
-- 
~Randy
