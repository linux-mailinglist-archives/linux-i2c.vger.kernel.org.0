Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F8D2244F8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 22:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgGQUO5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 16:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgGQUO4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 16:14:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AF6C0619D2;
        Fri, 17 Jul 2020 13:14:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q4so14119405lji.2;
        Fri, 17 Jul 2020 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FkWVr5zp5BC/cYtB354fZGgMcjVM5l8oIeKEC5H54O8=;
        b=I8YXBM35hH1s2nXJoK1+VOFw/G3kED5UoxeMOVdBSMzbYvRoB7xrjgniZ743y/0DQ+
         gRmPH5NJeSL11Wtixy7LpjSo0ZIrciCdcHCzFQrIoRZ+Ar5hi3sm/MsQlDnZkbuhBS5J
         /fTcm3QddMcLA2PDJd2Xl96Ss6abAZ6xl1YmTE/v6mBZxGjFRk+ZIQAhRXw/Zr6pxnjD
         vI6tKr2Buo6KCetCoHP2tAgP5ygefnrUcWxU/pOyBNQ1Jx5v82xD5v0jYRumxJY3ZHns
         YWpf/QLIJvo7XbebIb16XWOyF8ndcZqbVyoTId5pXJJJx9RQPTQGEZFcoOinCc+/h9ux
         XHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FkWVr5zp5BC/cYtB354fZGgMcjVM5l8oIeKEC5H54O8=;
        b=rbIph5+wmsJW3Judoy462er/si7r0YskiNFaPjWoldC1nwgEbLxuYm3Rt3YUaaDLoo
         RcQrjQgW9Mn5H7CN6xi2PUqACCFVczNwG2V3eZRebrz9ajsSwYu+hB/9F2ce4IyzRt3G
         Gdhw4OeGRoDAs9zXymx+BFg7CcVdG60RK6dL81UTCxcsx5kDSLJSv8gA5oYQoFzxNEzV
         kT/8kTof94vjSEjEjhLFvJhCeCHQVHmc0Miypyy+Axm5DJ1GZ9YI9lKEaCQYR7J3JAq6
         GYqqpKd69J/xYnhlNzjt6O6rSLgaNIfv9UbtCstFl2PyodJkaCLP4hEa9rEUjqqGud+X
         ZmWg==
X-Gm-Message-State: AOAM531iq4S6YlPwocn6JhA5IIohzBVIGlevoXg5+CU9O40EtrYzlAJW
        T7EnS7nj2RfTzLB/PxedkbOsh9vJ
X-Google-Smtp-Source: ABdhPJyp3rS1I8TlETFWJxyFclpR+MDYEDvhNGj1hflmucIV1aJFhc+30qRGfh5li8IzI6Q2NqjREg==
X-Received: by 2002:a05:651c:1a7:: with SMTP id c7mr5485739ljn.345.1595016894667;
        Fri, 17 Jul 2020 13:14:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id r11sm1823788ljc.66.2020.07.17.13.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 13:14:53 -0700 (PDT)
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
 <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
 <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
 <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
 <66812127-38cf-2af3-51c0-50edbe446e73@nvidia.com>
 <9b4fbf9d-d651-aa35-c0a6-b8f16aeb0900@gmail.com>
 <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
 <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
 <080b30c7-1dce-dd2f-dd96-40f6e25da4d6@gmail.com>
 <b125deab-7900-6266-d405-4d7f029089b4@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea3d2bb0-bf35-dfdf-ed1f-7656a9558072@gmail.com>
Date:   Fri, 17 Jul 2020 23:14:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b125deab-7900-6266-d405-4d7f029089b4@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.07.2020 18:41, Sowjanya Komatineni пишет:
...
>> Also, what about the auto-calibration? Isn't it needed to be enabled for
>> CSI?
> STARTCAL does one time calibration and with AUTOCAL calibration will be
> triggered periodically.
> 
> For pads PULLUP/PULLDN/TERM impedance calibration, we only need one-time
> calibration on pads power up.
> 
> We always use one time pads calibration for CSI.

Alright, thank you for the clarification!
