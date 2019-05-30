Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3F412FAFF
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 13:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfE3Lgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 07:36:43 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41109 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfE3Lgm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 07:36:42 -0400
Received: by mail-lf1-f66.google.com with SMTP id 136so4750029lfa.8;
        Thu, 30 May 2019 04:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oEF/ywkpwzyXdp32mRceU7ioagbppOL/tUNLr/bCKp8=;
        b=QEU1+NezxGHtIr28TVARywmZg9hUS3PGpriHim+cVtRwL/W2XtNppYGgfYoMHF72zJ
         h3LOJqrQMP770oWHxrfVYn2RmwqNe/N6stwVIf58U3m1Lu7S1SBIcBdhZlPE6faZbKXZ
         LwEBeHn/nMpfA/3cuPklxecot2loPcfSMJlXSSj/kE73Jc+i3uJhA7+2jLXKd5zrm3YM
         ckUeT9huzoAnDSyUyT2RrJhnUUWNk29CbhwE7XuWWuD/fvU+90gtmY6O8GWOfw9eOFTh
         0M9a7Hv97z4xfD8NrjYx4cu3W1YQTLCTOYmYM/Cid8bPv/Oetxscp4mxx4Y9kqv/Kgm8
         lEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oEF/ywkpwzyXdp32mRceU7ioagbppOL/tUNLr/bCKp8=;
        b=W4qy+RAQn8iwgwzNSsr5kpKuZPzS5RAIrrMoSAQgQ2SKOnVt0Co9AiYw1XpH1ds4Cc
         YuUNelpKvdlmJiFcaF9/cHG7camBRpPzoMQ+Zu22SQw45QWu8tMOQ1PNkVsKRKbXltzD
         oFl+FrIn0UvLfuRH9r+zHYVwGeKwmj8PtNGRRSlmzSxAcCuL9XC/R4KM6I28qOjFyPq3
         SWjhIxtpYSsG7OIUq+5qjCtrFiGX7cc1vGFeoEuOUzklYvkSWQLHhFZYYqAf3t9MoMMd
         QdUa7qkkJ3lsKLeHc4xP5gAFH9Aig0o81NTRr1glOpCDLqosGbC86XTLFGG6tgIYAwHM
         tkfA==
X-Gm-Message-State: APjAAAXGtMQdqXNKc4uQ5ToAYjEqL5/ijhnRmKGKN3zTESC0U5WRAdvb
        53UMvCOzmFGkZOgCVjp28QzNRKUj
X-Google-Smtp-Source: APXvYqxVnboaMVCWDp5xI2htvEZX2PPYC8bvapApOlk4UlewjeaslCV/Rmb5lhl1/WrzSjVrW3pprQ==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1850010lfh.119.1559216200941;
        Thu, 30 May 2019 04:36:40 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id l25sm444919lfk.57.2019.05.30.04.36.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 04:36:40 -0700 (PDT)
Subject: Re: [PATCH V2] drivers: i2c: tegra: fix checkpatch defects
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e9e3d8b0-a76a-81a9-1110-2d07ba1c787f@gmail.com>
Date:   Thu, 30 May 2019 14:36:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559196850-7007-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.05.2019 9:14, Bitan Biswas пишет:
> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
> except for BUG/BUG_ON checks

Please turn the BUG_ON's into WARN_ON's. The machine won't go on fire,
hence there is absolutely no good reason in making system unusable on a
software bug. BUG_ON may be more useful for development, but not for a
casual daily usage.

> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---

> @@ -1034,7 +1038,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	u32 *buffer = NULL;
>  	int err = 0;
>  	bool dma;
> -	u16 xfer_time = 100;
> +	u16 xfer_tm = 100;

What's wrong with the "time"? I'm finding the "xfer_tm" as a very
unintuitive naming.

-- 
Dmitry
