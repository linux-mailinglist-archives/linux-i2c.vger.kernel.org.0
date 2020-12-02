Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E892CBA13
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 11:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388521AbgLBKFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 05:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388373AbgLBKFS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 05:05:18 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8992AC0613D4;
        Wed,  2 Dec 2020 02:04:37 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id r3so2988918wrt.2;
        Wed, 02 Dec 2020 02:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5IxG6Wmtw+u+fIWb/sq8BW3pfIfvQKBkdCaDxJ1S95c=;
        b=NpQdnAYkM3hYe9lUCXxuMvi8tbwkduhwURKx6KDiuLc6/cdZG5tOva+7i64PV4qO8U
         9YkoBmvBgmLj34TfwoUiWkuFCPGi8bm9Ipc45b7NrOw0Fbku5BlsKXtFNXLJfSDey7n2
         yrBSsTodw2xtihanyGz639SR1r0kbsTKhw72DLiHgpQJ5hlk/a1ayOpVxi+PF7iXIJsN
         vJ0sasIjv0rbhDRXHNZzZ2YreO1VKa+RDSTbQfoHL3Lj8ur/kRuuQG78GvJ/RRYGfxTL
         SUsG0ZYn7AxNIlRZSweinYRyZsN8E62fI0L7OcS1oo5KKFcMKLCSK93aWuoFpfOy+5i1
         ZkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5IxG6Wmtw+u+fIWb/sq8BW3pfIfvQKBkdCaDxJ1S95c=;
        b=JmvU2Wxd24QSGkVRgDhdHjZGVqo4hH/e0dKxVZQsh/XBU9LA2R+3S/Z7o3FRUL8hIV
         cFtonlrK/mknoW4rW0uSIMUO2YQrax4Yz5iiC9eF6d+2wWX3JPy6VbsXygiO0Xg0cAJA
         xS5ExbCX3s90M09Cueece1dofS7uuAqxO/5fkgjh70UIupR0an459DsjcsIWtoIZxFkQ
         eS5w9zlnzoNtwskIZab3oeU0ERNOR0omIYH0xFMY6IPxrDSK+B5ZT+G3g0Ii+FTea5C2
         uxPcQePOOeGGDvfI2RhL7/3sre4u3W4T6Byg3e+amD7poYOy12d8L8fwh/Pn/c1KKv29
         k/Lg==
X-Gm-Message-State: AOAM530W4K/1el+Yqg8/5kJl7/8UUmrlXqa6Risf3jVHkbdwisXK0Kaa
        2JUJCb3CJKfdpwwcPoFFalo=
X-Google-Smtp-Source: ABdhPJyfCYV6cSul4aJwkW0s7CGv3wEXRYxHe9IRaq8ViOmh8mGPw7XsoLPWFps7rtnR4dQGcGN1rQ==
X-Received: by 2002:adf:f085:: with SMTP id n5mr2327047wro.371.1606903475998;
        Wed, 02 Dec 2020 02:04:35 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id q25sm1519063wmq.37.2020.12.02.02.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:04:35 -0800 (PST)
Subject: Re: [PATCH 06/18] software_node: amend
 software_node_unregister_node_group() to perform unregistration of array in
 reverse order to be consistent with software_node_unregister_nodes()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-7-djrscally@gmail.com>
 <20201130161716.GJ14465@pendragon.ideasonboard.com>
 <20201130174728.GR4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <962775e3-0e96-8a05-b618-fad60abe9ecb@gmail.com>
Date:   Wed, 2 Dec 2020 10:04:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130174728.GR4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/11/2020 17:47, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 06:17:16PM +0200, Laurent Pinchart wrote:
>> Hi Daniel,
>>
>> Thank you for the patch.
>>
>> The subject line is very long. We try to keep it within a 72 characters
>> limit in the kernel. That can be a challenge sometimes, and expections
>> can be accepted, but this one is reaaaally long.
>>
>> (The same comment holds for other patches in the series)
> 
> +1.

My bad; I'll go through the series and condense them down as much as
possible.

>> On Mon, Nov 30, 2020 at 01:31:17PM +0000, Daniel Scally wrote:
>>> To maintain consistency with software_node_unregister_nodes(), reverse
>>> the order in which the software_node_unregister_node_group() function
>>> unregisters nodes.
>>>
>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>
>> I"d squash this with the previous patch to avoid introducing an
>> inconsistency.
> 
> It's different to previous. It touches not complementary API, but different
> one. However, I would follow your comment about documenting the behaviour of
> these two APIs as well…

I'll update the documentation for this function too.


