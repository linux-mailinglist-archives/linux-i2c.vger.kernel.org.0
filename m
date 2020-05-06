Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3391C7D8B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 00:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbgEFWnj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 18:43:39 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:34691 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729226AbgEFWni (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 18:43:38 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49HWpd2Ntsz2n;
        Thu,  7 May 2020 00:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1588805017; bh=5NEC5Kr51h3mVGXy1wYxaVPEuEtY3+/b4NfJfgwyA7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nbKWac4D9X28X0P9whCo5ZLsywDf4Xn2N/iqsAw9GeBzo/SnoJCcJ5KG62cyRXDUT
         mvoU4c9kL9XdEp0B1fX6JVqNuBx2FusVhPcOJUYnX0A6HuhwKd/vEn9E1psJj3pWQg
         kaO7JLUnkDQahUkau4x6TxgzaeRDRSlzfVY4CuktySO/VfdKv614ESbAq64I5La5FG
         h9feY5uBaqf8FPJfRVu68SotzkFUP9oPThbVhe7xUsSVLJpfAJmMumX7PTXaV2z0B7
         oyfxJBxbH/a3dAHQsrb0gR7uaQo7PgMxnrGMBskgqmPASLDQtp39NyuM8iYUwSCsAN
         bJVBbkZmEJggw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Thu, 7 May 2020 00:43:36 +0200
From:   mirq-test@rere.qmqm.pl
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Message-ID: <20200506224336.GA23423@qmqm.qmqm.pl>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200506193358.2807244-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 06, 2020 at 09:33:55PM +0200, Thierry Reding wrote:
[...]
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> +	int err = 0;
>  
>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>  
> -	return 0;
> +	if (!pm_runtime_status_suspended(dev))
> +		err = tegra_i2c_runtime_suspend(dev);
> +
> +	return err;
>  }
>  
>  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	err = tegra_i2c_runtime_suspend(dev);
> -	if (err)
> -		return err;
> +	if (pm_runtime_status_suspended(dev)) {
[...]
Shouldn't this be negated as in suspend? I would assume that inbetween
suspend and resume nothing changes the stored state.

Best Regards,
Micha³ Miros³aw
