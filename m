Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08095B1464
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 08:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiIHGHp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 02:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiIHGHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 02:07:44 -0400
Received: from vsp02-out.oderland.com (vsp02-out.oderland.com [IPv6:2a02:28f0::26:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9D3A7221
        for <linux-i2c@vger.kernel.org>; Wed,  7 Sep 2022 23:07:41 -0700 (PDT)
X-Scanned-Cookie: 267db6f8f9a97f6a9e31a6b4b0d50f1894f1cfd3
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
        by vsp-out.oderland.com (Halon) with ESMTPSA
        id 8aa1c8a6-2f3c-11ed-896b-b78c77300f9c;
        Thu, 08 Sep 2022 08:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=7JqDpecRODlTuakjMauVpsCN7cmSweX5A+Tuq3G622o=; b=KU0yVNqMlg0plNl8/TAr/32za8
        Byl78iUSpA/VCl3dwojDCv5b/YvLlpbOmd0GPvPtQDU0r9WREaVzJYfKm14t7i1grFe3OnEVpkTIh
        iwhUrgQdupU7XwtKMM0WgLbSL0ypi5pgPrIG9s14KXBFAJZRJA4r3rnKjq9sMYAaBWTpV/8cxRO5K
        OIBy/uo0X3VE9jJF0G6WiuGW3erOYxxU8bi4UNkZa+U1Z5s18neWIdyaqZ+MaPIAgiw4fKmLxHu3r
        QlayX26IxftDFJbFd3ER33OBtRtZox/eJtYGq2ZcZy1saq1jQtfHtTIXT/lC954NX+sGDm3AdJJyd
        7xeKSGOQ==;
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:47584 helo=[10.137.0.14])
        by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <josef@oderland.se>)
        id 1oWAhQ-00FjFi-LF;
        Thu, 08 Sep 2022 08:07:38 +0200
Message-ID: <23c8fafe-af56-afb0-1257-222705bc36f3@oderland.se>
Date:   Thu, 8 Sep 2022 08:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
 <Yxj1ZQjBfdG1u93d@shikoro>
Content-Language: en-US
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Josef Johansson <josef@oderland.se>
In-Reply-To: <Yxj1ZQjBfdG1u93d@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
x-oderland-domain-valid: yes
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/7/22 21:47, Wolfram Sang wrote:
> On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko wrote:
>> ACPI core in conjunction with platform driver core provides
>> an infrastructure to enumerate ACPI devices. Use it in order
>> to remove a lot of boilerplate code.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Josef, do you have resources to test this patch before I apply it?
>
Yes, I'll make that happen today.
