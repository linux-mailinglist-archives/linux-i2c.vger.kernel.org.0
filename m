Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC186EA4A0
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 09:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjDUHZP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 03:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjDUHZP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 03:25:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F2E132;
        Fri, 21 Apr 2023 00:25:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9BAF661416;
        Fri, 21 Apr 2023 07:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB4FC433EF;
        Fri, 21 Apr 2023 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682061913;
        bh=9E3MbkVhBbUmcHRlcAWaeV5jWjb+Uuo7wKjo7PwPH6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SfUL8BJKMg9iyKxfUYX1dReFqpjtUbXFLK3jm0iRB0S940NyxnCaboGzHbLIaXtFw
         v3fj0sJ5jT19M+di5lh/xSzOxIIfrOAwrdjehte6f2rs2W+Otc/e5g4Xd9tta/sWfu
         LFsgzOusZe4AC3hH/pGzPQv1AYotVe0sBasSZ6IhOAU9gxCbeMa3JbeyojANSWqpU9
         rQb9CW6BKRDdEeCCb+ulbQH7d+/eT+R+vftducfiIqGXndVuaC8GUP353H1cTLCQDL
         GbeBPg3nmh4BgTU/T9EhBnYbcMlprNwtXp0SwLyNMSddMluebCv6xMzTHSDdzjZHj9
         4GF59vtaORGGA==
Date:   Fri, 21 Apr 2023 08:25:07 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     benjamin.bara@skidata.com, dmitry.osipenko@collabora.com,
        jonathanh@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com, wsa@kernel.org
Subject: Re: [PATCH v5 6/6] mfd: tps6586x: register restart handler
Message-ID: <20230421072507.GK996918@google.com>
References: <20230420140406.GH996918@google.com>
 <20230420143229.541283-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420143229.541283-1-bbara93@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Apr 2023, Benjamin Bara wrote:

> Thanks for the feedback!
> 
> On Thu, 20 Apr 2023 at 16:04, Lee Jones <lee@kernel.org> wrote:
> > Why 20 here and 50 in the other patch?
> 
> The data sheet states:
> The device will enter the SLEEP or HARD REBOOT state 10ms after the
> SLEEP REQUEST or REBOOT REQUEST is initiated.
> 
> Also:
> When the reboot request state is set an internal timer TWAIT (10ms typ)
> is started (...). The reboot request ends when t > TWAIT.
> 
> But in the electrical characteristics, TWAIT is given as min 18, typ 20,
> max 22.
> 
> In my observations, reboot took like typ 15ms and sleep typ 25ms, but
> this might be very board-specific. I can set both to 50ms to be "on the
> safe side" and have a common value?

The confusing part for me, the reader, was that both say "will take at
least 10ms" or words to that effect, but they sleep for a different
amount of time.

-- 
Lee Jones [李琼斯]
