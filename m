Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52AB12EFC4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2020 23:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbgABW2E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 17:28:04 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40369 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729822AbgABW2B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jan 2020 17:28:01 -0500
Received: from [88.147.81.4] (port=38444 helo=[192.168.77.51])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1in8wf-0050fV-H3; Thu, 02 Jan 2020 23:27:57 +0100
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
Date:   Thu, 2 Jan 2020 23:27:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200102211327.GB1030@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 02/01/20 22:13, Wolfram Sang wrote:
> Hi Luca,
> 
>>> This looks quite inefficient, especially if the beginning of the range
>>> is populated with devices. Furthermore, I think there's a high risk of
>>> false negatives, as acquiring a free address and reprogramming the
>>> client to make use of it are separate operations.
>>
>> Right. Applying the alias could raise other errors, thus one would need
>> i2c_new_alias_device() to keep the alias locked until programming it has
>> either failed or has been successfully programmed.
> 
> Please see my reply to Laurent, I don't think it is racy. But please
> elaborate if you think I am wrong.

Uhm, you are right here, it's not racy. Sorry, I had read the code
quickly and didn't notice the i2c_new_dummy_device() call.

So this means if i2c_new_alias_device() succeeds but the caller later
fails while applying the alias, then it has to call
i2c_unregister_device() to free the alias. Correct?

>>> What happened to the idea of reporting busy address ranges in the
>>> firmware (DT, ACPI, ...) ?
>>
>> Indeed that's how I remember it as well, and I'm a bit suspicious about
>> sending out probe messages that might have side effects (even if the
>> false negative issue mentioned by Laurent were solved). You know, I've
>> been taught to "expect the worse" :) so I'd like to better understand
>> what are the strong reasons in favor of probing, as well as the
>> potential side effects.
> 
> As I said to Laurent, too, I think the risk that a bus is not fully
> described is higher than a device which does not respond to a read_byte.
> In both cases, we would wrongly use an address in use.

OK, I'm still uncomfortable with sending unexpected transactions to the
dark outer space, but this is more a feeling than based on facts, and
you know more than me, so I guess I can live with that.

> Also, all the best for you in 2020!

Thanks. Best wishes to you too for the new year!

-- 
Luca
