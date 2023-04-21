Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A376EA519
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 09:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjDUHme (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 03:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjDUHmc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 03:42:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4051BD5;
        Fri, 21 Apr 2023 00:42:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D13264E25;
        Fri, 21 Apr 2023 07:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A3BC433EF;
        Fri, 21 Apr 2023 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682062947;
        bh=pxCnzZf5c+gpy3rhAq/AgjK3nwcW2mvgkjhIw+gITy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K8L3WScVaobBNhLDiBJwSskEacX89meHyPGIzjcW91OOgC0BF4X5aFw/lqFXahn1U
         EPQzc/PCZmE90R8+Tk4+xJM5WgyMpevIheFLjZxLyIZcQb6xzLkwp6DPmvLZTBVtTi
         cDTLpvQI3iqwIJnR7Ynhnm51QYlu+V/vUFD/9WXuutcKh7VnxwdC8TlJAK9En4itB/
         7P6mzyxBGPuQwIMHlIM7A2wLo2sBCGU6cYDJbgX2UL2+hd4qeW6nWLMoY5kCQTDJ6b
         8CTwmnqASlTijft5ae2+4fzlUcadljTzsrH4QI+UhrF9LleT7WapvHK5UmapYID/q7
         KfB13xYfcvOTw==
Date:   Fri, 21 Apr 2023 08:42:22 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     benjamin.bara@skidata.com, dmitry.osipenko@collabora.com,
        jonathanh@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com, wsa@kernel.org
Subject: Re: [PATCH v5 6/6] mfd: tps6586x: register restart handler
Message-ID: <20230421074222.GP996918@google.com>
References: <20230421072507.GK996918@google.com>
 <20230421073250.1203077-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421073250.1203077-1-bbara93@gmail.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Apr 2023, Benjamin Bara wrote:

> On Fri, 21 Apr 2023 at 09:25, Lee Jones <lee@kernel.org> wrote:
> > The confusing part for me, the reader, was that both say "will take at
> > least 10ms" or words to that effect, but they sleep for a different
> > amount of time.
> 
> Yep, got it. For the next version, I will rewrite to:
> "Put the PMIC into * state. Data sheet states that this takes at least 20ms.
> As this is board-specific, add some buffer to prevent the timeout error."
> and change to -ETIMEDOUT instead of -ETIME.

No need to be more verbose.

Stick to the one liner, just be more clear about the timings.

The reader can see that you've added a little buffer without explanation.

-- 
Lee Jones [李琼斯]
