Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FABA4508E2
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 16:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236685AbhKOPuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Nov 2021 10:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236608AbhKOPuF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Nov 2021 10:50:05 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B81C061570;
        Mon, 15 Nov 2021 07:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=J7uXGJmhnlDyH4Tj71s3ZSy+aVBqj936IH1uygv5tSQ=; b=N5NGkn74xTAQgR6H6/JiDFJh+H
        9jPfupoupMUbmVuCvty3+FSdeFBDHNS2Hzp8Id2opL0Gb8/v+K/bB/KWdfAXcCOamV2RatkmAlRuX
        yid50znxCh40yyxmD5koUeM8mZW0ACfBIqttmRDGEIiuYlnEvzzOffftif60b2HplpvoDzTWfiYn5
        V0Is3XHr/iZtzwRxVCfNCGaQXkZApAih03RDHc2zDbYHJcx6+zqKHx5abvhgdqRK1I2wvHSRmx9w6
        vhUfpgojZEx1fQOKBlf2EJ8MM770fSZF9le+KRjh385av/DodQYcL44lLhZF6XZFE9MVKy503viiJ
        +hbsDnjQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mmeBv-00G5No-6Z; Mon, 15 Nov 2021 15:46:43 +0000
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com>
 <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
 <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
 <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
Message-ID: <767f36e9-e043-06dd-f847-7405524b432e@infradead.org>
Date:   Mon, 15 Nov 2021 07:46:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <07932f56-ec2d-46a5-7c8e-3f4aab7afd35@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/12/21 8:43 AM, Randy Dunlap wrote:
> On 11/12/21 8:26 AM, Andy Shevchenko wrote:
>> On Fri, Nov 12, 2021 at 6:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>> On 11/12/21 4:34 AM, Andy Shevchenko wrote:
>>
>> ...
>>
>>>> + * @rinfo: I²C GPIO recovery information
>>>
>>> Preferably:   "I2C"
>>
>> Why?
> 
> See below vvvvvvvvvvvvvvvvv:
>>> like it is in thousands of places in the kernel source tree.
> 
> 
>> UTF-8 has been established for more than a decade. I prefer to use the
>> proper form of the abbreviation (*).
>>
>> *) Check UM10204.pdf.


> > Yes, I am aware of what is in the spec.
> 
> Wolfram, what do you prefer?

>I prefer I2C. But it is more a reading habit. I would neither enforce
>I2C nor I²C.

OK, let's leave it as Andy sent it then.

Acked-by: Randy Dunlap <rdunla@infradead.org>


-- 
~Randy
