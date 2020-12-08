Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260162D3547
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 22:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgLHVcB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 16:32:01 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33591 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgLHVcB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Dec 2020 16:32:01 -0500
Received: by mail-oi1-f194.google.com with SMTP id d27so143932oic.0;
        Tue, 08 Dec 2020 13:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u03Topls0zW/uVZgC37K+AcGmsOpUHVuGbi5r//ml4o=;
        b=CWDGK+Nt8R4KQaSGqw7WiYvei7xXxSpGaGo1gzMUfZGA77Acn0GhOF7kDXtIswsG/2
         zHzvp4QUIVfWwa5/WRql5Kx7F47uaIK+L/gVQmZvHMcQWjgnXNJpcfX4s9YP4hVA4qm7
         z5jEZHTvGSdCpiINlkAaO0fw0s0bAN/z6oOGBbFvXkJaD4jajuMywu8YyL7BloULlZbu
         ktYIXcY4gD5X7+bGOdWQnOb0o5HjArl7NQO3bs9ftRYwIC9ybWCXqU2NT3IxI/YiinZE
         lsrjCAUV/JxXZhe3EGGgVRdkzLZpwBf6s4L7YKvRaUmrZORDQB9RqOT6GHaAPt8BiwYv
         w1oA==
X-Gm-Message-State: AOAM531wndNXS1yIp06kSRcQ79bl6PRBeK15wXAnCNIpHZnFj4lrdEvq
        jNBkgIePDXHOAiLkpUjINH5B0yFlMg==
X-Google-Smtp-Source: ABdhPJz/997NimFkJCTieLclIT3u8rANzktbGG42mN/Bq1vuucHVPziqlah56gDwwtn5OaKB6U+5ag==
X-Received: by 2002:aca:1b1a:: with SMTP id b26mr1493339oib.43.1607463074367;
        Tue, 08 Dec 2020 13:31:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t3sm44228oon.14.2020.12.08.13.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 13:31:12 -0800 (PST)
Received: (nullmailer pid 3129959 invoked by uid 1000);
        Tue, 08 Dec 2020 21:31:11 -0000
Date:   Tue, 8 Dec 2020 15:31:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings:i2c:i2c-gate: txt to yaml conversion
Message-ID: <20201208213111.GA3126927@robh.at.kernel.org>
References: <20201128173343.390165-1-jic23@kernel.org>
 <20201128173343.390165-2-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128173343.390165-2-jic23@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 28 Nov 2020 17:33:41 +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> This file provides very little in the way of actual schema but
> does provide a convenient intro to what an i2c-gate node actually
> represents.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Link: https://lore.kernel.org/r/20201031181801.742585-2-jic23@kernel.org
> ---
>  .../devicetree/bindings/i2c/i2c-gate.txt      | 41 -------------------
>  .../devicetree/bindings/i2c/i2c-gate.yaml     | 39 ++++++++++++++++++
>  2 files changed, 39 insertions(+), 41 deletions(-)
> 

Applied, thanks!
