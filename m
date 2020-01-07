Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB5813299F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 16:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgAGPIU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 10:08:20 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:51537 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727880AbgAGPIU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 10:08:20 -0500
Received: from [109.168.11.45] (port=53390 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioqSv-00EzCX-CP; Tue, 07 Jan 2020 16:08:17 +0100
Subject: Re: [PATCH 3/5] i2c: highlander: Use proper printk format for iomem
 pointer
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191230172751.17985-1-krzk@kernel.org>
 <20191230172751.17985-3-krzk@kernel.org>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <dcfa47af-9c7f-4c57-b178-62611c8c21bc@lucaceresoli.net>
Date:   Tue, 7 Jan 2020 16:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230172751.17985-3-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 30/12/19 18:27, Krzysztof Kozlowski wrote:
> iomem pointers should be printed with pointer format to hide the

s/iomem/size_t/ (in the subject too)

The whole commit message needs rewording accordingly.

> actual value and fix warnings when compiling on 64-bit platform (e.g. with
> COMPILE_TEST):
> 
>     drivers/i2c/busses/i2c-highlander.c: In function ‘highlander_i2c_smbus_xfer’:
>     drivers/i2c/busses/i2c-highlander.c:325:22: warning:
>         format ‘%d’ expects argument of type ‘int’,
>         but argument 3 has type ‘size_t {aka long unsigned int}’ [-Wformat=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/i2c/busses/i2c-highlander.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
> index abfe3094c047..803dad70e2a7 100644
> --- a/drivers/i2c/busses/i2c-highlander.c
> +++ b/drivers/i2c/busses/i2c-highlander.c
> @@ -322,7 +322,7 @@ static int highlander_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
>  		tmp |= (SMMR_MODE0 | SMMR_MODE1);
>  		break;
>  	default:
> -		dev_err(dev->dev, "unsupported xfer size %d\n", dev->buf_len);
> +		dev_err(dev->dev, "unsupported xfer size %zu\n", dev->buf_len);
>  		return -EINVAL;
>  	}
>  
> 

-- 
Luca
