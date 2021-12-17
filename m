Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CC7479726
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 23:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhLQW31 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 17:29:27 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35564 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhLQW30 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 17:29:26 -0500
Received: by mail-oi1-f177.google.com with SMTP id m6so5729923oim.2;
        Fri, 17 Dec 2021 14:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ceA6uFPrxoxuPoqQlCvVhkmHGQ1jymNTT0ALfCVWMx0=;
        b=kmvDxkFWyvd3fKMj1/SOgGFswQkmFl18O/E9PQrJEMcULJpYKy9fnmz7dS2obCu+Og
         sLdIoxBtYMAcmAY1VDzPBJ0nQxEEq6sGIhpKL/iMdTIcl0icQdH1mthi4c02Lx3bc3kq
         677Welo+SoCO23FePLdcsv6l9kfRtAluhgs+n60/u6kivFNtq4ixh8dDRrtzJJbgdPN+
         bN5yIk2/HmyzDVEA9VENf/0t/689q5Wp12m1ybN2MXV16r/194H+5gWpabT9WhRYVhw4
         BPJkTBE/zJqjSJqrMun5QwzBT4EvU2nwHb+dVUncpnUVRaZkQP5ehWyAP+VlFlBWuDa9
         9xAA==
X-Gm-Message-State: AOAM5334F1PjAU/mpahcVeYzjxNR2yji74tt5DcGYrve1RbLduz4mvYO
        SgJNsbxDmab0YBqkUOQf6w==
X-Google-Smtp-Source: ABdhPJyMY+V79ohByfMUfq1Nt1y6axnKEY0TTdPBUJ5AEZ3X2yrpLHCKyrBkQ9z2wmUCusqOeDwpog==
X-Received: by 2002:a05:6808:1285:: with SMTP id a5mr3751571oiw.104.1639780166081;
        Fri, 17 Dec 2021 14:29:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h14sm1859512ots.22.2021.12.17.14.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 14:29:25 -0800 (PST)
Received: (nullmailer pid 3695500 invoked by uid 1000);
        Fri, 17 Dec 2021 22:29:24 -0000
Date:   Fri, 17 Dec 2021 16:29:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: tegra: Convert to json-schema
Message-ID: <Yb0PRLJXM6tKTFMB@robh.at.kernel.org>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217165658.2650677-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 17:56:55 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra I2C controller bindings from plain text to json-schema
> format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - include i2c-controller.yaml and use unevaluatedProperties: false
> 
>  .../bindings/i2c/nvidia,tegra20-i2c.txt       |  87 --------
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 192 ++++++++++++++++++
>  2 files changed, 192 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> 

Applied, thanks!
