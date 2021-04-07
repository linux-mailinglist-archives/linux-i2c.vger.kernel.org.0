Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBF63563E3
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 08:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345585AbhDGG1r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 02:27:47 -0400
Received: from muru.com ([72.249.23.125]:51790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345586AbhDGG1m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 02:27:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A2D9E80A7;
        Wed,  7 Apr 2021 06:28:16 +0000 (UTC)
Date:   Wed, 7 Apr 2021 09:27:03 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Fix rumtime PM imbalance on error
Message-ID: <YG1Qt56QSjyFqZxd@atomide.com>
References: <20210407033030.13419-1-dinghao.liu@zju.edu.cn>
 <e2b5dc55-e084-c4e5-4eb0-749e2922a602@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2b5dc55-e084-c4e5-4eb0-749e2922a602@ti.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Vignesh Raghavendra <vigneshr@ti.com> [210407 06:20]:
> Do we need a Fixes: tag to enable stable backports?

Well pm_runtime_resume_and_get() was introduced quite recently, and
we already handle the error and bail out. And likely after an error
not much works anyways :) So it might be better to add just a stable
tag v5.10 and later as further backports are not likely needed.

Naturally nothing stopping doing separate backports if really needed
though.

Regards,

Tony
