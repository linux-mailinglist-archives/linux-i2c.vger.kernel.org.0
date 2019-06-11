Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D77741866
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 00:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388277AbfFKWt5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 18:49:57 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:39125 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391232AbfFKWt5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 18:49:57 -0400
Received: by mail-it1-f193.google.com with SMTP id j204so7520877ite.4;
        Tue, 11 Jun 2019 15:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/NnSGwbKcnY/7Q2s2Gevcsyo7XJDO9FOrJ4WUpJ1HFQ=;
        b=mcwZkzaRMfcEx2kgdVXpQ0JOQ5S0bVaheiZLxCDxn9EIVkpp9l2w4SfjoLGqI3jLUv
         D0YALaodQo3722PNenkTuC6ZLD0RiaLdlEEDGXTQbRnc5GeG5RgYBobpecL2AAf17RUC
         I6BoMElENdwIsN+y+JhI7vJSZ+ZaDFUFjwAx5A/ZEG7+RVTjnCT48kYoZCxTghC33uip
         rwi3fKwsTta/61hJNB2pD7iIske72X1Qy+gpVRzkYiXy0YRqREMduv8s+XkGXri1iG+r
         y3dZeRc9aKD/FHTL0RNuREWP1YqKe+N9VbN2dauHbOTN5qBoMYpbtVath7qEbWl6s5DF
         kPHg==
X-Gm-Message-State: APjAAAXPJ2TP7uYkWmKet8neyIU/iqlJqkFXREKx0cncP9haXQ3m9Sy2
        ZnIR4qUWC8EuPc0M72fDPjaLSmY=
X-Google-Smtp-Source: APXvYqwdY0VqgKIy7eeWPn3ZJv3AdjkyxMqbBpgjo8QSwtv2zrOmnzCLT/FHfPAZdx/fsmc5KbbIEQ==
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr17897923jan.90.1560293396229;
        Tue, 11 Jun 2019 15:49:56 -0700 (PDT)
Received: from localhost (ip-174-149-252-64.englco.spcsdns.net. [174.149.252.64])
        by smtp.gmail.com with ESMTPSA id o145sm572109itc.24.2019.06.11.15.49.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 15:49:55 -0700 (PDT)
Date:   Tue, 11 Jun 2019 16:49:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH REPOST v8 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190611224952.GA17031@bogus>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
 <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat,  1 Jun 2019 11:41:13 +0530, Sagar Shrikant Kadam wrote:
> Reformatted compatibility strings to one valid combination on
> each line.
> Add FU540-C000 specific device tree bindings to already available
> i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt under optional
> property list as this can be optional.
> 
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
> 
> The DT compatibility string for this IP is present in HDL and available at.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
