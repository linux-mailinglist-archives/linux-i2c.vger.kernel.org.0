Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55EA7E4BB0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 23:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbjKGW2q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Nov 2023 17:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235158AbjKGW2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Nov 2023 17:28:45 -0500
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2D1A125;
        Tue,  7 Nov 2023 14:28:43 -0800 (PST)
Received: from [100.64.208.100] (unknown [20.29.225.195])
        by linux.microsoft.com (Postfix) with ESMTPSA id EE43A20B74C0;
        Tue,  7 Nov 2023 14:28:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE43A20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1699396122;
        bh=S9s3c5YNHfRfLceRTHugRNStaMoSl9vmEEBV0lGYlMs=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=XtA/Oe8SbUmElUAGnJgU6O4BudYZEW9MerJPkZVPuJBFyH6J4u28iPg3jucGxQefV
         1PUwKCALbfRY3zK0NHu6bDP7/DDbvIPGt5RpyrMCzx9WHbaA6QQfuHHKNIROk6cWj0
         +CuOHNyK5fsT+DxIt/Na+RUxfyOSXL4ofet19bA0=
Message-ID: <6231246b-f8a5-4a6b-a7b2-dc2815ffa85b@linux.microsoft.com>
Date:   Tue, 7 Nov 2023 14:28:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: iproc: handle invalid slave state
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, roman.bacik@broadcom.com,
        andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230824212351.24346-1-roman.bacik@broadcom.com>
 <ZOzxJSeHhB1vrXff@ninjato>
From:   Vijay Balakrishna <vijayb@linux.microsoft.com>
In-Reply-To: <ZOzxJSeHhB1vrXff@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 8/28/2023 12:10 PM, Wolfram Sang wrote:
> On Thu, Aug 24, 2023 at 02:23:51PM -0700, roman.bacik@broadcom.com wrote:
>> From: Roman Bacik <roman.bacik@broadcom.com>
>>
>> Add the code to handle an invalid state when both bits S_RX_EVENT
>> (indicating a transaction) and S_START_BUSY (indicating the end
>> of transaction - transition of START_BUSY from 1 to 0) are set in
>> the interrupt status register during a slave read.
>>
>> Signed-off-by: Roman Bacik <roman.bacik@broadcom.com>
>> Fixes: 1ca1b4516088 ("i2c: iproc: handle Master aborted error")
> 
> Applied to for-next, thanks!
> 

Hi Wolfram,

I don't see this patch neither in I2C for-next nor in linux-next.  May 
be got lost by accident, please update.

Thanks,
Vijay

