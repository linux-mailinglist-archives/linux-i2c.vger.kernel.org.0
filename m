Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01ADE42930
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 16:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437768AbfFLOaW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 10:30:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38243 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437757AbfFLOaW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 10:30:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so17154287wrs.5;
        Wed, 12 Jun 2019 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XlzePlwLp6r9/DZCVM1eao1U68xv73UqabDTl25TT1k=;
        b=V/cxH/Je2VzkXC2fRode4EObJJqIc9g1gqfCqaZagRIJmspbHTOj5a0dGmiBF4FNZD
         pbSPhLSgUWL8uMiP3Q3qUMouxDvNt8mQeyuQ3QV1F8CyT9bI4ay2+HhwCNYa5bOdsKNS
         /Nu7oD24ZfI7/4oVsSenxVA6KmC8WntB8DRYlt6wkzesWrzq+E+RhwFtLVDpyj3DaIKO
         BszCrDcl5a83d4WN2Shw/n13Bgas+ynwh+X6m35z3iE/sUY5fwbsV5CDZtyWCYFfNcGY
         x4SZj1v8QbV7XPSG5Mfjb//6vzrMRuipeK/AM7ZL+ZLL++1b5LOpXo4U56WFpG29ZaPe
         nK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XlzePlwLp6r9/DZCVM1eao1U68xv73UqabDTl25TT1k=;
        b=UqV2wHCtTzNG9RoQHjwTqeve1W555pX2e6QM5wZxDjBDO5lHvJ44HiIY8VuNpfkLue
         xloNSyikFkLbctRiZyvOekLQPNgqSesw/T1TnB0X9522Sjc377K5KNh5DLUt21/EysCB
         q7IyWqDt5fGa0rRkWMggMwrOfAHDlkihmEF+WGzlI196GGlUlWljEPA+ziaySOc3LGaP
         46B5aoX7yhuM8PQ7erDZY5iNKYjD/7qbZXn/jacrul+p8s5OATwavuSOvk9Jly0s68yo
         FS96buZSzforSdtupwCmf3iAMgqX41V9EbamliIsI5FklsgRWRhyXlXW8HySDv6pcW/Z
         rgjA==
X-Gm-Message-State: APjAAAXjY4Ni+5ifWQFz2SmB0El+AVFf1INoH8q1C5gdgX/kzStomDDK
        W+nf37fhk4zzDu/54x9+DBs=
X-Google-Smtp-Source: APXvYqwTi93jsKLq6ezoWfDiEySz/DRul9jQS1ckV4dzXmuJqXG9uqrYSHLF9TQ0JzW7Rk3PktuEqQ==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr10760836wrv.89.1560349820321;
        Wed, 12 Jun 2019 07:30:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id x6sm23506761wru.0.2019.06.12.07.30.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:30:19 -0700 (PDT)
Subject: Re: [PATCH V5 6/7] i2c: tegra: fix PIO rx/tx residual transfer check
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42ce2523-dab9-0cdf-e8ff-42631dd161b7@gmail.com>
Date:   Wed, 12 Jun 2019 17:30:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560250274-18499-6-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.06.2019 13:51, Bitan Biswas пишет:
> Fix expression for residual bytes(less than word) transfer
> in I2C PIO mode RX/TX.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---

[snip]

>  		/*
> -		 * Update state before writing to FIFO.  If this casues us
> +		 * Update state before writing to FIFO.  If this causes us
>  		 * to finish writing all bytes (AKA buf_remaining goes to 0) we
>  		 * have a potential for an interrupt (PACKET_XFER_COMPLETE is
> -		 * not maskable).  We need to make sure that the isr sees
> -		 * buf_remaining as 0 and doesn't call us back re-entrantly.
> +		 * not maskable).
>  		 */
>  		buf_remaining -= words_to_transfer * BYTES_PER_FIFO_WORD;

Looks like the comment could be removed altogether because it doesn't
make sense since interrupt handler is under xfer_lock which is kept
locked during of tegra_i2c_xfer_msg().

Moreover the comment says that "PACKET_XFER_COMPLETE is not maskable",
but then what I2C_INT_PACKET_XFER_COMPLETE masking does?
