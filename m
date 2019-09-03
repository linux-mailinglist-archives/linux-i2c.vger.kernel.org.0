Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03CF2A64BC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 11:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfICJJ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 05:09:59 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43345 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726631AbfICJJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 05:09:59 -0400
Received: from [109.168.11.45] (port=41976 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1i54p2-002t5L-6Q; Tue, 03 Sep 2019 11:09:56 +0200
Subject: Re: [RFC,v2 3/6] media: dt-bindings: add DS90UB954-Q1 video
 deserializer
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-4-luca@lucaceresoli.net> <20190902204841.GB7253@kunai>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <63d99d6d-ecdd-7dd8-0dcb-126bfd89b258@lucaceresoli.net>
Date:   Tue, 3 Sep 2019 11:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902204841.GB7253@kunai>
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

Hi Wolfram,

On 02/09/19 22:48, Wolfram Sang wrote:
> 
>> + - i2c-alias-pool: list of I2C addresses that are known to be available on the
>> +                   "local" (SoC-to-deser) I2C bus; they will be picked at
>> +		   runtime and used as aliases to reach remove I2C chips
> 
> After some internal discussion, I have been kinda convinced that it may
> be better to assume all non-described addresses are free to use and
> enter the pool.
> 
> The problem with the binding above is that you may run out of aliases
> depending on how many aliases one to-be-attached module needs or how
> many modules will be attached.

Not if you define enough addresses in the pool. E.g. the DS90UB954
hardware can have 8 aliases per port, so if you have (n_ports * 8)
addresses in the pool the problem is solved.

> And another add-on module with
> non-repogrammable devices may occupy addresses from the defined pool
> above.

You mean a new device on the local (SoC-to-ATR) bus? Well, it could as
well occupy a non-described address that the ATR has already picked as
an alias.

> I am not perfectly happy with the assumption that all undescribed
> addresses are automatically free. That also might need DTS updates to
> describe all clients properly. But this change only needs to be done
> once, and it will improve the description of the hardware.

Right, but I still suspect some users won't do their homework and
discover address conflicts at runtime, maybe months later, in a painful
way. Also a chip might be undocumented on a given board, so they could
do their homework and still have problems.

Despite my comments, I'm not strongly against your proposal. To me it
doesn't seem to solve any problem, while it does introduce some degree
of risk. Could you elaborate more on but what benefit it introduces?

Thanks,
-- 
Luca
