Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F1D356894
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 11:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236185AbhDGJ73 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 05:59:29 -0400
Received: from muru.com ([72.249.23.125]:51862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230220AbhDGJ73 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 05:59:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 64C2880A7;
        Wed,  7 Apr 2021 10:00:28 +0000 (UTC)
Date:   Wed, 7 Apr 2021 12:59:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Fix rumtime PM imbalance on error
Message-ID: <YG2Cc+0rl4ndtGX4@atomide.com>
References: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
 <e2b5dc55-e084-c4e5-4eb0-749e2922a602@ti.com>
 <YG1Qt56QSjyFqZxd@atomide.com>
 <30ed0224-fba3-75c6-c4aa-e2d0724c291b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ed0224-fba3-75c6-c4aa-e2d0724c291b@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Vignesh Raghavendra <vigneshr@ti.com> [210407 07:46]:
> Hi,
> 
> On 4/7/21 11:57 AM, Tony Lindgren wrote:
> > * Vignesh Raghavendra <vigneshr@ti.com> [210407 06:20]:
> >> Do we need a Fixes: tag to enable stable backports?
> > 
> > Well pm_runtime_resume_and_get() was introduced quite recently, and
> > we already handle the error and bail out. And likely after an error
> > not much works anyways :) So it might be better to add just a stable
> > tag v5.10 and later as further backports are not likely needed.
> > 
> 
> Agree this is not a critical patch for backport. But I do know that
> pm_runtime_resume_and_get() is backported to v5.4 stable kernel at least
> [1]. So stable tag with v5.4 perhaps would probably help tools looking
> for patches to backport.

OK no objections to adding a fixes tag.

Regards,

Tony

> [1] https://lkml.org/lkml/2020/12/28/588
