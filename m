Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EED847FE4
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 12:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfFQKlj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 06:41:39 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:43586 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfFQKlj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 06:41:39 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id F09284FEF7;
        Mon, 17 Jun 2019 12:41:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id cGi82UArboyI; Mon, 17 Jun 2019 12:41:34 +0200 (CEST)
Subject: Re: [PATCH 1/2 v4] dt-bindings: i2c: i2c-mt7621: Add bindings for
 MediaTek MT7621/28/88 I2C
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org
References: <20190617083117.1690-1-sr@denx.de> <20190617101113.GE3502@kunai>
 <20190617101412.GF3502@kunai>
From:   Stefan Roese <sr@denx.de>
Message-ID: <8f80a12e-2427-df85-39ec-5402f415e444@denx.de>
Date:   Mon, 17 Jun 2019 12:41:33 +0200
MIME-Version: 1.0
In-Reply-To: <20190617101412.GF3502@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17.06.19 12:14, Wolfram Sang wrote:
> On Mon, Jun 17, 2019 at 12:11:13PM +0200, Wolfram Sang wrote:
>> On Mon, Jun 17, 2019 at 10:31:16AM +0200, Stefan Roese wrote:
>>> Add bindings for the I2C controller that can be found in the MediaTek
>>> MT7621/7628/7688 SoCs.
>>>
>>> Signed-off-by: Stefan Roese <sr@denx.de>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> CCing the DT mailing list.
> 
> Since the driver has now clock support, don't we need bindings for this?

No. As the clock support is currently not handled via a DT based
driver:

https://elixir.bootlin.com/linux/v5.2-rc5/source/arch/mips/ralink/mt7620.c#L565

This probably should be moved to DT but would like to do this at a
later time (if time permits).

Thanks,
Stefan
