Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735B179898A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Sep 2023 17:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244331AbjIHPGi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Sep 2023 11:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243199AbjIHPGh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Sep 2023 11:06:37 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956C61FC4
        for <linux-i2c@vger.kernel.org>; Fri,  8 Sep 2023 08:06:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
        by baptiste.telenet-ops.be with bizsmtp
        id jT6W2A00E2mGBSJ01T6Wc1; Fri, 08 Sep 2023 17:06:30 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qed42-002pN3-FL;
        Fri, 08 Sep 2023 17:06:30 +0200
Date:   Fri, 8 Sep 2023 17:06:30 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: rcar: remove open coded DIV_ROUND_CLOSEST
In-Reply-To: <20230906200024.5305-5-wsa+renesas@sang-engineering.com>
Message-ID: <f5f3bf1-2cf6-9f3a-b44b-a1ae96659b5e@linux-m68k.org>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com> <20230906200024.5305-5-wsa+renesas@sang-engineering.com>
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

On Wed, 6 Sep 2023, Wolfram Sang wrote:
> It improves readability if we use the available helper.
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
