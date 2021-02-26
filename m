Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CCC3265CD
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 17:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhBZQoY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 11:44:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:42122 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230258AbhBZQoV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 11:44:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 351F1AC6E;
        Fri, 26 Feb 2021 16:43:38 +0000 (UTC)
Date:   Fri, 26 Feb 2021 17:43:37 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210226174337.63a9c2a6@endymion>
In-Reply-To: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue,  9 Feb 2021 12:05:56 +0100, Wolfram Sang wrote:
> This reverts commit 34806fc4e7090b34e32fa1110d546ab5ce01a6a0. It was
> developed against an experimental kernel. The regular kernel does not
> update the new message length to userspace, so the check is always false
> positive. We can't change the kernel behaviour because it would break
> the ABI. So revert this commit.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Very embarrasing :( I am sorry for this. Jean, maybe this is worth a
> 4.2.1. release?

Sorry for not catching this, I must say I did not remember exactly what
the API was supposed to be, and I did not have any device to test the
change.

We don't usually do minor version updates for bug fixes. Instead, what
I do is maintain a list of such "must have" fixes, that package
maintainers can refer to. Look for "Recommended patches" at:

https://i2c.wiki.kernel.org/index.php/I2C_Tools

There's no section for version 4.2 yet, but we can add one as soon as
the commit hits the public repository.

-- 
Jean Delvare
SUSE L3 Support
