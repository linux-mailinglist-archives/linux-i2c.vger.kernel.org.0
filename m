Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E17E479730
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 23:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhLQWaq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 17:30:46 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:40848 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhLQWaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 17:30:46 -0500
Received: by mail-ot1-f48.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so4617743otj.7;
        Fri, 17 Dec 2021 14:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rp0gxY5oPlY6Lp7e55CUyTDoR8oPJrljOtf3MrKB3k8=;
        b=TYSMTdcM2T/OnBf5T9OAPerHJtKPzMiCOjNBMD/C4JNzbXQ3cGt/YPZkGGYu2Pf+0i
         UapZ2OzUVst+BO0wA5Ullu2t8ZFIuJ0bo4sSGkYr4vaLgIWD6vJ14BCqiuYaXlq2I9sa
         CgEPPa0pjkeUchHlRAst+gaRAfJphSdXG7lFWbOWWvPLyOO3rkL9LhSg2NHC/jS1lJyu
         t0u/6jZCgZFT3ocoZmHkw6ogbRMKgzLj78AHfIXFDNR3tj2gdPfXuBjA3wCuJcJb50/Z
         MFosIcUoH4k29VRJlvO9HHg+dZEqCHO2/WoMbqRkP/r8/4rQtanu8YQY3heq4I7PnOUi
         5V4Q==
X-Gm-Message-State: AOAM532eLl0bU08rQTjJhfUWgOfrHsaJ60lsH+x3BkF6GB/c5tBTiveK
        KR3UjmcF43OsxM4MEwzvOg==
X-Google-Smtp-Source: ABdhPJwEYuWEDuhIQCvNgG+AQSl4eolA64KqHk0bV/buWohwh7AYWynDiISKh0oynjV6NSr94GStEA==
X-Received: by 2002:a9d:1c86:: with SMTP id l6mr3646485ota.241.1639780245649;
        Fri, 17 Dec 2021 14:30:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e21sm1840921ote.72.2021.12.17.14.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 14:30:44 -0800 (PST)
Received: (nullmailer pid 3697937 invoked by uid 1000);
        Fri, 17 Dec 2021 22:30:43 -0000
Date:   Fri, 17 Dec 2021 16:30:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joel Stanley <joel@jms.id.au>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: i2c: i2c-mux-pinctrl: Convert to
 json-schema
Message-ID: <Yb0Pk7hbS4/H4jqP@robh.at.kernel.org>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
 <20211217165658.2650677-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217165658.2650677-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 17 Dec 2021 17:56:56 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the pinctrl-based I2C mux bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/i2c/i2c-mux-pinctrl.txt          |  93 ----------------
>  .../bindings/i2c/i2c-mux-pinctrl.yaml         | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 93 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml
> 

Applied, thanks!
