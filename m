Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084241A96A7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404929AbgDOIfO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725859AbgDOIfN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:35:13 -0400
X-Greylist: delayed 1631 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Apr 2020 01:35:13 PDT
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1CDC061A0C;
        Wed, 15 Apr 2020 01:35:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 757872D1;
        Wed, 15 Apr 2020 10:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586939712;
        bh=rbh9fDJeGinm28yTtw/ldq3r46Kaxtu02L5LD4eqf0w=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=h0LSZW1gDFztRj1QogbWoO595f3fNGjGMf//QtE7Nbz7MLRlB0uCSbGZlAiZy14jd
         qa09cc7B/nW+lixcv8OniFCgJJp7P95d+KSl4RLFT55X8DmH3C1m8H0IrQ5Bjp/q0z
         nqFu5AmQ24MVN7dfhmeg7fzLHsSzLImptFrcFbaA=
Subject: Re: [RFC PATCH v2 0/6] i2c: of: reserve unknown and ancillary
 addresses
To:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200415082712.GD1141@ninjato>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f214be03-4617-40ed-40f2-019e4fd24cd4@ideasonboard.com>
Date:   Wed, 15 Apr 2020 09:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200415082712.GD1141@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15/04/2020 09:27, Wolfram Sang wrote:
> 
> Status update on this series:
> 
>> TODO: make sure there are no concurrency issues in patch 6 when handling
>> the struct i2c_client.
> 
> This turns out to be annoying. How to make sure that we don't modify the
> i2c_client while the adapter it is sitting on just gets removed. AFAICS
> we need a new locking scheme just for that and I am not convinced this
> is the way forward.
> 
> Also, there is still this small room for regressing when there are DTs
> having multiple addresses specified in the DT and the drivers use
> i2c_new_dummy_client on these addresses. I have verified that no in-tree
> users of i2c_new_dummy (and friends) do work on extra addresses but
> still I'd like to completely avoid this potential regression.
> 
> One solution to both problems would be to unregister the reserved device
> when its address is requested. I am working on this prototype currently.
> However, I am not sure yet if one issue might make this approach messy:
> re-registering the reserved device when the probe of the requested
> address fails.

If we 'unregister' the existing device, could we then register a new
'well named' device more appropriate to the driver, so it doesn't
continue to show up as 'reserved' in the system, but rather a more
appropriate name to the driver that registered it?

> We will see...
> 

Looking forward to it :-)

--
Kieran
