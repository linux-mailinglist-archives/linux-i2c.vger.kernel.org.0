Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753463A314D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jun 2021 18:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFJQtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Jun 2021 12:49:17 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:40541 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhFJQtI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Jun 2021 12:49:08 -0400
Received: by mail-oo1-f52.google.com with SMTP id j17-20020a0568200231b029024900620310so37501oob.7;
        Thu, 10 Jun 2021 09:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ubLQ+O50XgkD8kDtM8dzYJ4xypd9X1QKHEX8Kl94HM=;
        b=rZIJsBarjp4b3mZk6qLeteoTk8jbjOnEak0ikgsuvDWIG09TU/rQ8zdIGVxQPjtXof
         bKKkTTjV904dJBNPZhXeB3tg3O7Jtg4tT9/KfRZofVJSzRw7DCod459D2Ci53dtsqk53
         iCIotbpVQQOP02x4lbROTNMv5q9eYMgYtj30gWHFur+a3Y9GbW9OuRyMO2ure9WfuVTk
         tQQeYIxZS1oIpimf7YusTuZftetoc3GWjYUrAmGuxi8ZHQm1lMMXKMNrQWuYIhl1I6y2
         yYn1rALQC7/ySpCJliE+K3PqsrYvoNfBdaz1E8EU9dtm3fOWKI+wS4aFQbXOCWodH0i4
         rsmQ==
X-Gm-Message-State: AOAM5311vMVhB1fhLelAxb84i4ezE2pq1d0Uz5fDkrB3cnzE5o6MuHBC
        I76hip7VKL2e0/CvR4xnUQ==
X-Google-Smtp-Source: ABdhPJzxSFuHoIzFy98YSEdLyG+PwlYC3ijHdZ/99LwLKJKM5Op6VYOn58+LDzA1pg8ehbA127p5ww==
X-Received: by 2002:a4a:4c8f:: with SMTP id a137mr3039036oob.65.1623343631396;
        Thu, 10 Jun 2021 09:47:11 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id o20sm687010otl.2.2021.06.10.09.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:47:10 -0700 (PDT)
Received: (nullmailer pid 1948111 invoked by uid 1000);
        Thu, 10 Jun 2021 16:47:06 -0000
Date:   Thu, 10 Jun 2021 11:47:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, chin-ting_kuo@aspeedtech.com,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        steven_lee@aspeedtech.com,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>, troy_lee@aspeedtech.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>, ryan_chen@aspeedtech.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 1/1] dt-bindings: aspeed-i2c: Convert txt to yaml
 format
Message-ID: <20210610164706.GA1948040@robh.at.kernel.org>
References: <20210603024839.27976-1-jamin_lin@aspeedtech.com>
 <20210603024839.27976-2-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603024839.27976-2-jamin_lin@aspeedtech.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 03 Jun 2021 10:48:19 +0800, Jamin Lin wrote:
> Convert aspeed i2c to yaml.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 75 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ------------
>  2 files changed, 75 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 

Applied, thanks!
