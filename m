Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BC925C75A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 18:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgICQrR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 12:47:17 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:36885 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728458AbgICQrQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Sep 2020 12:47:16 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Bj6D12XTXz6R;
        Thu,  3 Sep 2020 18:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599151633; bh=aW3vviD3X6zwOHneikrU8nTQgniWlnIKgJxxeVIHhJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FbzJpLnIa630aI8y1RwLW6KhJfwv1iwu+6hA0QRMlp0ZEJJmHLVSjEfMNteG8X0pl
         EqDLn5s12AOv0XmkWGmMTHkPQsiOfwD6nMkVKshDWu+/WGzO/BW34JsPh8mVDIIAvL
         869P6DJQhM2mRbDuH6Xdvssmue6J7OTw7+u/9t6p+O0TAvmPtxbn0Lss7Umv7Ngu+Q
         gvEinYFM/r4d/3r2n+V2pP3RpESDyyYeJyueGVzixZocEcRoluB8xYcH7CJtRWD+/6
         iDIWsJGPVA6lSPu6dvxqiEV0aUf6DrgyOI69eF5zdi9t120zv14TV99kQJj/H7pA57
         daEzCQdcOWfGw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 3 Sep 2020 18:47:09 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/12] Improvements for Tegra I2C driver
Message-ID: <20200903164709.GA7406@qmqm.qmqm.pl>
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200902212026.GD1624@qmqm.qmqm.pl>
 <04aae642-80f9-d22e-1d80-bb206bb27a8b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04aae642-80f9-d22e-1d80-bb206bb27a8b@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 03, 2020 at 04:12:13AM +0300, Dmitry Osipenko wrote:
> 03.09.2020 00:20, Michał Mirosław пишет:
> > BTW, I wonder if you could expose i2c_in_atomic_xfer_mode() and use it
> > to differentiate atomic_xfer from normal and get rid of the internal
> > flag and .master_xfer_atomic callback.
> 
> The atomic transfer uses 90% of the code path that a non-atomic transfer
> uses. I don't see how it could be exposed without duplicated lots of the
> code, unless I'm not missing what you're suggesting.

The I2C core falls back to .master_xfer even in atomic mode if
.master_xfer_atomic is NULL, so what I'm suggesting is to make
i2c_in_atomic_xfer_mode() public (from i2c-core.h) and use it in
normal .master_xfer to choose atomic wait variants.

Best Regards,
Michał Mirosław
