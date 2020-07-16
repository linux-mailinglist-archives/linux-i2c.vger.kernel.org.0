Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCD3222CC2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 22:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgGPU0k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 16:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgGPU0j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 16:26:39 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD14C061755;
        Thu, 16 Jul 2020 13:26:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id i80so4611007lfi.13;
        Thu, 16 Jul 2020 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U6MZ/y/vPc6q78+jPG12T4yfylcbWZbgihagmhF1ua4=;
        b=gA+yRPgZzqn5fKMZMo/S2JVYKAXcoeW74ALQSddU1jHtrEIMlxogLceEj9SrllM02k
         qIJF7psdB+PldiFOps2dounuPdIP3iZCfBnn4kHrXskxGjB5AX3m+pDtXY1Zgss4L55z
         HOAQk0tLv5VpfW21i9I3XHIAJ5kAFd9htOacywsaOMVi4B0ft9D046r7zS6tyNChxIIy
         uvMz3O0b0KA08lIpsEFNgEczmuhH3MZ+cuAHI4m9BoCA98hQNJmh5q1HRrTjL45w190z
         WLFQ3rnFyAPSfRKjD/ylru4OASJPfVKvI1lLCRfwC8Nnm2x+bXPYa28IGKH1hzvKMEEW
         WV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U6MZ/y/vPc6q78+jPG12T4yfylcbWZbgihagmhF1ua4=;
        b=qx0ER/5l5i2fmQTkQLUolKKeDYlk07k2krfOiQZTtki3nffWobK1Ganr+fueBGBUWU
         ftJ6qXCZVsRmRIBmlRh1X8vqHJInBv2Azw9YaBns7nVgG9effSaOh4269KsSoFFROPeF
         TiCmVZYWP5aHwRFVzcbHcbo1FtR0VcnlEjh1Vb8HGuPXfTIxwwXo7SWBXTp9r0ytN5VC
         W7AIFcDPxp3EsgrK6AucXQEgb0Vz89hXpziKGu7+NddVU4bqTMSAVJxap4OdyiLiF1VS
         6aEsYgQmZJs1ODHukVvLOK3SeNlnwQgk9iXZIdgqctqNcvzGd1OjK5J6xwUZ8XONZS6e
         g0Dg==
X-Gm-Message-State: AOAM533gsqOwvpJJRiV3EAMxh55NoZAyygWRtTD95Fy63DDpcDF/LuGM
        Tc3BzgDllQmNjDgN55d/ZSaZLh7t
X-Google-Smtp-Source: ABdhPJy0enoMVs6BkDVaIJm0D5Yr9QDNFNLLIvHjUmf9593o8LzOQ4n67cUT0e7FYJseihDzuMNs1A==
X-Received: by 2002:a19:814c:: with SMTP id c73mr2266198lfd.16.1594931196681;
        Thu, 16 Jul 2020 13:26:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id w4sm1253214ljw.16.2020.07.16.13.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 13:26:35 -0700 (PDT)
Subject: Re: [RFC PATCH v3 14/18] gpu: host1x: mipi: Update
 tegra_mipi_request() to be node based
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-15-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5542c166-5a60-a8c3-281b-5560b7c2dfc6@gmail.com>
Date:   Thu, 16 Jul 2020 23:26:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594786855-26506-15-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.07.2020 07:20, Sowjanya Komatineni пишет:
> Tegra CSI driver need a separate MIPI device for each channel as
> calibration of corresponding MIPI pads for each channel should
> happen independently.
> 
> So, this patch updates tegra_mipi_request() API to add a device_node
> pointer argument to allow creating mipi device for specific device
> node rather than a device.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

