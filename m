Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7DB67AA9B4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 09:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjIVHGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 03:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjIVHGE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 03:06:04 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F5118F
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 00:05:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ea4b:e108:10b2:c4a2])
        by xavier.telenet-ops.be with bizsmtp
        id ov5v2A0093uG6wG01v5vaN; Fri, 22 Sep 2023 09:05:56 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qjaEd-004AId-KO;
        Fri, 22 Sep 2023 09:05:55 +0200
Date:   Fri, 22 Sep 2023 09:05:55 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: rcar: reset controller is mandatory for
 Gen3+
In-Reply-To: <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
Message-ID: <eca9a551-1b46-ad3c-97c-fd48852ebace@linux-m68k.org>
References: <20230921125351.3954-1-wsa+renesas@sang-engineering.com> <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 21 Sep 2023, Wolfram Sang wrote:
> Initially, we only needed a reset controller to make sure RXDMA works at
> least once per transfer. Meanwhile, documentation has been updated. It
> now says that a reset has to be performed prior every transaction, even
> if it is non-DMA. So, make the reset controller a requirement instead of
> being optional. And bail out if resetting fails.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v2:
> * properly bail out on errors using goto
>  To make that easier, the reset controller is now probed after the
>  handling of pm_runtime_put() is determined

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
