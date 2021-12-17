Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBE447973F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 23:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhLQWgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 17:36:50 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:36441 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhLQWgu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 17:36:50 -0500
Received: by mail-ot1-f44.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so4652293otl.3;
        Fri, 17 Dec 2021 14:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x0GNlsg6T0pkZOGC90LJCmrqjNSybHFgJWL7OCTvoy0=;
        b=rlB8+ZBdzrJ9XxfFvLPa96hTrxcuF3ZxbIMHoFSb3TRywWhnT/lbd2vRe6Hb5Qq0a7
         3A7FUXD2ftaLl1ngijD3MA7THmYgmIk5FhkqvD8Otk7SIj4lCXuqgXpqrn7H0q4bdTCO
         Diulx+WCzoEjP4QpVovx1tDYJ43ZqjlLuHDaOeQD7zW2mbE+PQInVGJv3AjMwoGp86UK
         FoWcNIaVTOYa1KrrqRXqlOw9erL0NVIg6c/t79LXeFh/Y3xRa785UjRQHrfl7TyYfYAn
         NJtcOMiBKCBFQ2dIc7HOQY6ubK8R9OjMqS8qMpNneTtMgtkMOGN7K7aUCEL4UXkyQ+GZ
         XtcA==
X-Gm-Message-State: AOAM532coc80HpvCDvzedmqRZ8N94ev31+YryclhpaGjUBYR27tVyL60
        5Az2Aku3QWE65Y7aGuAlEg==
X-Google-Smtp-Source: ABdhPJwYN9ZlYkJ5qZKVuAuQurdZ33Nklh8k7j6P/XkV4MT1YonY3wE/vJAr7Dr8fyNK6fgXiu2pAw==
X-Received: by 2002:a05:6830:2681:: with SMTP id l1mr3666877otu.378.1639780609704;
        Fri, 17 Dec 2021 14:36:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z12sm1816195oor.45.2021.12.17.14.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 14:36:49 -0800 (PST)
Received: (nullmailer pid 3708784 invoked by uid 1000);
        Fri, 17 Dec 2021 22:36:48 -0000
Date:   Fri, 17 Dec 2021 16:36:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter Rosin <peda@axentia.se>, devicetree@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH 4/4] dt-bindings: i2c: i2c-mux-gpio: Convert to
 json-schema
Message-ID: <Yb0RABwvuSr56coI@robh.at.kernel.org>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
 <20211217165658.2650677-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217165658.2650677-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 17:56:58 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the GPIO-based I2C mux bindings from the free-form text format
> to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/i2c-mux-gpio.txt  |  80 --------------
>  .../devicetree/bindings/i2c/i2c-mux-gpio.yaml | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
> 

Applied, thanks!
