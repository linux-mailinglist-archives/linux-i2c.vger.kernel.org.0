Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB697A5C99
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 10:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjISIdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 04:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjISIdR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 04:33:17 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE885125
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 01:33:11 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:9622:9b2f:73fd:43ad])
        by andre.telenet-ops.be with bizsmtp
        id nkZ72A00P4u9dj801kZ89s; Tue, 19 Sep 2023 10:33:08 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qiWAN-003zBS-SU;
        Tue, 19 Sep 2023 10:33:07 +0200
Date:   Tue, 19 Sep 2023 10:33:07 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] i2c: rcar: calculate divider instead of brute-forcing
 it
In-Reply-To: <20230906200024.5305-4-wsa+renesas@sang-engineering.com>
Message-ID: <8486e352-cbb1-e84a-f87-0adba97df4@linux-m68k.org>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com> <20230906200024.5305-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 6 Sep 2023, Wolfram Sang wrote:
> Instead of trying all values, we can actually compute it as the comment
> suggests. It is unclear what the comment means with "involved", it works
> nicely.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
