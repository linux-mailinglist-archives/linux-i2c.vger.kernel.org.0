Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A782AC7A7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Nov 2020 22:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgKIVvS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Nov 2020 16:51:18 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38020 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgKIVvR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Nov 2020 16:51:17 -0500
Received: by mail-oi1-f194.google.com with SMTP id o25so11057255oie.5;
        Mon, 09 Nov 2020 13:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jfGSgKUW5NtsDoqmntMhsIuUleipXjbjBsSezodmqDs=;
        b=fCCjfP1KZCIzUFriZV+PkcAzdGJ1c7QzMkQ0Vc47xvR+cvntIPcdv2hqN2KWCQ/hwM
         n3ak5H+IXDKI1b7n0naHlvz81iHpOGX0gOgdNE6MjmVg5B17yLR5rv2ffbj7UzDveYf0
         CHLOHYGBEXLKMN0CKJ6s11pZu8I9DommVnaNX3D0juitbJnkU8zdwYOH5jAEhIHKXeLC
         dM1XmwWYzu/lUJhD4npPN+dsIQMkOI/Wm+FgtXWNPfRW94BgPhquIJ9mfefC9Jd1aFpU
         46baHzvXYegq1uJjfgQ0+Fv13yWLpcBeoPoJFA6or3Ytv/trbjyfHTF1VulitEQeQNH3
         ExzQ==
X-Gm-Message-State: AOAM532truRo7nFeiBw2Bq4FGH7acANPsgEyG/h9+jvW26+PRbQu+dK0
        WCSUMf3J/C3PYnyoA6BsqQ==
X-Google-Smtp-Source: ABdhPJxtzfhygbo7otf33oRFgckbr6OSkVEG/MASlgpIER7zYW9w1ZRHpZKErzaBW6ZB8Jb3ellOFQ==
X-Received: by 2002:aca:ddc2:: with SMTP id u185mr823414oig.81.1604958677207;
        Mon, 09 Nov 2020 13:51:17 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v5sm2822539otb.44.2020.11.09.13.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:51:16 -0800 (PST)
Received: (nullmailer pid 1818934 invoked by uid 1000);
        Mon, 09 Nov 2020 21:51:15 -0000
Date:   Mon, 9 Nov 2020 15:51:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     wsa+renesas@sang-engineering.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v3 6/6] dt-bindings: i2c: mellanox,i2c-mlxbf:
 convert txt to YAML schema
Message-ID: <20201109215115.GA1818880@bogus>
References: <cover.1604681934.git.kblaiech@nvidia.com>
 <3892893f87791fbf0e5e0d890fcbec7ba43106ef.1604681934.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3892893f87791fbf0e5e0d890fcbec7ba43106ef.1604681934.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 06 Nov 2020 12:06:30 -0500, Khalil Blaiech wrote:
> Write the devicetree binding text file associated with
> the Mellanox BlueField I2C controller in schema file,
> JSON compatible subset of YAML. Besides, add an entry
> within MAINTAINERS file.
> 
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ------------
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml           | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 79 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
