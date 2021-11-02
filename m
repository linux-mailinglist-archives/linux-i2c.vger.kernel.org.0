Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64210442A05
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Nov 2021 10:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhKBJDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 05:03:54 -0400
Received: from foss.arm.com ([217.140.110.172]:58656 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKBJDy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Nov 2021 05:03:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C3BB113E;
        Tue,  2 Nov 2021 02:01:19 -0700 (PDT)
Received: from bogus (unknown [10.57.46.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8E33F5A1;
        Tue,  2 Nov 2021 02:01:17 -0700 (PDT)
Date:   Tue, 2 Nov 2021 09:01:15 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Zhiqi Song <songzhiqi1@huawei.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        linux-kernel@vger.kernel.org, jiabing.wan@qq.com
Subject: Re: [PATCH] i2c: xgene-slimpro: Fix inconsistent IS_ERR and PTR_ERR
Message-ID: <20211102090115.svupxektn2vpa7id@bogus>
References: <20211102021229.18501-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102021229.18501-1-wanjiabing@vivo.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wan,

On Mon, Nov 01, 2021 at 10:12:27PM -0400, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./drivers/i2c/busses/i2c-xgene-slimpro.c:488:6-12: inconsistent IS_ERR
> and PTR_ERR on line 490.

There is another version @[1]. Thanks for the effort.

Hi Wolfram,

Can you pick [1] after -rc1 ? I see mailbox updates are in the mainline
already.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/kernel-janitors/20211101140235.777322-1-weiyongjun1@huawei.com/
