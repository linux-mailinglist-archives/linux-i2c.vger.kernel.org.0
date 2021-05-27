Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1AE3926EE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 07:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhE0Fju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 01:39:50 -0400
Received: from first.geanix.com ([116.203.34.67]:51024 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhE0Fjr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 01:39:47 -0400
Received: from [192.168.64.199] (unknown [185.17.218.86])
        by first.geanix.com (Postfix) with ESMTPSA id 3D58E46261A;
        Thu, 27 May 2021 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1622093891; bh=Ea4RLXzKpmKcbvvfHICx48KNrLLyjPII0nhUV1PdrgU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=KRKlcCafVU9MyTGoRrlNcArOK6OJ771dNJvCEiWYz9FP/MpGk5DpCqvT1sy0LCmmG
         TdWLWk3IXRunt7uVnwhz0PDSFD1b60vNgd+UTuEaXqu9HHbOdz5u/bA1mtCSgyRGTz
         Z0mXiRsC5B6xWfSR0KJhZman6LlIkvuLLCq1Me7wp5UBzNyi99kvFYwfbzK6LHMEly
         EphN/AllDTtK8fNOzLP7/mHoQtyxLnEYEWJtEYAVS1/u4pnCb9wFD4Sy+5Yz155/+5
         vyanLhzg93VHBvxXzTiMerGVmxRJlWJMxNinrDcFXKHw9rwNLeYKu6MJaqwDHyHwzf
         gBXN318S8r+QA==
Subject: Re: [PATCH] i2c: core: Add stub for i2c_verify_client() if
 !CONFIG_I2C
To:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tom Rix <trix@redhat.com>, Wolfram Sang <wsa@kernel.org>
References: <20210526174436.2208277-1-jic23@kernel.org>
From:   Sean Nyekjaer <sean@geanix.com>
Message-ID: <e7029066-f66f-b345-adfd-5807d376de2e@geanix.com>
Date:   Thu, 27 May 2021 07:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526174436.2208277-1-jic23@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        URIBL_BLOCKED autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 93bd6fdb21b5
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26/05/2021 19.44, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> If I2C is not compiled, there is no way we should see a call to
> i2c_verify_client() on a device that is an i2c client. As such,
> provide a stub to return NULL to resolve an associated build failure.
> 
> The build is failing with this link error
> ld: fxls8962af-core.o: in function `fxls8962af_fifo_transfer':
> fxls8962af-core.c: undefined reference to `i2c_verify_client'
> 
> Reported-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Fixes: 68068fad0e1c ("iio: accel: fxls8962af: fix errata bug E3 - I2C burst reads")
> Cc: Sean Nyekjaer <sean@geanix.com>
> Cc: Wolfram Sang <wsa@kernel.org>
Reviewed-by: Sean Nyekjaer <sean@geanix.com>
> ---
> 
> Note the broken patch is only in the IIO/togreg branch at the moment.

Didn't quite get that the stub was should go in linux/i2c.h, thought I had to make a stub in the driver.
But this seems appropriate :)

/Sean
