Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EAB441F06
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 18:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhKARNl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 13:13:41 -0400
Received: from foss.arm.com ([217.140.110.172]:43484 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhKARNl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Nov 2021 13:13:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DF3B11B3;
        Mon,  1 Nov 2021 10:11:07 -0700 (PDT)
Received: from bogus (unknown [10.57.46.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E7893F719;
        Mon,  1 Nov 2021 10:11:05 -0700 (PDT)
Date:   Mon, 1 Nov 2021 17:11:02 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Zhiqi Song <songzhiqi1@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] i2c: xgene-slimpro: Fix wrong pointer passed to
 PTR_ERR()
Message-ID: <20211101171102.vht5arppz3gdz7vv@bogus>
References: <20211101140235.777322-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101140235.777322-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 01, 2021 at 02:02:35PM +0000, Wei Yongjun wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> Fixes: 7b6da7fe7bba ("mailbox: pcc: Use PCC mailbox channel pointer instead of standard")
> Reported-by: Hulk Robot <hulkci@huawei.com>

Thanks for spotting and fixing the issue.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
