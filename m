Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1FE759089
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 10:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjGSIo5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jul 2023 04:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjGSIo5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jul 2023 04:44:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906A1FC;
        Wed, 19 Jul 2023 01:44:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 28F3F60AE3;
        Wed, 19 Jul 2023 08:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF850C433C7;
        Wed, 19 Jul 2023 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689756295;
        bh=lVZ6jv8hW/ZY+njtz6wW0DRddCPA64EmfRAFyCC/CaY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nkgonrvTzSZZouPaj9uxHZza15B96zRK2yWFn36YXsnQbL0acCVbB0QivX1CaJ2H7
         Ko7h4VnLtxuVw7KvZd/lwHuATVZP19cHo3cMg5Jx41GtAOngbfQOTe5932bRWZwQUV
         CaIVDMZxS6WakprryPu0nantsB5Jh+mfxyRhn53WAt+V2/R0AlehWDDK/iSooMtypq
         5moxdoG3HKkzzyTPn/94rD6LO3yNFq94Lbwnm5dJkhXguIJeabR1j8ZDVy7ny41gYk
         h8vfM3IEz6r8SLI514xtouc7GnGWtjfYG7gW7nL0Fm3WnJCDdM+o2YcmPUhTTiC9Tz
         70VKXqSIawsAw==
Date:   Wed, 19 Jul 2023 09:44:49 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     dmitry.osipenko@collabora.com, konstantin@linuxfoundation.org,
        benjamin.bara@skidata.com, jonathanh@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, peterz@infradead.org,
        rafael.j.wysocki@intel.com, richard.leitner@linux.dev,
        treding@nvidia.com, wsa+renesas@sang-engineering.com,
        wsa@kernel.org
Subject: Re: [PATCH v7 5/5] mfd: tps6586x: register restart handler
Message-ID: <20230719084449.GH1082701@google.com>
References: <215679f1-a866-1e92-1bab-9c80918927a6@collabora.com>
 <20230719082251.3501424-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719082251.3501424-1-bbara93@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 Jul 2023, Benjamin Bara wrote:

> Hi Dmitry,
> 
> thanks for the feedback!
> 
> On Tue, 18 Jul 2023 at 06:46, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> > 15.07.2023 10:53, Benjamin Bara пишет:
> > >
> > > Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > > Acked-for-MFD-by: Lee Jones <lee@kernel.org>
> >
> > Acked-for-MFD-by isn't a valid tag, scripts/checkpatch.pl should tell
> > you about it.
> >
> > In general you may add a comment to a tag, like this:
> >
> >   Acked-by: Lee Jones <lee@kernel.org> # for MFD
> >
> > In this particular case, the comment is unnecessary because Lee is the
> > MFD maintainer, hence his ack itself implies the MFD subsys.
> 
> I saw the warning, but Lee requested to add it like this [1].
> 
> @Konstantin:
> Do you think it makes sense to print a warning when adding "non-standard
> trailers" during running "b4 trailers -u", maybe around the
> find_trailers() checks? I could provide a RFC, if considered useful.
> [1] https://lore.kernel.org/all/20230518094434.GD404509@google.com/

Dmitry, Benjamin,

The warning is valid.  The patch will not be applied like this.

I will remove it when I merge the patch.

-- 
Lee Jones [李琼斯]
