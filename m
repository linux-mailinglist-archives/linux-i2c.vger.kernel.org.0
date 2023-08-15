Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D94D77C97F
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 10:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjHOIlm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 04:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235386AbjHOIlS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 04:41:18 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285DD10F
        for <linux-i2c@vger.kernel.org>; Tue, 15 Aug 2023 01:41:15 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
        by baptiste.telenet-ops.be with bizsmtp
        id ZkhB2A00345ualL01khBpL; Tue, 15 Aug 2023 10:41:12 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qVpby-000fyx-Sv;
        Tue, 15 Aug 2023 10:41:10 +0200
Date:   Tue, 15 Aug 2023 10:41:10 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Wolfram Sang <wsa@kernel.org>, andi.shyti@kernel.org
cc:     Yicong Yang <yangyicong@huawei.com>, linux-i2c@vger.kernel.org,
        yangyicong@hisilicon.com, f.fangjian@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's
 transfer
In-Reply-To: <ZNovKVNuxXf457t8@shikoro>
Message-ID: <344337b8-c0cf-b271-55cc-72c739ab6a4@linux-m68k.org>
References: <20230801124625.63587-1-yangyicong@huawei.com> <ZNovKVNuxXf457t8@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

 	Hi Wolfram, Andi,

On Mon, 14 Aug 2023, Wolfram Sang wrote:
> On Tue, Aug 01, 2023 at 08:46:25PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> The controller may be shared with other port, for example the firmware.
>> Handle the interrupt from other sources will cause crash since some
>> data are not initialized. So only handle the interrupt of the driver's
>> transfer and discard others.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>
> Applied to for-current, thanks! I updated the comment to mention that
> another port is likely the firmware. Similar like in the above text.

Today's renesas-drivers merge of i2c-host/i2c/andi-for-current got a
conflict in:

     drivers/i2c/busses/i2c-hisi.c

between commit fff67c1b17ee0939 ("i2c: hisi: Only handle the interrupt
of the driver's transfer") in i2c/i2c/for-next and commit
9a5adaf694f5ae8b ("i2c: hisi: Only handle the interrupt of the driver's
transfer") in i2c-host/i2c/andi-for-current.

I took the version from i2c/i2c/for-next, as that contained the extra
comment.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
