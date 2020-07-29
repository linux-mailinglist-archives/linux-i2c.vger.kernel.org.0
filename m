Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDFF23280C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jul 2020 01:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgG2XZ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jul 2020 19:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgG2XZ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jul 2020 19:25:59 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C200CC061794;
        Wed, 29 Jul 2020 16:25:58 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k13so13986610lfo.0;
        Wed, 29 Jul 2020 16:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NCa+6+FpulnqctzU8RoW4eAJcOOgsGCS7xmaanI8k+U=;
        b=MLw9Yjpk5gOX5QxhRfNeA+9SDbpCJxENmouOcbiiLJv79EO4oLesW9CKC1+FBZhR0v
         FP0ljRnhKGVDXozyGFn8FdFxNU42wfoRzgxkoUHQisdctU5hMeQZsnE6A+oYQHQT5aqz
         lkW4Hym5BtxdmeaxrN/zjiLZYTCDGdeKGTfQxueE2jYnBOsVqQpmVVNoJ5llubnL88y+
         cvXeVtmGLFU2zPOw04EwUSiRdwIiFWjwmFTRSmJHTC4UJ4PNgORnGPBLD+6JA7mbl16l
         lGgK/rqwkz/8YDH7fkm4TP9HBmlRilyTQzQs6rIcYfEBV1uc0Kw9bQax8ls6btFFP7cq
         WCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NCa+6+FpulnqctzU8RoW4eAJcOOgsGCS7xmaanI8k+U=;
        b=GJTTEDGL76LC+X0mn/oYiW7JzH5HFyxw9lBAsAvkEEziXEiVgWen8jmup8hESoi6QU
         oTHKSdON8zJ+Lwgi+8T+dJR2X8DfsGIrgPx1bDu+y7tn32xi8yOAC/0mVgl6NTxgRDYj
         elkUMmy1a2TgIsTaj6jEXVtbUN/HhB5piIpoRUxoLxj+Cz2136JY6xOf/tVuqWCQvhKt
         lkfZGNZGkmYdw4ok4whgDf2rRN+b0tWfBrWQNL0ZSL0PPUrEGy+/0tkPcQtmC2oRhr0i
         vdwEYtDizSe9bxOTCqlNrfdeiAETNBbz7qAAD6Qj9RGcmY9l9SJ0UQOSd/0LbnUVG+iP
         9z5A==
X-Gm-Message-State: AOAM530xr8OsjMSq8UFoaTapaBd+V4AZ+Hx+i9IYCLvAwNZqhzGjyWLW
        z8uUBxoKc86W2datiVUhd/TYzlI6
X-Google-Smtp-Source: ABdhPJziJ+s1t3LvOqj08h4deyFSCu7mAhp88bfPJj5sw3l6yR7zwiq83ewDPJZHfQ5/eocS9hQmdg==
X-Received: by 2002:a19:830a:: with SMTP id f10mr165618lfd.28.1596065157014;
        Wed, 29 Jul 2020 16:25:57 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id v23sm768693lfa.5.2020.07.29.16.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 16:25:56 -0700 (PDT)
Subject: Re: [RFC PATCH v5 13/14] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-14-git-send-email-skomatineni@nvidia.com>
 <c3d40261-9d77-3634-3e04-f20efad9d3d8@gmail.com>
 <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2ec535c9-55e8-8834-6002-36c75aeb097c@gmail.com>
Date:   Thu, 30 Jul 2020 02:25:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01ee0805-3d57-d857-48e3-5c2245cd4500@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

28.07.2020 18:59, Sowjanya Komatineni пишет:
...
>>> +        ret = tegra_mipi_finish_calibration(csi_chan->mipi);
>>> +        if (ret < 0)
>>> +            dev_err(csi_chan->csi->dev,
>>> +                "MIPI calibration failed: %d\n", ret);
>> Doesn't v4l2_subdev_call(OFF) need to be invoked here on error?
> 
> Not required as on error streaming fails and runtime PM will turn off
> power anyway.

I see that camera drivers bump theirs RPM on s_stream=1, and thus,
s_stream=0 should be invoked in order to balance the RPM. What am I missing?

https://elixir.bootlin.com/linux/v5.8-rc4/source/drivers/media/i2c/ov2740.c#L634

> Also we only did csi subdev s_stream on and during sensor subdev
> s_stream on fail, actual stream dont happen and on tegra side frame
> capture by HW happens only when kthreads run.
Secondly, perhaps a failed calibration isn't a very critical error?
Hence just printing a warning message should be enough.

Could you please make a patch that factors all ON/OFF code paths into a
separate functions? It's a bit difficult to follow the combined code,
especially partial changes in the patches. Thanks in advance!
