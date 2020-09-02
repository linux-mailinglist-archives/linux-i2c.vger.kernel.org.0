Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8936325B5C7
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 23:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIBVUa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 17:20:30 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:53377 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgIBVU3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 17:20:29 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BhcKl3bdzz98;
        Wed,  2 Sep 2020 23:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1599081627; bh=juSFVrPV1FQtu+3aCUszpkCiSY3tbm0FGZb9XQy+czY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bzfPwXi2bF4w/wiotcxcrjPynKWjJcxIQQU1evflPTgWVLCW0CtUMoBsnSl/lQzHl
         mdoYQKAxZYVhae6fZN1wlsKtG62tOk/rnRX43bVgaXHmYpZX6FeRBsiuWRPIKsoTdm
         d3KeO/TQVWI73ms1MhSi+ccylLPsPOJA4DsAFNCpiC4ZqtDWE7j6CrpLawbeCdLSDt
         lPkFJjn3XUDJCh5onh30YlJokFHsK96VJB3KFi0LkK5KMl0evIhqTcRekC8E/ghbnR
         I4hJs2Q7x0OOkbGP5zpYLhPqs8X3YsDK/VDEq/Wa+r5SRlEj9+64s8A9rgvSv5Lm+i
         1DvWr+EAY6OHw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Wed, 2 Sep 2020 23:20:26 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/12] Improvements for Tegra I2C driver
Message-ID: <20200902212026.GD1624@qmqm.qmqm.pl>
References: <20200831202303.15391-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 31, 2020 at 11:22:51PM +0300, Dmitry Osipenko wrote:
> Hello!
> 
> This series performs a small refactoring of the Tegra I2C driver code and
> hardens the atomic-transfer mode.
> 
> Dmitry Osipenko (12):
>   i2c: tegra: Make tegra_i2c_flush_fifos() usable in atomic transfer
>   i2c: tegra: Add missing newline before returns
>   i2c: tegra: Clean up messages in the code
>   i2c: tegra: Don't ignore tegra_i2c_flush_fifos() error
>   i2c: tegra: Use reset_control_reset()
>   i2c: tegra: Improve formatting of function variables
>   i2c: tegra: Use dev_err_probe()
>   i2c: tegra: Runtime PM always available on Tegra
>   i2c: tegra: Clean up probe function
>   i2c: tegra: Drop '_timeout' from wait/poll function names
>   i2c: tegra: Remove likely/unlikely from the code
>   i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()

For all, but #3 and #9:
Reviewed-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

BTW, I wonder if you could expose i2c_in_atomic_xfer_mode() and use it
to differentiate atomic_xfer from normal and get rid of the internal
flag and .master_xfer_atomic callback.

Best Regards,
Micha³ Miros³aw
