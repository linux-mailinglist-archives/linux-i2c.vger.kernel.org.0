Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4150F3CA25
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 13:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389710AbfFKLia (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 07:38:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55262 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389649AbfFKLia (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 07:38:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id g135so2565690wme.4;
        Tue, 11 Jun 2019 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dFhw9Yzk7crkLa1zIM8G/hSEMNLmlVpm6QeraFAZi18=;
        b=ThV4dkzZewzQjl2cU8wXTNnMo3cTTjOTeI94/XWcPyOWOSesuRadJpZbgCWNl6T25e
         Oaiog6lCtikg6EoxZAYRCl1lhUrTj8Jsn3onA5NnWHmL2n22z5VPi+jk8KxmubukTc/F
         5cnGa1TLdy4HkJ0cl2ch4YhC3KnwpEE/sWPw/Ee97YRp3Y74sPcgJBPPbR4cme34Pf1n
         XVGz8sYh/s5jEBee/6njtaGY93bYcZcp5tdXaLTN+jJ/1+hqcjrRvSOiB7F2upt6yWMA
         Vv8h8ejNzj3dlFbDaCwyHB98upmLkAYUDpcSfS9IdLExeuAHGhbMqJxUZjJmMpHLZ2UG
         CCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dFhw9Yzk7crkLa1zIM8G/hSEMNLmlVpm6QeraFAZi18=;
        b=k8NiYVsDQDSryPtMLow9K6RQKjOtV4rZGr6cCOLReq/RTw/1fMyUTPKEDe1ZJVZlqz
         GXsSHc8Cki8xRpGcU39LyGJCneEr/3dVHBVuUf44rtec89fPpKJh5XEyxu/PtcvoPOU9
         55CpV44m6QdIsOn1JRfItiwYYN5Q8eQnLcwk0ofOkkiNREiLc2M11J+x9hG6+o36g+Mx
         WT8MnLWSwWwKaUBvpgwFxZzciZTm37JOGfNQGjLw9EvYUl5DtoL1l9Dzw8UAx1lAI3J8
         nESUT8MHKBQ7p8qfCGDPcQ8xCz2/yTNPUSnl3kAWv1ZSTIlfEnUkciRBLUGRmYoVf2DT
         nvhA==
X-Gm-Message-State: APjAAAXBSP5+0ekQWXUj4bZO4Upwa9yc8vkKRac4bXb/DOt28GU1mSq6
        TFHd2+AcjF4z0vbRTA9yrhQXuOs+
X-Google-Smtp-Source: APXvYqxrkozBv92s4+oeR1xFC9mhkvcY3me5bcK1gJVfy3VuWjnE+NcpPCCdXB/ihNBs0jPynsr+iA==
X-Received: by 2002:a1c:7e08:: with SMTP id z8mr16475328wmc.36.1560253108218;
        Tue, 11 Jun 2019 04:38:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id z14sm23916198wre.96.2019.06.11.04.38.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 04:38:27 -0700 (PDT)
Subject: Re: [PATCH V5 7/7] i2c: tegra: remove BUG, BUG_ON
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
 <1560250274-18499-7-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <745086cc-9470-a1af-7339-fbca35525479@gmail.com>
Date:   Tue, 11 Jun 2019 14:38:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560250274-18499-7-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

11.06.2019 13:51, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Remove BUG() and make Rx and Tx case handling
> similar. Add WARN_ON_ONCE check for non-zero rx_fifo_avail
> in tegra_i2c_empty_rx_fifo() and return new error
> I2C_ERR_UNEXPECTED_STATUS.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---

Please see my answer to v4.

