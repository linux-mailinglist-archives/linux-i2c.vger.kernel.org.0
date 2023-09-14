Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D087A0175
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 12:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbjINKRq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 06:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236902AbjINKRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 06:17:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B351BE9;
        Thu, 14 Sep 2023 03:17:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670BAC433C8;
        Thu, 14 Sep 2023 10:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694686662;
        bh=cvtU3pIiXOKkkLhPCgWUEUlS+9q5X3ztWTBwoalM5Rc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cHW9TPRizQhFbx9iLfVRbTuidi4zCsBWyWneYsuYYv7h6n6YBvy5l5Q376dvOC6g7
         RJw/OIVfjgkGqCcVCR+2VRVya3agt5Mn4Vn67DXJDxi2DmrJwcIvA3C8te6WLm4GHh
         qBOZgXGEY/7Ed8mvcm7ujVkEl3QFU2WI5NGhvn3LKksWFcSAzWLc97xh7GCVG1jo1V
         +Bw7QuSjVtDUwS6rsr6ra5nwgjMsB/8SkzNqqjzjfj9BOfF6RlegOPk1N9Vf1CsuOz
         oZ4QIo+tkOh39Ug/unv5Dm49wuUSafyezpMz6H0HBip+qVBKv/RTOn250RVR/VwJBg
         3VF1zcu2iCXTw==
Date:   Thu, 14 Sep 2023 11:17:34 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     benjamin.bara@skidata.com, dmitry.osipenko@collabora.com,
        jonathanh@nvidia.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        nm@ti.com, peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, stable@vger.kernel.org,
        treding@nvidia.com, wsa+renesas@sang-engineering.com,
        wsa@kernel.org
Subject: Re: [PATCH v7 0/5] mfd: tps6586x: register restart handler
Message-ID: <20230914100744.GL13143@google.com>
References: <20230728103446.GK8175@google.com>
 <20230907082032.478027-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230907082032.478027-1-bbara93@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 07 Sep 2023, Benjamin Bara wrote:

> Hi Lee,
> 
> On Fri, 28 Jul 2023 at 12:34, Lee Jones <lee@kernel.org> wrote:
> > On Fri, 28 Jul 2023, Lee Jones wrote:
> > > On Sat, 15 Jul 2023 09:53:22 +0200, Benjamin Bara wrote:
> > > > The Tegra20 requires an enabled VDE power domain during startup. As the
> > > > VDE is currently not used, it is disabled during runtime.
> > > > Since 8f0c714ad9be, there is a workaround for the "normal restart path"
> > > > which enables the VDE before doing PMC's warm reboot. This workaround is
> > > > not executed in the "emergency restart path", leading to a hang-up
> > > > during start.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/5] kernel/reboot: emergency_restart: set correct system_state
> > >       commit: 60466c067927abbcaff299845abd4b7069963139
> > > [2/5] i2c: core: run atomic i2c xfer when !preemptible
> > >       commit: aa49c90894d06e18a1ee7c095edbd2f37c232d02
> > > [3/5] kernel/reboot: add device to sys_off_handler
> > >       commit: db2d6038c5e795cab4f0a8d3e86b4f7e33338629
> > > [4/5] mfd: tps6586x: use devm-based power off handler
> > >       commit: 8bd141b17cedcbcb7d336df6e0462e4f4a528ab1
> > > [5/5] mfd: tps6586x: register restart handler
> > >       commit: 510f276df2b91efd73f6c53be62b7e692ff533c1
> >
> > Pull-request to follow after built tests have completed.
> 
> What's the current state of this series?

Looks like the build-tests didn't complete properly, so they stayed on
one of my development branches.  I'll re-submit them for testing and get
back to you about merging for this cycle.

-- 
Lee Jones [李琼斯]
