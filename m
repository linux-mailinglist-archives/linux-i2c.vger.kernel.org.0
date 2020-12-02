Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F83D2CBA44
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 11:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgLBKNq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 05:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgLBKNq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Dec 2020 05:13:46 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C872C0613D4;
        Wed,  2 Dec 2020 02:13:05 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id i2so3032961wrs.4;
        Wed, 02 Dec 2020 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YRo9NkVz67RsSz0oVAn5GaGR1jVGmdNG0sWFEV/nvQY=;
        b=WGnCqwDEYoCmaIZWjfTTHAZDUtVsG5Lzp/JBM1/mORzyojtcyMVDgR+RNLPHJFHBZu
         m3Bta4JN2TcKsRSmjNy4iYNA8p1DtJ3TxooNkkc7UsVc7OW0WCOVC1wPKgEm0GIJQ9ev
         8zJMONjWuSVT7Y4bth8d+GUImk8UAsdN87vTPaSy8DrecQHkLr0ly6BENn9l5U2l1cEt
         6gDkyRXr9ewid+od3LdbOiLE0mxHRJvq3eGlU6FxQRhb2fwFQxJdkVtzFsFuKic5DuZh
         As4zjaekYuIsWz3fuGldU3CVztCWAIKDt3MwPzKnflBwnqhPpaal66/pPznlsurpLLIH
         kJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YRo9NkVz67RsSz0oVAn5GaGR1jVGmdNG0sWFEV/nvQY=;
        b=BCDIZ2u491RFjjTkx3OwCUMrz3/kg25u7PsIcs6DnVMO7nxD5iC5HYcfIk/SFcwrb5
         2i//t0yAzkm6OJqxbHSiA1gZoaOX4PCdf2qA/GJegWhghqE1n7h2wUy+bj/+FfKuX6pR
         bDOmrrH80W4BPOBqfpWujo4IBsvyMxdJmsAV5RDJgfu7SMzTAmqEbc5t5DuWcHf55X5U
         dD5N66APs3wKYoaq++hivTBFOioGbLBYminnIjv5rWiOnq37EocywcxJpuM+FQhK2zi9
         4Dean3PlX12BsSbnmBH5wbn4+r5f9NdUBSjgeVkYNaqkR16KnVyLJK4oKdwMGFTDMV0J
         c3MA==
X-Gm-Message-State: AOAM531h9TSlBMREPVlOCezgYgUhQIzjhO81asSALYDnJQT/QBf2ZPgk
        a/C+VGS4QD52WUlr9nhPJmo=
X-Google-Smtp-Source: ABdhPJzlrjn/IAtH113SPOWhBEj0Ja0tFBc0+q+IGME/kgo84LPEvrTuspSOlOj8i7DBMa55WqKmNw==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr2531897wrn.56.1606903984312;
        Wed, 02 Dec 2020 02:13:04 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id f18sm1478886wru.42.2020.12.02.02.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:13:03 -0800 (PST)
Subject: Re: [PATCH 02/18] property: Add support for calling
 fwnode_graph_get_endpoint_by_id() for fwnode->secondary
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
 <20201130133129.1024662-3-djrscally@gmail.com>
 <20201130172900.GM4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <e90e2ecb-d0d5-fe95-0bde-b3d02da6540b@gmail.com>
Date:   Wed, 2 Dec 2020 10:13:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130172900.GM4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/11/2020 17:29, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 01:31:13PM +0000, Daniel Scally wrote:
>> This function is used to find fwnode endpoints against a device. In
>> some instances those endpoints are software nodes which are children of
>> fwnode->secondary. Add support to fwnode_graph_get_endpoint_by_id() to
>> find those endpoints by recursively calling itself passing the ptr to
>> fwnode->secondary in the event no endpoint is found for the primary.
> 
> One nit below, after addressing:
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
>> +	if (!best_ep && fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
>> +		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
>> +						       endpoint, flags);
> 
>>  	return best_ep;
> 
> Can we, please, do
> 
> 	if (best_ep)
> 		return best_ep;
> 
> 	if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))
> 		return fwnode_graph_get_endpoint_by_id(fwnode->secondary, port,
> 						       endpoint, flags);
> 
> 	return NULL;
> 
> ?
> 
> This 'if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary))' becomes kinda
> idiomatic to the cases when we need to proceed primary followed by the
> secondary in cases where it's not already done.

Thanks - I made this change too
