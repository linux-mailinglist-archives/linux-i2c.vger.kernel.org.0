Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC0D2CB0F0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 00:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgLAXhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 18:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgLAXhh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 18:37:37 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61ED9C0613CF;
        Tue,  1 Dec 2020 15:36:51 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id g14so5607098wrm.13;
        Tue, 01 Dec 2020 15:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7sUGZ0C1VzmQor0k4LyPdjyeNKgu9pB510miHNyU0Kw=;
        b=O1EJwLBqo3iXb4otDDAeqXBqobKVPj8KcIx4YHqZNnRlivnR88lWqCUYtu/ZwkXfzP
         YsQg/Gn6kXTVqoIJUiKrKrsJWQbWOLhv3lM0cx9A7I6BFPGmUr1bHuq+JNlPVCe5ldt2
         gVYNr4XgUVXmMEc40/CXjLpCzQBLyrGCi4IKDFEORfDTrDDlxV4FdvHfszxBuJ2E0rs7
         gUWP92AW4Wf4kL0PLkouUyb8CrMM+OE0thZrBz3kzqEeHLXU0quiQb9mGgyVAFEYM36Y
         dR3ZY+nB6XZe3lzrlCnWZ77Q2duqWs8UbyFs72/I/fvsGSYjhYGdu2hj1E64FnR2QkA6
         iYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7sUGZ0C1VzmQor0k4LyPdjyeNKgu9pB510miHNyU0Kw=;
        b=GZuhRGCr9QLE9SOCL6DkIh3yZncY9U61wFNIzy3XnechI+91Q2kasznOcNusWh+gkl
         IvflxzIETKUAt2mOHLR2kAsABKNe5tfy1J2ynhBa8VDmegg6OoBb3zw6qgoYw3xYXwEr
         15o/b+O09i2dFuRzJNW4o4iA9fuyumHC85qgPphKXKOVi7XzxzzyJyua7/lzTuSolEYE
         K33XvfJLgq22q/8OAWJlME528F7CFrcTXF9jKt+b4GNTDhfFnX0U/rwu2zaYbXQh/hVl
         lzw3lPr4EzuiS/Rf8ErXDPNC6bOrbcmwAdaQozjEo/zHyMY1m8DQi8DX4ONMMCVy1TXb
         Q4WA==
X-Gm-Message-State: AOAM532Df7JPQQyaWTdYAkeWG0gSrGH3/vib6ypA1qfIWKSV+vJPG2qO
        PWrG2Uyfg4YDo36SFPA84VU=
X-Google-Smtp-Source: ABdhPJw1d87LKchfc8aeYK0iCGKEUNSZrqa9Jb/kl4KV0quN86bFmdh9Iq7fnzbeLVyv0N7gObyo3A==
X-Received: by 2002:adf:f84e:: with SMTP id d14mr7167950wrq.390.1606865810148;
        Tue, 01 Dec 2020 15:36:50 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id a12sm1623773wrq.58.2020.12.01.15.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 15:36:49 -0800 (PST)
Subject: Re: [PATCH 05/18] software_node: Alter
 software_node_unregister_nodes() to unregister the array in reverse order
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 <20201130133129.1024662-6-djrscally@gmail.com>
 <20201130174542.GQ4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <85e5ece4-20d0-1bad-14f2-b45dbbfcbfdf@gmail.com>
Date:   Tue, 1 Dec 2020 23:36:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130174542.GQ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 30/11/2020 17:45, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:16PM +0000, Daniel Scally wrote:
>> Software nodes that are children of another software node should be
>> unregistered before their parent. To allow easy unregistering of an array
>> of software_nodes ordered parent to child, reverse the order in which
>> this function unregisters software_nodes.
> 
> Should be folded in the previous patch. Otherwise we will have a history point
> where register() behaves differently to unregister().

OK sure, I'll squash them - and thanks for your comments on the previous
patch, I condensed the conditionals as you suggest

> ...
> 
>> + * @nodes: Zero terminated array of software nodes to be unregistered. If
>> + * parent pointers are set up in any of the software nodes then the array
>> + * MUST be ordered such that parents come before their children.
> 
> Please, leave field description short. Rather add another note to the
> Description below.

Ack
