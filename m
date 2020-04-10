Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA661A472E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 16:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDJOMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Apr 2020 10:12:30 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:32976 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726177AbgDJOMa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Apr 2020 10:12:30 -0400
X-Greylist: delayed 1510 seconds by postgrey-1.27 at vger.kernel.org; Fri, 10 Apr 2020 10:12:29 EDT
Received: from [5.157.111.77] (port=57208 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jMu02-004cjm-LM; Fri, 10 Apr 2020 15:47:14 +0200
Subject: Re: [RFC PATCH 3/7] i2c: allow DT nodes without 'compatible'
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdWaPfc050dZiRr+gAFzsdjSo9Vo70ztWgrMGPJxLUqupw@mail.gmail.com>
 <e43eaaf1-a294-902f-9a52-ebf8b29acab1@lucaceresoli.net>
 <20200312111950.GA1013@ninjato>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <62896a27-9df0-ef84-9724-2ff34b9bc9a7@lucaceresoli.net>
Date:   Fri, 10 Apr 2020 15:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312111950.GA1013@ninjato>
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

On 12/03/20 12:19, Wolfram Sang wrote:
> Hi Luca,
> 
>> But the kernel currently ignores nodes that have no matching driver,
>> right? So in this case the kernel knows that that address is used, but
>> ignores this information and considers the address as available.
> 
> I'd rather call it "unbound" than available. See later.
> 
>> Seen in this perspective, we should have a "compatible" for all nodes:
>> it is just describing the hardware and could be out of the kernel
>> control. But instead of discarding all nodes without a matching driver,
> 
> And what compatible value would you use if you know there is something
> sitting there and don't know what? This is what this series aims to
> address because we thought a compatible name like "reserved" would not
> be a good idea.

The scenario I have in mind is when DT has a proper compatible string,
but the kernel has no driver for that chip. Could be not implemented or
simply not compiled.

There are 3 cases generally:

 1. compatible string present, kernel has a matching driver
 2. compatible string present, kernel has no matching driver
 3. compatible string not present

Case 1 is obvious. Case 3 is currently ignored, with your patch the
address will be reserved. Case 2 is currently ignored, but we have all
the information to reserve the address just like in case 2, but there's
no plan to reserve it. Why not? (not necessarily in this series, I'm
just trying to understand if the idea is correct)

-- 
Luca
