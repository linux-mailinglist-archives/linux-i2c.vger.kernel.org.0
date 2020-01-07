Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51AB813298B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 16:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgAGPDa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 10:03:30 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:53497 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728020AbgAGPDa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 10:03:30 -0500
Received: from [109.168.11.45] (port=53378 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioqOE-00Ewr6-QD; Tue, 07 Jan 2020 16:03:26 +0100
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
To:     Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
 <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
 <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com>
 <20200107102557.GA1135@ninjato>
 <CAMuHMdWM0PoqLuAP2qjCjejNQ8FaArnkAT0gnd96xp3yJKLE-A@mail.gmail.com>
 <20200107112311.GC1135@ninjato>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <a6a85a80-309b-16a5-99cd-e14e70ead5f9@lucaceresoli.net>
Date:   Tue, 7 Jan 2020 16:03:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107112311.GC1135@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 07/01/20 12:23, Wolfram Sang wrote:
> 
>>>> https://lore.kernel.org/lkml/20191121135743.GA552517@kroah.com/
>>>
>>> Huh? This renders WARN completely useless, or? If somebody wants panic
>>> on warn, this person should get it?
>>
>> I also have my doubts...
> 
> Good to know :)
> 
>> What other information will you have in the backtrace, that you don't have
>> available inside the function?
>> Would printing the i2c_driver name be sufficient?
> 
> Yes, but we don't have the client struct, only the adapter and the
> address:
> 
> +static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
> +                           int (*probe)(struct i2c_adapter *adap, unsigned short addr))
> 
> And even if we had the client struct, it would be empty because for most
> cases scanning happens before binding to the driver. We don't even have
> the name/type in case of i2c_detect().
> 

Maybe dev_warn() +  dump_stack()?

Just my 2c,
-- 
Luca
